# SwitchableRangedWeapon

- Type: `VCE_SRW.SwitchableRangedWeapon : RangedWeapon`
- XML element: `<SwitchableRangedWeapon>`
- Sources: `SharedSource/SwitchableRangedWeapon/SwitchableRangedWeapon.cs` (logic),
  `ClientSource/SwitchableRangedWeapon/SwitchableRangedWeapon.cs` (HUD and input),
  `ClientSource/SwitchableRangedWeapon/SwitchInputPatch.cs` (input filtering),
  `ClientSource/UtilClient/VCEKeySetting.cs` (key binding GUI)
- Companions: `<TrajectoryCalculator>` can be added to the same item; `<BackpackFedWeapon>` is a subclass.

## Overview

Adds two kinds of "tiers" on top of the vanilla `RangedWeapon`:

1. **Fire modes**: `Safe` / `Auto` / `Semi` / `Burst`, listed by `switchableFiremodes` and cycled at runtime.
2. **Projectile / slot selection**: either `switchableSlots` (own container slot indices) or the legacy
   `switchableProjectiles` (tags / identifiers).

While the aim key is held, the HUD shows the current fire mode and the current projectile source next to the
crosshair. Switching sends an entity event so the server sees the same state.

## Properties

| Category | Property Name | Property Type | Purpose | Supported Values | Default | Notes |
| --- | --- | --- | --- | --- | --- | --- |
| Fire mode | `switchableFiremodes` | List of strings | Selectable fire modes | `Safe`, `Auto`, `Semi`, `Burst` (case-insensitive) | `Auto` | An empty list or all-invalid entries falls back to a single `Auto`; invalid entries log a console warning |
| Fire mode | `currentFireModeSelected` | Integer | Index of the active fire mode (saved, editable in game) | `0 .. switchableFiremodes.Count-1` | `0` | Out-of-range values fall back to `0` |
| Fire mode | `burstReload` | float | Delay between shots in Burst mode (seconds) | Any non-negative number | `0` | Replaces `reload` in Burst mode only; negative values are clamped to 0 |
| Fire mode | `shotsPerBurst` | Integer | Maximum shots per trigger pull | Any integer | `0` | With `0`, Burst mode cannot fire at all |
| Fire mode | `triggerReleased` | bool | Whether the trigger has been released | `true` / `false` | `true` | Setting `true` clears the current burst counter; the client syncs it with an entity event when the shoot key is released |
| Selection | `switchableProjectiles` | List of tags / identifiers | Legacy set of selectable ammo | Item tag or prefab identifier | empty | **Legacy**: completely ignored when `switchableSlots` is non-empty |
| Selection | `switchableSlots` | List of integers | Own container slots that may provide the projectile | Container slot indices | empty | When non-empty it **overrides** `switchableProjectiles` and defines the number of selectable tiers |
| Selection | `currentProjectileSelected` | Integer | Active projectile / slot index (editable in game) | `0 .. maxselectable-1` | `0` | Out-of-range values fall back to `0` |
| Misc | `checkMagCondition` | bool | Whether ammo / magazine Condition is checked | `true` / `false` | `true` | When disabled, ammo with Condition 0 can still be fired |
| Misc | `ProjectileSpreadModifier` | float | Spread added to the **projectile** (not the weapon) when firing | Any float | `0` | `IsPropertySaveable.No`: not written to saves, instance-only |
| Bot | `botreload` | float | Fire interval for bots in Semi/Burst (seconds) | Non-negative | `Lerp(reload, reload*4, 1-reload)` | Only used by `ShouldBotShoot` when the shooter is a bot in Semi/Burst |

> SideNote: the component inherits `RangedWeapon`, so every other `RangedWeapon` parameter (`reload`,
> `ProjectileCount`, `Spread`, `LaunchImpulse`, `RequireAimToUse`, skill requirements, ...) still applies normally.

## Behavior

### Tiers and indices

- `maxselectable` = `switchableSlots.Count` (if >0) -> else `switchableProjectiles.Count` (if >0) -> else `1`.
- Only when `maxselectable > 1` is the projectile HUD shown and projectile switching allowed.
- Only when `switchableFiremodes.Count > 1` is the fire mode HUD shown and mode switching allowed.

### `Use(float, Character?)` flow

1. `Safe` returns `false` immediately; `Semi` returns `false` when this trigger pull already fired one shot;
   `Burst` returns `false` when `shotsPerBurst` shots have been fired for this pull.
2. Bots are additionally gated by `BotReloadTimer` (`ShouldBotShoot`); players are not gated by that timer.
3. After aim / charge / `ReloadTimer` checks, the per-shot reload time is computed from
   `burstReload` (Burst) or `reload` (others), modified by weapon skill, dual-wield penalty,
   `RangedAttackSpeed` and the quality `FiringRateMultiplier`.
4. Loops `ProjectileCount` times to fetch and fire projectiles; every shot adds `ProjectileSpreadModifier`,
   the first shot applies recoil to the weapon, then `roundsshot += 1`, `triggerReleased = false` and
   `BotReloadTimer` is refreshed.

### Projectile lookup (`FindProjectile`)

- When `switchableSlots` is non-empty (or `switchableProjectiles` is empty):
  use `switchableSlots[currentProjectileSelected]`; if that item has its own `<Projectile>` use it directly,
  otherwise search its `ownInventory` for the first item with a `Projectile` and `Container != null`.
- Only when `switchableProjectiles` is non-empty and `switchableSlots` is empty does the legacy path run:
  search the item's own inventory for the first item that has the tag or identifier and a `<Projectile>`.
- With `checkMagCondition = true`, `Condition <= 0` on either the ammo or its container makes the lookup fail.

### Input and HUD (client)

| Setting | Default | Description |
| --- | --- | --- |
| `SRW_SwitchKey` | `F` | Switch projectile / slot |
| `SRW_FireModeSwitchKey` | `B` | Switch fire mode |
| `SRW_CaculatorStepPerSecond` | `6` (range 1-60) | Steps per second used by `<TrajectoryCalculator>` |

- Settings appear in the plugin settings UI (`ShowInUI = true`) and store a `KeyOrMouse` value.
- Switching is only allowed when the character is `Character.Controlled`, not incapacitated, can aim, the game is not
  paused, no UI has focus, the **aim key is held**, and no "focus on selected" view is open; `SwitchInputPatch`
  ensures VCE keys do not swallow input when they overlap the Aim binding.
- HUD text uses the localization keys `SwitchableWeapon.<mode>` and `SwitchableWeapon.<index>`; slot mode also uses
  `firemode.primary` / `secondary` / `misc`.
- The subclass [BackpackFedWeapon](BackpackFedWeapon.md) handles the projectile key itself (it cycles
  `CurrentSlotIndex`) and overrides the HUD; the fire mode key still goes through this class.

## Example

```xml
<Item identifier="sample_switchable_rifle" ...>
  <RangedWeapon reload="0.5" ProjectileCount="1" Spread="0.05" />

  <SwitchableRangedWeapon
      switchableFiremodes="Safe,Semi,Burst"
      switchableSlots="0,1"
      shotsPerBurst="3"
      burstReload="0.12"
      botreload="0.9"
      checkMagCondition="true">
    <TrajectoryCalculator ShouldDrawTrajectory="true" TimeOfFly="1.2" DrawColor="255,0,0,128" />
  </SwitchableRangedWeapon>
</Item>
```

## Notes

- `shotsPerBurst` defaults to `0`: declaring `switchableFiremodes="Burst"` without it means **no shot is fired**.
- `triggerReleased` is a synced state: the client sends `ChangePropertyEventData` when the shoot key is released so the
  server resets `roundsshot`; do not pin it to `false` in XML.
- `ProjectileSpreadModifier` is not saved: it is back to 0 after loading and must be re-applied (e.g. by status
  effects).
- The component fires with `projectile.Shoot(..., createNetworkEvent: false)`; hit resolution relies on
  `ProjectileShootDispatcher` (the Harmony patch in the `VirtualizedMagazine` module) dispatching
  `Projectile.Shoot` to the concrete subclass's `new Shoot`.
