# TrajectoryCalculator

- Type: `VCE_SRW.TrajectoryCalculator : ItemComponent` (shared shell) plus a client-side drawing part
- XML element: `<TrajectoryCalculator>`
- Sources: `SharedSource/SwitchableRangedWeapon/TrajectoryCaculator.cs`,
  `ClientSource/SwitchableRangedWeapon/TrajectoryCaculator.cs`
- Related setting: `SRW_CaculatorStepPerSecond` (default `6`, range `1`-`60`)

## Overview

A **client-only** helper component for weapons: while the player holds the aim key and holds that weapon, it
simulates projectile flight at a fixed step and draws the predicted trajectory. It never changes real firing
parameters, and the server does not participate.

`DrawHUD` returns early when any of these is true: `ShouldDrawTrajectory = false`, no character, the aim key is not
held, the character cannot aim, a "focus on selected" item view is open, or the weapon is not in hand.

## Properties

| Category | Property Name | Property Type | Purpose | Supported Values | Default | Notes |
| --- | --- | --- | --- | --- | --- | --- |
| Misc | `ShouldDrawTrajectory` | bool | Whether the predicted trajectory is drawn | `true` / `false` | `true` | Disabling it keeps the component but draws nothing |
| Misc | `TimeOfFly` | float | Maximum simulated flight time (seconds) | Positive number | `1` | **Only affects the calculation**; does not change the real projectile lifetime |
| Misc | `DrawColor` | Color | Line color | `R,G,B,A` in XML | `Color.Blue` | Includes alpha, e.g. `255,0,0,128` |

> `SRW_CaculatorStepPerSecond` is a **global setting** (plugin settings UI), not an XML attribute; it controls how many
> simulation steps run per second - higher is more accurate and more expensive.

## Calculation

- Step length = `1 / SRW_CaculatorStepPerSecond`, advanced over `TimeOfFly`;
- Each step samples the position under the assumed gravity, initial speed and drag, then the samples are joined into a
  line;
- No script API is exposed; it is purely a HUD effect.

## Example

```xml
<Item identifier="sample_marksman_rifle" ...>
  <RangedWeapon reload="1.2" ProjectileCount="1" />

  <SwitchableRangedWeapon switchableFiremodes="Semi,Burst" shotsPerBurst="3" burstReload="0.15">
    <TrajectoryCalculator ShouldDrawTrajectory="true" TimeOfFly="2" DrawColor="0,255,0,180" />
  </SwitchableRangedWeapon>
</Item>
```

## Notes

- The component only exists in the client build (`ClientProject`); in the server build `TrajectoryCalculator` is an empty
  shell, so keeping it in XML does not break the server.
- `TimeOfFly` only truncates the preview line; it neither extends nor shortens actual projectile lifetime.
- The prediction uses the current aim angle and the current ammo type; switching ammo is picked up on the next frame
  automatically.
- The related setting key is `SRW.CaculatorStepPerSecond` (note the `Caculator` spelling in the source).
