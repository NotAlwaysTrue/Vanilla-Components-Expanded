---@meta
---@class Barotrauma.AIObjectiveCleanupItem : Barotrauma.AIObjective
---`Field Public Instance`
---@field item Barotrauma.Item
---`Field Private Instance`
---@field ignoredContainers (System.Collections.Generic.List*1Barotrauma*Item)|(Barotrauma.Item[])
---`Field Private Instance`
---@field moveItemObjective Barotrauma.AIObjectiveMoveItem
---`Field Private Instance`
---@field itemIndex System.Int32
---`Getter Public Instance Virtual`
---<br/>`Setter Public Instance Virtual`
---@field Identifier Barotrauma.Identifier
---`Getter Public Instance Virtual`
---@field KeepDivingGearOn System.Boolean
---`Getter Public Instance Virtual`
---@field AllowAutomaticItemUnequipping System.Boolean
---`Getter NonPublic Instance Virtual`
---@field AllowWhileHandcuffed System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field IsPriority System.Boolean
---`Getter NonPublic Instance Virtual`
---@field ConcurrentObjectives System.Boolean
_G['AIObjectiveCleanupItem'] = {}

---`Method NonPublic Instance Virtual`
---@return System.Single
_G['AIObjectiveCleanupItem'].GetPriority = function() end

---`Method NonPublic Instance Virtual`
---@param deltaTime System.Single
_G['AIObjectiveCleanupItem'].Act = function(deltaTime) end

---`Method NonPublic Instance Virtual`
---@return System.Boolean
_G['AIObjectiveCleanupItem'].CheckObjectiveState = function() end

---`Method Public Instance Virtual`
_G['AIObjectiveCleanupItem'].Reset = function() end

---`Method Public Instance`
_G['AIObjectiveCleanupItem'].DropTarget = function() end

---`Constructor Public Instance`
---@param item Barotrauma.Item
---@param character Barotrauma.Character
---@param objectiveManager Barotrauma.AIObjectiveManager
---@param priorityModifier? System.Single
---@return Barotrauma.AIObjectiveCleanupItem
_G['AIObjectiveCleanupItem'] = function(item, character, objectiveManager, priorityModifier) end

---`Constructor Public Instance`
---@param item Barotrauma.Item
---@param character Barotrauma.Character
---@param objectiveManager Barotrauma.AIObjectiveManager
---@param priorityModifier? System.Single
---@return Barotrauma.AIObjectiveCleanupItem
_G['AIObjectiveCleanupItem'].__new = function(item, character, objectiveManager, priorityModifier) end

