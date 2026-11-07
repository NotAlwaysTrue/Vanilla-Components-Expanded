using System.Reflection;
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
    foreach (int capacity in new[] { 1, 6 })
    {
        var container = (ItemContainer)RuntimeHelpers.GetUninitializedObject(typeof(ItemContainer));
        var inventory = new ItemInventory(null, container, capacity, capacity);
        typeof(ItemContainer).GetField(nameof(ItemContainer.Inventory))!.SetValue(container, inventory);
        var panel = new GUIFrame(new RectTransform(new Point(capacity * 120, height + 4)), style: null);
        var holder = new GUIFrame(new RectTransform(new Point(capacity * 100, height), panel.RectTransform, Anchor.Center), style: null);
        foreach (int offset in new[] { 0, 47, -23 })
        {
            panel.RectTransform.AbsoluteOffset = new Point(0, offset);
            bindInventory.Invoke(null, new object[] { container, holder });
            inventory.CreateSlots();
            if (inventory.visualSlots.Any(slot => slot.Rect.Center.Y != panel.Rect.Center.Y ||
                slot.Rect.Top < panel.Rect.Top || slot.Rect.Bottom > panel.Rect.Bottom))
            {
                throw new Exception($"{capacity} slots at height {height}, offset {offset}: panel {panel.Rect}, holder {holder.Rect}, slot {inventory.visualSlots[0].Rect}.");
            }
        }
    }
    Console.WriteLine("PASS: native intake/target slots remain centered at three dock sizes after moving/rebinding.");

    config.Graphics.HUDScale = 1;
    typeof(GameSettings).GetField("currentConfig", fields)!.SetValue(null, config);
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
            icon.Rect.Right >= label.Rect.Left || label.Rect.Right > cell.Rect.Right || label.Text.SanitizedValue != "Test ammunition")
        { throw new Exception($"Ammo icon/text layout failed at height {height}, icon kind {iconKind}: cell {cell.Rect}, icon {icon.Rect}, text {label.Rect}, color {icon.Color}, sprite match {icon.Sprite == expectedSprite}, focus {icon.CanBeFocused}/{cell.CanBeFocused}/{label.CanBeFocused}, text '{label.Text.SanitizedValue}'."); }
    }
    Console.WriteLine("PASS: ammo labels use the inventory icon/tint, fall back to the sprite, preserve text without assets and leave mouse focus to the row.");

    typeof(GameMain).GetProperty(nameof(GameMain.Instance))!.SetValue(null, headlessGame);
    typeof(PlayerInput).GetField("allowInput", fields)!.SetValue(null, true);
    var keyboard = typeof(PlayerInput).GetField("keyboardState", fields)!;
    var tooltipTile = new GUIButton(new RectTransform(new Point(72)), style: null);
    typeof(AmmoLoader).GetMethod("BindStockTooltip", fields)!.Invoke(null, new object[] { tooltipTile, ammoPrefab, "fallback" });
    foreach (Keys? key in new Keys?[] { null, Keys.LeftShift, null, Keys.RightShift, null })
    {
        keyboard.SetValue(null, key.HasValue ? new KeyboardState(key.Value) : new KeyboardState());
        string description = key?.ToString() ?? "released";
        typeof(ItemPrefab).GetProperty(nameof(ItemPrefab.Description))!.SetValue(ammoPrefab, (LocalizedString)description);
        tooltipTile.OnDrawToolTip(tooltipTile);
        if (!tooltipTile.ToolTip.SanitizedValue.Contains(description))
        { throw new Exception("Stock tooltip did not rebuild after pressing or releasing Shift on the same tile."); }
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
    ItemPrefab.Prefabs.Remove(ammoPrefab);
    typeof(GameMain).GetProperty(nameof(GameMain.Instance))!.SetValue(null, null);
    typeof(PlayerInput).GetField("allowInput", fields)!.SetValue(null, false);
    Console.WriteLine("PASS: stock tooltip refreshes in place on both Shift keys and release, and reuses text while the key state is unchanged.");

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
