using System.Text.Json;
using Barotrauma.Networking;

namespace VCE_VirtualizedMagazine;

public sealed partial class AmmoLoader
{
    private uint receivingRevision;
    private string?[] pages = [];
    private bool hasSnapshot;
    private float refreshTimer;

    public bool IsSynchronized => GameMain.Client == null || (hasSnapshot && receivingRevision == revision && pages.All(p => p != null));

    public void UpdateClientState(float deltaTime)
    {
        refreshTimer -= deltaTime;
        if (GameMain.Client != null && refreshTimer <= 0 && !IsSynchronized)
        {
            refreshTimer = 2;
            Send(Command.Refresh);
        }
    }

    public void RequestLoad(AmmoRun[] plan)
    {
        if (!IsSynchronized || Target == null || !AmmoPlan.IsValid(plan, AmmoPlan.MaxRounds)) { return; }
        Send(Command.Load, plan);
    }
    public void RequestUnload() => Send(Command.Unload);
    public void RequestWithdraw(string id)
    {
        if (IsSynchronized && IsProjectile(id)) { Send(Command.Withdraw, [new(id, 1)]); }
    }

    public override bool ValidateEventData(NetEntityEvent.IData data) => TryExtractEventData<Request>(data, out _);

    private void Send(Command command, AmmoRun[]? plan = null)
    {
        if (GameMain.Client != null)
        {
            Item.CreateClientEvent(this, new Request(command, revision, Target?.Item.ID ?? 0, plan ?? []));
        }
        else if (command == Command.Load) { TryLoad(plan ?? [], Target?.Item.ID ?? 0); }
        else if (command == Command.Unload) { TryUnload(Target?.Item.ID ?? 0); }
        else if (command == Command.Withdraw && plan is { Length: 1 }) { TryWithdraw(plan[0].Id); }
    }

    public void ClientEventWrite(IWriteMessage msg, NetEntityEvent.IData extraData = null!)
    {
        var request = ExtractEventData<Request>(extraData);
        msg.WriteByte((byte)request.Command);
        msg.WriteUInt32(request.Revision);
        msg.WriteUInt16(request.Target);
        msg.WriteByte((byte)request.Plan.Length);
        foreach (var run in request.Plan)
        {
            msg.WriteUInt32(ItemPrefab.FindByIdentifier(run.Id.ToIdentifier())?.UintIdentifier ?? 0);
            msg.WriteUInt16((ushort)run.Count);
        }
    }

    public void ClientEventRead(IReadMessage msg, float sendingTime)
    {
        uint incomingRevision = msg.ReadUInt32();
        int index = msg.ReadInt32();
        int count = msg.ReadInt32();
        string data = msg.ReadString();
        if (count is < 1 or > 16384 || index < 0 || index >= count) { return; }
        if (hasSnapshot && incomingRevision <= revision) { return; }
        if (pages.Length == 0 || receivingRevision != incomingRevision)
        {
            if (pages.Length > 0 && incomingRevision < receivingRevision) { return; }
            receivingRevision = incomingRevision;
            pages = new string?[count];
        }
        if (pages.Length != count) { return; }
        pages[index] = data;
        if (pages.Any(p => p == null)) { return; }
        Snapshot? snapshot;
        try { snapshot = JsonSerializer.Deserialize<Snapshot>(string.Concat(pages)); }
        catch (JsonException) { return; }
        if (snapshot?.Stock == null || snapshot.Revision != incomingRevision) { return; }
        var restored = new AmmoStock();
        if (snapshot.Stock.Count != 0 && !restored.TryAdd(snapshot.Stock)) { return; }
        var receivedSupplies = snapshot.Supplies ?? [];
        if (!ValidSupplies(receivedSupplies) || (snapshot.SupplyError && receivedSupplies.Length != 0)) { return; }
        supplies = receivedSupplies.Select(p => p with
        {
            Costs = new Dictionary<string, double>(p.Costs, StringComparer.OrdinalIgnoreCase)
        }).ToArray();
        supplyError = snapshot.SupplyError;
        Stock = restored;
        revision = snapshot.Revision;
        hasSnapshot = true;
    }
}
