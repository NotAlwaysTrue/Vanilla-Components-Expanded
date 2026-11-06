using System.Reflection;
using System.Runtime.CompilerServices;
using System.Runtime.Loader;
using System.Xml.Linq;
using Barotrauma;
using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Input;
using VCE.AmmoLoading;

// Run from the mod root after building WindowsClient; no game window is created.
string root = Directory.GetCurrentDirectory();
string gameDir = Path.GetFullPath(Path.Combine(root, "../.."));
AssemblyLoadContext.Default.Resolving += (_, name) =>
{
    string path = Path.Combine(name.Name == "VanillaComponentsExpandedClient"
        ? Path.Combine(root, "bin/Windows/Client") : gameDir, name.Name + ".dll");
    return File.Exists(path) ? AssemblyLoadContext.Default.LoadFromAssemblyPath(path) : null;
};
try { Run(); }
catch (Exception e)
{
    Console.Error.WriteLine(e);
    Environment.ExitCode = 1;
}

[MethodImpl(MethodImplOptions.NoInlining)]
static void Run()
{
    const BindingFlags fields = BindingFlags.NonPublic | BindingFlags.Instance | BindingFlags.Static;
    var source = XDocument.Load("XML/Items.xml").Descendants("Item")
        .Single(e => (string?)e.Attribute("identifier") == "vceammoloader").Element("AmmoLoader")!.Element("GuiFrame")!;
    var loader = (AmmoLoader)RuntimeHelpers.GetUninitializedObject(typeof(AmmoLoader));
    var draft = new List<AmmoRun> { new("shotgunammo", 1), new("shotgunammoblunt", 1) };
    typeof(AmmoLoader).GetField("draft", fields)!.SetValue(loader, draft);
    var changeCount = typeof(AmmoLoader).GetMethod("ChangeRunCount", fields)!;
    foreach (int count in new[] { 0, 2, 20, 0, 1, 15 })
    {
        int previous = draft[0].Count;
        changeCount.Invoke(loader, new object[] { 0, count });
        if (draft.Count != 2 || draft[0].Count != (count == 0 ? previous : count) || draft[1].Count != 1)
        {
            throw new Exception($"Editing count {count} removed or changed the wrong plan row.");
        }
    }
    draft.Clear();
    changeCount.Invoke(loader, new object[] { 0, 20 });
    if (draft.Count != 0) { throw new Exception("A stale input restored a cleared plan."); }
    Console.WriteLine("PASS: clearing/retyping multi-digit quantities preserves rows; stale callbacks after clear are ignored.");
    foreach (var size in new[] { new Point(1920, 1080), new Point(1280, 720), new Point(2560, 1440) })
    {
        typeof(GameMain).GetProperty(nameof(GameMain.GraphicsWidth))!.SetValue(null, size.X);
        typeof(GameMain).GetProperty(nameof(GameMain.GraphicsHeight))!.SetValue(null, size.Y);
        var canvas = new RectTransform(size);
        loader.GuiFrame = new GUIFrame(RectTransform.Load(source, canvas, Anchor.Center), style: null);
        var frame = loader.GuiFrame.RectTransform;
        var handle = new GUIDragHandle(new RectTransform(Vector2.One, frame), frame, style: null);
        // Simulate the base component restoring its HUD bounds after a resolution change.
        handle.DragArea = new Rectangle(0, 61, size.X, size.Y - 161);
        loader.AddToGUIUpdateList();
        foreach (var delta in new[]
        {
            new Point(0, -80), new Point(0, 80), new Point(0, -20), new Point(0, 20),
            new Point(-20, 0), new Point(20, 0), new Point(-10000, 0), new Point(10000, 0)
        })
        {
            frame.ScreenSpaceOffset = Point.Zero;
            var initial = frame.Rect;
            var expected = new Point(Math.Clamp(delta.X, -initial.X, size.X - initial.Right),
                Math.Clamp(delta.Y, -initial.Y, size.Y - initial.Bottom));
            typeof(GUIDragHandle).GetField("dragStarted", fields)!.SetValue(handle, true);
            typeof(GUIDragHandle).GetField("dragStart", fields)!.SetValue(handle, new Vector2(500, 300));
            typeof(PlayerInput).GetField("mouseState", fields)!.SetValue(null,
                new MouseState(500 + delta.X, 300 + delta.Y, 0, ButtonState.Pressed,
                    ButtonState.Released, ButtonState.Released, ButtonState.Released, ButtonState.Released));
            handle.UpdateManually(1f / 60);
            if (frame.ScreenSpaceOffset != expected)
            {
                throw new Exception($"{size}: mouse delta {delta}, expected {expected}, window delta {frame.ScreenSpaceOffset}");
            }
        }
    }
    Console.WriteLine("PASS: native drag follows all four directions and screen bounds at 720p, 1080p and 1440p after HUD bounds reset.");
}
