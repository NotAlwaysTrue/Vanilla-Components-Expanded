---@meta
---@class Barotrauma.MalfunctionEvent : Barotrauma.Event
---`Field Private Instance`
---@field targetItemIdentifiers (Barotrauma.Identifier-arr)|(Barotrauma.Identifier[])
---`Field Private Instance`
---@field targetItems (System.Collections.Generic.List*1Barotrauma*Item)|(Barotrauma.Item[])
---`Field Private Instance`
---@field minItemAmount System.Int32
---`Field Private Instance`
---@field maxItemAmount System.Int32
---`Field Private Instance`
---@field decreaseConditionAmount System.Single
---`Field Private Instance`
---@field duration System.Single
---`Field Private Instance`
---@field timer System.Single
_G['MalfunctionEvent'] = {}

---`Method Public Instance Virtual`
---@return System.String
_G['MalfunctionEvent'].ToString = function() end

---`Method NonPublic Instance Virtual`
---@param parentSet Barotrauma.EventSet
_G['MalfunctionEvent'].InitEventSpecific = function(parentSet) end

---`Method Public Instance Virtual`
---@param deltaTime System.Single
_G['MalfunctionEvent'].Update = function(deltaTime) end

---`Constructor Public Instance`
---@param prefab Barotrauma.EventPrefab
---@param seed System.Int32
---@return Barotrauma.MalfunctionEvent
_G['MalfunctionEvent'] = function(prefab, seed) end

---`Constructor Public Instance`
---@param prefab Barotrauma.EventPrefab
---@param seed System.Int32
---@return Barotrauma.MalfunctionEvent
_G['MalfunctionEvent'].__new = function(prefab, seed) end

