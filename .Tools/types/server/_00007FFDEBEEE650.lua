---@meta
---@class Barotrauma.ArtifactEvent : Barotrauma.Event
---`Field Private Instance`
---@field itemPrefab Barotrauma.ItemPrefab
---`Field Private Instance`
---@field item Barotrauma.Item
---`Field Private Instance`
---@field state System.Int32
---`Field Private Instance`
---@field spawnPos Microsoft.Xna.Framework.Vector2
---`Field Private Instance`
---@field spawnPending System.Boolean
---`Getter Public Instance`
---@field SpawnPending System.Boolean
---`Getter Public Instance`
---@field State System.Int32
---`Getter Public Instance`
---@field Item Barotrauma.Item
---`Getter Public Instance`
---@field SpawnPos Microsoft.Xna.Framework.Vector2
---`Getter Public Instance Virtual`
---@field DebugDrawPos Microsoft.Xna.Framework.Vector2
_G['ArtifactEvent'] = {}

---`Method Public Instance Virtual`
---@return System.String
_G['ArtifactEvent'].ToString = function() end

---`Method NonPublic Instance Virtual`
---@param parentSet Barotrauma.EventSet
_G['ArtifactEvent'].InitEventSpecific = function(parentSet) end

---`Method Public Instance Virtual`
---@return System.String
_G['ArtifactEvent'].GetDebugInfo = function() end

---`Method Private Instance`
_G['ArtifactEvent'].SpawnItem = function() end

---`Method Public Instance Virtual`
---@param deltaTime System.Single
_G['ArtifactEvent'].Update = function(deltaTime) end

---`Constructor Public Instance`
---@param prefab Barotrauma.EventPrefab
---@param seed System.Int32
---@return Barotrauma.ArtifactEvent
_G['ArtifactEvent'] = function(prefab, seed) end

---`Constructor Public Instance`
---@param prefab Barotrauma.EventPrefab
---@param seed System.Int32
---@return Barotrauma.ArtifactEvent
_G['ArtifactEvent'].__new = function(prefab, seed) end

