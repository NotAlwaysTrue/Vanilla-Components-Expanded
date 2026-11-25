using Barotrauma.Items.Components;
using FarseerPhysics;

namespace VCE_Guidance;

public sealed class GuidedProjectile : Projectile
{
    private readonly GuidanceMode modes;
    private readonly GuidanceMode[] priority;
    private readonly Vector2[] authoredRoute;
    private readonly bool relative, snap, destroyOnLoss, destroyAtEnd;
    private readonly float range, turnRate, radius, throttle, lockTime, interval, timeout, lifetime, proximity, terminalRange;
    private readonly float crossTrackLimit;
    private int waypoint;
    private double launched, nextScan, acquired, lastContact;
    private bool flying, terminal, hadContact;
    private Vector2[] route = [], lastRoute = [];
    private Vector2 legStart;
    private GuidanceThruster? motor;
    private GuidanceDataLink? link, source;
    private Entity? lockTarget;
    private Character? shooter;
    private Submarine? launchSub;

    public GuidedProjectile(Item item, ContentXElement element) : base(item, element)
    {
        var cfg = element.GetChildElement("guidance") ?? element;
        modes = GuidanceContacts.Parse(cfg.GetAttributeString("mode", cfg.GetAttributeString("guidance", "ActiveSonar")));
        priority = cfg.GetAttributeString("seekerpriority", "").Split(',', StringSplitOptions.RemoveEmptyEntries)
            .Select(GuidanceContacts.Parse).Concat(GuidanceContacts.DefaultPriority).Distinct().ToArray();
        authoredRoute = GuidanceContacts.Route(cfg.GetAttributeString("waypoints", ""));
        relative = cfg.GetAttributeBool("relativeroute", true);
        snap = cfg.GetAttributeBool("snaptogrid", false);
        destroyOnLoss = cfg.GetAttributeBool("destroyonloss", false);
        destroyAtEnd = cfg.GetAttributeBool("destroyatrouteend", false);
        range = cfg.GetAttributeFloat("seekerrange", 6000);
        turnRate = MathHelper.ToRadians(cfg.GetAttributeFloat("turnrate", 90));
        radius = cfg.GetAttributeFloat("waypointradius", 100);
        crossTrackLimit = cfg.GetAttributeFloat("crosstracklimit", 500);
        throttle = cfg.GetAttributeFloat("throttle", 1);
        lockTime = cfg.GetAttributeFloat("seekerlocktime", 0.25f);
        interval = Math.Max(0.05f, cfg.GetAttributeFloat("scaninterval", 0.2f));
        timeout = cfg.GetAttributeFloat("commandtimeout", 1);
        lifetime = cfg.GetAttributeFloat("maxlifetime", 30);
        proximity = cfg.GetAttributeFloat("proximity", 0);
        terminalRange = cfg.GetAttributeFloat("terminalrange", range);
        Hitscan = false;
        HitScanCount = 1;
    }

    public override void DoLaunch(Vector2 impulse)
    {
        base.DoLaunch(impulse);
        if (GameMain.NetworkMember is { IsClient: true }) return;
        shooter = User;
        launchSub = Launcher?.Submarine ?? shooter?.Submarine;
        link = item.GetComponent<GuidanceDataLink>();
        motor = item.GetComponent<GuidanceThruster>();
        flying = true;
        terminal = hadContact = false;
        launched = lastContact = Timing.TotalTime;
        nextScan = 0;
        lockTarget = null;
        source = null;
        lastRoute = [];
        SetRoute(authoredRoute, relative);
    }

    private void SetRoute(Vector2[] points, bool offset)
    {
        legStart = item.WorldPosition;
        waypoint = 0;
        route = new Vector2[points.Length];
        for (int i = 0; i < route.Length; ++i)
        {
            var p = offset ? legStart + points[i] : points[i];
            if (snap) p = new(MathF.Round(p.X / Level.GridCellSize) * Level.GridCellSize,
                MathF.Round(p.Y / Level.GridCellSize) * Level.GridCellSize);
            route[i] = p;
        }
    }

    public override void Update(float deltaTime, Camera cam)
    {
        bool hit = impactQueue.Count > 0;
        base.Update(deltaTime, cam);
        if (!flying) return;
        if (item.Removed || removePending || IsStuckToTarget || item.ParentInventory != null || hit && !IsActive)
        { flying = false; return; }
        double now = Timing.TotalTime;
        Vector2 position = item.WorldPosition;
        if (now >= nextScan)
        {
            nextScan = now + interval;
            source = link?.Source(position, Launcher);
            if (source != null && source.Route != lastRoute && source.Route.Length > 0 && modes.HasFlag(GuidanceMode.Cruise))
            {
                SetRoute(source.Route, false);
                lastRoute = source.Route;
                terminal = false;
            }
            if (source?.TerminalAt >= launched) { waypoint = route.Length; terminal = true; }
            bool midcourse = modes.HasFlag(GuidanceMode.Cruise) && waypoint < route.Length ||
                !terminal && modes.HasFlag(GuidanceMode.DataLink) && source?.Track is { } mid &&
                now - mid.Stamp <= timeout && Vector2.DistanceSquared(mid.Position, position) > terminalRange * terminalRange;
            Entity? candidate = null;
            if (!midcourse)
            {
                foreach (var mode in priority)
                {
                    if (mode == GuidanceMode.None || !modes.HasFlag(mode)) continue;
                    if (mode is GuidanceMode.SemiActiveSonar or GuidanceMode.SemiActiveLaser)
                    {
                        if (source?.Illumination is { } light && light.Mode == mode && now - light.Stamp <= timeout &&
                            !light.Target.Removed && (mode != GuidanceMode.SemiActiveLaser || GuidanceContacts.Visible(position, light.Target)))
                            candidate = light.Target;
                    }
                    else if (mode is GuidanceMode.ActiveImaging or GuidanceMode.ActiveInfrared or GuidanceMode.ActiveSonar)
                        candidate = GuidanceContacts.Scan(item, shooter, launchSub, position, range, mode);
                    if (candidate != null) break;
                }
            }
            if (lockTarget != candidate) acquired = now;
            lockTarget = candidate;
        }
        if (source?.AbortedAt >= launched || lifetime > 0 && now - launched >= lifetime) { EndFlight(); return; }
        Vector2? point = null;
        Entity? tracked = null;
        if (source?.Manual is { } manual && modes.HasFlag(manual.Mode) && now - manual.Stamp <= timeout &&
            manual.Mode is GuidanceMode.MLOS or GuidanceMode.SACLOS)
        {
            point = manual.Point;
            if (manual.Mode == GuidanceMode.SACLOS)
            {
                var ray = manual.Point - manual.Origin;
                if (ray.LengthSquared() > 1)
                {
                    ray.Normalize();
                    point = manual.Origin + ray * Math.Max(radius, Vector2.Dot(position - manual.Origin, ray) + radius * 2);
                }
            }
        }
        else if (modes.HasFlag(GuidanceMode.Cruise) && waypoint < route.Length)
        {
            var end = route[waypoint];
            var leg = end - legStart;
            if (Vector2.DistanceSquared(position, end) <= radius * radius ||
                leg.LengthSquared() > 0 && Vector2.Dot(position - end, leg) >= 0)
            {
                legStart = end;
                if (++waypoint == route.Length) { terminal = true; if (destroyAtEnd) { EndFlight(); return; } }
            }
            if (waypoint < route.Length)
            {
                point = route[waypoint];
                leg = point.Value - legStart;
                if (leg.LengthSquared() > 1)
                {
                    var nearest = legStart + leg * Math.Clamp(Vector2.Dot(position - legStart, leg) / leg.LengthSquared(), 0, 1);
                    if (Vector2.DistanceSquared(position, nearest) > crossTrackLimit * crossTrackLimit) point = nearest;
                }
            }
        }
        else if (lockTarget is { Removed: false } target && now - acquired >= lockTime)
        { point = target.WorldPosition; tracked = target; terminal = true; }
        else if (modes.HasFlag(GuidanceMode.DataLink) && source?.Track is { } track && !track.Target.Removed && now - track.Stamp <= timeout)
        { point = track.Position + track.Velocity * (float)(now - track.Stamp); tracked = track.Target; }

        if (point.HasValue) { hadContact = true; lastContact = now; }
        else if (hadContact && destroyOnLoss && now - lastContact >= timeout) { EndFlight(); return; }
        if (tracked != null && proximity > 0 && Vector2.DistanceSquared(position, tracked.WorldPosition) <= proximity * proximity)
        { EndFlight(); return; }

        var body = item.body;
        var velocity = body.LinearVelocity;
        float angle = velocity.LengthSquared() > 0.001f ? MathF.Atan2(velocity.Y, velocity.X) : body.TransformedRotation;
        if (point is { } destination && Vector2.DistanceSquared(destination, position) > 1)
        {
            var dir = destination - position;
            float error = MathHelper.WrapAngle(MathF.Atan2(dir.Y, dir.X) - angle);
            angle += Math.Clamp(error, -turnRate * deltaTime, turnRate * deltaTime);
        }
        Vector2 forward = new(MathF.Cos(angle), MathF.Sin(angle));
        body.SetTransformIgnoreContacts(body.SimPosition, angle + (body.Dir < 0 ? MathF.PI : 0));
        body.LinearVelocity = forward * velocity.Length();
        motor?.Burn(forward, throttle, deltaTime);
        body.FarseerBody.IsBullet = IsActive = true;
    }

    private void EndFlight()
    {
        flying = false;
        item.body.Enabled = false;
        ApplyStatusEffects(ActionType.OnImpact, 1, user: shooter);
        Entity.Spawner.AddItemToRemoveQueue(item);
    }
}
