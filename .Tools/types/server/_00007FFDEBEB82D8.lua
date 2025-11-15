---@meta
---@class Barotrauma.SteeringManager : System.Object
---`Field NonPublic Instance`
---@field host Barotrauma.ISteerable
---`Field NonPublic Instance`
---@field steering Microsoft.Xna.Framework.Vector2
---`Field Private Instance`
---@field lastRayCastTime System.Single
---`Field Private Instance`
---@field avoidRayCastHit System.Boolean
---`Field Private Instance`
---@field wanderAngle System.Single
---`Field NonPublic Static`
---@field CircleDistance System.Single
---`Field NonPublic Static`
---@field CircleRadius System.Single
---`Field NonPublic Static`
---@field RayCastInterval System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field AvoidDir Microsoft.Xna.Framework.Vector2
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field AvoidRayCastHitPosition Microsoft.Xna.Framework.Vector2
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field AvoidLookAheadPos Microsoft.Xna.Framework.Vector2
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field WanderAngle System.Single
_G['SteeringManager'] = {}

---`Method Public Instance`
---@param targetSimPos Microsoft.Xna.Framework.Vector2
---@param weight? System.Single
_G['SteeringManager'].SteeringSeek = function(targetSimPos, weight) end

---`Method Public Instance`
---@param weight? System.Single
---@param avoidWanderingOutsideLevel? System.Boolean
_G['SteeringManager'].SteeringWander = function(weight, avoidWanderingOutsideLevel) end

---`Method Public Instance`
---@param deltaTime System.Single
---@param lookAheadDistance System.Single
---@param weight? System.Single
_G['SteeringManager'].SteeringAvoid = function(deltaTime, lookAheadDistance, weight) end

---`Method Public Instance`
---@param deltaTime System.Single
---@param velocity Microsoft.Xna.Framework.Vector2
_G['SteeringManager'].SteeringManual = function(deltaTime, velocity) end

---`Method Public Instance`
_G['SteeringManager'].Reset = function() end

---`Method Public Instance`
_G['SteeringManager'].ResetX = function() end

---`Method Public Instance`
_G['SteeringManager'].ResetY = function() end

---`Method Public Instance Virtual`
---@param speed System.Single
_G['SteeringManager'].Update = function(speed) end

---`Method NonPublic Instance Virtual`
---@param target Microsoft.Xna.Framework.Vector2
---@param weight System.Single
---@return Microsoft.Xna.Framework.Vector2
_G['SteeringManager'].DoSteeringSeek = function(target, weight) end

---`Method NonPublic Instance Virtual`
---@param weight System.Single
---@param avoidWanderingOutsideLevel System.Boolean
---@return Microsoft.Xna.Framework.Vector2
_G['SteeringManager'].DoSteeringWander = function(weight, avoidWanderingOutsideLevel) end

---`Method NonPublic Instance Virtual`
---@param deltaTime System.Single
---@param lookAheadDistance System.Single
---@param weight System.Single
---@param heading? System.Nullable*1Microsoft*Xna*Framework*Vector2
---@return Microsoft.Xna.Framework.Vector2
_G['SteeringManager'].DoSteeringAvoid = function(deltaTime, lookAheadDistance, weight, heading) end

---`Constructor Public Instance`
---@param host Barotrauma.ISteerable
---@return Barotrauma.SteeringManager
_G['SteeringManager'] = function(host) end

---`Constructor Public Instance`
---@param host Barotrauma.ISteerable
---@return Barotrauma.SteeringManager
_G['SteeringManager'].__new = function(host) end

