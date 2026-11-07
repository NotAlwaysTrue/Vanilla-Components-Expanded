using System.Text.Json;
using System.Xml.Linq;
using Barotrauma.Items.Components;
using Barotrauma.Networking;
using VCE_VirtualizedMagazine;

namespace VCE.AmmoLoading;

public sealed partial class AmmoLoader : ItemComponent, IServerSerializable, IClientSerializable
{
    public AmmoStock Stock { get; private set; } = new();
    private ItemContainer? inputContainer, targetContainer, outputContainer;
    private XElement? invalidStock;
    private uint revision;
    private float scanTimer;
    private ushort observedTarget;
    private Identifier[] observedRounds = [];

    [Serialize(0, IsPropertySaveable.Yes)]
    public int InputContainerIndex { get; set; }

    [Serialize(2, IsPropertySaveable.Yes)]
    public int TargetContainerIndex { get; set; } = 2;

    [Serialize(1, IsPropertySaveable.Yes)]
    public int OutputContainerIndex { get; set; } = 1;

    public VirtualizedMagazine? Target => targetContainer?.Inventory?.GetItemAt(0)?.GetComponent<VirtualizedMagazine>();
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
        if (inputContainer == targetContainer || targetContainer?.Inventory?.Capacity != 1)
        {
            inputContainer = targetContainer = null;
            VanillaComponentsExpanded.VCEPlugin.DebugConsole.AddWarning(
                $"AmmoLoader on {Item.Prefab.Identifier} needs separate input and one-slot target ItemContainers.");
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
        return ItemPrefab.Prefabs.Where(p => p.Tags.Contains("vceammopackage".ToIdentifier()) &&
                float.IsFinite(p.Health) && p.Health >= 1 && p.Health < int.MaxValue &&
                ElementHelper.GetFirstComponentElementByID<VirtualizedAmmoStorage>(p.Identifier)?
                    .GetAttributeIdentifier("ProjectileIdentifier", Identifier.Empty) == id.ToIdentifier() &&
                ElementHelper.GetFirstComponentElementByID<ItemContainer>(p.Identifier) == null)
            .OrderByDescending(p => p.Health).ThenBy(p => p.Identifier.Value, StringComparer.Ordinal).FirstOrDefault();
    }

    private string WithdrawalProblem(string id, ItemPrefab? package)
    {
        if (!Ready || Item.Removed || Item.IsInRemoveQueue) { return "unavailable"; }
        if (outputContainer?.Inventory == null) { return "nooutput"; }
        if (package == null) { return "nopackage"; }
        if (Stock[id] < 1) { return "notenough"; }
        return outputContainer.Inventory.CanProbablyBePut(package, Math.Min(Stock[id], (int)package.Health), quality: 0)
            ? "withdraw" : "outputfull";
    }

    private bool TryWithdraw(string id)
    {
        var package = FindWithdrawalPackage(id);
        if (!IsAuthority || WithdrawalProblem(id, package) != "withdraw" || Entity.Spawner is not { Removed: false } spawner)
        { return false; }
        var inventory = outputContainer!.Inventory;
        if (spawner.IsInSpawnQueue(info => info is EntitySpawner.ItemSpawnInfo pending && pending.Inventory == inventory))
        { return false; }
        int requested = Math.Min(Stock[id], (int)package!.Health);
        // Stock stays saveable until the queued item actually reaches the output inventory.
        spawner.AddItemToSpawnQueue(package, inventory, condition: requested, quality: 0, spawnIfInventoryFull: false,
            onSpawned: spawned =>
            {
                int amount = Math.Min(requested, Stock[id]);
                bool delivered = false;
                try
                {
                    if (Ready && !Item.Removed && !Item.IsInRemoveQueue && !spawned.Removed && !spawned.IsInRemoveQueue &&
                        spawned.ParentInventory == inventory && outputContainer?.Inventory == inventory &&
                        spawned.GetComponent<VirtualizedAmmoStorage>()?.AmmoIdentifier == id.ToIdentifier() &&
                        !spawned.ContainedItems.Any() && amount > 0)
                    {
                        spawned.Condition = amount;
                        delivered = (double)spawned.Condition == amount;
                    }
                }
                catch (Exception e)
                {
                    VanillaComponentsExpanded.VCEPlugin.DebugConsole.AddWarning($"AmmoLoader package delivery failed: {e.Message}");
                }
                if (delivered && Stock.TryTake(new Dictionary<string, int> { [id] = amount })) { Changed(); }
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
        bool changed = false;
        if (Ready && Entity.Spawner is { Removed: false } spawner)
        {
            foreach (var source in inputContainer!.Inventory.AllItems.ToArray())
            {
                var package = source.GetComponent<VirtualizedAmmoStorage>();
                if (package == null || source.Removed || source.IsInRemoveQueue) { continue; }
                string id = package.AmmoIdentifier.Value;
                if (!IsProjectile(id) || source.ContainedItems.Any()) { continue; }
                if (source.Condition <= 0) { spawner.AddItemToRemoveQueue(source); continue; }
                int amount = (int)source.Condition;
                if (!Stock.TryAdd(new Dictionary<string, int> { [id] = amount })) { continue; }
                // Zero the saved VCE storage before queuing removal, so it cannot be deposited twice.
                source.Condition = 0;
                spawner.AddItemToRemoveQueue(source);
                changed = true;
            }
        }
        var target = Target;
        var rounds = target?.LoadedAmmoIdentifiers.ToArray() ?? [];
        if (observedTarget != (target?.Item.ID ?? 0) || !observedRounds.SequenceEqual(rounds))
        {
            observedTarget = target?.Item.ID ?? 0;
            observedRounds = rounds;
            changed = true;
        }
        if (changed) { Changed(); }
    }

    private bool TryLoad(IReadOnlyList<AmmoRun> plan, ushort targetId)
    {
        var magazine = Target;
        if (!Ready || magazine == null || magazine.Item.ID != targetId || magazine.LoadedCount >= magazine.MaxSize ||
            !AmmoPlan.IsValid(plan, AmmoPlan.MaxRounds))
        {
            return false;
        }
        var rounds = AmmoPlan.Expand(plan).TakeLast(magazine.MaxSize - magazine.LoadedCount).ToArray();
        var demand = AmmoStock.Count(rounds);
        if (demand.Keys.Any(id => !IsCompatible(magazine, id)) || !Stock.CanTake(demand)) { return false; }
        var original = magazine.LoadedAmmoIdentifiersArray;
        // The plan's tail is inserted first; discard the head that no longer fits.
        var toLoad = rounds.Reverse().Select(id => id.ToIdentifier()).ToList();
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
        Stock.TryTake(demand);
        Changed();
        return true;
    }

    private bool TryUnload(ushort targetId)
    {
        var magazine = Target;
        if (!Ready || magazine == null || magazine.Item.ID != targetId || magazine.LoadedCount == 0) { return false; }
        var returned = AmmoStock.Count(magazine.LoadedAmmoIdentifiers.Select(id => id.Value));
        if (!Stock.CanAdd(returned)) { return false; }
        var original = magazine.LoadedAmmoIdentifiersArray;
        try { magazine.UnLoadAmmoArray(out _); }
        catch (Exception e)
        {
            RestoreMagazine(magazine, original);
            VanillaComponentsExpanded.VCEPlugin.DebugConsole.AddWarning($"AmmoLoader unload rolled back: {e.Message}");
            return false;
        }
        Stock.TryAdd(returned);
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
        observedTarget = Target?.Item.ID ?? 0;
        observedRounds = Target?.LoadedAmmoIdentifiers.ToArray() ?? [];
        PublishState();
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
        base.Load(element, usePrefabValues, idRemap, isItemSwap);
        var saved = element?.Element.Element("Stock");
        try { Stock.Load(saved); invalidStock = null; }
        catch (Exception e) when (e is FormatException or OverflowException)
        {
            invalidStock = saved == null ? null : new XElement(saved);
            VanillaComponentsExpanded.VCEPlugin.DebugConsole.AddWarning($"AmmoLoader stock preserved but disabled: {e.Message}");
        }
    }

    private enum Command : byte { Refresh, Load, Unload, Withdraw }
    private sealed record Request(Command Command, uint Revision, ushort Target, AmmoRun[] Plan) : IEventData;
    private sealed record Snapshot(uint Revision, Dictionary<string, int> Stock);
    private sealed record SnapshotPage(uint Revision, int Index, int Count, string Data) : IEventData;

    private SnapshotPage[] CapturePages()
    {
        var snapshot = new Snapshot(revision, new Dictionary<string, int>(Stock.Counts));
        string json = JsonSerializer.Serialize(snapshot);
        const int charsPerPage = 128;
        int pages = (json.Length + charsPerPage - 1) / charsPerPage;
        return Enumerable.Range(0, pages).Select(i => new SnapshotPage(revision, i, pages,
            json.Substring(i * charsPerPage, Math.Min(charsPerPage, json.Length - i * charsPerPage)))).ToArray();
    }
}
