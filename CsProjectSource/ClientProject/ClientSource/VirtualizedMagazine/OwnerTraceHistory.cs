namespace VCE_VirtualizedMagazine;

internal static class OwnerTraceHistory
{
    private readonly record struct Page(ushort ProjectileId, TracePrediction Prediction, int FirstRay);
    private static readonly Dictionary<Page, int> drawn = new();
    private static readonly Queue<(Page Key, double Expires)> expiry = new();

    // Both paths deliver a contiguous prefix of the same 64-ray page. The longer
    // prefix wins, including when authority arrives first or the pellet counts differ.
    internal static int Claim(ushort projectileId, TracePrediction prediction, int firstRay, int count)
    {
        double now = Timing.TotalTime;
        while (expiry.TryPeek(out var entry) && entry.Expires <= now)
        {
            drawn.Remove(expiry.Dequeue().Key);
        }

        var page = new Page(projectileId, prediction, firstRay);
        if (!drawn.TryGetValue(page, out int previous))
        {
            expiry.Enqueue((page, now + TracePrediction.RetentionSeconds));
        }
        if (count > previous) { drawn[page] = count; }
        return Math.Min(previous, count);
    }

    internal static void Clear(GameSession session)
    {
        drawn.Clear();
        expiry.Clear();
    }
}
