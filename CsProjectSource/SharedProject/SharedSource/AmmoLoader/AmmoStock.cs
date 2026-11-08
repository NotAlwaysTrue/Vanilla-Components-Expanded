using System.Xml.Linq;

namespace VCE.AmmoLoading;

public sealed class AmmoStock
{
    private readonly Dictionary<string, int> counts = new(StringComparer.OrdinalIgnoreCase);
    public IReadOnlyDictionary<string, int> Counts => counts;
    public int this[string id] => counts.GetValueOrDefault(id);

    public bool CanAdd(IReadOnlyDictionary<string, int> amounts) =>
        amounts.Keys.Distinct(StringComparer.OrdinalIgnoreCase).Count() == amounts.Count &&
        amounts.All(p => !string.IsNullOrWhiteSpace(p.Key) && p.Value > 0 &&
            (long)this[p.Key] + p.Value <= int.MaxValue);

    public bool TryAdd(IReadOnlyDictionary<string, int> amounts)
    {
        if (!CanAdd(amounts)) { return false; }
        foreach (var p in amounts) { counts[p.Key] = this[p.Key] + p.Value; }
        return true;
    }

    public bool CanTake(IReadOnlyDictionary<string, int> amounts) =>
        amounts.Count > 0 && amounts.Keys.Distinct(StringComparer.OrdinalIgnoreCase).Count() == amounts.Count &&
        amounts.All(p => p.Value > 0 && this[p.Key] >= p.Value);

    public bool TryTake(IReadOnlyDictionary<string, int> amounts)
    {
        if (!CanTake(amounts)) { return false; }
        foreach (var p in amounts)
        {
            int remaining = this[p.Key] - p.Value;
            if (remaining == 0) { counts.Remove(p.Key); }
            else { counts[p.Key] = remaining; }
        }
        return true;
    }

    public static Dictionary<string, int> Count(IEnumerable<string> rounds) =>
        rounds.GroupBy(id => id, StringComparer.OrdinalIgnoreCase)
            .ToDictionary(g => g.Key, g => g.Count(), StringComparer.OrdinalIgnoreCase);

    public XElement Save() => new("Stock", counts.OrderBy(p => p.Key)
        .Select(p => new XElement("Ammo", new XAttribute("id", p.Key), new XAttribute("count", p.Value))));

    public void Load(XElement? element)
    {
        var restored = new Dictionary<string, int>(StringComparer.OrdinalIgnoreCase);
        foreach (var ammo in element?.Elements("Ammo") ?? Enumerable.Empty<XElement>())
        {
            string id = (string?)ammo.Attribute("id") ?? "";
            int count = (int?)ammo.Attribute("count") ?? 0;
            if (string.IsNullOrWhiteSpace(id) || count <= 0 || restored.ContainsKey(id))
            {
                throw new FormatException("Invalid or duplicate ammo stock entry.");
            }
            restored.Add(id, count);
        }
        counts.Clear();
        foreach (var p in restored) { counts.Add(p.Key, p.Value); }
    }
}
