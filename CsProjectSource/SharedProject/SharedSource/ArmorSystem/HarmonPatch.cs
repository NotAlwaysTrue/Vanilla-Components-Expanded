using Barotrauma.Items.Components;

namespace VCE_ArmorSystem
{
  //  [HarmonyPatch(typeof(Character), nameof(Character.DamageLimb))]
    public static class Projectile_DoHitscan_Patch
    {
        static readonly Dictionary<LimbType, InvSlotType[]> LimbMap = new()
        {
            { LimbType.None, [InvSlotType.None] },

            { LimbType.Head, [InvSlotType.Head, InvSlotType.OuterClothes, InvSlotType.InnerClothes] },
            { LimbType.Jaw, [InvSlotType.Head, InvSlotType.OuterClothes, InvSlotType.InnerClothes] },

            { LimbType.LeftArm, [InvSlotType.OuterClothes, InvSlotType.InnerClothes] },
            { LimbType.LeftForearm, [InvSlotType.OuterClothes, InvSlotType.InnerClothes] },
            { LimbType.LeftHand, [InvSlotType.LeftHandProsthetic] },
            { LimbType.LeftThigh, [InvSlotType.OuterClothes, InvSlotType.InnerClothes] },
            { LimbType.LeftLeg, [InvSlotType.InnerClothes] },
            { LimbType.LeftFoot, [InvSlotType.InnerClothes] },

            { LimbType.RightArm, [InvSlotType.OuterClothes, InvSlotType.InnerClothes] },
            { LimbType.RightForearm, [InvSlotType.OuterClothes, InvSlotType.InnerClothes] },
            { LimbType.RightHand, [InvSlotType.RightHandProsthetic] },
            { LimbType.RightThigh, [InvSlotType.OuterClothes, InvSlotType.InnerClothes] },
            { LimbType.RightLeg, [InvSlotType.InnerClothes] },
            { LimbType.RightFoot, [InvSlotType.InnerClothes] },

            { LimbType.Torso, [InvSlotType.OuterClothes, InvSlotType.InnerClothes] },
            { LimbType.Waist, [InvSlotType.OuterClothes, InvSlotType.InnerClothes] },

            { LimbType.Tail, [InvSlotType.InnerClothes] },
            { LimbType.Legs, [InvSlotType.InnerClothes] }
        };

        static void Prefix(Character __instance, Limb hitLimb, IEnumerable<Affliction> afflictions, ref float damageMultiplier, ref float penetration)
        {
            var Character = __instance;
            // incase that happened again...
            // int penlevel = (int)(penetration + 0.00001) * 10;
            int penlevel = (int)penetration * 10;

            if (!LimbMap.TryGetValue(hitLimb.type, out var invslots)) { return; }
            foreach (var slots in invslots)
            {
                Item plateitem = null;
                Item armoritem = Character.Inventory.GetItemInLimbSlot(slots);
                if (armoritem == null) { continue; }
                if (!ArmorPrefab.Prefabs.TryGet(armoritem.Prefab.Identifier, out var armorprefab)) { continue; }
                if (!armorprefab.ProtectionAreas.TryGetValue(hitLimb.type, out _)) { continue; }
                bool notfound = true;
                foreach(var aff in afflictions)
                {
                    if (armorprefab.TargetAfflictionIdentifiers.TryGetValue(aff.Prefab.Identifier, out _))
                    {
                        notfound = false;
                        break;
                    }
                }
                if (notfound) { continue; }
                if (armorprefab.PlateCarrier)
                {
                    plateitem = armoritem.ownInventory.GetItemAt(armorprefab.PlatePosition);
                }
            }
        }
    }
}