using Barotrauma;
using Barotrauma.Plugins;
using Steamworks;

namespace VCE_ArmorSystem
{
    public sealed class ArmorPrefabFile : GenericPrefabFile<ArmorPrefab>
    {
        public ArmorPrefabFile(ContentPackage contentPackage, ContentPath path) : base(contentPackage, path) { }

        public override bool MatchesSingular(Identifier identifier) => identifier == "armorprefab";
        public override bool MatchesPlural(Identifier identifier) => identifier == "armorprefabs";
        public override PrefabCollection<ArmorPrefab> Prefabs => ArmorPrefab.Prefabs;
        public override ArmorPrefab CreatePrefab(ContentXElement element)
        {
            return new ArmorPrefab(element, this);
        }
    }

    public enum ArmorType
    {
        Custom,
        Metal,
        Composite,
        Ceramic,
        None
    }
    public class ArmorPrefab : Prefab
    {
        static IDebugConsole DebugConsole => VanillaComponentsExpanded.VCEPlugin.DebugConsole;

        public static PrefabCollection<ArmorPrefab> Prefabs = new();
        public string OriginalName { get; }
        public LocalizedString DisplayName { get; }
        public ContentXElement Element { get; }
        public bool IsOverride => Prefabs.IsOverride(this);

        public bool Disposed;

        public ArmorType ArmorType { get; }

        public float RicochetChance { get; }
        public int Level { get; }
        public int MaxHits { get; }

        public List<Affliction> AfterEffects { get; } = new();
        public Dictionary<Identifier, bool> TargetAfflictionIdentifiers { get; } = new();
        public Dictionary<LimbType, bool> ProtectionAreas { get; } = new();
        public float AfterEffectMultiplier { get; }
        public float CorrectionMultiplier { get; }
        public float Resistance {  get; }
        public bool PlateCarrier { get; }
        public bool MaskHelmet { get; }
        public int RicochetLevelOverride { get; }
        public bool ClampPen { get; }
        public int PlatePosition {  get; }

#if CLIENT
        public RoundSound RicochetSound { get; }
#endif

        public ArmorPrefab(ContentXElement element, ArmorPrefabFile file) : base(file, element.GetAttributeIdentifier("identifier", ""))
        {
            ArmorType  = element.GetAttributeEnum("type", ArmorType.None);
            RicochetChance = element.GetAttributeFloat("ricochetchance", 0.0f);
            Level = element.GetAttributeInt("level", 0);
            AfterEffectMultiplier = element.GetAttributeFloat("aftereffectmultiplier", 0.0f);
            Resistance = element.GetAttributeFloat("penresistance", 0.0f);
            MaxHits = element.GetAttributeInt("maxhits", 0);
            PlateCarrier = element.GetAttributeBool("isplatecarrier", false);
            MaskHelmet = element.GetAttributeBool("isHelmet", false);
            RicochetLevelOverride = element.GetAttributeInt("forcepenoverride", -1);
            ClampPen = element.GetAttributeBool("clamppen", false);
            PlatePosition = element.GetAttributeInt("plateposition", 0);
            foreach (var subElement in element.Elements())
            {
                switch (subElement.Name.ToString().ToLowerInvariant())
                {
                    case "corrections":
                        CorrectionMultiplier = subElement.GetAttributeFloat("ricochetchance", 0.0f);
                        foreach (var sub1 in subElement.Elements())
                        {
                            if (sub1.Name.ToString().ToLowerInvariant() != "affliction") { continue; }
                            AfflictionPrefab afflictionPrefab;
                            Identifier affid = sub1.GetAttributeIdentifier("identifier", "");
                            if (!AfflictionPrefab.Prefabs.TryGet(affid, out afflictionPrefab))
                            {
                                DebugConsole.AddWarning("Error in ArmorPrefab (" + Identifier + ") - Affliction prefab with the identifier \"" + affid + "\" not found.");
                                continue;
                            }
                            Affliction instance = afflictionPrefab.Instantiate(sub1.GetAttributeFloat(1.0f, "amount"));
                            instance.MultiplyByMaxVitality = sub1.GetAttributeBool(nameof(instance.MultiplyByMaxVitality), false);
                            AfterEffects.Add(instance);
                        }
                        continue;
                    case "targetidentifiers":
                        foreach (var sub1 in subElement.Elements())
                        {
                            if (sub1.Name.ToString().ToLowerInvariant() != "affliction") { continue; }
                            Identifier affid = sub1.GetAttributeIdentifier("identifier", "");
                            _ = TargetAfflictionIdentifiers.TryAdd(affid, true);
                        }
                        continue;
                    case "protectionareas":
                        foreach (var sub1 in subElement.Elements())
                        {
                            if (sub1.Name.ToString().ToLowerInvariant() != "Limb") { continue; }
                            var limbtype = sub1.GetAttributeEnum("type", LimbType.None);
                            _ = ProtectionAreas.TryAdd(limbtype, true);
                        }
                        continue;
                    case "customexpression":
                        DebugConsole.AddWarning("Error in ArmorPrefab (" + Identifier + ") - Custom caculation expression not implemented");
                        continue;
#if CLIENT
                    case "ricochetsound":
                        RicochetSound = RoundSound.Load(subElement);
                        continue;
#endif
                }
            }

        }

        public override void Dispose() { }
    }
}