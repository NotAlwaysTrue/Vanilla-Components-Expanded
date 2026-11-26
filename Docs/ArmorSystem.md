# ArmorSystem

- Type: `VCE_ArmorSystem.ArmorPrefabFile : GenericPrefabFile<ArmorPrefab>` + `ArmorPrefab : Prefab`
- File element: `<ArmorPrefabs>` (registered with the singular/plural element `<ArmorPrefab file="..." />`)
- Sources: `SharedSource/ArmorSystem/ArmorPrefab.cs`, `SharedSource/ArmorSystem/HarmonPatch.cs`
- Example: `.Test/ArmorPrefabs.xml`

## Overview

This is **data-driven armor**, not an item component: each `ArmorPrefab` uses an existing item's identifier as its key and
adds layered damage reduction, ricochet, limited durability and affliction corrections to wearable items. Resolution runs
in a Harmony **Prefix** on `Character.DamageLimb` (in multiplayer the client returns early and the server resolves it).

Processing order and layering:

1. Check the `Head` -> `OuterClothes` -> `InnerClothes` equipment slots in order;
2. The same item is resolved only once even if it occupies several slots;
3. For every plate carrier, the inserted plate is resolved before its shell;
4. Penetration level and the damage multiplier **carry over** from one layer to the next.

## Root properties

| Category | Property Name | Property Type | Purpose | Supported Values | Default | Notes |
| --- | --- | --- | --- | --- | --- | --- |
| Identity | `identifier` | identifier | Identifier of the **existing item** this entry configures | Item identifier | none | Does not create items; only attaches data to an existing one |
| Type | `type` | enum | Selects the durability wear formula | `None`, `Metal`, `Composite`, `Ceramic`, `Custom` | `None` | `None` consumes no durability |
| Level | `level` | int | Armor level (penetration below it is blocked) | Integer | `0` | Combined with `penresistance` to shave penetration |
| Ricochet | `ricochetchance` | float | Ricochet chance | `0`-`1` (clamped) | `0` | Only rolled when the level difference condition holds |
| Ricochet | `forcepenoverride` | int | Maximum penetration difference that still ricochets | Integer; `-1` means `2` | `2` | Condition: `penetration level - level < this value` |
| Penetration | `penresistance` | float | Fraction of a level removed from penetration | Typically `0`-`1` | `0` | Removes `floor(level * penresistance)` |
| Penetration | `clamppen` | bool | Clamp the penetration level to `0..10` | `true` / `false` | `false` | OR-ed with a plate's own `clamppen` |
| Damage | `aftereffectmultiplier` | float | Multiplier applied to the damage multiplier when not blocked | Positive | `1` | Multiplied across layers |
| Durability | `maxhits` | int | "Standard hits" a full durability can absorb | Positive integer | `0` | `0` means no durability is consumed |
| Durability | `maxcondition` | float | Maximum condition used in the wear formula | Positive | `0` | `0` falls back to the item's own `MaxCondition` |
| Durability | `ignoredamage` | bool | Never consume durability | `true` / `false` | `false` | Disables `maxhits` |
| Slots | `isplatecarrier` | bool | This armor holds an insertable plate | `true` / `false` | `false` | The plate is read from its `OwnInventory` |
| Slots | `plateposition` | int | Container slot of the plate | Integer; `-1` uses the default layout | `-1` | Default: head/torso/waist 0, arms/hands 1, thighs 2 |
| Slots | `ishelmet` | bool | This armor is a helmet | `true` / `false` | `false` | The layer is skipped while its light is on |
| Sound | `playsound` | bool | Play a sound on ricochet | `true` / `false` | `true` | Client only |
| Sound | `soundrange` | float | Default ricochet sound range | Positive | `1000` | `<RicochetSound>` `range` overrides it |

## Subelements

| Subelement | Purpose | Key attributes | Notes |
| --- | --- | --- | --- |
| `<TargetIdentifiers>` | Which damage types this armor targets | `<Affliction identifier="..." />` | `identifier` may be an affliction identifier, an affliction type, or `any` (total strength) |
| `<ProtectionAreas>` | Which limbs are protected | `<Limb type="Torso" />` | Without a matching limb the shell does not participate |
| `<Corrections>` | Extra afflictions applied before resolution | `multiplier` (default `1`), `enabled` (default `true`), `<Affliction identifier amount multiplybymaxvitality />` | `amount` defaults to `1`, `multiplybymaxvitality` to `true` |
| `<CustomExpression>` | Durability divisor for `type="Custom"` | `divisor` (default `100`) | See the formula below |
| `<RicochetSound>` | Custom ricochet sound | `file`, `range` (inherits `soundrange`) | Client build only; otherwise the vanilla `Ricochet` sound is used |

## Resolution rules

### Which layers participate

- **Shell**: `ProtectionAreas` must contain the hit limb (`checkArmor = coversLimb && CanProtect`).
  A shell without `ProtectionAreas` contributes no damage reduction.
- **Plate**: when the carrier has `isplatecarrier`, the plate is read from `plateposition` (or the default layout); the
  plate participates based only on its own `Condition` and target match - **the carrier's `ProtectionAreas` is not
  consulted**.
- A slot/limb pre-filter (head slot <-> head limb) only prunes the loop; it does not change the rules above.
- `CanProtect`: item `Condition > 0`; if `ishelmet`, its `<LightComponent>` must be off.
- A layer only gains "armor strength" when `TargetIdentifiers` match this hit (`TargetsAny` uses the sum of all
  affliction strengths; an entry with no `TargetIdentifiers` at all never applies).

### Penetration and damage carry-over

1. Penetration level `penLevel = floor(penetration * 10 + 1e-5)`; if any layer has `clamppen`, clamp to `0..10`.
2. Apply `Corrections` for the layer:
   `amount = strength * current damage multiplier * multiplier * correction.amount`, and when
   `multiplybymaxvitality` is set multiply again by `character max vitality / 100`.
3. **Ricochet**: `penLevel - level < forcepenoverride` and the roll succeeds -> the layer blocks immediately (empty
   `AttackResult`); later layers and the damage are skipped.
4. **Durability** (`ignoredamage = false`, `maxhits > 0`, `penLevel != 0`):

   | Type | Durability factor |
   | --- | --- |
   | `Metal` | `1` |
   | `Composite` | `max(strength / 20, 1)` |
   | `Ceramic` | `max(strength / 20, 1) * (maxCondition / currentCondition)` |
   | `Custom` | `strength / divisor` |

   Condition removed = `factor * (maxCondition / maxhits)`; a layer whose `Condition <= 0` stops blocking.
5. `penLevel < level` -> blocked (empty `AttackResult`).
6. Otherwise `penLevel -= floor(level * penresistance)`, `damage multiplier *= aftereffectmultiplier`, and the remaining
   penetration and multiplier are passed to the next layer.

### Other

- When friendly fire is disabled, the attacker is on the same team as the target, and the afflictions contain no buff,
  the whole armor resolution is skipped.
- `any` target strength uses the sum of all affliction strengths in the hit (cached once per layer).

## Example

```xml
<ArmorPrefabs>
  <ArmorPrefab identifier="sampletorsoarmor" type="Composite" level="4"
               ricochetchance="0.15" forcepenoverride="2" penresistance="0.8"
               aftereffectmultiplier="0.8" clamppen="false"
               maxhits="60" maxcondition="100" ignoredamage="false"
               isplatecarrier="true" plateposition="-1" ishelmet="false"
               playsound="true" soundrange="1000">
    <TargetIdentifiers>
      <Affliction identifier="gunshotwound" />
    </TargetIdentifiers>
    <ProtectionAreas>
      <Limb type="Torso" />
      <Limb type="Waist" />
    </ProtectionAreas>
    <Corrections multiplier="0.1" enabled="false">
      <Affliction identifier="blunttrauma" amount="1" multiplybymaxvitality="true" />
    </Corrections>
    <CustomExpression divisor="100" />
    <RicochetSound file="%ModDir%/Sounds/ricochet.ogg" range="1000" />
  </ArmorPrefab>
</ArmorPrefabs>
```

## Notes

- `identifier` must be an **existing item** identifier; a typo produces no error, the entry simply never applies.
- Shell coverage is decided entirely by `ProtectionAreas` (helmets included); to let clothing protect the head you must
  list `<Limb type="Head" />` explicitly.
- Forgetting `TargetIdentifiers` or `ProtectionAreas` makes the entry "present but inert" with no console error.
- `level` and `penresistance` are different things: `level` decides *whether* the hit is blocked, `penresistance`
  decides *how much penetration remains* when it is not.
- `maxhits` and `maxcondition` shape the durability feel but do not change the item's visible condition bar;
  omitting `maxcondition` reuses the item's own `MaxCondition`.
- Duplicate identifiers inside one `<ArmorPrefabs>` should be wrapped in `<Override>`, matching vanilla content package
  semantics.
