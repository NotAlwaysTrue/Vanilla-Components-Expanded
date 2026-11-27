using System.Globalization;
using Barotrauma.Items.Components;
using FarseerPhysics;

namespace VCE_Guidance;

[Flags]
public enum GuidanceMode
{
    None = 0, ActiveSonar = 1, ActiveInfrared = 2, ActiveImaging = 4,
    SemiActiveLaser = 8, SemiActiveSonar = 16, DataLink = 32, Cruise = 64, SACLOS = 128, MLOS = 256
}

internal readonly record struct GuidanceTrack(Entity Target, Vector2 Position, Vector2 Velocity, double Stamp, GuidanceMode Mode);
internal readonly record struct ManualAim(Vector2 Origin, Vector2 Point, GuidanceMode Mode, double Stamp);

internal static class GuidanceContacts
{
    internal static readonly GuidanceMode[] DefaultPriority = [GuidanceMode.SemiActiveLaser, GuidanceMode.SemiActiveSonar,
        GuidanceMode.ActiveSonar, GuidanceMode.ActiveInfrared, GuidanceMode.ActiveImaging];

    internal static GuidanceMode Parse(string text) =>
        Enum.TryParse<GuidanceMode>(text.Replace('|', ','), true, out var mode) ? mode : GuidanceMode.None;

    internal static bool Visible(Vector2 origin, Entity target)
    {
        Vector2 offset = target.Submarine?.Position ?? Vector2.Zero;
        return Submarine.CheckVisibility(ConvertUnits.ToSimUnits(origin - offset),
            ConvertUnits.ToSimUnits(target.WorldPosition - offset)) == null;
    }

    internal static Entity? Scan(Item source, Character? user, Submarine? friendlySub, Vector2 origin,
        float range, GuidanceMode sensor, bool passive = false, Vector2 direction = default, float minDot = -1,
        bool characters = true, bool vessels = true, bool items = true, bool interiorOnly = false,
        bool requireVisibility = false)
    {
        Entity? best = null;
        float bestDistance = range * range;
        bool checkVisibility = requireVisibility || sensor is GuidanceMode.ActiveImaging or GuidanceMode.ActiveInfrared;
        void Consider(Entity target, float audible = float.PositiveInfinity)
        {
            if (target == source || target == user || target.Removed ||
                target is Character c && (!characters || c.IsDead || !c.Enabled || user != null && c.IsFriendly(user) ||
                    friendlySub != null && c.TeamID == friendlySub.TeamID ||
                    interiorOnly && source.CurrentHull != null && c.CurrentHull == null ||
                    sensor == GuidanceMode.ActiveInfrared && (c.Params.HideInThermalGoggles || c.InDetectable)) ||
                target is Submarine sub && (!vessels || sub == friendlySub || sensor == GuidanceMode.ActiveInfrared) ||
                target is Item i && (!items || i.ParentInventory != null || i == source.GetComponent<Projectile>()?.Launcher ||
                    sensor != GuidanceMode.ActiveSonar)) return;
            Vector2 delta = target.WorldPosition - origin;
            float d = delta.LengthSquared();
            if (d < 1 || d >= bestDistance || d > audible * audible ||
                minDot > -1 && Vector2.Dot(delta, direction) < MathF.Sqrt(d) * minDot ||
                checkVisibility && !Visible(origin, target)) return;
            bestDistance = d;
            best = target;
        }
        if (passive)
        {
            foreach (var sound in AITarget.List)
                if (sound.Entity is Character or Submarine or Item && sound.SoundRange > 0)
                    Consider(sound.Entity, sound.SoundRange * sound.SoundRangeOnSonarMultiplier);
        }
        else
        {
            if (characters) foreach (var c in Character.CharacterList) Consider(c);
            if (vessels && sensor != GuidanceMode.ActiveInfrared) foreach (var sub in Submarine.Loaded) Consider(sub);
            if (items && sensor == GuidanceMode.ActiveSonar) foreach (var i in Item.SonarVisibleItems) Consider(i);
        }
        return best;
    }

    // XML and wiring use display-unit pairs separated by semicolons.
    internal static Vector2[] Route(string value)
    {
        var points = new List<Vector2>();
        foreach (string pair in value.Split(';', StringSplitOptions.RemoveEmptyEntries))
        {
            var xy = pair.Split(',');
            if (xy.Length != 2 || !float.TryParse(xy[0], NumberStyles.Float, CultureInfo.InvariantCulture, out float x) ||
                !float.TryParse(xy[1], NumberStyles.Float, CultureInfo.InvariantCulture, out float y) ||
                !float.IsFinite(x) || !float.IsFinite(y)) return [];
            points.Add(new Vector2(x, y));
        }
        return points.ToArray();
    }
}
