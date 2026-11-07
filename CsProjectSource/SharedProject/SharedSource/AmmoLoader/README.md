# VCE AmmoLoader

## 职责与维护边界

装弹机仅注册一个 `AmmoLoader` 组件，使用 partial 分文件维护 UI、库存、装卸、存档和网络。装弹机专用代码统一放在各工程的 `AmmoLoader` 目录；后端和网络仍交由 VirtualizedMagazine 维护者负责。

- `ClientProject/ClientSource/AmmoLoader/AmmoLoader.UI.cs` 与 `AmmoPresets.cs`：界面、编排编辑和玩家本地预设。
- `SharedProject/SharedSource/AmmoLoader/AmmoLoader.cs`：容器绑定、入库、装卸事务、库存存档及权威端校验。
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
- `AmmoRun[]` 从上到下表示出膛顺序。后端转换为 VirtualizedMagazine 接口所需的栈底优先顺序。

兼容性由 `VirtualizedMagazine.IsAmmoCompatible` 判断，投射物组件查询复用 `ElementHelper`。
`LoadedAmmoIdentifiersArray` 保持原有追加语义；完整网络快照和装卸回滚在各自调用处显式清空后恢复弹序。
模组预设统一通过 `MagazinePrefab.CreateAmmoArray(capacity)` 展开，工厂与 UI 共用；返回数组为栈底优先。
玩家本地预设仍保存至单机存档目录下的 `VCE/AmmoLoaderPresets.json`。

## XML 接入

`AmmoLoader` 同时配置容器索引和 GuiFrame。XML 容器按界面从左到右排列：投料 0、取货 1、弹匣 2。
投料和取货各自使用 `capacity`、`slotsperrow` 定义槽数与行数；目标弹匣容器必须单格、不堆叠。

```xml
<AmmoLoader inputcontainerindex="0" outputcontainerindex="1" targetcontainerindex="2"
            canbeselected="true" msg="ItemMsgInteractSelect">
  <GuiFrame relativesize="0.75,0.78" minsize="900,600" anchor="Center" style="ItemUI" />
</AmmoLoader>
<ItemContainer capacity="6" slotsperrow="6" maxstacksize="1"
               canbeselected="true" hideitems="true" allowuioverlap="true" uilabel="">
  <Containable items="vceammopackage" />
</ItemContainer>
<ItemContainer capacity="6" slotsperrow="6" maxstacksize="1"
               canbeselected="true" hideitems="true" allowuioverlap="true" uilabel="">
  <Containable items="vceammopackage" />
</ItemContainer>
<ItemContainer capacity="1" maxstacksize="1"
               canbeselected="true" hideitems="true" allowuioverlap="true" uilabel="">
  <Containable items="vcevirtualmagazine" />
</ItemContainer>
```

弹药来源添加 `vceammopackage` 标签，并使用现有 `<VirtualizedAmmoStorage ProjectileIdentifier="your_round_identifier" />`。
与现有 VCE 装填器一致，物品当前 Condition 表示剩余发数，MaxCondition 表示容量。
例如 120 发新弹药包设置 `health="120"`。入库读取剩余整数发数，先清零 Condition，再排队移除物品，防止重复入库。
没有此组件、弹种无效或包含其他物品的来源不入库。编辑器非试航状态不消耗来源。
投料口仅允许带 `vceammopackage` 标签的物品；后端仍检查储弹组件和弹药有效性，不符合条件的物品留在原位。

勾选底部“弹药包取货”文字后的方框，点击库存弹种取出一包；不修改编排，不使用“每次添加”数量，也不受当前弹匣容量或弹种过滤限制。
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
相邻同弹种合并，支持分组/逐发拖拽与删除、预设保存/排序、兼容项过滤和弹药图标。加载预设覆盖未保存编排时弹窗确认，取消保留当前编排。
有目标弹匣时，新增弹药和增加分组数量不得超过其剩余容量；点击添加时自动取批量数量与编排剩余空间的较小值，不修改“每次添加”设置，空间用尽后禁用添加。空槽仍可编辑通用预设。
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
