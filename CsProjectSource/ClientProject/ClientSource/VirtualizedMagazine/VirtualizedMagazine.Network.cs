using Barotrauma.Networking;

namespace VCE_VirtualizedMagazine;

public partial class VirtualizedMagazine
{
    private const int RoundsPerPage = 128;
    private uint ammoRevision;
    private bool receivedAmmoState;
    private Identifier[] pendingAmmo = [];
    private bool[] receivedPages = [];
    private sealed record AmmoRequest(uint Revision) : IEventData;

    public override bool ValidateEventData(NetEntityEvent.IData data) => TryExtractEventData<AmmoRequest>(data, out _);

    public void ClientEventWrite(IWriteMessage msg, NetEntityEvent.IData extraData = null!)
        => msg.WriteUInt32(ExtractEventData<AmmoRequest>(extraData).Revision);

    public void ClientEventRead(IReadMessage msg, float sendingTime)
    {
        uint revision = msg.ReadUInt32();
        int total = msg.ReadInt32();
        int offset = msg.ReadInt32();
        if (total < 0 || total > 1000000 || offset < 0 || offset > total || offset % RoundsPerPage != 0) { return; }
        int count = Math.Min(RoundsPerPage, total - offset);
        var rounds = new Identifier[count];
        for (int i = 0; i < count; i++)
        {
            uint prefabId = msg.ReadUInt32();
            rounds[i] = ItemPrefab.Prefabs.Find(p => p.UintIdentifier == prefabId)?.Identifier ?? Identifier.Empty;
        }
        if (receivedAmmoState && revision <= ammoRevision) { return; }
        if (receivedPages.Length == 0 || revision != ammoRevision)
        {
            if (receivedPages.Length > 0 && revision < ammoRevision) { return; }
            ammoRevision = revision;
            receivedAmmoState = false;
            pendingAmmo = new Identifier[total];
            receivedPages = new bool[Math.Max(1, (total + RoundsPerPage - 1) / RoundsPerPage)];
            if (receivedPages.Length > 1)
            {
                Item.CreateClientEvent(this, new AmmoRequest(revision));
            }
        }
        if (total != pendingAmmo.Length || offset / RoundsPerPage >= receivedPages.Length) { return; }
        Array.Copy(rounds, 0, pendingAmmo, offset, count);
        receivedPages[offset / RoundsPerPage] = true;
        if (receivedPages.All(p => p))
        {
            LoadedAmmoIdentifiers.Clear();
            LoadedAmmoIdentifiersArray = pendingAmmo;
            receivedAmmoState = true;
        }
    }
}
