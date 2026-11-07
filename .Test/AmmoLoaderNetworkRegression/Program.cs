using VCE_VirtualizedMagazine;

int checks = 0;
void Check(bool condition, string message)
{
    checks++;
    if (!condition) { throw new Exception(message); }
}
var a = new ItemPrefab("a", 1);
var b = new ItemPrefab("b", 2);
ItemPrefab.Prefabs.Values.AddRange([a, b]);
var item = new Item(1, a);
var mag = new VirtualizedMagazine(item);
item.Components.Add(mag);

#if CLIENT
void Receive(uint revision, int total, int offset, uint[] ids)
{
    var packet = new Message();
    packet.WriteUInt32(revision);
    packet.WriteInt32(total);
    packet.WriteInt32(offset);
    foreach (uint id in ids) { packet.WriteUInt32(id); }
    mag.ClientEventRead(packet.Rewind(), 0);
}
Receive(0, 3, 0, [1, 2, 1]);
Check(mag.LoadedAmmoIdentifiersArray.SequenceEqual(new[] { a.Identifier, b.Identifier, a.Identifier }), "initial state");
Receive(0, 3, 0, [1, 2, 1]);
Check(mag.LoadedCount == 3, "duplicate state idempotence");
mag.LoadedAmmoIdentifiers.Pop();
Receive(0, 3, 0, [1, 2, 1]);
Check(mag.LoadedCount == 2, "duplicate state must not restore predicted shots");
Receive(1, 130, 128, [2, 1]);
Check(mag.LoadedCount == 2 && item.Requests.Count == 1, "partial state waits and requests remaining pages");
Receive(1, 130, 0, Enumerable.Repeat(1u, 128).ToArray());
Check(mag.LoadedCount == 130 && mag.LoadedAmmoIdentifiersArray[128] == b.Identifier, "out-of-order page reassembly");
Receive(2, 200, 0, Enumerable.Repeat(2u, 128).ToArray());
Receive(3, 1, 0, [1]);
Receive(2, 200, 128, Enumerable.Repeat(2u, 72).ToArray());
Check(mag.LoadedCount == 1 && mag.LoadedAmmoIdentifiers.Peek() == a.Identifier, "old partial snapshot cannot override newer state");
Receive(4, 0, 0, []);
Check(mag.LoadedCount == 0, "empty magazine sync");
Console.WriteLine($"Actual magazine client network: {checks} checks passed (game boundary stubbed).");

GameMain.Client = new();
var machine = new Item(2, a);
var intake = new ItemContainer(machine, 6);
var target = new ItemContainer(machine, 1);
var loader = new VCE.AmmoLoading.AmmoLoader(machine, new(new System.Xml.Linq.XElement("AmmoLoader"))) { TargetContainerIndex = 1 };
machine.Components.AddRange([intake, target, loader]);
target.Inventory.AllItems.Add(item);
loader.OnItemLoaded();
loader.UpdateClientState(1);
Check(!loader.IsSynchronized && machine.Requests.Count == 1, "backend requests its initial stock without a UI");
void ReceiveStock(uint revision, int index, int count, string data)
{
    var packet = new Message();
    packet.WriteUInt32(revision); packet.WriteInt32(index); packet.WriteInt32(count); packet.WriteString(data);
    loader.ClientEventRead(packet.Rewind(), 0);
}
ReceiveStock(0, 1, 2, "\"a\":120,\"b\":24}}");
Check(!loader.IsSynchronized && loader.Stock.Counts.Count == 0, "partial backend stock is not exposed");
ReceiveStock(0, 0, 2, "{\"Revision\":0,\"Stock\":{");
Check(loader.IsSynchronized && loader.Stock["a"] == 120 && loader.Stock["b"] == 24, "backend publishes a complete initial stock even at revision zero");
ReceiveStock(1, 0, 1, "{\"Revision\":1,\"Stock\":{\"a\":90}}");
ReceiveStock(0, 0, 1, "{\"Revision\":0,\"Stock\":{\"a\":120}}");
Check(loader.StateRevision == 1 && loader.Stock["a"] == 90, "stale stock cannot overwrite the backend snapshot");
loader.RequestLoad([new("a", 2)]);
var loadRequest = new Message();
loader.ClientEventWrite(loadRequest, new NetEntityEvent.Wrapper(machine.Requests[^1]));
loadRequest.Rewind();
Check(loadRequest.ReadByte() == 1 && loadRequest.ReadUInt32() == 1 && loadRequest.ReadUInt16() == item.ID &&
    loadRequest.ReadByte() == 1 && loadRequest.ReadUInt32() == a.UintIdentifier && loadRequest.ReadUInt16() == 2,
    "public load API owns the command encoding and observed target/revision");
int requests = machine.Requests.Count;
mag.LoadedAmmoIdentifiers.Push(a.Identifier);
loader.RequestLoad([new("a", mag.MaxSize + 1)]);
Check(machine.Requests.Count == requests + 1 && mag.LoadedCount == 1 && loader.Stock["a"] == 90,
    "client forwards oversized plans for nonempty magazines without predicting stock or magazine changes");
requests = machine.Requests.Count;
loader.RequestLoad(Enumerable.Repeat(new VCE.AmmoLoading.AmmoRun("a", 1), 256).ToArray());
Check(machine.Requests.Count == requests, "public API rejects plans that cannot be encoded safely");
loader.RequestUnload();
var unloadRequest = new Message();
loader.ClientEventWrite(unloadRequest, new NetEntityEvent.Wrapper(machine.Requests[^1]));
unloadRequest.Rewind();
Check(unloadRequest.ReadByte() == 2, "unload API sends the backend command");
Console.WriteLine($"Actual magazine and loader client network: {checks} checks passed (game boundary stubbed).");
#else
mag.LoadedAmmoIdentifiersArray = Enumerable.Range(0, 300).Select(i => i % 2 == 0 ? a.Identifier : b.Identifier).ToArray();
Check(item.Events.Count == 3, "large magazines are paged");
var received = new List<Identifier>();
uint revision = 0;
foreach (var state in item.Events)
{
    var packet = new Message();
    Check(mag.ValidateEventData(new NetEntityEvent.Wrapper(state)), "event validates");
    mag.ServerEventWrite(packet, new Client(), new NetEntityEvent.Wrapper(state));
    Check(packet.Length < 1024, "magazine event budget");
    packet.Rewind();
    revision = packet.ReadUInt32();
    int total = packet.ReadInt32();
    int offset = packet.ReadInt32();
    Check(total == 300 && offset == received.Count, "page metadata");
    for (int i = offset; i < Math.Min(offset + 128, total); i++)
    {
        received.Add(packet.ReadUInt32() == 1 ? a.Identifier : b.Identifier);
    }
}
Check(received.SequenceEqual(mag.LoadedAmmoIdentifiersArray), "server preserves full insertion order");
int before = item.Events.Count;
mag.UpdateAmmoData();
Check(item.Events.Count == before, "unchanged state does not generate events");
mag.LoadedAmmoIdentifiers.Pop();
mag.UpdateAmmoData();
Check(item.Events.Count == before + 3, "shot generates updated state");
var initial = new Message();
mag.ServerEventWrite(initial, new Client(), new NetEntityEvent.Wrapper(mag.ServerGetEventData()));
initial.Rewind();
Check(initial.ReadUInt32() > revision && initial.ReadInt32() == 299, "late join captures current state");
mag.UnLoadAmmoArray(out _);
var empty = new Message();
mag.ServerEventWrite(empty, new Client(), new NetEntityEvent.Wrapper(item.Events[^1]));
empty.Rewind();
empty.ReadUInt32();
Check(empty.ReadInt32() == 0, "unload sends empty state");
Console.WriteLine($"Actual magazine server network: {checks} checks passed (game boundary stubbed).");
#endif
