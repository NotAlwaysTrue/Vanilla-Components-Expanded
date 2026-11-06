# VCE AmmoLoader

装弹机沿用 VCE 的现有工程，代码分别位于：

- `ClientProject/ClientSource/AmmoLoader`：界面、玩家预设和客户端同步。
- `ServerProject/ServerSource/AmmoLoader`：服务端校验与同步。
- `SharedProject/SharedSource/AmmoLoader`：库存、弹药包、编排和装卸逻辑。

统一编译进 `VanillaComponentsExpandedClient.dll` / `VanillaComponentsExpandedServer.dll`，
由现有 `VCEPlugin` 注册组件。PluginInfo.xml 每个平台/运行端只指定一个主程序集。

## XML 接入

机器的功能标识是 **`<AmmoLoader>` 组件**，不检查物品 identifier。
和原版 Fabricator 一样，机器另配两个 ItemContainer；索引从 0 开始。
目标容器必须只有一格，且应禁止堆叠。投料容器的容量可以调整。

```xml
<AmmoLoader canbeselected="true" msg="ItemMsgInteractSelect"
            inputcontainerindex="0" targetcontainerindex="1">
  <GuiFrame relativesize="0.75,0.78" minsize="900,600" anchor="Center" style="ItemUI" />
</AmmoLoader>
<ItemContainer capacity="6" slotsperrow="6" maxstacksize="1"
               canbeselected="true" hideitems="true" allowuioverlap="true" uilabel="">
  <Containable items="vceammopackage" />
</ItemContainer>
<ItemContainer capacity="1" maxstacksize="1"
               canbeselected="true" hideitems="true" allowuioverlap="true" uilabel="">
  <Containable items="vcevirtualmagazine" />
</ItemContainer>
```

每个弹药包物品添加 `vceammopackage` tag 和组件：

```xml
<AmmoPackage projectileidentifier="your_round_identifier" amount="120" />
```

弹种必须是具有 Projectile 组件的具体 ItemPrefab；一包兑换固定整数发数，
不按耐久百分比折算。无效、破损、包含其他物品的包不消耗。
`Redeemed` 是内部存档字段，不要在物品预制体中设置。

弹匣使用现有 `<VirtualizedMagazine AllowedAmmoTags="your_ammo_tag" />`，
并添加 `vcevirtualmagazine` tag，以便放入示例机器。弹匣应使用 `maxstacksize="1"`。
上述两个 tag 只用于示例机器的容器过滤，其他模组可换成自己的 Containable 条件；
实际兑换和装填仍检查对应组件。

`XML/Items.xml` 定义了可在编辑器机械分类中放置的 `vceammoloader`，
随 VCE 默认加载，中文名称为“通用装弹机”。
没有添加购买、制造配方或替换已有机器。
`.Test/AmmoLoaderItems.xml` 提供 30 发测试弹匣、120 发普通霰弹包和 24 发钝头弹包，
随现有可选依赖 `VCELOCALTESTPKG` 的测试内容加载。

## 行为

- 弹药包放入后由服务端/单机逻辑每 0.25 秒扫描入库；兑换标记与库存一起存档，
  等待删除的包不会重复兑换。编辑器非试航状态不会消耗弹药包。
- 库存按具体弹种 ID 聚合保存；缺少弹药模组时保留原 ID 和数量。
  无效库存存档保留原 XML，并停用机器，避免静默清空。
- 放入弹匣后，库存与预设仅显示兼容项；空槽显示全部。
  实际弹序只读，装填检查显示“需求 / 库存”。
- 编排从上到下表示出膛顺序。相邻同弹种合并，支持改数量、上下移动、删除。
  加载预设只改编排；覆盖未保存编排需要再按一次加载。
- 完整计划一次完成装填；要求空弹匣，先检查容量、兼容性和全部库存。
  卸弹直接返还机器库存。第一版没有装填计时、耗电和中途停止任务。
- 单次计划最多 96 段、4096 发，保持客户端请求小于游戏事件预算。
  库存与弹匣状态分段同步，服务端重验访问权限、目标实体和机器版本。
- 玩家预设保存在游戏单机存档目录下的 `VCE/AmmoLoaderPresets.json`，
  支持保存、删除、排序。已有 MagazinePrefab 作为只读模组预设。
  写入使用临时文件替换；损坏的预设文件不会自动覆盖。
- 弹匣恢复字段现在替换原序列，重复恢复不会追加子弹；弹匣自身同步弹序，
  不依赖它是否仍在机器中。射击、工厂装填、合并等现有更新路径均发送状态。

## 验证

```powershell
dotnet build CsProjectSource/ClientProject/WindowsClient.csproj -c Release
dotnet build CsProjectSource/ServerProject/WindowsServer.csproj -c Release
dotnet run --project .Test/AmmoLoaderRegression/AmmoLoaderRegression.csproj
dotnet run --project .Test/AmmoLoaderNetworkRegression/ClientNetwork.csproj
dotnet run --project .Test/AmmoLoaderNetworkRegression/ServerNetwork.csproj
dotnet run --project .Test/PluginLoadRegression/PluginLoadRegression.csproj -- Client
dotnet run --project .Test/PluginLoadRegression/PluginLoadRegression.csproj -- Server
dotnet run --project .Test/AmmoLoaderDragRegression/AmmoLoaderDragRegression.csproj
```

离线检查编译实际库存、装填逻辑与服务端请求处理器，游戏 API 使用桩对象。
覆盖数量守恒、缺弹/溢出时原子拒绝、混装顺序、存档重复恢复、未知弹种保留、
重复投料/请求、权限与目标校验、外部组件抛错回滚和状态分段大小。
弹匣网络测试编译实际的客户端/服务端同步代码，检查分段、乱序、旧状态拒绝、空匣、
射击后的状态更新，以及中途加入时生成的状态。
插件加载检查使用 .NET 9，从模组根目录运行，直接调用本机游戏 DLL 的插件加载器，
核对六种平台/运行端的主程序集清单及 SWR、弹匣、装弹机、弹药包的实际注册结果。
界面回归使用真实游戏 DLL，检查三种分辨率下拖动方向/边界，以及清空后重新输入多位发数。
2026-11-07 单机编辑器试航已验证居中与四向拖动、弹药包投料、弹匣拖放、多位数量输入、
编排调序、20 发普通霰弹 + 10 发橡胶弹混装及库存扣减、卸弹全额返还、超容量禁用装填，
以及预设保存/清空/加载、覆盖提示清除和游戏重启后的预设读取。
仍需验证机器库存与弹匣的存档重载、真实射击，以及双客户端争用和中途加入。
