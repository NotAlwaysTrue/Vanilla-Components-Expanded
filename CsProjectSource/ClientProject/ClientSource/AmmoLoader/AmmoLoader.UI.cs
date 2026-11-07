using Barotrauma.Items.Components;
using VCE_VirtualizedMagazine;

namespace VCE.AmmoLoading;

public sealed partial class AmmoLoader
{
    private readonly List<AmmoRun> draft = [];
    private GUIListBox? presetList, planList, previewList, stockList, actualList, checkList;
    private GUITextBox? presetName;
    private GUITextBlock? targetLabel, planLabel, draftLabel, stockSummary, presetScope;
    private GUIButton? loadButton, unloadButton, presetLoadButton, saveButton, clearButton, presetDelete;
    private GUIFrame? inputHolder, targetHolder;
    private bool uiDirty = true, draftDirty, confirmingReplace;
    private bool displayedSynchronized;
    private AmmoPreset? selectedPreset;
    private ushort displayedTarget;
    private uint displayedRevision = uint.MaxValue;
    private int displayedCount = -1;
    private string message = "";
    private int addCount = 5;

    private static LocalizedString L(string key) => TextManager.Get("vce.ammoloader." + key);
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
        int dockHeight = (int)(66 * GUI.Scale);
        var upper = PanelRow(upperHeight);
        var presets = Column(upper, presetWidth, listInset);
        presetScope = Label(presets, "", 0.055f);
        presetList = new GUIListBox(new RectTransform(new Vector2(1, 0.83f), presets.RectTransform), useMouseDownToSelect: true)
        {
            CurrentDragMode = GUIListBox.DragMode.DragWithinBox,
            OnSelected = (_, data) =>
            {
                if (data is not AmmoPreset preset) { return false; }
                if (selectedPreset != preset && confirmingReplace)
                {
                    message = "";
                    confirmingReplace = false;
                    uiDirty = true;
                }
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
        presetLoadButton = Button(presetActions, "loadpreset", 0.76f, 1, () =>
        {
            if (selectedPreset == null) { return; }
            if (!AmmoPlan.IsValid(selectedPreset.Rounds, AmmoPlan.MaxRounds))
            {
                message = L("invalidplan").Value;
                uiDirty = true;
                return;
            }
            if (draftDirty && !confirmingReplace) { confirmingReplace = true; message = L("confirmreplace").Value; uiDirty = true; return; }
            draft.Clear();
            draft.AddRange(selectedPreset.Rounds);
            presetName!.Text = selectedPreset.Name;
            draftDirty = confirmingReplace = false;
            message = "";
            uiDirty = true;
        });
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
        previewList.ToolTip = $"{L("topfirst")}\n{L("dragorder")}";
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
        presetName.OnTextChanged += (_, _) => { draftDirty = uiDirty = true; confirmingReplace = false; message = ""; return true; };
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
        var quantity = new GUINumberInput(new RectTransform(new Vector2(0.18f, 1), supplyOptions.RectTransform), NumberType.Int)
            { MinValueInt = 1, MaxValueInt = AmmoPlan.MaxRounds, IntValue = addCount };
        quantity.OnValueChanged += _ => { if (quantity.IntValue > 0) { addCount = quantity.IntValue; uiDirty = true; } };
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
        Label(checkHeader, L("needstock"), 1, 0.43f);

        var dock = PanelRow(dockHeight);
        var intake = Row(Column(dock, supplyWidth, listInset), 1);
        Label(intake, L("intake"), 1, 0.17f);
        inputHolder = new GUIFrame(new RectTransform(new Vector2(0.62f, 1), intake.RectTransform, Anchor.Center), style: null)
            { IgnoreLayoutGroups = true };
        inputHolder.ToolTip = L("intakehint");
        var target = Row(Column(dock, magazineWidth, listInset), 1);
        Label(target, L("targetslot"), 1, 0.27f);
        targetHolder = new GUIFrame(new RectTransform(new Vector2(0.43f, 1), target.RectTransform, Anchor.Center), style: null)
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
        if (container.Inventory.visualSlots.FirstOrDefault() is { } slot)
        {
            // Native inventory padding reserves extra space above the visible slots.
            holder.RectTransform.AbsoluteOffset += new Point(0, holder.RectTransform.Parent.Rect.Center.Y - slot.Rect.Center.Y);
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

    private static GUITextBlock AmmoLabel(GUILayoutGroup parent, string id, string text, float width = 1)
    {
        var cell = new GUIFrame(new RectTransform(new Vector2(width, 1), parent.RectTransform), style: null)
            { CanBeFocused = false };
        var prefab = ItemPrefab.FindByIdentifier(id.ToIdentifier()) as ItemPrefab;
        int size = Math.Min(cell.Rect.Height, (int)(24 * GUI.Scale));
        int inset = size + (int)(4 * GUI.Scale);
        new GUIImage(new RectTransform(new Point(size), cell.RectTransform, Anchor.CenterLeft),
            prefab?.InventoryIcon ?? prefab?.Sprite, scaleToFit: true)
        {
            CanBeFocused = false,
            OverrideState = GUIComponent.ComponentState.None,
            Color = prefab?.InventoryIcon != null ? prefab.InventoryIconColor : prefab?.SpriteColor ?? Color.White
        };
        return new GUITextBlock(new RectTransform(new Point(Math.Max(0, cell.Rect.Width - inset), cell.Rect.Height),
            cell.RectTransform, Anchor.CenterLeft) { AbsoluteOffset = new Point(inset, 0) }, text, font: GUIStyle.SmallFont)
            { AutoScaleHorizontal = true, CanBeFocused = false, ToolTip = text };
    }

    private static void BindStockTooltip(GUIComponent tile, ItemPrefab? prefab, string fallback)
    {
        bool? tooltipShift = null;
        tile.OnDrawToolTip = component =>
        {
            bool shift = PlayerInput.IsShiftDown();
            if (tooltipShift == shift) { return; }
            component.ToolTip = RichString.Rich(prefab?.GetTooltip(Character.Controlled) ?? fallback);
            tooltipShift = shift;
        };
    }

    private static GUILayoutGroup Row(GUILayoutGroup parent, float height) =>
        new(new RectTransform(new Vector2(1, height), parent.RectTransform), isHorizontal: true, childAnchor: Anchor.CenterLeft) { RelativeSpacing = 0.02f };

    private static GUIListBox List(GUILayoutGroup parent, float height) =>
        new(new RectTransform(new Vector2(1, height), parent.RectTransform)) { AutoHideScrollBar = false, KeepSpaceForScrollBar = true };

    private static GUIButton Button(GUILayoutGroup parent, string text, float width, float height, Action action) =>
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
        confirmingReplace = false;
        message = "";
    }

    public override void AddToGUIUpdateList(int order = 0)
    {
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
        if (uiDirty && presetList != null && GUI.KeyboardDispatcher.Subscriber is not GUITextBox &&
            presetList.DraggedElement == null && planList?.DraggedElement == null && previewList?.DraggedElement == null)
        {
            RefreshUI();
            uiDirty = false;
        }
    }

    private void RefreshUI()
    {
        var target = Target;
        var stock = Stock;
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
            var row = new GUILayoutGroup(new RectTransform(new Vector2(0.98f, 0.9f), card.RectTransform, Anchor.Center), isHorizontal: true)
                { RelativeSpacing = 0.01f, CanBeFocused = false };
            var ammoLabel = AmmoLabel(row, run.Id, $"≡ {AmmoName(run.Id)}", 0.62f);
            if (!IsCompatible(target, run.Id)) { ammoLabel.TextColor = Color.OrangeRed; }
            var number = new GUINumberInput(new RectTransform(new Vector2(0.26f, 1), row.RectTransform),
                NumberType.Int)
            {
                MinValueInt = 1, MaxValueInt = AmmoPlan.MaxRounds - draft.Sum(r => r.Count) + run.Count, IntValue = run.Count
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
            var ammoLabel = AmmoLabel(row, rounds[i], $"≡ {i + 1:D2} · {AmmoName(rounds[i])}", 0.86f);
            if (!IsCompatible(target, rounds[i])) { ammoLabel.TextColor = Color.OrangeRed; }
            Button(row, "delete", 0.13f, 1, () => RemoveRound(index));
        }
        stockList!.Content.ClearChildren();
        var demand = AmmoStock.Count(AmmoPlan.Expand(draft));
        var visibleStock = stock.Counts.Where(p => target == null || IsCompatible(target, p.Key)).OrderBy(p => AmmoName(p.Key)).ToArray();
        stockList.UseGridLayout = visibleStock.Length > 0;
        stockSummary!.Text = message.Length > 0 ? message : $"{L(target == null ? "allstock" : "compatiblestock")} · {visibleStock.Length} {L("types")} · {visibleStock.Sum(p => (long)p.Value):N0} {L("rounds")}";
        stockSummary.ToolTip = stockSummary.Text;
        if (visibleStock.Length == 0) { TextRow(stockList, L("emptystock").Value); }
        int stockCellSize = (int)(72 * GUI.Scale);
        foreach (var p in visibleStock)
        {
            var prefab = ItemPrefab.FindByIdentifier(p.Key.ToIdentifier()) as ItemPrefab;
            var tile = new GUIButton(new RectTransform(new Point(stockCellSize, stockCellSize), stockList.Content.RectTransform),
                style: "GUIButtonSmallFreeScale")
            {
                OnClicked = (_, _) => { AddRun(p.Key, addCount); return true; },
                Enabled = IsCompatible(target, p.Key) &&
                    (draft.Count < AmmoPlan.MaxGroups || string.Equals(draft.LastOrDefault()?.Id, p.Key, StringComparison.OrdinalIgnoreCase)) &&
                    draft.Sum(r => r.Count) <= AmmoPlan.MaxRounds - addCount
            };
            BindStockTooltip(tile, prefab, AmmoName(p.Key));
            if (prefab != null && (prefab.InventoryIcon ?? prefab.Sprite) is { } icon)
            {
                new GUIImage(new RectTransform(new Vector2(0.8f), tile.RectTransform, Anchor.Center), icon, scaleToFit: true)
                {
                    CanBeFocused = false,
                    Color = (icon == prefab.InventoryIcon ? prefab.InventoryIconColor : prefab.SpriteColor) * (tile.Enabled ? 1f : 0.4f)
                };
            }
            else
            {
                new GUITextBlock(new RectTransform(new Vector2(0.9f, 0.7f), tile.RectTransform, Anchor.TopCenter),
                    AmmoName(p.Key), font: GUIStyle.SmallFont, textAlignment: Alignment.Center, wrap: true)
                    { CanBeFocused = false, AutoScaleHorizontal = true };
            }
            new GUITextBlock(new RectTransform(new Vector2(0.94f, 0.3f), tile.RectTransform, Anchor.BottomRight),
                $"{p.Value:N0}", font: GUIStyle.SmallFont, textAlignment: Alignment.BottomRight)
            {
                CanBeFocused = false, AutoScaleHorizontal = true, Shadow = true,
                Padding = new Vector4(0, 0, 4 * GUI.Scale, 2 * GUI.Scale)
            };
        }
        checkList!.Content.ClearChildren();
        foreach (var id in stock.Counts.Keys.Concat(demand.Keys).Distinct(StringComparer.OrdinalIgnoreCase).OrderBy(AmmoName))
        {
            if (target != null && !IsCompatible(target, id) && !demand.ContainsKey(id)) { continue; }
            int needed = demand.GetValueOrDefault(id);
            var row = ListRow(checkList);
            AmmoLabel(row, id, AmmoName(id), 0.55f).ToolTip = id;
            var amounts = Label(row, $"{needed} / {stock[id]}", 1, 0.43f);
            if (needed > stock[id] || !IsCompatible(target, id)) { amounts.TextColor = Color.OrangeRed; }
        }
        actualList!.Content.ClearChildren();
        var actual = AmmoPlan.Compact(target?.LoadedAmmoIdentifiers.Select(id => id.Value) ?? []);
        if (actual.Count == 0) { TextRow(actualList, L(target == null ? "nomagazine" : "empty").Value); }
        SequenceRows(actualList, actual);
        int planned = draft.Sum(r => r.Count);
        targetLabel!.Text = target == null ? L("actual") : $"{L("actual")} · {target.LoadedCount}/{target.MaxSize}";
        targetLabel.ToolTip = target == null ? L("nomagazine") : target.Item.Name;
        planLabel!.Text = $"{L("preview")} · {planned}{(target == null ? "" : "/" + target.MaxSize)} {L("rounds")}";
        planLabel.ToolTip = L("topfirst");
        planLabel.TextColor = target != null && planned > target.MaxSize ? Color.OrangeRed : Color.White;
        draftLabel!.Text = $"{L("plan")}{(draftDirty ? " *" : "")}";
        draftLabel.ToolTip = $"{L("dragorder")}\n{L(draftDirty ? "unsaved" : "savedstate")}";
        clearButton!.Enabled = draft.Count > 0;
        string problem = !Ready ? "unavailable" : !IsSynchronized ? "syncing" : target == null ? "nomagazine" :
            target.LoadedCount > 0 ? "unloadfirst" : draft.Count == 0 ? "emptyplan" : planned > target.MaxSize ? "overcapacity" :
            !AmmoPlan.IsValid(draft, target.MaxSize) ? "invalidplan" :
            draft.Any(r => !IsCompatible(target, r.Id)) ? "incompatible" : !stock.CanTake(demand) ? "notenough" : "ready";
        loadButton!.Enabled = problem == "ready";
        loadButton.ToolTip = L(problem);
        unloadButton!.Enabled = Ready && IsSynchronized && target?.LoadedCount > 0;
    }

    private void AddRun(string id, int count)
    {
        if (count < 1 || count > AmmoPlan.MaxRounds || string.IsNullOrWhiteSpace(id)) { return; }
        var plan = draft.Append(new AmmoRun(id, count)).ToArray();
        if (plan.Sum(r => (long)r.Count) > AmmoPlan.MaxRounds) { return; }
        var merged = AmmoPlan.Compact(AmmoPlan.Expand(plan));
        if (!AmmoPlan.IsValid(merged, AmmoPlan.MaxRounds)) { return; }
        draft.Clear();
        draft.AddRange(merged);
        DraftChanged();
    }

    private void ChangeRunCount(int index, int count)
    {
        // Clearing a number input temporarily reports zero even with MinValueInt = 1.
        if (count < 1 || index < 0 || index >= draft.Count) { return; }
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
