using System.Text.Json;
using System.Xml.Linq;
using Barotrauma.Items.Components;
using Barotrauma.Networking;
using VCE_VirtualizedMagazine;

namespace VCE.AmmoLoading;

public sealed partial class AmmoLoader : ItemComponent, IServerSerializable, IClientSerializable
{
    public AmmoStock Stock { get; private set; } = new();
    private ItemContainer? inputContainer, targetContainer;
    private XElement? invalidStock;
    private uint revision;
    private float scanTimer;
    private ushort observedTarget;
    private Identifier[] observedRounds = [];

    [Serialize(0, IsPropertySaveable.Yes)]
    public int InputContainerIndex { get; set; }

    [Serialize(1, IsPropertySaveable.Yes)]
    public int TargetContainerIndex { get; set; }

    public VirtualizedMagazine? Target => targetContainer?.Inventory?.GetItemAt(0)?.GetComponent<VirtualizedMagazine>();
    private bool IsAuthority => GameMain.NetworkMember is not { IsClient: true };
    private bool Ready => invalidStock == null && inputContainer != null && targetContainer != null &&
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
        ItemPrefab.Prefabs.TryGet(id.ToIdentifier(), out var prefab) &&
        prefab.ConfigElement.Elements().Any(e => e.Name.ToString().Equals("Projectile", StringComparison.OrdinalIgnoreCase));

    public static bool IsCompatible(VirtualizedMagazine? magazine, string id)
    {
        if (!IsProjectile(id)) { return false; }
        var prefab = (ItemPrefab)ItemPrefab.FindByIdentifier(id.ToIdentifier());
        return magazine == null || magazine.AllowedAmmoTags.Count == 0 ||
            VirtualizedMagazine.PrefabHasTag(prefab, magazine.AllowedAmmoTags);
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
                var package = source.GetComponent<AmmoPackage>();
                if (package == null || source.Removed || source.IsInRemoveQueue) { continue; }
                if (package.Redeemed) { spawner.AddItemToRemoveQueue(source); continue; }
                string id = package.ProjectileIdentifier.Value;
                if (source.Condition <= 0 || !IsProjectile(id) || source.ContainedItems.Any()) { continue; }
                if (!Stock.TryAdd(new Dictionary<string, int> { [id] = package.Amount })) { continue; }
                package.Redeemed = true;
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
        if (!Ready || magazine == null || magazine.Item.ID != targetId || magazine.LoadedCount != 0 ||
            !AmmoPlan.IsValid(plan, magazine.MaxSize) || plan.Any(r => !IsCompatible(magazine, r.Id)))
        {
            return false;
        }
        var rounds = AmmoPlan.Expand(plan).ToArray();
        var demand = AmmoStock.Count(rounds);
        if (!Stock.CanTake(demand)) { return false; }
        // The UI is top-first; the magazine API pushes bottom-first.
        var toLoad = rounds.Reverse().Select(id => id.ToIdentifier()).ToList();
        try { magazine.LoadAmmoArray(ref toLoad); }
        catch (Exception e)
        {
            RestoreMagazine(magazine, []);
            VanillaComponentsExpanded.VCEPlugin.DebugConsole.AddWarning($"AmmoLoader load rolled back: {e.Message}");
            return false;
        }
        if (toLoad.Count != 0)
        {
            RestoreMagazine(magazine, []);
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
        foreach (var id in rounds) { magazine.LoadedAmmoIdentifiers.Push(id); }
        magazine.Item.Condition = rounds.Length;
        try { magazine.UpdateAmmoData(); }
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

    private enum Command : byte { Refresh, Load, Unload }
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
