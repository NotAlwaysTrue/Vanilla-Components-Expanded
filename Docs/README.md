# Vanilla Components Expanded - Subsystem Documentation

This directory documents the currently implemented subsystems in the same structure as `English.xlsx` (the legacy
subsystem workbook): one table per component with the columns
**Category / Property Name / Property Type / Purpose / Supported Values / Default / Notes**, followed by behavior
notes and examples.

All content is derived from the **current source** (Barotrauma 1.15.x, `CsProjectSource/`); outdated defaults and
signatures from the old workbook are not carried over.

## Documentation index

| Document | Subsystem | Component / type | Summary |
| --- | --- | --- | --- |
| [SwitchableRangedWeapon.md](SwitchableRangedWeapon.md) | Switchable weapon | `SwitchableRangedWeapon` | A `RangedWeapon` that switches between fire modes and projectile sources |
| [BackpackFedWeapon.md](BackpackFedWeapon.md) | Backpack-fed weapon | `BackpackFedWeapon` | A `SwitchableRangedWeapon` that draws ammo from its own containers or the worn backpack |
| [TrajectoryCalculator.md](TrajectoryCalculator.md) | Trajectory calculator | `TrajectoryCalculator` | Client-side predicted trajectory while aiming |
| [AirburstProjectile.md](AirburstProjectile.md) | Airburst ammunition | `AirburstProjectile` | Programs a physical round's fuse from the cursor distance at launch |
| [GuidedProjectile.md](GuidedProjectile.md) | Guided ammunition | `GuidedProjectile`, `GuidanceDataLink`, `CentralFireControl`, `GuidanceThruster` | Manual steering, target tracking, illumination, waypoints, and optional propulsion |
| [NightVision.md](NightVision.md) | Night vision | `NightVision` | Wearable world filter with adjustable ambient light and thermal outlines |
| [VoidShield.md](VoidShield.md) | Void shield | `VoidShield` | Toggleable physics collider that intercepts non-hitscan projectiles |
| [ActiveProtectionSystem.md](ActiveProtectionSystem.md) | Active protection system | `ActiveProtectionSystem` | Scans nearby flying objects and intercepts/detonates them with a chance |
| [ArmorSystem.md](ArmorSystem.md) | Armor system | `ArmorPrefab` / `ArmorPrefabFile` | Data-driven armor damage reduction, ricochet and durability |
| [VirtualizedMagazine.md](VirtualizedMagazine.md) | Virtualized magazine | `VirtualizedMagazine` and companions | A magazine whose whole round stack is one `Condition` value |
| [AmmoLoader.md](AmmoLoader.md) | Universal ammo loader | `AmmoLoader` | Stores ammo packages and loads magazines in a configured order |

## Conventions

- **XML element name = component class name.** All item components are registered in the `ictypes` array in
  `SharedProject/SharedSource/Plugin.cs`: `SwitchableRangedWeapon`, `BackpackFedWeapon`, `TrajectoryCalculator`,
  `VirtualizedMagazine`, `VirtualizedMagazineFactory`, `VirtualizedMagazineLoader`, `VirtualizedProjectile`,
  `VirtualizedAmmoStorage`, `ActiveProtectionSystem`, `AmmoLoader`, `AirburstProjectile`, `GuidedProjectile`,
  `GuidanceDataLink`, `CentralFireControl`, `GuidanceThruster`, `NightVision`.
- **Attribute names are case-insensitive** (`ContentXElement.GetAttribute*` matching rules); the tables keep the
  spelling used in the source.
- **Defaults come from two places**: the value on `[Serialize(...)]` and the default passed to `GetAttribute*` in the
  constructor. When they differ the constructor wins (it runs after the base class parsed the element); the tables
  mark such cases with "(ctor)".
- **Units**: under `ConvertUnits`, 1 metre = 1 sim unit = 100 display units. `<Body width/height>` and shield sizes are
  in display units (pixels); `ActiveProtectionSystem` `minsize`/`maxsize` are in metres.
- **Condition**: several modules reuse `Item.Condition` as a "count" (rounds inside a magazine, rounds inside an ammo
  package, machine wear). For those items `health` / `maxcondition` is also the capacity.
- **Client / server**: sources are compiled per platform with `#if CLIENT` / `#if SERVER`.
  `ClientProject` compiles only `ClientSource` + `SharedProject.projitems`, `ServerProject` only `ServerSource` +
  shared items. Everything described as "authority" (loading, stock consumption, armor resolution) only exists on the
  server/host.
- **Content package registration**: custom prefab files are registered from the content package XML with a singular or
  plural element, e.g. `<MagazinePrefab file="%ModDir%/.Test/MagazinePrefabs.xml" />` and
  `<ArmorPrefab file="%ModDir%/.Test/ArmorPrefabs.xml" />` (see `filelist.xml` in the repository root).

## Source layout

| Layer | Path |
| --- | --- |
| Shared (both builds) | `CsProjectSource/SharedProject/SharedSource/<subsystem>/` |
| Client | `CsProjectSource/ClientProject/ClientSource/<subsystem>/` |
| Server | `CsProjectSource/ServerProject/ServerSource/<subsystem>/` |
| Test XML | `.Test/` (`testItems.xml`, `MagazinePrefabs.xml`, `ArmorPrefabs.xml`) |
| Localization | `XML/English.xml`, `XML/Chinese.xml` |
