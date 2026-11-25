namespace VCE_Airburst;

internal static class AirburstBallistics
{
    // Same linear-drag model as TrajectoryCalculator. All inputs are in simulation units.
    internal static Vector2 Position(Vector2 velocity, Vector2 gravity, float drag, float t)
    {
        if (drag <= 0.0001f) return velocity * t + gravity * (0.5f * t * t);
        Vector2 terminal = gravity / drag;
        return terminal * t + (velocity - terminal) * ((1f - MathF.Exp(-drag * t)) / drag);
    }

    internal static float TimeAtRange(Vector2 velocity, Vector2 gravity, float drag, float range, bool chord)
    {
        if (gravity == Vector2.Zero && drag <= 0.0001f)
            return velocity.Length() > 0 ? range / velocity.Length() : float.PositiveInfinity;

        Vector2 previous = Vector2.Zero;
        float path = 0, previousTime = 0;
        // Fine steps near launch, coarser samples for long flights. Interpolate the crossing.
        for (float dt = 1f / 60; previousTime < 600; dt = Math.Min(1, dt * 1.025f))
        {
            float t = previousTime + dt;
            Vector2 point = Position(velocity, gravity, drag, t);
            float next = chord ? point.Length() : path + Vector2.Distance(point, previous);
            if (next >= range && next > path)
                return previousTime + dt * ((range - path) / (next - path));
            if (gravity == Vector2.Zero && next == path) break;
            (previous, previousTime, path) = (point, t, next);
        }
        return float.PositiveInfinity;
    }
}
