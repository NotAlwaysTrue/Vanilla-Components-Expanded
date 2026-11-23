using Barotrauma.Items.Components;
using System.Runtime.CompilerServices;
using System.Xml.Linq;

namespace VCE_VirtualizedMagazine
{
    /// <summary>
    /// Parsed form of one ammo type's &lt;Projectile&gt; XML.
    ///
    /// <see cref="VirtualizedProjectile"/> is a single component instance that is reused for every ammo type a magazine
    /// loads, so parsing the ammo XML in <c>UpdateAmmoData</c> ran <see cref="Attack"/> construction and
    /// <see cref="StatusEffect.Load(ContentXElement, string)"/> again on every round change (= every shot).
    /// This prefab parses the immutable data once per ammo type and returns the per-item state from a cache keyed by
    /// the owning item, so the hot path only copies values.
    ///
    /// The <see cref="Attack"/> instance cannot be shared between items: it keeps the item it was created for
    /// (<c>Attack.SourceItem</c>) and vanilla damage/penetration code reads that item's <see cref="RangedWeapon"/> /
    /// <see cref="Projectile.Launcher"/>. Status effects carry runtime state as well (timers, user, sounds), so both
    /// are created once per (ammo type, item) instead of once per shot.
    /// </summary>
    public sealed class ProjectilePrefab
    {
        private const string emptyProjectileXML =
            "<Projectile>" +
                "<Attack />" +
            "</Projectile>";
        private const string statusEffectOwnerSuffix = ", VirtualizedProjectile";

        private static readonly ContentXElement emptyElement = new(null, XElement.Parse(emptyProjectileXML));
        private static readonly ConditionalWeakTable<ContentXElement, ProjectilePrefab> cache = new();

        /// <summary>Prefab used when the ammo has no &lt;Projectile&gt; component (an empty &lt;Attack /&gt;).</summary>
        public static ProjectilePrefab Empty { get; } = new(emptyElement);

        /// <summary>
        /// Returns the prefab of a &lt;Projectile&gt; element. Keyed weakly by the element, so reloaded content
        /// (which builds new elements) never sees stale data.
        /// </summary>
        public static ProjectilePrefab Get(ContentXElement? element) =>
            element == null ? Empty : cache.GetValue(element, static e => new ProjectilePrefab(e));

        /// <summary>Resolves the prefab of an ammo item identifier (null or unknown ammo returns <see cref="Empty"/>).</summary>
        public static ProjectilePrefab Find(Identifier ammo) =>
            Get(ElementHelper.GetFirstComponentElementByID<Projectile>(ammo));

        public ContentXElement Element { get; }

        public int HitScanCount { get; }
        public int MaxTargetsToHit { get; }
        public float Spread { get; }
        public float LightTargetMassThreshold { get; }
        public bool StaticSpread { get; }
        public bool FriendlyFire { get; }
        public bool DamageDoors { get; }
        public bool DamageUser { get; }
        public bool GoThroughLightTargets { get; }

        private readonly ContentXElement? attackElement;
        private readonly ContentXElement[] statusEffectElements;
        private readonly ConditionalWeakTable<Item, ProjectileData> perItem = new();

        private ProjectilePrefab(ContentXElement element)
        {
            Element = element;

            var effects = new List<ContentXElement>();
            foreach (var subElement in element.Elements())
            {
                switch (subElement.Name.ToString().ToLowerInvariant())
                {
                    case "attack":
                        attackElement = subElement;
                        continue;
                    case "statuseffect":
                        effects.Add(subElement);
                        continue;
                }
            }
            statusEffectElements = effects.ToArray();

            HitScanCount = element.GetAttributeInt("hitscancount", 1);
            MaxTargetsToHit = element.GetAttributeInt("maxtargetstohit", 1);

            Spread = element.GetAttributeFloat("spread", 0f);
            StaticSpread = element.GetAttributeBool("staticspread", false);

            FriendlyFire = element.GetAttributeBool("friendlyfire", true);
            DamageDoors = element.GetAttributeBool("damagedoors", false);
            DamageUser = element.GetAttributeBool("damageuser", false);

            GoThroughLightTargets = element.GetAttributeBool("gothroughlighttargets", false);
            LightTargetMassThreshold = element.GetAttributeFloat("lighttargetmassthreshold", -1f);
        }

        /// <summary>
        /// The <see cref="Attack"/> and status effects owned by <paramref name="item"/>, parsed on first use of this
        /// ammo type on that item and reused afterwards. Entries follow the item's lifetime (weak key).
        /// </summary>
        public ProjectileData For(Item item) => perItem.GetValue(item, CreateData);

        private ProjectileData CreateData(Item item)
        {
            var data = new ProjectileData();
            if (attackElement != null)
            {
                data.Attack = new Attack(attackElement, item.Name + ", Projectile", item);
                // A fresh Attack starts with the multiplier the XML declared; remember it because the instance is
                // reused and Shoot() overwrites the multiplier for every shot.
                data.BaseDamageMultiplier = data.Attack.DamageMultiplier;
            }
            foreach (var element in statusEffectElements)
            {
                var statusEffect = StatusEffect.Load(element, item.Name + statusEffectOwnerSuffix);
                if (!data.StatusEffects.TryGetValue(statusEffect.Type, out List<StatusEffect>? effectList))
                {
                    effectList = new List<StatusEffect>();
                    data.StatusEffects.Add(statusEffect.Type, effectList);
                }
                effectList.Add(statusEffect);
            }
            return data;
        }
    }

    /// <summary>Parsed projectile data owned by a single item; see <see cref="ProjectilePrefab.For"/>.</summary>
    public sealed class ProjectileData
    {
        public Attack? Attack { get; set; }

        /// <summary>The damage multiplier the XML declared; re-applied every time the ammo is parsed again.</summary>
        public float BaseDamageMultiplier { get; set; } = 1f;

        public Dictionary<ActionType, List<StatusEffect>> StatusEffects { get; } = new();
    }
}
