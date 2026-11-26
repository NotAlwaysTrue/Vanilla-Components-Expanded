# AmmoLoader

- Type: `VCE_VirtualizedMagazine.AmmoLoader : ItemComponent` (network: `IServerSerializable` / `IClientSerializable`)
- XML element: `<AmmoLoader>`
- Sources: `SharedSource/VirtualizedMagazine/AmmoLoader/` (`AmmoLoader.cs`, `AmmoLoader.Snapshot.cs`,
  `AmmoLoader.Supply.cs`, `AmmoPlan.cs`, `AmmoStock.cs`, `MagazinePresetLibrary.cs`);
  UI in `ClientSource/VirtualizedMagazine/AmmoLoader/AmmoLoader.UI.cs`; server commands in
  `ServerSource/VirtualizedMagazine/AmmoLoader/AmmoLoader.Server.cs`

## Overview

An "ammo warehouse + loading bench":

1. Absorbs `<VirtualizedAmmoStorage>` packages from the **input container** into a machine stock
   (ammo identifier -> count);
2. The player arranges a firing order in the UI (Start / Main / End sections) and presses Load;
3. The machine writes the rounds into the selected `<VirtualizedMagazine>` inside the **target container** and moves the
   loaded magazine to the **output container**.

In multiplayer the stock, presets and loading are all executed by the authority (host / dedicated server); clients only
send requests and display snapshots.

## Properties

| Category | Property Name | Property Type | Purpose | Supported Values | Default | Notes |
| --- | --- | --- | --- | --- | --- | --- |
| Container | `InputContainerIndex` | int | Index of the input container in the item's own `<ItemContainer>` list | `0 ..` | `0` | `IsPropertySaveable.No`, not written to saves |
| Container | `TargetContainerIndex` | int | Index of the target container (magazines / magazine rack) | `0 ..` | `2` | Capacity must be >= 1; may be a multi-slot rack |
| Container | `OutputContainerIndex` | int | Index of the output container | `0 ..` | `1` | Nulled when it equals input or target (no output) |
| Stock | `UseSupplyStorage` | bool | Use external "supply pools" instead of the internal stock | `true` / `false` | `false` | Supplies come from the code hook `SupplyResolver`, see below |
| UI | `TextPrefix` | string | Prefix for UI localization keys | String | `""` | Empty means the default keys |

**Hard requirements** (checked in `OnItemLoaded`; failures log a console warning and null the input/target):

- The item needs at least 3 `ItemContainer`s (input, target and output may reuse containers by index);
- Input and target containers must differ;
- Target capacity >= 1 (a rack provides several selectable slots);
- An output container equal to input or target is treated as "no output";
- The machine's own `Condition > 0`.

## UI

| Window | Contents |
| --- | --- |
| Main window | Left: order editor (Start / Main / End sections, drag to sort, edit per-group counts, AutoRepeat checkbox); middle: current magazine contents (summarized per ammo type as `xN`); bottom: machine stock list and load check; top right: Load / Unload |
| Item I/O window | Input slot, target magazine slots (arrows on the right select the active rack slot), output slot; draggable title bar |
| Preset window | Compatible preset list, save/delete, drag to reorder; presets that exist only on this machine are greyed out with an "Upload" button |

Interaction:

- **Click** an ammo tile in the stock -> withdraw one ammo package to the output slot;
- **Drag** an ammo tile -> insert at the pointer position in the order list, or append to a preset;
- **Drag** a preset name -> reorder presets;
- The **up/down arrows** next to the target slots switch rack slots (hidden with fewer than 3 slots); the active slot is
  outlined in green.

## Order (plan) semantics

- The list reads **top to bottom = firing order**: the top row fires first.
- The three sections map to `MagazinePrefab`'s `StartAmmoGroup` / `MainAmmoGroup` / `EndAmmoGroup`: Start at the top,
  End at the bottom, Main in the middle; with `AutoRepeat` on, Main repeats to fill the remaining space.
- Target capacity comes from the magazine's `MaxSize` (its item `MaxCondition`). What does not fit:
  - when the plan is longer than the free space, only the tail of the plan is loaded (`TakeLast`), the head stays in
    stock;
  - when the plan is shorter than the free space and AutoRepeat is on, the main section fills the rest.
- After a successful load the loaded magazine is moved to the output container; if the output does not accept it, the
  move silently fails (the magazine stays in place).

## Stock and ammo packages

- Absorption (input container scanned every 0.25 s): an item with `<VirtualizedAmmoStorage>`, no contained items,
  `Condition > 0`, and a `ProjectileIdentifier` that resolves to a real item with `<Projectile>` -> its (floored)
  `Condition` is added to the stock and the package is removed.
- Withdrawing finds an **ammo package prefab** by identifier: it must carry the tag `vceammopackage`, have a
  `<VirtualizedAmmoStorage>`, and must not have its own `<ItemContainer>`; among candidates the highest `Health` wins
  (ties broken by ordinal identifier).
- The output container must accept the package, otherwise the UI reports "output full / not accepted".

## Presets

- Content package presets: `<MagazinePrefab>` (see [VirtualizedMagazine.md](VirtualizedMagazine.md)), read-only.
- Player presets: one file per preset, `<Name>_Magazine.xml`, same format, holding the three `AmmoGroup` sections.
- Location: `SettingsService.SaveFolder\CustomMagazinePrefab\`
  - singleplayer and multiplayer clients: the root folder (a client's files are "upload candidates");
  - multiplayer host / dedicated server: `CustomMagazinePrefab\Server\` (the authority's published list).
- Read only on game load (postfix on `SaveUtil.LoadGame`) and on start (`OnContentLoaded`); written only on save
  (postfix on `SaveUtil.SaveGame`). `Save()` only deletes files it previously loaded, so hand-written or corrupt files
  survive.
- Multiplayer: the client list is published by the server; save/delete/reorder/load all go through command requests and
  the authority re-publishes the list immediately.
- `Load()` **preserves the prefab's container indices**: the `InputContainerIndex/TargetContainerIndex/OutputContainerIndex`
  stored in an old save will not override the current XML container order, so submarine saves cannot desync from a newer
  prefab.

## Multiplayer sync

- Stock snapshot: JSON, split into 128-character pages; when larger than one page it is Brotli(quality 1) + Base64 with
  a `~` prefix; each machine caches pages per `(revision, Stock.Version)`.
- The preset list uses its own message kind (0 = state page, 1 = preset list) instead of sharing the periodic state.
- Client commands (`Command` enum): `Refresh`, `Load`, `Unload`, `Withdraw`, `SavePreset`, `DeletePreset`, `MovePreset`,
  `SelectSlot`.
- The component must accept every event type it ever emits (`ValidateEventData`); otherwise `CreateServerEvent` /
  `CreateClientEvent` throw immediately (magazine pages and the preset list are separate event kinds).

## External supply (code API, not XML)

With `UseSupplyStorage = true` the machine stops pricing from the internal stock and calls:

```csharp
loader.SupplyResolver = item => new AmmoSupplyDefinition(
    PoolId: "reactor_cell",
    Costs: new Dictionary<string, double> { ["shotgunshell"] = 1.0 });
```

- Every input item returning non-null provides a share of a "shared Condition budget"; sources with the same `PoolId`
  are merged;
- All sources in one pool must have identical `Costs`, and each ammo type may belong to only one pool;
- Loading / withdrawing debits the pool by `ammo -> cost`; an invalid configuration degrades the machine to
  "stored ammo only" with a warning.

## Example

```xml
<Item identifier="vceammoloader" name="" ... health="200" ...>
  <ItemContainer capacity="1" ... />   <!-- 0: input -->
  <ItemContainer capacity="1" ... />   <!-- 1: output -->
  <ItemContainer capacity="4" ... />   <!-- 2: target magazine rack -->

  <AmmoLoader InputContainerIndex="0" TargetContainerIndex="2" OutputContainerIndex="1" />
</Item>
```

## Notes

- The **order of appearance** of the three `<ItemContainer>` elements defines the indices; reordering them in XML
  changes the default mapping.
- Items in the target container must be `<VirtualizedMagazine>`, otherwise the UI shows "insert a magazine".
- The output container's `<Containable>` must include `vceammopackage` (withdrawing) and `vcevirtualmagazine` (moving a
  loaded magazine out), otherwise the corresponding action silently fails.
- Machine stock **is saved with the item**: `Save()` writes `<Stock><Ammo id="..." count="..." /></Stock>` and `Load()`
  reads it back. If the saved stock is invalid (duplicate/negative/overflow) the element is preserved verbatim and a
  console warning "stock preserved but disabled" is logged; only then must the stock be rebuilt from the input container.
- A load succeeds only when the target magazine is not full, the plan is valid, stock/supply is sufficient, and the ammo
  is compatible with the magazine's `AllowedAmmoTags`; any failure rolls back and only shows a status text - no partial
  load is left behind (`TryLoad` restores the original round stack on failure).
