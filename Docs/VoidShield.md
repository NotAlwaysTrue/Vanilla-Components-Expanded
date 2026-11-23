# VoidShield

- Type: `VCE_VoidShield.VoidShield : ItemComponent` (shared) plus a client-side drawing part
- XML element: `<VoidShield>`
- Sources: `SharedSource/VoidShield/VoidShield.cs`, `SharedSource/VoidShield/HarmonyPatch.cs`,
  `ClientSource/VoidShield/VoidShield.cs`, `ClientSource/VoidShield/Patch.cs`

## Overview

Creates a dedicated Farseer physics body as a shield on the item; **hitscan projectiles** that hit that body are treated
as intercepted. The shield can be toggled at any time: when off the collider is disabled and the sprite is not drawn;
when on it follows the item's position and rotation every frame.

- Collision categories: `Physics.CollisionItemBlocking | Physics.CollisionProjectile`
- Physics: `IgnoreGravity = true`, `FixedRotation = true`; it does not push items around
- With zero size, or with `ShieldActive = false`, it does not collide at all

## Properties

| Category | Property Name | Property Type | Purpose | Supported Values | Default | Notes |
| --- | --- | --- | --- | --- | --- | --- |
| Collider | `width` | float | Rectangular collider width (pixels / display units) | Non-negative | `0` | Ignored when `radius > 0` |
| Collider | `height` | float | Rectangular collider height (pixels / display units) | Non-negative | `0` | Ignored when `radius > 0` |
| Collider | `radius` | float | Circular collider radius (pixels / display units) | Non-negative | `0` | Above zero the collider becomes a circle and `width`/`height` are ignored |
| Collider | `offset` | Vector2 | Offset of collider and sprite from the item center (pixels) | `x,y` | `0,0` | Rotates together with the item |
| Visual | `alwaysdraw` | bool | Draw the shield sprite even when the item is stowed in a container | `true` / `false` | `false` | Client only; still requires `ShieldActive = true` |
| StatusControl | `shieldactive` | bool | Whether the shield is active | `true` / `false` | `false` | Editable in game; active = collider enabled + sprite drawn |
| Sprite | `<Sprite>` subelement | element | Shield sprite | A complete `<Sprite ... />` element | none | Without it the shield only collides, it is invisible |

## Behavior

### Collider

- On construction the pixel values are converted with `ConvertUnits.ToSimUnits` and a dynamic body is created; when
  active it is immediately placed at `item position + rotated offset` via `SetTransformIgnoreContacts`.
- `Update`, `Move` and `UpdateBroken` all call `SyncCollider()`, and `UpdateWhenInactive => true`, so the collider
  **follows every frame even while the component is inactive**.
- With width or height 0 (and `radius = 0`) the body has no shape and intercepts nothing.
- `RemoveComponentSpecific` destroys the body.

### Intercepting hitscan shots

The transpiler on `Projectile.DoHitscan` inserts a check before every hit callback:

1. If the hit fixture's `UserData` is a `VoidShield`, the shield item gets `ActionType.OnUse` status effects;
2. It returns a hit count greater than `MaxTargetsToHit`, **ending that ray immediately** (later targets take no damage).

So the shield only intercepts **hitscan projectiles**; physical (non-hitscan) rounds pass through it.

### Drawing (client)

- `Draw` draws the sprite during normal item drawing; the sprite is only drawn when `ShieldActive = true`.
- The `Item.DrawDecorativeSprites` patch also draws shields **inside an item container**.
- The `Item.IsVisible` patch marks the item visible when the root container does not draw its contents, with
  `alwaysdraw = true` and `ShieldActive = true`; `CaptureContainerOffset` remembers its local position inside the
  container so it follows it.
- With `GameMain.DebugDraw` enabled the collider is drawn green (active) / red (inactive).

## Example

```xml
<Item identifier="sample_void_shield" ...>
  <Body width="24" height="24" density="10" />

  <VoidShield width="120" height="160" offset="0,40"
              shieldactive="true" alwaysdraw="true">
    <Sprite texture="%ModDir%/Textures/shield.png"
            sourcerect="0,0,128,128" origin="0.5,0.5" depth="0.6" />
  </VoidShield>

  <Holdable slots="Any,LeftHand" ... />
</Item>
```

## Notes

- **Component registration**: `ictypes` in `SharedProject/SharedSource/Plugin.cs` currently does **not** list
  `VoidShield` (every other item component is listed). If `<VoidShield>` has no effect, check this first.
- Only projectiles with `hitscan="true"` are intercepted; for physical rounds and throwables use
  [ActiveProtectionSystem.md](ActiveProtectionSystem.md).
- The collider is synced to the item every frame, so **do not** treat it as a solid wall for water or characters: its
  categories only cover item blocking and projectiles.
- `width`/`height`/`radius`/`offset` are display units (pixels); internally they are divided by 100 into metres.
