using System.Reflection;
using System.Collections.Immutable;
using System.Runtime.CompilerServices;
using System.Runtime.Loader;
using System.Xml.Linq;
using Barotrauma;
using Barotrauma.Items.Components;
using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Input;
using VCE.AmmoLoading;
using VCE_VirtualizedMagazine;

// Run from the mod root after building WindowsClient; no game window is created.
string root = Directory.GetCurrentDirectory();
string gameDir = Path.GetFullPath(Path.Combine(root, "../.."));
// A staged client directory lets the regression run while the game holds the deployed DLL.
string clientDir = args.Length == 0 ? Path.Combine(root, "bin/Windows/Client") : Path.GetFullPath(args[0]);
AssemblyLoadContext.Default.Resolving += (_, name) =>
{
    string path = Path.Combine(name.Name == "VanillaComponentsExpandedClient"
        ? clientDir : gameDir, name.Name + ".dll");
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
    foreach (var (input, output, target) in new[] { (0, 1, 2), (0, 2, 1), (2, 0, 1) })
    {
        var owner = (Item)RuntimeHelpers.GetUninitializedObject(typeof(Item));
        var configured = new AmmoLoader(owner, new ContentXElement(null, XElement.Parse(
            $"<AmmoLoader inputcontainerindex='{input}' outputcontainerindex='{output}' targetcontainerindex='{target}' />")));
        if (configured.InputContainerIndex != input || configured.OutputContainerIndex != output || configured.TargetContainerIndex != target)
        { throw new Exception($"Native XML container indices changed: expected {input}/{output}/{target}, got {configured.InputContainerIndex}/{configured.OutputContainerIndex}/{configured.TargetContainerIndex}."); }
        configured.Load(new ContentXElement(null, XElement.Parse(
            "<AmmoLoader inputcontainerindex='0' outputcontainerindex='2' targetcontainerindex='1' />")), false, null!, false);
        if (configured.InputContainerIndex != input || configured.OutputContainerIndex != output || configured.TargetContainerIndex != target)
        { throw new Exception("Saved container indices replaced the current prefab's mapping."); }
        var saved = configured.Save(new XElement("Item"));
        if (saved.Attributes().Any(a => a.Name.LocalName.EndsWith("containerindex", StringComparison.OrdinalIgnoreCase)))
        { throw new Exception("Container configuration was persisted as mutable machine state."); }
    }
    Console.WriteLine("PASS: native construction/load/save keeps three prefab container orders and ignores obsolete saved indices.");
    var source = XDocument.Load(".Test/AmmoLoader/AmmoLoaderItems.xml").Descendants("Item")
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
    if (draft.Count != 2 || draft[0] != new AmmoRun("tracer", 2) ||
        !string.Equals(draft[1].Id, "normal", StringComparison.OrdinalIgnoreCase) || draft[1].Count != 15)
    {
        throw new Exception("Batch additions did not prepend and merge adjacent ammunition or rejected values changed the plan.");
    }
    Add("ap", 3);
    if (!AmmoPlan.Expand(draft).SequenceEqual(Enumerable.Repeat("ap", 3).Concat(Enumerable.Repeat("tracer", 2))
        .Concat(Enumerable.Repeat("normal", 15)), StringComparer.OrdinalIgnoreCase))
    { throw new Exception("Prepending ammunition changed the existing rounds' firing order."); }
    draft.Clear();
    Add("normal", AmmoPlan.MaxRounds - 1);
    Add("normal", 2);
    if (draft[0].Count != AmmoPlan.MaxRounds) { throw new Exception("A batch did not fill the final available round at the global limit."); }
    Add("normal", 1);
    if (draft[0].Count != AmmoPlan.MaxRounds) { throw new Exception("A full plan accepted another round."); }
    draft.Clear();
    for (int i = 0; i < AmmoPlan.MaxGroups; i++) { Add(i % 2 == 0 ? "normal" : "tracer", 1); }
    Add("normal", 5);
    if (draft.Count != AmmoPlan.MaxGroups || draft.Sum(r => r.Count) != AmmoPlan.MaxGroups)
    {
        throw new Exception("Batch addition exceeded the group limit.");
    }
    Add("tracer", 5);
    if (draft.Count != AmmoPlan.MaxGroups || draft[0] != new AmmoRun("tracer", 6))
    {
        throw new Exception("Adding to the first group was rejected at the group limit.");
    }
    draft.Clear();
    Console.WriteLine("PASS: batch additions prepend without reordering existing rounds, merge the first group, fill remaining round capacity and respect group limits.");
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
    var reorderRounds = typeof(AmmoLoader).GetMethod("ReorderRounds", fields)!;
    void RoundOrder(params int[] order) => reorderRounds.Invoke(loader, new object[] { order });
    var originalPlan = new[] { new AmmoRun("normal", 18), new AmmoRun("ap", 10), new AmmoRun("tracer", 2) };
    draft.AddRange(originalPlan);
    var swapBoundaryRounds = Enumerable.Range(0, 17).Concat(new[] { 18, 17 }).Concat(Enumerable.Range(19, 11)).ToArray();
    RoundOrder(swapBoundaryRounds);
    if (!draft.SequenceEqual(new[] { new AmmoRun("normal", 17), new AmmoRun("ap", 1),
        new AmmoRun("normal", 1), new AmmoRun("ap", 9), new AmmoRun("tracer", 2) }))
    { throw new Exception("Moving one AP round did not split and update the grouped draft."); }
    RoundOrder(swapBoundaryRounds);
    if (!draft.SequenceEqual(originalPlan)) { throw new Exception("Moving the round back did not merge the adjacent groups."); }
    var originalRounds = AmmoPlan.Expand(draft).ToArray();
    RoundOrder(new[] { 29 }.Concat(Enumerable.Range(0, 29)).ToArray());
    if (!AmmoPlan.Expand(draft).SequenceEqual(new[] { originalRounds[^1] }.Concat(originalRounds.Take(29))))
    { throw new Exception("Dragging a round to the beginning changed the other rounds' firing order."); }
    RoundOrder(Enumerable.Range(1, 29).Append(0).ToArray());
    if (!draft.SequenceEqual(originalPlan)) { throw new Exception("Dragging the round back did not restore the original plan."); }
    RoundOrder(0, 1);
    RoundOrder(Enumerable.Repeat(0, 30).ToArray());
    RoundOrder(Enumerable.Range(0, 29).Append(30).ToArray());
    RoundOrder(Enumerable.Range(0, 29).Append(-1).ToArray());
    if (!draft.SequenceEqual(originalPlan)) { throw new Exception("An invalid or stale per-round edit modified the plan."); }
    draft.Clear();
    for (int i = 0; i < AmmoPlan.MaxGroups; i++) { draft.Add(new AmmoRun(i % 2 == 0 ? "normal" : "ap", 2)); }
    var beforeSplitLimit = draft.ToArray();
    typeof(AmmoLoader).GetField("draftDirty", fields)!.SetValue(loader, false);
    typeof(AmmoLoader).GetField("uiDirty", fields)!.SetValue(loader, false);
    RoundOrder(new[] { 0, 2, 1 }.Concat(Enumerable.Range(3, AmmoPlan.MaxGroups * 2 - 3)).ToArray());
    if (!draft.SequenceEqual(beforeSplitLimit) || (bool)typeof(AmmoLoader).GetField("draftDirty", fields)!.GetValue(loader)! ||
        !(bool)typeof(AmmoLoader).GetField("uiDirty", fields)!.GetValue(loader)!)
    { throw new Exception("An over-limit split changed the draft or failed to restore the displayed order."); }
    draft.Clear();
    draft.AddRange(new[] { new AmmoRun("normal", AmmoPlan.MaxRounds - 1), new AmmoRun("ap", 1) });
    RoundOrder(Enumerable.Range(0, AmmoPlan.MaxRounds - 2).Concat(new[] { AmmoPlan.MaxRounds - 1, AmmoPlan.MaxRounds - 2 }).ToArray());
    if (!draft.SequenceEqual(new[] { new AmmoRun("normal", AmmoPlan.MaxRounds - 2), new AmmoRun("ap", 1), new AmmoRun("normal", 1) }))
    { throw new Exception("Editing the final round at maximum capacity lost or duplicated ammunition."); }
    draft.Clear();
    RoundOrder();
    if (draft.Count != 0) { throw new Exception("A stale per-round callback restored a cleared plan."); }
    Console.WriteLine("PASS: per-round drag splits and merges the draft, preserves firing order/counts, and rejects stale or over-limit edits.");
    var removeRound = typeof(AmmoLoader).GetMethod("RemoveRound", fields)!;
    void RemoveRound(int index) => removeRound.Invoke(loader, new object[] { index });
    draft.AddRange(new[] { new AmmoRun("normal", 3), new AmmoRun("ap", 1), new AmmoRun("normal", 2), new AmmoRun("tracer", 2) });
    RemoveRound(3);
    if (!draft.SequenceEqual(new[] { new AmmoRun("normal", 5), new AmmoRun("tracer", 2) }))
    { throw new Exception("Deleting a single intervening round did not merge the neighboring groups."); }
    RemoveRound(0);
    RemoveRound(5);
    if (!draft.SequenceEqual(new[] { new AmmoRun("normal", 4), new AmmoRun("tracer", 1) }))
    { throw new Exception("Deleting the first/last round removed the wrong ammunition or more than one round."); }
    var beforeInvalidRemoval = draft.ToArray();
    RemoveRound(-1);
    RemoveRound(5);
    RemoveRound(int.MaxValue);
    if (!draft.SequenceEqual(beforeInvalidRemoval)) { throw new Exception("An invalid single-round deletion changed the draft."); }
    draft.Clear();
    draft.Add(new AmmoRun("normal", 1));
    typeof(AmmoLoader).GetField("draftDirty", fields)!.SetValue(loader, false);
    typeof(AmmoLoader).GetField("uiDirty", fields)!.SetValue(loader, false);
    RemoveRound(0);
    if (draft.Count != 0 || !(bool)typeof(AmmoLoader).GetField("draftDirty", fields)!.GetValue(loader)! ||
        !(bool)typeof(AmmoLoader).GetField("uiDirty", fields)!.GetValue(loader)!)
    { throw new Exception("Deleting the final round did not clear the plan and schedule both views to refresh."); }
    RemoveRound(0);
    if (draft.Count != 0) { throw new Exception("A stale single-round deletion restored a cleared plan."); }
    Console.WriteLine("PASS: single-round deletion updates/merges groups, preserves the remaining rounds, and safely clears the final round.");
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
    var selectedPresetField = typeof(AmmoLoader).GetField("selectedPreset", fields)!;
    var dirtyField = typeof(AmmoLoader).GetField("draftDirty", fields)!;
    selectedPresetField.SetValue(loader, a);
    selectionCallback.Invoke(selectionOwner, new[] { null, a });
    selectionCallback.Invoke(selectionOwner, new[] { null, b });
    if (selectedPresetField.GetValue(loader) != b) { throw new Exception("Selecting a preset did not update the load target."); }
    var nameBox = new GUITextBox(new RectTransform(new Point(200, 30)), text: "Unsaved", style: null);
    typeof(AmmoLoader).GetField("presetName", fields)!.SetValue(loader, nameBox);
    var loadPreset = typeof(AmmoLoader).GetMethod("LoadSelectedPreset", fields)!;
    var unsavedPlan = new[] { new AmmoRun("normal", 2), new AmmoRun("ap", 1) };
    draft.AddRange(unsavedPlan);
    dirtyField.SetValue(loader, true);
    int messageCount = GUIMessageBox.MessageBoxes.Count;
    loadPreset.Invoke(loader, null);
    var confirmation = GUIMessageBox.VisibleBox as GUIMessageBox;
    if (confirmation == null || GUIMessageBox.MessageBoxes.Count != messageCount + 1 || !confirmation.DrawOnTop ||
        confirmation.Buttons.Count != 2 || !draft.SequenceEqual(unsavedPlan) || nameBox.Text != "Unsaved")
    { throw new Exception("Loading over an unsaved plan did not show a modal before changing the draft."); }
    confirmation.Buttons[1].OnClicked(confirmation.Buttons[1], null);
    if (!confirmation.Closed || !draft.SequenceEqual(unsavedPlan) || nameBox.Text != "Unsaved" ||
        !(bool)dirtyField.GetValue(loader)!)
    { throw new Exception("Canceling preset replacement changed the unsaved draft or name."); }
    loadPreset.Invoke(loader, null);
    confirmation = (GUIMessageBox)GUIMessageBox.VisibleBox;
    selectedPresetField.SetValue(loader, c);
    confirmation.Buttons[0].OnClicked(confirmation.Buttons[0], null);
    if (!confirmation.Closed || !draft.SequenceEqual(new[] { new AmmoRun("normal", 1) }) || nameBox.Text != "B" ||
        selectedPresetField.GetValue(loader) != b || (bool)dirtyField.GetValue(loader)!)
    { throw new Exception("Confirming did not load the preset captured when the prompt opened."); }
    selectedPresetField.SetValue(loader, a);
    loadPreset.Invoke(loader, null);
    if (nameBox.Text != "A" || GUIMessageBox.MessageBoxes.Count != messageCount)
    { throw new Exception("A saved plan unnecessarily prompted before loading a preset."); }
    draft.Clear();
    Console.WriteLine("PASS: native preset confirmation waits before replacing, cancel preserves edits, confirm uses the captured preset, and clean plans load directly.");
    var firstRow = new GUIFrame(new RectTransform(new Point(350, 32), dragList.Content.RectTransform), style: null)
        { CanBeFocused = true, UserData = 0 };
    _ = new GUIFrame(new RectTransform(new Point(350, 32), dragList.Content.RectTransform), style: null)
        { CanBeFocused = true, UserData = 1 };
    draft.AddRange(new[] { new AmmoRun("normal", 1), new AmmoRun("ap", 1) });
    bool reordered = false;
    dragList.OnRearranged = (list, _) =>
    {
        var order = list.Content.Children.Select(c => (int)c.UserData).ToArray();
        reordered = list.HasDraggedElementIndexChanged && order.SequenceEqual(new[] { 1, 0 });
        if (list.HasDraggedElementIndexChanged) { RoundOrder(order); }
    };
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
    if (!draft.SequenceEqual(new[] { new AmmoRun("ap", 1), new AmmoRun("normal", 1) }))
    { throw new Exception("Releasing a native per-round drag did not update the grouped draft."); }
    draft.Clear();
    GUI.ForceMouseOn(null);
    typeof(GameMain).GetProperty(nameof(GameMain.Instance))!.SetValue(null, null);
    typeof(PlayerInput).GetField("allowInput", fields)!.SetValue(null, false);
    Console.WriteLine("PASS: native GUIListBox starts, reorders and releases draggable rows with selection disabled.");
    typeof(AmmoLoader).GetField("uiDirty", fields)!.SetValue(loader, false);
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
    var config = GameSettings.CurrentConfig;
    config.Graphics.InventoryScale = 1;
    typeof(GameSettings).GetField("currentConfig", fields)!.SetValue(null, config);
    Inventory.DraggableIndicator ??= (Sprite)RuntimeHelpers.GetUninitializedObject(typeof(Sprite));
    var bindInventory = typeof(AmmoLoader).GetMethod("BindInventory", fields)!;
    foreach (int height in new[] { 42, 63, 84 })
    foreach (var (capacity, columns) in new[] { (1, 1), (3, 3), (6, 6), (8, 4), (12, 6) })
    {
        var container = (ItemContainer)RuntimeHelpers.GetUninitializedObject(typeof(ItemContainer));
        var inventory = new ItemInventory(null, container, capacity, columns);
        typeof(ItemContainer).GetField(nameof(ItemContainer.Inventory))!.SetValue(container, inventory);
        var panel = new GUIFrame(new RectTransform(new Point(columns * 120, height + 4)), style: null);
        var holder = new GUIFrame(new RectTransform(new Point(columns * 100, height), panel.RectTransform, Anchor.Center), style: null);
        foreach (int offset in new[] { 0, 47, -23 })
        {
            panel.RectTransform.AbsoluteOffset = new Point(0, offset);
            bindInventory.Invoke(null, new object[] { container, holder });
            inventory.CreateSlots();
            int slotCenterY = (inventory.visualSlots.Min(s => s.Rect.Top) + inventory.visualSlots.Max(s => s.Rect.Bottom)) / 2;
            if (slotCenterY != panel.Rect.Center.Y || inventory.visualSlots.Any(slot =>
                slot.Rect.Top < panel.Rect.Top || slot.Rect.Bottom > panel.Rect.Bottom ||
                slot.Rect.Left < panel.Rect.Left || slot.Rect.Right > panel.Rect.Right))
            {
                throw new Exception($"{capacity} slots at height {height}, offset {offset}: panel {panel.Rect}, holder {holder.Rect}, slot {inventory.visualSlots[0].Rect}.");
            }
        }
    }
    Console.WriteLine("PASS: native intake/pickup/target slots with configurable counts and rows remain centered at three dock sizes after moving/rebinding.");

    var layoutLoader = (AmmoLoader)RuntimeHelpers.GetUninitializedObject(typeof(AmmoLoader));
    typeof(ItemComponent).GetField("GuiFrameSource", fields)!.SetValue(layoutLoader, new XElement("GuiFrame", new XAttribute("draggable", false)));
    var layoutContainers = new List<ItemContainer>();
    foreach (var (name, capacity, columns) in new[] { ("inputContainer", 6, 6), ("outputContainer", 8, 4), ("targetContainer", 1, 1) })
    {
        var container = (ItemContainer)RuntimeHelpers.GetUninitializedObject(typeof(ItemContainer));
        typeof(ItemContainer).GetField(nameof(ItemContainer.Inventory))!.SetValue(container, new ItemInventory(null, container, capacity, columns));
        typeof(AmmoLoader).GetField(name, fields)!.SetValue(layoutLoader, container);
        layoutContainers.Add(container);
    }
    typeof(AmmoLoader).GetField("addCount", fields)!.SetValue(layoutLoader, 5);
    var layoutKeyboard = GUI.KeyboardDispatcher;
    var dispatcherProperty = typeof(GUI).GetProperty(nameof(GUI.KeyboardDispatcher))!;
    dispatcherProperty.SetValue(null, RuntimeHelpers.GetUninitializedObject(dispatcherProperty.PropertyType));
    var captionPack = (TextPack)RuntimeHelpers.GetUninitializedObject(typeof(TextPack));
    typeof(TextPack).GetField("texts", fields)!.SetValue(captionPack, new Dictionary<Identifier, ImmutableArray<TextPack.Text>>
    {
        ["test.ammoloader.intake".ToIdentifier()] = [new("Replacement intake caption", false, captionPack)],
        ["test.ammoloader.stockandsupply".ToIdentifier()] = [new("库存[stock]\n弹药箱[supply]", false, captionPack)],
        ["vce.ammoloader.stockandsupply".ToIdentifier()] = [new("Stock [stock] + Supply [supply]", false, captionPack)],
        ["vce.ammoloader.output".ToIdentifier()] = [new("Ammo pickup", false, captionPack)]
    }.ToImmutableDictionary());
    TextManager.TextPacks[TextManager.DefaultLanguage] = [captionPack];
    typeof(TextManager).GetProperty(nameof(TextManager.LanguageVersion))!.SetValue(null, TextManager.LanguageVersion + 1);
    foreach (var size in new[] { new Point(900, 600), new Point(1450, 840), new Point(1800, 1000) })
    {
        layoutLoader.GuiFrame = new GUIFrame(new RectTransform(size), style: null);
        layoutLoader.CreateGUI();
        var holders = new[] { "inputHolder", "outputHolder", "targetHolder" }
            .Select(name => (GUIFrame)typeof(AmmoLoader).GetField(name, fields)!.GetValue(layoutLoader)!).ToArray();
        if (!(holders[0].Rect.Right < holders[1].Rect.Left && holders[1].Rect.Right < holders[2].Rect.Left))
        { throw new Exception("The native dock does not keep intake, pickup and target separate and ordered left to right."); }
        for (int i = 0; i < holders.Length; i++)
        {
            var dock = holders[i].Parent;
            var label = dock.Children.OfType<GUITextBlock>().Single();
            if (layoutContainers[i].Inventory.visualSlots.Any(slot => slot.Rect.Left < label.Rect.Right ||
                slot.Rect.Right > dock.Rect.Right || slot.Rect.Top < dock.Rect.Top || slot.Rect.Bottom > dock.Rect.Bottom))
            { throw new Exception($"Dock {i} at {size} overlaps its label or panel edges."); }
        }
        var checkbox = layoutLoader.GuiFrame.GetAllChildren().OfType<GUITickBox>().Single();
        if (checkbox.Parent != holders[1].Parent || checkbox.TextBlock.Text.SanitizedValue.Length != 0)
        { throw new Exception("The withdrawal checkbox must be unlabeled and belong to the pickup panel."); }
        int dockGap = (int)(10 * GUI.SlicedSpriteScale);
        for (int i = 0; i < 2; i++)
        {
            var label = holders[i].Parent.Children.OfType<GUITextBlock>().Single();
            var preceding = i == 0 ? (GUIComponent)label : checkbox;
            if (Math.Abs(holders[i].Rect.Left - preceding.Rect.Right - dockGap) > 1 ||
                (i == 1 && Math.Abs(checkbox.Rect.Left - label.Rect.Right - dockGap) > 1))
            { throw new Exception("The dock reserves blank columns after its caption or checkbox."); }
            var slots = layoutContainers[i].Inventory.visualSlots;
            if (Math.Abs((slots.Min(s => s.Rect.Left) + slots.Max(s => s.Rect.Right)) / 2 - holders[i].Rect.Center.X) > 1 ||
                Math.Abs((slots.Min(s => s.Rect.Top) + slots.Max(s => s.Rect.Bottom)) / 2 - holders[i].Parent.Rect.Center.Y) > 1)
            { throw new Exception("The dock slots lost their horizontal or vertical centering."); }
        }
        var quantityInput = (GUINumberInput)typeof(AmmoLoader).GetField("addQuantity", fields)!.GetValue(layoutLoader)!;
        checkbox.Selected = true;
        if (quantityInput.TextBox.Enabled || quantityInput.PlusButton.Enabled || quantityInput.MinusButton.Enabled || quantityInput.IntValue != 5)
        { throw new Exception("Withdrawal must disable, but preserve, the add quantity."); }
        layoutLoader.CreateGUI();
        if (!layoutLoader.GuiFrame.GetAllChildren().OfType<GUITickBox>().Single().Selected)
        { throw new Exception("Recreating the window lost withdrawal mode."); }
        layoutLoader.GuiFrame.GetAllChildren().OfType<GUITickBox>().Single().Selected = false;
        if (!((GUINumberInput)typeof(AmmoLoader).GetField("addQuantity", fields)!.GetValue(layoutLoader)!).TextBox.Enabled)
        { throw new Exception("Leaving withdrawal mode must re-enable the add quantity."); }
        var originalSlots = layoutContainers[0].Inventory.visualSlots.Select(slot => slot.Rect).ToArray();
        layoutLoader.TextPrefix = "test.ammoloader.";
        layoutLoader.CreateGUI();
        var customizedInput = (GUIFrame)typeof(AmmoLoader).GetField("inputHolder", fields)!.GetValue(layoutLoader)!;
        var customizedOutput = (GUIFrame)typeof(AmmoLoader).GetField("outputHolder", fields)!.GetValue(layoutLoader)!;
        if (!layoutContainers[0].Inventory.visualSlots.Select(slot => slot.Rect).SequenceEqual(originalSlots) ||
            customizedInput.Parent.Children.OfType<GUITextBlock>().Single().Text.SanitizedValue != "Replacement intake caption" ||
            customizedOutput.Parent.Children.OfType<GUITextBlock>().Single().Text.SanitizedValue != "Ammo pickup")
        { throw new Exception("A custom localization prefix changed intake slot spacing or failed to fall back to VCE text."); }
        layoutLoader.TextPrefix = "";
    }
    GUI.KeyboardDispatcher = layoutKeyboard;
    Console.WriteLine("PASS: native dock panels fit configurable multi-row slots at three window sizes; checkbox switches and preserves mode/quantity.");

    config.Graphics.HUDScale = 1;
    typeof(GameSettings).GetField("currentConfig", fields)!.SetValue(null, config);
    var dragMarker = typeof(AmmoLoader).GetMethod("DragMarker", fields)!;
    foreach (int width in new[] { 180, 300, 440 })
    foreach (int height in new[] { 26, 32, 48 })
    {
        var row = new GUILayoutGroup(new RectTransform(new Point(width, height)),
            isHorizontal: true, childAnchor: Anchor.CenterLeft) { RelativeSpacing = 0.01f };
        var marker = (GUITextBlock)dragMarker.Invoke(null, new object[] { row })!;
        _ = new GUIFrame(new RectTransform(new Vector2(0.95f, 1), row.RectTransform), style: null);
        foreach (int offset in new[] { 0, 47, -23 })
        {
            row.RectTransform.AbsoluteOffset = new Point(0, offset);
            row.ForceLayoutRecalculation();
            if (!marker.RectTransform.IsFixedSize || marker.Rect.Width != (int)(16 * GUI.Scale) ||
                marker.Rect.Center.Y != row.Rect.Center.Y || marker.CanBeFocused || marker.Text.SanitizedValue != "≡")
            { throw new Exception($"Drag marker compressed or off-center: row {row.Rect}, marker {marker.Rect}."); }
        }
    }
    Console.WriteLine("PASS: three-line drag markers retain their width and vertical center in narrow/wide rows after moving.");
    var ammoPrefab = (ItemPrefab)RuntimeHelpers.GetUninitializedObject(typeof(ItemPrefab));
    void SetPrefabField(string name, object value)
    {
        for (Type? type = typeof(ItemPrefab); type != null; type = type.BaseType)
        {
            if (type.GetField(name, fields | BindingFlags.Public) is not { } field) { continue; }
            field.SetValue(ammoPrefab, value);
            return;
        }
        throw new MissingFieldException(name);
    }
    SetPrefabField("Identifier", "ammoloader_ui_test".ToIdentifier());
    SetPrefabField("name", (LocalizedString)"Test ammunition");
    SetPrefabField("wearableDamageModifiers", Array.Empty<DamageModifier>());
    SetPrefabField("wearableSkillModifiers", new Dictionary<Identifier, float>());
    var inventoryIcon = (Sprite)RuntimeHelpers.GetUninitializedObject(typeof(Sprite));
    var worldSprite = (Sprite)RuntimeHelpers.GetUninitializedObject(typeof(Sprite));
    typeof(ItemPrefab).GetProperty(nameof(ItemPrefab.InventoryIcon))!.SetValue(ammoPrefab, inventoryIcon);
    typeof(ItemPrefab).GetField("sprite", fields)!.SetValue(ammoPrefab, worldSprite);
    typeof(ItemPrefab).GetProperty(nameof(ItemPrefab.InventoryIconColor))!.SetValue(ammoPrefab, Color.Red);
    typeof(ItemPrefab).GetProperty(nameof(ItemPrefab.SpriteColor))!.SetValue(ammoPrefab, Color.Blue);
    ItemPrefab.Prefabs.Add(ammoPrefab, false);
    var ammoLabel = typeof(AmmoLoader).GetMethod("AmmoLabel", fields)!;
    foreach (int height in new[] { 20, 26, 32, 48 })
    foreach (string iconKind in new[] { "inventory", "sprite", "missing" })
    {
        typeof(ItemPrefab).GetProperty(nameof(ItemPrefab.InventoryIcon))!.SetValue(ammoPrefab, iconKind == "inventory" ? inventoryIcon : null);
        var row = new GUILayoutGroup(new RectTransform(new Point(200, height)), isHorizontal: true);
        var label = (GUITextBlock)ammoLabel.Invoke(null,
            new object[] { row, iconKind == "missing" ? "missing_ammo" : ammoPrefab.Identifier.Value, "Test ammunition", 0.55f })!;
        row.ForceLayoutRecalculation();
        var cell = label.Parent;
        var icon = cell.Children.OfType<GUIImage>().Single();
        var expectedSprite = iconKind == "inventory" ? inventoryIcon : iconKind == "sprite" ? worldSprite : null;
        if (icon.Sprite != expectedSprite || (expectedSprite != null && icon.Color != (iconKind == "inventory" ? Color.Red : Color.Blue)) ||
            icon.CanBeFocused || cell.CanBeFocused || label.CanBeFocused ||
            icon.Rect.Width != icon.Rect.Height || icon.Rect.Top < cell.Rect.Top || icon.Rect.Bottom > cell.Rect.Bottom ||
            icon.Rect.Center.Y > cell.Rect.Center.Y || cell.Rect.Center.Y - icon.Rect.Center.Y > 2 * GUI.Scale ||
            icon.Rect.Right >= label.Rect.Left || label.Rect.Right > cell.Rect.Right || label.Text.SanitizedValue != "Test ammunition")
        { throw new Exception($"Ammo icon/text layout failed at height {height}, icon kind {iconKind}: cell {cell.Rect}, icon {icon.Rect}, text {label.Rect}, color {icon.Color}, sprite match {icon.Sprite == expectedSprite}, focus {icon.CanBeFocused}/{cell.CanBeFocused}/{label.CanBeFocused}, text '{label.Text.SanitizedValue}'."); }
    }
    Console.WriteLine("PASS: ammo labels use the inventory icon/tint, fall back to the sprite, preserve text without assets and leave mouse focus to the row.");

    typeof(GameMain).GetProperty(nameof(GameMain.Instance))!.SetValue(null, headlessGame);
    typeof(PlayerInput).GetField("allowInput", fields)!.SetValue(null, true);
    var keyboard = typeof(PlayerInput).GetField("keyboardState", fields)!;
    var tooltipTile = new GUIButton(new RectTransform(new Point(72)), style: null);
    LocalizedString tooltipHint = "";
    typeof(AmmoLoader).GetMethod("BindStockTooltip", fields)!.Invoke(null,
        new object?[] { tooltipTile, ammoPrefab, "fallback", (Func<LocalizedString>)(() => tooltipHint) });
    foreach (string hint in new[] { "", "Stock: 20", "‖color:gui.green‖Stock: 20‖color:end‖" })
    foreach (Keys? key in new Keys?[] { null, Keys.LeftShift, null, Keys.RightShift, null })
    {
        tooltipHint = hint;
        keyboard.SetValue(null, key.HasValue ? new KeyboardState(key.Value) : new KeyboardState());
        string description = key?.ToString() ?? "released";
        typeof(ItemPrefab).GetProperty(nameof(ItemPrefab.Description))!
            .SetValue(ammoPrefab, (LocalizedString)$"‖color:gui.orange‖{description}‖color:end‖");
        tooltipTile.OnDrawToolTip(tooltipTile);
        string renderedTooltip = tooltipTile.ToolTip.SanitizedValue;
        if (!renderedTooltip.Contains(description) || renderedTooltip.Contains("‖color:") ||
            renderedTooltip.Contains("Stock: 20") != (hint.Length > 0))
        { throw new Exception($"Stock tooltip lost rich formatting or Shift/hint refresh: {renderedTooltip}"); }
        var cachedTooltip = tooltipTile.ToolTip;
        tooltipTile.OnDrawToolTip(tooltipTile);
        if (!ReferenceEquals(cachedTooltip, tooltipTile.ToolTip))
        { throw new Exception("An unchanged stock tooltip was unnecessarily rebuilt every frame."); }
    }
    var magazineItem = (Item)RuntimeHelpers.GetUninitializedObject(typeof(Item));
    typeof(Item).GetProperty(nameof(Item.MaxCondition))!.SetValue(magazineItem, 3f);
    var magazine = (VirtualizedMagazine)RuntimeHelpers.GetUninitializedObject(typeof(VirtualizedMagazine));
    typeof(ItemComponent).GetField("item", fields)!.SetValue(magazine, magazineItem);
    typeof(VirtualizedMagazine).GetProperty(nameof(VirtualizedMagazine.AllowedAmmoTags))!
        .SetValue(magazine, System.Collections.Immutable.ImmutableHashSet<Identifier>.Empty);
    typeof(VirtualizedMagazine).GetProperty(nameof(VirtualizedMagazine.LoadedAmmoIdentifiers))!
        .SetValue(magazine, new Stack<Identifier>(["existing_round".ToIdentifier()]));
    magazine.LoadedAmmoIdentifiersArray = [ammoPrefab.Identifier];
    magazine.LoadedAmmoIdentifiersArray = [ammoPrefab.Identifier];
    if (magazine.LoadedCount != 3 || magazine.LoadedAmmoIdentifiersArray[0] != "existing_round".ToIdentifier())
    { throw new Exception("Magazine assignment must append to the existing stack while capacity remains."); }
    var remaining = new List<Identifier> { ammoPrefab.Identifier, "missing_round".ToIdentifier() };
    magazine.LoadAmmoArray(ref remaining);
    magazine.LoadedAmmoIdentifiersArray = [];
    magazine.LoadedAmmoIdentifiersArray = [ammoPrefab.Identifier];
    if (magazine.LoadedCount != 3 || !remaining.SequenceEqual(new[] { ammoPrefab.Identifier, "missing_round".ToIdentifier() }))
    { throw new Exception("Full magazines must preserve existing rounds and return rejected input; empty assignment must not clear them."); }
    Console.WriteLine("PASS: actual magazine assignment appends up to capacity, preserves old rounds and returns rejected LoadAmmoArray input.");
    var capacityTarget = (ItemContainer)RuntimeHelpers.GetUninitializedObject(typeof(ItemContainer));
    var targetInventory = new ItemInventory(null, capacityTarget, 1, 1);
    typeof(ItemContainer).GetField(nameof(ItemContainer.Inventory))!.SetValue(capacityTarget, targetInventory);
    var targetSlot = ((Array)typeof(Inventory).GetField("slots", fields)!.GetValue(targetInventory)!).GetValue(0)!;
    targetSlot.GetType().GetMethod("Add")!.Invoke(targetSlot, new object[] { magazineItem });
    typeof(Item).GetField("componentsByType", fields)!.SetValue(magazineItem,
        new Dictionary<Type, List<ItemComponent>> { [typeof(VirtualizedMagazine)] = [magazine] });
    typeof(AmmoLoader).GetField("targetContainer", fields)!.SetValue(loader, capacityTarget);
    typeof(Item).GetProperty(nameof(Item.MaxCondition))!.SetValue(magazineItem, 30f);
    typeof(AmmoLoader).GetField("addCount", fields)!.SetValue(loader, 5);
    magazine.LoadedAmmoIdentifiers.Clear();
    for (int i = 0; i < 18; i++) { magazine.LoadedAmmoIdentifiers.Push(ammoPrefab.Identifier); }
    foreach (string id in new[] { "tracer", "normal" })
    {
        draft.Clear();
        draft.AddRange(new[] { new AmmoRun("normal", 5), new AmmoRun("ap", 5) });
        Add(id, 5);
        var expected = id == "normal" ? new[] { new AmmoRun("normal", 7), new AmmoRun("ap", 5) }
            : new[] { new AmmoRun("tracer", 2), new AmmoRun("normal", 5), new AmmoRun("ap", 5) };
        if (!draft.SequenceEqual(expected) || magazine.LoadedCount != 18 ||
            (int)typeof(AmmoLoader).GetField("addCount", fields)!.GetValue(loader)! != 5)
        { throw new Exception("18/30 loaded plus a 10-round draft must add only two of a five-round batch without changing the batch setting or magazine."); }
        Add(id, 5);
        if (!draft.SequenceEqual(expected)) { throw new Exception("Repeated clicks overfilled the draft after the partial batch."); }
    }
    magazine.LoadedAmmoIdentifiers.Clear();
    for (int i = 0; i < 27; i++) { magazine.LoadedAmmoIdentifiers.Push(ammoPrefab.Identifier); }
    draft.Clear();
    Add("normal", 2);
    Add("ap", 2);
    if (!draft.SequenceEqual(new[] { new AmmoRun("ap", 1), new AmmoRun("normal", 2) }))
    { throw new Exception("A batch did not clip to the target's final available round."); }
    Add("ap", 1);
    Add("tracer", 1);
    changeCount.Invoke(loader, new object[] { 1, 3 });
    if (!draft.SequenceEqual(new[] { new AmmoRun("ap", 1), new AmmoRun("normal", 2) }))
    { throw new Exception("Adding or editing quantities exceeded the three remaining magazine slots."); }
    changeCount.Invoke(loader, new object[] { 1, 1 });
    Add("tracer", 1);
    if (draft.Sum(r => r.Count) != 3 || draft[0].Id != "tracer")
    { throw new Exception("Reducing a group did not make room for another round."); }
    draft.Clear();
    draft.AddRange(new[] { new AmmoRun("normal", 5), new AmmoRun("ap", 1) });
    changeCount.Invoke(loader, new object[] { 0, 4 });
    changeCount.Invoke(loader, new object[] { 0, 5 });
    Add("tracer", 1);
    if (!draft.SequenceEqual(new[] { new AmmoRun("normal", 4), new AmmoRun("ap", 1) }))
    { throw new Exception("An oversized preset must allow reductions while rejecting increases and additions."); }
    draft.Clear();
    for (int i = 0; i < 3; i++) { magazine.LoadedAmmoIdentifiers.Push(ammoPrefab.Identifier); }
    Add("normal", 1);
    if (draft.Count != 0) { throw new Exception("A full target magazine still accepts new draft ammunition."); }
    typeof(AmmoLoader).GetField("targetContainer", fields)!.SetValue(loader, null);
    Add("normal", 31);
    if (draft.Single().Count != 31) { throw new Exception("Removing the magazine did not restore generic preset editing."); }
    draft.Clear();
    Console.WriteLine("PASS: actual target capacity limits additions and quantity increases, preserves oversized presets for reduction, and supports full/absent magazines.");
    ItemPrefab.Prefabs.Remove(ammoPrefab);
    typeof(GameMain).GetProperty(nameof(GameMain.Instance))!.SetValue(null, null);
    typeof(PlayerInput).GetField("allowInput", fields)!.SetValue(null, false);
    Console.WriteLine("PASS: stock tooltip refreshes in place on both Shift keys and release, and reuses text while the key state is unchanged.");

    var refreshLoader = (AmmoLoader)RuntimeHelpers.GetUninitializedObject(typeof(AmmoLoader));
    var refreshDraft = new List<AmmoRun>();
    void SetRefreshField(string name, object value) => typeof(AmmoLoader).GetField(name, fields)!.SetValue(refreshLoader, value);
    SetRefreshField("draft", refreshDraft);
    SetRefreshField("message", "");
    var suppliesType = typeof(AmmoLoader).GetField("supplies", fields)!.FieldType;
    void SetSupplies(string json) => SetRefreshField("supplies", System.Text.Json.JsonSerializer.Deserialize(json, suppliesType)!);
    SetSupplies("[]");
    typeof(AmmoLoader).GetProperty(nameof(AmmoLoader.Stock))!.SetValue(refreshLoader, new AmmoStock());
    refreshLoader.GuiFrame = new GUIFrame(new RectTransform(new Point(1800, 800)), style: null);
    var lists = new[] { "presetList", "planList", "previewList", "stockList", "actualList", "checkList" }
        .Select((name, index) =>
        {
            var list = new GUIListBox(new RectTransform(new Point(280, 300), refreshLoader.GuiFrame.RectTransform)
                { AbsoluteOffset = new Point(index * 300, 0) }, style: null)
                { AutoHideScrollBar = false, KeepSpaceForScrollBar = true };
            list.UpdateDimensions();
            SetRefreshField(name, list);
            return list;
        }).ToArray();
    var checkHeaderRow = new GUILayoutGroup(new RectTransform(new Point(lists[5].Content.Rect.Width, 30),
        refreshLoader.GuiFrame.RectTransform)
        { AbsoluteOffset = new Point(lists[5].Content.Rect.X - refreshLoader.GuiFrame.Rect.X, -30) }, isHorizontal: true);
    SetRefreshField("checkAmountHeader", typeof(AmmoLoader).GetMethod("CheckAmountLabel", fields)!.Invoke(null,
        new object[] { checkHeaderRow, (LocalizedString)"Required / Available" })!);
    foreach (string name in new[] { "presetLoadButton", "presetDelete", "loadButton", "unloadButton", "saveButton", "clearButton" })
    { SetRefreshField(name, new GUIButton(new RectTransform(new Point(100, 30)), style: null)); }
    foreach (string name in new[] { "targetLabel", "planLabel", "draftLabel", "stockSummary", "presetScope" })
    { SetRefreshField(name, new GUITextBlock(new RectTransform(new Point(200, 30)), "", style: null)); }
    var previousKeyboard = GUI.KeyboardDispatcher;
    var keyboardProperty = typeof(GUI).GetProperty(nameof(GUI.KeyboardDispatcher))!;
    keyboardProperty.SetValue(null, RuntimeHelpers.GetUninitializedObject(keyboardProperty.PropertyType));
    var flush = typeof(GUI).GetMethod("RefreshUpdateList", fields)!;
    var updateList = typeof(GUI).GetField("updateList", fields)!;
    try
    {
        savedField.SetValue(null, testSaved);
        flush.Invoke(null, null);
        void Tick()
        {
            GUI.ClearUpdateList();
            // Match GameMain: collect controls, update the item HUD, then update the collected controls.
            refreshLoader.AddToGUIUpdateList();
            refreshLoader.UpdateHUDComponentSpecific(null!, 1f / 60, null!);
            flush.Invoke(null, null);
            var queued = ((IEnumerable<GUIComponent>)updateList.GetValue(null)!).ToArray();
            foreach (var control in queued) { control.UpdateManually(1f / 60); }
            foreach (var list in lists)
            foreach (var row in list.Content.Children.Where(c => c.Rect.Intersects(list.Content.Rect)))
            {
                if (!queued.Contains(row) || row.GetAllChildren().Any(c => !queued.Contains(c)))
                { throw new Exception("A refreshed row or its layout/input controls missed the current frame's update list."); }
            }
            foreach (var tile in lists[3].Content.Children.OfType<GUIButton>())
            {
                var caption = tile.Children.OfType<GUITextBlock>().Last();
                if (tile.Rect.Size != new Point((int)(72 * GUI.Scale)) || caption.TextAlignment != Alignment.BottomRight)
                { throw new Exception($"Stock tiles changed their original square size or lost right-aligned counts: {tile.Rect.Size}, expected {new Point((int)(72 * GUI.Scale))}, alignment {caption.TextAlignment}."); }
                int captionLines = refreshLoader.UseSupplyStorage ? 2 : 1;
                if (refreshLoader.UseSupplyStorage && (caption.AutoScaleHorizontal || caption.TextScale != 0.75f))
                { throw new Exception("Box-backed stock captions changed font scale with their values."); }
                if (caption.Text.SanitizedValue.Split('\n').Length != captionLines ||
                    caption.Rect.Height < (int)(14 * captionLines * GUI.Scale) || tile.Children.Where(c => c is GUIImage ||
                    c is GUITextBlock && c != caption && c != tile.TextBlock).Any(c => c.Rect.Bottom > caption.Rect.Top))
                { throw new Exception("Stock counts lost their line layout, had insufficient height or overlapped the icon/name."); }
            }
            var amountHeader = (GUITextBlock)typeof(AmmoLoader).GetField("checkAmountHeader", fields)!.GetValue(refreshLoader)!;
            foreach (var label in lists[5].Content.Children.OfType<GUILayoutGroup>()
                .SelectMany(row => row.Children.OfType<GUITextBlock>()).Prepend(amountHeader))
            {
                if (label.Rect.Right != lists[5].Content.Rect.Right || label.Rect.Left != amountHeader.Rect.Left ||
                    !label.TextAlignment.HasFlag(Alignment.Left) || label.Padding.X != 0)
                { throw new Exception($"Loading-check first characters are not aligned in one right-anchored column: header {amountHeader.Rect}, label {label.Rect}, content {lists[5].Content.Rect}."); }
            }
            foreach (var row in lists[5].Content.Children.OfType<GUILayoutGroup>())
            {
                var name = row.Children.OfType<GUIFrame>().Single().Children.OfType<GUITextBlock>().Single();
                var amount = row.Children.OfType<GUITextBlock>().Single();
                if (Math.Abs(amount.Rect.Left - name.Rect.Right - (int)(2 * GUI.Scale)) > 1 || name.Padding != Vector4.Zero)
                { throw new Exception($"Loading-check names waste space before the amount column: name {name.Rect}, amount {amount.Rect}."); }
            }
        }
        foreach (int count in new[] { 0, 30, 2, 60, 0 })
        {
            refreshDraft.Clear();
            if (count > 0) { refreshDraft.Add(new AmmoRun("normal", count)); }
            refreshLoader.Stock.TryAdd(new Dictionary<string, int> { ["normal"] = 10 });
            SetRefreshField("uiDirty", true);
            Tick();
            var firstFrame = lists.SelectMany(l => l.Content.Children).SelectMany(c => c.GetAllChildren().Prepend(c))
                .Where(c => c is GUILayoutGroup || c.Parent is GUILayoutGroup).Select(c => c.Rect).ToArray();
            Tick();
            var nextFrame = lists.SelectMany(l => l.Content.Children).SelectMany(c => c.GetAllChildren().Prepend(c))
                .Where(c => c is GUILayoutGroup || c.Parent is GUILayoutGroup).Select(c => c.Rect).ToArray();
            if (!firstFrame.SequenceEqual(nextFrame)) { throw new Exception("Refreshed row layout changed on the following frame."); }
            lists[2].BarScroll = 0.5f;
        }
        Console.WriteLine("PASS: native refresh registers all visible row controls in the same frame, with stable layout after adding, shrinking and clearing a scrolled plan.");
        SetRefreshField("addCount", 5);
        SetRefreshField("withdrawMode", true);
        SetRefreshField("uiDirty", true);
        Tick();
        var stockTile = lists[3].Content.Children.OfType<GUIButton>().First();
        stockTile.OnClicked(stockTile, null);
        if (refreshDraft.Count != 0) { throw new Exception("Clicking stock in withdrawal mode changed the loading draft."); }
        SetRefreshField("withdrawMode", false);
        SetRefreshField("uiDirty", true);
        Tick();
        stockTile = lists[3].Content.Children.OfType<GUIButton>().First();
        stockTile.OnClicked(stockTile, null);
        if (refreshDraft.Sum(r => r.Count) != 5) { throw new Exception("Leaving withdrawal mode did not restore stock-to-draft clicks."); }
        Console.WriteLine("PASS: stock clicks route to withdrawal without changing the draft and return to adding the configured batch when unchecked.");
        SetSupplies("""
            [{"Id":"shared","Prefab":"box","Amount":5,"Capacity":100,"Costs":{"normal":0.5,"ap":1}}]
            """);
        refreshDraft.Clear();
        refreshLoader.Stock.Load(null);
        refreshLoader.Stock.TryAdd(new Dictionary<string, int> { ["normal"] = 2 });
        refreshDraft.AddRange(new[] { new AmmoRun("normal", 6), new AmmoRun("ap", 1) });
        SetRefreshField("uiDirty", true);
        Tick();
        var supplyTiles = lists[3].Content.Children.OfType<GUIButton>().ToArray();
        if (supplyTiles.Length != 2) { throw new Exception("Available ammunition omitted a supply-only projectile."); }
        foreach (var tile in supplyTiles)
        {
            string id = ((ValueTuple<string, ItemPrefab?>)tile.UserData).Item1;
            string caption = tile.Children.OfType<GUITextBlock>().Last().Text.SanitizedValue;
            if (caption != (id == "normal" ? "2" : "0"))
            { throw new Exception("A generic loader replaced its single numeric stock caption with supply labels."); }
        }
        if (lists[5].Content.CountChildren != 2) { throw new Exception("Plan validation must show stored rounds and shared pool consumption without a supply-only projectile row."); }
        SetRefreshField("withdrawMode", true);
        SetRefreshField("uiDirty", true);
        Tick();
        if (lists[3].Content.Children.OfType<GUIButton>().Count() != 1)
        { throw new Exception("Withdrawal exposed supply-only ammunition as stored packages."); }
        Console.WriteLine("PASS: generic loaders keep numeric stock captions with supply integration; pool cost remains visible and supply-only ammo stays out of package withdrawal.");
        refreshLoader.UseSupplyStorage = true;
        refreshLoader.TextPrefix = "test.ammoloader.";
        SetRefreshField("uiDirty", true);
        Tick();
        supplyTiles = lists[3].Content.Children.OfType<GUIButton>().ToArray();
        if (supplyTiles.Length != 2) { throw new Exception("Refillable supply mode hid supplied ammunition from package withdrawal."); }
        foreach (var tile in supplyTiles)
        {
            string id = ((ValueTuple<string, ItemPrefab?>)tile.UserData).Item1;
            string caption = tile.Children.OfType<GUITextBlock>().Last().Text.SanitizedValue;
            if (caption != (id == "normal" ? "库存2\n弹药箱10" : "库存0\n弹药箱5"))
            { throw new Exception("Package withdrawal subtracted the draft from available supply reserves."); }
        }
        Console.WriteLine("PASS: refillable supply mode exposes box-funded packages without reserving the draft; custom text keeps slot rectangles unchanged.");
        int supplyTileWidth = supplyTiles[0].Rect.Width;
        SetSupplies("[]");
        refreshDraft.Clear();
        refreshLoader.Stock.Load(null);
        refreshLoader.Stock.TryAdd(new Dictionary<string, int> { ["normal"] = 50 });
        foreach (bool withdraw in new[] { false, true })
        {
            SetRefreshField("withdrawMode", withdraw);
            SetRefreshField("uiDirty", true);
            Tick();
            var tile = lists[3].Content.Children.OfType<GUIButton>().Single();
            if (tile.Children.OfType<GUITextBlock>().Last().Text.SanitizedValue != "库存50\n弹药箱0" ||
                tile.Rect.Width != supplyTileWidth)
            { throw new Exception("Removing the ammo box changed the stock caption format or tile width."); }
        }
        foreach (int reserve in new[] { 0, 1, 30, 1890 })
        {
            SetSupplies($$$"""
                [{"Id":"shared","Prefab":"box","Amount":{{{reserve}}},"Capacity":2000,"Costs":{"normal":1}}]
                """);
            SetRefreshField("uiDirty", true);
            Tick();
            var caption = lists[3].Content.Children.OfType<GUIButton>().Single().Children.OfType<GUITextBlock>().Last();
            if (caption.Text.SanitizedValue != $"库存50\n弹药箱{reserve}")
            { throw new Exception("Changing the box reserve changed the two-line stock format."); }
        }
        foreach (var scenario in new[]
        {
            (Stock: 30, Demand: 15, Box: true, Amounts: new[] { "15 / 30" }, Shortage: false),
            (Stock: 5, Demand: 15, Box: true, Amounts: new[] { "5 / 5", "5.00 / 5.0" }, Shortage: false),
            (Stock: 0, Demand: 6, Box: true, Amounts: new[] { "3.00 / 5.0" }, Shortage: false),
            (Stock: 2, Demand: 15, Box: true, Amounts: new[] { "2 / 2", "6.50 / 5.0" }, Shortage: true),
            (Stock: 5, Demand: 15, Box: false, Amounts: new[] { "15 / 5" }, Shortage: true),
            (Stock: 0, Demand: 15, Box: false, Amounts: new[] { "15 / 0" }, Shortage: true),
            (Stock: 30, Demand: 15, Box: false, Amounts: new[] { "15 / 30" }, Shortage: false),
            (Stock: 30, Demand: 0, Box: true, Amounts: Array.Empty<string>(), Shortage: false)
        })
        {
            SetSupplies(scenario.Box ? """
                [{"Id":"shared","Prefab":"box","Amount":5,"Capacity":100,"Costs":{"normal":0.5}}]
                """ : "[]");
            refreshLoader.Stock.Load(null);
            if (scenario.Stock > 0) { refreshLoader.Stock.TryAdd(new Dictionary<string, int> { ["normal"] = scenario.Stock }); }
            refreshDraft.Clear();
            if (scenario.Demand > 0) { refreshDraft.Add(new AmmoRun("normal", scenario.Demand)); }
            SetRefreshField("withdrawMode", false);
            SetRefreshField("uiDirty", true);
            Tick();
            var amounts = lists[5].Content.Children.Select(row => row.Children.OfType<GUITextBlock>().Single()).ToArray();
            if (!amounts.Select(label => label.Text.SanitizedValue).SequenceEqual(scenario.Amounts) ||
                (scenario.Shortage && amounts.Last().TextColor != Color.OrangeRed))
            { throw new Exception($"Loading check mixed stored rounds with box reserves or lost a shortage: {scenario}."); }
            if (amounts.Select(label => label.Rect.X).Distinct().Count() > 1)
            { throw new Exception("Stored-round and supply-box quantities no longer share a column."); }
        }
        Console.WriteLine("PASS: loading checks separate stock and box debits, omit unused sources, align amount columns, and preserve missing-stock/box shortage warnings.");
        typeof(ItemComponent).GetField("GuiFrameSource", fields)!.SetValue(refreshLoader,
            new XElement("GuiFrame", new XAttribute("draggable", false)));
        refreshDraft.Add(new AmmoRun("normal", 40));
        foreach (var size in new[] { new Point(900, 600), new Point(1450, 840), new Point(1800, 1000) })
        {
            refreshLoader.GuiFrame.RectTransform.Resize(size);
            refreshLoader.CreateGUI();
            int listIndex = 0;
            foreach (string name in new[] { "presetList", "planList", "previewList", "stockList", "actualList", "checkList" })
            { lists[listIndex++] = (GUIListBox)typeof(AmmoLoader).GetField(name, fields)!.GetValue(refreshLoader)!; }
            Tick();
            refreshLoader.GuiFrame.RectTransform.AbsoluteOffset += new Point(37, 23);
            Tick();
        }
        Console.WriteLine("PASS: loading-check amount columns align at the right edge; names fill the remaining width with only a small gap across three window sizes and movement.");
        Console.WriteLine("PASS: box-backed captions keep one fixed font size with no box, an empty box, and one-, two- or four-digit reserves.");
        Console.WriteLine("PASS: stock tiles keep their original square size and right alignment; two-line box captions have separate space and retain an explicit zero without a box in loading/withdrawal modes.");
    }
    finally
    {
        GUI.ClearUpdateList();
        GUI.KeyboardDispatcher = previousKeyboard;
        savedField.SetValue(null, previousSaved);
    }

    foreach (bool repeat in new[] { false, true })
    {
        var prefab = new MagazinePrefab(new ContentXElement(null, XElement.Parse($"""
            <MagazinePrefab identifier="loader_sequence_test" AutoRepeat="{repeat}">
              <StartAmmoGroup><Ammo ProjectileIdentifier="start" /></StartAmmoGroup>
              <MainAmmoGroup><Ammo ProjectileIdentifier="a" /><Ammo ProjectileIdentifier="b" /></MainAmmoGroup>
              <EndAmmoGroup><Ammo ProjectileIdentifier="end" /></EndAmmoGroup>
            </MagazinePrefab>
            """)), null);
        string[] expected = repeat ? ["end", "b", "a", "b", "a", "start"] : ["end", "b", "a", "start"];
        if (!prefab.CreateAmmoArray(6).Select(id => id.Value).SequenceEqual(expected) ||
            prefab.CreateAmmoArray(0).Length != 0 ||
            !prefab.CreateAmmoArray(1).Select(id => id.Value).SequenceEqual(new[] { "end" }) ||
            !prefab.CreateAmmoArray(2).Select(id => id.Value).SequenceEqual(new[] { "end", "start" }))
        { throw new Exception("Shared magazine preset expansion changed section priority, repetition or insertion order."); }
    }
    Console.WriteLine("PASS: shared MagazinePrefab expansion preserves start/end priority, repetition, short capacities and bottom-first insertion order.");
}
