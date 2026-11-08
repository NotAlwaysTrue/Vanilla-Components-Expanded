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

    partial void PublishPresets()
    {
        if (GameMain.Server == null) { return; }
        var presets = MagazinePresetLibrary.Snapshot().Select(p => new PresetSnapshot(p.Name, p.Start, p.Main, p.End)).ToArray();
        Item.CreateServerEvent(this, new PresetListSnapshot(0, presets));
    }

    public void ServerEventWrite(IWriteMessage msg, Client client, NetEntityEvent.IData extraData = null!)
    {
        // Kind 1 is the arrangement (preset) list; it is only sent when presets change.
        if (TryExtractEventData<PresetListSnapshot>(extraData, out var presets))
        {
            msg.WriteByte(1);
            msg.WriteUInt32(presets.Revision);
            msg.WriteUInt16((ushort)presets.Presets.Length);
            foreach (var preset in presets.Presets)
            {
                msg.WriteString(preset.Name);
                WriteRuns(msg, preset.Start);
                WriteRuns(msg, preset.Main);
                WriteRuns(msg, preset.End);
            }
            return;
        }

        static void WriteRuns(IWriteMessage msg, AmmoRun[] runs)
        {
            msg.WriteByte((byte)Math.Min(runs.Length, AmmoPlan.MaxGroups));
            foreach (var run in runs)
            {
                msg.WriteString(run.Id);
                msg.WriteUInt16((ushort)run.Count);
            }
        }
        var page = ExtractEventData<SnapshotPage>(extraData);
        msg.WriteByte(0);
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
        bool valid = true;
        // Preset saves carry the MagazinePrefab sections; every other command only uses the middle one.
        var start = ReadRuns(msg, ref valid);
        var plan = ReadRuns(msg, ref valid);
        var end = ReadRuns(msg, ref valid);
        string name = msg.ReadString();
        int index = msg.ReadInt32();

        static List<AmmoRun> ReadRuns(IReadMessage msg, ref bool valid)
        {
            int count = msg.ReadByte();
            var runs = new List<AmmoRun>(count);
            if (count > AmmoPlan.MaxGroups) { valid = false; }
            for (int i = 0; i < count; i++)
            {
                uint prefabId = msg.ReadUInt32();
                int amount = msg.ReadUInt16();
                if (ItemPrefab.Prefabs.Find(p => p.UintIdentifier == prefabId) is { } prefab) { runs.Add(new(prefab.Identifier.Value, amount)); }
                else { valid = false; }
            }
            return runs;
        }
        if (!Item.CanClientAccess(client)) { return; }
        if (command is Command.SavePreset or Command.DeletePreset or Command.MovePreset)
        {
            // Preset edits do not consume stock, but they still need resolvable projectile ids.
            if (!valid || !ApplyPresetCommand(command, plan.ToArray(), name, index, start.ToArray(), end.ToArray())) { PublishState(); }
            return;
        }
        if (command == Command.Refresh)
        {
            if (Timing.TotalTime >= nextRefresh)
            {
                nextRefresh = Timing.TotalTime + 0.5;
                PublishState();
                PublishPresets();
            }
            return;
        }
        if (command == Command.SelectSlot)
        {
            // Picking a rack slot consumes nothing, so a stale revision is not a reason to refuse it.
            if (!TrySetTargetSlot(index)) { PublishState(); }
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
