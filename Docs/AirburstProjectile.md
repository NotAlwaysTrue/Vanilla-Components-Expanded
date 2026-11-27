# AirburstProjectile

- Type: `VCE_Airburst.AirburstProjectile : Projectile`
- XML element: `<AirburstProjectile>` on ammunition with a physics body
- Sources: [AirburstProjectile.cs](../CsProjectSource/SharedProject/SharedSource/Airburst/AirburstProjectile.cs), [AirburstBallistics.cs](../CsProjectSource/SharedProject/SharedSource/Airburst/AirburstBallistics.cs), [AirburstNetwork.cs](../CsProjectSource/SharedProject/SharedSource/Airburst/AirburstNetwork.cs), [AirburstPreview.cs](../CsProjectSource/ClientProject/ClientSource/Airburst/AirburstPreview.cs)

## Overview

An airburst round samples the distance from its launch position to the shooter's cursor when fired. Moving the cursor afterward leaves that shot's fuse setting unchanged. While aiming a loaded handheld ranged weapon, the local player sees an orange cross at the predicted burst point.

## Properties

Put fuse and physics settings on `<airburst>` inside the projectile. If that child is absent, the component reads them from `<AirburstProjectile>` itself. Vanilla projectile properties such as `launchimpulse` and `removeonhit`, and child elements such as `<StatusEffect>`, belong on the projectile.

| Category | Property Name | Property Type | Purpose | Supported Values | Default | Notes |
| --- | --- | --- | --- | --- | --- | --- |
| Fuse | `fusemode` | enum | How the round measures its range | `Arc`, `Chord`, `Time` | `Arc` | See Behavior below |
| Fuse | `maxdistance` | float | Cap on the programmed range | Sim units | `-1` | A positive value caps both the preview and the fuse |
| Fuse | `defaultdistance` | float | Range for bots or a missing player report | Sim units | `-1` | Zero or less disables the range fuse for that shot |
| Fuse | `maxlifetime` | float | Independent time limit | Seconds | `0` | A positive value triggers a burst even without a programmed range |
| Impact | `detonateonimpact` | bool | Give a queued physical hit priority over the fuse | `true` / `false` | `true` | Vanilla `removeonhit` also gives the hit priority |
| Impact | `burststatus` | ActionType | Status effects to run on a fuse or lifetime burst | Vanilla action type | `OnImpact` | The burst disables the body and queues the item for removal |
| Physics | `usedefaultphysics` | bool | Keep the original projectile physics | `true` / `false` | `false` | When enabled, skips the four overrides below |
| Physics | `gravityscale` | float | Scale world gravity | Multiplier | `0` | A body set to ignore gravity still ignores it |
| Physics | `lineardamping` | float | Damp linear velocity | Non-negative | `0` | Used in the trajectory prediction |
| Physics | `angulardamping` | float | Damp angular velocity | Non-negative or negative to inherit | `-1` | Negative keeps the body's value |
| Physics | `waterdragcoefficient` | float | Set the item's water drag | Non-negative | `0` | Water drag can change the actual burst point |
| Network | `netgracetime` | float | Time to accept a player's range after launch | Seconds | `0.3` | Server uses the fallback range when the window expires |

## Behavior

- **Arc** adds the distance the projectile travels between physics updates, measured in world space. **Chord** measures straight-line separation from the original launch position. On a curved flight path, the chord can stay short even while the round covers substantial distance.
- **Time** uses launch velocity, gravity, and linear damping to predict how long it will take to travel the programmed path length. Later changes to the flight path can shift the burst point. The HUD prediction also omits intervening walls and random spread.
- In multiplayer, the shooter reports the range and the server resolves the burst. The server can hold an early report for up to two seconds and matches it to the ammunition instance and shooter. A late report cannot rewind the projectile to an earlier position.

## Example

This component fragment gives a physical round a 12-metre range cap and a five-second lifetime. Add it in place of the ammunition's vanilla `<Projectile>`.

```xml
<AirburstProjectile launchimpulse="10" removeonhit="true">
  <airburst fusemode="Arc" maxdistance="12" maxlifetime="5" />
  <StatusEffect type="OnImpact" target="This">
    <Explosion range="150" force="5" />
  </StatusEffect>
</AirburstProjectile>
```

The default `OnImpact` lets both the physical hit and the fuse use the same effect. To give the airburst a separate effect, set `burststatus="OnBroken"` and define a second status effect of that type on the projectile. Each ammunition item uses one physical projectile.
