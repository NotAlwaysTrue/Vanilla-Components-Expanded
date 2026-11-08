using Barotrauma.Items.Components;
using Microsoft.Xna.Framework.Graphics;

namespace VCE_VirtualizedMagazine;

public sealed partial class AmmoLoader
{
    private readonly List<AmmoRun> draft = [];
    // Same split as MagazinePrefab: the start section sits on top of the stack, the end section at the bottom, and the
    // middle of the list is the main section. Start/End start folded, and take one row once opened while still empty.
    private readonly List<AmmoRun> startSection = [], endSection = [];
    private bool showStartSection, showEndSection;
    // MagazinePrefab.AutoRepeat: repeat the main section into whatever space the cartridge still has.
    private bool autoRepeat;
    private const int SectionStart = 0, SectionMain = 1, SectionEnd = 2;
    /// <summary>Identifies one row of a section: a group of identical rounds, see <see cref="AmmoRun" />.</summary>
    private readonly record struct SequenceRow(int Section, int Index);
    private GUIListBox? presetList, sequenceList, stockList, actualList, checkList;
    // Start/End sections live in their own lists pinned to the top and bottom edges of the sequence frame.
    private GUIFrame? sequenceArea, startSectionFrame, endSectionFrame;
    private GUIListBox? startSectionList, endSectionList;
    private GUIButton? startSectionHeader, endSectionHeader;
    private GUITextBox? presetName;
    private GUITextBlock? targetLabel, draftLabel, stockSummary, presetScope, checkAmountHeader;
    private GUIButton? loadButton, unloadButton, presetLoadButton, saveButton, clearButton, presetDelete;
    // Rack selector: vanilla up/down arrows level with the gap between the second and third slot.
    private GUIButton? slotUpButton, slotDownButton;
    private GUITextBlock? magazineCaption;
    // The repeat switch sits in the Output column, next to the contents it changes.
    private GUITickBox? autoRepeatBox;
    // Green frame drawn over the selected rack slot (child of the container's own GUI frame).
    private GUIFrame? targetGlow;
    private GUIFrame? inputHolder, targetHolder, outputHolder;
    // Windows of their own, parented to the main one so they follow and hide with it.
    private GUIFrame? ioFrame, presetFrame;
    private bool uiDirty = true, draftDirty;
    private bool displayedSynchronized;
    // Stock icons use a press/hold/release gesture: a click withdraws a package, a drag feeds the sequence or a preset.
    private enum StockGesture { None, Pending, Dragging }
    private StockGesture gesture;
    private string gestureId = "";
    private Point gestureStart;
    private GUIImage? gestureGhost;
    private static int DragThreshold => (int)(6 * GUI.Scale);
    private MagazinePrefab? selectedPreset;
    private ushort displayedTarget;
    private uint displayedRevision = uint.MaxValue;
    private int displayedCount = -1;
    private string message = "";
    // Item I/O window layout: fixed sizes, never derived from measured text or leftover space.
    // IOSlotSize is the edge of the slot as drawn; the holder around it adds the vanilla padding below.
    private const int IOSlotSize = 66;
    private const int IOCaptionWidth = 160;
    private const int IOCaptionHeight = 24;
    private const int IOCaptionGap = 2;
    private const float IOCaptionScale = 1.15f;
    // Vanilla Inventory.CreateSlots draws a slot at 60 * Inventory.UIScale, keeps 5 * UIScale of horizontal
    // padding on both sides and reserves 5 * UIScale + ContainedIndicatorHeight (15 * UIScale) above each row.
    // A holder of exactly that size leaves the slots unscaled; a smaller one shrinks them to fit.
    private const int VanillaSlotSize = 60;
    private const int VanillaSlotPadding = 5;
    private const int VanillaIndicatorHeight = 15;

    /// <summary>Distance between a caption and the first slot of the column it names.</summary>
    private static int CaptionGap => (int)(IOCaptionGap * GUI.Scale);

    private int DraftCapacity => Target is { } target
        ? Math.Clamp(target.MaxSize - target.LoadedCount, 0, AmmoPlan.MaxRounds) : AmmoPlan.MaxRounds;

    private List<AmmoRun> SectionRuns(int section) =>
        section == SectionStart ? startSection : section == SectionEnd ? endSection : draft;

    private int PlannedRounds => startSection.Sum(r => r.Count) + draft.Sum(r => r.Count) + endSection.Sum(r => r.Count);

    /// <summary>Every round in firing order (top of the sequence first): start, main, end.</summary>
    private string[] AllRounds()
    {
        var start = AmmoPlan.Expand(startSection).ToList();
        var main = AmmoPlan.Expand(draft).ToList();
        var end = AmmoPlan.Expand(endSection).ToList();
        if (!autoRepeat || main.Count == 0 || Target == null) { return [.. start, .. main, .. end]; }
        // MagazinePrefab.CreateAmmoArray semantics: the main section repeats into the space the other two leave free.
        // An authored main section that is already longer than that space is kept as is (the server trims the head).
        int free = Math.Max(0, DraftCapacity - start.Count - end.Count);
        IEnumerable<string> middle = free > main.Count
            ? Enumerable.Range(0, free).Select(i => main[i % main.Count])
            : main;
        return [.. start, .. middle, .. end];
    }

    /// <summary>The plan sent to the server and stored in presets: rounds in firing order, adjacent duplicates merged.</summary>
    private AmmoRun[] FullPlan() => AmmoPlan.Compact(AllRounds()).ToArray();

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
        gestureGhost = null;
        gesture = StockGesture.None;
        slotUpButton = slotDownButton = null;
        magazineCaption = null;
        autoRepeatBox = null;
        sequenceArea = startSectionFrame = endSectionFrame = null;
        startSectionList = endSectionList = null;
        startSectionHeader = endSectionHeader = null;
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
        // The sequence and the firing order are the same thing, so they share one top-to-bottom list.
        var arrangement = new GUILayoutGroup(new RectTransform(new Vector2(1, 0.89f), editor.RectTransform)) { RelativeSpacing = 0.015f };
        var arrangementHeader = Row(arrangement, 0.06f);
        arrangementHeader.RelativeSpacing = 0;
        draftLabel = Label(arrangementHeader, "", 1);
        draftLabel.ToolTip = L("dragorder");
        // Sequence frame: the scrolling main list in the middle, Start pinned to the top edge and End to the bottom
        // edge so neither can scroll out of sight. LayoutSequenceArea() splits the height between the three.
        sequenceArea = new GUIFrame(new RectTransform(new Vector2(1, 0.92f), arrangement.RectTransform), style: null);
        int sequenceWidth = Math.Max(1, sequenceArea.Rect.Width);
        // Start block: header on the top edge with its rows above it, so expanding folds upwards.
        int sectionHeaderHeight = SequenceHeaderHeight;
        startSectionFrame = new GUIFrame(new RectTransform(new Point(sequenceWidth, sectionHeaderHeight),
            sequenceArea.RectTransform, Anchor.TopLeft), style: null);
        startSectionHeader = new GUIButton(new RectTransform(new Point(sequenceWidth, sectionHeaderHeight),
            startSectionFrame.RectTransform, Anchor.TopLeft),
            SectionHeaderText("startsection", startSection.Sum(r => r.Count), showStartSection), Alignment.CenterLeft,
            "GUIButtonSmallFreeScale")
            {
                ToolTip = L("startsection"),
                OnClicked = (_, _) => { ToggleSection(SectionStart); return true; }
            };
        startSectionList = new GUIListBox(new RectTransform(new Point(sequenceWidth, 1), startSectionFrame.RectTransform,
            Anchor.TopLeft)) { AutoHideScrollBar = true, KeepSpaceForScrollBar = true };
        startSectionList.ToolTip = L("topfirst");
        startSectionList.CurrentSelectMode = GUIListBox.SelectMode.None;
        startSectionList.CanTakeKeyBoardFocus = false;
        startSectionList.Visible = showStartSection;
        sequenceList = new GUIListBox(new RectTransform(new Point(sequenceWidth, Math.Max(1, sequenceArea.Rect.Height)),
            sequenceArea.RectTransform, Anchor.TopLeft)) { AutoHideScrollBar = false, KeepSpaceForScrollBar = true };
        sequenceList.ToolTip = L("topfirst");
        sequenceList.CurrentDragMode = GUIListBox.DragMode.DragWithinBox;
        sequenceList.CurrentSelectMode = GUIListBox.SelectMode.None;
        sequenceList.CanTakeKeyBoardFocus = false;
        sequenceList.OnRearranged = (list, _) =>
        {
            if (!list.HasDraggedElementIndexChanged) { return; }
            // Only main-section rows are reordered; start/end rows keep their own order.
            ReorderRuns(list.Content.Children
                .Where(c => c.UserData is SequenceRow row && row.Section == SectionMain)
                .Select(c => ((SequenceRow)c.UserData!).Index).ToArray());
        };
        // End block: fold header plus its rows, anchored to the bottom of the frame. Expanding grows the block
        // upwards (the main list above loses that height) and the rows still render below their header.
        endSectionFrame = new GUIFrame(new RectTransform(new Point(sequenceWidth, sectionHeaderHeight),
            sequenceArea.RectTransform, Anchor.TopLeft)
            { AbsoluteOffset = new Point(0, Math.Max(0, sequenceArea.Rect.Height - sectionHeaderHeight)) }, style: null);
        endSectionHeader = new GUIButton(new RectTransform(new Point(sequenceWidth, sectionHeaderHeight), endSectionFrame.RectTransform),
            SectionHeaderText("endsection", endSection.Sum(r => r.Count), showEndSection), Alignment.CenterLeft,
            "GUIButtonSmallFreeScale")
            {
                ToolTip = L("endsection"),
                OnClicked = (_, _) => { ToggleSection(SectionEnd); return true; }
            };
        endSectionList = new GUIListBox(new RectTransform(new Point(sequenceWidth, 1), endSectionFrame.RectTransform,
            Anchor.TopLeft) { AbsoluteOffset = new Point(0, sectionHeaderHeight) })
            { AutoHideScrollBar = true, KeepSpaceForScrollBar = true };
        endSectionList.ToolTip = L("topfirst");
        endSectionList.CurrentSelectMode = GUIListBox.SelectMode.None;
        endSectionList.CanTakeKeyBoardFocus = false;
        endSectionList.Visible = showEndSection;
        int arrangementWidth = (int)(editor.Rect.Width * 0.58f);
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
        var saveActions = new GUILayoutGroup(new RectTransform(new Point(editor.Rect.Width - arrangementWidth - listInset, editorActions.Rect.Height),
            editorActions.RectTransform), isHorizontal: true, childAnchor: Anchor.CenterLeft);
        var saveButtonSize = new Point((saveActions.Rect.Width - listInset) / 2, saveActions.Rect.Height);
        saveActions.AbsoluteSpacing = saveActions.Rect.Width - saveButtonSize.X * 2;
        saveButton = Button(saveActions, "savepreset", 0.5f, 1, SavePreset);
        clearButton = Button(saveActions, "clear", 0.5f, 1, () =>
        {
            draft.Clear();
            startSection.Clear();
            endSection.Clear();
            DraftChanged();
        });
        saveButton.RectTransform.Resize(saveButtonSize);
        clearButton.RectTransform.Resize(saveButtonSize);

        // Magazine contents and ammo pickup share one column, named Output.
        var magazine = Column(upper, magazineWidth, listInset);
        targetLabel = Label(magazine, L("currentmagazine"), 0.055f);
        actualList = List(magazine, 0.65f);
        actualList.ToolTip = L("topfirst");
        var magazineActions = Row(magazine, 0.08f);
        unloadButton = Button(magazineActions, "unload", 0.49f, 1,
            () => { message = ""; RequestUnload(); uiDirty = true; });
        loadButton = Button(magazineActions, "load", 0.49f, 1,
            () => { message = ""; RequestLoad(FullPlan()); uiDirty = true; });
        // The repeat switch belongs to the magazine contents it affects, so it sits under the load buttons.
        var repeatRow = Row(magazine, 0.07f);
        repeatRow.RelativeSpacing = 0;
        autoRepeatBox = new GUITickBox(new RectTransform(new Vector2(1, 1), repeatRow.RectTransform, Anchor.CenterLeft),
            L("autorepeat"), font: GUIStyle.SmallFont)
            {
                Selected = autoRepeat,
                ToolTip = L("autorepeathint"),
                OnSelected = box => { autoRepeat = box.Selected; uiDirty = true; return true; }
            };

        var lower = PanelRow(root.Rect.Height - upperHeight - gap);
        var supply = Column(lower, supplyWidth, listInset);
        var supplyOptions = Row(supply, 0.14f);
        stockSummary = Label(supplyOptions, "", 1);
        stockList = List(supply, 0.84f);
        stockList.ToolTip = L("addhint");
        stockList.Spacing = (int)(4 * GUI.Scale);
        stockList.CurrentSelectMode = GUIListBox.SelectMode.None;
        // Dragging a stock icon must feed the gesture handler, not reorder the grid.
        stockList.CurrentDragMode = GUIListBox.DragMode.NoDragging;
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
        BindInventory(InputContainer, inputHolder, CaptionGap);
        BindInventory(OutputContainer, outputHolder, CaptionGap);
        BindInventory(TargetContainer, targetHolder, CaptionGap);
        uiDirty = true;
    }

    /// <summary>Second window holding the machine's item containers, parked beside the main window.</summary>
    private void CreateItemIOFrame(int gap, int sideInset, int topInset)
    {
        // Fixed layout: the size never depends on measured text or on how much room the window happens to have.
        int captionHeight = (int)(IOCaptionHeight * GUI.Scale);
        // Without this the last slot would end flush with the panel outline.
        int bottomPad = gap;
        int slot = SlotSize(GameMain.GraphicsHeight - topInset - sideInset - bottomPad);
        // The window is exactly as tall as its content, so no empty background is left above or below it.
        int content = captionHeight * 3 + SlotColumnHeight(slot);
        int height = topInset + sideInset + content + bottomPad;
        int width = Math.Max(SlotHolderWidth(slot), (int)(IOCaptionWidth * GUI.Scale)) + sideInset * 2 + (int)(8 * GUI.Scale);
        bool fitsRight = GuiFrame!.Rect.Right + gap + width <= GameMain.GraphicsWidth;
        ioFrame = new GUIFrame(new RectTransform(new Point(width, height), GuiFrame.RectTransform, Anchor.TopLeft)
            { AbsoluteOffset = new Point(fitsRight ? GuiFrame.Rect.Width + gap : -width - gap, 0) }, style: "ItemUI");
        var panel = new GUILayoutGroup(new RectTransform(new Point(width - sideInset * 2, content + bottomPad),
            ioFrame.RectTransform) { AbsoluteOffset = new Point(sideInset, topInset) }) { AbsoluteSpacing = gap };
        // Full panel height: the column background must not add empty space above the first caption.
        var ioPanel = Column(panel, panel.Rect.Width, 0, 1f);
        // Each section carries its own caption gap; the group must not add another one between them.
        ioPanel.RelativeSpacing = 0;
        // Captions sit centred directly above the slot column they describe.
        Caption(ioPanel, L("intake")).ToolTip = L("intakehint");
        inputHolder = SlotHolder(ioPanel, slot, 1);
        inputHolder.ToolTip = L("intakehint");
        magazineCaption = Caption(ioPanel, L("targetslot"));
        targetHolder = SlotHolder(ioPanel, slot, 4);
        targetHolder.ToolTip = L("targetslot");
        CreateMagazineSlotButtons(targetHolder, slot);
        Caption(ioPanel, L("output"));
        outputHolder = SlotHolder(ioPanel, slot, 1);
        outputHolder.ToolTip = L("outputhint");
        // Title bar last: the holders spill their transparent padding into it, and the mouse-on lookup walks the
        // component list backwards, so the drag area has to be the one on top.
        new GUIDragHandle(new RectTransform(new Point(width, (int)GUIStyle.ItemFrameTopBarHeight), ioFrame.RectTransform, Anchor.TopLeft),
            ioFrame.RectTransform, null)
            { DragArea = new Rectangle(0, 0, GameMain.GraphicsWidth, GameMain.GraphicsHeight) };
    }

    /// <summary>Vanilla chevrons stacked beside the rack, split around the gap between its second and third slot.</summary>
    private void CreateMagazineSlotButtons(GUIFrame holder, int slot)
    {
        int size = Math.Max(20, (int)(26 * GUI.Scale));
        int spacing = Math.Max(2, (int)(6 * GUI.Scale));
        var row = holder.RectTransform.Parent;
        // Slot 0 starts CaptionGap below the row top and every slot is followed by its indicator gap.
        int centerY = CaptionGap + 2 * slot + SlotRowGap(slot) * 3 / 2;
        int blockHeight = size * 2 + spacing;
        // Beside the slot column (never on the panel outline) and lifted so the pair reads as one column above the gap.
        var block = new GUILayoutGroup(new RectTransform(new Point(size, blockHeight), row, Anchor.TopLeft)
        {
            AbsoluteOffset = new Point(row.Rect.Width / 2 + slot / 2 + (int)(10 * GUI.Scale),
                centerY - blockHeight / 2 - size / 2)
        }, isHorizontal: false, childAnchor: Anchor.Center)
            { AbsoluteSpacing = spacing, IgnoreLayoutGroups = true };
        slotUpButton = NumberArrowButton(block, size, "PlusButton", L("slotprev"), () => RequestSelectSlot(TargetSlot - 1));
        slotDownButton = NumberArrowButton(block, size, "MinusButton", L("slotnext"), () => RequestSelectSlot(TargetSlot + 1));
    }

    /// <summary>
    /// One of the arrows <see cref="GUINumberInput" /> draws. `PlusButton`/`MinusButton` are child styles of the
    /// `GUINumberInput` style, not top-level ones, so they cannot be passed to the GUIButton constructor (that looks
    /// them up globally and logs "Couldn't find a GUI style"); they have to be applied through `ApplyStyle`.
    /// `GUIButton.ApplyStyle` forwards the style to the button's inner frame, which then draws the chevron and follows
    /// the enabled/hover/pressed colours on its own.
    /// </summary>
    private static GUIButton NumberArrowButton(GUILayoutGroup parent, int size, string style, LocalizedString tooltip,
        Action action)
    {
        var button = new GUIButton(new RectTransform(new Point(size), parent.RectTransform), Alignment.Center, null, null)
            { ToolTip = tooltip, OnClicked = (_, _) => { action(); return true; } };
        if (GUIStyle.GetComponentStyle("GUINumberInput") is { } numberInput &&
            numberInput.ChildStyles.TryGetValue(style.ToIdentifier(), out var arrowStyle))
        {
            button.ApplyStyle(arrowStyle);
        }
        return button;
    }

    /// <summary>
    /// Green frame around the slot the machine loads into. The container draws its slots from its own GuiFrame, so a
    /// child of that frame is painted after them; a frame inside our own window would end up underneath the slots.
    /// </summary>
    private void UpdateTargetGlow()
    {
        var frame = TargetContainer?.GuiFrame;
        var slots = TargetContainer?.Inventory?.visualSlots;
        if (frame == null || slots == null || slots.Length == 0)
        {
            if (targetGlow != null) { targetGlow.Visible = false; }
            return;
        }
        if (targetGlow == null || targetGlow.Parent != frame)
        {
            if (targetGlow != null) { targetGlow.Parent?.RemoveChild(targetGlow); }
            targetGlow = new GUIFrame(new RectTransform(Vector2.One, frame.RectTransform, Anchor.TopLeft), style: null)
            {
                CanBeFocused = false,
                Color = new Color(0.15f, 1f, 0.15f, 0.12f),
                OutlineColor = GUIStyle.Green,
                OutlineThickness = 2f
            };
        }
        int index = TargetSlot;
        bool show = GuiFrame is { Visible: true } && index < slots.Length;
        targetGlow.Visible = show;
        if (!show) { return; }
        var rect = slots[index].Rect;
        targetGlow.RectTransform.Resize(new Point(Math.Max(1, rect.Width), Math.Max(1, rect.Height)));
        targetGlow.RectTransform.AbsoluteOffset = new Point(rect.X - frame.Rect.X, rect.Y - frame.Rect.Y);
    }

    /// <summary>Largest slot edge that keeps the captions and the six slots inside <paramref name="available" />.</summary>
    private static int SlotSize(int available)
    {
        int captionHeight = (int)(IOCaptionHeight * GUI.Scale);
        int min = (int)(24 * GUI.Scale);
        int slot = Math.Max(min, (int)(IOSlotSize * GUI.Scale));
        // Only a screen shorter than the default layout needs smaller slots.
        while (slot > min && captionHeight * 3 + SlotColumnHeight(slot) > available) { slot--; }
        return slot;
    }

    /// <summary>Height taken by one caption and the slot column below it, indicator room included.</summary>
    private static int SlotColumnHeight(int slot) =>
        SlotBoxHeight(slot, 1) + SlotBoxHeight(slot, 4) + SlotBoxHeight(slot, 1);

    /// <summary>Layout height of a column: the slots, the indicator under the last one, and the caption gap.</summary>
    private static int SlotBoxHeight(int slot, int rows) => SlotRowsHeight(slot, rows) + SlotRowGap(slot) + CaptionGap;

    /// <summary>Native gap between two stacked slots: 5*UIScale spacing plus the state indicator drawn under a slot.</summary>
    private static int SlotRowGap(int slot) =>
        CeilDiv(slot * (VanillaSlotPadding + VanillaIndicatorHeight), VanillaSlotSize);

    /// <summary>Holder width that leaves a slot of <paramref name="slot" /> pixels unscaled.</summary>
    private static int SlotHolderWidth(int slot) =>
        CeilDiv(slot * (VanillaSlotSize + VanillaSlotPadding * 2), VanillaSlotSize);

    /// <summary>Height of <paramref name="rows" /> stacked slots, including the native gap between them.</summary>
    private static int SlotRowsHeight(int slot, int rows) => rows * slot + (rows - 1) * SlotRowGap(slot);

    /// <summary>Holder height for <paramref name="rows" /> slots, including the native padding around them.</summary>
    private static int SlotHolderHeight(int slot, int rows) =>
        SlotRowsHeight(slot, rows) + CeilDiv(slot * (VanillaSlotPadding * 2 + VanillaIndicatorHeight), VanillaSlotSize);

    private static int CeilDiv(int value, int divisor) => (value + divisor - 1) / divisor;

    /// <summary>Caption centred above a slot column, at the fixed caption size.</summary>
    private GUITextBlock Caption(GUILayoutGroup parent, LocalizedString text)
    {
        var row = FixedRow(parent, (int)(IOCaptionHeight * GUI.Scale));
        // Regular font, not the small one: the small font was scaled further down to fit its column.
        return new GUITextBlock(new RectTransform(new Vector2(1, 1), row.RectTransform), text, font: GUIStyle.Font)
        {
            CanBeFocused = false, AutoScaleHorizontal = true, Padding = Vector4.Zero,
            TextAlignment = Alignment.Center, TextScale = IOCaptionScale
        };
    }

    /// <summary>Rows of <paramref name="slots" /> equal slots, stacked below their caption.</summary>
    private GUIFrame SlotHolder(GUILayoutGroup parent, int slot, int slots)
    {
        // Only the visible slot box takes part in the layout; the holder's native padding spills out of it.
        var row = FixedRow(parent, SlotBoxHeight(slot, slots));
        return new GUIFrame(new RectTransform(new Point(SlotHolderWidth(slot), SlotHolderHeight(slot, slots)),
            row.RectTransform, Anchor.TopCenter), style: null)
            { IgnoreLayoutGroups = true };
    }

    /// <summary>Preset library in a window of its own, parked on the left of the main window.</summary>
    private void CreatePresetFrame(int gap, int sideInset, int topInset)
    {
        int width = (int)(GuiFrame!.Rect.Width * 0.24f);
        int height = GuiFrame.Rect.Height;
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

    private static void BindInventory(ItemContainer? container, GUIFrame holder, int gapAbove)
    {
        if (container?.Inventory == null) { return; }
        container.AllowUIOverlap = true;
        container.Inventory.DrawWhenEquipped = true;
        container.Inventory.RectTransform = holder.RectTransform;
        container.Inventory.CreateSlots();
        var slots = container.Inventory.visualSlots;
        if (slots.Length == 0) { return; }
        // The native grid is padded at the top (the contained-item indicator lives there), so the visible
        // slots do not start at the holder's edge. Slide the holder up until the first slot sits gapAbove
        // pixels under its caption: the padding then hides inside the caption row instead of below it.
        holder.RectTransform.AbsoluteOffset += new Point(0,
            holder.RectTransform.Parent.Rect.Top + gapAbove - slots.Min(s => s.Rect.Top));
        container.Inventory.CreateSlots();
    }

    private static GUILayoutGroup Column(GUILayoutGroup parent, int width, int horizontalInset, float heightFactor = 0.95f)
    {
        var panel = new GUIFrame(new RectTransform(new Point(width, parent.Rect.Height), parent.RectTransform), style: null, color: new Color(24, 33, 33))
            { OutlineColor = new Color(65, 78, 73), OutlineThickness = 1 };
        var group = new GUILayoutGroup(new RectTransform(new Point(width - horizontalInset * 2, (int)(panel.Rect.Height * heightFactor)),
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

    /// <summary>Row with a fixed pixel height, for layouts that must not scale with the window.</summary>
    private static GUILayoutGroup FixedRow(GUILayoutGroup parent, int height) =>
        new(new RectTransform(new Point(Math.Max(1, parent.Rect.Width), Math.Max(1, height)), parent.RectTransform),
            isHorizontal: true, childAnchor: Anchor.CenterLeft);

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
        // Sections are compacted separately: merging across a boundary would move rounds between Start/Main/End.
        foreach (var section in new[] { startSection, draft, endSection })
        {
            if (section.Count == 0) { continue; }
            var merged = AmmoPlan.Merge(section);
            section.Clear();
            section.AddRange(merged);
        }
        draftDirty = uiDirty = true;
        message = "";
    }

    public override void AddToGUIUpdateList(int order = 0)
    {
        // Rebuild before collection: HUD updates run later, leaving detached rows in this frame's update/draw list.
        if (uiDirty && presetList != null && GUI.KeyboardDispatcher.Subscriber is not GUITextBox &&
            presetList.DraggedElement == null && sequenceList?.DraggedElement == null)
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
        UpdateTargetGlow();
        if (presetList == null) { CreateGUI(); }
        if (saveButton != null)
        {
            saveButton.Enabled = !string.IsNullOrWhiteSpace(presetName?.Text) && AmmoPlan.IsValid(FullPlan(), AmmoPlan.MaxRounds);
        }
        UpdateClientState(deltaTime);
        UpdateWithdrawalButtons();
        UpdateStockGesture();
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

    private bool CanAddToPlan(string id) => IsCompatible(Target, id) && PlannedRounds < DraftCapacity;

    private GUIButton? StockTileAt(Point mouse) =>
        stockList?.Content.Children.OfType<GUIButton>().FirstOrDefault(tile => tile.Enabled && tile.Rect.Contains(mouse));

    /// <summary>Press on an icon, release without moving to withdraw; drag it to feed the sequence or a preset.</summary>
    private void UpdateStockGesture()
    {
        if (stockList == null || GuiFrame == null) { return; }
        var mousePosition = PlayerInput.MousePosition;
        Point mouse = new((int)mousePosition.X, (int)mousePosition.Y);
        if (PlayerInput.PrimaryMouseButtonDown())
        {
            gesture = StockGesture.None;
            if (StockTileAt(mouse) is { UserData: ValueTuple<string, ItemPrefab?> data })
            {
                gesture = StockGesture.Pending;
                gestureId = data.Item1;
                gestureStart = mouse;
            }
        }
        if (gesture != StockGesture.None && PlayerInput.PrimaryMouseButtonHeld())
        {
            if (gesture == StockGesture.Pending &&
                Vector2.Distance(mousePosition, new Vector2(gestureStart.X, gestureStart.Y)) > DragThreshold)
            {
                gesture = StockGesture.Dragging;
                CreateGestureGhost();
            }
            if (gesture == StockGesture.Dragging) { MoveGestureGhost(mouse); }
        }
        if (gesture == StockGesture.None || !PlayerInput.PrimaryMouseButtonReleased()) { return; }

        if (gesture == StockGesture.Pending)
        {
            if (IsSynchronized) { RequestWithdraw(gestureId); uiDirty = true; }
        }
        else { DropStock(mouse); }
        gesture = StockGesture.None;
        gestureId = "";
        RemoveGestureGhost();
    }

    /// <summary>Preset rows take the dragged ammo into that preset; the sequence lists take it into the plan.</summary>
    private void DropStock(Point mouse)
    {
        if (gestureId.Length == 0) { return; }
        if (presetList != null)
        {
            foreach (var row in presetList.Content.Children)
            {
                if (row.UserData is not MagazinePrefab preset || !row.Rect.Contains(mouse)) { continue; }
                AppendToPreset(preset);
                return;
            }
        }
        if (sequenceList?.Rect.Contains(mouse) == true ||
            (startSectionList?.Visible == true && startSectionList.Rect.Contains(mouse)) ||
            (endSectionList?.Visible == true && endSectionList.Rect.Contains(mouse)))
        {
            var (section, index) = DropTarget(mouse);
            InsertRound(gestureId, section, index);
        }
    }

    private void AppendToPreset(MagazinePrefab preset)
    {
        if (!MagazinePresetLibrary.IsCustom(preset))
        {
            message = L("builtin").Value;
            uiDirty = true;
            return;
        }
        // Keep the preset's own start/end sections: the new round joins the main section.
        var (start, main, end) = MagazinePresetLibrary.GetSections(preset);
        var updatedMain = AmmoPlan.Compact([.. AmmoPlan.Expand(main), gestureId]);
        var plan = AmmoPlan.Compact([.. AmmoPlan.Expand(start), .. AmmoPlan.Expand(updatedMain), .. AmmoPlan.Expand(end)]);
        if (!AmmoPlan.IsValid(plan, AmmoPlan.MaxRounds))
        {
            message = L("invalidplan").Value;
            uiDirty = true;
            return;
        }
        string name = MagazinePresetLibrary.GetName(preset);
        // The authority edits the library directly; clients ask the server, which owns the files.
        if (MagazinePresetLibrary.IsAuthority) { MagazinePresetLibrary.AppendToMain(preset, gestureId); Changed(); }
        else { RequestSavePreset(name, start, updatedMain.ToArray(), end); }
        message = L("saved").Value;
        uiDirty = true;
    }

    private void CreateGestureGhost()
    {
        if (GuiFrame == null || gestureId.Length == 0) { return; }
        var prefab = ItemPrefab.FindByIdentifier(gestureId.ToIdentifier()) as ItemPrefab;
        int size = (int)(44 * GUI.Scale);
        gestureGhost = new GUIImage(new RectTransform(new Point(size), GuiFrame.RectTransform),
            prefab?.InventoryIcon ?? prefab?.Sprite, scaleToFit: true)
            {
                CanBeFocused = false,
                IgnoreLayoutGroups = true,
                Color = prefab?.InventoryIcon != null ? prefab.InventoryIconColor : prefab?.SpriteColor ?? Color.White
            };
    }

    private void MoveGestureGhost(Point mouse)
    {
        if (gestureGhost?.Parent is not { } parent) { return; }
        gestureGhost.RectTransform.AbsoluteOffset = new Point(
            mouse.X - parent.Rect.X - gestureGhost.Rect.Width / 2,
            mouse.Y - parent.Rect.Y - gestureGhost.Rect.Height / 2);
    }

    private void RemoveGestureGhost()
    {
        if (gestureGhost == null) { return; }
        gestureGhost.Parent?.RemoveChild(gestureGhost);
        gestureGhost = null;
    }

    private void RefreshUI()
    {
        var target = Target;
        var stock = Stock;
        int capacity = DraftCapacity;
        int planned = PlannedRounds;
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
        // The Start/End blocks keep their own lists at the frame edges, so they can never scroll out of sight.
        LayoutSequenceArea();
        startSectionList!.Content.ClearChildren();
        sequenceList!.Content.ClearChildren();
        endSectionList!.Content.ClearChildren();
        var rounds = AllRounds();
        int startCount = startSection.Sum(r => r.Count);
        int mainCount = draft.Sum(r => r.Count);
        int endCount = endSection.Sum(r => r.Count);
        // Same three-part layout as MagazinePrefab: start on top of the stack, then main, then end at the bottom.
        startSectionHeader!.Text = SectionHeaderText("startsection", startCount, showStartSection);
        startSectionList.Visible = showStartSection;
        if (showStartSection)
        {
            if (startCount == 0) { HintRow(startSectionList, L("addhint"), startRowHeight); }
            AddSequenceRows(startSectionList, SectionStart, startSection, 0, target, startRowHeight);
        }
        if (rounds.Length == 0) { TextRow(sequenceList, L("addhint").Value); }
        AddSequenceRows(sequenceList, SectionMain, draft, startCount, target, SequenceRowHeight);
        endSectionHeader!.Text = SectionHeaderText("endsection", endCount, showEndSection);
        endSectionList.Visible = showEndSection;
        if (showEndSection)
        {
            if (endCount == 0) { HintRow(endSectionList, L("addhint"), endRowHeight); }
            AddSequenceRows(endSectionList, SectionEnd, endSection, startCount + mainCount, target, endRowHeight);
        }
        // Re-derive the block heights from the rows that now exist, so a block always fits what it holds.
        LayoutSequenceArea();
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
                OnClicked = (_, _) => true,
                Enabled = canWithdraw || CanAddToPlan(p.Key)
            };
            BindStockTooltip(tile, prefab, AmmoName(p.Key), () =>
                (fromSupply ? $"{L("stored").Value}: {p.Value:N0}\n{L("supplied").Value}: {available:N0}\n" : "") +
                L(canWithdraw ? "clickwithdraw" : "addhint").Value);
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
        var loaded = target?.LoadedAmmoIdentifiers.Select(i => i.Value).ToArray() ?? [];
        if (loaded.Length == 0) { TextRow(actualList, L(target == null ? "nomagazine" : "empty").Value); }
        // Summary only: what the magazine holds, one row per ammo type (first appearance first) with its amount.
        // The firing order lives in the sequence panel, so there is no per-slot or per-run numbering here.
        foreach (var group in loaded.GroupBy(id => id, StringComparer.OrdinalIgnoreCase))
        {
            var row = ListRow(actualList, 26);
            AmmoLabel(row, group.Key, AmmoName(group.Key), 0.7f);
            _ = new GUITextBlock(new RectTransform(new Vector2(0.28f, 1), row.RectTransform, Anchor.CenterRight),
                $"x{group.Count()}", font: GUIStyle.SmallFont, textAlignment: Alignment.CenterRight)
                { Padding = Vector4.Zero, AutoScaleHorizontal = true, CanBeFocused = false };
        }
        magazineCaption!.Text = $"{L("targetslot")} | {TargetSlot + 1}/{Math.Max(1, TargetSlotCount)}";
        // The arrows sit between the second and third slot, so a shorter rack has nowhere to put them.
        bool rackSelector = TargetSlotCount >= 3;
        slotUpButton!.Visible = slotDownButton!.Visible = rackSelector;
        slotUpButton.Enabled = rackSelector && TargetSlot > 0;
        slotDownButton.Enabled = rackSelector && TargetSlot < TargetSlotCount - 1;
        targetLabel!.Text = target == null
            ? L("currentmagazine")
            : $"{L("currentmagazine")} | {target.LoadedCount}/{target.MaxSize}";
        draftLabel!.Text = autoRepeat
            ? $"{L("plan")} | {planned} -> {rounds.Length} {L("rounds")}{(draftDirty ? " *" : "")}"
            : $"{L("plan")} | {planned} {L("rounds")}{(draftDirty ? " *" : "")}";
        draftLabel.ToolTip = $"{L("topfirst")}\n{L("dragorder")}\n{L(draftDirty ? "unsaved" : "savedstate")}";
        clearButton!.Enabled = PlannedRounds > 0;
        string problem = !Ready ? "unavailable" : !IsSynchronized ? "syncing" : target == null ? "nomagazine" :
            target.LoadedCount >= target.MaxSize ? "full" : PlannedRounds == 0 ? "emptyplan" :
            !AmmoPlan.IsValid(FullPlan(), AmmoPlan.MaxRounds) ? "invalidplan" :
            demand.Keys.Any(id => !IsCompatible(target, id)) ? "incompatible" : !quote.CanLoad ? "notenough" : "ready";
        loadButton!.Enabled = problem == "ready";
        loadButton.ToolTip = L(problem);
        unloadButton!.Enabled = Ready && IsSynchronized && target?.LoadedCount > 0;
        unloadButton.ToolTip = L("unloadhint", "unload");
        // Visibility culling during collection needs the new scroll range, including after a list shrinks.
        foreach (var list in new[] { presetList, startSectionList, sequenceList, endSectionList, stockList, actualList, checkList })
        {
            list!.UpdateScrollBarSize();
        }
    }

    /// <summary>
    /// Inserts one round into <paramref name="section" /> before group <paramref name="index" />. A drop lands exactly
    /// where the pointer released it: it only joins the neighbouring group when that group holds the same ammo.
    /// </summary>
    private void InsertRound(string id, int section, int index)
    {
        if (!CanAddToPlan(id)) { return; }
        var runs = SectionRuns(section);
        var rounds = AmmoPlan.Expand(runs).ToList();
        int position = AmmoPlan.Expand(runs.Take(Math.Clamp(index, 0, runs.Count))).Count();
        rounds.Insert(position, id);
        var next = AmmoPlan.Compact(rounds);
        if (!AmmoPlan.IsValid(AmmoPlan.Compact(AllRoundsReplacing(section, next)), DraftCapacity)) { return; }
        runs.Clear();
        runs.AddRange(next);
        DraftChanged();
    }

    /// <summary>Firing order with one section replaced, used to validate an edit before it is applied.</summary>
    private IEnumerable<string> AllRoundsReplacing(int section, List<AmmoRun> replacement) =>
        [.. AmmoPlan.Expand(section == SectionStart ? replacement : startSection),
            .. AmmoPlan.Expand(section == SectionMain ? replacement : draft),
            .. AmmoPlan.Expand(section == SectionEnd ? replacement : endSection)];

    /// <summary>Section and group index a dropped round snaps to: just below the row the pointer is over.</summary>
    private (int Section, int Index) DropTarget(Point mouse)
    {
        // Only an expanded Start/End block takes drops, and only inside its rows: a folded block is just a header.
        if (startSectionList?.Visible == true && startSectionList.Rect.Contains(mouse))
        {
            int startIndex = startSection.Count;
            foreach (var row in startSectionList.Content.Children)
            {
                if (row.UserData is not SequenceRow slot) { continue; }
                if (mouse.Y < row.Rect.Center.Y) { return (slot.Section, slot.Index); }
                startIndex = slot.Index + 1;
            }
            return (SectionStart, startIndex);
        }
        if (endSectionList?.Visible == true && endSectionList.Rect.Contains(mouse))
        {
            int endIndex = endSection.Count;
            foreach (var row in endSectionList.Content.Children)
            {
                if (row.UserData is not SequenceRow slot) { continue; }
                if (mouse.Y < row.Rect.Center.Y) { return (slot.Section, slot.Index); }
                endIndex = slot.Index + 1;
            }
            return (SectionEnd, endIndex);
        }
        int section = SectionMain, index = draft.Count;
        if (sequenceList == null) { return (section, index); }
        foreach (var row in sequenceList.Content.Children)
        {
            if (row.UserData is not SequenceRow slot) { continue; }
            if (mouse.Y < row.Rect.Center.Y) { return (slot.Section, slot.Index); }
            section = slot.Section;
            index = slot.Index + 1;
        }
        return (section, index);
    }

    private void ToggleSection(int section)
    {
        if (section == SectionStart) { showStartSection = !showStartSection; }
        else if (section == SectionEnd) { showEndSection = !showEndSection; }
        uiDirty = true;
    }

    /// <summary>Fold header label for a section. ASCII markers: this UI font draws every arrow glyph alike.</summary>
    private LocalizedString SectionHeaderText(string title, int count, bool expanded) =>
        $"{(expanded ? "[-] " : "[+] ")}{L(title)} | {count} {L("rounds")}";

    private static int SequenceHeaderHeight => (int)(26 * GUI.Scale);
    private static int SequenceRowHeight => (int)(32 * GUI.Scale);
    /// <summary>Rows a pinned Start/End block holds without needing its own scrollbar.</summary>
    private const int SectionVisibleRows = 4;
    // Row height used inside the pinned blocks; squeezed when the frame is short so four groups still fit.
    private int startRowHeight = SequenceRowHeight, endRowHeight = SequenceRowHeight;

    /// <summary>
    /// Splits the sequence frame between the two pinned section blocks and the scrolling main list.
    /// The Start block sits on the top edge with its rows above its header (it folds upwards), the End block on the
    /// bottom edge with its rows below its header (it folds downwards). Each block gets up to
    /// <see cref="SectionVisibleRows" /> rows and the row height is derived from the room the block actually gets, so
    /// four groups always fit without a scrollbar; the main list takes whatever is left and scrolls on its own.
    /// </summary>
    private void LayoutSequenceArea()
    {
        if (sequenceArea == null || sequenceList == null || startSectionFrame == null || endSectionFrame == null) { return; }
        int width = Math.Max(1, sequenceArea.Rect.Width);
        int height = sequenceArea.Rect.Height;
        if (height <= 1) { return; }
        int header = SequenceHeaderHeight;
        int blocks = (showStartSection ? 1 : 0) + (showEndSection ? 1 : 0);
        // GUIListBox subtracts its Padding from the rect before sizing Content, and Content is what the scrollbar
        // decision compares against. Four rows must therefore fit in "block space - padding".
        int startPad = ContentPadding(startSectionList), endPad = ContentPadding(endSectionList);
        int perBlock = blocks == 0 ? SequenceRowHeight : Math.Max(0, height - header * 2) / blocks;
        int startRoom = Math.Max(0, perBlock - header - startPad - (int)(2 * GUI.Scale));
        int endRoom = Math.Max(0, perBlock - header - endPad - (int)(2 * GUI.Scale));
        startRowHeight = RowFit(showStartSection ? startSection.Count : 0, startRoom);
        endRowHeight = RowFit(showEndSection ? endSection.Count : 0, endRoom);
        // An expanded section with no rounds still shows its "drag here" hint, so it keeps the height of one row.
        // Rows are groups of identical rounds, not single rounds, so the height follows the group count.
        // The pitch is measured from the rows themselves, so a block always fits what it holds.
        int startPitch = RowPitch(startSectionList, startRowHeight);
        int endPitch = RowPitch(endSectionList, endRowHeight);
        int startExtra = showStartSection ? Extra(startSection.Count, startPitch, startPad) : 0;
        int endExtra = showEndSection ? Extra(endSection.Count, endPitch, endPad) : 0;
        // Safety net for tiny frames: shrink both blocks proportionally rather than overflow the header space.
        int available = Math.Max(0, height - header * 2);
        if (startExtra + endExtra > available && startExtra + endExtra > 0)
        {
            int total = startExtra + endExtra;
            startExtra = available * startExtra / total;
            endExtra = available - startExtra;
        }
        int startHeight = header + startExtra, endHeight = header + endExtra;
        startSectionFrame.RectTransform.Resize(new Point(width, startHeight));
        startSectionFrame.RectTransform.AbsoluteOffset = Point.Zero;
        // Rows first, header underneath: the block grows into the frame from its top edge.
        if (startSectionList != null)
        {
            startSectionList.RectTransform.Resize(new Point(width, startExtra));
            startSectionList.RectTransform.AbsoluteOffset = Point.Zero;
        }
        if (startSectionHeader != null)
        {
            startSectionHeader.RectTransform.Resize(new Point(width, header));
            startSectionHeader.RectTransform.AbsoluteOffset = new Point(0, startExtra);
        }
        sequenceList.RectTransform.Resize(new Point(width, Math.Max(1, height - startHeight - endHeight)));
        sequenceList.RectTransform.AbsoluteOffset = new Point(0, startHeight);
        endSectionFrame.RectTransform.Resize(new Point(width, endHeight));
        endSectionFrame.RectTransform.AbsoluteOffset = new Point(0, height - endHeight);
        endSectionHeader?.RectTransform.Resize(new Point(width, header));
        if (endSectionList != null)
        {
            endSectionList.RectTransform.Resize(new Point(width, endExtra));
            endSectionList.RectTransform.AbsoluteOffset = new Point(0, header);
        }
    }

    /// <summary>Hint row with an exact pixel height, for blocks that must fit one measured row.</summary>
    private static void HintRow(GUIListBox list, LocalizedString text, int height)
    {
        new GUITextBlock(new RectTransform(new Vector2(1, 0), list.Content.RectTransform,
            minSize: new Point(0, Math.Max(1, height))), text, font: GUIStyle.SmallFont)
            { ToolTip = text, AutoScaleHorizontal = true, CanBeFocused = false };
    }

    /// <summary>Height one row occupies in <paramref name="list" />: measured from the rows, or the planned height.</summary>
    private static int RowPitch(GUIListBox? list, int fallback)
    {
        if (list?.Content == null) { return fallback; }
        foreach (var child in list.Content.Children) { return child.Rect.Height + list.Spacing; }
        return fallback;
    }

    /// <summary>
    /// Padding a list subtracts from its rect before sizing its content frame (see GUIListBox.UpdateDimensions): the
    /// scrollbar decision compares the content frame, not the list rect, so the block has to pay for it too.
    /// </summary>
    private static int ContentPadding(GUIListBox? list) => list == null ? 0 : (int)(list.Padding.Y + list.Padding.W);

    /// <summary>
    /// Height a pinned block needs: one row per group (at most <see cref="SectionVisibleRows" />), plus the list padding
    /// and a couple of pixels of slack so rounding never turns into a scrollbar.
    /// </summary>
    private static int Extra(int groups, int pitch, int padding) =>
        Math.Min(SectionVisibleRows, Math.Max(1, groups)) * pitch + padding + (int)(2 * GUI.Scale);

    /// <summary>
    /// Row height for a pinned block holding <paramref name="groups" /> groups in <paramref name="room" /> pixels: the
    /// standard row when they fit, squeezed (but never below 16px) when they do not, so four groups need no scrollbar.
    /// </summary>
    private static int RowFit(int groups, int room)
    {
        int visible = Math.Min(groups, SectionVisibleRows);
        if (visible <= 0 || visible * SequenceRowHeight <= room) { return SequenceRowHeight; }
        return Math.Clamp(room / visible, (int)(16 * GUI.Scale), SequenceRowHeight);
    }

    /// <summary>
    /// One row per group of identical rounds, the way the old sequence editor listed them: the amount is a number
    /// input on the row, so a magazine holding thirty identical rounds is one line instead of a thirty-line scroll.
    /// The row number is absolute: it names the firing position of the group's first round.
    /// </summary>
    private void AddSequenceRows(GUIListBox list, int section, List<AmmoRun> runs, int numberOffset,
        VirtualizedMagazine? target, int rowHeight)
    {
        int next = numberOffset + 1;
        for (int i = 0; i < runs.Count; i++)
        {
            var run = runs[i];
            int index = i;
            int number = next;
            next += run.Count;
            var card = new GUIFrame(new RectTransform(new Vector2(1, 0), list.Content.RectTransform,
                minSize: new Point(0, rowHeight)), style: "ListBoxElement")
                {
                    UserData = new SequenceRow(section, index), CanBeFocused = true,
                    ToolTip = $"{AmmoName(run.Id)} x {run.Count}\n{L("dragorder")}"
                };
            var row = new GUILayoutGroup(new RectTransform(new Vector2(0.98f, 0.9f), card.RectTransform, Anchor.Center),
                isHorizontal: true, childAnchor: Anchor.CenterLeft) { RelativeSpacing = 0.01f, CanBeFocused = false };
            DragMarker(row);
            var ammoLabel = AmmoLabel(row, run.Id, $"{number:D2} | {AmmoName(run.Id)}", 0.6f);
            if (!IsCompatible(target, run.Id)) { ammoLabel.TextColor = Color.OrangeRed; }
            var amount = new GUINumberInput(new RectTransform(new Vector2(0.26f, 1), row.RectTransform), NumberType.Int)
            {
                MinValueInt = 1,
                MaxValueInt = Math.Max(run.Count, run.Count + DraftCapacity - PlannedRounds),
                IntValue = run.Count
            };
            amount.ToolTip = L("rounds");
            amount.OnValueChanged += _ => ChangeRunCount(section, index, amount.IntValue);
            Button(row, "delete", 0.1f, 1, () => RemoveRun(section, index));
        }
    }

    /// <summary>Removes a whole group; neighbours of the same ammo merge now that the group between them is gone.</summary>
    private void RemoveRun(int section, int index)
    {
        var runs = SectionRuns(section);
        if (index < 0 || index >= runs.Count) { return; }
        runs.RemoveAt(index);
        DraftChanged();
    }

    /// <summary>Sets the amount of one group. Growth stops at the free space left in the magazine.</summary>
    private void ChangeRunCount(int section, int index, int count)
    {
        var runs = SectionRuns(section);
        // Clearing a number input temporarily reports zero even with MinValueInt = 1.
        if (count < 1 || index < 0 || index >= runs.Count) { return; }
        if (count > runs[index].Count && PlannedRounds - runs[index].Count + count > DraftCapacity) { return; }
        if (count == runs[index].Count) { return; }
        runs[index] = runs[index] with { Count = count };
        DraftChanged();
    }

    /// <summary>Reorders the main section's groups; the main section is the only one rows can be dragged within.</summary>
    private void ReorderRuns(int[] order)
    {
        if (order.Length != draft.Count || order.Distinct().Count() != order.Length ||
            order.Any(i => i < 0 || i >= draft.Count) || order.SequenceEqual(Enumerable.Range(0, draft.Count))) { return; }
        var reordered = AmmoPlan.Merge(order.Select(i => draft[i]));
        var plan = AmmoPlan.Merge([.. startSection, .. reordered, .. endSection]);
        if (!AmmoPlan.IsValid(plan, AmmoPlan.MaxRounds))
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
        var (start, main, end) = MagazinePresetLibrary.GetSections(preset);
        var plan = AmmoPlan.Compact([.. AmmoPlan.Expand(start), .. AmmoPlan.Expand(main), .. AmmoPlan.Expand(end)]);
        if (!AmmoPlan.IsValid(plan, AmmoPlan.MaxRounds))
        {
            message = L("invalidplan").Value;
            uiDirty = true;
            return;
        }
        void Apply()
        {
            // Merge neighbouring groups of the same round so one row always means one group, as the editor shows it.
            startSection.Clear();
            startSection.AddRange(AmmoPlan.Merge(start));
            draft.Clear();
            draft.AddRange(AmmoPlan.Merge(main));
            endSection.Clear();
            endSection.AddRange(AmmoPlan.Merge(end));
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
        var plan = FullPlan();
        string name = presetName!.Text.Trim();
        if (name.Length is 0 or > MagazinePresetLibrary.MaxNameLength || !AmmoPlan.IsValid(plan, AmmoPlan.MaxRounds))
        {
            message = L("invalidpreset").Value;
            uiDirty = true;
            return;
        }
        // The authority edits the in-memory library directly; clients ask the server, which owns the files.
        if (MagazinePresetLibrary.IsAuthority)
        {
            selectedPreset = MagazinePresetLibrary.Create(name, SectionRuns(SectionStart), SectionRuns(SectionMain),
                SectionRuns(SectionEnd));
            Changed();
        }
        else
        {
            RequestSavePreset(name, SectionRuns(SectionStart).ToArray(), SectionRuns(SectionMain).ToArray(),
                SectionRuns(SectionEnd).ToArray());
        }

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
