using Barotrauma.Items.Components;
using Barotrauma.Plugins;

namespace VCE_VirtualizedMagazine
{
    public class VirtualizedAmmoStorage : ItemComponent
    {
        static IDebugConsole DebugConsole => VanillaComponentsExpanded.VCEPlugin.DebugConsole;

        public Identifier AmmoIdentifier { get; set; }

        public int MaxAmount
        {
            get => (int)Item.MaxCondition;
        }

        public VirtualizedAmmoStorage(Item item, ContentXElement element) : base(item, element)
        {
            AmmoIdentifier = element.GetAttributeIdentifier("ProjectileIdentifier", Identifier.Empty);

            if(AmmoIdentifier.IsEmpty || !ItemPrefab.Prefabs.TryGet(AmmoIdentifier, out _))
            {
                DebugConsole.AddWarning($"Warning: Invalid ProjectileIdentifier found for AmmoStorage: {Item.Prefab.Identifier}");
            }
        }
    }
}