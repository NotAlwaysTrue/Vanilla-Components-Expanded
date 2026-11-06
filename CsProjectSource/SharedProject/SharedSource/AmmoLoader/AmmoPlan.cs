namespace VCE.AmmoLoading;

public sealed record AmmoRun(string Id, int Count);

public static class AmmoPlan
{
    // shortcut: at most 96 groups / 4096 rounds per request; stream plans if larger magazines need support.
    public const int MaxGroups = 96;
    public const int MaxRounds = 4096;

    public static bool IsValid(IReadOnlyList<AmmoRun> plan, int capacity) =>
        plan.Count is > 0 and <= MaxGroups &&
        plan.All(r => r != null && !string.IsNullOrWhiteSpace(r.Id) && r.Count > 0) &&
        plan.Sum(r => (long)r.Count) <= Math.Min(capacity, MaxRounds);

    public static List<AmmoRun> Compact(IEnumerable<string> rounds)
    {
        var result = new List<AmmoRun>();
        foreach (string id in rounds)
        {
            if (result.Count > 0 && string.Equals(result[^1].Id, id, StringComparison.OrdinalIgnoreCase))
            {
                result[^1] = result[^1] with { Count = result[^1].Count + 1 };
            }
            else { result.Add(new AmmoRun(id, 1)); }
        }
        return result;
    }

    public static IEnumerable<string> Expand(IEnumerable<AmmoRun> plan) =>
        plan.SelectMany(r => Enumerable.Repeat(r.Id, r.Count));
}
