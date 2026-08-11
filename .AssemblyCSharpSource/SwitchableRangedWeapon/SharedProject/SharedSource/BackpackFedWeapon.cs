using Barotrauma.Items.Components;
using Barotrauma.Networking;

namespace SRW
{
    public partial class BackpackFedWeapon : SwitchableRangedWeapon
    {
        public BackpackFedWeapon(Item item, ContentXElement element) : base(item, element) { }

        public override bool Use(float deltaTime, Character? character = null)
        {
            bool shouldbotshoot = ShouldBotShoot(deltaTime, character);
            switch (switchableFiremodes[currentFireModeSelected])
            {
                case FireMode.Safe:
                    return false;
                case FireMode.Semi:
                    if (roundsshot >= 1 || !shouldbotshoot)
                    {
                        return false;
                    }
                    break;
                case FireMode.Burst:
                    if (roundsshot >= shotsPerBurst || !shouldbotshoot)
                    {
                        return false;
                    }
                    break;
            }
            tryingToCharge = true;
            if (character == null || character.Removed) { return false; }
            if ((item.RequireAimToUse && !character.IsKeyDown(InputType.Aim)) || ReloadTimer > 0.0f) { return false; }
            if (currentChargeTime < MaxChargeTime) { return false; }

            IsActive = true;

            float baseReloadTime;
            if (switchableFiremodes[currentFireModeSelected] == FireMode.Burst)
            {
                baseReloadTime = burstReload;
            }
            else
            {
                baseReloadTime = reload;
            }
            float weaponSkill = character.GetSkillLevel(Tags.WeaponsSkill);

            bool applyReloadFailure = ReloadSkillRequirement > 0 && ReloadNoSkill > reload && weaponSkill < ReloadSkillRequirement;
            if (applyReloadFailure)
            {
                //Examples, assuming 40 weapon skill required: 1 - 40/40 = 0 ... 1 - 0/40 = 1 ... 1 - 20 / 40 = 0.5
                float reloadFailure = MathHelper.Clamp(1 - (weaponSkill / ReloadSkillRequirement), 0, 1);
                baseReloadTime = MathHelper.Lerp(reload, ReloadNoSkill, reloadFailure);
            }

            if (character.IsDualWieldingRangedWeapons())
            {
                baseReloadTime *= Math.Max(1f, ApplyDualWieldPenaltyReduction(character, DualWieldReloadTimePenaltyMultiplier, neutralValue: 1f));
            }

            ReloadTimer = baseReloadTime / (1 + character?.GetStatValue(StatTypes.RangedAttackSpeed) ?? 0f);
            ReloadTimer /= 1f + item.GetQualityModifier(Quality.StatType.FiringRateMultiplier);

            currentChargeTime = 0f;

            var abilityRangedWeapon = new AbilityRangedWeapon(item);
            character.CheckTalents(AbilityEffectType.OnUseRangedWeapon, abilityRangedWeapon);

            if (item.AiTarget != null)
            {
                item.AiTarget.SoundRange = item.AiTarget.MaxSoundRange;
                item.AiTarget.SightRange = item.AiTarget.MaxSightRange;
            }

            float degreeOfFailure = 1.0f - DegreeOfSuccess(character);
            degreeOfFailure *= degreeOfFailure;
            if (degreeOfFailure > Rand.Range(0.0f, 1.0f))
            {
                ApplyStatusEffects(ActionType.OnFailure, 1.0f, character);
            }
            bool shouldshoot = false;
            for (int i = 0; i < ProjectileCount; i++)
            {
                Projectile projectile = FindProjectile(triggerOnUseOnContainers: true);
                if (projectile == null)
                {
                    LastProjectile = null;
                    break;
                }
                shouldshoot = true;
                projectile.Spread += ProjectileSpreadModifier;
                Vector2 barrelPos = TransformedBarrelPos + item.body.SimPosition;
                float rotation = (Item.body.Dir == 1.0f) ? Item.body.Rotation : Item.body.Rotation - MathHelper.Pi;
                float spread = GetSpread(character) * projectile.GetSpreadFromPool();

                var lastProjectile = LastProjectile;
                if (lastProjectile != projectile)
                {
                    //Note that we always snap the rope here, unlike when firing a rope from a turret.
                    //That's because handheld RangedWeapons have some special logic for handling the rope,
                    //which doesn't support multiple attached ropes (see Holdable.GetRope and the references to it)
                    lastProjectile?.Item.GetComponent<Rope>()?.Snap();
                }

                float rangedAttackMultiplier = character?.GetStatValue(StatTypes.RangedAttackMultiplier) ?? 0;
                float damageMultiplier = (1f + item.GetQualityModifier(Quality.StatType.FirepowerMultiplier) + rangedAttackMultiplier) * WeaponDamageModifier;
                projectile.Launcher = item;
                ignoredBodies.Clear();
                if (!projectile.DamageUser)
                {
                    foreach (Limb l in character.AnimController.Limbs)
                    {
                        if (l.IsSevered) { continue; }
                        ignoredBodies.Add(l.body.FarseerBody);
#if SERVER
                        ignoredBodies.Add(l.LagCompensatedBody.FarseerBody);
#endif
                    }

                    foreach (Item heldItem in character.HeldItems)
                    {
                        var holdable = heldItem.GetComponent<Holdable>();
                        if (holdable?.Pusher != null)
                        {
                            ignoredBodies.Add(holdable.Pusher.FarseerBody);
                        }
                    }
                }
                projectile.Item.body.Dir = Item.body.Dir;
                projectile.Shoot(character, character.AnimController.AimSourceSimPos, barrelPos, rotation + spread, ignoredBodies: ignoredBodies.ToList(), createNetworkEvent: false, damageMultiplier, LaunchImpulse);
                projectile.Item.GetComponent<Rope>()?.Attach(Item, projectile.Item);
                if (projectile.Item.body != null)
                {
                    if (i == 0)
                    {
                        Item.body.ApplyLinearImpulse(new Vector2((float)Math.Cos(projectile.Item.body.Rotation), (float)Math.Sin(projectile.Item.body.Rotation)) * Item.body.Mass * -50.0f, maxVelocity: NetConfig.MaxPhysicsBodyVelocity);
                    }
                    projectile.Item.body.ApplyTorque(projectile.Item.body.Mass * degreeOfFailure * 20.0f * projectile.GetSpreadFromPool());
                }
                Item.RemoveContained(projectile.Item);
                LastProjectile = projectile;
            }

            if (!shouldshoot) { return false; }

            LaunchProjSpecific();

            //TODO: Add random time multiplier for Bots
            BotReloadTimer = (BotReload / (1 + character?.GetStatValue(StatTypes.RangedAttackSpeed) ?? 0));
            triggerReleased = false;
            roundsshot += 1;

            return true;
        }

        partial void LaunchProjSpecific();

        public new Projectile FindProjectile(bool triggerOnUseOnContainers = false)
        {
            CharacterInventory ParentInv = item.ParentInventory as CharacterInventory;
            ItemInventory targetInv = ParentInv?.GetItemInLimbSlot(InvSlotType.Bag)?.OwnInventory;
            if (targetInv == null) return null;

            Item projectileitem = null;
            if (switchableProjectiles.Count != 0)
            {
                Identifier targetTagOrID = switchableProjectiles[CurrentSelected];
                projectileitem = targetInv.FindItem(i => ((i.HasTag(targetTagOrID) || i.Prefab.Identifier == targetTagOrID) && i.GetComponent<Projectile>() != null), false);
                if (projectileitem == null) { return null; }
                if (projectileitem.Container.Condition <= 0 && checkMagCondition) { return null; }
                return projectileitem.GetComponent<Projectile>();
            }
            else
            {
                projectileitem = targetInv.FindItem(i => i.GetComponent<Projectile>() != null, false);
                if (projectileitem == null) { return null; }
                if (projectileitem.Container.Condition <= 0 && checkMagCondition) { return null; }
                return projectileitem.GetComponent<Projectile>();
            }
        }
    }
}