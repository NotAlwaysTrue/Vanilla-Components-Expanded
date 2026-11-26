# BackpackFedWeapon

- Type: `VCE_SRW.BackpackFedWeapon : SwitchableRangedWeapon`
- XML element: `<BackpackFedWeapon>`
- Sources: `SharedSource/SwitchableRangedWeapon/BackpackFedWeapon.cs`; client half in
  `ClientSource/SwitchableRangedWeapon/BackpackFedWeapon.cs`

## Overview

Extends `SwitchableRangedWeapon` with two ammo sources:

1. **The weapon's own containers**: `allowedSelfContainerIndex` lists the usable slot indices.
2. **The worn backpack** (the item in the character's `InvSlotType.Bag` slot) and its `ownInventory`.

Both sources are concatenated into one continuous "logical slot" sequence that the player cycles through.
With `UseAllBackpackAvailable = true` the whole backpack counts as **one logical slot**, and every shot simply takes
the first valid round found in it.

## Properties

| Category | Property Name | Property Type | Purpose | Supported Values | Default | Notes |
| --- | --- | --- | --- | --- | --- | --- |
| Ammo source | `allowedBackPackTags` | List of tags | Tags that make a backpack a valid ammo source | Item tags | empty | **Must be defined**: an empty list, or a backpack without any of these tags, means 0 backpack slots |
| Ammo source | `allowedProjectileTags` | List of tags | Tags the weapon is allowed to fire | Item tags | empty | When empty no tag check is done (fires whatever it finds) |
| Ammo source | `allowedSelfContainerIndex` | List of integers | Own container slots that may provide ammo | Slot indices | empty | These slots come first in the logical sequence |
| Ammo source | `CurrentSlotIndex` | Integer | Active logical slot (editable in game) | `0 ..` current logical limit | `0` | The limit follows the equipped backpack; out-of-range values fall back to `0` |
| Ammo source | `UseAllBackpackAvailable` | bool | Treat the whole backpack as one slot | `true` / `false` | `true` | When `true` the backpack contributes exactly 1 logical slot |
| Trigger | `TriggerOnUseOnContainer` | bool | Trigger the ammo container's `OnUse` when firing | `true` / `false` | `true` | Each shot calls `ApplyStatusEffects(ActionType.OnUse)` on that container once |

> Inherited: `switchableFiremodes`, `currentFireModeSelected`, `burstReload`, `shotsPerBurst`,
> `triggerReleased`, `checkMagCondition`, `ProjectileSpreadModifier`, `botreload` and all `RangedWeapon`
> parameters remain active; see [SwitchableRangedWeapon.md](SwitchableRangedWeapon.md).

## Logical slot model

Let `SelfCount = allowedSelfContainerIndex.Count`; the number of backpack logical slots `BagSlots` is:

- no backpack, or the backpack carries none of the `allowedBackPackTags` -> `0`
- `UseAllBackpackAvailable = true` -> `1`
- otherwise -> `backpack.OwnInventory.Capacity`

Total slots = `SelfCount + BagSlots`. The `CurrentSlotIndex` setter recomputes the limit from the currently equipped
items and clamps the value, so equipping/removing a backpack returns the index to `0` automatically.

**Input**: this component handles the projectile key itself - pressing `SRW_SwitchKey` (default `F`) cycles
`CurrentSlotIndex += 1`; the fire mode key (default `B`) is still handled by the base `SwitchableRangedWeapon`.
The HUD shows the slot on the right side: own-container slots use `SwitchableWeapon.SelfContainer#<i>`,
backpack slots use `SwitchableWeapon.SlotIndex#<i>` (falling back to the raw index when no localized text exists).

## Projectile lookup (`FindProjectile`)

- `CurrentSlotIndex < SelfCount`: read the weapon's own `OwnInventory.GetItemAt(allowedSelfContainerIndex[i])`
  using the same rules as `SwitchableRangedWeapon` (a `Projectile` item directly, or a container holding rounds).
- Otherwise read from the backpack:
  - `UseAllBackpackAvailable = false`: use backpack slot `CurrentSlotIndex - SelfCount`, same rules as above;
  - `UseAllBackpackAvailable = true`: `FindItem` the first item in the backpack that has a `Projectile`,
    `Container != null` and `Condition > 0`.
- When `allowedProjectileTags` is non-empty the fetched ammo must carry at least one of those tags;
  with `checkMagCondition = true`, ammo or container `Condition <= 0` makes the lookup fail.

## Example

```xml
<Item identifier="sample_backpack_gun" ...>
  <RangedWeapon reload="0.25" ProjectileCount="1" />

  <BackpackFedWeapon
      switchableFiremodes="Semi,Burst"
      shotsPerBurst="4"
      burstReload="0.1"
      allowedBackPackTags="backpack,ammobackpack"
      allowedProjectileTags="rifleammo"
      allowedSelfContainerIndex="0"
      UseAllBackpackAvailable="false"
      TriggerOnUseOnContainer="true" />
</Item>
```

## Notes

- `allowedBackPackTags` **cannot be omitted**: the logic is "a backpack without a tag from this list provides no slots",
  so an empty list never matches.
- "Backpack" means the item in the character's `InvSlotType.Bag` slot; suitcases and toolbelts do not participate.
- Ammo must actually be inside the backpack's `OwnInventory` (`Container != null`); items merely held in the hands are
  never picked up.
- `TriggerOnUseOnContainer` fires the container's `OnUse` after every round: a container with a Condition-consuming
  status effect will be drained shot by shot.
