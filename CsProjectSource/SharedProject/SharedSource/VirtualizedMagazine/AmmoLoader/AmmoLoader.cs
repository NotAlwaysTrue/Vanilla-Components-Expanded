using System.Xml.Linq;
using Barotrauma.Items.Components;
using Barotrauma.Networking;

namespace VCE_VirtualizedMagazine;

public sealed partial class AmmoLoader : ItemComponent, IServerSerializable, IClientSerializable
{
    public AmmoStock Stock { get; private set; } = new();
    private ItemContainer? inputContainer, targetContainer, outputContainer;
    private XElement? invalidStock;
    private uint revision;
    private float scanTimer;
    private ushort observedTarget;
    private uint observedRoundsVersion;
    private int targetSlot;

    [Serialize(0, IsPropertySaveable.No)]
    public int InputContainerIndex { get; set; }

    [Serialize(2, IsPropertySaveable.No)]
    public int TargetContainerIndex { get; set; } = 2;

    [Serialize(1, IsPropertySaveable.No)]
    public int OutputContainerIndex { get; set; } = 1;

    [Serialize(false, IsPropertySaveable.No)]
    public bool UseSupplyStorage { get; set; }

    [Serialize("", IsPropertySaveable.No)]
    public string TextPrefix { get; set; } = "";

    public VirtualizedMagazine? Target => targetContainer?.Inventory?.GetItemAt(TargetSlot)?.GetComponent<VirtualizedMagazine>();
    /// <summary>Rack slot the machine loads into, picked with the arrows in the I/O window.</summary>
    public int TargetSlot => TargetSlotCount <= 0 ? 0 : Math.Clamp(targetSlot, 0, TargetSlotCount - 1);
    public int TargetSlotCount => targetContainer?.Inventory?.Capacity ?? 0;
    public ItemContainer? InputContainer => inputContainer;
    public ItemContainer? TargetContainer => targetContainer;
    public ItemContainer? OutputContainer => outputContainer;
    public uint StateRevision => revision;
    private bool IsAuthority => GameMain.NetworkMember is not { IsClient: true };
    public bool Ready => invalidStock == null && inputContainer != null && targetContainer != null &&
        inputContainer != targetContainer && Item.Condition > 0;

    public AmmoLoader(Item item, ContentXElement element) : base(item, element)
    {
        IsActive = true;
    }

    public override void OnItemLoaded()
    {
        var containers = Item.GetComponents<ItemContainer>().ToArray();
        inputContainer = containers.ElementAtOrDefault(InputContainerIndex);
        targetContainer = containers.ElementAtOrDefault(TargetContainerIndex);
        outputContainer = containers.ElementAtOrDefault(OutputContainerIndex);
        if (outputContainer == inputContainer || outputContainer == targetContainer) { outputContainer = null; }
        // The target container may be a magazine rack: the player picks which slot feeds the machine.
        int targetCapacity = targetContainer?.Inventory?.Capacity ?? 0;
        if (inputContainer == targetContainer || outputContainer == targetContainer || targetCapacity < 1)
        {
            inputContainer = targetContainer = null;
            VanillaComponentsExpanded.VCEPlugin.DebugConsole.AddWarning(
                $"AmmoLoader on {Item.Prefab.Identifier} needs separate input and non-empty target ItemContainers.");
        }
        InitClient();
    }

    partial void InitClient();

    public static bool IsProjectile(string id) =>
        ElementHelper.GetFirstComponentElementByID<Projectile>(id.ToIdentifier()) != null;

    public static bool IsCompatible(VirtualizedMagazine? magazine, string id) =>
        IsProjectile(id) && (magazine == null || magazine.IsAmmoCompatible(id.ToIdentifier()));

    public static ItemPrefab? FindWithdrawalPackage(string id)
    {
        if (!IsProjectile(id)) { return null; }
        var identifier = id.ToIdentifier();
        return FindWithdrawalPackages([identifier]).GetValueOrDefault(identifier);
    }

    /// <summary>
    /// Resolves the withdrawal package prefab for every given ammo type in a single pass over the prefab list. The UI
    /// asks for one package per stock tile, so calling the single-id overload per tile scanned every prefab once per
    /// tile - with a large stock that is the same work as the whole prefab list times the number of ammo types.
    /// </summary>
    private static Dictionary<Identifier, ItemPrefab> FindWithdrawalPackages(HashSet<Identifier> ammo)
    {
        var packages = new Dictionary<Identifier, ItemPrefab>();
        if (ammo.Count == 0) { return packages; }
        var packageTag = "vceammopackage".ToIdentifier();
        foreach (var prefab in ItemPrefab.Prefabs)
        {
            if (!float.IsFinite(prefab.Health) || prefab.Health < 1 || prefab.Health >= int.MaxValue) { continue; }
            if (!prefab.Tags.Contains(packageTag) || prefab.ConfigElement == null) { continue; }
            Identifier id = Identifier.Empty;
            bool foundStorage = false, hasContainer = false;
            foreach (var element in prefab.ConfigElement.Elements())
            {
                string name = element.Name.ToString();
                if (name.Equals(nameof(ItemContainer), StringComparison.OrdinalIgnoreCase)) { hasContainer = true; break; }
                if (!foundStorage && name.Equals(nameof(VirtualizedAmmoStorage), StringComparison.OrdinalIgnoreCase))
                {
                    id = element.GetAttributeIdentifier("ProjectileIdentifier", Identifier.Empty);
                    foundStorage = true;
                }
            }
            if (!foundStorage || hasContainer || !ammo.Contains(id) || !IsProjectile(id.Value)) { continue; }
            if (!packages.TryGetValue(id, out var best) || prefab.Health > best.Health ||
                (prefab.Health == best.Health && string.CompareOrdinal(prefab.Identifier.Value, best.Identifier.Value) < 0))
            { packages[id] = prefab; }
        }
        return packages;
    }

    private string WithdrawalProblem(string id, ItemPrefab? package)
    {
        if (!Ready || Item.Removed || Item.IsInRemoveQueue) { return "unavailable"; }
        if (outputContainer?.Inventory == null) { return "nooutput"; }
        if (package == null) { return "nopackage"; }
        int available = WithdrawalAmount(id);
        if (available < 1) { return "notenough"; }
        return outputContainer.Inventory.CanProbablyBePut(package, Math.Min(available, (int)package.Health), quality: 0)
            ? "withdraw" : "outputfull";
    }

    private bool TryWithdraw(string id)
    {
        if (!IsAuthority) { return false; }
        if (RefreshSupplies()) { Changed(); }
        var package = FindWithdrawalPackage(id);
        if (WithdrawalProblem(id, package) != "withdraw" || Entity.Spawner is not { Removed: false } spawner)
        { return false; }
        var inventory = outputContainer!.Inventory;
        if (spawner.IsInSpawnQueue(info => info is EntitySpawner.ItemSpawnInfo pending && pending.Inventory == inventory))
        { return false; }
        int requested = Math.Min(WithdrawalAmount(id), (int)package!.Health);
        // Charge only after the queued item reaches the output, using the then-current supplies.
        spawner.AddItemToSpawnQueue(package, inventory, condition: requested, quality: 0, spawnIfInventoryFull: false,
            onSpawned: spawned =>
            {
                if (RefreshSupplies()) { Changed(); }
                int amount = Math.Min(requested, WithdrawalAmount(id));
                var demand = new Dictionary<string, int> { [id] = amount };
                var quote = UseSupplyStorage ? QuoteSupply(demand) : new SupplyQuote(demand, [], Stock.CanTake(demand));
                bool delivered = false;
                try
                {
                    if (Ready && !Item.Removed && !Item.IsInRemoveQueue && !spawned.Removed && !spawned.IsInRemoveQueue &&
                        spawned.ParentInventory == inventory && outputContainer?.Inventory == inventory &&
                        spawned.GetComponent<VirtualizedAmmoStorage>()?.AmmoIdentifier == id.ToIdentifier() &&
                        !spawned.ContainedItems.Any() && amount > 0)
                    {
                        spawned.Condition = amount;
                        delivered = (double)spawned.Condition == amount && TryPrepareSupplyDebit(quote, out var debits) &&
                            TryCommitSupplyDebit(quote, debits);
                    }
                }
                catch (Exception e)
                {
                    VanillaComponentsExpanded.VCEPlugin.DebugConsole.AddWarning($"AmmoLoader package delivery failed: {e.Message}");
                }
                if (delivered) { RefreshSupplies(); Changed(); }
                else
                {
                    try { spawned.Condition = 0; }
                    finally { spawner.AddItemToRemoveQueue(spawned); }
                }
            });
        return true;
    }

    public override void Update(float deltaTime, Camera cam)
    {
        if (!IsAuthority) { return; }
#if CLIENT
        if (Screen.Selected == GameMain.SubEditorScreen) { return; }
#endif
        scanTimer -= deltaTime;
        if (scanTimer > 0) { return; }
        scanTimer = 0.25f;
        bool changed = RefreshSupplies();
        if (Ready && !supplyError && Entity.Spawner is { Removed: false } spawner)
        {
            foreach (var source in inputContainer!.Inventory.AllItems.ToArray())
            {
                if (supplyByItem.ContainsKey(source)) { continue; }
                var package = source.GetComponent<VirtualizedAmmoStorage>();
                if (package == null || source.Removed || source.IsInRemoveQueue) { continue; }
                string id = package.AmmoIdentifier.Value;
                if (!IsProjectile(id) || source.ContainedItems.Any()) { continue; }
                if (source.Condition <= 0) { spawner.AddItemToRemoveQueue(source); continue; }
                int amount = (int)source.Condition;
                if (UseSupplyStorage)
                {
                    if (amount < 1 || !TryPrepareReturn(new Dictionary<string, int> { [id] = amount }, out var stored, out var credits)) { continue; }
                    credits.Add((source, source.Condition, source.Condition - amount));
                    if (!TryApplySupplyChanges(credits)) { continue; }
                    Stock.TryAdd(stored);
                    if (source.Condition == 0) { spawner.AddItemToRemoveQueue(source); }
                    RefreshSupplies();
                    changed = true;
                    continue;
                }
                if (!Stock.TryAdd(new Dictionary<string, int> { [id] = amount })) { continue; }
                // Zero the saved VCE storage before queuing removal, so it cannot be deposited twice.
                source.Condition = 0;
                spawner.AddItemToRemoveQueue(source);
                changed = true;
            }
        }
        var target = Target;
        ushort targetId = target?.Item.ID ?? 0;
        uint roundsVersion = target?.RoundsVersion ?? 0;
        if (observedTarget != targetId || observedRoundsVersion != roundsVersion)
        {
            observedTarget = targetId;
            observedRoundsVersion = roundsVersion;
            changed = true;
        }
        if (changed) { Changed(); }
    }

    /// <summary>Selects the rack slot the machine loads into. Authority only; clients ask through the network.</summary>
    private bool TrySetTargetSlot(int index)
    {
        if (!IsAuthority || TargetSlotCount <= 0) { return false; }
        index = Math.Clamp(index, 0, TargetSlotCount - 1);
        if (index == targetSlot) { return true; }
        targetSlot = index;
        Changed();
        return true;
    }

    /// <summary>The freshly loaded magazine is moved to the output container so the player can take it out.</summary>
    private void TryMoveLoadedMagazineToOutput(VirtualizedMagazine magazine)
    {
        var inventory = outputContainer?.Inventory;
        var item = magazine.Item;
        if (!IsAuthority || inventory == null || item.Removed || item.IsInRemoveQueue ||
            item.ParentInventory != targetContainer?.Inventory || !inventory.CanBePut(item))
        {
            return;
        }
        inventory.TryPutItem(item, user: null, createNetworkEvent: true);
    }

    private bool TryLoad(IReadOnlyList<AmmoRun> plan, ushort targetId)
    {
        var magazine = Target;
        if (!IsAuthority || !Ready || magazine == null || magazine.Item.ID != targetId || magazine.LoadedCount >= magazine.MaxSize ||
            !AmmoPlan.IsValid(plan, AmmoPlan.MaxRounds))
        {
            return false;
        }
        // The plan is top-first: the sequence list reads top to bottom as the firing order. `LoadAmmoArray` pushes in
        // list order (first entry becomes the stack bottom), so `toLoad` is reversed below. Existing rounds stay
        // underneath, so the plan's top row ends up on the stack top. Only the plan's tail fits when the magazine is
        // partly full, so the head of the plan stays in stock (unchanged).
        int planned = plan.Sum(r => r.Count);
        int countToLoad = Math.Min(planned, magazine.MaxSize - magazine.LoadedCount);
        int skip = planned - countToLoad;
        // Single pass over the groups: expanding the whole plan first allocated a 4096-entry array plus a TakeLast
        // buffer on every load, which is what made loading a fully stocked machine stutter.
        var demand = new Dictionary<string, int>(StringComparer.OrdinalIgnoreCase);
        var toLoad = new List<Identifier>(countToLoad);
        foreach (var run in plan)
        {
            int skipped = Math.Min(skip, run.Count);
            skip -= skipped;
            int count = run.Count - skipped;
            if (count == 0) { continue; }
            if (!IsCompatible(magazine, run.Id)) { return false; }
            demand[run.Id] = demand.GetValueOrDefault(run.Id) + count;
            var id = run.Id.ToIdentifier();
            for (int i = 0; i < count; i++) { toLoad.Add(id); }
        }
        if (RefreshSupplies()) { Changed(); }
        var quote = QuoteSupply(demand);
        if (!TryPrepareSupplyDebit(quote, out var debits)) { return false; }
        var original = magazine.LoadedAmmoIdentifiersArray;
        // Bottom-first for the push: the last entry pushed is `toLoad[0]`, the plan's top row, which then fires first.
        toLoad.Reverse();
        try { magazine.LoadAmmoArray(ref toLoad); }
        catch (Exception e)
        {
            RestoreMagazine(magazine, original);
            VanillaComponentsExpanded.VCEPlugin.DebugConsole.AddWarning($"AmmoLoader load rolled back: {e.Message}");
            return false;
        }
        if (toLoad.Count != 0)
        {
            RestoreMagazine(magazine, original);
            return false;
        }
        if (!TryCommitSupplyDebit(quote, debits))
        {
            RestoreMagazine(magazine, original);
            return false;
        }
        RefreshSupplies();
        TryMoveLoadedMagazineToOutput(magazine);
        Changed();
        return true;
    }

    private bool TryUnload(ushort targetId)
    {
        var magazine = Target;
        if (!IsAuthority || !Ready || magazine == null || magazine.Item.ID != targetId || magazine.LoadedCount == 0) { return false; }
        if (RefreshSupplies()) { Changed(); }
        var returned = AmmoStock.Count(magazine.LoadedAmmoIdentifiers.Select(id => id.Value));
        if (!TryPrepareReturn(returned, out var stored, out var credits)) { return false; }
        var original = magazine.LoadedAmmoIdentifiersArray;
        try { magazine.UnLoadAmmoArray(out _); }
        catch (Exception e)
        {
            RestoreMagazine(magazine, original);
            VanillaComponentsExpanded.VCEPlugin.DebugConsole.AddWarning($"AmmoLoader unload rolled back: {e.Message}");
            return false;
        }
        if (!TryApplySupplyChanges(credits))
        {
            RestoreMagazine(magazine, original);
            return false;
        }
        Stock.TryAdd(stored);
        RefreshSupplies();
        Changed();
        return true;
    }

    private static void RestoreMagazine(VirtualizedMagazine magazine, Identifier[] rounds)
    {
        magazine.LoadedAmmoIdentifiers.Clear();
        try { magazine.LoadedAmmoIdentifiersArray = rounds; }
        catch (Exception e)
        {
            VanillaComponentsExpanded.VCEPlugin.DebugConsole.AddWarning($"AmmoLoader restored rounds; projectile refresh failed: {e.Message}");
        }
    }

    private void Changed()
    {
        revision++;
        var target = Target;
        observedTarget = target?.Item.ID ?? 0;
        // A version counter, not a copy of the round list: the old code allocated and compared the whole 4096-round
        // stack on every change.
        observedRoundsVersion = target?.RoundsVersion ?? 0;
        PublishState();
    }

    /// <summary>
    /// A preset edit is published as soon as it is applied, on the command path and on the authority's own UI path
    /// alike. Nothing is written to disk here: the files are only touched by <see cref="MagazinePresetLibrary.Save" />
    /// and <see cref="MagazinePresetLibrary.Load" />, which the game save/load hooks call.
    /// </summary>
    private void PresetChanged()
    {
        Changed();
        PublishPresets();
    }

    partial void PublishState();

    public override XElement Save(XElement parentElement)
    {
        var saved = base.Save(parentElement);
        saved.Add(invalidStock == null ? Stock.Save() : new XElement(invalidStock));
        return saved;
    }

    public override void Load(ContentXElement element, bool usePrefabValues, IdRemap idRemap, bool isItemSwap)
    {
        // Old submarine saves must not override the prefab's current container order.
        var containerIndices = (InputContainerIndex, TargetContainerIndex, OutputContainerIndex);
        base.Load(element, usePrefabValues, idRemap, isItemSwap);
        (InputContainerIndex, TargetContainerIndex, OutputContainerIndex) = containerIndices;
        var saved = element?.Element.Element("Stock");
        try { Stock.Load(saved); invalidStock = null; }
        catch (Exception e) when (e is FormatException or OverflowException)
        {
            invalidStock = saved == null ? null : new XElement(saved);
            VanillaComponentsExpanded.VCEPlugin.DebugConsole.AddWarning($"AmmoLoader stock preserved but disabled: {e.Message}");
        }
    }

    private enum Command : byte { Refresh, Load, Unload, Withdraw, SavePreset, DeletePreset, MovePreset, SelectSlot }
    /// <summary>`Start`/`End` carry the MagazinePrefab sections of a preset save; other commands leave them empty.</summary>
    private sealed record Request(Command Command, uint Revision, ushort Target, AmmoRun[] Plan, string Name = "",
        int Index = 0, AmmoRun[]? Start = null, AmmoRun[]? End = null) : IEventData;
    private sealed record PresetSnapshot(string Name, AmmoRun[] Start, AmmoRun[] Main, AmmoRun[] End);
    /// <summary>Presets travel on their own event so stock updates never re-sync the arrangement list.</summary>
    private sealed record PresetListSnapshot(uint Revision, PresetSnapshot[] Presets) : IEventData;

    partial void PublishPresets();

    /// <summary>Applies one preset edit. The server owns the list; singleplayer applies it directly.</summary>
    private bool ApplyPresetCommand(Command command, AmmoRun[] plan, string name, int index,
        AmmoRun[]? start = null, AmmoRun[]? end = null)
    {
        if (!IsAuthority) { return false; }
        bool applied = command switch
        {
            Command.SavePreset => MagazinePresetLibrary.Create(name, start ?? [], plan, end ?? []) != null,
            Command.DeletePreset => MagazinePresetLibrary.Find(name) is { } removed && MagazinePresetLibrary.Remove(removed),
            Command.MovePreset => MagazinePresetLibrary.Find(name) is { } moved && MagazinePresetLibrary.Move(moved, index),
            _ => false
        };
        // The list goes out immediately; the preset files stay untouched until the game itself saves.
        if (applied) { PresetChanged(); }
        return applied;
    }
}
