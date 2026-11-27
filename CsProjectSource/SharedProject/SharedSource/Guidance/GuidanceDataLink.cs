using Barotrauma.Items.Components;
using Barotrauma.Plugins;
using VanillaComponentsExpanded;

namespace VCE_Guidance;

public sealed class GuidanceDataLink : ItemComponent
{
    private enum Role { Receiver, Publisher, Both }
    private readonly Role role;
    private readonly Identifier channel;
    private readonly float range;
    private readonly bool requireLos;
    private readonly GuidanceMode manualMode;
    private static readonly Dictionary<Identifier, List<GuidanceDataLink>> publishers = new();
    internal GuidanceTrack? Track;
    internal GuidanceTrack? Illumination;
    internal ManualAim? Manual;
    internal Vector2[] Route = [];
    internal double AbortedAt = double.NegativeInfinity, TerminalAt = double.NegativeInfinity;
    private double nextAim;

    public GuidanceDataLink(Item item, ContentXElement element) : base(item, element)
    {
        role = element.GetAttributeEnum("role", Role.Receiver);
        channel = element.GetAttributeIdentifier("channel", "default");
        range = element.GetAttributeFloat("maxrange", 20000);
        requireLos = element.GetAttributeBool("requirelos", false);
        manualMode = element.GetAttributeEnum("manualmode", GuidanceMode.MLOS);
        if (role == Role.Receiver) return;
        if (!publishers.TryGetValue(channel, out var list)) publishers[channel] = list = [];
        list.Add(this);
#if CLIENT
        IsActive = true;
#endif
    }

    internal GuidanceDataLink? Source(Vector2 point, Item? launcher)
    {
        if (role == Role.Publisher || !publishers.TryGetValue(channel, out var sources)) return null;
        GuidanceDataLink? best = null;
        float nearest = float.PositiveInfinity;
        foreach (var src in sources)
        {
            if (src == this || src.Item.Removed || src.Item.Condition <= 0) continue;
            float d = Vector2.DistanceSquared(point, src.Item.WorldPosition);
            float r = Math.Min(range, src.range);
            if (d > r * r || (src.requireLos || requireLos) && !GuidanceContacts.Visible(point, src.Item)) continue;
            if (src.Item == launcher) return src;
            if (d < nearest) { best = src; nearest = d; }
        }
        return best;
    }

    public struct Cursor : INetSerializableStruct
    {
        [NetworkSerialize] public ushort Device { get; set; }
        [NetworkSerialize] public Vector2 Position { get; set; }
    }
#if SERVER
    internal static void RegisterHandler()
    {
        VCEPlugin.Network.RegisterHandler<VceNetworkHeader, Cursor>(VceNetworkHeader.GuidanceCursor, (data, client) =>
        {
            if (Entity.FindEntityByID(data.Device) is Item device &&
                device.GetComponent<GuidanceDataLink>() is { } link &&
                client.Character is { } c && link.OperatedBy(c) && Timing.TotalTime >= link.nextAim &&
                float.IsFinite(data.Position.X) && float.IsFinite(data.Position.Y))
            {
                link.SetAim(data.Position);
                link.nextAim = Timing.TotalTime + 0.045;
            }
        });
    }
#endif
    private bool OperatedBy(Character c) => role != Role.Receiver && !c.IsDead && item.Condition > 0 &&
        (c.SelectedItem == item || c.HeldItems.Contains(item) && c.IsKeyDown(InputType.Aim));

    private void SetAim(Vector2 point) => Manual = new(item.WorldPosition, point, manualMode, Timing.TotalTime);

#if CLIENT
    public override void Update(float deltaTime, Camera cam)
    {
        if (Timing.TotalTime < nextAim) return;
        nextAim = Timing.TotalTime + 0.1;
        if (Character.Controlled is not { } c || !OperatedBy(c)) return;
        if (GameMain.Client == null) SetAim(c.CursorWorldPosition);
        else VCEPlugin.Network.Send(VceNetworkHeader.GuidanceCursor, new Cursor { Device = item.ID, Position = c.CursorWorldPosition });
    }
#endif
    public override void ReceiveSignal(Signal signal, Connection connection)
    {
        if (role == Role.Receiver || GameMain.NetworkMember is { IsClient: true }) return;
        if (connection.Name == "waypoints_in") Route = GuidanceContacts.Route(signal.value);
        if (connection.Name == "terminal_in" && signal.value != "0") TerminalAt = Timing.TotalTime;
        if (connection.Name == "abort_in" && signal.value != "0") AbortedAt = Timing.TotalTime;
    }

    public override void RemoveComponentSpecific()
    {
        if (role != Role.Receiver && publishers.TryGetValue(channel, out var list))
        {
            list.Remove(this);
            if (list.Count == 0) publishers.Remove(channel);
        }
        base.RemoveComponentSpecific();
    }
}
