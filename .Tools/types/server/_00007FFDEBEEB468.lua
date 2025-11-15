---@meta
---@class Barotrauma.Event : System.Object
---`Field Private Instance`
---@field Finished (System.Action)|(fun())
---`Field NonPublic Instance`
---@field isFinished System.Boolean
---`Field Public Instance`
---@field RandomSeed System.Int32
---`Field NonPublic Instance`
---@field prefab Barotrauma.EventPrefab
---`Field Public Instance`
---@field SpawnPosFilter (System.Func*1Barotrauma*Level*InterestingPosition*1System*Boolean)|(fun(arg:Barotrauma.Level.InterestingPosition):(System.Boolean))
---`Getter Public Instance`
---@field Prefab Barotrauma.EventPrefab
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field ParentSet Barotrauma.EventSet
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field Initialized System.Boolean
---`Getter Public Instance`
---@field IsFinished System.Boolean
---`Getter Public Instance Virtual`
---@field DebugDrawPos Microsoft.Xna.Framework.Vector2
_G['Event'] = {}

---`Method Public Instance Virtual`
---@return System.String
_G['Event'].ToString = function() end

---`Method Public Instance Virtual`
---@return (System.Collections.Generic.IEnumerable*1Barotrauma*ContentFile)|(fun():(Barotrauma.ContentFile))
_G['Event'].GetFilesToPreload = function() end

---`Method Public Instance`
---@param parentSet? Barotrauma.EventSet
_G['Event'].Init = function(parentSet) end

---`Method NonPublic Instance Virtual`
---@param parentSet? Barotrauma.EventSet
_G['Event'].InitEventSpecific = function(parentSet) end

---`Method Public Instance Virtual`
---@return System.String
_G['Event'].GetDebugInfo = function() end

---`Method Public Instance Virtual`
---@param deltaTime System.Single
_G['Event'].Update = function(deltaTime) end

---`Method Public Instance Virtual`
_G['Event'].Finish = function() end

---`Method Public Instance Virtual`
---@return System.Boolean
_G['Event'].LevelMeetsRequirements = function() end

---`Constructor Public Instance`
---@param prefab Barotrauma.EventPrefab
---@param seed System.Int32
---@return Barotrauma.Event
_G['Event'] = function(prefab, seed) end

---`Constructor Public Instance`
---@param prefab Barotrauma.EventPrefab
---@param seed System.Int32
---@return Barotrauma.Event
_G['Event'].__new = function(prefab, seed) end

