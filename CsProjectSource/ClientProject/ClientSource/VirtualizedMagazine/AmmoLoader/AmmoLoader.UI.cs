using Barotrauma.Items.Components;

namespace VCE_VirtualizedMagazine;

public sealed partial class AmmoLoader
{
    private readonly List<AmmoRun> draft = [];
    private GUIListBox? presetList, planList, previewList, stockList, actualList, checkList;
    private GUITextBox? presetName;
    private GUITextBlock? targetLabel, planLabel, draftLabel, stockSummary, presetScope, checkAmountHeader;
    private GUIButton? loadButton, unloadButton, presetLoadButton, saveButton, clearButton, presetDelete;
    private GUIFrame? inputHolder, targetHolder, outputHolder;
    // Windows of their own, parented to the main one so they follow and hide with it.
    private GUIFrame? ioFrame, presetFrame;
    private GUINumberInput? addQuantity;
    private bool uiDirty = true, draftDirty;
    private bool displayedSynchronized;
    // A stock icon stages a plan edit on click; a second click inside the window withdraws a package instead.
    private const double DoubleClickSeconds = 0.3;
    private string pendingStockKey = "";
    private double pendingStockTime;
    private MagazinePrefab? selectedPreset;
    private ushort displayedTarget;
    private uint displayedRevision = uint.MaxValue;
    private int displayedCount = -1;
    private string message = "";
    private int addCount = 5;
    // The magazine panel lists numbered slots; anything past this is summarised.
    private const int MagazineSlots = 4;

    private int DraftCapacity => Target is { } target
        ? Math.Clamp(target.MaxSize - target.LoadedCount, 0, AmmoPlan.MaxRounds) : AmmoPlan.MaxRounds;

    private LocalizedString L(string key, string? fallback = null)
    {
        var original = TextManager.Get("vce.ammoloader." + (fallback ?? key));
        return string.IsNullOrEmpty(TextPrefix) ? original : TextManager.Get(TextPrefix + key).Fallback(original);
    }
    private static string AmmoName(string id) => ItemPrefab.FindByIdentifier(id.ToIdentifier())?.Name.Value ?? id;
    public override bool RecreateGUIOnResolutionChange => true;

    partial void InitClient()
    {
        CreateGUI();
    }

    public override void CreateGUI()
    {
        if (GuiFrame == null) { return; }
        string name = presetName?.Text ?? "";
        GuiFrame.ClearChildren();
        ioFrame = null;
        presetFrame = null;
        TryCreateDragHandle();
        // Keep this integrated window at its centered or player-dragged position.
        AllowUIOverlap = true;
        int gap = (int)(10 * GUI.SlicedSpriteScale);
        int sideInset = GUIStyle.ItemFrameMargin.X / 2;
        int topInset = GUIStyle.ItemFrameTopBarHeight + gap;
        var root = new GUILayoutGroup(new RectTransform(GuiFrame.Rect.Size - new Point(sideInset * 2, topInset + sideInset),
            GuiFrame.RectTransform) { AbsoluteOffset = new Point(sideInset, topInset) })
        {
            AbsoluteSpacing = gap
        };
        // Presets and item containers live in windows of their own; this one keeps the editor, Output and stock.
        GUILayoutGroup PanelRow(int height) => new(new RectTransform(new Point(root.Rect.Width, height), root.RectTransform),
            isHorizontal: true) { AbsoluteSpacing = gap };
        int listInset = Math.Max(2, (int)(4 * GUI.Scale));
        int magazineWidth = (int)(root.Rect.Width * 0.26f);
        int supplyWidth = root.Rect.Width - magazineWidth - gap;
        int upperHeight = (int)(root.Rect.Height * 0.6f);
        var upper = PanelRow(upperHeight);
        var editor = Column(upper, supplyWidth, listInset);
        var planColumns = Row(editor, 0.89f);
        planColumns.RelativeSpacing = 0;
        planColumns.AbsoluteSpacing = listInset;
        int arrangementWidth = (int)((planColumns.Rect.Width - listInset) * 0.58f);
        var arrangement = new GUILayoutGroup(new RectTransform(new Point(arrangementWidth, planColumns.Rect.Height), planColumns.RectTransform)) { RelativeSpacing = 0.015f };
        draftLabel = Label(arrangement, "", 0.06f);
        draftLabel.ToolTip = L("dragorder");
        planList = List(arrangement, 0.92f);
        planList.CurrentDragMode = GUIListBox.DragMode.DragWithinBox;
        planList.CurrentSelectMode = GUIListBox.SelectMode.None;
        planList.CanTakeKeyBoardFocus = false;
        planList.OnRearranged = (list, _) =>
        {
            if (list.HasDraggedElementIndexChanged)
            {
                ReorderRuns(list.Content.Children.Select(c => c.UserData).OfType<int>().ToArray());
            }
        };
        var preview = new GUILayoutGroup(new RectTransform(new Point(planColumns.Rect.Width - arrangementWidth - listInset, planColumns.Rect.Height), planColumns.RectTransform)) { RelativeSpacing = 0.015f };
        planLabel = Label(preview, "", 0.06f);
        previewList = List(preview, 0.92f);
        previewList.ToolTip = L("topfirst");
        previewList.CurrentDragMode = GUIListBox.DragMode.DragWithinBox;
        previewList.CurrentSelectMode = GUIListBox.SelectMode.None;
        previewList.CanTakeKeyBoardFocus = false;
        previewList.OnRearranged = (list, _) =>
        {
            if (list.HasDraggedElementIndexChanged)
            {
                ReorderRounds(list.Content.Children.Select(c => c.UserData).OfType<int>().ToArray());
            }
        };
        var editorActions = Row(editor, 0.08f);
        editorActions.RelativeSpacing = 0;
        editorActions.AbsoluteSpacing = listInset;
        var nameActions = new GUILayoutGroup(new RectTransform(new Point(arrangementWidth, editorActions.Rect.Height),
            editorActions.RectTransform), isHorizontal: true, childAnchor: Anchor.CenterLeft) { AbsoluteSpacing = gap };
        var nameLabel = Label(nameActions, L("presetname"), 1);
        nameLabel.Padding = Vector4.Zero;
        nameLabel.RectTransform.Resize(new Point((int)Math.Ceiling(nameLabel.TextSize.X), nameActions.Rect.Height));
        presetName = new GUITextBox(new RectTransform(new Point(arrangementWidth - nameLabel.Rect.Width - gap, nameActions.Rect.Height),
            nameActions.RectTransform), name, font: GUIStyle.SmallFont) { MaxTextLength = 48 };
        presetName.OnTextChanged += (_, _) => { draftDirty = uiDirty = true; message = ""; return true; };
        var saveActions = new GUILayoutGroup(new RectTransform(new Point(preview.Rect.Width, editorActions.Rect.Height),
            editorActions.RectTransform), isHorizontal: true, childAnchor: Anchor.CenterLeft);
        var saveButtonSize = new Point((saveActions.Rect.Width - listInset) / 2, saveActions.Rect.Height);
        saveActions.AbsoluteSpacing = saveActions.Rect.Width - saveButtonSize.X * 2;
        saveButton = Button(saveActions, "savepreset", 0.5f, 1, SavePreset);
        clearButton = Button(saveActions, "clear", 0.5f, 1, () => { draft.Clear(); DraftChanged(); });
        saveButton.RectTransform.Resize(saveButtonSize);
        clearButton.RectTransform.Resize(saveButtonSize);

        // Magazine contents and ammo pickup share one column, named Output.
        var magazine = Column(upper, magazineWidth, listInset);
        targetLabel = Label(magazine, L("output"), 0.055f);
        actualList = List(magazine, 0.72f);
        actualList.ToolTip = L("topfirst");
        var magazineActions = Row(magazine, 0.08f);
        unloadButton = Button(magazineActions, "unload", 0.49f, 1,
            () => { message = ""; RequestUnload(); uiDirty = true; });
        loadButton = Button(magazineActions, "load", 0.49f, 1,
            () => { message = ""; RequestLoad(draft.ToArray()); uiDirty = true; });

        var lower = PanelRow(root.Rect.Height - upperHeight - gap);
        var supply = Column(lower, supplyWidth, listInset);
        var supplyOptions = Row(supply, 0.14f);
        stockSummary = Label(supplyOptions, "", 1, 0.6f);
        Label(supplyOptions, L("addquantity"), 1, 0.18f).TextAlignment = Alignment.CenterRight;
        addQuantity = new GUINumberInput(new RectTransform(new Vector2(0.18f, 1), supplyOptions.RectTransform), NumberType.Int)
            { MinValueInt = 1, MaxValueInt = AmmoPlan.MaxRounds, IntValue = addCount };
        addQuantity.OnValueChanged += _ => { if (addQuantity.IntValue > 0) { addCount = addQuantity.IntValue; uiDirty = true; } };
        stockList = List(supply, 0.84f);
        stockList.ToolTip = L("addhint");
        stockList.Spacing = (int)(4 * GUI.Scale);
        stockList.CurrentSelectMode = GUIListBox.SelectMode.None;
        stockList.CanTakeKeyBoardFocus = false;
        var checks = Column(lower, magazineWidth, listInset);
        var checkHeader = Row(checks, 0.14f);
        checkList = List(checks, 0.84f);
        checkList.UpdateDimensions();
        checkHeader.RectTransform.Resize(new Point(checkList.Content.Rect.Width, checkHeader.Rect.Height));
        checkHeader.RectTransform.AbsoluteOffset = new Point(checkList.Content.RectTransform.AbsoluteOffset.X, 0);
        checkHeader.RelativeSpacing = 0.01f;
        Label(checkHeader, L("check"), 1, 0.55f);
        checkAmountHeader = CheckAmountLabel(checkHeader, L("needstock"));

        // Item I/O and the preset library each get a window of their own.
        CreateItemIOFrame(gap, sideInset, topInset);
        CreatePresetFrame(gap, sideInset, topInset);
        BindInventory(InputContainer, inputHolder);
        BindInventory(OutputContainer, outputHolder);
        BindInventory(TargetContainer, targetHolder);
        uiDirty = true;
    }

    /// <summary>Second window holding the machine's item containers, parked beside the main window.</summary>
    private void CreateItemIOFrame(int gap, int sideInset, int topInset)
    {
        int width = (int)(GuiFrame!.Rect.Width * 0.2f);
        int height = (int)(GuiFrame.Rect.Height * 0.86f);
        bool fitsRight = GuiFrame.Rect.Right + gap + width <= GameMain.GraphicsWidth;
        ioFrame = new GUIFrame(new RectTransform(new Point(width, height), GuiFrame.RectTransform, Anchor.TopLeft)
            { AbsoluteOffset = new Point(fitsRight ? GuiFrame.Rect.Width + gap : -width - gap, 0) }, style: "ItemUI");
        // Its own title bar, so the container window can be parked anywhere.
        new GUIDragHandle(new RectTransform(new Point(width, (int)GUIStyle.ItemFrameTopBarHeight), ioFrame.RectTransform, Anchor.TopLeft),
            ioFrame.RectTransform, null)
            { DragArea = new Rectangle(0, 0, GameMain.GraphicsWidth, GameMain.GraphicsHeight) };
        var panel = new GUILayoutGroup(new RectTransform(new Point(width - sideInset * 2, height - topInset - sideInset),
            ioFrame.RectTransform) { AbsoluteOffset = new Point(sideInset, topInset) }) { AbsoluteSpacing = gap };
        var ioPanel = Column(panel, panel.Rect.Width, 0);
        // One slot size shared by every container: 1 + 4 + 1 slots plus three captions have to fit.
        int slot = Math.Min(panel.Rect.Width,
            (int)((panel.Rect.Height * 0.79f - gap * 6) / 6f));
        slot = Math.Max((int)(14 * GUI.Scale), slot);
        Label(ioPanel, L("itemio"), 0.06f);
        // Captions above, slots below; the intake and output containers hold one slot, the magazine rack four.
        Label(ioPanel, L("intake"), 0.05f).ToolTip = L("intakehint");
        inputHolder = SlotHolder(ioPanel, slot, 1);
        inputHolder.ToolTip = L("intakehint");
        Label(ioPanel, L("targetslot"), 0.05f);
        targetHolder = SlotHolder(ioPanel, slot, 4);
        targetHolder.ToolTip = L("targetslot");
        Label(ioPanel, L("output"), 0.05f);
        outputHolder = SlotHolder(ioPanel, slot, 1);
        outputHolder.ToolTip = L("outputhint");
    }

    /// <summary>Rows of <paramref name="slots" /> equal slots, stacked below their caption.</summary>
    private GUIFrame SlotHolder(GUILayoutGroup parent, int slot, int slots)
    {
        var row = Row(parent, Math.Min(1f, (float)(slot * slots) / Math.Max(1, parent.Rect.Height)));
        return new GUIFrame(new RectTransform(new Point(slot, slot * slots), row.RectTransform, Anchor.Center), style: null)
            { IgnoreLayoutGroups = true };
    }

    /// <summary>Preset library in a window of its own, parked on the left of the main window.</summary>
    private void CreatePresetFrame(int gap, int sideInset, int topInset)
    {
        int width = (int)(GuiFrame!.Rect.Width * 0.24f);
        int height = (int)(GuiFrame.Rect.Height * 0.62f);
        bool fitsLeft = GuiFrame.Rect.Left - gap - width >= 0;
        presetFrame = new GUIFrame(new RectTransform(new Point(width, height), GuiFrame.RectTransform, Anchor.TopLeft)
            { AbsoluteOffset = new Point(fitsLeft ? -width - gap : GuiFrame.Rect.Width + gap, 0) }, style: "ItemUI");
        // Its own title bar, so the preset window can be parked anywhere.
        new GUIDragHandle(new RectTransform(new Point(width, (int)GUIStyle.ItemFrameTopBarHeight), presetFrame.RectTransform, Anchor.TopLeft),
            presetFrame.RectTransform, null)
            { DragArea = new Rectangle(0, 0, GameMain.GraphicsWidth, GameMain.GraphicsHeight) };
        var panel = new GUILayoutGroup(new RectTransform(new Point(width - sideInset * 2, height - topInset - sideInset),
            presetFrame.RectTransform) { AbsoluteOffset = new Point(sideInset, topInset) }) { AbsoluteSpacing = gap };
        var presets = Column(panel, panel.Rect.Width, 0);
        presetScope = Label(presets, "", 0.06f);
        presetList = new GUIListBox(new RectTransform(new Vector2(1, 0.86f), presets.RectTransform), useMouseDownToSelect: true)
        {
            CurrentDragMode = GUIListBox.DragMode.DragWithinBox,
            OnSelected = (_, data) =>
            {
                if (data is not MagazinePrefab preset) { return false; }
                selectedPreset = preset;
                presetList!.CurrentDragMode = MagazinePresetLibrary.IsCustom(preset)
                    ? GUIListBox.DragMode.DragWithinBox : GUIListBox.DragMode.NoDragging;
                presetLoadButton!.Enabled = true;
                presetDelete!.Enabled = MagazinePresetLibrary.IsCustom(preset);
                return true;
            },
            OnRearranged = (list, _) =>
            {
                ReorderPresets(list.Content.Children.Select(c => c.UserData).OfType<MagazinePrefab>().ToArray());
                uiDirty = true;
            }
        };
        var presetActions = Row(presets, 0.08f);
        presetLoadButton = Button(presetActions, "loadpreset", 0.76f, 1, LoadSelectedPreset);
        presetDelete = Button(presetActions, "delete", 0.22f, 1, DeletePreset);
    }

    private static void BindInventory(ItemContainer? container, GUIFrame holder)
    {
        if (container?.Inventory == null) { return; }
        container.AllowUIOverlap = true;
        container.Inventory.DrawWhenEquipped = true;
        container.Inventory.RectTransform = holder.RectTransform;
        container.Inventory.CreateSlots();
        var slots = container.Inventory.visualSlots;
        if (slots.Length > 0)
        {
            // Native inventory padding reserves extra space above the visible slots.
            int centerY = (slots.Min(s => s.Rect.Top) + slots.Max(s => s.Rect.Bottom)) / 2;
            holder.RectTransform.AbsoluteOffset += new Point(0, holder.RectTransform.Parent.Rect.Center.Y - centerY);
            container.Inventory.CreateSlots();
        }
    }

    private static GUILayoutGroup Column(GUILayoutGroup parent, int width, int horizontalInset)
    {
        var panel = new GUIFrame(new RectTransform(new Point(width, parent.Rect.Height), parent.RectTransform), style: null, color: new Color(24, 33, 33))
            { OutlineColor = new Color(65, 78, 73), OutlineThickness = 1 };
        var group = new GUILayoutGroup(new RectTransform(new Point(width - horizontalInset * 2, (int)(panel.Rect.Height * 0.95f)),
            panel.RectTransform, Anchor.Center)) { RelativeSpacing = 0.012f };
        return group;
    }

    private static GUITextBlock Label(GUILayoutGroup parent, LocalizedString text, float height, float width = 1) =>
        new(new RectTransform(new Vector2(width, height), parent.RectTransform), text, font: GUIStyle.SmallFont)
            { AutoScaleHorizontal = true, CanBeFocused = false };

    private static GUITextBlock DragMarker(GUILayoutGroup parent) =>
        new(new RectTransform(new Point((int)(16 * GUI.Scale)), parent.RectTransform, isFixedSize: true),
            "=", font: GUIStyle.SmallFont, textAlignment: Alignment.Center)
            { Padding = Vector4.Zero, CanBeFocused = false };

    private static GUITextBlock CheckAmountLabel(GUILayoutGroup parent, LocalizedString text) =>
        new(new RectTransform(new Vector2(0.43f, 1), parent.RectTransform, Anchor.CenterRight),
            text, font: GUIStyle.SmallFont, textAlignment: Alignment.CenterLeft)
            { IgnoreLayoutGroups = true, Padding = Vector4.Zero, AutoScaleHorizontal = true, CanBeFocused = false };

    private static GUITextBlock AmmoLabel(GUILayoutGroup parent, string id, string text, float width = 1)
    {
        var cell = new GUIFrame(new RectTransform(new Vector2(width, 1), parent.RectTransform), style: null)
            { CanBeFocused = false };
        var prefab = ItemPrefab.FindByIdentifier(id.ToIdentifier()) as ItemPrefab;
        int size = Math.Min(cell.Rect.Height, (int)(20 * GUI.Scale));
        int inset = size + (int)(2 * GUI.Scale);
        // Match the text's optical center despite transparent padding in inventory icons.
        int iconLift = Math.Min((cell.Rect.Height - size) / 2, (int)(2 * GUI.Scale));
        new GUIImage(new RectTransform(new Point(size), cell.RectTransform, Anchor.CenterLeft)
            { AbsoluteOffset = new Point(0, -iconLift) },
            prefab?.InventoryIcon ?? prefab?.Sprite, scaleToFit: true)
        {
            CanBeFocused = false,
            OverrideState = GUIComponent.ComponentState.None,
            Color = prefab?.InventoryIcon != null ? prefab.InventoryIconColor : prefab?.SpriteColor ?? Color.White
        };
        return new GUITextBlock(new RectTransform(new Point(Math.Max(0, cell.Rect.Width - inset), cell.Rect.Height),
            cell.RectTransform, Anchor.CenterLeft) { AbsoluteOffset = new Point(inset, 0) }, text, font: GUIStyle.SmallFont)
            { Padding = Vector4.Zero, AutoScaleHorizontal = true, CanBeFocused = false, ToolTip = text };
    }

    private static void BindStockTooltip(GUIComponent tile, ItemPrefab? prefab, string fallback, Func<LocalizedString>? hint = null)
    {
        bool? tooltipShift = null;
        string? previousHint = null;
        tile.OnDrawToolTip = component =>
        {
            bool shift = PlayerInput.IsShiftDown();
            LocalizedString extra = hint?.Invoke() ?? "";
            if (tooltipShift == shift && previousHint == extra.Value) { return; }
            component.ToolTip = RichString.Rich((prefab?.GetTooltip(Character.Controlled) ?? fallback) +
                (extra.Length > 0 ? "\n" + extra : ""));
            tooltipShift = shift;
            previousHint = extra.Value;
        };
    }

    private static GUILayoutGroup Row(GUILayoutGroup parent, float height) =>
        new(new RectTransform(new Vector2(1, height), parent.RectTransform), isHorizontal: true, childAnchor: Anchor.CenterLeft) { RelativeSpacing = 0.02f };

    private static GUIListBox List(GUILayoutGroup parent, float height) =>
        new(new RectTransform(new Vector2(1, height), parent.RectTransform)) { AutoHideScrollBar = false, KeepSpaceForScrollBar = true };

    private GUIButton Button(GUILayoutGroup parent, string text, float width, float height, Action action) =>
        new(new RectTransform(new Vector2(width, height), parent.RectTransform), L(text), style: "GUIButtonSmallFreeScale")
        {
            ToolTip = L(text == "delete" ? "remove" : text),
            OnClicked = (_, _) => { action(); return true; }
        };

    private static GUILayoutGroup ListRow(GUIListBox list, int height = 32) =>
        new(new RectTransform(new Vector2(1, 0), list.Content.RectTransform,
            minSize: new Point(0, (int)(height * GUI.Scale))), isHorizontal: true) { RelativeSpacing = 0.01f };

    private static void TextRow(GUIListBox list, string text, Color? color = null, int height = 26)
    {
        var row = new GUITextBlock(new RectTransform(new Vector2(1, 0), list.Content.RectTransform,
            minSize: new Point(0, (int)(height * GUI.Scale))), text, font: GUIStyle.SmallFont)
            { ToolTip = text, AutoScaleHorizontal = true, CanBeFocused = false };
        if (color.HasValue) { row.TextColor = color.Value; }
    }

    private void DraftChanged()
    {
        if (draft.Count > 0) { var merged = AmmoPlan.Compact(AmmoPlan.Expand(draft)); draft.Clear(); draft.AddRange(merged); }
        draftDirty = uiDirty = true;
        message = "";
    }

    public override void AddToGUIUpdateList(int order = 0)
    {
        // Rebuild before collection: HUD updates run later, leaving detached rows in this frame's update/draw list.
        if (uiDirty && presetList != null && GUI.KeyboardDispatcher.Subscriber is not GUITextBox &&
            presetList.DraggedElement == null && planList?.DraggedElement == null && previewList?.DraggedElement == null)
        {
            RefreshUI();
            uiDirty = false;
        }
        if (GuiFrame?.GetChild<GUIDragHandle>() is { } dragHandle)
        {
            // The window exceeds ItemHUDArea; competing top/bottom clamps reverse vertical dragging.
            dragHandle.DragArea = new Rectangle(0, 0, GameMain.GraphicsWidth, GameMain.GraphicsHeight);
        }
        base.AddToGUIUpdateList(order);
    }

    public override void UpdateHUDComponentSpecific(Character character, float deltaTime, Camera cam)
    {
        if (presetList == null) { CreateGUI(); }
        if (saveButton != null)
        {
            saveButton.Enabled = !string.IsNullOrWhiteSpace(presetName?.Text) && AmmoPlan.IsValid(draft, AmmoPlan.MaxRounds);
        }
        UpdateClientState(deltaTime);
        UpdateWithdrawalButtons();
        FlushPendingStockClick();
        var target = Target;
        bool synchronized = IsSynchronized;
        if (displayedTarget != (target?.Item.ID ?? 0) || displayedCount != (target?.LoadedCount ?? 0) ||
            displayedRevision != StateRevision || displayedSynchronized != synchronized)
        {
            displayedTarget = target?.Item.ID ?? 0;
            displayedCount = target?.LoadedCount ?? 0;
            displayedRevision = StateRevision;
            displayedSynchronized = synchronized;
            uiDirty = true;
        }
    }

    private void UpdateWithdrawalButtons()
    {
        if (stockList == null) { return; }
        foreach (var tile in stockList.Content.Children.OfType<GUIButton>())
        {
            if (tile.UserData is not ValueTuple<string, ItemPrefab?> package) { continue; }
            bool canWithdraw = IsSynchronized && WithdrawalProblem(package.Item1, package.Item2) == "withdraw";
            tile.Enabled = canWithdraw || CanAddToPlan(package.Item1);
            foreach (var image in tile.Children.OfType<GUIImage>())
            { if (image.UserData is Color tint) { image.Color = tint * (tile.Enabled ? 1f : 0.4f); } }
        }
    }

    private bool CanAddToPlan(string id) => IsCompatible(Target, id) && draft.Sum(r => r.Count) < DraftCapacity &&
        (draft.Count < AmmoPlan.MaxGroups || string.Equals(draft.FirstOrDefault()?.Id, id, StringComparison.OrdinalIgnoreCase));

    /// <summary>One click stages a plan edit; a second click inside the window withdraws a package instead.</summary>
    private void StockClicked(string id)
    {
        double now = Timing.TotalTime;
        if (pendingStockKey == id && now - pendingStockTime <= DoubleClickSeconds)
        {
            pendingStockKey = "";
            if (IsSynchronized) { RequestWithdraw(id); uiDirty = true; }
            return;
        }
        pendingStockKey = id;
        pendingStockTime = now;
    }

    /// <summary>Applies the staged single-click once the double-click window has passed.</summary>
    private void FlushPendingStockClick()
    {
        if (pendingStockKey.Length == 0 || Timing.TotalTime - pendingStockTime <= DoubleClickSeconds) { return; }
        string id = pendingStockKey;
        pendingStockKey = "";
        AddRun(id, addCount);
    }

    private void RefreshUI()
    {
        var target = Target;
        var stock = Stock;
        int capacity = DraftCapacity;
        int planned = draft.Sum(r => r.Count);
        var visiblePresets = MagazinePresetLibrary.All(target)
            .Where(p => target == null || MagazinePresetLibrary.GetRuns(p).All(r => IsCompatible(target, r.Id)))
            .ToList();
        if (selectedPreset != null)
        {
            string selectedName = MagazinePresetLibrary.GetName(selectedPreset);
            bool selectedBuiltIn = !MagazinePresetLibrary.IsCustom(selectedPreset);
            selectedPreset = visiblePresets.FirstOrDefault(p => MagazinePresetLibrary.GetName(p) == selectedName &&
                !MagazinePresetLibrary.IsCustom(p) == selectedBuiltIn);
        }
        presetList!.Content.ClearChildren();
        presetList.Deselect();
        presetLoadButton!.Enabled = selectedPreset != null;
        presetScope!.Text = L(target == null ? "allpresets" : "compatiblepresets");
        presetDelete!.Enabled = selectedPreset != null && MagazinePresetLibrary.IsCustom(selectedPreset);
        if (visiblePresets.Count == 0) { TextRow(presetList, L("nopresets").Value); }
        foreach (var preset in visiblePresets)
        {
            var runs = MagazinePresetLibrary.GetRuns(preset);
            var row = new GUIFrame(new RectTransform(new Vector2(1, 0), presetList.Content.RectTransform,
                minSize: new Point(0, (int)(32 * GUI.Scale))), style: "ListBoxElement")
            {
                UserData = preset,
                ToolTip = $"{MagazinePresetLibrary.GetName(preset)}\n{string.Join("\n", runs.Select(r => $"{AmmoName(r.Id)} x {r.Count}"))}\n{L(MagazinePresetLibrary.IsCustom(preset) ? "dragorder" : "builtin")}",
                CanBeFocused = true
            };
            new GUITextBlock(new RectTransform(new Vector2(0.96f, 1), row.RectTransform, Anchor.Center),
                $"{MagazinePresetLibrary.GetName(preset)} | {runs.Sum(r => r.Count)} {L("rounds")}", font: GUIStyle.SmallFont)
                { AutoScaleHorizontal = true, CanBeFocused = false };
        }
        if (selectedPreset != null) { presetList.Select(selectedPreset, autoScroll: GUIListBox.AutoScroll.Disabled); }
        planList!.Content.ClearChildren();
        previewList!.Content.ClearChildren();
        if (draft.Count == 0)
        {
            TextRow(planList, L("addhint").Value);
            TextRow(previewList, L("emptyplan").Value);
        }
        for (int i = 0; i < draft.Count; i++)
        {
            int index = i;
            var run = draft[i];
            var card = new GUIFrame(new RectTransform(new Vector2(1, 0), planList.Content.RectTransform,
                minSize: new Point(0, (int)(32 * GUI.Scale))), style: "ListBoxElement")
                { UserData = index, CanBeFocused = true, ToolTip = $"{AmmoName(run.Id)}\n{L("dragorder")}" };
            var row = new GUILayoutGroup(new RectTransform(new Vector2(0.98f, 0.9f), card.RectTransform, Anchor.Center),
                isHorizontal: true, childAnchor: Anchor.CenterLeft)
                { RelativeSpacing = 0.01f, CanBeFocused = false };
            DragMarker(row);
            var ammoLabel = AmmoLabel(row, run.Id, AmmoName(run.Id), 0.56f);
            if (!IsCompatible(target, run.Id)) { ammoLabel.TextColor = Color.OrangeRed; }
            var number = new GUINumberInput(new RectTransform(new Vector2(0.26f, 1), row.RectTransform),
                NumberType.Int)
            {
                MinValueInt = 1, MaxValueInt = Math.Max(run.Count, capacity - planned + run.Count), IntValue = run.Count
            };
            number.ToolTip = L("rounds");
            number.OnValueChanged += _ => ChangeRunCount(index, number.IntValue);
            Button(row, "delete", 0.1f, 1, () => { draft.RemoveAt(index); DraftChanged(); });
        }
        var rounds = AmmoPlan.Expand(draft).ToArray();
        for (int i = 0; i < rounds.Length; i++)
        {
            int index = i;
            var card = new GUIFrame(new RectTransform(new Vector2(1, 0), previewList.Content.RectTransform,
                minSize: new Point(0, (int)(32 * GUI.Scale))), style: "ListBoxElement")
                { UserData = index, CanBeFocused = true, ToolTip = $"{AmmoName(rounds[i])}\n{L("dragorder")}" };
            var row = new GUILayoutGroup(new RectTransform(new Vector2(0.98f, 0.9f), card.RectTransform, Anchor.Center),
                isHorizontal: true, childAnchor: Anchor.CenterLeft) { RelativeSpacing = 0.01f, CanBeFocused = false };
            DragMarker(row);
            var ammoLabel = AmmoLabel(row, rounds[i], $"{i + 1:D2} | {AmmoName(rounds[i])}", 0.80f);
            if (!IsCompatible(target, rounds[i])) { ammoLabel.TextColor = Color.OrangeRed; }
            Button(row, "delete", 0.13f, 1, () => RemoveRound(index));
        }
        stockList!.Content.ClearChildren();
        var demand = AmmoStock.Count(rounds.TakeLast(capacity));
        var quote = QuoteSupply(demand);
        var supplied = SuppliedAmmo(quote);
        var visibleStock = stock.Counts.Keys.Concat(supplied.Keys).Distinct(StringComparer.OrdinalIgnoreCase)
            .Where(id => target == null || IsCompatible(target, id)).OrderBy(AmmoName)
            .Select(id => new KeyValuePair<string, int>(id, stock[id])).ToArray();
        stockList.UseGridLayout = visibleStock.Length > 0;
        stockList.ToolTip = L("addhint");
        bool hasSupply = supplies.Length > 0;
        stockSummary!.Text = message.Length > 0 ? message : $"{L(hasSupply ? "availableammo" : target == null ? "allstock" : "compatiblestock")} | {visibleStock.Length} {L("types")} | {(hasSupply ? L("stored") + " " : "")}{visibleStock.Sum(p => (long)p.Value):N0} {L("rounds")}";
        stockSummary.ToolTip = stockSummary.Text + (hasSupply ? "\n" + L("supplyhint") + "\n" +
            string.Join("\n", supplies.Select(p => $"{AmmoName(p.Prefab)} | {p.Amount:N2}/{p.Capacity:N2}")) : "");
        if (visibleStock.Length == 0) { TextRow(stockList, L("emptystock").Value); }
        int stockCellSize = (int)(72 * GUI.Scale);
        foreach (var p in visibleStock)
        {
            bool fromSupply = supplied.TryGetValue(p.Key, out int available);
            string stockCaption = UseSupplyStorage
                ? L("stockandsupply").Value.Replace("[stock]", p.Value.ToString()).Replace("[supply]", available.ToString())
                : $"{p.Value:N0}";
            int stockCaptionHeight = (int)((stockCaption.Contains('\n') ? 30 : 16) * GUI.Scale);
            int stockImageHeight = stockCellSize - stockCaptionHeight;
            var prefab = ItemPrefab.FindByIdentifier(p.Key.ToIdentifier()) as ItemPrefab;
            var package = FindWithdrawalPackage(p.Key);
            bool canWithdraw = IsSynchronized && WithdrawalProblem(p.Key, package) == "withdraw";
            var tile = new GUIButton(new RectTransform(new Point(stockCellSize), stockList.Content.RectTransform, isFixedSize: true),
                style: "GUIButtonSmallFreeScale")
            {
                UserData = (p.Key, package),
                OnClicked = (_, _) => { StockClicked(p.Key); return true; },
                Enabled = canWithdraw || CanAddToPlan(p.Key)
            };
            BindStockTooltip(tile, prefab, AmmoName(p.Key), () =>
                (fromSupply ? $"{L("stored").Value}: {p.Value:N0}\n{L("supplied").Value}: {available:N0}\n" : "") +
                L(canWithdraw ? "doubleclickhint" : "addhint").Value);
            if (prefab != null && (prefab.InventoryIcon ?? prefab.Sprite) is { } icon)
            {
                new GUIImage(new RectTransform(new Point((int)(stockCellSize * 0.8f), stockImageHeight),
                    tile.RectTransform, Anchor.TopCenter), icon, scaleToFit: true)
                {
                    CanBeFocused = false,
                    UserData = icon == prefab.InventoryIcon ? prefab.InventoryIconColor : prefab.SpriteColor,
                    Color = (icon == prefab.InventoryIcon ? prefab.InventoryIconColor : prefab.SpriteColor) * (tile.Enabled ? 1f : 0.4f)
                };
            }
            else
            {
                new GUITextBlock(new RectTransform(new Point(stockCellSize, stockImageHeight), tile.RectTransform, Anchor.TopCenter),
                    AmmoName(p.Key), font: GUIStyle.SmallFont, textAlignment: Alignment.Center, wrap: true)
                    { CanBeFocused = false, AutoScaleHorizontal = true };
            }
            new GUITextBlock(new RectTransform(new Point(stockCellSize, stockCaptionHeight), tile.RectTransform, Anchor.BottomRight),
                stockCaption,
                font: GUIStyle.SmallFont, textAlignment: Alignment.BottomRight)
            {
                CanBeFocused = false, AutoScaleHorizontal = !UseSupplyStorage, Shadow = true,
                TextScale = UseSupplyStorage ? 0.75f : 1f,
                Padding = new Vector4(4 * GUI.Scale, 0, 4 * GUI.Scale, 2 * GUI.Scale)
            };
        }
        checkList!.Content.ClearChildren();
        var checkAmounts = new List<GUITextBlock> { checkAmountHeader! };
        var checkNames = new List<GUITextBlock>();
        foreach (var id in demand.Keys.OrderBy(AmmoName))
        {
            int needed = supplies.Any(p => p.Costs.ContainsKey(id)) ? quote.Stock.GetValueOrDefault(id) : demand[id];
            if (needed == 0) { continue; }
            var row = ListRow(checkList);
            var name = AmmoLabel(row, id, AmmoName(id));
            name.ToolTip = id;
            checkNames.Add(name);
            var amounts = CheckAmountLabel(row, $"{needed} / {stock[id]}");
            checkAmounts.Add(amounts);
            if (!IsCompatible(target, id) || (needed > stock[id] && !quote.CanLoad)) { amounts.TextColor = Color.OrangeRed; }
        }
        foreach (var pool in supplies.Where(p => quote.Pools.ContainsKey(p.Id)))
        {
            double used = quote.Pools[pool.Id];
            var row = ListRow(checkList);
            checkNames.Add(AmmoLabel(row, pool.Prefab, AmmoName(pool.Prefab)));
            var amounts = CheckAmountLabel(row, $"{used:N2} / {pool.Amount:N1}");
            checkAmounts.Add(amounts);
            amounts.ToolTip = L("supplycost");
            if (used > pool.Amount) { amounts.TextColor = Color.OrangeRed; }
        }
        if (supplyError) { TextRow(checkList, L("supplyerror").Value, Color.OrangeRed); }
        int amountWidth = Math.Max(1, (int)Math.Ceiling(Math.Min(checkList.Content.Rect.Width * 0.43f,
            checkAmounts.Max(label => label.TextSize.X))));
        foreach (var label in checkAmounts)
        {
            label.RectTransform.Resize(new Point(amountWidth, label.Rect.Height));
        }
        int nameWidth = Math.Max(0, checkList.Content.Rect.Width - amountWidth - (int)(2 * GUI.Scale));
        foreach (var label in checkNames)
        {
            label.Parent.RectTransform.Resize(new Point(nameWidth, label.Parent.Rect.Height));
            label.RectTransform.Resize(new Point(Math.Max(0, nameWidth - label.RectTransform.AbsoluteOffset.X), label.Rect.Height));
            label.TextScale = 1f;
        }
        actualList!.Content.ClearChildren();
        var loaded = target?.LoadedAmmoIdentifiers.ToArray() ?? [];
        if (loaded.Length == 0) { TextRow(actualList, L(target == null ? "nomagazine" : "empty").Value); }
        // Numbered slots, at most four of them; the header already shows the full count.
        for (int i = 0; i < Math.Min(loaded.Length, MagazineSlots); i++)
        {
            AmmoLabel(ListRow(actualList, 26), loaded[i].Value, $"{i + 1} | {AmmoName(loaded[i].Value)}");
        }
        if (loaded.Length > MagazineSlots)
        {
            TextRow(actualList, $"+{loaded.Length - MagazineSlots} {L("rounds").Value}");
        }
        targetLabel!.Text = target == null ? L("output") : $"{L("output")} | {target.LoadedCount}/{target.MaxSize}";
        targetLabel.ToolTip = target == null ? L("nomagazine") : target.Item.Name;
        planLabel!.Text = $"{L("preview")} | {planned} {L("rounds")}";
        planLabel.ToolTip = L("topfirst");
        draftLabel!.Text = $"{L("plan")}{(draftDirty ? " *" : "")}";
        draftLabel.ToolTip = $"{L("dragorder")}\n{L(draftDirty ? "unsaved" : "savedstate")}";
        clearButton!.Enabled = draft.Count > 0;
        string problem = !Ready ? "unavailable" : !IsSynchronized ? "syncing" : target == null ? "nomagazine" :
            target.LoadedCount >= target.MaxSize ? "full" : draft.Count == 0 ? "emptyplan" :
            !AmmoPlan.IsValid(draft, AmmoPlan.MaxRounds) ? "invalidplan" :
            demand.Keys.Any(id => !IsCompatible(target, id)) ? "incompatible" : !quote.CanLoad ? "notenough" : "ready";
        loadButton!.Enabled = problem == "ready";
        loadButton.ToolTip = L(problem);
        unloadButton!.Enabled = Ready && IsSynchronized && target?.LoadedCount > 0;
        unloadButton.ToolTip = L("unloadhint", "unload");
        // Visibility culling during collection needs the new scroll range, including after a list shrinks.
        foreach (var list in new[] { presetList, planList, previewList, stockList, actualList, checkList })
        {
            list!.UpdateScrollBarSize();
        }
    }

    private void AddRun(string id, int count)
    {
        int capacity = DraftCapacity;
        if (count < 1 || count > AmmoPlan.MaxRounds || string.IsNullOrWhiteSpace(id)) { return; }
        count = Math.Min(count, capacity - draft.Sum(r => r.Count));
        if (count < 1) { return; }
        var plan = draft.Prepend(new AmmoRun(id, count)).ToArray();
        var merged = AmmoPlan.Compact(AmmoPlan.Expand(plan));
        if (!AmmoPlan.IsValid(merged, capacity)) { return; }
        draft.Clear();
        draft.AddRange(merged);
        DraftChanged();
    }

    private void ChangeRunCount(int index, int count)
    {
        // Clearing a number input temporarily reports zero even with MinValueInt = 1.
        if (count < 1 || index < 0 || index >= draft.Count) { return; }
        if (count > draft[index].Count && draft.Sum(r => (long)r.Count) - draft[index].Count + count > DraftCapacity) { return; }
        draft[index] = draft[index] with { Count = count };
        DraftChanged();
    }

    private void ReorderRuns(int[] order)
    {
        if (order.Length != draft.Count || order.Distinct().Count() != order.Length ||
            order.Any(i => i < 0 || i >= draft.Count) || order.SequenceEqual(Enumerable.Range(0, draft.Count))) { return; }
        var reordered = order.Select(i => draft[i]).ToArray();
        draft.Clear();
        draft.AddRange(reordered);
        DraftChanged();
    }

    private void RemoveRound(int index)
    {
        var rounds = AmmoPlan.Expand(draft).ToList();
        if (index < 0 || index >= rounds.Count) { return; }
        rounds.RemoveAt(index);
        draft.Clear();
        draft.AddRange(AmmoPlan.Compact(rounds));
        DraftChanged();
    }

    private void ReorderRounds(int[] order)
    {
        var rounds = AmmoPlan.Expand(draft).ToArray();
        if (order.Length != rounds.Length || order.Distinct().Count() != order.Length ||
            order.Any(i => i < 0 || i >= rounds.Length) || order.SequenceEqual(Enumerable.Range(0, rounds.Length))) { return; }
        var reordered = AmmoPlan.Compact(order.Select(i => rounds[i]));
        if (!AmmoPlan.IsValid(reordered, AmmoPlan.MaxRounds))
        {
            message = L("invalidplan").Value;
            uiDirty = true;
            return;
        }
        draft.Clear();
        draft.AddRange(reordered);
        DraftChanged();
    }

    private void LoadSelectedPreset()
    {
        var preset = selectedPreset;
        if (preset == null) { return; }
        var runs = MagazinePresetLibrary.GetRuns(preset);
        if (!AmmoPlan.IsValid(runs, AmmoPlan.MaxRounds))
        {
            message = L("invalidplan").Value;
            uiDirty = true;
            return;
        }
        void Apply()
        {
            draft.Clear();
            draft.AddRange(runs);
            selectedPreset = preset;
            presetName!.Text = MagazinePresetLibrary.GetName(preset);
            draftDirty = false;
            message = "";
            uiDirty = true;
        }
        if (draftDirty) { GUI.AskForConfirmation(L("loadpreset"), L("confirmreplace"), Apply).DrawOnTop = true; }
        else { Apply(); }
    }

    private void SavePreset()
    {
        string name = presetName!.Text.Trim();
        if (name.Length is 0 or > MagazinePresetLibrary.MaxNameLength || !AmmoPlan.IsValid(draft, AmmoPlan.MaxRounds))
        {
            message = L("invalidpreset").Value;
            uiDirty = true;
            return;
        }
        // The authority edits the in-memory library directly; clients ask the server, which owns the files.
        if (MagazinePresetLibrary.IsAuthority)
        {
            selectedPreset = MagazinePresetLibrary.Create(name, draft.ToArray());
            Changed();
        }
        else { RequestSavePreset(name, draft.ToArray()); }

        draftDirty = false;
        message = L("saved").Value;
        uiDirty = true;
    }

    private void DeletePreset()
    {
        if (selectedPreset == null || !MagazinePresetLibrary.IsCustom(selectedPreset)) { return; }
        if (MagazinePresetLibrary.IsAuthority) { MagazinePresetLibrary.Remove(selectedPreset); Changed(); }
        else { RequestDeletePreset(MagazinePresetLibrary.GetName(selectedPreset)); }

        selectedPreset = null;
        uiDirty = true;
    }

    /// <summary>Persists the order the player dragged the presets into. Presets hidden by the filter keep their slots.</summary>
    private void ReorderPresets(IReadOnlyList<MagazinePrefab> visible)
    {
        var target = visible.Where(MagazinePresetLibrary.IsCustom).ToArray();
        var current = MagazinePresetLibrary.Custom;
        var slots = Enumerable.Range(0, current.Count).Where(i => target.Contains(current[i])).ToArray();
        if (slots.Length != target.Length || target.Length == 0) { return; }
        var before = slots.Select(i => current[i]).ToArray();
        int first = 0;
        while (first < target.Length && before[first] == target[first]) { first++; }
        int last = target.Length - 1;
        while (last >= 0 && before[last] == target[last]) { last--; }
        if (first > last) { return; }
        // One drag moves one preset: it is the entry that left its slot.
        MagazinePrefab moved;
        int index;
        if (target[last] == before[first]) { moved = target[last]; index = last; }
        else if (target[first] == before[last]) { moved = target[first]; index = first; }
        else { return; }

        if (MagazinePresetLibrary.IsAuthority)
        {
            if (MagazinePresetLibrary.Move(moved, slots[index])) { Changed(); }
        }
        else { RequestMovePreset(MagazinePresetLibrary.GetName(moved), slots[index]); }
    }
}
