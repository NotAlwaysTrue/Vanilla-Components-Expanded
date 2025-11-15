---@meta
---@class Barotrauma.FireSource : System.Object
---`Field Private Instance`
---@field lightSource Barotrauma.Lights.LightSource
---`Field Private Instance`
---@field particleTimer System.Single
---`Field NonPublic Instance`
---@field hull Barotrauma.Hull
---`Field NonPublic Instance`
---@field position Microsoft.Xna.Framework.Vector2
---`Field NonPublic Instance`
---@field size Microsoft.Xna.Framework.Vector2
---`Field Private Instance`
---@field submarine Barotrauma.Submarine
---`Field NonPublic Instance`
---@field removed System.Boolean
---`Field Private Instance`
---@field burnDecals (System.Collections.Generic.List*1Barotrauma*Decal)|(Barotrauma.Decal[])
---`Field Public Instance`
---@field SourceCharacter Barotrauma.Character
---`Field Private Instance`
---@field spreadToOtherHullsTimer System.Single
---`Field Private Static`
---@field OxygenConsumption System.Single
---`Field Private Static`
---@field GrowSpeed System.Single
---`Field Private Static`
---@field MaxDamageRange System.Single
---`Field Private Static`
---@field SpreadToOtherHullsInterval System.Single
---`Getter NonPublic Instance Virtual`
---@field SpreadToOtherHullsProbability System.Single
---`Getter Public Instance Virtual`
---@field Submarine Barotrauma.Submarine
---`Getter Public Instance Virtual`
---<br/>`Setter Public Instance`
---@field Position Microsoft.Xna.Framework.Vector2
---`Getter Public Instance Virtual`
---@field WorldPosition Microsoft.Xna.Framework.Vector2
---`Getter Public Instance Virtual`
---@field SimPosition Microsoft.Xna.Framework.Vector2
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Size Microsoft.Xna.Framework.Vector2
---`Getter Public Instance Virtual`
---@field DamageRange System.Single
---`Getter Public Instance`
---@field FlameHeight System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field DamagesItems System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field DamagesCharacters System.Boolean
---`Getter Public Instance`
---@field Removed System.Boolean
---`Getter Public Instance`
---@field Hull Barotrauma.Hull
_G['FireSource'] = {}

---`Method Public Instance`
---@param size Microsoft.Xna.Framework.Vector2
---@param worldPosition Microsoft.Xna.Framework.Vector2
---@param deltaTime System.Single
---@param hull Barotrauma.Hull
---@param growModifier System.Single
_G['FireSource'].EmitParticles = function(size, worldPosition, deltaTime, hull, growModifier) end

---`Method NonPublic Instance Virtual`
_G['FireSource'].LimitSize = function() end

---`Method Public Static`
---@overload fun(fireSources:(System.Collections.Generic.List*1Barotrauma*FireSource)|(Barotrauma.FireSource[]), deltaTime:System.Single)
---@param fireSources (System.Collections.Generic.List*1Barotrauma*DummyFireSource)|(Barotrauma.DummyFireSource[])
---@param deltaTime System.Single
_G['FireSource'].UpdateAll = function(fireSources, deltaTime) end

---`Method Private Instance`
---@param fireSource Barotrauma.FireSource
---@return System.Boolean
_G['FireSource'].CheckOverLap = function(fireSource) end

---`Method Public Instance`
---@param deltaTime System.Single
_G['FireSource'].Update = function(deltaTime) end

---`Method Private Instance`
_G['FireSource'].TrySpreadToNearbyHulls = function() end

---`Method NonPublic Instance Virtual`
---@param deltaTime System.Single
_G['FireSource'].ReduceOxygen = function(deltaTime) end

---`Method NonPublic Instance Virtual`
---@param growModifier System.Single
---@param deltaTime System.Single
_G['FireSource'].AdjustXPos = function(growModifier, deltaTime) end

---`Method Private Instance`
---@param growModifier System.Single
---@param deltaTime System.Single
_G['FireSource'].UpdateProjSpecific = function(growModifier, deltaTime) end

---`Method Private Instance`
---@param deltaTime System.Single
_G['FireSource'].DamageCharacters = function(deltaTime) end

---`Method Public Instance`
---@overload fun(c:Barotrauma.Character, damageRange:System.Single):(System.Boolean)
---@param worldPosition Microsoft.Xna.Framework.Vector2
---@param damageRange System.Single
---@return System.Boolean
_G['FireSource'].IsInDamageRange = function(worldPosition, damageRange) end

---`Method Private Instance`
---@param deltaTime System.Single
_G['FireSource'].DamageItems = function(deltaTime) end

---`Method Private Instance`
---@param deltaTime System.Single
_G['FireSource'].HullWaterExtinguish = function(deltaTime) end

---`Method Public Instance`
---@overload fun(deltaTime:System.Single, amount:System.Single)
---@param deltaTime System.Single
---@param amount System.Single
---@param worldPosition Microsoft.Xna.Framework.Vector2
_G['FireSource'].Extinguish = function(deltaTime, amount, worldPosition) end

---`Method Public Instance`
_G['FireSource'].Remove = function() end

---`Constructor Public Instance`
---@param worldPosition Microsoft.Xna.Framework.Vector2
---@param spawningHull? Barotrauma.Hull
---@param sourceCharacter? Barotrauma.Character
---@param isNetworkMessage? System.Boolean
---@return Barotrauma.FireSource
_G['FireSource'] = function(worldPosition, spawningHull, sourceCharacter, isNetworkMessage) end

---`Constructor Public Instance`
---@param worldPosition Microsoft.Xna.Framework.Vector2
---@param spawningHull? Barotrauma.Hull
---@param sourceCharacter? Barotrauma.Character
---@param isNetworkMessage? System.Boolean
---@return Barotrauma.FireSource
_G['FireSource'].__new = function(worldPosition, spawningHull, sourceCharacter, isNetworkMessage) end

