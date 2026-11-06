using Barotrauma;
using Barotrauma.Items.Components;
using Barotrauma.Plugins;
using System.Collections.Generic;

namespace VCE_VirtualizedMagazine
{
    public class VirtualizedMagazineFactory : ItemComponent
    {
        static IDebugConsole DebugConsole => VanillaComponentsExpanded.VCEPlugin.DebugConsole;

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
                            DebugConsole.AddWarning($"Warning: Invalid MagazineData for MagazineFactory {Item.Prefab.Identifier}");
                            continue;
                        }

                        if (!(ItemPrefab.Prefabs.TryGet(magid, out var itemprefab) 
                            && MagazinePrefab.Prefabs.TryGet(magprefabid, out var magazineprefab)))
                        {
                            DebugConsole.AddWarning($"Warning: Invalid PrefabIdentifier for MagazineFactory {Item.Prefab.Identifier}");
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
                    LoadAmmoForItem(spawnedItem, magazineprefab);
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
                                                            LoadAmmoForItem(i, magazineprefab);
                                                        });
                }
            }
        }

        private static void LoadAmmoForItem(Item item, MagazinePrefab prefab)
        {
            var vm = item.GetComponent<VirtualizedMagazine>();

            var end = prefab.EndSection;
            var start = prefab.StartSection;
            var main = prefab.MainSection;
            var n = (int)item.MaxCondition;

            int takeEnd = Math.Min(end.Count, n);
            int takeStart = Math.Min(start.Count, n - takeEnd);
            int space = n - takeEnd - takeStart;

            var result = new List<Identifier>(n);

            result.AddRange(end.Take(takeEnd));

            if (main.Count > 0 && space > 0)
            {
                if (prefab.AutoRepeat)
                {
                    for (int i = 0; i < space; i++)
                    {
                        result.Add(main[i % main.Count]);
                    }
                }
                else
                {
                    result.AddRange(main.Take(space));
                }
            }

            result.AddRange(start.Take(takeStart));

            vm.LoadedAmmoIdentifiersArray = result.ToArray();
        }
    }
}