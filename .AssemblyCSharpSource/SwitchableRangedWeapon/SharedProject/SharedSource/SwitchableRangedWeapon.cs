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
    public partial class SwitchableRangedWeapon : RangedWeapon
    {
        public float BotReloadTimer { get; private set; }

        private int currentselected = 0;

        private int currentfiremode = 0;

        private int maxprojectileselectable = 1;

        private int maxfiremodeselectable = 1;

        private int roundsshot = 0;

        private float burstreload;

        private float botreload;

        private bool triggerreleased = true;

        private bool domagcheck = true;

        private IList<Identifier> switchableProjectiles;

        private IList<int> switchableSlots;

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

        [InGameEditable, Serialize(0.1f, IsPropertySaveable.Yes, alwaysUseInstanceValues: true)]
        public float BotReload
        {
            get { return botreload; }
            set { botreload = Math.Max(value, 0.0f); }
        }

        public SwitchableRangedWeapon(Item item, ContentXElement element)
            : base(item, element)
        {
            switchableProjectiles = element.GetAttributeIdentifierArray(nameof(switchableProjectiles), Array.Empty<Identifier>());
            switchableSlots = element.GetAttributeIntArray(nameof(switchableSlots), Array.Empty<int>());
            IList<string> switchableFiremodesStr = element.GetAttributeStringArray(nameof(switchableFiremodes), Array.Empty<string>());
            switchableFiremodes = WriteFiremode(switchableFiremodesStr);
            if (switchableSlots.Any())
            {
                maxprojectileselectable = switchableSlots.Count();
            }
            else if (switchableProjectiles.Any())
            {
                maxprojectileselectable = switchableProjectiles.Count();
            }
            else
            {
                maxprojectileselectable = 1;
            }
            maxfiremodeselectable = switchableFiremodes.Count();
            InitProjSpecific(element);
        }

        private IList<FireMode> WriteFiremode(IList<string> FireModeStr)
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
                    DebugConsole.AddWarning($"Invalid FireMode {FM} found in {this.item.Name}");
                }
            }
            return TempFireMode;
        }

        partial void InitProjSpecific(ContentXElement rangedWeaponElement);

        public override bool Use(float deltaTime, Character? character = null)
        {
            UpdateBotInput(deltaTime, character);
            switch (switchableFiremodes[currentfiremode])
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

            //TODO: Add random time multiplier for Bots
            BotReloadTimer = (botreload / (1 + character?.GetStatValue(StatTypes.RangedAttackSpeed) ?? 0));
            triggerreleased = false;
            roundsshot += 1;

            return true;
        }

        public new Projectile FindProjectile(bool triggerOnUseOnContainers = false)
        {
            Inventory itemInv = item.ownInventory;
            Item projectileitem;
            if (switchableSlots.Any())
            {
                int slotIndex = switchableSlots.ElementAt(currentselected);
                Item slotItem = itemInv.GetItemAt(slotIndex);
                if (slotItem?.GetComponent<Projectile>() != null)
                {
                    return slotItem.GetComponent<Projectile>();
                }
                else if (slotItem?.ownInventory != null)
                {
                    IEnumerable<Item> containedItems = slotItem.ownInventory.GetAllItems(false);
                    projectileitem = containedItems.FirstOrDefault(i => i.GetComponent<Projectile>() != null);
                    if (projectileitem == null) { return null; }
                    if (projectileitem.Container.Condition <= 0 && checkMagCondition) { return null; }
                    return projectileitem.GetComponent<Projectile>();
                }
            }

            if (switchableProjectiles.Any())
            {
                Identifier targetTagOrID = switchableProjectiles.ElementAt(currentselected);
                projectileitem = itemInv.FindItem(i => ((i.HasTag(targetTagOrID) || i.Prefab.Identifier == targetTagOrID) && i.GetComponent<Projectile>() != null), true);
                if (projectileitem == null) { return null; }
                if (projectileitem.Container.Condition <= 0 && checkMagCondition) { return null; }
                return projectileitem.GetComponent<Projectile>();
            }

            return null;
        }

        public void UpdateBotInput(float deltaTime, Character? character)
        {
            BotReloadTimer -= deltaTime;

            if (BotReloadTimer < 0.0f)
            {
                BotReloadTimer = 0.0f;
            }

            if (character == null) { return; }
            if(!character.IsBot) { return; }
            if(BotReloadTimer <= 0)
            {
                triggerReleased = true;
            }
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