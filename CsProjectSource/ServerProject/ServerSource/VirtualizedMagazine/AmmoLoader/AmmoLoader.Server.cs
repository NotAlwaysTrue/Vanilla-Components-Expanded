using Barotrauma.Networking;

namespace VCE_VirtualizedMagazine;

public sealed partial class AmmoLoader
{
    private double nextRefresh;

    public override IEventData ServerGetEventData() => CapturePages()[0];
    public override bool ValidateEventData(NetEntityEvent.IData data) => TryExtractEventData<SnapshotPage>(data, out _);

    partial void PublishState()
    {
        if (GameMain.Server == null) { return; }
        foreach (var page in CapturePages()) { Item.CreateServerEvent(this, page); }
    }

    public void ServerEventWrite(IWriteMessage msg, Client client, NetEntityEvent.IData extraData = null!)
    {
        var page = ExtractEventData<SnapshotPage>(extraData);
        msg.WriteUInt32(page.Revision);
        msg.WriteInt32(page.Index);
        msg.WriteInt32(page.Count);
        msg.WriteString(page.Data);
    }

    public void ServerEventRead(IReadMessage msg, Client client)
    {
        var command = (Command)msg.ReadByte();
        uint expectedRevision = msg.ReadUInt32();
        ushort targetId = msg.ReadUInt16();
        int count = msg.ReadByte();
        var plan = new List<AmmoRun>();
        bool valid = count <= AmmoPlan.MaxGroups;
        for (int i = 0; i < count; i++)
        {
            uint prefabId = msg.ReadUInt32();
            int amount = msg.ReadUInt16();
            if (ItemPrefab.Prefabs.Find(p => p.UintIdentifier == prefabId) is { } prefab) { plan.Add(new(prefab.Identifier.Value, amount)); }
            else { valid = false; }
        }
        string name = msg.ReadString();
        int index = msg.ReadInt32();
        if (!Item.CanClientAccess(client)) { return; }
        if (command is Command.SavePreset or Command.DeletePreset or Command.MovePreset)
        {
            // Preset edits do not consume stock, but they still need resolvable projectile ids.
            if (!valid || !ApplyPresetCommand(command, plan.ToArray(), name, index)) { PublishState(); }
            return;
        }
        if (command == Command.Refresh)
        {
            if (Timing.TotalTime >= nextRefresh)
            {
                nextRefresh = Timing.TotalTime + 0.5;
                PublishState();
            }
            return;
        }
        if (!valid || expectedRevision != revision)
        {
            if (Timing.TotalTime >= nextRefresh)
            {
                nextRefresh = Timing.TotalTime + 0.5;
                PublishState();
            }
            return;
        }
        bool success = command switch
        {
            Command.Load => TryLoad(plan, targetId),
            Command.Unload => TryUnload(targetId),
            Command.Withdraw => plan.Count == 1 && plan[0].Count == 1 && TryWithdraw(plan[0].Id),
            _ => false
        };
        if (!success) { PublishState(); }
    }
}
