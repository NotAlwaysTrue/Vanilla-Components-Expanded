# ActiveProtectionSystem

- Type: `VCE_APS.ActiveProtectionSystem : Powered`
- XML element: `<ActiveProtectionSystem>`
- Sources: `SharedSource/ActiveProtectionSystem/ActiveProtectionSystem.cs`,
  `SharedSource/ActiveProtectionSystem/HarmonyPatch.cs`

## Overview

An "active interception" device: it periodically scans nearby flying **non-hitscan** projectiles and throwables, filters
them by speed / mass / size / distance, and once line of sight and approach conditions hold it intercepts them with a
chance, optionally applying `Use`, removing the target, reducing its Condition, or detonating at its position.

Targets come from the static table `ActiveProtectionSystem.Projectiles`, maintained by Harmony patches:

- `Projectile.Shoot` postfix (only when `Hitscan == false`)
- `Throwable.SecondaryUse` postfix (throwables)
- `Item.Remove` postfix removes entries
- The round-ended hook `PluginRoundEndedDelegate` clears the whole table

## Properties

> The "Default" column uses the values from the **constructor** (`GetAttribute*`); where `[Serialize]` declares a
> different value it is mentioned in Notes, because the constructor runs after the base class has parsed the element and
> therefore wins.

| Category | Property Name | Property Type | Purpose | Supported Values | Default | Notes |
| --- | --- | --- | --- | --- | --- | --- |
| General | `range` | float | Working distance of the device (metres) | Positive number | `100` | Compared as a world-space straight-line distance |
| General | `probility` | float | Interception success chance | `0`-`1` | `1` | The source really spells it `probility`; `1` means always intercept |
| General | `maxspeed` | float | Maximum target speed (m/s) | Positive number | `0` | `[Serialize]` declares `50`; with `0` every target is rejected as too fast |
| General | `minspeed` | float | Minimum target speed (m/s) | Positive number | `100` | `[Serialize]` declares `10`; must be consistent with `maxspeed` |
| General | `minmass` | float | Minimum target mass (kg) | Non-negative | `0` | Uses `body.Mass` |
| General | `maxmass` | float | Maximum target mass (kg) | Positive number | `100` | `[Serialize]` declares `10000` |
| General | `minsize` | Vector2 | Minimum target size (metres) | `x,y` | `0,0` | Compared against `body.GetSize().Length()` |
| General | `maxsize` | Vector2 | Maximum target size (metres) | `x,y` | `1000,1000` | Same comparison; note these are metres, not pixels |
| General | `reducedcondition` | float | Condition removed from the target on each successful intercept | Non-negative | `0` | The property is `ReduceConditionOnIntercept`, the XML name differs |
| General | `useonintercept` | bool | Call `Use` on the target on intercept | `true` / `false` | `false` | Triggers the target's `OnUse` status effects |
| General | `removeonintercept` | bool | Remove the target on intercept | `true` / `false` | `false` | Queued through `EntitySpawner` |
| General | `functionininventory` | bool | Keep working while inside a container | `true` / `false` | `false` | By default it only works while placed / held |
| General | `interceptonlyapproaching` | bool | Only intercept targets flying towards the device | `true` / `false` | `true` | Uses the dot product of relative position and relative velocity |
| General | `createexplosiononintercept` | bool | Create an explosion at the intercept position | `true` / `false` | `false` | The attribute name is singular (`explosion`); needs an `<Explosion>` subelement |
| State | `ison` | bool | Whether the device is on | `true` / `false` | `false` | Editable in game; also drives `IsActive` |
| Subelement | `<Explosion>` | element | Explosion used on intercept | Any `Explosion` element | none | Without it `createexplosiononintercept` has no effect |

> SideNote: the component inherits `Powered`, so power supply / consumption parameters still follow the vanilla
> `Powered` component.

## Behavior

Every frame in `Update` (after `base.Update` handled power):

1. Clear `LastCheckedTargets` once it holds more than 10 entries (each target is processed once per round of checks).
2. Return immediately when the device has `Condition <= 0`, is off, or is contained without `functionininventory`.
3. Walk the target table and skip entries when:
   distance `> range`; size outside `minsize..maxsize`; speed outside `minspeed..maxspeed`;
   mass outside `minmass..maxmass`; not approaching while `interceptonlyapproaching`; or
   `Submarine.CheckVisibility` is blocked by terrain / hull.
4. Record the target, then **in this order**:
   - `Item.Use(deltaTime)`: triggers the device's own `OnUse` status effects;
   - `createexplosiononintercept` -> `explosion.Explode(...)` at the target position;
   - chance roll: `Rand(Sync=ServerAndClient).NextSingle() > probility` -> skip the remaining steps;
   - `useonintercept` -> `target.Use(deltaTime)`;
   - `removeonintercept` -> queue the target for removal;
   - `target.Condition -= reducedcondition`.

Note the order: **device effects and the explosion happen before the chance roll**; the roll only gates the last three
steps.

## Example

```xml
<Item identifier="sample_aps" ...>
  <Powered ... />
  <ActiveProtectionSystem range="60" probility="0.85"
                          minspeed="5" maxspeed="80"
                          minmass="0" maxmass="50"
                          minsize="0,0" maxsize="3,3"
                          interceptonlyapproaching="true"
                          useonintercept="true"
                          removeonintercept="true"
                          reducedcondition="10"
                          createexplosiononintercept="true"
                          ison="true">
    <Explosion range="2" force="8" damage="20" />
  </ActiveProtectionSystem>
</Item>
```

## Notes

- **Default value trap**: `maxspeed` defaults to `0` and `minspeed` to `100` (constructor values). Without both
  attributes "minimum speed > maximum speed" and **no target is ever intercepted**. Always configure them as a pair.
- `maxmass` defaults to `100` in the constructor, not the `10000` declared on `[Serialize]`; spell it out when heavier
  targets should be covered.
- Historical attribute spellings: `probility`, `reducedcondition`, `createexplosiononintercept`. A typo is silent - the
  property simply never applies.
- `minsize` / `maxsize` are in **metres** and compare the **length** of the `Vector2` (the diagonal), not individual
  axes.
- Only non-hitscan rounds are handled; for hitscan ammo see [VoidShield.md](VoidShield.md).
- The chance roll uses `ServerAndClient` sync, so server and clients reach the same result.
