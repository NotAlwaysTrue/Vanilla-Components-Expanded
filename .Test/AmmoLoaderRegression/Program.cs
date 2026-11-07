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
