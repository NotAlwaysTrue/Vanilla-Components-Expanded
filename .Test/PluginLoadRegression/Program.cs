using System.Collections;
using System.Reflection;
using System.Runtime.Loader;
using System.Xml.Linq;

// Run from the mod root after building; uses the installed game's real plugin loader.
string root = Directory.GetCurrentDirectory();
string gameDir = Path.GetFullPath(Path.Combine(root, "../.."));
string target = args.Single();
if (target is not ("Client" or "Server")) { throw new ArgumentException("Expected Client or Server."); }
var manifest = XDocument.Load(Path.Combine(root, "PluginInfo.xml")).Root!;
foreach (string platform in new[] { "Windows", "Linux", "Mac" })
foreach (string side in new[] { "Client", "Server" })
{
    var entries = manifest.Elements().Where(e => (string?)e.Attribute("platforms") == platform
        && (string?)e.Attribute("targets") == side).ToArray();
    if (entries.Length != 1 || entries[0].Name != "MainAssemblyInfo")
    {
        throw new Exception($"{platform}/{side}: expected exactly one main assembly.");
    }
    foreach (var entry in entries)
    {
        string path = ((string)entry.Attribute("assemblypath")!).Replace("%ModDir%", root);
        if (!File.Exists(path)) { throw new FileNotFoundException(path); }
    }
}

AssemblyLoadContext.Default.Resolving += (_, name) =>
{
    string path = Path.Combine(gameDir, name.Name + ".dll");
    return File.Exists(path) ? AssemblyLoadContext.Default.LoadFromAssemblyPath(path) : null;
};
var game = AssemblyLoadContext.Default.LoadFromAssemblyPath(Path.Combine(gameDir,
    target == "Client" ? "Barotrauma.dll" : "DedicatedServer.dll"));
const BindingFlags all = BindingFlags.Public | BindingFlags.NonPublic | BindingFlags.Instance | BindingFlags.Static;
Type Type(string name) => game.GetType("Barotrauma." + name, throwOnError: true)!;
var package = Activator.CreateInstance(Type("RegularPackage"), all, null,
    new object[] { XDocument.Load(Path.Combine(root, "filelist.xml")), Path.Combine(root, "filelist.xml") }, null)!;
var pathFactory = Type("ContentPath").GetMethods(all).Single(m => m.Name == "FromRaw" && m.GetParameters().Length == 2);
var contentPath = pathFactory.Invoke(null, new[] { package, Path.Combine(root, "PluginInfo.xml") });
var plugin = Activator.CreateInstance(Type("PluginInfoFile"), all, null, new[] { package, contentPath }, null)!;
Type("PluginInfoFile").GetMethod("LoadFile", all)!.Invoke(plugin, null);
var loadedData = (IEnumerable)Type("PluginData").GetField("LoadedPluginData", all)!.GetValue(null)!;
var componentTypes = loadedData.Cast<object>().SelectMany(data =>
    ((IEnumerable)Type("PluginData").GetField("ItemComponents", all)!.GetValue(data)!).Cast<Type>())
    .ToArray();
var components = componentTypes.Select(type => type.Name).ToHashSet();
foreach (string component in new[] { "SwitchableRangedWeapon", "VirtualizedMagazine", "VirtualizedAmmoStorage", "AmmoLoader" })
{
    if (!components.Contains(component)) { throw new Exception($"Not registered: {component}"); }
}
if (components.Contains("AmmoPackage") || components.Contains("VirtualizedAmmoLoader"))
{ throw new Exception("A redundant ammo package or loader component is still registered."); }
foreach (string contract in new[] { "IServerSerializable", "IClientSerializable" })
{
    if (!componentTypes.Single(t => t.Name == "AmmoLoader").GetInterfaces().Any(t => t.Name == contract))
    { throw new Exception($"The single AmmoLoader component must implement {contract}."); }
}
var loaderItem = XDocument.Load(Path.Combine(root, "XML/Items.xml")).Descendants("Item")
    .Single(e => (string?)e.Attribute("identifier") == "vceammoloader");
var loaderConfig = loaderItem.Elements("AmmoLoader").Single();
if (loaderItem.Element("VirtualizedAmmoLoader") != null || (int?)loaderConfig.Attribute("inputcontainerindex") != 0 ||
    (int?)loaderConfig.Attribute("targetcontainerindex") != 1 || loaderConfig.Element("GuiFrame") == null)
{ throw new Exception("Loader XML must bind both containers and the UI on a single AmmoLoader component."); }
Console.WriteLine($"Real {target} plugin loader: SWR, magazine, VCE storage and single AmmoLoader registered; XML and all six manifest variants valid.");
