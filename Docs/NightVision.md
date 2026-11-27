# NightVision

- Type: `VCE_NightVision.NightVision : ItemComponent` with client-side rendering
- XML element: `<NightVision>` on an equippable item
- Sources: [NightVision.cs](../CsProjectSource/SharedProject/SharedSource/NightVision/NightVision.cs), [client rendering](../CsProjectSource/ClientProject/ClientSource/NightVision), [NightVision.fx](../CsProjectSource/Shaders/NightVision.fx)
- Related setting: `vce.nightvision.ambient` (default `true`)

## Overview

Equipping the item enables night vision for the local player controlling its wearer. The goggles can brighten a dark compartment, tint the scene, and optionally highlight nearby characters. The world filter leaves the HUD in its usual colors.

## Properties

| Category | Property Name | Property Type | Purpose | Supported Values | Default | Notes |
| --- | --- | --- | --- | --- | --- | --- |
| Equipment | `ToggleKey` | string | Toggle while equipped | MonoGame key name, e.g. `N` | Empty | Equipping switches the device on. Text input suppresses key toggles |
| Equipment | `RequiresPower` | bool | Require power to operate | Boolean | `false` | Reads `HasPower` from a `Powered` component on the same item |
| Equipment | `FadeTime` | float | Time to fade in or out | Seconds | `0.2` | Zero makes the transition immediate |
| Lighting | `AmbientBoost` | float | Minimum light-map intensity per RGB channel | 0–1 | `0.25` | Scaled by the current fade and gated by the server setting |
| Filter | `Gain` | float | Amplify scene luminance | Multiplier | `2.5` | Applied before lift and gamma |
| Filter | `Lift` | float | Offset amplified luminance | Number | `0.04` | Raises the black level |
| Filter | `Gamma` | float | Shape midtone brightness | Positive exponent | `0.85` | Values below 1 brighten midtones |
| Filter | `Tint` | Color | Phosphor color | `R,G,B,A` | `64,255,90,255` | Filter uses the RGB channels |
| Filter | `WhiteHot` | bool | Use white phosphor | Boolean | `false` | Brightness follows scene luminance |
| Filter | `Bloom` | float | Spread nearby highlights | Non-negative strength | `0` | Positive values sample four neighboring highlights |
| Filter | `Noise` | float | Grain amplitude | Non-negative strength | `0.04` | Varies over time |
| Filter | `Scanline` | float | Dim alternating pixel rows | 0–1 recommended | `0.04` | Zero disables scanlines |
| Filter | `Vignette` | float | Darken the edges of the image | Non-negative strength | `0.22` | Strongest near the corners |
| Filter | `Lens` | float | Distort the sampled image radially | Number | `0` | Zero preserves the original geometry |
| Thermal | `ThermalMode` | enum | Choose a character overlay | `Off`, `FusedOutline`, `Mask`, `Edge` | `Off` | Independent of phosphor color |
| Thermal | `ThermalRange` | float | Maximum target distance from wearer | Display units | `20000` | Also filters by camera viewport with a margin |
| Thermal | `ThermalLineColor` | Color | Overlay color and opacity | `R,G,B,A` | `255,255,255,220` | Alpha scales the effective overlay strength |
| Thermal | `ThermalStrength` | float | Intensity of the highlight | Non-negative | `1` | Multiplied by `ThermalBlend` |
| Thermal | `ThermalBlend` | float | Scale the overlay contribution | 0–1 recommended | `1` | Zero suppresses the overlay |
| Thermal | `ThermalUpdateHz` | float | Refresh target and limb positions | 1–60 Hz | `6` | Cached positions are projected using the current camera |
| Thermal | `MaxThermalTargets` | int | Maximum highlighted characters | 0–32 | `16` | Closest eligible characters first |
| Thermal | `ShowDead` | bool | Include dead characters | Boolean | `false` | Other visibility filters still apply |

## Behavior

- **Ambient light.** The client applies the brightness floor to the completed light map, after rooms and characters have been drawn. This reveals detail inside dark hulls as well as outside. Normal scene lighting still goes through vanilla line-of-sight processing. With `AmbientBoost="0"`, the filter amplifies existing illumination, including the faint halo around the player. Disabling **Allow night vision to raise ambient light** gives all goggles this behavior.
- **Thermal overlay.** `FusedOutline` draws individual limb outlines. `Mask` draws those outlines into a mask at one quarter of the screen width and height. `Edge` extracts the boundary of the combined filled limb shapes. These modes use character and limb data and perform no per-target line-of-sight check.
- **Eligibility.** The overlay skips the wearer, disabled or removed characters, and characters marked thermally hidden or undetectable. Hidden and severed limbs are excluded. Visible, attached human limbs include the head and both feet. Non-human limbs below mass 0.5 are skipped unless they are the main limb.
- **Wearer and power.** Unequipping, dropping, breaking, or losing power to the active device lets the effect fade out. Changing the controlled character selects that character's eligible equipment. When several devices are worn, the most recently equipped eligible device takes precedence.

## Example

Add this component alongside a head-slot `Wearable` to create green goggles with orange limb outlines and an N-key toggle.

```xml
<NightVision ToggleKey="N" FadeTime="0.4" AmbientBoost="0.25"
             ThermalMode="FusedOutline" ThermalLineColor="255,120,30,255" />
```

For a battery-powered variant, add `RequiresPower="true"` and configure the item's powered component and supply. A battery container alone does not supply voltage. [Example wearable](../.Test/testItems.xml)

## Notes

The clients embed MGFX v8 effects built with MonoGame 3.7.1. Recompile the shader with 2MGFX using `/Profile:DirectX_11` for Windows and `/Profile:OpenGL` for Linux and macOS. The DirectX pixel input signature must match SpriteBatch's vertex output order (`SV_Position`, `COLOR0`, `TEXCOORD0`). If loading fails, the client logs the error and uses the game's monochrome effect with the brightness floor, fades, and basic thermal outlines.
