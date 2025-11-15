---@meta
---@class Barotrauma.Items.Components.RangedWeapon : Barotrauma.Items.Components.ItemComponent
---`Field Private Instance`
---@field reload System.Single
---`Field Private Instance`
---@field barrelPos Microsoft.Xna.Framework.Vector2
---`Field Private Instance`
---@field suitableProjectiles (System.Collections.Generic.IReadOnlySet*1Barotrauma*Identifier)|(fun():(Barotrauma.Identifier))
---`Field Private Instance`
---@field currentChargingState Barotrauma.Items.Components.RangedWeapon.ChargingState
---`Field Private Instance`
---@field currentChargeTime System.Single
---`Field Private Instance`
---@field tryingToCharge System.Boolean
---`Field Private Instance`
---@field ignoredBodies (System.Collections.Generic.List*1FarseerPhysics*Dynamics*Body)|(FarseerPhysics.Dynamics.Body[])
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field ReloadTimer System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field BarrelPos System.String
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Reload System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field ReloadSkillRequirement System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field ReloadNoSkill System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field HoldTrigger System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field ProjectileCount System.Int32
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Spread System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field UnskilledSpread System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field LaunchImpulse System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field Penetration System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field WeaponDamageModifier System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field MaxChargeTime System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field DualWieldReloadTimePenaltyMultiplier System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field DualWieldAccuracyPenalty System.Single
---`Getter Public Instance`
---@field TransformedBarrelPos Microsoft.Xna.Framework.Vector2
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field LastProjectile Barotrauma.Items.Components.Projectile
_G['Components']['RangedWeapon'] = {}

---`Method Public Instance Virtual`
---@param character Barotrauma.Character
_G['Components']['RangedWeapon'].Equip = function(character) end

---`Method Public Instance Virtual`
---@param deltaTime System.Single
---@param cam Barotrauma.Camera
_G['Components']['RangedWeapon'].Update = function(deltaTime, cam) end

---`Method Private Instance`
---@param user Barotrauma.Character
---@return System.Single
_G['Components']['RangedWeapon'].GetSpread = function(user) end

---`Method Private Static`
---@param character Barotrauma.Character
---@param originalPenalty System.Single
---@param neutralValue System.Single
---@return System.Single
_G['Components']['RangedWeapon'].ApplyDualWieldPenaltyReduction = function(character, originalPenalty, neutralValue) end

---`Method Public Instance Virtual`
---@param deltaTime System.Single
---@param character? Barotrauma.Character
---@return System.Boolean
_G['Components']['RangedWeapon'].Use = function(deltaTime, character) end

---`Method Public Instance Virtual`
---@param deltaTime System.Single
---@param character? Barotrauma.Character
---@return System.Boolean
_G['Components']['RangedWeapon'].SecondaryUse = function(deltaTime, character) end

---`Method Public Instance`
---@param triggerOnUseOnContainers? System.Boolean
---@return Barotrauma.Items.Components.Projectile
_G['Components']['RangedWeapon'].FindProjectile = function(triggerOnUseOnContainers) end

---`Method Private Instance`
---@param projectile Barotrauma.Items.Components.Projectile
---@return System.Boolean
_G['Components']['RangedWeapon'].IsSuitableProjectile = function(projectile) end

---`Constructor Public Instance`
---@param item Barotrauma.Item
---@param element Barotrauma.ContentXElement
---@return Barotrauma.Items.Components.RangedWeapon
_G['Components']['RangedWeapon'] = function(item, element) end

---`Constructor Public Instance`
---@param item Barotrauma.Item
---@param element Barotrauma.ContentXElement
---@return Barotrauma.Items.Components.RangedWeapon
_G['Components']['RangedWeapon'].__new = function(item, element) end

