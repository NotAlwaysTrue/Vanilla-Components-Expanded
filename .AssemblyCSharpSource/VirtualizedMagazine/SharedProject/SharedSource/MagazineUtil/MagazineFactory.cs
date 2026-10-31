using Barotrauma;
using Barotrauma.Items.Components;
using System.Collections.Generic;

namespace VCE_VirtualizedMagazine
{
    public class VirtualizedMagazineFactory : ItemComponent
    {
        static ILoggerService DebugConsole => VirtualizedMagazinePlugin.instance.LoggerService;

        // 1st. MagazineId 2st. MagazinePrefabId
        public List<(ItemPrefab, MagazinePrefab)> MagazineData
        {
            get;
        }

        public bool SpawnImmediately
        {
            get;
        }

        public bool RemoveAfterSpawn
        {
            get;
        }

        private bool spawned = false;

        public VirtualizedMagazineFactory(Item item, ContentXElement element) : base(item, element)
        {
            SpawnImmediately = element.GetAttributeBool("SpawnImmediately", true);
            RemoveAfterSpawn = element.GetAttributeBool("RemoveAfterSpawn", true);

            IsActive = SpawnImmediately;

            MagazineData = new();

            foreach (var subElement in element.Elements())
            {
                switch (subElement.Name.ToString().ToLowerInvariant())
                {
                    case "magazinedata":
                        var magid = subElement.GetAttributeIdentifier("MagazineID", Identifier.Empty);
                        var magprefabid = subElement.GetAttributeIdentifier("MagazinePrefabID", Identifier.Empty);

                        if (magid.IsEmpty || magprefabid.IsEmpty)
                        {
                            DebugConsole.LogWarning($"Warning: Invalid MagazineData for MagazineFactory {Item.Prefab.Identifier}");
                            continue;
                        }

                        if (!(ItemPrefab.Prefabs.TryGet(magid, out var itemprefab) 
                            && MagazinePrefab.Prefabs.TryGet(magprefabid, out var magazineprefab)))
                        {
                            DebugConsole.LogWarning($"Warning: Invalid PrefabIdentifier for MagazineFactory {Item.Prefab.Identifier}");
                            continue;
                        }

                        var amount = subElement.GetAttributeInt("Amount", 1);

                        for(int i = 0; i < amount; i++)
                        {
                            MagazineData.Add((itemprefab, magazineprefab)); 
                        }

                        continue;
                }
            }
        }

        public override void Update(float deltaTime, Camera cam)
        {
            base.Update(deltaTime, cam);
            if (SpawnImmediately && !spawned)
            {
                Manufacture();
            }
            if (RemoveAfterSpawn && spawned)
            {
                Entity.Spawner?.AddItemToRemoveQueue(Item);
            }
        }

        public override bool Use(float deltaTime, Character character = null)
        {
            if (RemoveAfterSpawn && spawned)
            {
                Entity.Spawner?.AddItemToRemoveQueue(Item);
            }
            return true;
        }

        public void Manufacture()
        {
            spawned = true;
            foreach (var i in MagazineData)
            {
                var itemprefab = i.Item1;
                var magazineprefab = i.Item2;
                if ((Entity.Spawner == null || Entity.Spawner.Removed) && GameMain.NetworkMember == null)
                {
                    var spawnedItem = new Item(itemprefab, Vector2.Zero, null);
                    LoadAmmoForItem(spawnedItem, magazineprefab.AmmoData);
                    Item.ParentInventory?.TryPutItem(spawnedItem, null, spawnedItem.AllowedSlots, createNetworkEvent: false);
                }
                else
                {
                    IsActive = true;
                    Entity.Spawner?.AddItemToSpawnQueue(itemprefab, 
                                                        Item.ParentInventory, 
                                                        spawnIfInventoryFull: true, 
                                                        onSpawned: (i) =>
                                                        {
                                                            LoadAmmoForItem(i, magazineprefab.AmmoData);
                                                        });
                }
            }
        }

        private static void LoadAmmoForItem(Item i, List<Identifier> list)
        {
            var vm = i.GetComponent<VirtualizedMagazine>();
            vm.LoadAmmoArray(ref list);
        }
    }
}