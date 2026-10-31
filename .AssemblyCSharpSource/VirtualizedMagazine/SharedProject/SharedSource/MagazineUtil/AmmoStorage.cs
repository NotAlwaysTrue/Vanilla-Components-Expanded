using Barotrauma.Items.Components;

namespace VCE_VirtualizedMagazine
{
    public class VirtualizedAmmoStorage : ItemComponent
    {
        static ILoggerService DebugConsole => VirtualizedMagazinePlugin.instance.LoggerService;

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
                DebugConsole.LogWarning($"Warning: Invalid ProjectileIdentifier found for AmmoStorage: {Item.Prefab.Identifier}");
            }
        }
    }
}