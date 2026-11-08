using System.Xml.Linq;
using VCE_VirtualizedMagazine;
using VCE.AmmoLoading;

int checks = 0;
void Check(bool condition, string message)
{
    checks++;
    if (!condition) { throw new Exception(message); }
}
Dictionary<string, int> Amount(string id, int count) => new() { [id] = count };

var stock = new AmmoStock();
Check(stock.TryAdd(Amount("a", 120)) && stock.TryAdd(Amount("b", 24)), "package deposit");
Check(stock["A"] == 120, "case-insensitive identity");
Check(!stock.TryAdd(Amount("a", -1)), "negative deposit");
Check(!stock.TryTake(new Dictionary<string, int> { ["a"] = 1, ["b"] = 25 }), "reject entire insufficient plan");
Check(stock["a"] == 120 && stock["b"] == 24, "failed plan must not deduct");
Check(!stock.TryTake(new Dictionary<string, int> { ["a"] = 100, ["A"] = 100 }), "case alias double debit");
Check(!stock.TryAdd(new Dictionary<string, int> { ["a"] = int.MaxValue - 120, ["A"] = 1 }), "case alias overflow");

AmmoRun[] plan = [new("a", 2), new("b", 1), new("a", 1)];
Check(AmmoPlan.IsValid(plan, 30), "valid mixed plan");
Check(!AmmoPlan.IsValid(plan, 3), "capacity limit");
Check(!AmmoPlan.IsValid([new("a", int.MaxValue), new("b", int.MaxValue)], 30), "count overflow");
Check(!AmmoPlan.IsValid([null!], 30), "malformed preset");
Check(!AmmoPlan.IsValid(Enumerable.Repeat(new AmmoRun("a", 1), 97).ToArray(), 4096), "network group limit");
var feedOrder = AmmoPlan.Expand(plan).ToArray();
var magazine = new Stack<string>(feedOrder.Reverse());
Check(magazine.SequenceEqual(new[] { "a", "a", "b", "a" }), "top-first plan must survive bottom-first insertion");
Check(stock.TryTake(AmmoStock.Count(feedOrder)), "load deduction");
Check(stock["a"] == 117 && stock["b"] == 23, "exact mixed debit");
Check(stock.TryAdd(AmmoStock.Count(magazine)), "unload return");
magazine.Clear();
Check(stock["a"] == 120 && stock["b"] == 24, "load/unload conservation");
Check(AmmoPlan.Compact(new[] { "a", "A", "b", "a" }).SequenceEqual(plan), "merge only adjacent identical rounds");

Check(stock.TryAdd(Amount("missing_mod_round", 7)), "unknown mod identifiers retained");
var saved = stock.Save();
stock.Load(saved);
stock.Load(saved);
Check(stock["a"] == 120 && stock["missing_mod_round"] == 7, "save/load idempotence and missing mods");
try
{
    stock.Load(XElement.Parse("<Stock><Ammo id='a' count='1'/><Ammo id='A' count='2'/></Stock>"));
    Check(false, "duplicate saved identity accepted");
}
catch (FormatException) { Check(stock["a"] == 120, "bad save must not replace stock"); }
var full = new AmmoStock();
Check(full.TryAdd(Amount("a", int.MaxValue)), "max stock");
Check(!full.TryAdd(new Dictionary<string, int> { ["b"] = 1, ["a"] = 1 }) && full["b"] == 0, "atomic overflow rejection");

var random = new Random(41);
for (int trial = 0; trial < 1000; trial++)
{
    string[] sequence = Enumerable.Range(0, random.Next(1, 100)).Select(_ => random.Next(2) == 0 ? "a" : "b").ToArray();
    var compact = AmmoPlan.Compact(sequence);
    Check(AmmoPlan.Expand(compact).SequenceEqual(sequence), "mixed run roundtrip");
    var demand = AmmoStock.Count(sequence);
    var before = stock.Save().ToString();
    if (stock.TryTake(demand))
    {
        Check(stock.TryAdd(demand), "refund after successful debit");
    }
    Check(stock.Save().ToString() == before, "random load/unload conservation");
}
Console.WriteLine($"Ammo loader regression: {checks} checks passed.");

var bulletA = new ItemPrefab("a", 1, "compatible");
var bulletB = new ItemPrefab("b", 2, "compatible");
var wrongBullet = new ItemPrefab("wrong", 3, "different");
ItemPrefab.Prefabs.Values.AddRange([bulletA, bulletB, wrongBullet]);
var machine = new Item(10, bulletA);
var intake = new ItemContainer(machine, 6);
var targetSlot = new ItemContainer(machine, 1);
var loader = new AmmoLoader(machine, new(new XElement("AmmoLoader"))) { TargetContainerIndex = 1 };
machine.Components.AddRange([intake, targetSlot, loader]);
loader.OnItemLoaded();
var magItem = new Item(20, bulletA);
var mag = new VCE_VirtualizedMagazine.VirtualizedMagazine(magItem);
magItem.Components.Add(mag);
targetSlot.Inventory.AllItems.Add(magItem);
var packItem = new Item(30, bulletA) { Condition = 120, MaxCondition = 120 };
var pack = new VirtualizedAmmoStorage(packItem, new(XElement.Parse("<VirtualizedAmmoStorage ProjectileIdentifier='a' />")));
packItem.Components.Add(pack);
intake.Inventory.AllItems.Add(packItem);
loader.Update(1, new Camera());
Check(loader.Stock["a"] == 120 && packItem.Condition == 0 && packItem.IsInRemoveQueue, "deposit drains VCE storage before deletion");
packItem.IsInRemoveQueue = false;
loader.Update(1, new Camera());
Check(loader.Stock["a"] == 120 && packItem.IsInRemoveQueue, "queued/saved package cannot redeem twice");

uint Revision() => (uint)loader.ServerGetEventData().GetType().GetProperty("Revision")!.GetValue(loader.ServerGetEventData())!;
void Send(byte command, uint rev, ushort target, bool allowed = true, params (uint Id, ushort Count)[] groups)
{
    var msg = new Message();
    msg.WriteByte(command); msg.WriteUInt32(rev); msg.WriteUInt16(target); msg.WriteByte((byte)groups.Length);
    foreach (var group in groups) { msg.WriteUInt32(group.Id); msg.WriteUInt16(group.Count); }
    loader.ServerEventRead(msg.Rewind(), new Client { Allowed = allowed });
    Timing.TotalTime++;
}
loader.Stock.TryAdd(Amount("b", 24));
uint beforeLoad = Revision();
Send(1, beforeLoad, 20, false, (1, 2), (2, 1));
Check(mag.LoadedCount == 0 && loader.Stock["a"] == 120, "inaccessible client rejected");
Send(1, beforeLoad, 21, true, (1, 2));
Check(mag.LoadedCount == 0, "stale target rejected");
Send(1, beforeLoad, 20, true, (3, 1));
Check(mag.LoadedCount == 0, "incompatible type rejected");
Send(1, beforeLoad, 20, true, (1, 2), (2, 1), (1, 1));
Check(mag.LoadedAmmoIdentifiers.Select(id => id.Value).SequenceEqual(new[] { "a", "a", "b", "a" }), "real loader preserves feed order");
Check(loader.Stock["a"] == 117 && loader.Stock["b"] == 23, "real loader exact debit");
Send(1, beforeLoad, 20, true, (1, 2), (2, 1), (1, 1));
Check(mag.LoadedCount == 4 && loader.Stock["a"] == 117, "replayed command cannot load twice");
uint beforeUnload = Revision();
Send(2, beforeUnload, 20);
Send(2, beforeUnload, 20);
Check(mag.LoadedCount == 0 && loader.Stock["a"] == 120 && loader.Stock["b"] == 24, "repeated unload returns once");
mag.MaxSize = 6;
Send(1, Revision(), 20, true, (2, 1), (1, 1));
uint beforeTopUp = Revision();
mag.ThrowOnRefresh = true;
Send(1, beforeTopUp, 20, true, (3, 2), (1, 3), (2, 2));
Check(mag.LoadedAmmoIdentifiers.Select(id => id.Value).SequenceEqual(new[] { "b", "a" }) &&
    loader.Stock["a"] == 119 && loader.Stock["b"] == 23 && Revision() == beforeTopUp,
    "failed top-up restores existing rounds and order without charging stock");
mag.ThrowOnRefresh = false;
Send(1, beforeTopUp, 20, true, (3, 2), (1, 3), (2, 2));
Check(mag.LoadedAmmoIdentifiers.Select(id => id.Value).SequenceEqual(new[] { "a", "a", "b", "b", "b", "a" }),
    "top-up retains the tail, clips inside a group, and preserves the old rounds underneath");
Check(loader.Stock["a"] == 117 && loader.Stock["b"] == 21 && loader.Stock["wrong"] == 0,
    "top-up charges only inserted rounds, ignoring incompatible excess");
uint fullRevision = Revision();
Send(1, fullRevision, 20, true, (1, 1));
Check(mag.LoadedCount == 6 && loader.Stock["a"] == 117 && Revision() == fullRevision,
    "a full magazine rejects loading without changing stock or revision");
Send(2, Revision(), 20);
Check(loader.Stock["a"] == 120 && loader.Stock["b"] == 24, "top-up/unload conserves both old and new rounds");
Send(1, Revision(), 20, true, (3, 1), (2, 100), (1, 6));
Check(mag.LoadedCount == 6 && mag.LoadedAmmoIdentifiers.All(id => id.Value == "a") &&
    loader.Stock["a"] == 114 && loader.Stock["b"] == 24,
    "an oversized plan fills an empty magazine without requiring stock or compatibility for excess rounds");
Send(2, Revision(), 20);
mag.MaxSize = 30;
Send(1, Revision(), 20, true, (1, 26), (2, 5));
Check(mag.LoadedAmmoIdentifiers.Select(id => id.Value).SequenceEqual(Enumerable.Repeat("a", 25).Concat(Enumerable.Repeat("b", 5))) &&
    loader.Stock["a"] == 95 && loader.Stock["b"] == 19,
    "a 31-round plan in a 30-round magazine drops round 1 and retains round 31 with exact stock debit");
Send(2, Revision(), 20);
uint beforeIncompatibleTail = Revision();
Send(1, beforeIncompatibleTail, 20, true, (1, 30), (3, 1));
Check(mag.LoadedCount == 0 && loader.Stock["a"] == 120 && loader.Stock["b"] == 24 && Revision() == beforeIncompatibleTail,
    "incompatible ammunition in the retained tail rejects the entire load");
Send(1, Revision(), 20, true, (1, 1));
uint beforeShortage = Revision();
Send(1, beforeShortage, 20, true, (2, 25));
Check(mag.LoadedCount == 1 && mag.LoadedAmmoIdentifiers.Peek().Value == "a" &&
    loader.Stock["a"] == 119 && loader.Stock["b"] == 24 && Revision() == beforeShortage,
    "insufficient stock for the fitting tail rejects the whole top-up and keeps existing rounds");
Send(1, beforeShortage, 20, true, (1, AmmoPlan.MaxRounds + 1));
Check(mag.LoadedCount == 1 && loader.Stock["a"] == 119,
    "capacity clipping does not bypass the request round limit");
Send(2, Revision(), 20);
mag.ThrowOnRefresh = true;
Send(1, Revision(), 20, true, (1, 5));
Check(mag.LoadedCount == 0 && loader.Stock["a"] == 120, "external failure rolls back load");
mag.ThrowOnRefresh = false;
Send(1, Revision(), 20, true, (1, 5));
mag.ThrowOnRefresh = true;
Send(2, Revision(), 20);
Check(mag.LoadedCount == 5 && loader.Stock["a"] == 115, "external failure rolls back unload");
mag.ThrowOnRefresh = false;
Send(2, Revision(), 20);

var save = loader.Save(new XElement("Item"));
loader.Load(new(save), false, new IdRemap(), false);
loader.Load(new(save), false, new IdRemap(), false);
Check(loader.Stock["a"] == 120, "machine save/load replaces stock");
for (int i = 0; i < 300; i++) { loader.Stock.TryAdd(Amount("mod_" + i, 100000)); }
Send(0, Revision(), 20);
foreach (var data in machine.Events)
{
    var msg = new Message();
    loader.ServerEventWrite(msg, new Client(), new NetEntityEvent.Wrapper(data));
    Check(msg.Length < 1024, "snapshot page exceeds game event budget");
}
Console.WriteLine($"Ammo loader including actual server handler: {checks} checks passed (game boundary stubbed).");

var partialPackItem = new Item(31, bulletA) { Condition = 7, MaxCondition = 120 };
partialPackItem.Components.Add(new VirtualizedAmmoStorage(partialPackItem,
    new(XElement.Parse("<VirtualizedAmmoStorage ProjectileIdentifier='a' />"))));
var unrelatedItem = new Item(32, bulletA);
intake.Inventory.AllItems.AddRange([partialPackItem, unrelatedItem]);
int beforeDeposit = loader.Stock["a"];
loader.Update(1, new Camera());
Check(loader.Stock["a"] == beforeDeposit + 7 && partialPackItem.Condition == 0,
    "existing partially used VCE storage deposits its remaining rounds, not its capacity");
Check(!unrelatedItem.IsInRemoveQueue && unrelatedItem.Condition == 100, "intake ignores items without VCE storage");
Console.WriteLine($"Backend including existing VCE storage: {checks} checks passed.");

ItemPrefab Package(string id, uint number, float health, string ammo, bool tagged = true, bool container = false)
{
    var prefab = new ItemPrefab(id, number, tagged ? ["vceammopackage"] : [])
    {
        Health = health,
        ConfigElement = new(new XElement("Item",
            new XElement("VirtualizedAmmoStorage", new XAttribute("ProjectileIdentifier", ammo)),
            container ? new XElement("ItemContainer") : null))
    };
    ItemPrefab.Prefabs.Values.Add(prefab);
    return prefab;
}
var largest = Package("a_package", 10, 120, "a");
Package("z_package", 11, 120, "a");
Package("small_package", 12, 24, "a");
Package("untagged_package", 13, 1000, "a", tagged: false);
Package("container_package", 14, 1000, "a", container: true);
Package("infinite_package", 15, float.PositiveInfinity, "a");
Package("oversized_package", 16, float.MaxValue, "a");
var bPackage = Package("b_package", 17, 100, "b");
Check(AmmoLoader.FindWithdrawalPackage("a") == largest, "largest valid package wins with a stable identifier tie-break");
Check(AmmoLoader.FindWithdrawalPackage("wrong") == null && AmmoLoader.FindWithdrawalPackage("unknown") == null,
    "missing packages and unknown projectile types cannot be withdrawn");
machine = new Item(40, bulletA);
intake = new ItemContainer(machine, 6);
var pickup = new ItemContainer(machine, 3);
targetSlot = new ItemContainer(machine, 1);
loader = new AmmoLoader(machine, new(new XElement("AmmoLoader")));
machine.Components.AddRange([intake, pickup, targetSlot, loader]);
loader.OnItemLoaded();
Check(loader.InputContainer == intake && loader.OutputContainer == pickup && loader.TargetContainer == targetSlot,
    "default container indices match the left-to-right intake, pickup, magazine order");
loader.Stock.TryAdd(Amount("a", 300));
loader.Stock.TryAdd(Amount("b", 37));
Entity.Spawner = new();
uint beforeWithdraw = Revision();
Send(3, beforeWithdraw, 0, false, (1, 1));
Send(3, beforeWithdraw, 0, true, (1, 2));
Send(3, beforeWithdraw, 0, true, (1, 1), (2, 1));
Send(3, beforeWithdraw, 0, true, (99, 1));
Check(Entity.Spawner.Pending.Count == 0, "withdraw rejects inaccessible clients, forged counts, multiple types and unknown identifiers");
Send(3, beforeWithdraw, 0, true, (1, 1));
Send(3, beforeWithdraw, 0, true, (1, 1));
Check(Entity.Spawner.Pending.Count == 1 && loader.Stock["a"] == 300,
    "concurrent withdrawal requests queue one package without charging unspawned stock");
var pendingSave = loader.Save(new XElement("Item"));
Check((int)pendingSave.Element("Stock")!.Elements("Ammo").Single(e => (string?)e.Attribute("id") == "a").Attribute("count")! == 300,
    "saving before the spawn retains all stock");
Entity.Spawner.ProcessQueue();
Check(pickup.Inventory.AllItems.Single().Prefab == largest && pickup.Inventory.AllItems[0].Condition == 120 && loader.Stock["a"] == 180,
    "withdraw creates a full largest package with exact debit and no magazine");
Send(3, beforeWithdraw, 0, true, (1, 1));
Check(Entity.Spawner.Pending.Count == 0, "a completed withdrawal cannot be replayed with its old revision");
Send(3, Revision(), 0, true, (1, 1));
Entity.Spawner.ProcessQueue();
Send(3, Revision(), 0, true, (2, 1));
Entity.Spawner.ProcessQueue();
Check(pickup.Inventory.AllItems.Count == 3 && pickup.Inventory.AllItems[^1].Prefab == bPackage &&
    pickup.Inventory.AllItems[^1].Condition == 37 && loader.Stock["b"] == 0 && loader.Stock["a"] == 60,
    "custom pickup capacity holds multiple packages, including a partial final package");
Send(3, Revision(), 0, true, (1, 1));
Check(Entity.Spawner.Pending.Count == 0 && loader.Stock["a"] == 60, "full pickup slots cannot consume stock");
var returnedPackage = pickup.Inventory.AllItems[0];
pickup.Inventory.AllItems.Remove(returnedPackage);
returnedPackage.ParentInventory = intake.Inventory;
intake.Inventory.AllItems.Add(returnedPackage);
loader.Update(1, new Camera());
Check(loader.Stock["a"] == 180 && returnedPackage.Condition == 0,
    "withdrawn packages can be redeposited without creating or losing ammunition");
intake.Inventory.AllItems.Clear();
pickup.Inventory.AllItems.Clear();

Send(3, Revision(), 0, true, (1, 1));
pickup.Inventory.Accepts = _ => false;
Entity.Spawner.ProcessQueue();
Check(loader.Stock["a"] == 180 && pickup.Inventory.AllItems.Count == 0 && Entity.Spawner.Pending.Count == 0,
    "a slot becoming unavailable before spawn cancels without a debit or stuck pending flag");
pickup.Inventory.Accepts = null;
pickup.Inventory.RejectInsertion = true;
Send(3, Revision(), 0, true, (1, 1));
Entity.Spawner.ProcessQueue();
Check(loader.Stock["a"] == 180 && Entity.Spawner.Spawned[^1].Removed && Entity.Spawner.Spawned[^1].Condition == 0,
    "an item that fails actual insertion is removed without granting free ammunition or charging stock");
pickup.Inventory.RejectInsertion = false;
Send(3, Revision(), 0, true, (1, 1));
machine.Condition = 0;
Entity.Spawner.ProcessQueue();
Check(loader.Stock["a"] == 180 && pickup.Inventory.AllItems.Count == 0, "a machine breaking while queued cancels delivery");
machine.Condition = 100;
Send(3, Revision(), 0, true, (1, 1));
Entity.Spawner.Pending.Clear();
loader.Load(new(loader.Save(new XElement("Item"))), false, new IdRemap(), false);
Check(loader.Stock["a"] == 180, "discarding the spawn queue and reloading cannot lose reserved rounds");

loader.Stock.Load(new XElement("Stock", new XElement("Ammo", new XAttribute("id", "a"), new XAttribute("count", 50))));
mag = new VirtualizedMagazine(magItem);
magItem.Components.Clear();
magItem.Components.Add(mag);
targetSlot.Inventory.AllItems.Add(magItem);
Send(3, Revision(), 20, true, (1, 1));
Send(1, Revision(), 20, true, (1, 25));
Entity.Spawner.ProcessQueue();
Check(mag.LoadedCount == 25 && pickup.Inventory.AllItems.Single().Condition == 25 && loader.Stock["a"] == 0,
    "a load between queueing and delivery leaves only current stock in the package, conserving all 50 rounds");
var completedSave = loader.Save(new XElement("Item"));
loader.Load(new(completedSave), false, new IdRemap(), false);
Check(loader.Stock["a"] == 0 && pickup.Inventory.AllItems.Single().Condition == 25,
    "reloading completed stock does not restore ammunition already packed");
Package("large_condition_package", 18, 20_000_000, "wrong");
loader.Stock.TryAdd(Amount("wrong", 16_777_217));
Send(3, Revision(), 20, true, (3, 1));
Entity.Spawner.ProcessQueue();
Check(loader.Stock["wrong"] == 16_777_217 && Entity.Spawner.Spawned[^1].Removed,
    "a count that cannot be represented exactly by Condition must not lose or create ammunition");
loader.OutputContainerIndex = 0;
loader.OnItemLoaded();
Check(loader.OutputContainer == null && loader.Ready, "overlapping output and intake disables withdrawal without disabling magazine loading");
Console.WriteLine($"Backend including package withdrawal: {checks} checks passed (spawn queue and game boundary stubbed).");

machine = new Item(50, bulletA);
intake = new ItemContainer(machine, 6);
pickup = new ItemContainer(machine, 3);
targetSlot = new ItemContainer(machine, 1);
loader = new AmmoLoader(machine, new(new XElement("AmmoLoader")));
machine.Components.AddRange([intake, pickup, targetSlot, loader]);
loader.OnItemLoaded();
mag = new VirtualizedMagazine(magItem);
magItem.Components.Clear();
magItem.Components.Add(mag);
targetSlot.Inventory.AllItems.Add(magItem);
var box = new Item(51, largest) { Condition = 2, MaxCondition = 100 };
var otherBox = new Item(52, largest) { Condition = 3, MaxCondition = 100 };
box.Components.Add(new VirtualizedAmmoStorage(box, new(XElement.Parse("<VirtualizedAmmoStorage ProjectileIdentifier='a' />"))));
intake.Inventory.AllItems.AddRange([box, otherBox]);
var costs = new Dictionary<string, double> { ["a"] = 0.5, ["b"] = 1 };
loader.SupplyResolver = item => item == box || item == otherBox ? new("shared", costs) : null;
loader.Update(1, new Camera());
Check(box.Condition == 2 && !box.IsInRemoveQueue && loader.Stock.Counts.Count == 0,
    "recognized supplies stay in intake even if they also have VirtualizedAmmoStorage");
loader.Stock.TryAdd(Amount("a", 2));
uint supplyRevision = Revision();
Send(1, supplyRevision, 20, true, (1, 8), (2, 3));
Check(mag.LoadedCount == 0 && box.Condition == 2 && otherBox.Condition == 3 && loader.Stock["a"] == 2,
    "individually affordable calibers cannot overspend their shared pool in one plan");
mag.ThrowOnRefresh = true;
Send(1, Revision(), 20, true, (1, 6), (2, 3));
Check(mag.LoadedCount == 0 && box.Condition == 2 && otherBox.Condition == 3 && loader.Stock["a"] == 2,
    "magazine failure charges neither supplies nor stored rounds");
mag.ThrowOnRefresh = false;
Send(1, Revision(), 20, false, (1, 6), (2, 3));
Check(mag.LoadedCount == 0 && box.Condition == 2, "inaccessible supply load rejected");
otherBox.BeforeConditionSet = value => { if (value < 3) { throw new InvalidOperationException("Injected supply debit failure"); } };
Send(1, Revision(), 20, true, (1, 6), (2, 3));
Check(mag.LoadedCount == 0 && box.Condition == 2 && otherBox.Condition == 3 && loader.Stock["a"] == 2 &&
    box.BrokenEffects == 0 && otherBox.BrokenEffects == 0,
    "a later box debit failure restores earlier boxes, concrete stock and the magazine");
otherBox.BeforeConditionSet = null;
otherBox.IgnoreConditionChanges = true;
Send(1, Revision(), 20, true, (1, 6), (2, 3));
Check(mag.LoadedCount == 0 && box.Condition == 2 && otherBox.Condition == 3 && box.BrokenEffects == 0 && loader.Stock["a"] == 2,
    "an invulnerable source silently rejecting Condition changes cannot grant free ammo or destroy earlier boxes");
otherBox.IgnoreConditionChanges = false;
Send(1, supplyRevision, 20, true, (1, 6), (2, 3));
Check(mag.LoadedCount == 9 && box.Condition == 0 && otherBox.Condition == 0 && loader.Stock["a"] == 0 &&
    mag.LoadedAmmoIdentifiers.Select(i => i.Value).SequenceEqual(Enumerable.Repeat("a", 6).Concat(Enumerable.Repeat("b", 3))),
    "stock is used first and mixed shortages share and exhaust multiple boxes in deterministic order");
Check(box.BrokenEffects == 1 && otherBox.BrokenEffects == 1, "native exhaustion effects run once only after all supply debits commit");
Send(1, supplyRevision, 20, true, (1, 6), (2, 3));
Check(mag.LoadedCount == 9, "a supply load cannot be replayed");
Send(2, Revision(), 20);
Check(loader.Stock["a"] == 6 && loader.Stock["b"] == 3 && box.Condition == 0 && otherBox.Condition == 0,
    "unloading returns concrete ammunition without refunding universal reserves");
box.Condition = 10;
loader.Update(1, new Camera());
Entity.Spawner = new();
Send(3, Revision(), 0, true, (1, 1));
Entity.Spawner.ProcessQueue();
Check(pickup.Inventory.AllItems.Single().Condition == 6 && box.Condition == 10 && loader.Stock["a"] == 0,
    "package withdrawal uses only concrete stock and never converts shared reserves");
loader.Stock.Load(null);
mag.MaxSize = 3;
Send(1, Revision(), 20, true, (3, 100), (1, 1), (2, 2));
Check(mag.LoadedCount == 3 && box.Condition == 7.5f && otherBox.Condition == 0,
    "supply cost covers only the fitting plan tail, not excess or incompatible discarded rounds");
Send(2, Revision(), 20);
loader.Stock.Load(null);
intake.Inventory.AllItems.Remove(box);
Send(1, Revision(), 20, true, (1, 1));
Check(mag.LoadedCount == 0 && box.Condition == 7.5f, "a box removed before the periodic scan cannot still supply ammunition");
intake.Inventory.AllItems.Add(box);
box.Condition = 4;
loader.Update(1, new Camera());
supplyRevision = Revision();
box.Condition = 3;
loader.Update(1, new Camera());
Check(Revision() > supplyRevision, "external Condition changes invalidate the published supply state");
Send(1, supplyRevision, 20, true, (1, 1));
Check(mag.LoadedCount == 0 && box.Condition == 3, "stale supply revision rejected");
GameMain.NetworkMember = new() { IsClient = true };
Send(1, Revision(), 20, true, (1, 1));
Check(mag.LoadedCount == 0 && box.Condition == 3, "only the authority can debit supplies");
GameMain.NetworkMember = null;

foreach (double invalidCost in new[] { 0, -1, double.NaN, double.PositiveInfinity, 1e-100 })
{
    costs["a"] = invalidCost;
    Send(1, Revision(), 20, true, (1, 1));
    Check(mag.LoadedCount == 0 && box.Condition == 3, "invalid or unrepresentable costs cannot provide free rounds");
}
costs["a"] = 0.5;
loader.SupplyResolver = item => new(item.ID.ToString(), costs);
Send(1, Revision(), 20, true, (1, 1));
Check(mag.LoadedCount == 0 && box.Condition == 3, "overlapping projectile mappings across pools fail closed");
loader.SupplyResolver = item => new("shared", item == box ? costs : new Dictionary<string, double> { ["a"] = 1 });
Send(1, Revision(), 20, true, (1, 1));
Check(mag.LoadedCount == 0 && box.Condition == 3, "inconsistent costs within one pool fail closed");
loader.SupplyResolver = _ => throw new InvalidOperationException("Injected adapter failure");
loader.Update(1, new Camera());
Check(!box.IsInRemoveQueue && box.Condition == 3 && loader.Stock.Counts.Count == 0,
    "an adapter failure cannot accidentally deposit and destroy a supply box");
loader.Stock.TryAdd(Amount("a", 1));
Send(1, Revision(), 20, true, (1, 1));
Check(mag.LoadedCount == 1 && box.Condition == 3, "adapter failure still permits loading existing concrete stock");
loader.SupplyResolver = item => new("shared", costs);
Send(2, Revision(), 20);
loader.Update(1, new Camera());
var supplySave = loader.Save(new XElement("Item"));
Check(supplySave.Elements().All(e => e.Name == "Stock"), "supply reserves are saved on their physical items, not duplicated in machine stock");
loader.Load(new(supplySave), false, new IdRemap(), false);
Send(1, Revision(), 20, true, (1, 2));
Check(mag.LoadedCount == 2 && box.Condition == 2.5f && loader.Stock["a"] == 0,
    "restored concrete stock and live item reserves remain separate and usable");
Console.WriteLine($"Backend including custom shared supplies: {checks} checks passed (game boundary stubbed).");

machine = new Item(70, bulletA);
intake = new ItemContainer(machine, 6);
pickup = new ItemContainer(machine, 6);
targetSlot = new ItemContainer(machine, 1);
loader = new AmmoLoader(machine, new(new XElement("AmmoLoader"))) { UseSupplyStorage = true };
machine.Components.AddRange([intake, pickup, targetSlot, loader]);
loader.OnItemLoaded();
mag = new VirtualizedMagazine(magItem);
magItem.Components.Clear();
magItem.Components.Add(mag);
targetSlot.Inventory.AllItems.Add(magItem);
box = new Item(71, largest) { MaxCondition = 10, Condition = 9 };
otherBox = new Item(72, largest) { MaxCondition = 10, Condition = 9.25f };
intake.Inventory.AllItems.AddRange([box, otherBox]);
costs = new Dictionary<string, double> { ["a"] = 0.5, ["b"] = 1 };
loader.SupplyResolver = item => item == box || item == otherBox ? new("shared", costs) : null;
Entity.Spawner = new();
void FillMagazine(params string[] ids)
{
    mag.LoadedAmmoIdentifiers.Clear();
    foreach (string id in ids.Reverse()) { mag.LoadedAmmoIdentifiers.Push(id.ToIdentifier()); }
    loader.Update(1, new Camera());
}
FillMagazine("a", "a", "a", "b", "b");
Send(2, Revision(), 20);
Check(mag.LoadedCount == 0 && box.Condition == 10 && otherBox.Condition == 9.75f && loader.Stock["a"] == 0 && loader.Stock["b"] == 2,
    "unload refills shared boxes across source boundaries and returns only excess whole rounds to stock");
intake.Inventory.AllItems.Clear();
FillMagazine("a", "b");
Send(2, Revision(), 20);
Check(mag.LoadedCount == 0 && loader.Stock["a"] == 1 && loader.Stock["b"] == 3,
    "missing boxes fall back to concrete stock without losing mixed ammunition");
intake.Inventory.AllItems.AddRange([box, otherBox]);
box.Condition = otherBox.Condition = 10;
FillMagazine("a", "b");
Send(2, Revision(), 20);
Check(mag.LoadedCount == 0 && box.Condition == 10 && otherBox.Condition == 10 && loader.Stock["a"] == 2 && loader.Stock["b"] == 4,
    "full boxes fall back to stock without overfilling");
loader.Stock.Load(null);
box.Condition = otherBox.Condition = 9;
FillMagazine("b", "a", "a", "a", "a");
var originalReturnOrder = mag.LoadedAmmoIdentifiers.ToArray();
otherBox.BeforeConditionSet = value => { if (value > 9) { throw new InvalidOperationException("Injected credit failure"); } };
Send(2, Revision(), 20);
Check(mag.LoadedAmmoIdentifiers.SequenceEqual(originalReturnOrder) && box.Condition == 9 && otherBox.Condition == 9 && loader.Stock.Counts.Count == 0,
    "a later refund failure restores earlier boxes, the complete magazine order and overflow stock");
otherBox.BeforeConditionSet = null;
otherBox.IgnoreConditionChanges = true;
Send(2, Revision(), 20);
Check(mag.LoadedAmmoIdentifiers.SequenceEqual(originalReturnOrder) && box.Condition == 9 && loader.Stock.Counts.Count == 0,
    "a silently rejected credit cannot consume magazine rounds");
otherBox.IgnoreConditionChanges = false;
GameMain.NetworkMember = new() { IsClient = true };
Send(2, Revision(), 20);
Check(mag.LoadedAmmoIdentifiers.SequenceEqual(originalReturnOrder) && box.Condition == 9, "clients cannot credit supplies or unload locally");
GameMain.NetworkMember = null;
loader.Stock.TryAdd(Amount("b", int.MaxValue));
Send(2, Revision(), 20);
Check(mag.LoadedAmmoIdentifiers.SequenceEqual(originalReturnOrder) && box.Condition == 9 && otherBox.Condition == 9,
    "overflow fallback rejects the entire return before crediting any boxes");
loader.Stock.Load(null);
FillMagazine();
box.Condition = 2;
otherBox.Condition = 3;
loader.Stock.TryAdd(Amount("a", 2));
loader.Update(1, new Camera());
Send(3, Revision(), 20, true, (1, 1));
Entity.Spawner.ProcessQueue();
Check(pickup.Inventory.AllItems.Single().Condition == 12 && loader.Stock["a"] == 0 && box.Condition == 0 && otherBox.Condition == 0 &&
    box.BrokenEffects == 0 && otherBox.BrokenEffects == 0,
    "package withdrawal uses stock then shared reserves, retaining depleted boxes for refilling");
returnedPackage = pickup.Inventory.AllItems.Single();
pickup.Inventory.AllItems.Clear();
returnedPackage.ParentInventory = intake.Inventory;
intake.Inventory.AllItems.Add(returnedPackage);
loader.Update(1, new Camera());
Check(returnedPackage.Condition == 0 && returnedPackage.IsInRemoveQueue && box.Condition == 6 && otherBox.Condition == 0 && loader.Stock.Counts.Count == 0,
    "redepositing the supplied package refills boxes without creating internal stock");
intake.Inventory.AllItems.Remove(returnedPackage);
box.Condition = 2;
otherBox.Condition = 0;
loader.Stock.TryAdd(Amount("a", 1));
loader.Update(1, new Camera());
Send(3, Revision(), 20, true, (1, 1));
intake.Inventory.AllItems.Remove(box);
Entity.Spawner.ProcessQueue();
Check(pickup.Inventory.AllItems.Single().Condition == 1 && loader.Stock["a"] == 0 && box.Condition == 2,
    "taking a box away while packing reduces delivery to the remaining concrete stock");
pickup.Inventory.AllItems.Clear();
intake.Inventory.AllItems.Add(box);
loader.Update(1, new Camera());
Send(3, Revision(), 20, true, (1, 1));
intake.Inventory.AllItems.Remove(box);
Entity.Spawner.ProcessQueue();
Check(pickup.Inventory.AllItems.Count == 0 && Entity.Spawner.Spawned[^1].Removed && box.Condition == 2,
    "no remaining source cancels a queued package without free ammunition");
intake.Inventory.AllItems.Add(box);
loader.Stock.TryAdd(Amount("a", 1));
loader.Update(1, new Camera());
Send(3, Revision(), 20, true, (1, 1));
box.IgnoreConditionChanges = true;
Entity.Spawner.ProcessQueue();
Check(pickup.Inventory.AllItems.Count == 0 && box.Condition == 2 && loader.Stock["a"] == 1,
    "rejected supply debit cancels package delivery and retains concrete stock");
box.IgnoreConditionChanges = false;
loader.Stock.Load(null);
costs["a"] = 1.5625 / 30;
box.MaxCondition = 100;
box.Condition = 100;
intake.Inventory.AllItems.Remove(otherBox);
loader.Update(1, new Camera());
Send(1, Revision(), 20, true, (1, 30));
Check(mag.LoadedCount == 30 && box.Condition == 98.4375f, "DDA 30-round magazine consumes exactly 1.5625 Condition");
Send(2, Revision(), 20);
Check(mag.LoadedCount == 0 && box.Condition == 100 && loader.Stock.Counts.Count == 0, "full DDA load-return roundtrip conserves box contents");
for (int cycle = 0; cycle < 30; cycle++)
{
    Send(1, Revision(), 20, true, (1, 1));
    Send(2, Revision(), 20);
    Check(mag.LoadedCount == 0 && box.Condition == 100 && loader.Stock.Counts.Count == 0, "single-round supply return must not accumulate float drift or leftover stock");
}
Console.WriteLine($"Backend including refillable supplies: {checks} checks passed (game boundary stubbed).");
