using Barotrauma;
using Barotrauma.Items.Components;
using System.Collections.Generic;
using System.Linq;
using System.Xml.Linq;

namespace VCE_VirtualizedMagazine
{
    public static class ElementHelper
    {
        public static Dictionary<Identifier, ItemPrefab> ChachedPrefabs = new();

        public static ItemPrefab GetItemPrefab(Identifier id)
        {
            ItemPrefab returnval;
            if (!ChachedPrefabs.TryGetValue(id, out returnval))
            {
                if (ItemPrefab.Prefabs.TryGet(id, out returnval))
                {
                    ChachedPrefabs.Add(id, returnval);
                }
            }
            return returnval;
        }

        public static IEnumerable<ContentXElement> GetComponentsElementByID<T>(Identifier id)
        {
            ItemPrefab prefab = MapEntityPrefab.FindByIdentifier(id) as ItemPrefab;

            if (prefab == null) { yield break; }

            foreach (var subElement in prefab.ConfigElement.Elements())
            {
                if (subElement.Name.ToString().Equals(typeof(T).Name, StringComparison.OrdinalIgnoreCase))
                {
                    yield return subElement;
                }
            }
        }

        public static Dictionary<(Identifier, Type ,int), ContentXElement> ChachedElements = new();
        public static ContentXElement GetComponentElementByID<T>(Identifier id, int index)
        {
            if (id == null) { return null; };
            if (ChachedElements.TryGetValue((id, typeof(T), index), out var output))
            {
                return output;
            }

            ItemPrefab prefab = GetItemPrefab(id);
            if (prefab == null) { return null; }

            int count = -1;
            foreach (var subElement in prefab.ConfigElement.Elements())
            {
                if (subElement.Name.ToString().Equals(typeof(T).Name, StringComparison.OrdinalIgnoreCase))
                {
                    count++;
                }
                if (count == index)
                {
                    ChachedElements.Add((id, typeof(T), index), subElement);
                    return subElement;
                }
            }
            return null;
        }

        public static ContentXElement GetFirstComponentElementByID<T>(Identifier id)
        {
            return GetComponentElementByID<T>(id, 0);
        }
    }
    public class VirtualizedMagazine : ItemContainer
    {
        private const string containerXML =
            "<ItemContainer hideitems=\"true\" capacity=\"1\" SpawnWithId=\"VCE_VirtualizedProjectile\" drawinventory=\"false\" canbeselected=\"false\" ShowConditionInContainedStateIndicator=\"true\" removecontaineditemsondeconstruct=\"true\" containedstateindicatorstyle=\"bullet\">" +
                "<Containable items=\"VCE_VirtualizedProjectile\" />" +
            "</ItemContainer>";
        private static readonly ContentXElement containerContentXElement = new(null, XElement.Parse(containerXML));
        private static readonly Identifier virtprojID = new("VCE_VirtualizedProjectile");

        private Stack<Identifier> loadedammoidentifiers;

        public int LoadedCount
        {
            get => loadedammoidentifiers.Count;
        }

        public Identifier TopIdentifier
        {
            get
            {
                loadedammoidentifiers.TryPeek(out var result);
                return result;
            }
        }

        public int MaxSize
        {
            get; private set;
        }

        public ImmutableHashSet<Identifier> AllowedAmmoTags
        {
            get; private set;
        }

        private Item VPItem;

        public VirtualizedMagazine(Item item, ContentXElement element) : base(item, containerContentXElement)
        {
            loadedammoidentifiers = new();
            var ammoarray = element.GetAttributeIdentifierArray("ProjectileIdentifiers", []).ToList();
            AllowedAmmoTags = element.GetAttributeIdentifierArray("AllowedAmmoTags", []).ToImmutableHashSet();
            MaxSize = element.GetAttributeInt("MaxSize", 30);

            PushAmmoArray(ref ammoarray);
        }

        /// <summary>
        /// Clear ammo stack and push new ammo to stack.
        /// </summary>
        /// <param name="inarray">The ammo array you want to load, also hold rejected ones after loading is completed</param>
        /// <param name="outarray">The ammo array ejected</param>
        public void ReLoadAmmoArray(ref List<Identifier> inarray, out List<Identifier> outarray)
        {
            UnLoadAmmoArray(out outarray);
            PushAmmoArray(ref inarray);
        }

        public void UnLoadAmmoArray(out List<Identifier> outarray)
        {
            outarray = loadedammoidentifiers.ToList();
            loadedammoidentifiers.Clear();
            UpdateAmmoData(Inventory.FindItemByIdentifier(virtprojID));
        }

        /// <summary>
        /// Push ammo to ammo stack.
        /// </summary>
        /// <param name="inarray">The ammo array you want to load, also hold rejected ones after loading is completed</param>
        public void PushAmmoArray(ref List<Identifier> inarray)
        {
            List<Identifier> outarray = new();
            foreach (var id in inarray)
            {
                var prefab = ElementHelper.GetItemPrefab(id);
                if (prefab != null && (AllowedAmmoTags.Count == 0 || PrefabHasTag(prefab, AllowedAmmoTags)) && loadedammoidentifiers.Count < MaxSize)
                {
                    loadedammoidentifiers.Push(id);

                }
                else
                {
                    outarray.Add(id);
                }
            }
            inarray = outarray;
            UpdateAmmoData(Inventory.FindItemByIdentifier(virtprojID));
        }

#warning Will be removed IF i can fix the first round issue when items were placed in Sub Editor
        [Obsolete("DO NOT USE, WORKAROUND TO FIX FIRST ROUND CANT PARSE CORRECTLY")]
        private bool manualflushcompleted;
        [Obsolete("DO NOT USE, WORKAROUND TO FIX FIRST ROUND CANT PARSE CORRECTLY")]
        public void ManualFlush()
        {
            UpdateAmmoData(Inventory.FindItemByIdentifier(virtprojID));
            manualflushcompleted = true;
        }

        public override void Update(float deltaTime, Camera cam)
        {
            if (!manualflushcompleted) { ManualFlush(); }
            base.Update(deltaTime, cam);
        }

        public static bool PrefabHasTag(ItemPrefab prefab, IEnumerable<Identifier> tags)
        {
            foreach (Identifier tag in tags)
            {
                if (prefab.Tags.Contains(tag)) { return true; }
            }
            return false;
        }

        public override bool Use(float deltaTime, Character character = null)
        {
            loadedammoidentifiers.TryPop(out _);
            return UpdateAmmoData(Inventory.FindItemByIdentifier(virtprojID)); ;
        }

        public bool UpdateAmmoData(Item item = null)
        {
            Item.Condition = loadedammoidentifiers.Count;
            if (item != null && VPItem == null && VPItem != item) { VPItem = item; }
            if (VPItem == null && item == null) { return false; }
            item = item ?? VPItem;
            item.GetComponent<VirtualizedProjectile>().ParseProjectileData(ElementHelper.GetFirstComponentElementByID<Projectile>(TopIdentifier));
            item.tags = ItemPrefab.FindByIdentifier(TopIdentifier)?.Tags?.ToHashSet() ?? [];
            return true;
        }


        public override void OnItemLoaded()
        {
            Inventory.AllowSwappingContainedItems = AllowSwappingContainedItems;
            containableItemIdentifiers = slotRestrictions.SelectMany(s => s.ContainableItems?.SelectMany(ri => ri.Identifiers) ?? Enumerable.Empty<Identifier>()).ToImmutableHashSet();
            hasSignalConnections = item.Connections?.Any(c => c.Name is "contained_conditions" or "contained_conditions_percentage" or "contained_items") ?? false;
            if (item.Submarine == null || !item.Submarine.Loading)
            {
                SpawnAlwaysContainedItems();
            }
        }

        private void OnContainedSpawn(Item i)
        {
            alwaysContainedItemsSpawned = true;
            UpdateAmmoData(i);
        }

        private new void SpawnAlwaysContainedItems()
        {
            if (SpawnWithId.Length > 0 && (item.Condition > 0.0f || SpawnWithIdWhenBroken))
            {
                string[] splitIds = SpawnWithId.Split(',');
                foreach (string id in splitIds)
                {
                    ItemPrefab prefab = ItemPrefab.Prefabs.Find(m => m.Identifier == id);
                    if (prefab != null && Inventory != null && Inventory.CanProbablyBePut(prefab))
                    {
                        bool isEditor = false;
#if CLIENT
                        isEditor = Screen.Selected == GameMain.SubEditorScreen;
#endif
                        if (!isEditor && (Entity.Spawner == null || Entity.Spawner.Removed) && GameMain.NetworkMember == null)
                        {
                            var spawnedItem = new Item(prefab, Vector2.Zero, null);
                            OnContainedSpawn(spawnedItem);
                            Inventory.TryPutItem(spawnedItem, null, spawnedItem.AllowedSlots, createNetworkEvent: false);
                        }
                        else
                        {
                            IsActive = true;
                            Entity.Spawner?.AddItemToSpawnQueue(prefab, Inventory, spawnIfInventoryFull: false, onSpawned: OnContainedSpawn);
                        }
                    }
                }
            }
        }

        public override bool Combine(Item item, Character user)
        {
            var target = item.GetComponent<VirtualizedMagazine>();
            if (target == null) { return false; }
            var t = new List<Identifier>();
            target.UnLoadAmmoArray(out t);
            PushAmmoArray(ref t);
            // Rejected rounds are top-first; restore them bottom-first to preserve feed order.
            t.Reverse();
            target.PushAmmoArray(ref t);
            Item.Condition = loadedammoidentifiers.Count;
            target.Item.Condition = target.LoadedCount;

            return true;
        }
    }
}