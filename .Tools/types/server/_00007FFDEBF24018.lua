---@meta
---@class Barotrauma.LatchOntoAI : System.Object
---`Field Private Instance`
---@field raycastTimer System.Single
---`Field Private Instance`
---@field targetBody FarseerPhysics.Dynamics.Body
---`Field Private Instance`
---@field attachSurfaceNormal Microsoft.Xna.Framework.Vector2
---`Field Private Instance`
---@field character Barotrauma.Character
---`Field Private Instance`
---@field minDeattachSpeed System.Single
---`Field Private Instance`
---@field maxDeattachSpeed System.Single
---`Field Private Instance`
---@field maxAttachDuration System.Single
---`Field Private Instance`
---@field coolDown System.Single
---`Field Private Instance`
---@field damageOnDetach System.Single
---`Field Private Instance`
---@field detachStun System.Single
---`Field Private Instance`
---@field weld System.Boolean
---`Field Private Instance`
---@field deattachCheckTimer System.Single
---`Field Private Instance`
---@field _attachPos Microsoft.Xna.Framework.Vector2
---`Field Private Instance`
---@field attachCooldown System.Single
---`Field Private Instance`
---@field attachLimb Barotrauma.Limb
---`Field Private Instance`
---@field localAttachPos Microsoft.Xna.Framework.Vector2
---`Field Private Instance`
---@field attachLimbRotation System.Single
---`Field Private Instance`
---@field jointDir System.Single
---`Field Private Instance`
---@field latchedDuration System.Single
---`Field Private Instance`
---@field freezeWhenLatched System.Boolean
---`Field Private Static`
---@field RaycastInterval System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field AttachToSub System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field AttachToWalls System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field AttachToCharacters System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field TargetSubmarine Barotrauma.Submarine
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field TargetWall Barotrauma.Structure
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field TargetCharacter Barotrauma.Character
---`Getter Public Instance`
---@field AttachJoints (System.Collections.Generic.List*1FarseerPhysics*Dynamics*Joints*Joint)|(FarseerPhysics.Dynamics.Joints.Joint[])
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field AttachPos System.Nullable*1Microsoft*Xna*Framework*Vector2
---`Getter Public Instance`
---@field IsAttached System.Boolean
---`Getter Public Instance`
---@field IsAttachedToSub System.Boolean
_G['LatchOntoAI'] = {}

---`Method Public Instance`
---@overload fun(wall:Barotrauma.Structure, attachPos:Microsoft.Xna.Framework.Vector2, attachSurfaceNormal:Microsoft.Xna.Framework.Vector2)
---@overload fun(target:Barotrauma.Character)
---@param levelWall Voronoi2.VoronoiCell
_G['LatchOntoAI'].SetAttachTarget = function(levelWall) end

---`Method Public Instance`
---@param enemyAI Barotrauma.EnemyAIController
---@param deltaTime System.Single
_G['LatchOntoAI'].Update = function(enemyAI, deltaTime) end

---`Method Public Instance`
---@param attachPos Microsoft.Xna.Framework.Vector2
---@param forceAttachSurfaceNormal? System.Nullable*1Microsoft*Xna*Framework*Vector2
---@param forceColliderSimPosition? System.Nullable*1Microsoft*Xna*Framework*Vector2
_G['LatchOntoAI'].AttachToBody = function(attachPos, forceAttachSurfaceNormal, forceColliderSimPosition) end

---`Method Public Instance`
---@param reset System.Boolean
---@param cooldown? System.Single
_G['LatchOntoAI'].DeattachFromBody = function(reset, cooldown) end

---`Method Private Instance`
_G['LatchOntoAI'].Reset = function() end

---`Method Private Instance`
---@param character Barotrauma.Character
---@param causeOfDeath Barotrauma.CauseOfDeath
_G['LatchOntoAI'].OnCharacterDeath = function(character, causeOfDeath) end

---`Constructor Public Instance`
---@param element System.Xml.Linq.XElement
---@param enemyAI Barotrauma.EnemyAIController
---@return Barotrauma.LatchOntoAI
_G['LatchOntoAI'] = function(element, enemyAI) end

---`Constructor Public Instance`
---@param element System.Xml.Linq.XElement
---@param enemyAI Barotrauma.EnemyAIController
---@return Barotrauma.LatchOntoAI
_G['LatchOntoAI'].__new = function(element, enemyAI) end

