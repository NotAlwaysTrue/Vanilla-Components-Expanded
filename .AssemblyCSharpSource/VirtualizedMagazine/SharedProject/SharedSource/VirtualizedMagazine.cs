using Barotrauma;
using Barotrauma.Items.Components;
using System.Collections.Generic;
using System.Globalization;
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

        public static IEnumerable<ContentXElement> GetComponentsElementByID<T>(Identifier id) where T : ItemComponent
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
        public static ContentXElement GetComponentElementByID<T>(Identifier id, int index) where T : ItemComponent
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

        public static ContentXElement GetFirstComponentElementByID<T>(Identifier id) where T : ItemComponent
        {
            return GetComponentElementByID<T>(id, 0);
        }
    }
    public class VirtualizedMagazine : ItemContainer
    {
        private const string containerXML =
            "<ItemContainer hideitems=\"true\" capacity=\"1\" SpawnWithId=\"VCE_VirtualizedProjectile\" drawinventory=\"true\" canbeselected=\"false\" ShowConditionInContainedStateIndicator=\"true\" removecontaineditemsondeconstruct=\"true\" containedstateindicatorstyle=\"bullet\">" +
                "<Containable items=\"VCE_VirtualizedProjectile\" />" +
            "</ItemContainer>";
        private static readonly ContentXElement containerContentXElement = new(null, XElement.Parse(containerXML));
        private static readonly Identifier virtprojID = new("VCE_VirtualizedProjectile");

        public Stack<Identifier> LoadedAmmoIdentifiers
        {
            get; private set;
        } = new();

        public IEnumerable<Identifier> LoadedAmmoIdentifiersArray
        {
            get => LoadedAmmoIdentifiers.ToArray().Reverse();
        }

        [Serialize("", IsPropertySaveable.Yes, alwaysUseInstanceValues: true)]
        public string LoadedAmmoIdentifiersString
        {
            get => string.Join(",", LoadedAmmoIdentifiersArray);
            set
            {
                var data = value.Split(',').ToIdentifiers().ToList();
                LoadAmmoArray(ref data);
            }
        }

        public int LoadedCount
        {
            get => LoadedAmmoIdentifiers.Count;
        }

        public Identifier TopIdentifier
        {
            get
            {
                LoadedAmmoIdentifiers.TryPeek(out var result);
                return result;
            }
        }

        public int MaxSize
        {
            get => (int)Item.MaxCondition;
        }

        public ImmutableHashSet<Identifier> AllowedAmmoTags
        {
            get; private set;
        }

        private Item VPItem;

        public VirtualizedMagazine(Item item, ContentXElement element) : base(item, containerContentXElement)
        {
            var ammoarray = element.GetAttributeIdentifierArray("ProjectileIdentifiers", []).ToList();
            AllowedAmmoTags = element.GetAttributeIdentifierArray("AllowedAmmoTags", []).ToImmutableHashSet();
            UpdateWhenBroken = true;
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
            outarray = LoadedAmmoIdentifiers.ToList();
            LoadedAmmoIdentifiers.Clear();
            UpdateAmmoData(Inventory.FindItemByIdentifier(virtprojID));
        }

        /// <summary>
        /// Load ammo list to stack
        /// </summary>
        /// <param name="inarray">The ammo array you want to load, also hold rejected ones after loading is completed</param>
        public void LoadAmmoArray(ref List<Identifier> inarray)
        {
            List<Identifier> outarray = new();
            foreach (var id in inarray)
            {
                var prefab = ElementHelper.GetItemPrefab(id);
                if (prefab != null && (AllowedAmmoTags.Count == 0 || PrefabHasTag(prefab, AllowedAmmoTags)) && LoadedAmmoIdentifiers.Count < MaxSize)
                {
                    LoadedAmmoIdentifiers.Push(id);

                }
                else
                {
                    outarray.Add(id);
                }
            }
            inarray = outarray;
            if(Inventory == null) { return; }
            UpdateAmmoData(Inventory.FindItemByIdentifier(virtprojID));
        }

        public void PushAmmoArray(ref List<Identifier> inarray) => LoadAmmoArray(ref inarray);

        public override void Update(float deltaTime, Camera cam)
        {
            if (!string.IsNullOrEmpty(SpawnWithId) && !alwaysContainedItemsSpawned)
            {
                SpawnAlwaysContainedItems();
                alwaysContainedItemsSpawned = true;
            }

            if (item.ParentInventory is CharacterInventory ownerInventory)
            {
                SetContainedItemPositionsIfNeeded();
            }
            else if (item.body != null && item.body.Enabled)
            {
                if (item.body.FarseerBody.Awake)
                {
                    SetContainedItemPositionsIfNeeded();
                }
            }

            foreach (ActiveContainedItem activeContainedItem in activeContainedItems)
            {
                if (!ShouldApplyEffects(activeContainedItem)) { continue; }

                StatusEffect effect = activeContainedItem.StatusEffect;
                effect.Apply(ActionType.OnActive, deltaTime, item, targets);
                effect.Apply(ActionType.OnContaining, deltaTime, item, targets);
                if (item.GetComponent<Wearable>() is Wearable { IsActive: true })
                {
                    effect.Apply(ActionType.OnWearing, deltaTime, item, targets);
                }
            }
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
            LoadedAmmoIdentifiers.TryPop(out _);
            return UpdateAmmoData(Inventory.FindItemByIdentifier(virtprojID)); ;
        }

        public bool UpdateAmmoData(Item item = null)
        {
            Item.Condition = LoadedAmmoIdentifiers.Count;
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
            hasSignalConnections = false;
            if (item.Submarine == null || !item.Submarine.Loading)
            {
                SpawnAlwaysContainedItems();
            }
        }

        public override void OnMapLoaded()
        {
            if (itemIds != null)
            {
                initializingLoadedItems = true;
                for (ushort i = 0; i < itemIds.Length; i++)
                {
                    if (i >= Inventory.Capacity)
                    {
                        //legacy support: before item stacking was implemented, revolver for example had a separate slot for each bullet
                        //now there's just one, try to put the extra items where they fit (= stack them)
                        Inventory.TryPutItem(item, user: null, createNetworkEvent: false);
                        continue;
                    }
                    foreach (ushort id in itemIds[i])
                    {
                        if (Entity.FindEntityByID(id) is not Item item) { continue; }
                        Inventory.TryPutItem(item, i, false, false, null, createNetworkEvent: false, ignoreCondition: true);
                    }
                }
                initializingLoadedItems = false;
                itemIds = null;
            }

            //outpost and ruins are loaded in multiple stages (each module is loaded separately)
            //spawning items at this point during the generation will cause ID overlaps with the entities in the modules loaded afterwards
            //so let's not spawn them at this point, but in the 1st Update()
            if (item.Submarine?.Info != null && (item.Submarine.Info.IsOutpost || item.Submarine.Info.IsRuin))
            {
                if (SpawnWithId.Length > 0)
                {
                    IsActive = true;
                }
            }
            else
            {
                SpawnAlwaysContainedItems();
            }

            SetContainedItemPositions();
        }

        private void OnContainedSpawn(Item i)
        {
            VPItem = i;
            alwaysContainedItemsSpawned = true;
            UpdateAmmoData(i);
        }

        private new void SpawnAlwaysContainedItems()
        {
            ItemPrefab.Prefabs.TryGet(virtprojID, out var prefab);
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
            Item.Condition = LoadedAmmoIdentifiers.Count;
            target.Item.Condition = target.LoadedCount;

            return true;
        }
    }
}