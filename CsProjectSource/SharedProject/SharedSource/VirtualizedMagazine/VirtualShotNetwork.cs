using Barotrauma.Plugins;

namespace VCE_VirtualizedMagazine;

// LuaCs collision patches must be able to box this method argument.
public record struct FiredRound : INetSerializableStruct
{
    [NetworkSerialize] public ushort ProjectileId { get; set; }
    [NetworkSerialize] public uint Sequence { get; set; }
    [NetworkSerialize] public Identifier Ammo { get; set; }
}

internal record struct TracePrediction : INetSerializableStruct
{
    // Longer than the network timeout, shorter than a 16-bit input cycle at 60 Hz.
    internal const int RetentionSeconds = 120;

    [NetworkSerialize] public ushort ShooterId { get; set; }
    [NetworkSerialize] public ushort InputId { get; set; }
    [NetworkSerialize] public int Volley { get; set; }
}

internal struct VirtualShotTrace : INetSerializableStruct
{
    internal const int MaxRays = 64;

    [NetworkSerialize] public FiredRound Round { get; set; }
    [NetworkSerialize] public TracePrediction? Prediction { get; set; }
    [NetworkSerialize] public int FirstRay { get; set; }
    [NetworkSerialize] public Vector2 Start { get; set; }
    [NetworkSerialize(ArrayMaxSize = MaxRays)] public Vector2[] Ends { get; set; }
}

internal struct VirtualShotImpact : INetSerializableStruct
{
    [NetworkSerialize] public FiredRound Round { get; set; }
    [NetworkSerialize] public Vector2 Position { get; set; }
    [NetworkSerialize] public ushort TargetId { get; set; }
    [NetworkSerialize] public int LimbIndex { get; set; }
    [NetworkSerialize] public bool Success { get; set; }
}

internal static class VirtualShotNetwork
{
    private enum Header { Trace, Impact }
    private static readonly IGameNetwork network = PluginServiceProvider.GetService<IGameNetwork>();

    internal static void Register()
    {
        network.RegisterNetworkHeaders<Header>();
#if CLIENT
        network.RegisterHandler<Header, VirtualShotTrace>(Header.Trace, VirtualizedProjectile.PlayTrace);
        network.RegisterHandler<Header, VirtualShotImpact>(Header.Impact, VirtualizedProjectile.PlayImpact);
#endif
    }

#if SERVER
    internal static void SendTrace(FiredRound round, Vector2 start, Vector2[] ends, int firstRay, TracePrediction? prediction)
    {
        var trace = new VirtualShotTrace { Round = round, Start = start, Ends = ends, FirstRay = firstRay };
        Send(Header.Trace, trace, prediction?.ShooterId, trace with { Prediction = prediction });
    }

    internal static void SendImpact(FiredRound round, ActionType result, Limb? limb, Entity? target, Vector2 position) =>
        Send(Header.Impact, new VirtualShotImpact
        {
            Round = round, Position = position, TargetId = target?.ID ?? 0,
            LimbIndex = limb == null ? -1 : Array.IndexOf(limb.character.AnimController.Limbs, limb),
            Success = result == ActionType.OnSuccess
        });

    private static void Send<T>(Header header, T message, ushort? shooterId = null, T ownerMessage = default)
        where T : struct, INetSerializableStruct
    {
        foreach (var client in GameMain.Server.ConnectedClients)
        {
            if (!client.InGame || client.NeedsMidRoundSync) { continue; }
            bool isShooter = shooterId.HasValue && client.Character?.ID == shooterId.Value;
            network.SendToClient(client, header, isShooter ? ownerMessage : message);
        }
    }
#endif
}
