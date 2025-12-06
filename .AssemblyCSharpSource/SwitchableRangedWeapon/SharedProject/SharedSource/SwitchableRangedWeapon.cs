using Barotrauma.Abilities;
using Barotrauma.Networking;
using FarseerPhysics;
using FarseerPhysics.Dynamics;
using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Input;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Metadata.Ecma335;

namespace Barotrauma.Items.Components
{
    partial class SwitchableRangedWeapon : RangedWeapon
    {
        private int currentselected = 0;

        private int currentfiremode = 0;

        private int maxprojectileselectable = 1;

        private int maxfiremodeselectable = 1;

        private int roundsshot = 0;

        private float burstreload;

        private bool triggerreleased = true;

        private bool domagcheck = true;

        private IList<Identifier> switchableProjectiles;

        private IList<FireMode> switchableFiremodes;

        [InGameEditable, Serialize(0, IsPropertySaveable.Yes, alwaysUseInstanceValues: true)]
        public int currentFireModeSelected
        {
            get { return currentfiremode; }
            set { currentfiremode = (value <= (maxfiremodeselectable - 1) && value >= 0) ? value : 0; }
        }

        [InGameEditable,Serialize(0, IsPropertySaveable.Yes,alwaysUseInstanceValues:true)]
        public int currentProjectileSelected
        {
            get { return currentselected; }
            set { currentselected = (value <= (maxprojectileselectable - 1)) ? value : 0; }
        }

        [Serialize(true, IsPropertySaveable.Yes, alwaysUseInstanceValues: true)]
        public bool checkMagCondition
        {
            get
            {
                return domagcheck;
            }
            set
            {
                domagcheck = value;
            }
        }

        [InGameEditable, Serialize(true, IsPropertySaveable.Yes, alwaysUseInstanceValues: true)]
        public bool triggerReleased
        {
            get
            {
                return triggerreleased;
            }
            set
            {
                if(value)
                {
                    roundsshot = 0;
                }
                triggerreleased = value;
            }
        }

        [InGameEditable, Serialize(0, IsPropertySaveable.Yes, alwaysUseInstanceValues: true)]
        public int shotsPerBurst
        {
            get;
            set;
        }

        [InGameEditable, Serialize(0.0f, IsPropertySaveable.Yes, alwaysUseInstanceValues: true)]
        public float burstReload
        {
            get { return burstreload; }
            set { burstreload = Math.Max(value, 0.0f); }
        }

        public SwitchableRangedWeapon(Item item, ContentXElement element)
            : base(item, element)
        {
            switchableProjectiles = element.GetAttributeIdentifierArray(nameof(switchableProjectiles), Array.Empty<Identifier>());
            IList<string> switchableFiremodesStr = element.GetAttributeStringArray(nameof(switchableFiremodes), Array.Empty<string>());
            switchableFiremodes = WriteFiremode(switchableFiremodesStr, item);
            maxprojectileselectable = switchableProjectiles.Count();
            maxfiremodeselectable = switchableFiremodes.Count();
            InitProjSpecific(element);
        }

        private IList<FireMode> WriteFiremode(IList<string> FireModeStr, Item item)
        {
            if(FireModeStr == Array.Empty<string>())
            {
                return new List<FireMode>() { FireMode.Auto };
            }
            IList<FireMode> TempFireMode = new List<FireMode>();
            foreach (string FM in FireModeStr)
            {
                bool success = Enum.TryParse(FM ,true ,out FireMode fireMode);
                if(success)
                {
                    TempFireMode.Add(fireMode);
                }
                else
                {
                    DebugConsole.AddWarning($"Invalid FireMode {FM} found in {item.Name}");
                }
            }
            return TempFireMode;
        }

        partial void InitProjSpecific(ContentXElement rangedWeaponElement);

        public override bool Use(float deltaTime, Character? character = null)
        {
            switch(switchableFiremodes[currentfiremode])
            {
                case FireMode.Safe:
                    return false;
                case FireMode.Semi:
                    if(roundsshot >= 1)
                    {
                        return false;
                    }
                    break;
                case FireMode.Burst:
                    if (roundsshot >= shotsPerBurst)
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
            if (switchableFiremodes[currentfiremode] == FireMode.Burst)
            {
                baseReloadTime = burstreload;
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

            for (int i = 0; i < ProjectileCount; i++)
            {
                Projectile projectile = FindProjectile(triggerOnUseOnContainers: true);
                if (projectile == null) { return false;  }
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

            LaunchProjSpecific();

            triggerreleased = false;
            roundsshot += 1;

            return true;
        }

        public new Projectile FindProjectile(bool triggerOnUseOnContainers = false)
        {
            foreach (ItemContainer container in item.GetComponents<ItemContainer>())
            {
                foreach (Item containedItem in container.Inventory.AllItemsMod)
                {
                    if (containedItem == null) { continue; }
                    Projectile projectile = containedItem.GetComponent<Projectile>();
                    // Note: it will be necessary to rework this section. Currently a temp measure.
                    if (IsSelectedProjectile(projectile)) 
                    {
                        if (projectile.item.Container.Condition > 0 || !checkMagCondition)
                        {
                            return projectile;
                        }
                        return null;
                    }

                    //projectile not found, see if the contained item contains projectiles
                    var containedSubItems = containedItem.OwnInventory?.AllItemsMod;
                    if (containedSubItems == null) { continue; }
                    foreach (Item subItem in containedSubItems)
                    {
                        if (subItem == null) { continue; }
                        Projectile subProjectile = subItem.GetComponent<Projectile>();
                        //apply OnUse statuseffects to the container in case it has to react to it somehow
                        //(play a sound, spawn more projectiles, reduce condition...)
                        if (triggerOnUseOnContainers && subItem.Condition > 0.0f)
                        {
                            subItem.GetComponent<ItemContainer>()?.Item.ApplyStatusEffects(ActionType.OnUse, 1.0f);
                        }
                        // Note: it will be necessary to rework this section. Currently a temp measure.
                        if (IsSelectedProjectile(subProjectile)) {
                            if (subProjectile.item.Container.Condition > 0 || !checkMagCondition)
                            {
                                return subProjectile;
                            }
                            return null;
                        }
                    }
                }
            }
            return null;
        }

        public bool IsSelectedProjectile(Projectile projectile)
        {
            if (projectile?.Item == null) { return false; }
            if (!switchableProjectiles.Any()) { return true; }
            if (switchableProjectiles.ElementAt(currentselected) == projectile.Item.Prefab.Identifier || projectile.Item.HasTag(switchableProjectiles.ElementAt(currentselected))) { return true; }
            return false;
        }

        partial void LaunchProjSpecific();


    }
    class AbilityRangedWeapon : AbilityObject, IAbilityItem
    {
        public AbilityRangedWeapon(Item item)
        {
            Item = item;
        }
        public Item Item { get; set; }
    }
}