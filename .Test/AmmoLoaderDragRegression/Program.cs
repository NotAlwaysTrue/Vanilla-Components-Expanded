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
    var addRun = typeof(AmmoLoader).GetMethod("AddRun", fields)!;
    void Add(string id, int count) => addRun.Invoke(loader, new object[] { id, count });
    Add("normal", 5);
    Add("NORMAL", 10);
    Add("tracer", 2);
    Add("tracer", 0);
    Add("tracer", -1);
    Add("tracer", int.MaxValue);
    if (draft.Count != 2 || draft[0].Count != 15 || draft[1].Count != 2)
    {
        throw new Exception("Batch additions did not merge adjacent ammunition or rejected values changed the plan.");
    }
    draft.Clear();
    Add("normal", AmmoPlan.MaxRounds - 1);
    Add("normal", 2);
    if (draft[0].Count != AmmoPlan.MaxRounds - 1) { throw new Exception("An oversized batch partially changed the plan."); }
    Add("normal", 1);
    if (draft[0].Count != AmmoPlan.MaxRounds) { throw new Exception("An exact-limit batch was rejected."); }
    draft.Clear();
    for (int i = 0; i < AmmoPlan.MaxGroups; i++) { Add(i % 2 == 0 ? "normal" : "tracer", 1); }
    Add("normal", 5);
    if (draft.Count != AmmoPlan.MaxGroups || draft.Sum(r => r.Count) != AmmoPlan.MaxGroups)
    {
        throw new Exception("Batch addition exceeded the group limit.");
    }
    Add("tracer", 5);
    if (draft.Count != AmmoPlan.MaxGroups || draft[^1].Count != 6)
    {
        throw new Exception("Appending to the last group was rejected at the group limit.");
    }
    draft.Clear();
    Console.WriteLine("PASS: batch additions merge adjacent rounds and atomically respect round/group limits.");
    var reorderRuns = typeof(AmmoLoader).GetMethod("ReorderRuns", fields)!;
    void Reorder(params int[] order) => reorderRuns.Invoke(loader, new object[] { order });
    draft.AddRange(new[] { new AmmoRun("normal", 20), new AmmoRun("tracer", 5), new AmmoRun("blunt", 10) });
    Reorder(2, 0, 1);
    if (!draft.Select(r => r.Id).SequenceEqual(new[] { "blunt", "normal", "tracer" }))
    { throw new Exception("Dragging to the beginning did not preserve the intervening order."); }
    Reorder(1, 2, 0);
    var beforeInvalid = draft.ToArray();
    Reorder(0, 0, 2);
    Reorder(0, 1);
    Reorder(0, 1, 3);
    if (!draft.SequenceEqual(beforeInvalid)) { throw new Exception("Invalid/stale drag order changed the plan."); }
    draft.Clear();
    draft.AddRange(new[] { new AmmoRun("normal", 20), new AmmoRun("tracer", 5), new AmmoRun("normal", 10) });
    Reorder(0, 2, 1);
    if (draft.Count != 2 || draft[0] != new AmmoRun("normal", 30) || draft[1] != new AmmoRun("tracer", 5))
    { throw new Exception("Drag reorder did not merge adjacent rounds while conserving ammunition."); }
    draft.Clear();
    Console.WriteLine("PASS: drag reorder moves groups in both directions, rejects stale indices and merges adjacent ammunition.");
    var presetType = typeof(AmmoLoader).Assembly.GetType("VCE.AmmoLoading.AmmoPreset")!;
    var presetsType = typeof(AmmoLoader).Assembly.GetType("VCE.AmmoLoading.AmmoPresets")!;
    var savedField = presetsType.GetField("saved", fields)!;
    var previousSaved = savedField.GetValue(null);
    var testSaved = (System.Collections.IList)Activator.CreateInstance(typeof(List<>).MakeGenericType(presetType))!;
    object Preset(string name, bool builtIn = false) => Activator.CreateInstance(presetType, name, new[] { new AmmoRun("normal", 1) }, builtIn)!;
    object a = Preset("A"), hidden = Preset("hidden"), b = Preset("B"), c = Preset("C"), builtIn = Preset("mod", true);
    bool OrderPresets(params object[] order)
    {
        var typed = Array.CreateInstance(presetType, order.Length);
        for (int i = 0; i < order.Length; i++) { typed.SetValue(order[i], i); }
        return (bool)presetsType.GetMethod("Reorder")!.Invoke(null, new object[] { typed })!;
    }
    try
    {
        foreach (object preset in new[] { a, hidden, b, c }) { testSaved.Add(preset); }
        savedField.SetValue(null, testSaved);
        if (!OrderPresets(c, builtIn, a, b) || !testSaved.Cast<object>().SequenceEqual(new[] { c, hidden, a, b }))
        { throw new Exception("Filtered preset drag moved a hidden preset or included a built-in preset."); }
        if (OrderPresets(c, a, b) || OrderPresets(c, c, b) || OrderPresets(Preset("unknown"), a, b) ||
            !testSaved.Cast<object>().SequenceEqual(new[] { c, hidden, a, b }))
        { throw new Exception("An unchanged or invalid preset drag modified saved presets."); }
    }
    finally { savedField.SetValue(null, previousSaved); }
    Console.WriteLine("PASS: preset drag preserves filtered-out entries, excludes built-ins and rejects invalid orders.");
    typeof(GameMain).GetProperty(nameof(GameMain.GraphicsWidth))!.SetValue(null, 1920);
    typeof(GameMain).GetProperty(nameof(GameMain.GraphicsHeight))!.SetValue(null, 1080);
    GUIStyle.ComponentStyles.Add(new GUIComponentStyle(new ContentXElement(null,
        XElement.Parse("<GUIScrollBar><GUIFrameVertical /><GUIButtonVertical /></GUIScrollBar>")), null), false);
    var dragList = new GUIListBox(new RectTransform(new Point(400, 300)), style: null)
    {
        CurrentDragMode = GUIListBox.DragMode.DragWithinBox,
        CurrentSelectMode = GUIListBox.SelectMode.None,
        CanTakeKeyBoardFocus = false,
        PlaySoundOnDragStop = false
    };
    typeof(AmmoLoader).GetField("presetList", fields)!.SetValue(loader, dragList);
    foreach (string buttonField in new[] { "presetLoadButton", "presetDelete" })
    {
        typeof(AmmoLoader).GetField(buttonField, fields)!.SetValue(loader,
            new GUIButton(new RectTransform(new Point(100, 30)), style: null));
    }
    var selectionParameters = typeof(GUIListBox).GetField("OnSelected")!.FieldType.GetMethod("Invoke")!
        .GetParameters().Select(p => p.ParameterType).ToArray();
    var selectionCallback = typeof(AmmoLoader).GetNestedTypes(fields).Append(typeof(AmmoLoader))
        .SelectMany(t => t.GetMethods(fields)).Single(m => m.Name.StartsWith("<CreateGUI>") &&
        m.ReturnType == typeof(bool) && m.GetParameters().Select(p => p.ParameterType).SequenceEqual(selectionParameters));
    var selectionOwner = RuntimeHelpers.GetUninitializedObject(selectionCallback.DeclaringType!);
    selectionCallback.DeclaringType!.GetFields(fields | BindingFlags.Public).Single(f => f.FieldType == typeof(AmmoLoader))
        .SetValue(selectionOwner, loader);
    var confirming = typeof(AmmoLoader).GetField("confirmingReplace", fields)!;
    typeof(AmmoLoader).GetField("selectedPreset", fields)!.SetValue(loader, a);
    confirming.SetValue(loader, true);
    selectionCallback.Invoke(selectionOwner, new[] { null, a });
    if (!(bool)confirming.GetValue(loader)!) { throw new Exception("Refreshing the selected preset canceled replacement confirmation."); }
    selectionCallback.Invoke(selectionOwner, new[] { null, b });
    if ((bool)confirming.GetValue(loader)!) { throw new Exception("Selecting another preset retained stale replacement confirmation."); }
    Console.WriteLine("PASS: preset reselection preserves replacement confirmation; changing selection clears it.");
    var firstRow = new GUIFrame(new RectTransform(new Point(350, 32), dragList.Content.RectTransform), style: null)
        { CanBeFocused = true, UserData = 0 };
    _ = new GUIFrame(new RectTransform(new Point(350, 32), dragList.Content.RectTransform), style: null)
        { CanBeFocused = true, UserData = 1 };
    bool reordered = false;
    dragList.OnRearranged = (list, _) => reordered = list.HasDraggedElementIndexChanged &&
        list.Content.Children.Select(c => (int)c.UserData).SequenceEqual(new[] { 1, 0 });
    void MouseAt(Point point, ButtonState button)
    {
        var mouse = typeof(PlayerInput).GetField("mouseState", fields)!;
        typeof(PlayerInput).GetField("oldMouseState", fields)!.SetValue(null, mouse.GetValue(null));
        mouse.SetValue(null, new MouseState(point.X, point.Y, 0, button,
            ButtonState.Released, ButtonState.Released, ButtonState.Released, ButtonState.Released));
    }
    dragList.ForceLayoutRecalculation();
    var dragStart = firstRow.Rect.Center;
    MouseAt(dragStart, ButtonState.Released);
    // Exercise the real input path without creating a native window or graphics device.
    var headlessGame = (GameMain)RuntimeHelpers.GetUninitializedObject(typeof(GameMain));
    var platformType = typeof(Game).Assembly.GetType("Microsoft.Xna.Framework.SdlGamePlatform")!;
    var platform = RuntimeHelpers.GetUninitializedObject(platformType);
    GC.SuppressFinalize(headlessGame);
    GC.SuppressFinalize(platform);
    platformType.BaseType!.GetField("_isActive", fields)!.SetValue(platform, true);
    typeof(Game).GetField("Platform", fields)!.SetValue(headlessGame, platform);
    typeof(GameMain).GetProperty(nameof(GameMain.Instance))!.SetValue(null, headlessGame);
    typeof(PlayerInput).GetField("allowInput", fields)!.SetValue(null, true);
    GUI.ForceMouseOn(firstRow);
    MouseAt(dragStart, ButtonState.Pressed);
    dragList.UpdateManually(1f / 60);
    if (dragList.DraggedElement != firstRow) { throw new Exception("Native list did not start dragging the plan row."); }
    MouseAt(dragStart + new Point(0, 70), ButtonState.Pressed);
    dragList.UpdateManually(1f / 60);
    MouseAt(dragStart + new Point(0, 70), ButtonState.Released);
    dragList.UpdateManually(1f / 60);
    if (!reordered || dragList.DraggedElement != null) { throw new Exception("Native list did not publish the reordered rows on release."); }
    GUI.ForceMouseOn(null);
    typeof(GameMain).GetProperty(nameof(GameMain.Instance))!.SetValue(null, null);
    typeof(PlayerInput).GetField("allowInput", fields)!.SetValue(null, false);
    Console.WriteLine("PASS: native GUIListBox starts, reorders and releases draggable rows with selection disabled.");
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
