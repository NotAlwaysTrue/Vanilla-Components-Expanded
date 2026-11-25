using Barotrauma.Items.Components;
using FarseerPhysics;

namespace VCE_Airburst;

public sealed class AirburstProjectile : Projectile
{
    internal enum FuseMode { Arc, Chord, Time }
    internal readonly FuseMode Mode;
    internal readonly float GravityScale, Drag, MaxDistance;
    internal readonly bool DefaultPhysics;
    private readonly float angularDrag, waterDrag, fallback, grace, maxLifetime;
    private readonly bool detonateOnImpact;
    private readonly ActionType burstStatus;
    private Vector2 origin, previous, velocity, gravity;
    private float damping, travelled, age, distance, fuseTime;
    private bool flying, waiting;
    private Character? shooter;

    public AirburstProjectile(Item item, ContentXElement element) : base(item, element)
    {
        var config = element.GetChildElement("airburst") ?? element;
        Mode = config.GetAttributeEnum("fusemode", FuseMode.Arc);
        GravityScale = config.GetAttributeFloat("gravityscale", 0);
        Drag = config.GetAttributeFloat("lineardamping", 0);
        angularDrag = config.GetAttributeFloat("angulardamping", -1);
        waterDrag = config.GetAttributeFloat("waterdragcoefficient", 0);
        DefaultPhysics = config.GetAttributeBool("usedefaultphysics", false);
        MaxDistance = config.GetAttributeFloat("maxdistance", -1);
        fallback = config.GetAttributeFloat("defaultdistance", -1);
        grace = config.GetAttributeFloat("netgracetime", 0.3f);
        maxLifetime = config.GetAttributeFloat("maxlifetime", 0);
        detonateOnImpact = config.GetAttributeBool("detonateonimpact", true);
        burstStatus = config.GetAttributeEnum("burststatus", ActionType.OnImpact);
        if (Hitscan || HitScanCount != 1)
            DebugConsole.AddWarning("AirburstProjectile requires one physical projectile per item: " + item.Name);
        Hitscan = false;
        HitScanCount = 1;
    }

    private Vector2 WorldSim => item.SimPosition + (item.Submarine?.SimPosition ?? Vector2.Zero);

    public override void DoLaunch(Vector2 impulse)
    {
        base.DoLaunch(impulse);
        var body = item.body.FarseerBody;
        if (!DefaultPhysics)
        {
            body.GravityScale = GravityScale;
            body.LinearDamping = Drag;
            item.WaterDragCoefficient = waterDrag;
            if (angularDrag >= 0) body.AngularDamping = angularDrag;
        }
        origin = previous = WorldSim;
        shooter = User;
        age = travelled = 0;
        velocity = body.LinearVelocity;
        gravity = body.IgnoreGravity ? Vector2.Zero : GameMain.World.Gravity * body.GravityScale;
        damping = body.LinearDamping;
        flying = true;
        waiting = false;
        SetDistance(fallback);
#if CLIENT
        if (shooter != null && shooter == Character.Controlled)
        {
            float aim = Vector2.Distance(ConvertUnits.ToSimUnits(shooter.CursorWorldPosition), origin);
            if (GameMain.Client != null) AirburstNetwork.Send(item.ID, shooter.ID, aim);
            else SetDistance(aim);
        }
#else
        if (shooter != null && GameMain.Server.ConnectedClients.Any(c => c.Character == shooter))
        {
            waiting = true;
            if (AirburstNetwork.Take(item.ID, shooter.ID, out float aim)) Accept(shooter, aim);
        }
#endif
    }

    internal bool Accept(Character owner, float aim)
    {
        if (!flying || !waiting || shooter != owner || age > grace) return false;
        waiting = false;
        SetDistance(aim);
        return true;
    }

    private void SetDistance(float value)
    {
        distance = MaxDistance > 0 ? Math.Min(MaxDistance, value) : value;
        fuseTime = Mode == FuseMode.Time && distance > 0
            ? AirburstBallistics.TimeAtRange(velocity, gravity, damping, distance, false) : float.PositiveInfinity;
    }

    public override void Update(float deltaTime, Camera cam)
    {
        if (!flying || GameMain.NetworkMember is { IsClient: true }) { base.Update(deltaTime, cam); return; }
        // An accepted physical hit already has a pending vanilla impact. Let it win this frame.
        if (impactQueue.Count > 0 && (detonateOnImpact || RemoveOnHit)) flying = false;
        base.Update(deltaTime, cam);
        if (!flying || removePending || item.Removed || item.ParentInventory != null || IsStuckToTarget)
        {
            flying = false;
            return;
        }

        Vector2 current = WorldSim;
        float segment = Vector2.Distance(previous, current);
        float before = Mode == FuseMode.Chord ? Vector2.Distance(origin, previous) : travelled;
        travelled += segment;
        float after = Mode == FuseMode.Chord ? Vector2.Distance(origin, current) : travelled;
        age += deltaTime;
        if (waiting && age >= grace) waiting = false;
        bool timeMode = Mode == FuseMode.Time;
        if (!waiting && distance > 0 && (timeMode ? age >= fuseTime : after >= distance))
        {
            float fraction = timeMode ? 1 - (age - fuseTime) / deltaTime :
                after > before ? (distance - before) / (after - before) : 1;
            Vector2 point = Vector2.Lerp(previous, current, Math.Clamp(fraction, 0, 1));
            item.SetTransform(point - (item.Submarine?.SimPosition ?? Vector2.Zero), item.body.Rotation);
            Burst();
            return;
        }
        if (maxLifetime > 0 && age >= maxLifetime) { Burst(); return; }
        previous = current;
        if (waiting || distance > 0 || maxLifetime > 0) IsActive = true;
        else flying = false;
    }

    private void Burst()
    {
        flying = false;
        item.body.Enabled = false;
        ApplyStatusEffects(burstStatus, 1, user: shooter);
        Entity.Spawner.AddItemToRemoveQueue(item);
    }
}
