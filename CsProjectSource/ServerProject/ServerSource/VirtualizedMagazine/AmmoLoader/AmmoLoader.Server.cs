using Barotrauma.Networking;

namespace VCE_VirtualizedMagazine;

public sealed partial class AmmoLoader
{
    private double nextRefresh;
    // Encoded snapshot pages are cached per (revision, stock version): re-serialising a large stock for every queued
    // page event is what made the machine slow once a player stored hundreds of ammo types.
    private string[] pages = [];
    private uint capturedRevision, capturedStockVersion;
    private sealed record SnapshotPage(int Index) : IEventData;

    public override IEventData ServerGetEventData() => new SnapshotPage(0);
    /// <summary>
    /// <c>Item.CreateServerEvent</c> runs this before queueing and throws when it returns false, so every kind this
    /// component publishes has to be accepted here: the stock snapshot pages and the preset (arrangement) list.
    /// </summary>
    public override bool ValidateEventData(NetEntityEvent.IData data) =>
        TryExtractEventData<SnapshotPage>(data, out _) || TryExtractEventData<PresetListSnapshot>(data, out _);

    partial void PublishState()
    {
        if (GameMain.Server == null) { return; }
        // Only the page index travels in the event; the payload is written from the current capture in ServerEventWrite.
        // Stable indices let the game's mid-round sync retain one event per page instead of every revision.
        int count = CapturePages().Length;
        for (int i = 0; i < count; i++) { Item.CreateServerEvent(this, new SnapshotPage(i)); }
    }

    private string[] CapturePages()
    {
        if (pages.Length > 0 && capturedRevision == revision && capturedStockVersion == Stock.Version) { return pages; }
        string data = EncodeSnapshot();
        int count = (data.Length + SnapshotPageSize - 1) / SnapshotPageSize;
        pages = new string[count];
        for (int i = 0; i < count; i++)
        {
            int start = i * SnapshotPageSize;
            pages[i] = data.Substring(start, Math.Min(SnapshotPageSize, data.Length - start));
        }
        capturedRevision = revision;
        capturedStockVersion = Stock.Version;
        return pages;
    }

    private void ResendState()
    {
        if (Timing.TotalTime < nextRefresh) { return; }
        nextRefresh = Timing.TotalTime + 0.5;
        PublishState();
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
        msg.WriteUInt32(revision);
        // Write the current capture, not a copy taken when the event was queued: several queued events of the same
        // index then all carry the newest state instead of a backlog of stale snapshots.
        var current = CapturePages();
        msg.WriteInt32(page.Index);
        msg.WriteInt32(current.Length);
        msg.WriteString(page.Index < current.Length ? current[page.Index] : "");
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
            ResendState();
            return;
        }
        bool success = command switch
        {
            Command.Load => TryLoad(plan, targetId),
            Command.Unload => TryUnload(targetId),
            Command.Withdraw => plan.Count == 1 && plan[0].Count == 1 && TryWithdraw(plan[0].Id),
            _ => false
        };
        if (!success) { ResendState(); }
    }
}
