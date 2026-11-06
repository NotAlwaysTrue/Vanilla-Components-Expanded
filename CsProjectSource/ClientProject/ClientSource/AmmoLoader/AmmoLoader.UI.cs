using Barotrauma.Items.Components;
using VCE_VirtualizedMagazine;

namespace VCE.AmmoLoading;

public sealed partial class AmmoLoader
{
    private readonly List<AmmoRun> draft = [];
    private GUIListBox? presetList, planList, previewList, stockList, actualList, checkList;
    private GUITextBox? presetName;
    private GUITextBlock? status, targetLabel, planLabel;
    private GUIButton? loadButton, unloadButton, presetLoadButton;
    private GUIFrame? inputHolder, targetHolder;
    private bool uiDirty = true, draftDirty, confirmingReplace;
    private AmmoPreset? selectedPreset;
    private ushort displayedTarget;
    private uint displayedRevision = uint.MaxValue;
    private int displayedCount = -1;
    private string message = "";

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
        GuiFrame.ClearChildren();
        TryCreateDragHandle();
        // Keep this integrated window at its centered or player-dragged position.
        AllowUIOverlap = true;
        var root = new GUILayoutGroup(new RectTransform(GuiFrame.Rect.Size - GUIStyle.ItemFrameMargin,
            GuiFrame.RectTransform, Anchor.Center) { AbsoluteOffset = GUIStyle.ItemFrameOffset })
        {
            RelativeSpacing = 0.012f
        };
        new GUITextBlock(new RectTransform(new Vector2(1, 0.045f), root.RectTransform), L("title"), font: GUIStyle.SubHeadingFont);
        var upper = new GUILayoutGroup(new RectTransform(new Vector2(1, 0.54f), root.RectTransform), isHorizontal: true) { RelativeSpacing = 0.015f };
        var a = Column(upper, 0.22f, "presets");
        presetList = List(a, 0.66f);
        presetLoadButton = Button(a, "loadpreset", 1, 0.1f, () =>
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
        var presetActions = Row(a, 0.1f);
        Button(presetActions, "up", 0.3f, 1, () => MovePreset(-1));
        Button(presetActions, "down", 0.3f, 1, () => MovePreset(1));
        Button(presetActions, "delete", 0.36f, 1, DeletePreset);

        var b = Column(upper, 0.48f, "plan");
        planLabel = new GUITextBlock(new RectTransform(new Vector2(1, 0.06f), b.RectTransform), L("topfirst"), font: GUIStyle.SmallFont);
        var planColumns = Row(b, 0.58f);
        planList = new GUIListBox(new RectTransform(new Vector2(0.7f, 1), planColumns.RectTransform));
        previewList = new GUIListBox(new RectTransform(new Vector2(0.28f, 1), planColumns.RectTransform));
        var nameRow = Row(b, 0.1f);
        new GUITextBlock(new RectTransform(new Vector2(0.2f, 1), nameRow.RectTransform), L("presetname"), font: GUIStyle.SmallFont)
            { AutoScaleHorizontal = true };
        presetName = new GUITextBox(new RectTransform(new Vector2(0.78f, 1), nameRow.RectTransform), "", font: GUIStyle.SmallFont) { MaxTextLength = 48 };
        var saveActions = Row(b, 0.12f);
        Button(saveActions, "savepreset", 0.63f, 1, SavePreset);
        Button(saveActions, "clear", 0.35f, 1, () => { draft.Clear(); DraftChanged(); });

        var c = Column(upper, 0.27f, "actual");
        targetLabel = new GUITextBlock(new RectTransform(new Vector2(1, 0.1f), c.RectTransform), "", font: GUIStyle.SmallFont) { AutoScaleHorizontal = true };
        actualList = List(c, 0.65f);
        unloadButton = Button(c, "unload", 1, 0.12f, () => Send(Command.Unload));

        var lower = Row(root, 0.3f);
        var supply = Column(lower, 0.715f, "stock");
        stockList = List(supply, 0.44f);
        new GUITextBlock(new RectTransform(new Vector2(1, 0.12f), supply.RectTransform), L("intake"), font: GUIStyle.SmallFont);
        inputHolder = new GUIFrame(new RectTransform(new Vector2(1, 0.29f), supply.RectTransform), style: null);
        var checks = Column(lower, 0.27f, "check");
        checkList = List(checks, 0.44f);
        checkList.ToolTip = L("needstock");
        new GUITextBlock(new RectTransform(new Vector2(1, 0.12f), checks.RectTransform), L("targetslot"), font: GUIStyle.SmallFont);
        targetHolder = new GUIFrame(new RectTransform(new Vector2(1, 0.29f), checks.RectTransform), style: null);
        targetHolder.ToolTip = L("targetslot");

        var actions = Row(root, 0.06f);
        status = new GUITextBlock(new RectTransform(new Vector2(0.77f, 1), actions.RectTransform), "", font: GUIStyle.SmallFont) { Wrap = true };
        loadButton = Button(actions, "load", 0.21f, 1, () => Send(Command.Load, draft.ToArray()));
        BindInventory(inputContainer, inputHolder);
        BindInventory(targetContainer, targetHolder);
        uiDirty = true;
    }

    private static void BindInventory(ItemContainer? container, GUIFrame holder)
    {
        if (container?.Inventory == null) { return; }
        container.AllowUIOverlap = true;
        container.Inventory.DrawWhenEquipped = true;
        container.Inventory.RectTransform = holder.RectTransform;
    }

    private static GUILayoutGroup Column(GUILayoutGroup parent, float width, string title)
    {
        var group = new GUILayoutGroup(new RectTransform(new Vector2(width, 1), parent.RectTransform)) { RelativeSpacing = 0.015f };
        new GUITextBlock(new RectTransform(new Vector2(1, 0.08f), group.RectTransform), L(title), font: GUIStyle.SmallFont);
        return group;
    }

    private static GUILayoutGroup Row(GUILayoutGroup parent, float height) =>
        new(new RectTransform(new Vector2(1, height), parent.RectTransform), isHorizontal: true) { RelativeSpacing = 0.02f };

    private static GUIListBox List(GUILayoutGroup parent, float height) =>
        new(new RectTransform(new Vector2(1, height), parent.RectTransform));

    private static GUIButton Button(GUILayoutGroup parent, string text, float width, float height, Action action) =>
        new(new RectTransform(new Vector2(width, height), parent.RectTransform), L(text), style: "GUIButtonSmallFreeScale")
        {
            OnClicked = (_, _) => { action(); return true; }
        };

    private static GUILayoutGroup ListRow(GUIListBox list, int height = 32) =>
        new(new RectTransform(new Vector2(1, 0), list.Content.RectTransform,
            minSize: new Point(0, (int)(height * GUI.Scale))), isHorizontal: true) { RelativeSpacing = 0.01f };

    private static void TextRow(GUIListBox list, string text, Color? color = null)
    {
        var row = new GUITextBlock(new RectTransform(new Vector2(1, 0), list.Content.RectTransform,
            minSize: new Point(0, (int)(26 * GUI.Scale))), text, font: GUIStyle.SmallFont)
            { ToolTip = text, AutoScaleHorizontal = true };
        if (color.HasValue) { row.TextColor = color.Value; }
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
        refreshTimer -= deltaTime;
        if (GameMain.Client != null && refreshTimer <= 0 && (!hasSnapshot || pages.Any(p => p == null)))
        {
            refreshTimer = 2;
            Send(Command.Refresh);
        }
        if (displayedTarget != (Target?.Item.ID ?? 0) || displayedCount != (Target?.LoadedCount ?? 0) || displayedRevision != revision)
        {
            displayedTarget = Target?.Item.ID ?? 0;
            displayedCount = Target?.LoadedCount ?? 0;
            displayedRevision = revision;
            uiDirty = true;
        }
        if (uiDirty && presetList != null && GUI.KeyboardDispatcher.Subscriber is not GUITextBox)
        {
            RefreshUI();
            uiDirty = false;
        }
    }

    private void RefreshUI()
    {
        var target = Target;
        var visiblePresets = AmmoPresets.All(target)
            .Where(p => target == null || p.Rounds.All(r => IsCompatible(target, r.Id))).ToList();
        if (selectedPreset != null)
        {
            selectedPreset = visiblePresets.FirstOrDefault(p => p.Name == selectedPreset.Name && p.BuiltIn == selectedPreset.BuiltIn);
        }
        presetList!.Content.ClearChildren();
        presetLoadButton!.Enabled = selectedPreset != null;
        if (visiblePresets.Count == 0) { TextRow(presetList, L("nopresets").Value); }
        foreach (var preset in visiblePresets)
        {
            var row = new GUIButton(new RectTransform(new Vector2(1, 0), presetList.Content.RectTransform,
                minSize: new Point(0, (int)(30 * GUI.Scale))), preset.Name, style: "GUIButtonSmallFreeScale")
            {
                Selected = selectedPreset == preset,
                ToolTip = string.Join("\n", preset.Rounds.Select(r => $"{AmmoName(r.Id)} × {r.Count}")),
                OnClicked = (_, _) => { selectedPreset = preset; confirmingReplace = false; uiDirty = true; return true; }
            };
        }
        planList!.Content.ClearChildren();
        previewList!.Content.ClearChildren();
        for (int i = 0; i < draft.Count; i++)
        {
            int index = i;
            var run = draft[i];
            var row = ListRow(planList);
            new GUITextBlock(new RectTransform(new Vector2(0.38f, 1), row.RectTransform),
                AmmoName(run.Id), font: GUIStyle.SmallFont) { ToolTip = run.Id, AutoScaleHorizontal = true };
            var number = new GUINumberInput(new RectTransform(new Vector2(0.25f, 1), row.RectTransform),
                NumberType.Int)
            {
                MinValueInt = 1, MaxValueInt = AmmoPlan.MaxRounds - draft.Sum(r => r.Count) + run.Count, IntValue = run.Count
            };
            number.OnValueChanged += _ => ChangeRunCount(index, number.IntValue);
            Button(row, "up", 0.1f, 1, () => MoveRun(index, -1));
            Button(row, "down", 0.1f, 1, () => MoveRun(index, 1));
            Button(row, "delete", 0.12f, 1, () => { draft.RemoveAt(index); DraftChanged(); });
            TextRow(previewList, $"{i + 1}. {AmmoName(run.Id)} × {run.Count}");
        }
        stockList!.Content.ClearChildren();
        var demand = AmmoStock.Count(AmmoPlan.Expand(draft));
        foreach (var p in Stock.Counts.OrderBy(p => AmmoName(p.Key)))
        {
            if (target != null && !IsCompatible(target, p.Key)) { continue; }
            var row = ListRow(stockList);
            new GUITextBlock(new RectTransform(new Vector2(0.78f, 1), row.RectTransform),
                $"{AmmoName(p.Key)}  × {p.Value}", font: GUIStyle.SmallFont) { ToolTip = p.Key, AutoScaleHorizontal = true };
            var add = Button(row, "add", 0.2f, 1, () => { draft.Add(new(p.Key, 1)); DraftChanged(); });
            add.Enabled = IsCompatible(target, p.Key) && draft.Count < AmmoPlan.MaxGroups &&
                draft.Sum(r => r.Count) < AmmoPlan.MaxRounds;
        }
        checkList!.Content.ClearChildren();
        foreach (var id in Stock.Counts.Keys.Concat(demand.Keys).Distinct(StringComparer.OrdinalIgnoreCase).OrderBy(AmmoName))
        {
            if (target != null && !IsCompatible(target, id) && !demand.ContainsKey(id)) { continue; }
            int needed = demand.GetValueOrDefault(id);
            TextRow(checkList, $"{AmmoName(id)}  {needed} / {Stock[id]}", needed > Stock[id] ? Color.OrangeRed : null);
        }
        actualList!.Content.ClearChildren();
        var actual = AmmoPlan.Compact(target?.LoadedAmmoIdentifiers.Select(id => id.Value) ?? []);
        if (actual.Count == 0) { TextRow(actualList, L(target == null ? "nomagazine" : "empty").Value); }
        foreach (var run in actual) { TextRow(actualList, $"{AmmoName(run.Id)} × {run.Count}"); }
        targetLabel!.Text = target == null ? L("nomagazine") : $"{target.Item.Name}  {target.LoadedCount} / {target.MaxSize}";
        planLabel!.Text = $"{L("topfirst")}  {draft.Sum(r => r.Count)} / {target?.MaxSize ?? 0}";
        bool synchronized = GameMain.Client == null || (hasSnapshot && pages.All(p => p != null));
        string problem = !Ready ? "unavailable" : !synchronized ? "syncing" : target == null ? "nomagazine" :
            target.LoadedCount > 0 ? "unloadfirst" : !AmmoPlan.IsValid(draft, target.MaxSize) ? "invalidplan" :
            draft.Any(r => !IsCompatible(target, r.Id)) ? "incompatible" : !Stock.CanTake(demand) ? "notenough" : "ready";
        loadButton!.Enabled = problem == "ready";
        unloadButton!.Enabled = Ready && synchronized && target?.LoadedCount > 0;
        status!.Text = message.Length > 0 ? message : L(problem);
    }

    private void ChangeRunCount(int index, int count)
    {
        // Clearing a number input temporarily reports zero even with MinValueInt = 1.
        if (count < 1 || index < 0 || index >= draft.Count) { return; }
        draft[index] = draft[index] with { Count = count };
        DraftChanged();
    }

    private void MoveRun(int index, int offset)
    {
        int other = index + offset;
        if (other < 0 || other >= draft.Count) { return; }
        (draft[index], draft[other]) = (draft[other], draft[index]);
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

    private void MovePreset(int offset)
    {
        if (selectedPreset == null || selectedPreset.BuiltIn) { return; }
        var saved = AmmoPresets.Saved;
        var visible = saved.Where(p => Target == null || p.Rounds.All(r => IsCompatible(Target, r.Id))).ToList();
        int other = visible.IndexOf(selectedPreset) + offset;
        if (other < 0 || other >= visible.Count) { return; }
        var old = saved.ToArray();
        int a = saved.IndexOf(selectedPreset), b = saved.IndexOf(visible[other]);
        (saved[a], saved[b]) = (saved[b], saved[a]);
        TrySavePresets(old);
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
