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
    public void RequestSelectSlot(int index)
    {
        if (TargetSlotCount <= 0) { return; }
        // Apply straight away so the highlight follows the click; the server snapshot confirms it.
        targetSlot = Math.Clamp(index, 0, TargetSlotCount - 1);
        uiDirty = true;
        if (IsSynchronized) { Send(Command.SelectSlot, null, "", targetSlot); }
    }
    public void RequestWithdraw(string id)
    {
        if (IsSynchronized && IsProjectile(id)) { Send(Command.Withdraw, [new(id, 1)]); }
    }

    public void RequestSavePreset(string name, AmmoRun[] start, AmmoRun[] main, AmmoRun[] end)
    {
        if (!IsSynchronized) { return; }
        var all = AmmoPlan.Compact([.. AmmoPlan.Expand(start), .. AmmoPlan.Expand(main), .. AmmoPlan.Expand(end)]);
        if (AmmoPlan.IsValid(all, AmmoPlan.MaxRounds)) { Send(Command.SavePreset, main, name, 0, start, end); }
    }
    public void RequestDeletePreset(string name) => Send(Command.DeletePreset, null, name);
    public void RequestMovePreset(string name, int index) => Send(Command.MovePreset, null, name, index);

    public override bool ValidateEventData(NetEntityEvent.IData data) => TryExtractEventData<Request>(data, out _);

    private void Send(Command command, AmmoRun[]? plan = null, string name = "", int index = 0,
        AmmoRun[]? start = null, AmmoRun[]? end = null)
    {
        if (GameMain.Client != null)
        {
            Item.CreateClientEvent(this, new Request(command, revision, Target?.Item.ID ?? 0, plan ?? [], name ?? "", index,
                start, end));
        }
        else if (command == Command.Load) { TryLoad(plan ?? [], Target?.Item.ID ?? 0); }
        else if (command == Command.Unload) { TryUnload(Target?.Item.ID ?? 0); }
        else if (command == Command.SelectSlot) { TrySetTargetSlot(index); }
        else if (command == Command.Withdraw && plan is { Length: 1 }) { TryWithdraw(plan[0].Id); }
        else { ApplyPresetCommand(command, plan ?? [], name, index, start, end); }
    }

    public void ClientEventWrite(IWriteMessage msg, NetEntityEvent.IData extraData = null!)
    {
        var request = ExtractEventData<Request>(extraData);
        msg.WriteByte((byte)request.Command);
        msg.WriteUInt32(request.Revision);
        msg.WriteUInt16(request.Target);
        // Presets carry the MagazinePrefab sections; every other command only uses the middle one.
        WriteRuns(msg, request.Start ?? []);
        WriteRuns(msg, request.Plan);
        WriteRuns(msg, request.End ?? []);
        msg.WriteString(request.Name ?? "");
        msg.WriteInt32(request.Index);

        static void WriteRuns(IWriteMessage msg, AmmoRun[] runs)
        {
            msg.WriteByte((byte)Math.Min(runs.Length, AmmoPlan.MaxGroups));
            foreach (var run in runs)
            {
                msg.WriteUInt32(ItemPrefab.FindByIdentifier(run.Id.ToIdentifier())?.UintIdentifier ?? 0);
                msg.WriteUInt16((ushort)run.Count);
            }
        }
    }

    public void ClientEventRead(IReadMessage msg, float sendingTime)
    {
        // Kind 1 is the arrangement (preset) list; it arrives only when presets change.
        if (msg.ReadByte() == 1) { ReadPresetList(msg); return; }
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
        targetSlot = snapshot.TargetSlot;
        hasSnapshot = true;
        uiDirty = true;
    }

    /// <summary>The arrangement list is synced only when the server saves a preset, never with stock updates.</summary>
    private void ReadPresetList(IReadMessage msg)
    {
        msg.ReadUInt32();
        int count = msg.ReadUInt16();
        if (count > AmmoPlan.MaxGroups * 4) { return; }
        var presets = new List<(string Name, AmmoRun[] Start, AmmoRun[] Main, AmmoRun[] End)>(count);
        for (int i = 0; i < count; i++)
        {
            string name = msg.ReadString();
            AmmoRun[] ReadSection()
            {
                int runs = msg.ReadByte();
                var section = new AmmoRun[runs];
                for (int j = 0; j < runs; j++) { section[j] = new AmmoRun(msg.ReadString(), msg.ReadUInt16()); }
                return section;
            }
            var start = ReadSection();
            var main = ReadSection();
            var end = ReadSection();
            var all = AmmoPlan.Compact([.. AmmoPlan.Expand(start), .. AmmoPlan.Expand(main), .. AmmoPlan.Expand(end)]);
            if (name.Length is 0 or > MagazinePresetLibrary.MaxNameLength || !AmmoPlan.IsValid(all, AmmoPlan.MaxRounds)) { return; }
            presets.Add((name, start, main, end));
        }
        // The server owns the preset files, so its list replaces whatever this client had cached.
        MagazinePresetLibrary.ApplyRemote(presets);
        uiDirty = true;
    }
}
