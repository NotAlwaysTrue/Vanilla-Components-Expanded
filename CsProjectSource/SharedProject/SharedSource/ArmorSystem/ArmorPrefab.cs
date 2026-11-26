using Barotrauma.Plugins;

namespace VCE_ArmorSystem;

public sealed class ArmorPrefabFile : GenericPrefabFile<ArmorPrefab>
{
    public ArmorPrefabFile(ContentPackage contentPackage, ContentPath path)
        : base(contentPackage, path)
    {
    }

    public override bool MatchesSingular(Identifier identifier) => identifier == "armorprefab";

    public override bool MatchesPlural(Identifier identifier) => identifier == "armorprefabs";

    public override PrefabCollection<ArmorPrefab> Prefabs => ArmorPrefab.Prefabs;

    public override ArmorPrefab CreatePrefab(ContentXElement element) => new(element, this);
}

public enum ArmorType
{
    None,
    Metal,
    Composite,
    Ceramic,
    Custom
}

public sealed class ArmorPrefab : Prefab
{
    internal readonly record struct Correction(
        Identifier Affliction,
        float Amount,
        bool MultiplyByMaxVitality);

    public static readonly PrefabCollection<ArmorPrefab> Prefabs = new(
        onAdd: static (prefab, _) => prefab.OnRegistered(),
        onRemove: null,
        onSort: null,
        onAddOverrideFile: null,
        onRemoveOverrideFile: null);

    private static int registeredPrefabCount;
    private bool registered;

    internal static bool HasPrefabs => registeredPrefabCount > 0;
    internal readonly HashSet<Identifier> Targets = [];
    internal readonly HashSet<LimbType> ProtectionAreas = [];
    internal readonly List<Correction> Corrections = [];
    internal bool TargetsAny { get; }

    public ArmorType ArmorType { get; }
    public float RicochetChance { get; }
    public int Level { get; }
    public int MaxHits { get; }
    public float MaxCondition { get; }
    public bool IgnoreDamage { get; }
    public float CustomDamageDivisor { get; }
    public float AfterEffectMultiplier { get; }
    public float CorrectionMultiplier { get; private set; }
    public float Resistance { get; }
    public bool PlateCarrier { get; }
    public bool MaskHelmet { get; }
    public int RicochetLevelOverride { get; }
    public bool ClampPen { get; }
    public int PlatePosition { get; }
    public bool PlaySound { get; }
    public float SoundRange { get; }

#if CLIENT
    private readonly ContentXElement? ricochetSoundElement;
    private RoundSound? ricochetSound;

    internal void PlayRicochet(Vector2 position)
    {
        if (!PlaySound)
        {
            return;
        }

        if (ricochetSoundElement != null)
        {
            ricochetSound ??= RoundSound.Load(ricochetSoundElement);
            if (ricochetSound is { Sound.Disposed: false })
            {
                SoundPlayer.PlaySound(ricochetSound, position);
                return;
            }
        }

        SoundPlayer.PlaySound("Ricochet", position, range: SoundRange);
    }
#endif

    public ArmorPrefab(ContentXElement element, ArmorPrefabFile file)
        : base(file, element.GetAttributeIdentifier("identifier", Identifier.Empty))
    {
        ArmorType = element.GetAttributeEnum("type", ArmorType.None);
        RicochetChance = Math.Clamp(element.GetAttributeFloat("ricochetchance", 0f), 0f, 1f);
        Level = element.GetAttributeInt("level", 0);
        AfterEffectMultiplier = element.GetAttributeFloat("aftereffectmultiplier", 1f);
        Resistance = element.GetAttributeFloat("penresistance", 0f);
        MaxHits = element.GetAttributeInt("maxhits", 0);
        MaxCondition = element.GetAttributeFloat("maxcondition", 0f);
        IgnoreDamage = element.GetAttributeBool("ignoredamage", false);
        PlateCarrier = element.GetAttributeBool("isplatecarrier", false);
        MaskHelmet = element.GetAttributeBool("ishelmet", false);
        int forcePen = element.GetAttributeInt("forcepenoverride", 2);
        RicochetLevelOverride = forcePen == -1 ? 2 : forcePen;
        ClampPen = element.GetAttributeBool("clamppen", false);
        PlatePosition = element.GetAttributeInt("plateposition", -1);
        PlaySound = element.GetAttributeBool("playsound", true);
        SoundRange = element.GetAttributeFloat("soundrange", 1000f);
        CustomDamageDivisor = 100f;
        foreach (var child in element.Elements())
        {
            switch (child.Name.LocalName.ToLowerInvariant())
            {
                case "corrections":
                    if (!child.GetAttributeBool("enabled", true))
                    {
                        break;
                    }

                    CorrectionMultiplier = child.GetAttributeFloat("multiplier", 1f);
                    foreach (var affliction in child.Elements().Where(e => e.NameAsIdentifier() == "affliction"))
                    {
                        var id = affliction.GetAttributeIdentifier("identifier", Identifier.Empty);
                        if (id.IsEmpty)
                        {
                            continue;
                        }

                        Corrections.Add(new Correction(
                            id,
                            affliction.GetAttributeFloat("amount", 1f),
                            affliction.GetAttributeBool("multiplybymaxvitality", true)));
                    }

                    break;

                case "targetidentifiers":
                    foreach (var affliction in child.Elements().Where(e => e.NameAsIdentifier() == "affliction"))
                    {
                        var id = affliction.GetAttributeIdentifier("identifier", Identifier.Empty);
                        if (id == "any")
                        {
                            TargetsAny = true;
                        }
                        else if (!id.IsEmpty)
                        {
                            Targets.Add(id);
                        }
                    }

                    break;

                case "protectionareas":
                    foreach (var limb in child.Elements().Where(e => e.NameAsIdentifier() == "limb"))
                    {
                        var type = limb.GetAttributeEnum("type", LimbType.None);
                        if (type != LimbType.None)
                        {
                            ProtectionAreas.Add(type);
                        }
                    }

                    break;

                case "customexpression":
                    CustomDamageDivisor = child.GetAttributeFloat("divisor", 100f);
                    break;

                case "ricochetsound":
                    SoundRange = child.GetAttributeFloat("range", SoundRange);
#if CLIENT
                    var sound = new System.Xml.Linq.XElement(child.Element);
                    sound.SetAttributeValue(
                        "range",
                        SoundRange.ToString(System.Globalization.CultureInfo.InvariantCulture));
                    ricochetSoundElement = sound.FromPackage(child.ContentPackage);
#endif
                    break;
            }
        }
    }

    private void OnRegistered()
    {
        if (registered)
        {
            return;
        }

        registered = true;
        registeredPrefabCount++;
    }

    public override void Dispose()
    {
        // The collection also disposes failed loads, which never registered.
        if (!registered)
        {
            return;
        }

        registered = false;
        registeredPrefabCount--;
    }
}
