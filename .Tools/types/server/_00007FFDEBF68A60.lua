---@meta
---@class Barotrauma.Items.Components.MeleeWeapon : Barotrauma.Items.Components.Holdable
---`Field Private Instance`
---@field hitPos System.Single
---`Field Private Instance`
---@field hitting System.Boolean
---`Field Private Instance`
---@field range System.Single
---`Field Private Instance`
---@field reload System.Single
---`Field Private Instance`
---@field reloadTimer System.Single
---`Field Private Instance`
---@field hitTargets (System.Collections.Generic.HashSet*1Barotrauma*Entity)|(Barotrauma.Entity[])
---`Field Private Instance`
---@field impactQueue (System.Collections.Generic.Queue*1FarseerPhysics*Dynamics*Fixture)|(fun():(FarseerPhysics.Dynamics.Fixture))
---`Field Public Instance`
---@field PreferredContainedItems (System.Collections.Immutable.ImmutableHashSet*1Barotrauma*Identifier)|(Barotrauma.Identifier[])
---`Field Private Instance`
---@field serverLogger System.Text.StringBuilder
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field Attack Barotrauma.Attack
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field User Barotrauma.Character
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Range System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Reload System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field AllowHitMultiple System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field HitOnlyCharacters System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Swing System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field SwingPos Microsoft.Xna.Framework.Vector2
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field SwingForce Microsoft.Xna.Framework.Vector2
---`Getter Public Instance`
---@field Hitting System.Boolean
_G['Components']['MeleeWeapon'] = {}

---`Method Public Instance Virtual`
---@param character Barotrauma.Character
_G['Components']['MeleeWeapon'].Equip = function(character) end

---`Method Public Instance Virtual`
---@param deltaTime System.Single
---@param character? Barotrauma.Character
---@return System.Boolean
_G['Components']['MeleeWeapon'].Use = function(deltaTime, character) end

---`Method Public Instance Virtual`
---@param deltaTime System.Single
---@param character? Barotrauma.Character
---@return System.Boolean
_G['Components']['MeleeWeapon'].SecondaryUse = function(deltaTime, character) end

---`Method Public Instance Virtual`
---@param dropper Barotrauma.Character
---@param setTransform? System.Boolean
_G['Components']['MeleeWeapon'].Drop = function(dropper, setTransform) end

---`Method Public Instance Virtual`
---@param deltaTime System.Single
---@param cam Barotrauma.Camera
_G['Components']['MeleeWeapon'].UpdateBroken = function(deltaTime, cam) end

---`Method Public Instance Virtual`
---@param deltaTime System.Single
---@param cam Barotrauma.Camera
_G['Components']['MeleeWeapon'].Update = function(deltaTime, cam) end

---`Method Private Instance`
_G['Components']['MeleeWeapon'].ActivateNearbySleepingCharacters = function() end

---`Method Private Instance`
---@param character Barotrauma.Character
_G['Components']['MeleeWeapon'].SetUser = function(character) end

---`Method Private Instance`
_G['Components']['MeleeWeapon'].EndHit = function() end

---`Method Private Instance`
_G['Components']['MeleeWeapon'].RestoreCollision = function() end

---`Method Private Instance`
---@param f1 FarseerPhysics.Dynamics.Fixture
---@param f2 FarseerPhysics.Dynamics.Fixture
---@param contact FarseerPhysics.Dynamics.Contacts.Contact
---@return System.Boolean
_G['Components']['MeleeWeapon'].OnCollision = function(f1, f2, contact) end

---`Method Private Instance`
---@param targetFixture FarseerPhysics.Dynamics.Fixture
_G['Components']['MeleeWeapon'].HandleImpact = function(targetFixture) end

---`Constructor Public Instance`
---@param item Barotrauma.Item
---@param element Barotrauma.ContentXElement
---@return Barotrauma.Items.Components.MeleeWeapon
_G['Components']['MeleeWeapon'] = function(item, element) end

---`Constructor Public Instance`
---@param item Barotrauma.Item
---@param element Barotrauma.ContentXElement
---@return Barotrauma.Items.Components.MeleeWeapon
_G['Components']['MeleeWeapon'].__new = function(item, element) end

