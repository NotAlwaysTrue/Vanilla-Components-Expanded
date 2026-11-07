using System.Text.Json;
using VCE_VirtualizedMagazine;

namespace VCE.AmmoLoading;

internal sealed record AmmoPreset(string Name, AmmoRun[] Rounds, bool BuiltIn = false);

internal static class AmmoPresets
{
    private static readonly string FilePath = Path.Combine(SaveUtil.GetSaveFolder(SaveUtil.SaveType.Singleplayer), "VCE", "AmmoLoaderPresets.json");
    private static List<AmmoPreset>? saved;
    private static string? loadError;

    public static List<AmmoPreset> Saved
    {
        get
        {
            if (saved != null) { return saved; }
            try
            {
                saved = File.Exists(FilePath)
                    ? JsonSerializer.Deserialize<List<AmmoPreset>>(File.ReadAllText(FilePath)) ?? []
                    : [];
                if (saved.Any(p => p == null || string.IsNullOrWhiteSpace(p.Name) ||
                    p.Rounds == null || !AmmoPlan.IsValid(p.Rounds, AmmoPlan.MaxRounds)))
                {
                    throw new FormatException("Invalid ammo preset file.");
                }
            }
            catch (Exception e) when (e is IOException or UnauthorizedAccessException or JsonException or FormatException)
            {
                saved = [];
                loadError = e.Message;
            }
            return saved;
        }
    }

    public static bool Reorder(IReadOnlyList<AmmoPreset> visible)
    {
        var order = visible.Where(p => !p.BuiltIn).ToArray();
        var slots = Enumerable.Range(0, Saved.Count).Where(i => order.Contains(Saved[i])).ToArray();
        if (slots.Length != order.Length || order.Distinct().Count() != order.Length ||
            slots.Select(i => Saved[i]).SequenceEqual(order)) { return false; }
        // Keep presets hidden by the magazine filter in their original slots.
        for (int i = 0; i < slots.Length; i++) { Saved[slots[i]] = order[i]; }
        return true;
    }

    public static void Save()
    {
        if (loadError != null) { throw new IOException(loadError); }
        Directory.CreateDirectory(Path.GetDirectoryName(FilePath)!);
        string temporary = FilePath + ".tmp";
        File.WriteAllText(temporary, JsonSerializer.Serialize(Saved, new JsonSerializerOptions { WriteIndented = true }));
        File.Move(temporary, FilePath, overwrite: true);
    }

    public static IEnumerable<AmmoPreset> All(VirtualizedMagazine? target)
    {
        foreach (var preset in Saved) { yield return preset; }
        foreach (var prefab in MagazinePrefab.Prefabs)
        {
            if (target != null && prefab.StartSection.Concat(prefab.MainSection).Concat(prefab.EndSection)
                .Any(id => !AmmoLoader.IsCompatible(target, id.Value))) { continue; }
            int size = Math.Min(target?.MaxSize ?? (prefab.StartSection.Count + prefab.MainSection.Count + prefab.EndSection.Count),
                AmmoPlan.MaxRounds);
            var bottomFirst = prefab.EndSection.Take(size).ToList();
            int startCount = Math.Min(prefab.StartSection.Count, size - bottomFirst.Count);
            int mainCount = size - bottomFirst.Count - startCount;
            if (prefab.MainSection.Count > 0)
            {
                bottomFirst.AddRange(prefab.AutoRepeat
                    ? Enumerable.Range(0, mainCount).Select(i => prefab.MainSection[i % prefab.MainSection.Count])
                    : prefab.MainSection.Take(mainCount));
            }
            bottomFirst.AddRange(prefab.StartSection.Take(startCount));
            bottomFirst.Reverse();
            yield return new AmmoPreset(prefab.DisplayName?.Value ?? prefab.Identifier.Value,
                AmmoPlan.Compact(bottomFirst.Select(id => id.Value)).ToArray(), true);
        }
    }
}
