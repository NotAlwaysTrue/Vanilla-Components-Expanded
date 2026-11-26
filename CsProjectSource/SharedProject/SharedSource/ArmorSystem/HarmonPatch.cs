using Barotrauma.Items.Components;

namespace VCE_ArmorSystem;

[HarmonyPatch(typeof(Character), nameof(Character.DamageLimb))]
internal static class ArmorDamagePatch
{
    private const float PenetrationEpsilon = 0.00001f;
    private static readonly InvSlotType[] ArmorSlots =
        [InvSlotType.Head, InvSlotType.OuterClothes, InvSlotType.InnerClothes];

    private static int? GetDefaultPlatePosition(LimbType limb) => limb switch
    {
        LimbType.Head or LimbType.Torso or LimbType.Waist => 0,
        LimbType.LeftArm or LimbType.LeftForearm or LimbType.LeftHand
            or LimbType.RightArm or LimbType.RightForearm or LimbType.RightHand => 1,
        LimbType.LeftThigh or LimbType.RightThigh => 2,
        LimbType.LeftLeg or LimbType.LeftFoot
            or LimbType.RightLeg or LimbType.RightFoot => -1,
        _ => null
    };

    private static bool Prefix(
        Character __instance,
        Limb? hitLimb,
        ref IEnumerable<Affliction> afflictions,
        Character? attacker,
        ref float damageMultiplier,
        ref float penetration,
        ref AttackResult __result)
    {
#if CLIENT
        if (GameMain.NetworkMember != null)
        {
            return true;
        }
#endif
        if (!ArmorPrefab.HasPrefabs
            || __instance.Removed
            || __instance.Inventory is not { } inventory
            || hitLimb == null
            || afflictions == null
            || !float.IsFinite(penetration))
        {
            return true;
        }

        var limb = hitLimb.type;
        if (GetDefaultPlatePosition(limb) is not { } platePosition)
        {
            return true;
        }

        // With three slots, only the previous two processed items can repeat.
        Item? lastArmor = null;
        Item? previousArmor = null;
        float? remainingPen = null;
        float remainingDamage = 1f;
        float? totalAfflictionStrength = null;
        bool checkedFriendlyFire = false;
        foreach (var slot in ArmorSlots)
        {
            var armor = inventory.GetItemInLimbSlot(slot);
            if (armor == null
                || ReferenceEquals(armor, lastArmor)
                || ReferenceEquals(armor, previousArmor)
                || !ArmorPrefab.Prefabs.TryGet(armor.Prefab.Identifier, out var armorPrefab))
            {
                continue;
            }

            bool coversLimb = armorPrefab.ProtectionAreas.Contains(limb);
            bool slotMatchesLimb = (slot == InvSlotType.Head) == (limb == LimbType.Head);
            if (!coversLimb && !slotMatchesLimb)
            {
                continue;
            }

            Item? plate = armorPrefab.PlateCarrier
                ? armor.OwnInventory?.GetItemAt(
                    armorPrefab.PlatePosition >= 0 ? armorPrefab.PlatePosition : platePosition)
                : null;
            ArmorPrefab? platePrefab = null;
            if (plate != null && ArmorPrefab.Prefabs.TryGet(plate.Prefab.Identifier, out var configuredPlate))
            {
                platePrefab = configuredPlate;
            }

            bool checkArmor = coversLimb && CanProtect(armor, armorPrefab);
            bool checkPlate = platePrefab != null && CanProtect(plate!, platePrefab);
            if (!checkArmor && !checkPlate)
            {
                continue;
            }

            if (!checkedFriendlyFire)
            {
                checkedFriendlyFire = true;
                // Vanilla also enumerates afflictions. Keep iterator-based attacks stable across layers.
                if (afflictions is not IReadOnlyCollection<Affliction>)
                {
                    afflictions = afflictions.ToArray();
                }

                if (attacker != null
                    && attacker != __instance
                    && attacker.IsOnPlayerTeam
                    && GameMain.NetworkMember is { ServerSettings.AllowFriendlyFire: false }
                    && attacker.TeamID == __instance.TeamID
                    && !afflictions.Any(a => a.Prefab.IsBuff))
                {
                    return true;
                }
            }

            float? armorStrength = checkArmor
                ? GetTargetStrength(armorPrefab, afflictions, ref totalAfflictionStrength)
                : null;
            float? plateStrength = checkPlate
                ? GetTargetStrength(platePrefab!, afflictions, ref totalAfflictionStrength)
                : null;
            if (!armorStrength.HasValue && !plateStrength.HasValue)
            {
                continue;
            }

            float penLevel = remainingPen ?? (float)Math.Floor((penetration + (double)PenetrationEpsilon) * 10);
            if (armorPrefab.ClampPen || platePrefab?.ClampPen == true)
            {
                penLevel = Math.Clamp(penLevel, 0f, 10f);
            }

            if ((plateStrength is { } plateHit
                && ApplyLayer(
                    plate!, platePrefab!, __instance, hitLimb, plateHit, ref penLevel, ref remainingDamage))
                || (armorStrength is { } armorHit
                && ApplyLayer(
                    armor, armorPrefab, __instance, hitLimb, armorHit, ref penLevel, ref remainingDamage)))
            {
                __result = new AttackResult();
                return false;
            }

            (previousArmor, lastArmor) = (lastArmor, armor);
            remainingPen = penLevel;
        }

        if (remainingPen is { } finalPen)
        {
            penetration = finalPen / 10f + PenetrationEpsilon;
            damageMultiplier *= remainingDamage;
        }

        return true;
    }

    private static bool CanProtect(Item item, ArmorPrefab prefab) =>
        item.Condition > 0f && (!prefab.MaskHelmet || item.GetComponent<LightComponent>()?.IsOn != true);

    private static float? GetTargetStrength(
        ArmorPrefab prefab,
        IEnumerable<Affliction> afflictions,
        ref float? totalAfflictionStrength)
    {
        if (prefab.TargetsAny)
        {
            return totalAfflictionStrength ??= afflictions.Sum(a => a.Strength);
        }

        if (prefab.Targets.Count == 0)
        {
            return null;
        }

        foreach (var affliction in afflictions)
        {
            if (prefab.Targets.Contains(affliction.Prefab.Identifier)
                || prefab.Targets.Contains(affliction.Prefab.AfflictionType))
            {
                return Math.Max(0f, affliction.Strength);
            }
        }

        return null;
    }

    private static bool ApplyLayer(
        Item item,
        ArmorPrefab prefab,
        Character character,
        Limb limb,
        float strength,
        ref float penLevel,
        ref float damageMultiplier)
    {
        foreach (var correction in prefab.Corrections)
        {
            float amount = strength * damageMultiplier * prefab.CorrectionMultiplier * correction.Amount;
            if (correction.MultiplyByMaxVitality)
            {
                amount *= character.MaxVitality / 100f;
            }

            if (amount > 0f && AfflictionPrefab.Prefabs.TryGet(correction.Affliction, out var correctionPrefab))
            {
                character.CharacterHealth.ApplyAffliction(limb, correctionPrefab.Instantiate(amount));
            }
        }

        if (penLevel - prefab.Level < prefab.RicochetLevelOverride
            && prefab.RicochetChance > 0f
            && (prefab.RicochetChance >= 1f
                || Rand.Int(100, Rand.RandSync.ServerAndClient) + 1 <= prefab.RicochetChance * 100f))
        {
#if CLIENT
            prefab.PlayRicochet(item.WorldPosition);
#endif
            return true;
        }

        if (!prefab.IgnoreDamage && penLevel != 0 && prefab.MaxHits > 0)
        {
            float maxCondition = prefab.MaxCondition > 0 ? prefab.MaxCondition : item.MaxCondition;
            float damageFactor = prefab.ArmorType switch
            {
                ArmorType.Metal => 1f,
                ArmorType.Composite => Math.Max(strength / 20f, 1f),
                ArmorType.Ceramic => Math.Max(strength / 20f, 1f) * (maxCondition / item.Condition),
                ArmorType.Custom when prefab.CustomDamageDivisor > 0f => strength / prefab.CustomDamageDivisor,
                _ => 0f
            };
            if (damageFactor > 0f)
            {
                item.Condition -= damageFactor * (maxCondition / prefab.MaxHits);
            }
        }

        if (item.Condition <= 0f)
        {
            return false;
        }

        if (penLevel < prefab.Level)
        {
            return true;
        }

        penLevel -= MathF.Floor(prefab.Level * prefab.Resistance);
        damageMultiplier *= prefab.AfterEffectMultiplier;
        return false;
    }
}
