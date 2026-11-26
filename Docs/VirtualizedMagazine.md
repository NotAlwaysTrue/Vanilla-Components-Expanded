# VirtualizedMagazine

- Main type: `VCE_VirtualizedMagazine.VirtualizedMagazine : ItemContainer`
- XML elements: `<VirtualizedMagazine>` (plus `<VirtualizedMagazineFactory>`, `<VirtualizedMagazineLoader>`,
  `<VirtualizedAmmoStorage>`, `<VirtualizedProjectile>`)
- Sources: `SharedSource/VirtualizedMagazine/` (`VirtualizedMagazine.cs`, `MagazineUtil/`, `VirtualizedProjectile.cs`,
  `ProjectilePrefab.cs`, `Harmony/`); client half in `ClientSource/VirtualizedMagazine/`
- Companion: the loading machine is documented in [AmmoLoader.md](AmmoLoader.md)

## Overview

It collapses "which rounds are in this magazine" from a pile of physical rounds into **a stack of identifiers**:

- The magazine item itself is a capacity-1 `ItemContainer` that always spawns one `VCE_VirtualizedProjectile`
  (the real `VirtualizedProjectile` component), and every shot reuses it;
- Each round in the stack only stores the **ammo item identifier**; when firing, that ammo item's `<Projectile>` data is
  parsed onto the internal projectile (`ProjectilePrefab` parses each ammo type only once);
- `Item.Condition` is reused as the **current round count**, so `Item.MaxCondition` is the **magazine capacity**.

## Properties

| Category | Property Name | Property Type | Purpose | Supported Values | Default | Notes |
| --- | --- | --- | --- | --- | --- | --- |
| Ammo | `ProjectileIdentifiers` | List of identifiers | Rounds loaded at spawn | Ammo item identifiers | empty | The array order is **bottom to top**: the first element fires last |
| Ammo | `AllowedAmmoTags` | List of identifiers | Ammo tags that may be loaded | Item tags | empty | Empty means no restriction; matching uses the **ammo prefab's Tags** |
| Ammo | `UseAsAmmoStorage` | bool | Whether the internal projectile is spawned externally | `true` / `false` | `false` | Maps to `AlwaysContainedItemsSpawned`; rarely needs changing |
| Save | `LoadedAmmoIdentifiersArray` | Identifier array | Currently loaded rounds (save data) | - | empty | Serialized **bottom-first** (the opposite of the runtime stack) |

- **Capacity**: `MaxSize => (int)Item.MaxCondition`. The item's `health` / `maxcondition` must be greater than 0,
  otherwise nothing can be loaded.
- **Compatibility**: the ammo identifier must resolve to an `ItemPrefab`, and `AllowedAmmoTags` must be empty or that
  prefab must carry at least one of the tags.

## Runtime API

| Member | Type | Description |
| --- | --- | --- |
| `LoadedAmmoIdentifiers` | `Stack<Identifier>` | **Top of stack = next round** (`Use` does `TryPop`, `TopIdentifier` does `Peek`) |
| `LoadedAmmoIdentifiersArray` | `Identifier[]` | Save view, bottom-to-top; assignment goes through `LoadAmmoArray` |
| `LoadedCount` / `MaxSize` | int | Loaded rounds / capacity |
| `RoundsVersion` | uint | Incremented whenever the round list may have changed; used for cheap change detection |
| `TopIdentifier` | `Identifier` | Top round (the one about to fire) |
| `AllowedAmmoTags` | `ImmutableHashSet<Identifier>` | Allowed ammo tags |
| `LoadAmmoArray(ref List<Identifier>)` | method | `Push`es in list order (first element becomes the stack bottom); rejected rounds stay in the list |
| `PushAmmoArray(ref List<Identifier>)` | method | Alias of `LoadAmmoArray` |
| `UnLoadAmmoArray(out List<Identifier>)` | method | Clears the stack and returns the rounds (bottom-to-top) |
| `ReLoadAmmoArray(ref in, out ejected)` | method | Unload then load |
| `IsAmmoCompatible(Identifier)` | method | Compatibility check |
| `UpdateAmmoData(Item?)` | method | Syncs `Condition`, bumps `RoundsVersion`, parses the top round, refreshes item tags |
| `Use(float, Character?)` | override | Pops the top round and syncs |
| `Combine(Item, Character)` | override | Merges rounds with another magazine (see below) |

## Automatic tags

The component adds these tags to the **item instance** both in its constructor and in `OnItemLoaded`:

- `VCE_VirtualizedMagazine` (this component)
- `VCE_VirtualizedAmmoStorage` (when the item has a `<VirtualizedAmmoStorage>`)

`VirtualizedTags.ApplyPrefabTags()` then adds the same tags to the **prefab** during `OnContentLoaded` and copies them to
variants via `VariantOf`. Reason: runtime container filtering reads instance tags, while prefab-only pre-checks (for
example the sub-editor drag check) read `Prefab.Tags` - both sides must have them.

## Combining and stacking

- `Combine` takes over only when "the other magazine is not empty, this one is not full, and the other one also has this
  component"; it moves the other magazine's rounds into this one (rounds that do not fit are returned to the other in
  their original order), syncs both `Condition` values, and returns `true` to mean "handled - do not put both items in
  one slot".
- Vanilla `ItemSlot.CanBePut` refuses same-slot stacking when Condition differs;
  `Harmony/VirtualizedMagazineStackPatch.cs` forces `ignoreCondition = true` for pairs of the same
  VirtualizedMagazine prefab, so magazines with different round counts can share a slot (each remains a separate
  magazine inside that slot).
- Never put `canBeCombined="true"` on the `<Holdable>` of a prefab that has this component: vanilla would merge
  `Condition` on top of the round transfer.

## Internal projectile

- The internal container is fixed: `SpawnWithId="VCE_VirtualizedProjectile"`, capacity 1,
  `<Containable items="VCE_VirtualizedProjectile" />`, hidden, not selectable, indicator style `bullet`.
- The content package must therefore provide a prefab with identifier `VCE_VirtualizedProjectile` that carries a
  `<VirtualizedProjectile>` component, otherwise the magazine cannot fire.
- `VirtualizedProjectile` forces `Hitscan = true` and `RemoveOnHit = false`; every other value comes from the **ammo
  item's** `<Projectile>` element: `hitscancount`, `maxtargetstohit`, `spread`, `staticspread`, `friendlyfire`,
  `damagedoors`, `damageuser`, `gothroughlighttargets`, `lighttargetmassthreshold`, plus `<Attack>`,
  `<StatusEffect>` and `<ParticleEmitter>`.
- Visuals: the client plays tracers at the shot trajectory and impact effects at hit positions; particle emitters use
  `prefab.Properties.UseTracerPoints` (default `true`) for tracer points.

## Network sync

- The server is authoritative: after the rounds change it sends `LoadedAmmoIdentifiersArray` to clients in **pages**
  (128 identifiers per page, tagged with a `revision`; clients request missing pages with an `AmmoRequest` event).
- A client only replaces its local stack once every page has arrived (so a half-loaded magazine is never visible).
- Shooting itself goes through `VirtualShotNetwork` (`VirtualShotTrace` / `VirtualShotImpact`): clients and host each
  play the effects.

## Companion components

### `<VirtualizedMagazineFactory>`

| Property | Type | Default | Description |
| --- | --- | --- | --- |
| `SpawnImmediately` | bool | `true` | Manufacture as soon as the item spawns |
| `RemoveAfterSpawn` | bool | `true` | Remove the factory after manufacturing |
| `<MagazineData MagazineID="" MagazinePrefabID="" Amount="1"/>` | subelement | - | Spawns `Amount` copies of `MagazineID` loaded from `MagazinePrefabID` |

### `<VirtualizedMagazineLoader>`

| Property | Type | Default | Description |
| --- | --- | --- | --- |
| `DefaultLoadAmount` | int | `1` | Rounds pushed from the ammo package per use (property `PushAmount`) |

Requires own container `slot 0` to be an ammo package with `<VirtualizedAmmoStorage>` and `slot 1` to be the magazine;
the package's `Condition` is reduced by the number of rounds actually loaded.

### `<VirtualizedAmmoStorage>`

| Property | Type | Default | Description |
| --- | --- | --- | --- |
| `ProjectileIdentifier` | identifier | empty | The ammo this package represents |

Capacity = `Item.MaxCondition`; `Condition` is the remaining round count. The loading machine consumes it as an "ammo
package".

## `<MagazinePrefab>` data file

Register it from the content package with `<MagazinePrefab file="%ModDir%/.Test/MagazinePrefabs.xml" />`.

```xml
<MagazinePrefabs>
  <MagazinePrefab identifier="TEST" name="Test Preset" AutoRepeat="true">
    <StartAmmoGroup>   <!-- Top of the magazine: fires first -->
      <AmmoGroup ProjectileIdentifier="shotgunshell" amount="5" />
    </StartAmmoGroup>
    <MainAmmoGroup>    <!-- Middle: repeated to fill the remaining space when AutoRepeat is on -->
      <AmmoGroup ProjectileIdentifier="assaultrifleround" amount="5" />
    </MainAmmoGroup>
    <EndAmmoGroup>     <!-- Bottom of the magazine: fires last -->
      <AmmoGroup ProjectileIdentifier="shotgunshellblunt" amount="5" />
    </EndAmmoGroup>
  </MagazinePrefab>
</MagazinePrefabs>
```

- `MainAmmoGroup` has the alias `AmmoGroup`.
- `identifier` is required and must be unique among `MagazinePrefab.Prefabs`; `name` is the display name (defaults to the
  identifier).
- Within a group, rounds fire in **document order**; `amount` repeats that template a number of times.
- `AutoRepeat="true"` (default): loading repeats the main section until the remaining space is filled; `false` loads it
  once.
- When capacity is insufficient, the End section is kept first, then the Start section, and only then Main fills the rest.
- These prefabs are both content-package presets and the storage format of the loader's custom presets.

## Example

```xml
<Item identifier="sample_magazine" health="30" maxstacksize="8"
      tags="smallitem,vcevirtualmagazine" ...>
  <Body width="28" height="40" density="25" />
  <VirtualizedMagazine AllowedAmmoTags="sampleammo" ProjectileIdentifiers="sample_round" />
  <Holdable slots="Any,RightHand,LeftHand" ... />
</Item>
```

## Notes

- `health` / `maxcondition` **is** the magazine capacity: change it there, not through a `capacity` attribute.
- `ProjectileIdentifiers` is **bottom-to-top**, the opposite of "top row = fires first" in the UI.
- `AllowedAmmoTags` matches the ammo prefab's tags; an item with the tag but no `<Projectile>` can neither be loaded nor
  fired.
- The save field `LoadedAmmoIdentifiersArray` and the runtime `LoadedAmmoIdentifiers` run in opposite directions; mixing
  them reverses the firing order.
