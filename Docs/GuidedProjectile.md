# GuidedProjectile

- Types: `VCE_Guidance.GuidedProjectile : Projectile`, `GuidanceDataLink : ItemComponent`, `CentralFireControl : Powered`, `GuidanceThruster : ItemComponent`
- XML elements: `<GuidedProjectile>`, `<GuidanceDataLink>`, `<CentralFireControl>`, `<GuidanceThruster>`
- Sources: [GuidedProjectile.cs](../CsProjectSource/SharedProject/SharedSource/Guidance/GuidedProjectile.cs), [GuidanceTypes.cs](../CsProjectSource/SharedProject/SharedSource/Guidance/GuidanceTypes.cs), [GuidanceDataLink.cs](../CsProjectSource/SharedProject/SharedSource/Guidance/GuidanceDataLink.cs), [CentralFireControl.cs](../CsProjectSource/SharedProject/SharedSource/Guidance/CentralFireControl.cs), [GuidanceThruster.cs](../CsProjectSource/SharedProject/SharedSource/Guidance/GuidanceThruster.cs)

## Overview

A guided round is a physical projectile that can follow the operator's aim, fly a route, or acquire a target. A round with an active seeker or a preset route can fly independently. For external guidance, put a data-link publisher on the launcher or control station and a receiver on the round. Add fire control to the publisher for target tracks or illumination, and a thruster to the round for powered flight.

## Properties

### GuidedProjectile

Use a `<guidance>` child for the settings below. If omitted, the component reads them from `<GuidedProjectile>`. Vanilla projectile attributes belong on the parent. Distances in this subsystem use display units (100 per metre).

| Category | Property Name | Property Type | Purpose | Supported Values | Default | Notes |
| --- | --- | --- | --- | --- | --- | --- |
| Guidance | `mode` | flags | Enable guidance modes | Mode names joined with a vertical bar | `ActiveSonar` | See Guidance modes below |
| Guidance | `seekerpriority` | list | Prefer particular seekers | Comma-separated mode names | Built-in order | Remaining seekers retain their default order |
| Guidance | `turnrate` | float | Maximum turn rate | Degrees per second | `90` | Steering preserves current speed |
| Seeker | `seekerrange` | float | Active search radius | Display units | `6000` | Measured from the round |
| Seeker | `scaninterval` | float | Time between seeker and link scans | Seconds, minimum 0.05 | `0.2` | Independent of steering updates |
| Seeker | `seekerlocktime` | float | Time to acquire the same candidate | Seconds | `0.25` | Restarts when the candidate changes |
| Seeker | `terminalrange` | float | Allow terminal acquisition near a data-link track | Display units | `seekerrange` | Applies when combining data link and seeker modes |
| Flight | `commandtimeout` | float | Maximum age of a command or track | Seconds | `1` | Also used as the loss timeout |
| Flight | `destroyonloss` | bool | End flight after losing guidance | Boolean | `false` | Requires prior guidance, followed by a full timeout without a steering point |
| Flight | `maxlifetime` | float | Maximum flight duration | Seconds | `30` | Zero disables the limit |
| Flight | `proximity` | float | End flight near a tracked entity | Display units | `0` | A positive value enables proximity triggering |
| Flight | `throttle` | float | Command the optional thruster | 0–1 | `1` | Zero stops thrust |
| Route | `waypoints` | Vector2 list | Preset route | Semicolon-separated `x,y` pairs | Empty | Example: `260,0;260,230;530,230` |
| Route | `relativeroute` | bool | Offset preset points from launch | Boolean | `true` | Offsets follow world axes |
| Route | `snaptogrid` | bool | Snap points to the level grid | Boolean | `false` | Applied when setting a route |
| Route | `waypointradius` | float | Arrival tolerance | Display units | `100` | Passing the end of a leg also advances it |
| Route | `crosstracklimit` | float | Allowed sideways deviation from a leg | Display units | `500` | Beyond it, steer back toward the leg |
| Route | `destroyatrouteend` | bool | End flight at the final point | Boolean | `false` | Otherwise the round can enter terminal guidance |

### GuidanceDataLink

| Category | Property Name | Property Type | Purpose | Supported Values | Default | Notes |
| --- | --- | --- | --- | --- | --- | --- |
| Link | `role` | enum | Send or receive guidance | `Publisher`, `Receiver`, `Both` | `Receiver` | Put the receiver on the ammunition |
| Link | `channel` | identifier | Match receivers with publishers | Identifier | `default` | Both ends must match |
| Link | `maxrange` | float | Maximum separation | Display units | `20000` | The shorter range of the two ends applies |
| Link | `requirelos` | bool | Require visibility between round and publisher | Boolean | `false` | Either end can require this |
| Manual | `manualmode` | enum | Aim command sent by a publisher | `MLOS`, `SACLOS` | `MLOS` | Round must enable the corresponding mode |

A publisher accepts `waypoints_in` (world-coordinate pairs such as `1000,2000;1400,2200`), `terminal_in` (leave the route and begin terminal guidance), and `abort_in` (end flight). Expose those inputs on the item's connection panel for wiring. A nonzero terminal or abort signal applies to rounds already in flight.

### CentralFireControl

| Category | Property Name | Property Type | Purpose | Supported Values | Default | Notes |
| --- | --- | --- | --- | --- | --- | --- |
| Scanner | `scaninterval` | float | Time between track updates | Seconds, minimum 0.05 | `0.25` | Each scan updates the publisher on this item |
| Scanner | `maxrange` | float | Detection radius | Display units | `20000` | A connected sonar can further limit range |
| Scanner | `coneangle` | float | Full scan cone | 0–360 degrees | `360` | Directional sonar can narrow the cone |
| Scanner | `detectcharacters` | bool | Include eligible characters | Boolean | `true` | Dead and friendly characters are filtered |
| Scanner | `detectsubmarines` | bool | Include eligible submarines | Boolean | `true` | Excludes the item's own submarine |
| Scanner | `detectitems` | bool | Include sonar contacts from items | Boolean | `true` | Active scans use sonar-visible items |
| Designation | `illumination` | enum | Type of designation to publish | `SemiActiveLaser`, `SemiActiveSonar` | `SemiActiveSonar` | A passive sonar can publish audible tracks but cannot provide sonar illumination |

### GuidanceThruster

| Category | Property Name | Property Type | Purpose | Supported Values | Default | Notes |
| --- | --- | --- | --- | --- | --- | --- |
| Motor | `maxthrust` | float | Forward force at full throttle | Non-negative | `20` | Applied along the round's current heading |
| Motor | `fuelconsumption` | float | Condition spent per second at full throttle | Non-negative | `1` | The final burn uses the remaining fraction of fuel |
| Motor | `minthrottle` | float | Lower bound on positive throttle | 0–1 | `0` | Zero throttle still stops the motor |

## Behavior

### Guidance modes

- **MLOS** steers toward the cursor's world position. **SACLOS** steers along the line from the publisher through the cursor and keeps going along that line even when the cursor is close to the launcher.
- **ActiveImaging**, **ActiveInfrared**, and **ActiveSonar** search from the round. Imaging and infrared require line of sight. Infrared also excludes thermally hidden or undetectable characters and submarines. Sonar can acquire through a wall, but the round can still hit the wall.
- **DataLink** steers toward the publisher's last reported position, extrapolated using the contact's estimated velocity. **SemiActiveLaser** and **SemiActiveSonar** follow the single contact designated by a publisher with matching illumination. Laser also requires line of sight from the round to that contact.
- **Cruise** follows waypoints. **None** allows an unguided round to coast or use a motor. Combine modes with, for example, `mode="Cruise|DataLink|ActiveImaging"`. A fresh manual aim command takes priority. Active route legs or distant data-link tracks defer seeker acquisition. Default seeker priority is semi-active laser, semi-active sonar, active sonar, infrared, then imaging.

### Target selection

Fire control ranks contacts by distance from the scanner. Its origin is the item, the sonar, or a connected transducer. It looks for sonar on the same item, then among linked items, then on the same submarine. A borrowed sonar supplies its range and operating mode.

For example, if a wall hides the nearer of two crawlers and the farther one is visible, the same launcher can publish the **near crawler's track** and designate the **far crawler for laser illumination**. The cursor sets the initial firing direction. Once airborne, a laser-only round needs sight of the designated crawler to steer toward it.

A receiver prefers the launcher that fired it, then the nearest eligible publisher on its channel. It chooses the publisher before checking track freshness or illumination type. An idle publisher can therefore take precedence over another publisher with a usable track.

### Flight and impact

Flight guidance runs in single-player or on the server. For manual multiplayer aim, the client sends cursor updates and the server checks the operator. A round that ends flight through proximity, timeout, route completion, or abort runs `OnImpact` and is queued for removal.

When a round initially ignores its shooter and `DamageUser` is disabled, it checks clearance every 0.5 seconds against the shooter's collider and attached limbs. After two consecutive clear samples it can hit the shooter on a return pass. An overlapping sample restarts the count, so slow rounds can take longer to clear.

## Example

On a launcher, add a publisher and a scanner that designates visible characters for laser guidance.

```xml
<Item identifier="sample_laser_launcher" variantof="revolver">
  <GuidanceDataLink role="Publisher" channel="samplelaser" />
  <CentralFireControl illumination="SemiActiveLaser" maxrange="2200"
                      detectsubmarines="false" detectitems="false" />
</Item>
```

On compatible physical ammunition, add these sibling components in place of its vanilla projectile component.

```xml
<GuidedProjectile launchimpulse="15" removeonhit="true">
  <guidance mode="SemiActiveLaser" turnrate="90" maxlifetime="8" />
</GuidedProjectile>
<GuidanceDataLink role="Receiver" channel="samplelaser" />
<GuidanceThruster maxthrust="3" fuelconsumption="2" />
```

See [the example item definitions](../.Test/testItems.xml) for a round that combines manual guidance, data link, and active sonar.
