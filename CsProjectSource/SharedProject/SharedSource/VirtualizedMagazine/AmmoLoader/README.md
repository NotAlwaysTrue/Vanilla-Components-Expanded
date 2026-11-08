# VCE AmmoLoader

## 职责与维护边界

装弹机仅注册一个 `AmmoLoader` 组件，使用 partial 分文件维护 UI、库存、装卸、存档和网络。装弹机专用代码统一放在各工程的 `AmmoLoader` 目录；后端和网络仍交由 VirtualizedMagazine 维护者负责。

- `ClientProject/ClientSource/VirtualizedMagazine/AmmoLoader/AmmoLoader.UI.cs`：界面、编排编辑与预设列表。
- `SharedProject/SharedSource/VirtualizedMagazine/AmmoLoader/MagazinePresetLibrary.cs`：玩家预设，每个预设在内存中就是一个 `MagazinePrefab`。
- `SharedProject/SharedSource/VirtualizedMagazine/AmmoLoader/AmmoLoader.cs`：容器绑定、入库、装卸事务、库存存档及权威端校验。
- 同目录的 `AmmoStock`、`AmmoPlan` / `AmmoRun`：后端库存及装填计划数据。
- 客户端 `AmmoLoader/AmmoLoader.Network.cs` 与服务端 `AmmoLoader/AmmoLoader.Server.cs`：库存快照、请求校验与传输。
- 原有 `VirtualizedMagazine.Network.cs`：弹匣自身弹序同步，取出弹匣后仍然生效。

库存快照与弹匣弹序是两种不同状态，仍各由所属组件同步；两套协议均归 VirtualizedMagazine 模块维护。
UI 文件只读取状态并调用后端方法，不写库存、不直接修改弹匣栈，也不维护网络编码、分页或重试。

## UI 接口

UI 与后端属于同一个 `AmmoLoader` 实例，直接使用以下接口：

- 读取 `Stock`、`Target`、`InputContainer`、`OutputContainer`、`TargetContainer`、`Ready`、`StateRevision`。
- 客户端读取 `IsSynchronized`；界面更新时调用 `UpdateClientState(deltaTime)`，由后端处理初始同步及重试。
- 调用 `RequestLoad(AmmoRun[])`、`RequestUnload()`、`RequestWithdraw(projectileId)`；单机与联网分支均在后端。
- 预设调用 `RequestSavePreset(name, AmmoRun[])`、`RequestDeletePreset(name)`、`RequestMovePreset(name, index)`；权威端直接改内存。
- `AmmoRun[]` 从上到下表示出膛顺序。后端转换为 VirtualizedMagazine 接口所需的栈底优先顺序。

兼容性由 `VirtualizedMagazine.IsAmmoCompatible` 判断，投射物组件查询复用 `ElementHelper`。
`LoadedAmmoIdentifiersArray` 保持原有追加语义；完整网络快照和装卸回滚在各自调用处显式清空后恢复弹序。
模组预设统一通过 `MagazinePrefab.CreateAmmoArray(capacity)` 展开，工厂与 UI 共用；返回数组为栈底优先。
玩家预设同样是 `MagazinePrefab` 实例，并以 `<预设名>_Magazine.xml` 逐个保存在 `SettingsService.SaveFolder\CustomMagazinePrefab\`（`MagazinePresetLibrary.FolderName`，首次保存时自动创建该子文件夹）。
主保存目录不随构建配置变化。`#if DEBUG` 构建会**额外读取** `SettingsService.SaveFolder\LocalTEST\`（`MagazinePresetLibrary.TestFolderName`）：其中的预设只作为「本地预设」参与灰色列表与上传测试，既不进入当前列表，也不会被 `Save()` 写入或删除。
预设列表是 `MagazinePresetLibrary` 自己的列表：只包含本机读到/新建的预设，**不读取内容包注册到 `MagazinePrefab.Prefabs` 的预制预设**（`All` 不再遍历该集合）。
本机文件夹里的预设在列表中以**灰色**列出（`MagazinePresetLibrary.LocalOnly`：本机有文件、但当前使用的列表里没有），每行右侧带「上传」按钮：客户端点击后走 `RequestSavePreset` 把该预设加入服务端列表，权威端则直接 `Create` + `PresetChanged()`。上传成功后该条目进入正常列表，灰色行消失（同名去重）。
文件只在游戏保存/加载时读写：`SaveUtil.SaveGame` 后写入并删除已移除预设的文件，`SaveUtil.LoadGame` 后重新读取；UI 编辑只改内存。
多人游戏中保存目录属于服务端。预设（编排）列表不随库存快照周期同步：只在预设变更（保存/删除/排序）时由服务端单独下发，客户端刷新时随 `Refresh` 一并获取；增删与排序以命令提交给服务端执行。
预设保存规则：收到保存命令（`Command.SavePreset`）后立即向客户端下发更新后的列表；权威端（主机/单机）在本地界面里保存、删除、排序或追加预设走同一出口 `AmmoLoader.PresetChanged()`，因此远端客户端同样立刻拿到新列表。保存命令只改内存，不执行任何 IO；预设文件仍只在游戏保存/加载时读写。

## 自定义供弹接口

`AmmoLoader.SupplyResolver` 是每台机器可选的 `Func<Item, AmmoSupplyDefinition?>`，由扩展模组在创建/载入机器时绑定。
VCE 仅在权威端调用它，参数为投料槽中的实际物品；返回 null 表示继续使用原有弹药包入库规则。
返回 `AmmoSupplyDefinition(PoolId, Costs)` 表示该物品留在槽内，以当前 `Condition` 提供共享储量；
`Costs` 将具体投射物 ID 映射到每发消耗的 Condition，必须为有限正数。回调只描述供给，不得修改物品、库存或弹匣。

同一 `PoolId` 的箱子合并储量，必须声明完全相同的弹种和成本；同一弹种只允许归属于一个池。
多个口径可以共用一个池，各池独立结算。DDA 的箱种识别、口径映射和价格规则由 DDA 自行提供，VCE 不包含 DDA ID。
投料容器的 XML `Containable` 仍需由使用方允许对应箱子。委托不写入存档，扩展模组负责重新绑定及卸载时解除。

VCE 每 0.25 秒重读供给，装填前也会立即重读；优先使用现存子弹，再按整份实际装入计划合并供给消耗。
同池箱子按物品 ID 顺序扣耗。装填失败时不扣耗；扣耗异常时恢复已修改的 Condition 和原弹序。
储量只保存在原物品上，卸弹返回具体子弹库存，弹药包取货也仅使用实际库存。
回调异常或无效定义停用该机器的扩展供给，并暂停自动投料入库以保留来源物品；现存子弹仍可装填。

供给池、余额和每发成本随原库存快照分片同步，客户端无需注册适配器，也不自行扣耗。
默认库存格仅显示单行库存数字；悬停可查看扣除当前编排供给用量后的剩余可供数量，同一供给池的不同弹种数量不能相加。
顶部合计只计实际库存，悬停可查看各供给池余额；校验区另列整份计划的各池用量。
未绑定接口的机器保持原有库存显示和行为。

## XML 接入

`AmmoLoader` 同时配置容器索引和 GuiFrame。XML 容器按界面从左到右排列：投料 0、取货 1、弹匣 2。
容器索引只由预制体 XML 决定，不写入潜艇存档；载入时忽略旧存档中的索引，避免旧值覆盖调整后的容器顺序。
三个容器单独显示在第二个 UI 窗口 `Item I/O` 中（窗口中不再显示标题文字）：**窗口高度贴合内容**（= 内边距 + 三行标题 + 六个格子），尺寸全部为固定常量（`IOSlotSize` / `IOCaptionWidth` / `IOCaptionHeight` / `IOCaptionGap`），不做文字测量也不随剩余空间变化；宽度 = 槽位与标题宽度较大者 + 内边距。自带上边框可拖动，初始停靠在主窗口右侧（右侧放不下时改停左侧），随主窗口一起隐藏和重建。
窗口内每个区段自上而下为「文字居中在槽位正上方（固定间距）、槽位列在其下」：投料 1 格、Magazine（目标弹匣容器）4 格、Output（取货容器）1 格；格子尺寸固定，三者统一。
基准尺寸（均乘以 `GUI.Scale`）：槽位绘制边长 66（`IOSlotSize`）、标题行高 24、标题宽度 160、标题与槽位间距 2（`IOCaptionGap`）。
标题使用常规字号（`GUIStyle.Font`，`TextScale` 1.15）而不是小字号，并留有足够宽度，避免 `AutoScaleHorizontal` 把较长标题（如 `Magazine`）进一步缩小。
标题文案：`vce.ammoloader.intake` = `Input` / `输入`，`vce.ammoloader.targetslot` = `Magazine` / `目标弹匣`，`vce.ammoloader.output` = `Output` / `输出`。主面板那一栏的标题是 `vce.ammoloader.currentmagazine` = `Current Magazine` / `当前弹匣`（带 `| 已装/容量` 后缀，不再附带悬停提示）。
窗口底部预留与框架内边距同宽的下内边距（`bottomPad = gap`），否则最后一个输出槽的下边会正好压在面板描边（Outline）上。
槽位 holder 由 `SlotHolderWidth` / `SlotHolderHeight` 按原生公式反推：`Inventory.CreateSlots` 以 `60 * Inventory.UIScale` 为格子边长、左右各留 `5 * UIScale`、每行上方再留 `5 * UIScale + ContainedIndicatorHeight`（`15 * UIScale`），holder 小于该尺寸时槽位会被整体缩小。因此 holder 比看到的格子大一圈，这一圈透明边距不参与布局（`SlotRowsHeight` 只计可见行与行距），由 `BindInventory` 把第一个槽位对齐到标题下方 `IOCaptionGap` 处。
`Inventory.DrawSlot` 把物品状态指示器画在槽位**下方**（`rect.Bottom + Padding/2`，高 `ContainedIndicatorHeight`），原生行距 `5*UIScale + ContainedIndicatorHeight` 正是为它预留的。因此 `SlotBoxHeight` = 槽位 + `SlotRowGap` + `IOCaptionGap`，每列最后一格下方也留出一整段行距，否则指示器会落到下一个标题下面并被文字遮住。
holder 的上边距会伸到标题行之上，因此拖动条 `GUIDragHandle` **最后创建**（`GUI.UpdateMouseOn` 从列表尾部向前查找，最后创建的才拿得到 `MouseOn`），否则透明 holder 会抢走标题栏的拖动区域。
列背景（`Column`）在 `Item I/O` 中按 `heightFactor = 1` 铺满面板，不再保留 5% 的内缩，因此内容上方没有多余的黑边。
屏幕高度不足时 `SlotSize` 会逐步缩小槽位以保证六格与三个标题都放得下（默认分辨率不会触发）。
目标容器可以是多格弹匣架（`slotsperrow="1"` 垂直排列）；**当前生效的弹匣由 `AmmoLoader.TargetSlot` 决定**（`Target` = 该槽位的弹匣），投料与取货各需独立容器。

### 弹匣槽位选择器

- IO 面板的弹匣列右侧、第 2 与第 3 格之间放置两个原版按钮 `PlusButton`（上）与 `MinusButton`（下），点击调用 `RequestSelectSlot(TargetSlot ± 1)`（自动夹在 `0 .. TargetSlotCount-1`）。
- 选中槽位用 `GUIStyle.UIGlow` + `GUIStyle.Green` 描边：通过 `PluginData` 的 `PluginDrawSlotForegroundDelegate` 钩子（`Plugin.cs` 中 `#if CLIENT` 注册/注销，处理器为 `AmmoLoader.DrawSlotForeground`）在 `Inventory.DrawSlot` 内绘制，因此与槽位同一绘制批次、不会被遮挡。钩子是全局的，用静态 `shownLoader`（在 `UpdateHUDComponentSpecific` 中赋值）定位当前打开的窗口。
- 选择是机器状态，不是客户端本地状态：客户端发 `Command.SelectSlot`（复用 `Request.Index` 字段，协议布局不变），服务端 `TrySetTargetSlot` 校验并 `Changed()`；`Snapshot.TargetSlot` 随快照下发。客户端会先本地应用（立即高亮），快照到达后再校正。
- 装填成功后 `TryMoveLoadedMagazineToOutput` 把该弹匣移入 Output 容器（`Inventory.CanBePut` + `TryPutItem(createNetworkEvent: true)`）；Output 不接收该弹匣或已满时留在架上。因此 Output 容器需要同时允许弹匣与弹药包（测试机器已改为 `vceammopackage,vcevirtualmagazine`）。
预设列表同样独立成一个窗口（与主窗口同高、宽度为主窗口 24%，可拖动，初始停在主窗口左侧），因此主窗口只需保留一个「编排 / 出膛顺序」列表、`Output` 栏和下方库存/校验区，尺寸可以缩小到示例中的 `0.6,0.62`。
`Output` 栏上方列出弹匣已装弹序与装卸按钮；取货不再有勾选框，改为单击库存面板中的弹种图标。
弹匣列表只做**汇总展示**（不再显示逐发/逐组的装填排列）：按弹种合并、按首次出现顺序列出，左侧弹种、右侧 `x数量`（`GroupBy(OrdinalIgnoreCase)`）；弹匣的发射顺序看序列面板。`AutoRepeat` 开关也放在这一栏（Output 标题下方的 `repeatRow`），因为它影响的是弹匣最终装多少发。完整数量仍显示在栏标题上。

```xml
<AmmoLoader inputcontainerindex="0" outputcontainerindex="1" targetcontainerindex="2"
            canbeselected="true" msg="ItemMsgInteractSelect">
  <GuiFrame relativesize="0.6,0.62" minsize="700,470" anchor="Center" style="ItemUI" />
</AmmoLoader>
<ItemContainer capacity="1" slotsperrow="1" maxstacksize="1"
               canbeselected="true" hideitems="true" allowuioverlap="true" uilabel="">
  <Containable items="vceammopackage" />
</ItemContainer>
<ItemContainer capacity="1" slotsperrow="1" maxstacksize="1"
               canbeselected="true" hideitems="true" allowuioverlap="true" uilabel="">
  <Containable items="vceammopackage" />
</ItemContainer>
<ItemContainer capacity="4" slotsperrow="1" maxstacksize="1"
               canbeselected="true" hideitems="true" allowuioverlap="true" uilabel="">
  <Containable items="vcevirtualmagazine" />
</ItemContainer>
```

弹药来源添加 `vceammopackage` 标签，并使用现有 `<VirtualizedAmmoStorage ProjectileIdentifier="your_round_identifier" />`。
与现有 VCE 装填器一致，物品当前 Condition 表示剩余发数，MaxCondition 表示容量。
例如 120 发新弹药包设置 `health="120"`。入库读取剩余整数发数，先清零 Condition，再排队移除物品，防止重复入库。
没有此组件、弹种无效或包含其他物品的来源不入库。编辑器非试航状态不消耗来源。
投料口仅允许带 `vceammopackage` 标签的物品；后端仍检查储弹组件和弹药有效性，不符合条件的物品留在原位。

单击库存图标取出一包（不修改编排，也不受当前弹匣容量或弹种过滤限制）；按住拖动则把 1 发加入编排，或拖到预设行追加 1 发到该预设（内置预设只读）。
取货包从同投射物 ID、带 `vceammopackage` 标签且具有 `VirtualizedAmmoStorage` 的无容器物品中选择 `health` 最大者；
容量相同时按物品 ID 排序。`health` 必须为有限正数且至少 1 发。每次取 `min(库存, floor(health))` 发，普通品质，剩余不足一满包时设置对应 Condition。
包只生成在独立取货槽；没有可用包、没有独立取货容器或槽位放不下时禁止取货。取货槽不会自动入库，可以手动拖回投料槽。
服务端处理取货并校验访问权限和库存版本；每台机器同一时刻只排队一个包，库存直到包实际放入才扣除。
排队期间其他装填仍可使用库存，交付时重新限制可取数量；生成取消或放入失败不扣库存，失败物品清零并移除。
旧的两容器配置可保留显式 `targetcontainerindex="1"` 继续装弹；要启用取货，需配置第三个独立容器与对应索引。

弹匣继续使用 `<VirtualizedMagazine AllowedAmmoTags="your_ammo_tag" />`。
`vcevirtualmagazine` 仅为示例目标槽过滤 tag，可改为模组自己的容器条件。
装弹机 `vceammoloader`、测试弹匣与两种弹药包统一放在 `.Test/AmmoLoader/AmmoLoaderItems.xml`，仅启用可选 `VCETESTPACK` 测试依赖时加载。

删除了独立 `AmmoPackage`，不提供旧组件或旧机器存档迁移。开发测试需要重新放置机器与弹药包。

## 行为与验证

空弹匣和非空弹匣均可装填：从编排末尾开始压入，按剩余容量保留末尾、截掉开头，只检查并扣除实际装入部分的库存。
新装弹药先出膛，原有弹药及顺序保留；超出容量的部分留在库存，编排不变。满匣拒绝继续装填，卸弹直接回库。
实际装入部分的兼容性或库存不足时整次拒绝；装填失败时恢复原弹匣，库存不扣除。
序列列表按「一个同类组一行」显示（原 `Sequence` 分组列表与 `Firing order` 预览已合并为 `sequenceList`）：**相邻的同类弹药自动塌缩成一行**，行内的 `GUINumberInput` 就是该组的发数（`ChangeRunCount`，上限 = 当前发数 + 弹匣剩余空间），行首编号是该组第一发的出膛位置。从上到下即出膛顺序：列表内拖拽可重排各组（`ReorderRuns`，只作用于 Main 段，`AmmoPlan.Merge` 保留发数合并相邻同类组），行尾按钮删除整组（`RemoveRun`）；从库存拖入时按落点插入到鼠标所在行的**下方**（`DropTarget` / `InsertRound`，落点位置优先，仅当紧邻的同名组才合并进它的发数）。支持预设保存/排序、兼容项过滤和弹药图标。加载预设覆盖未保存编排时弹窗确认，取消保留当前编排。

### 三段式序列（按 MagazinePrefab 格式）

序列编辑区采用与 `MagazinePrefab` 完全一致的三段模型：`startSection`（栈顶，先出膛）、`draft`（Main 段，中间滚动区）、`endSection`（栈底，最后出膛）。两段**默认折叠**，展开且为空时只占 1 行（显示一行拖入提示），点击行首的 `[+]`/`[-]` 标题折叠/展开（`ToggleSection`）；行号跨段连续编号。

Start/End 都不在滚动列表内：`LayoutSequenceArea()` 每帧把 `sequenceArea` 的高度切成「顶部 Start 块 + 中间 Main 列表 + 底部 End 块」。两个块结构相同（`GUIFrame` + 常驻 `GUIButton` 表头 + 自己的 `GUIListBox`），但方向互为镜像：

```
[Start 行 01..n]    ← 向上折叠：行在表头之上，块从框顶向下长
[+] Start section | n
──────── Main 滚动区 ────────
[+] End section | n
[End 行 01..n]      ← 向下折叠：行在表头之下，块从框底向上长
```

折叠时只剩表头贴住框边、始终可见。展开时块高 =「表头 + min(组数, 4) × 实测行距 + `ContentPadding` + 2px 余量」：行距取**已创建行的实测高度**（`RowPitch`），`ContentPadding` = `GUIListBox.Padding.Y + Padding.W`（`GUIListBox.UpdateDimensions` 会把自己的 Padding 从尺寸里扣掉再给 `Content`，而滑块判据比较的正是 `Content.Rect.Height`，少算这一点会让 4 行判定溢出）；行创建后**再跑一次** `LayoutSequenceArea()`，滑块保留引擎默认的 `AutoHideScrollBar`，因此 **4 组以内不出滑块**，超过 4 组才出。两块优先取空间，Main 列表拿剩余高度并靠自己的滑块处理溢出。拖放只在**已展开**块的列表行区域内生效：折叠状态下表头不接受拖入，不会往该段加入弹药（`DropTarget` / `DropStock` 均判定 `startSectionList`/`endSectionList` 的 `Visible` 与 `Rect`）。
`AutoRepeat` 开关与 `MagazinePrefab` 的同名属性语义一致：勾选后 `AllRounds()` 用 Main 段循环填满 `DraftCapacity - 起始段 - 结束段` 的剩余空间（若手写的 Main 段已经比这段空间长，则原样保留，由服务端 `TakeLast` 裁掉头部）；无目标弹匣时不展开。开关位于 **Output 栏**（Output 标题下方），标题在这种情况下显示 `序列 | 12 -> 30 发`。

发送给服务端的计划是 `FullPlan()` = Start + Main + End 展开后再压缩（射击顺序）。预设写入也分三段：`MagazinePresetLibrary.Create(name, start, main, end)` 生成 `<StartAmmoGroup>/<AmmoGroup>/<EndAmmoGroup>`，读取时 `GetSections(prefab)` 还原三段；加载预设会清空并重新填充三段。预设保存与同步全程携带三段：`Request` 增加 `Start`/`End`（`ClientEventWrite`/`ServerEventRead` 按「三段各一个计数字节 + 条目」读写），`PresetSnapshot(Name, Start, Main, End)` 与 `MagazinePresetLibrary.Snapshot()`/`ApplyRemote()` 同样三段，服务端用 `Create(name, start, main, end)` 落盘。联机客户端保存预设也保留分段（不再折叠进 Main）。
有目标弹匣时，新增弹药和增加分组数量不得超过其剩余容量；拖入时固定增加 1 发，空间用尽后禁用添加。空槽仍可编辑通用预设。
加载长预设或切换小弹匣不会自动删改编排；超量编排可以减少数量，实际装填按末尾截取。
库存按具体弹种 ID 保存，未知弹种保留；无效库存数据保留原 XML 并禁用后端。
请求最多 96 段、4096 发；服务端校验访问权限、目标实体、库存版本及数量。

```powershell
dotnet run --project .Test/AmmoLoader/AmmoLoaderRegression/AmmoLoaderRegression.csproj
dotnet run --project .Test/AmmoLoader/AmmoLoaderNetworkRegression/ClientNetwork.csproj
dotnet run --project .Test/AmmoLoader/AmmoLoaderNetworkRegression/ServerNetwork.csproj
dotnet run --project .Test/AmmoLoader/AmmoLoaderDragRegression/AmmoLoaderDragRegression.csproj
```

库存、装卸与网络回归编译实际后端代码，游戏边界使用桩对象；UI 回归直接加载本机游戏 DLL。
构建覆盖 Windows/Linux/Mac 的 Client/Server。以上离线检查不等于游戏内试航或双客户端验证。
2026-11-07 补装改动前的实机验证通过：投料过滤、分组/逐发编排、预设保存与加载、混装和卸弹数量守恒、
超容量/缺弹/非空弹匣拒绝、测试潜艇存档重载，以及通过武器 `Item.Use` 逐发核对六发混装弹序与消耗。
独立本机服务端与一个客户端的装卸同步、断线重连通过，使用 LuaCs、VCE、测试包的最小模组组合。
完整模组组合的联机回合在 EA-HI 角色物品栏同步时报数组越界；双客户端争用、公网延迟和战役跨关仍未验证。
非空补装和超容量截取已纳入离线回归，尚未重新进行游戏内或联机验证。
取货新增离线回归覆盖最大包装选择、余量包、容器索引、满槽/放入失败、重复及无权限请求、排队期间装填、库存保存重载；
原生 GUI 回归覆盖多种槽数/行数、三种窗口尺寸、模式切换与库存点击路由。以上取货检查尚未替代实机存档和联机验证。
自定义供弹回归覆盖混装共享预算、现存优先、多箱扣耗、失败回滚、箱子移走、无效适配器、快照校验及界面供给显示。
这些是离线后端/原生 GUI 检查，尚未完成 DDA 实际接入或游戏内多人验证。

## 可回填的供给存储

组件 XML 可设 `usesupplystorage="true"`：卸弹、投入弹药包优先回填匹配的供给容器，
缺少匹配来源或容器已满时，剩余整数发数回到机器库存。装填和取包先使用库存，不足部分扣除供给。
此模式使用 `stockandsupply` 本地化标签；DDA 分两行显示库存和弹药箱数量，采用固定字号，缺箱时仍显示弹药箱 0。
空供给容器留在投料口供再次回填。默认关闭，保持原来的入库、卸弹和仅从库存取包行为。
回填与扣耗使用同一套 Condition 事务；任一写入失败时恢复来源与原弹匣。

组件 XML 可设 `textprefix="yourmod.ammoloader."`，按组件覆盖界面文本；缺少的键回退到
`vce.ammoloader.*`。`intake`、`intakehint`、`unload`、`unloadhint`、`withdrawmodehint` 等
模组专用文案放在调用模组的文本文件中。文本覆盖不改变投料槽的尺寸、位置或间距。

离线回归覆盖混装回填、缺箱/满箱回库、浮点精度、异常回滚、库存溢出、取包时来源移走、
空箱保留与包装再投料；原生 GUI 回归检查三种窗口尺寸下文本覆盖和槽位矩形完全一致。
