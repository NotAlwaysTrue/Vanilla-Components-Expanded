using Barotrauma.Plugins;

namespace VCE_Airburst;

internal static class AirburstNetwork
{
    private enum Header { AimDistance }
    public struct Aim : INetSerializableStruct
    {
        [NetworkSerialize] public ushort ItemId { get; set; }
        [NetworkSerialize] public ushort ShooterId { get; set; }
        [NetworkSerialize] public float Range { get; set; }
    }
    private static readonly IGameNetwork network = PluginServiceProvider.GetService<IGameNetwork>();
    internal static void Register()
    {
        network.RegisterNetworkHeaders<Header>();
#if SERVER
        network.RegisterHandler<Header, Aim>(Header.AimDistance, Receive);
#endif
    }
#if CLIENT
    internal static void Send(ushort item, ushort shooter, float range) =>
        network.Send(Header.AimDistance, new Aim { ItemId = item, ShooterId = shooter, Range = range });
#else
    // Bind early reports to the ammo instance. Removal/round teardown releases the entry.
    private sealed record Pending(ushort Shooter, float Range, double Until);
    private static readonly System.Runtime.CompilerServices.ConditionalWeakTable<Item, Pending> early = new();
    private static void Receive(Aim aim, Barotrauma.Networking.Client client)
    {
        if (client.Character is not { } user || user.ID != aim.ShooterId ||
            !float.IsFinite(aim.Range) || aim.Range < 0 ||
            Entity.FindEntityByID(aim.ItemId) is not Item ammo ||
            ammo.GetComponent<AirburstProjectile>() is not { } fuse) return;
        if (fuse.Accept(user, aim.Range)) return;
        if (ammo.GetRootInventoryOwner() != user && !(user.SelectedItem is { } device &&
            ammo.GetRootInventoryOwner() == device)) return;
        early.AddOrUpdate(ammo, new Pending(user.ID, aim.Range, Timing.TotalTime + 2));
    }
    internal static bool Take(ushort id, ushort shooter, out float range)
    {
        range = 0;
        if (Entity.FindEntityByID(id) is not Item item || !early.TryGetValue(item, out var shot)) return false;
        early.Remove(item);
        range = shot.Range;
        return shot.Shooter == shooter && shot.Until >= Timing.TotalTime;
    }
#endif
}
