using Barotrauma.Networking;

namespace VCE_VirtualizedMagazine;

public partial class VirtualizedMagazine
{
    private const int RoundsPerPage = 128;
    private uint ammoRevision;
    private Identifier[] syncedAmmo = [];
    private double nextStateRequest;
    private sealed record AmmoEvent(uint Revision, int Offset, Identifier[] Rounds) : IEventData;

    public override IEventData ServerGetEventData() => new AmmoEvent(ammoRevision, 0, LoadedAmmoIdentifiersArray);
    public override bool ValidateEventData(NetEntityEvent.IData data) => TryExtractEventData<AmmoEvent>(data, out _);

    partial void SyncAmmoState()
    {
        if (GameMain.Server == null || !Item.Components.Contains(this)) { return; }
        var rounds = LoadedAmmoIdentifiersArray;
        if (syncedAmmo.SequenceEqual(rounds)) { return; }
        syncedAmmo = rounds;
        ammoRevision++;
        SendAmmoState();
    }

    private void SendAmmoState()
    {
        var rounds = LoadedAmmoIdentifiersArray;
        for (int start = 0; start < Math.Max(rounds.Length, 1); start += RoundsPerPage)
        {
            Item.CreateServerEvent(this, new AmmoEvent(ammoRevision, start, rounds));
        }
    }

    public void ServerEventWrite(IWriteMessage msg, Client client, NetEntityEvent.IData extraData = null!)
    {
        var state = ExtractEventData<AmmoEvent>(extraData);
        msg.WriteUInt32(state.Revision);
        msg.WriteInt32(state.Rounds.Length);
        msg.WriteInt32(state.Offset);
        int end = Math.Min(state.Offset + RoundsPerPage, state.Rounds.Length);
        for (int i = state.Offset; i < end; i++)
        {
            msg.WriteUInt32(ItemPrefab.Prefabs.TryGet(state.Rounds[i], out var prefab) ? prefab.UintIdentifier : 0);
        }
    }

    public void ServerEventRead(IReadMessage msg, Client client)
    {
        msg.ReadUInt32();
        if (Timing.TotalTime < nextStateRequest) { return; }
        nextStateRequest = Timing.TotalTime + 0.5;
        SendAmmoState();
    }
}
