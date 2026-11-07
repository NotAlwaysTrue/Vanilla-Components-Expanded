using Barotrauma.Items.Components;
using VCE_VirtualizedMagazine;

namespace VCE.AmmoLoading;

public sealed partial class AmmoLoader
{
    private readonly List<AmmoRun> draft = [];
    private GUIListBox? presetList, planList, previewList, stockList, actualList, checkList;
    private GUITextBox? presetName;
    private GUITextBlock? targetLabel, planLabel, draftLabel, stockSummary, presetScope, checkAmountHeader;
    private GUIButton? loadButton, unloadButton, presetLoadButton, saveButton, clearButton, presetDelete;
    private GUIFrame? inputHolder, targetHolder, outputHolder;
    private GUINumberInput? addQuantity;
    private bool uiDirty = true, draftDirty, withdrawMode;
    private bool displayedSynchronized;
    private AmmoPreset? selectedPreset;
    private ushort displayedTarget;
    private uint displayedRevision = uint.MaxValue;
    private int displayedCount = -1;
    private string message = "";
    private int addCount = 5;

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
        GUILayoutGroup PanelRow(int height) => new(new RectTransform(new Point(root.Rect.Width, height), root.RectTransform),
            isHorizontal: true) { AbsoluteSpacing = gap };
        int presetWidth = (int)(root.Rect.Width * 0.2f);
        // Preserve the preset panel's original inset as the common list spacing.
        int listInset = presetWidth / 2 - (int)(presetWidth * 0.96f) / 2;
        int magazineWidth = (int)(root.Rect.Width * 0.22f);
        int supplyWidth = root.Rect.Width - magazineWidth - gap;
        int upperHeight = (int)(root.Rect.Height * 0.56f);
        int dockHeight = (int)(98 * GUI.Scale);
        var upper = PanelRow(upperHeight);
        var presets = Column(upper, presetWidth, listInset);
        presetScope = Label(presets, "", 0.055f);
        presetList = new GUIListBox(new RectTransform(new Vector2(1, 0.83f), presets.RectTransform), useMouseDownToSelect: true)
        {
            CurrentDragMode = GUIListBox.DragMode.DragWithinBox,
            OnSelected = (_, data) =>
            {
                if (data is not AmmoPreset preset) { return false; }
                selectedPreset = preset;
                presetList!.CurrentDragMode = preset.BuiltIn ? GUIListBox.DragMode.NoDragging : GUIListBox.DragMode.DragWithinBox;
                presetLoadButton!.Enabled = true;
                presetDelete!.Enabled = !preset.BuiltIn;
                return true;
            },
            OnRearranged = (list, _) =>
            {
                var old = AmmoPresets.Saved.ToArray();
                if (AmmoPresets.Reorder(list.Content.Children.Select(c => c.UserData).OfType<AmmoPreset>().ToArray())) { TrySavePresets(old); }
                uiDirty = true;
            }
        };
        var presetActions = Row(presets, 0.08f);
        presetLoadButton = Button(presetActions, "loadpreset", 0.76f, 1, LoadSelectedPreset);
        presetDelete = Button(presetActions, "delete", 0.22f, 1, DeletePreset);

        var editor = Column(upper, supplyWidth - presetWidth - gap, listInset);
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

        var magazine = Column(upper, magazineWidth, listInset);
        targetLabel = Label(magazine, "", 0.055f);
        actualList = List(magazine, 0.83f);
        actualList.ToolTip = L("topfirst");
        var magazineActions = Row(magazine, 0.08f);
        unloadButton = Button(magazineActions, "unload", 0.49f, 1,
            () => { message = ""; RequestUnload(); uiDirty = true; });
        loadButton = Button(magazineActions, "load", 0.49f, 1,
            () => { message = ""; RequestLoad(draft.ToArray()); uiDirty = true; });

        var lower = PanelRow(root.Rect.Height - upperHeight - dockHeight - gap * 2);
        var supply = Column(lower, supplyWidth, listInset);
        var supplyOptions = Row(supply, 0.14f);
        stockSummary = Label(supplyOptions, "", 1, 0.6f);
        Label(supplyOptions, L("addquantity"), 1, 0.18f).TextAlignment = Alignment.CenterRight;
        addQuantity = new GUINumberInput(new RectTransform(new Vector2(0.18f, 1), supplyOptions.RectTransform), NumberType.Int)
            { MinValueInt = 1, MaxValueInt = AmmoPlan.MaxRounds, IntValue = addCount, Enabled = !withdrawMode };
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

        var dock = PanelRow(dockHeight);
        int intakeWidth = (supplyWidth - gap) / 2;
        var intake = Row(Column(dock, intakeWidth, listInset), 1);
        var intakeLabel = Label(intake, L("intake"), 1);
        intakeLabel.Padding = Vector4.Zero;
        intakeLabel.RectTransform.Resize(new Point((int)Math.Ceiling(intakeLabel.TextSize.X), intake.Rect.Height));
        inputHolder = new GUIFrame(new RectTransform(new Point(intake.Rect.Width - intakeLabel.Rect.Width - gap,
            (int)(intake.Rect.Height * 0.84f)), intake.RectTransform, Anchor.CenterRight), style: null)
            { IgnoreLayoutGroups = true };
        inputHolder.ToolTip = L("intakehint");
        var output = Row(Column(dock, supplyWidth - intakeWidth - gap, listInset), 1);
        output.RelativeSpacing = 0;
        output.AbsoluteSpacing = gap;
        var outputLabel = Label(output, L("output"), 1);
        outputLabel.Padding = Vector4.Zero;
        outputLabel.RectTransform.Resize(new Point((int)Math.Ceiling(outputLabel.TextSize.X), output.Rect.Height));
        var withdrawToggle = new GUITickBox(new RectTransform(new Point((int)(20 * GUI.Scale)), output.RectTransform),
            "", font: GUIStyle.SmallFont) { Selected = withdrawMode, ToolTip = L("withdrawmodehint") };
        withdrawToggle.OnSelected = tickBox =>
        {
            withdrawMode = tickBox.Selected;
            addQuantity!.Enabled = !withdrawMode;
            message = "";
            uiDirty = true;
            return true;
        };
        outputHolder = new GUIFrame(new RectTransform(new Point(output.Rect.Width - outputLabel.Rect.Width - withdrawToggle.Rect.Width - gap * 2,
            (int)(output.Rect.Height * 0.84f)), output.RectTransform, Anchor.CenterRight), style: null)
            { IgnoreLayoutGroups = true, ToolTip = L("outputhint") };
        intakeLabel.RectTransform.Resize(new Point(intake.Rect.Width - outputHolder.Rect.Width - gap, intake.Rect.Height));
        inputHolder.RectTransform.Resize(new Point(outputHolder.Rect.Width, inputHolder.Rect.Height));
        var target = Row(Column(dock, magazineWidth, listInset), 1);
        Label(target, L("targetslot"), 1, 0.27f);
        targetHolder = new GUIFrame(new RectTransform(new Vector2(0.43f, 0.84f), target.RectTransform, Anchor.Center), style: null)
            { IgnoreLayoutGroups = true };
        targetHolder.ToolTip = L("targetslot");

        root.ForceLayoutRecalculation();
        int listBottom = presetList.Rect.Bottom;
        foreach (var list in new[] { planList, previewList, actualList })
        {
            list.RectTransform.Resize(new Point(list.Rect.Width, listBottom - list.Rect.Top));
        }
        int actionCenter = (listBottom + lower.Rect.Top) / 2;
        foreach (var actions in new[] { presetActions, editorActions, magazineActions })
        {
            actions.IgnoreLayoutGroups = true;
            actions.RectTransform.RelativeOffset = Vector2.Zero;
            actions.RectTransform.AbsoluteOffset = new Point(0,
                actionCenter - actions.RectTransform.Parent.Rect.Top - actions.Rect.Height / 2);
        }
        root.ForceLayoutRecalculation();
        BindInventory(InputContainer, inputHolder);
        BindInventory(OutputContainer, outputHolder);
        BindInventory(TargetContainer, targetHolder);
        uiDirty = true;
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
            "≡", font: GUIStyle.SmallFont, textAlignment: Alignment.Center)
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

    private static void SequenceRows(GUIListBox list, IReadOnlyList<AmmoRun> sequence)
    {
        int first = 1;
        foreach (var run in sequence)
        {
            int last = first + run.Count - 1;
            string range = first == last ? $"{first:D2}" : $"{first:D2}–{last:D2}";
            AmmoLabel(ListRow(list, 26), run.Id, $"{range} · {AmmoName(run.Id)} × {run.Count}");
            first = last + 1;
        }
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
        if (!withdrawMode || stockList == null) { return; }
        foreach (var tile in stockList.Content.Children.OfType<GUIButton>())
        {
            if (tile.UserData is ValueTuple<string, ItemPrefab?> package)
            {
                tile.Enabled = IsSynchronized && WithdrawalProblem(package.Item1, package.Item2) == "withdraw";
                foreach (var image in tile.Children.OfType<GUIImage>())
                { if (image.UserData is Color tint) { image.Color = tint * (tile.Enabled ? 1f : 0.4f); } }
            }
        }
    }

    private void RefreshUI()
    {
        var target = Target;
        var stock = Stock;
        int capacity = DraftCapacity;
        int planned = draft.Sum(r => r.Count);
        var visiblePresets = AmmoPresets.All(target)
            .Where(p => target == null || p.Rounds.All(r => IsCompatible(target, r.Id))).ToList();
        if (selectedPreset != null)
        {
            selectedPreset = visiblePresets.FirstOrDefault(p => p.Name == selectedPreset.Name && p.BuiltIn == selectedPreset.BuiltIn);
        }
        presetList!.Content.ClearChildren();
        presetList.Deselect();
        presetLoadButton!.Enabled = selectedPreset != null;
        presetScope!.Text = L(target == null ? "allpresets" : "compatiblepresets");
        presetDelete!.Enabled = selectedPreset is { BuiltIn: false };
        if (visiblePresets.Count == 0) { TextRow(presetList, L("nopresets").Value); }
        foreach (var preset in visiblePresets)
        {
            var row = new GUIFrame(new RectTransform(new Vector2(1, 0), presetList.Content.RectTransform,
                minSize: new Point(0, (int)(32 * GUI.Scale))), style: "ListBoxElement")
            {
                UserData = preset,
                ToolTip = $"{preset.Name}\n{string.Join("\n", preset.Rounds.Select(r => $"{AmmoName(r.Id)} × {r.Count}"))}\n{L(preset.BuiltIn ? "builtin" : "dragorder")}",
                CanBeFocused = true
            };
            new GUITextBlock(new RectTransform(new Vector2(0.96f, 1), row.RectTransform, Anchor.Center),
                $"{preset.Name} · {preset.Rounds.Sum(r => r.Count)} {L("rounds")}", font: GUIStyle.SmallFont)
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
            var ammoLabel = AmmoLabel(row, rounds[i], $"{i + 1:D2} · {AmmoName(rounds[i])}", 0.80f);
            if (!IsCompatible(target, rounds[i])) { ammoLabel.TextColor = Color.OrangeRed; }
            Button(row, "delete", 0.13f, 1, () => RemoveRound(index));
        }
        stockList!.Content.ClearChildren();
        var demand = AmmoStock.Count(rounds.TakeLast(capacity));
        var quote = QuoteSupply(demand);
        var supplied = withdrawMode && !UseSupplyStorage ? new Dictionary<string, int>() :
            SuppliedAmmo(withdrawMode ? QuoteSupply(new Dictionary<string, int>()) : quote);
        var visibleStock = stock.Counts.Keys.Concat(supplied.Keys).Distinct(StringComparer.OrdinalIgnoreCase)
            .Where(id => withdrawMode || target == null || IsCompatible(target, id)).OrderBy(AmmoName)
            .Select(id => new KeyValuePair<string, int>(id, stock[id])).ToArray();
        stockList.UseGridLayout = visibleStock.Length > 0;
        stockList.ToolTip = L(withdrawMode ? "withdrawmodehint" : "addhint");
        bool hasSupply = (!withdrawMode || UseSupplyStorage) && supplies.Length > 0;
        stockSummary!.Text = message.Length > 0 ? message : $"{L(hasSupply ? "availableammo" : withdrawMode || target == null ? "allstock" : "compatiblestock")} · {visibleStock.Length} {L("types")} · {(hasSupply ? L("stored") + " " : "")}{visibleStock.Sum(p => (long)p.Value):N0} {L("rounds")}";
        stockSummary.ToolTip = stockSummary.Text + (hasSupply ? "\n" + L(withdrawMode ? "withdrawmodehint" : "supplyhint") + "\n" +
            string.Join("\n", supplies.Select(p => $"{AmmoName(p.Prefab)} · {p.Amount:N2}/{p.Capacity:N2}")) : "");
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
            var package = withdrawMode ? FindWithdrawalPackage(p.Key) : null;
            var tile = new GUIButton(new RectTransform(new Point(stockCellSize), stockList.Content.RectTransform, isFixedSize: true),
                style: "GUIButtonSmallFreeScale")
            {
                UserData = (p.Key, package),
                OnClicked = (_, _) =>
                {
                    if (withdrawMode) { RequestWithdraw(p.Key); uiDirty = true; }
                    else { AddRun(p.Key, addCount); }
                    return true;
                },
                Enabled = withdrawMode ? IsSynchronized && WithdrawalProblem(p.Key, package) == "withdraw" : IsCompatible(target, p.Key) &&
                    (draft.Count < AmmoPlan.MaxGroups || string.Equals(draft.FirstOrDefault()?.Id, p.Key, StringComparison.OrdinalIgnoreCase)) &&
                    planned < capacity
            };
            BindStockTooltip(tile, prefab, AmmoName(p.Key), withdrawMode
                ? () => L(!IsSynchronized ? "syncing" : WithdrawalProblem(p.Key, package)) +
                    (package == null ? "" : $"\n{package.Name} · {Math.Min(WithdrawalAmount(p.Key), (int)package.Health)} {L("rounds")}")
                : fromSupply ? () => $"{L("stored")}: {p.Value:N0}\n{L("supplied")}: {available:N0}\n{L("supplyhint")}" : null);
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
        var actual = AmmoPlan.Compact(target?.LoadedAmmoIdentifiers.Select(id => id.Value) ?? []);
        if (actual.Count == 0) { TextRow(actualList, L(target == null ? "nomagazine" : "empty").Value); }
        SequenceRows(actualList, actual);
        targetLabel!.Text = target == null ? L("actual") : $"{L("actual")} · {target.LoadedCount}/{target.MaxSize}";
        targetLabel.ToolTip = target == null ? L("nomagazine") : target.Item.Name;
        planLabel!.Text = $"{L("preview")} · {planned} {L("rounds")}";
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
        if (!AmmoPlan.IsValid(preset.Rounds, AmmoPlan.MaxRounds))
        {
            message = L("invalidplan").Value;
            uiDirty = true;
            return;
        }
        void Apply()
        {
            draft.Clear();
            draft.AddRange(preset.Rounds);
            selectedPreset = preset;
            presetName!.Text = preset.Name;
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
        if (name.Length == 0 || !AmmoPlan.IsValid(draft, AmmoPlan.MaxRounds)) { message = L("invalidpreset").Value; uiDirty = true; return; }
        var saved = AmmoPresets.Saved;
        var old = saved.ToArray();
        int index = saved.FindIndex(p => p.Name == name);
        var preset = new AmmoPreset(name, draft.ToArray());
        if (index < 0) { saved.Add(preset); } else { saved[index] = preset; }
        if (TrySavePresets(old)) { selectedPreset = preset; draftDirty = false; message = L("saved").Value; }
    }

    private void DeletePreset()
    {
        if (selectedPreset == null || selectedPreset.BuiltIn) { return; }
        var old = AmmoPresets.Saved.ToArray();
        AmmoPresets.Saved.Remove(selectedPreset);
        if (TrySavePresets(old)) { selectedPreset = null; }
    }

    private bool TrySavePresets(AmmoPreset[] previous)
    {
        uiDirty = true;
        try { AmmoPresets.Save(); return true; }
        catch (Exception e) when (e is IOException or UnauthorizedAccessException)
        {
            AmmoPresets.Saved.Clear();
            AmmoPresets.Saved.AddRange(previous);
            message = L("savefailed").Value + ": " + e.Message;
            return false;
        }
    }
}
