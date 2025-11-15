---@meta
---@class Barotrauma.Items.Components.Projectile : Barotrauma.Items.Components.ItemComponent
---`Field Private Instance`
---@field particleEmitters (System.Collections.Generic.List*1Barotrauma*Particles*ParticleEmitter)|(Barotrauma.Particles.ParticleEmitter[])
---`Field Private Instance`
---@field impactQueue (System.Collections.Generic.Queue*1Barotrauma*Items*Components*Projectile*Impact)|(fun():(Barotrauma.Items.Components.Projectile.Impact))
---`Field Private Instance`
---@field removePending System.Boolean
---`Field Private Instance`
---@field spreadIndex System.Byte
---`Field Private Instance`
---@field stickJoint FarseerPhysics.Dynamics.Joints.Joint
---`Field Private Instance`
---@field jointAxis Microsoft.Xna.Framework.Vector2
---`Field Private Instance`
---@field launchPos Microsoft.Xna.Framework.Vector2
---`Field Public Instance`
---@field LaunchSub Barotrauma.Submarine
---`Field Private Instance`
---@field hits (System.Collections.Generic.HashSet*1FarseerPhysics*Dynamics*Body)|(FarseerPhysics.Dynamics.Body[])
---`Field Public Instance`
---@field IgnoredBodies (System.Collections.Generic.List*1FarseerPhysics*Dynamics*Body)|(FarseerPhysics.Dynamics.Body[])
---`Field Public Instance`
---@field Launcher Barotrauma.Item
---`Field Private Instance`
---@field stickTargetCharacter Barotrauma.Character
---`Field Private Instance`
---@field _user Barotrauma.Character
---`Field Private Instance`
---@field deactivationTimer System.Single
---`Field Private Instance`
---@field stickTimer System.Single
---`Field Private Instance`
---@field maxJointTranslationInSimUnits System.Single
---`Field Private Instance`
---@field originalCollisionCategories FarseerPhysics.Dynamics.Category
---`Field Private Instance`
---@field originalCollisionTargets FarseerPhysics.Dynamics.Category
---`Field Private Instance`
---@field targets (System.Collections.Generic.List*1Barotrauma*ISerializableEntity)|(Barotrauma.ISerializableEntity[])
---`Field Private Instance`
---@field lastTarget FarseerPhysics.Dynamics.Fixture
---`Field Private Static`
---@field spreadPool (System.Collections.Immutable.ImmutableArray*1System*Single)|(System.Single[])
---`Field Public Static`
---@field WaterDragCoefficient System.Single
---`Field Private Static`
---@field ContinuousCollisionThreshold System.Single
---`Getter Public Static`
---<br/>`Setter Private Static`
---@field SpreadCounter System.Byte
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field Attack Barotrauma.Attack
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field User Barotrauma.Character
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Attacker Barotrauma.Character
---`Getter Public Instance`
---@field Hits (System.Collections.Generic.IEnumerable*1FarseerPhysics*Dynamics*Body)|(fun():(FarseerPhysics.Dynamics.Body))
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field LaunchImpulse System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field ImpulseSpread System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field LaunchRotation System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field LaunchRotationRadians System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field DoesStick System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field StickToCharacters System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field StickToStructures System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field StickToItems System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field StickToDoors System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field StickToDeflective System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field StickToLightTargets System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field GoThroughLightTargets System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field LightTargetMassThreshold System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Hitscan System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field HitScanCount System.Int32
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field MaxTargetsToHit System.Int32
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field RemoveOnHit System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Spread System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field StaticSpread System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field FriendlyFire System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field DeactivationTime System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field StickDuration System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field MaxJointTranslation System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field JointBreakPoint System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Prismatic System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field IgnoreProjectilesWhileActive System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field StickTarget FarseerPhysics.Dynamics.Body
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field DamageDoors System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field DamageUser System.Boolean
---`Getter Public Instance`
---@field IsStuckToTarget System.Boolean
_G['Components']['Projectile'] = {}

---`Method Public Instance Virtual`
---@param msg Barotrauma.Networking.IReadMessage
---@param sendingTime System.Single
_G['Components']['Projectile'].ClientEventRead = function(msg, sendingTime) end

---`Method Public Static`
_G['Components']['Projectile'].ResetSpreadCounter = function() end

---`Method Private Instance`
---@param element Barotrauma.ContentXElement
_G['Components']['Projectile'].InitProjSpecific = function(element) end

---`Method Public Instance Virtual`
_G['Components']['Projectile'].OnItemLoaded = function() end

---`Method Public Instance`
---@return System.Single
_G['Components']['Projectile'].GetSpreadFromPool = function() end

---`Method Private Instance`
---@param user Barotrauma.Character
---@param simPosition Microsoft.Xna.Framework.Vector2
---@param rotation System.Single
---@param damageMultiplier? System.Single
---@param launchImpulseModifier? System.Single
_G['Components']['Projectile'].Launch = function(user, simPosition, rotation, damageMultiplier, launchImpulseModifier) end

---`Method Public Instance`
---@param user Barotrauma.Character
---@param weaponPos Microsoft.Xna.Framework.Vector2
---@param spawnPos Microsoft.Xna.Framework.Vector2
---@param rotation System.Single
---@param ignoredBodies (System.Collections.Generic.List*1FarseerPhysics*Dynamics*Body)|(FarseerPhysics.Dynamics.Body[])
---@param createNetworkEvent System.Boolean
---@param damageMultiplier? System.Single
---@param launchImpulseModifier? System.Single
_G['Components']['Projectile'].Shoot = function(user, weaponPos, spawnPos, rotation, ignoredBodies, createNetworkEvent, damageMultiplier, launchImpulseModifier) end

---`Method Public Instance`
---@param character? Barotrauma.Character
---@param launchImpulseModifier? System.Single
---@return System.Boolean
_G['Components']['Projectile'].Use = function(character, launchImpulseModifier) end

---`Method Public Instance Virtual`
---@param deltaTime System.Single
---@param character? Barotrauma.Character
---@return System.Boolean
_G['Components']['Projectile'].Use = function(deltaTime, character) end

---`Method Private Instance`
---@param unmodifiedLaunchRotation System.Single
---@return System.Single
_G['Components']['Projectile'].GetLaunchRotation = function(unmodifiedLaunchRotation) end

---`Method Private Instance`
---@param impulse Microsoft.Xna.Framework.Vector2
_G['Components']['Projectile'].DoLaunch = function(impulse) end

---`Method Private Instance`
---@param dir Microsoft.Xna.Framework.Vector2
_G['Components']['Projectile'].DoHitscan = function(dir) end

---`Method Private Instance`
---@param rayStart Microsoft.Xna.Framework.Vector2
---@param rayEnd Microsoft.Xna.Framework.Vector2
---@param submarine Barotrauma.Submarine
---@return (System.Collections.Generic.List*1Barotrauma*Items*Components*Projectile*HitscanResult)|(Barotrauma.Items.Components.Projectile.HitscanResult[])
_G['Components']['Projectile'].DoRayCast = function(rayStart, rayEnd, submarine) end

---`Method Public Instance Virtual`
---@param dropper Barotrauma.Character
---@param setTransform? System.Boolean
_G['Components']['Projectile'].Drop = function(dropper, setTransform) end

---`Method Public Instance Virtual`
---@param deltaTime System.Single
---@param cam Barotrauma.Camera
_G['Components']['Projectile'].Update = function(deltaTime, cam) end

---`Method Private Instance`
---@return System.Boolean
_G['Components']['Projectile'].StickTargetRemoved = function() end

---`Method Private Instance`
---@param f1 FarseerPhysics.Dynamics.Fixture
---@param target FarseerPhysics.Dynamics.Fixture
---@param contact FarseerPhysics.Dynamics.Contacts.Contact
---@return System.Boolean
_G['Components']['Projectile'].OnProjectileCollision = function(f1, target, contact) end

---`Method Private Instance`
---@param character Barotrauma.Character
---@return System.Boolean
_G['Components']['Projectile'].ShouldIgnoreCharacterCollision = function(character) end

---`Method Public Instance`
---@param target FarseerPhysics.Dynamics.Fixture
---@param contact FarseerPhysics.Dynamics.Contacts.Contact
---@return System.Boolean
_G['Components']['Projectile'].ShouldIgnoreSubmarineCollision = function(target, contact) end

---`Method Private Instance`
---@param target FarseerPhysics.Dynamics.Fixture-ref
---@param contact FarseerPhysics.Dynamics.Contacts.Contact
---@return System.Boolean
_G['Components']['Projectile'].ShouldIgnoreSubmarineCollision = function(target, contact) end

---`Method Private Instance`
---@param target FarseerPhysics.Dynamics.Fixture
---@param collisionNormal Microsoft.Xna.Framework.Vector2
---@param velocity Microsoft.Xna.Framework.Vector2
---@return System.Boolean
_G['Components']['Projectile'].HandleProjectileCollision = function(target, collisionNormal, velocity) end

---`Method Private Instance`
---@return System.Single
_G['Components']['Projectile'].GetLightTargetMassThreshold = function() end

---`Method Private Instance`
_G['Components']['Projectile'].EnableProjectileCollisions = function() end

---`Method Private Instance`
_G['Components']['Projectile'].DisableProjectileCollisions = function() end

---`Method Public Instance`
---@param body Barotrauma.PhysicsBody
---@return System.Boolean
_G['Components']['Projectile'].IsAttachedTo = function(body) end

---`Method Private Instance`
---@param targetBody FarseerPhysics.Dynamics.Body
---@param axis Microsoft.Xna.Framework.Vector2
_G['Components']['Projectile'].StickToTarget = function(targetBody, axis) end

---`Method Public Instance`
_G['Components']['Projectile'].Unstick = function() end

---`Method NonPublic Instance Virtual`
_G['Components']['Projectile'].RemoveComponentSpecific = function() end

---`Method Private Instance`
---@param startLocation Microsoft.Xna.Framework.Vector2
---@param endLocation Microsoft.Xna.Framework.Vector2
_G['Components']['Projectile'].LaunchProjSpecific = function(startLocation, endLocation) end

---`Constructor Private Static`
---@overload fun():Barotrauma.Items.Components.Projectile
---@param item Barotrauma.Item
---@param element Barotrauma.ContentXElement
---@return Barotrauma.Items.Components.Projectile
_G['Components']['Projectile'] = function(item, element) end

---`Constructor Private Static`
---@overload fun():Barotrauma.Items.Components.Projectile
---@param item Barotrauma.Item
---@param element Barotrauma.ContentXElement
---@return Barotrauma.Items.Components.Projectile
_G['Components']['Projectile'].__new = function(item, element) end

---`Constructor Public Instance`
---@overload fun():Barotrauma.Items.Components.Projectile
---@param item Barotrauma.Item
---@param element Barotrauma.ContentXElement
---@return Barotrauma.Items.Components.Projectile
_G['Components']['Projectile'] = function(item, element) end

---`Constructor Public Instance`
---@overload fun():Barotrauma.Items.Components.Projectile
---@param item Barotrauma.Item
---@param element Barotrauma.ContentXElement
---@return Barotrauma.Items.Components.Projectile
_G['Components']['Projectile'].__new = function(item, element) end

