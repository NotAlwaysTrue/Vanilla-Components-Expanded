using System.Text;
using System.Xml;
using System.Xml.Linq;

namespace VCE_VirtualizedMagazine;

/// <summary>
/// Player-made loadout presets. Every preset is a <see cref="MagazinePrefab"/> backed by one XML file named
/// "[Name]_Magazine.xml" inside the <see cref="FolderName"/> folder under <c>SettingsService.SaveFolder</c>.
/// Files are only touched by <see cref="Load"/> and <see cref="Save"/>, which the game save/load hooks call;
/// editing a preset in the UI stays in memory. Multiplayer writes are performed by the server only.
/// </summary>
public static class MagazinePresetLibrary
{
    public const string FileSuffix = "_Magazine.xml";
    public const int MaxNameLength = 48;
    /// <summary>Custom presets live in their own folder, so they stay apart from the other VCE settings files.</summary>
    public const string FolderName = "CustomMagazinePrefab";

    private static readonly List<MagazinePrefab> custom = [];
    // Presets found in this machine's folder. On the authority they are the same objects as `custom`; on a client they
    // are only candidates for upload, so they are kept apart and never replace the server's list.
    private static readonly List<MagazinePrefab> local = [];
    // Files this session read successfully; only these may be deleted when their preset is gone.
    private static readonly HashSet<string> known = new(StringComparer.OrdinalIgnoreCase);
    private static string? loadError;

    public static IReadOnlyList<MagazinePrefab> Custom => custom;
    public static string? LoadError => loadError;

    public static bool IsAuthority => GameMain.NetworkMember is not { IsClient: true };

    private static string? Folder => VanillaComponentsExpanded.VCEPlugin.SettingsService?.SaveFolder is { Length: > 0 } root
        ? Path.Combine(root, FolderName) : null;

    /// <summary>Drops the in-memory lists when the plugin unloads or reloads; the files stay on disk.</summary>
    public static void Dispose()
    {
        custom.Clear();
        local.Clear();
        known.Clear();
        loadError = null;
    }

    public static bool IsCustom(MagazinePrefab prefab) => custom.Contains(prefab);

    public static string GetName(MagazinePrefab prefab) =>
        prefab.DisplayName?.Value is { Length: > 0 } name ? name : prefab.Identifier.Value;

    public static AmmoRun[] GetRuns(MagazinePrefab prefab, int capacity) =>
        AmmoPlan.Compact(prefab.CreateAmmoArray(Math.Clamp(capacity, 0, AmmoPlan.MaxRounds))
            .Reverse().Select(id => id.Value)).ToArray();

    public static AmmoRun[] GetRuns(MagazinePrefab prefab) => GetRuns(prefab, prefab.TotalCount);

    /// <summary>Sections of a preset in firing order (start, main, end), for the editor.</summary>
    public static (AmmoRun[] Start, AmmoRun[] Main, AmmoRun[] End) GetSections(MagazinePrefab prefab) =>
        (Runs(prefab.StartSection), Runs(prefab.MainSection), Runs(prefab.EndSection));

    /// <summary>Adds one round to the preset's main section, keeping its start/end sections intact.</summary>
    public static MagazinePrefab? AppendToMain(MagazinePrefab prefab, string id) =>
        Create(GetName(prefab), Runs(prefab.StartSection),
            AmmoPlan.Compact([.. prefab.MainSection.Select(i => i.Value), id]), Runs(prefab.EndSection));

    private static AmmoRun[] Runs(IEnumerable<Identifier> ids) =>
        AmmoPlan.Compact(ids.Select(id => id.Value)).ToArray();

    /// <summary>
    /// The presets this machine owns: only the ones built here (save folder / network), never the prefabs that other
    /// content files register in <see cref="MagazinePrefab.Prefabs" />. Rounds are in firing order.
    /// </summary>
    public static IEnumerable<MagazinePrefab> All(VirtualizedMagazine? target)
    {
        foreach (var prefab in custom.ToArray())
        {
            if (target != null && prefab.StartSection.Concat(prefab.MainSection).Concat(prefab.EndSection)
                .Any(id => !AmmoLoader.IsCompatible(target, id.Value))) { continue; }

            yield return prefab;
        }
    }

    public static MagazinePrefab? Find(string name) =>
        custom.FirstOrDefault(p => string.Equals(GetName(p), (name ?? "").Trim(), StringComparison.OrdinalIgnoreCase));

    /// <summary>
    /// Presets that exist only in this machine's folder: the UI lists them greyed out with an upload button, because the
    /// list this machine actually uses (the server's, in multiplayer) does not contain them yet. On the authority the
    /// local presets are already in <see cref="custom" />, so nothing is returned there.
    /// </summary>
    public static IEnumerable<MagazinePrefab> LocalOnly(VirtualizedMagazine? target)
    {
        // On the authority the local folder already is the list, so there is never anything left to upload.
        if (IsAuthority) { yield break; }

        foreach (var prefab in local.ToArray())
        {
            if (Find(GetName(prefab)) != null) { continue; }
            if (target != null && prefab.StartSection.Concat(prefab.MainSection).Concat(prefab.EndSection)
                .Any(id => !AmmoLoader.IsCompatible(target, id.Value))) { continue; }

            yield return prefab;
        }
    }

    /// <summary>Creates or replaces the preset with this name. No file is written here.</summary>
    public static MagazinePrefab? Create(string name, IReadOnlyList<AmmoRun> runs) => Create(name, [], runs, []);

    /// <summary>Creates or replaces a preset with explicit start/main/end sections (MagazinePrefab order).</summary>
    public static MagazinePrefab? Create(string name, IReadOnlyList<AmmoRun> start, IReadOnlyList<AmmoRun> main,
        IReadOnlyList<AmmoRun> end)
    {
        name = (name ?? "").Trim();
        var all = AmmoPlan.Compact([.. AmmoPlan.Expand(start), .. AmmoPlan.Expand(main), .. AmmoPlan.Expand(end)]);
        if (name.Length is 0 or > MaxNameLength || !AmmoPlan.IsValid(all, AmmoPlan.MaxRounds)) { return null; }

        var prefab = Build(name, start, main, end);
        var existing = Find(name);
        if (existing == null) { custom.Add(prefab); }
        else { custom[custom.IndexOf(existing)] = prefab; }
        return prefab;
    }

    public static bool Remove(MagazinePrefab prefab)
    {
        // The same name must stop being offered as a local preset too, otherwise deleting it would resurrect it as grey.
        string name = GetName(prefab);
        local.RemoveAll(p => string.Equals(GetName(p), name, StringComparison.OrdinalIgnoreCase));
        return custom.Remove(prefab);
    }

    /// <summary>Moves one preset to <paramref name="index" /> inside the custom list.</summary>
    public static bool Move(MagazinePrefab prefab, int index)
    {
        int current = custom.IndexOf(prefab);
        if (current < 0 || custom.Count == 0) { return false; }
        index = Math.Clamp(index, 0, custom.Count - 1);
        if (index == current) { return false; }

        custom.RemoveAt(current);
        custom.Insert(index, prefab);
        return true;
    }

    /// <summary>Sections of every custom preset, for the authority to publish to clients.</summary>
    public static IReadOnlyList<(string Name, AmmoRun[] Start, AmmoRun[] Main, AmmoRun[] End)> Snapshot()
    {
        var result = new List<(string Name, AmmoRun[] Start, AmmoRun[] Main, AmmoRun[] End)>(custom.Count);
        foreach (var prefab in custom)
        {
            var (start, main, end) = GetSections(prefab);
            result.Add((GetName(prefab), start, main, end));
        }
        return result;
    }

    /// <summary>Replaces the custom list with the server's presets. Clients never read the save folder.</summary>
    public static void ApplyRemote(IEnumerable<(string Name, AmmoRun[] Start, AmmoRun[] Main, AmmoRun[] End)> presets)
    {
        var incoming = presets.ToArray();
        // Snapshots arrive on every state change, so skip the rebuild when nothing moved.
        if (incoming.Length == custom.Count && incoming.Select((p, i) =>
                string.Equals(GetName(custom[i]), p.Name, StringComparison.OrdinalIgnoreCase) &&
                SameSections(custom[i], p)).All(same => same)) { return; }

        custom.Clear();
        known.Clear();
        loadError = null;
        foreach (var (name, start, main, end) in incoming)
        {
            if (Create(name, start, main, end) == null) { loadError = "The server sent an invalid preset."; }
        }
    }

    private static bool SameSections(MagazinePrefab prefab,
        (string Name, AmmoRun[] Start, AmmoRun[] Main, AmmoRun[] End) other)
    {
        var (start, main, end) = GetSections(prefab);
        return start.SequenceEqual(other.Start) && main.SequenceEqual(other.Main) && end.SequenceEqual(other.End);
    }

    /// <summary>Reads every preset file. Called when the game loads.</summary>
    public static void Load()
    {
        custom.Clear();
        known.Clear();
        local.Clear();
        loadError = null;
        if (Folder is not { } folder || !Directory.Exists(folder)) { return; }
        // Every file is remembered as a local preset. Only the authority also makes them the list it publishes, because
        // a client's list is replaced by the server's and its files are merely presets waiting to be uploaded.
        bool authority = IsAuthority;
        try
        {
            foreach (string path in Directory.GetFiles(folder, "*" + FileSuffix).OrderBy(p => p, StringComparer.OrdinalIgnoreCase))
            {
                try
                {
                    var prefab = Parse(path);
                    local.Add(prefab);
                    if (!authority) { continue; }
                    custom.Add(prefab);
                    known.Add(Path.GetFileName(path));
                }
                catch (Exception e) when (e is IOException or UnauthorizedAccessException or XmlException or FormatException or ArgumentException)
                {
                    // Unreadable files are never deleted, so a broken preset can still be fixed by hand.
                    loadError ??= e.Message;
                    VanillaComponentsExpanded.VCEPlugin.DebugConsole.AddWarning(
                        $"Magazine preset '{Path.GetFileName(path)}' skipped: {e.Message}");
                }
            }
        }
        catch (Exception e) when (e is IOException or UnauthorizedAccessException)
        {
            loadError = e.Message;
            VanillaComponentsExpanded.VCEPlugin.DebugConsole.AddWarning($"Magazine presets could not be read: {e.Message}");
        }
    }

    /// <summary>Writes every preset file and deletes files of removed presets. Called when the game saves.</summary>
    public static void Save()
    {
        // Multiplayer: the server owns the files. Singleplayer: the local player does.
        if (!IsAuthority) { return; }
        if (Folder is not { } folder)
        {
            VanillaComponentsExpanded.VCEPlugin.DebugConsole.AddWarning("Magazine presets could not be saved: no save folder.");
            return;
        }
        try
        {
            Directory.CreateDirectory(folder);
            var written = new HashSet<string>(StringComparer.OrdinalIgnoreCase);
            foreach (var prefab in custom)
            {
                string path = Path.Combine(folder, FileName(GetName(prefab), written));
                written.Add(Path.GetFileName(path));
                Write(prefab, path);
            }
            foreach (string path in Directory.GetFiles(folder, "*" + FileSuffix))
            {
                string fileName = Path.GetFileName(path);
                if (written.Contains(fileName) || !known.Contains(fileName)) { continue; }
                try { File.Delete(path); } catch (IOException) { } catch (UnauthorizedAccessException) { }
            }
        }
        catch (Exception e) when (e is IOException or UnauthorizedAccessException)
        {
            VanillaComponentsExpanded.VCEPlugin.DebugConsole.AddWarning($"Magazine presets could not be saved: {e.Message}");
        }
    }

    /// <summary>Builds the preset element in the MagazinePrefab format: one group per section.</summary>
    private static MagazinePrefab Build(string name, IReadOnlyList<AmmoRun> start, IReadOnlyList<AmmoRun> main,
        IReadOnlyList<AmmoRun> end)
    {
        var root = new XElement("MagazinePrefab",
            new XAttribute("identifier", MakeIdentifier(name)),
            new XAttribute("name", name),
            new XAttribute("AutoRepeat", false));
        void AddGroup(string element, IReadOnlyList<AmmoRun> runs)
        {
            var group = new XElement(element);
            // MagazinePrefab parses rounds in file order, which is firing order.
            foreach (var run in runs)
            {
                if (run.Count <= 0) { continue; }
                group.Add(new XElement("Ammo",
                    new XAttribute("ProjectileIdentifier", run.Id),
                    new XAttribute("Amount", run.Count)));
            }
            if (group.HasElements) { root.Add(group); }
        }
        AddGroup("StartAmmoGroup", start);
        AddGroup("AmmoGroup", main);
        AddGroup("EndAmmoGroup", end);
        return new MagazinePrefab(new ContentXElement(null, root), null);
    }

    private static MagazinePrefab Parse(string path)
    {
        var root = XDocument.Load(path).Root ?? throw new FormatException("The file is empty.");
        if (string.Equals(root.Name.LocalName, "MagazinePrefabs", StringComparison.OrdinalIgnoreCase))
        {
            root = root.Elements().FirstOrDefault() ?? throw new FormatException("The file contains no preset.");
        }
        var prefab = new MagazinePrefab(new ContentXElement(null, root), null);
        if (prefab.TotalCount <= 0) { throw new FormatException("The preset contains no rounds."); }
        if (prefab.TotalCount > AmmoPlan.MaxRounds) { throw new FormatException("The preset is too large."); }
        return prefab;
    }

    private static void Write(MagazinePrefab prefab, string path)
    {
        string text = ToXml(prefab).ToString();
        if (File.Exists(path) && File.ReadAllText(path, Encoding.UTF8) == text) { return; }
        string temporary = path + ".tmp";
        File.WriteAllText(temporary, text, new UTF8Encoding(encoderShouldEmitUTF8Identifier: false));
        File.Move(temporary, path, overwrite: true);
    }

    private static XElement ToXml(MagazinePrefab prefab)
    {
        var root = prefab.Element == null
            ? new XElement("MagazinePrefab", new XElement("AmmoGroup"))
            : new XElement(prefab.Element);
        root.SetAttributeValue("identifier", prefab.Identifier.Value);
        root.SetAttributeValue("name", GetName(prefab));
        root.SetAttributeValue("AutoRepeat", false);
        return root;
    }

    private static string FileName(string name, HashSet<string> used)
    {
        string stem = Sanitize(name);
        string candidate = stem + FileSuffix;
        for (int i = 2; !used.Add(candidate); i++) { candidate = stem + "_" + i + FileSuffix; }
        return candidate;
    }

    private static string MakeIdentifier(string name)
    {
        string sanitized = Sanitize(name).ToLowerInvariant();
        return sanitized.Length == 0 ? "vcepreset" : "vcepreset_" + sanitized;
    }

    private static string Sanitize(string name)
    {
        var builder = new StringBuilder(name.Length);
        foreach (char c in name.Trim())
        {
            builder.Append(char.IsLetterOrDigit(c) || c is '_' or '-' ? c : '_');
        }
        string result = builder.ToString().Trim('_', '.', ' ');
        return result.Length == 0 ? "preset" : result;
    }
}
