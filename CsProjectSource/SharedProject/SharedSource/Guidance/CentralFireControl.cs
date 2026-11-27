using Barotrauma.Items.Components;

namespace VCE_Guidance;

public sealed class CentralFireControl : Powered
{
    private readonly float interval, maxRange, minDot;
    private readonly GuidanceMode illuminationMode;
    private readonly bool characters, vessels, items;
    private GuidanceDataLink? link;
    private Sonar? sonar;
    private double nextScan, nextSonarSearch;

    public CentralFireControl(Item item, ContentXElement element) : base(item, element)
    {
        interval = Math.Max(0.05f, element.GetAttributeFloat("scaninterval", 0.25f));
        maxRange = element.GetAttributeFloat("maxrange", 20000);
        minDot = MathF.Cos(MathHelper.ToRadians(Math.Clamp(element.GetAttributeFloat("coneangle", 360), 0, 360) / 2));
        illuminationMode = element.GetAttributeEnum("illumination", GuidanceMode.SemiActiveSonar);
        characters = element.GetAttributeBool("detectcharacters", true);
        vessels = element.GetAttributeBool("detectsubmarines", true);
        items = element.GetAttributeBool("detectitems", true);
        IsActive = GameMain.NetworkMember is not { IsClient: true };
    }

    public override void Update(float deltaTime, Camera cam)
    {
        if (GameMain.NetworkMember is { IsClient: true } || Timing.TotalTime < nextScan) return;
        nextScan = Timing.TotalTime + interval;
        link ??= item.GetComponent<GuidanceDataLink>();
        if (link == null) return;
        var previous = link.Track;
        var previousIllumination = link.Illumination;
        link.Track = link.Illumination = null;
        if (item.Condition <= 0 || PowerConsumption > 0 && Voltage < MinVoltage) return;

        if (Timing.TotalTime >= nextSonarSearch || sonar?.Item.Removed == true)
        {
            sonar = item.GetComponent<Sonar>() ?? item.linkedTo.OfType<Item>()
                .Select(i => i.GetComponent<Sonar>()).FirstOrDefault(s => s != null);
            if (sonar == null && item.Submarine != null)
                sonar = Sonar.SonarList.Where(s => s.Item.Submarine == item.Submarine)
                    .MinBy(s => Vector2.DistanceSquared(s.Item.WorldPosition, item.WorldPosition));
            nextSonarSearch = Timing.TotalTime + 2;
        }

        Vector2 origin = item.WorldPosition;
        float range = maxRange;
        bool passive = false;
        Vector2 forward = new(MathF.Cos(item.RotationRad), MathF.Sin(item.RotationRad));
        float cone = minDot;
        if (sonar != null)
        {
            if (sonar.Item.Condition <= 0 || sonar.PowerConsumption > 0 && sonar.Voltage < sonar.MinVoltage) return;
            if (sonar.UseTransducers)
            {
                var transducer = sonar.ConnectedTransducers.FirstOrDefault();
                if (transducer == null) return;
                origin = transducer.Item.WorldPosition;
            }
            else origin = sonar.Item.WorldPosition;
            range = Math.Min(range, sonar.Range);
            passive = sonar.CurrentMode == Sonar.Mode.Passive;
            if (!passive && sonar.UseDirectionalPing)
            {
                forward = new(sonar.pingDirection.X, -sonar.pingDirection.Y);
                cone = Math.Max(cone, Sonar.DirectionalPingDotProduct);
            }
        }
        Entity? Scan(bool requireVisibility = false) => GuidanceContacts.Scan(item, item.GetRootInventoryOwner() as Character,
            item.Submarine, origin, range, GuidanceMode.ActiveSonar, passive, forward, cone, characters, vessels, items,
            sonar?.DetectSubmarineWalls == true, requireVisibility);

        Entity? target = Scan();
        if (target == null) return;
        double now = Timing.TotalTime;
        GuidanceTrack MakeTrack(Entity contact, GuidanceTrack? last, GuidanceMode mode)
        {
            Vector2 position = contact.WorldPosition;
            Vector2 velocity = last is { } old && old.Target == contact && now > old.Stamp
                ? (position - old.Position) / (float)(now - old.Stamp) : Vector2.Zero;
            return new GuidanceTrack(contact, position, velocity, now, mode);
        }

        var track = MakeTrack(target, previous, GuidanceMode.DataLink);
        link.Track = track;
        if ((illuminationMode == GuidanceMode.SemiActiveSonar && !passive) ||
            (illuminationMode == GuidanceMode.SemiActiveLaser && GuidanceContacts.Visible(origin, target)))
        {
            link.Illumination = track with { Mode = illuminationMode };
        }
        else if (illuminationMode == GuidanceMode.SemiActiveLaser && Scan(requireVisibility: true) is { } visible)
        {
            link.Illumination = MakeTrack(visible, previousIllumination, illuminationMode);
        }
    }
}
