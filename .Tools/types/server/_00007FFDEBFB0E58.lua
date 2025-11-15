---@meta
---@class Barotrauma.Items.Components.Rope : Barotrauma.Items.Components.ItemComponent
---`Field Private Instance`
---@field source Barotrauma.ISpatialEntity
---`Field Private Instance`
---@field target Barotrauma.Item
---`Field Private Instance`
---@field launchDir System.Nullable*1Microsoft*Xna*Framework*Vector2
---`Field Private Instance`
---@field currentRopeLength System.Single
---`Field Private Instance`
---@field snapTimer System.Single
---`Field Private Instance`
---@field raycastTimer System.Single
---`Field Private Instance`
---@field isReelingIn System.Boolean
---`Field Private Instance`
---@field snapped System.Boolean
---`Field Private Static`
---@field RayCastInterval System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field SnapAnimDuration System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field ProjectilePullForce System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field TargetPullForce System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field SourcePullForce System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field MaxLength System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field MinPullDistance System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field MaxAngle System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field SnapOnCollision System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field SnapWhenNotAimed System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field SnapWhenWeaponFiredAgain System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field BarrelLengthMultiplier System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field TargetMinMass System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field LerpForces System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field IncreaseForceForEscapingTargets System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Snapped System.Boolean
_G['Components']['Rope'] = {}

---`Method Public Instance Virtual`
---@param msg Barotrauma.Networking.IWriteMessage
---@param c Barotrauma.Networking.Client
---@param extraData? Barotrauma.Networking.NetEntityEvent.IData
_G['Components']['Rope'].ServerEventWrite = function(msg, c, extraData) end

---`Method Private Instance`
---@param source Barotrauma.ISpatialEntity
_G['Components']['Rope'].SetSource = function(source) end

---`Method Private Instance`
_G['Components']['Rope'].ResetSource = function() end

---`Method Public Instance`
_G['Components']['Rope'].Snap = function() end

---`Method Public Instance`
---@param source Barotrauma.ISpatialEntity
---@param target Barotrauma.Item
_G['Components']['Rope'].Attach = function(source, target) end

---`Method Public Instance Virtual`
---@param deltaTime System.Single
---@param cam Barotrauma.Camera
_G['Components']['Rope'].Update = function(deltaTime, cam) end

---`Method Public Instance Virtual`
---@param deltaTime System.Single
---@param cam Barotrauma.Camera
_G['Components']['Rope'].UpdateBroken = function(deltaTime, cam) end

---`Method Private Instance`
---@param useDrawPosition? System.Boolean
---@return Microsoft.Xna.Framework.Vector2
_G['Components']['Rope'].GetSourcePos = function(useDrawPosition) end

---`Method Private Static`
---@param target Barotrauma.ISpatialEntity
---@return Barotrauma.PhysicsBody
_G['Components']['Rope'].GetBodyToPull = function(target) end

---`Constructor Public Instance`
---@param item Barotrauma.Item
---@param element Barotrauma.ContentXElement
---@return Barotrauma.Items.Components.Rope
_G['Components']['Rope'] = function(item, element) end

---`Constructor Public Instance`
---@param item Barotrauma.Item
---@param element Barotrauma.ContentXElement
---@return Barotrauma.Items.Components.Rope
_G['Components']['Rope'].__new = function(item, element) end

