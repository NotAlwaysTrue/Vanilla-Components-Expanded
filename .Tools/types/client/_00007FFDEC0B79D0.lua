---@meta
---@class Barotrauma.AIObjectiveCleanupItems : Barotrauma.AIObjectiveLoop*1Barotrauma*Item
---`Field Public Instance`
---@field prioritizedItems (System.Collections.Generic.List*1Barotrauma*Item)|(Barotrauma.Item[])
---`Getter Public Instance Virtual`
---<br/>`Setter Public Instance Virtual`
---@field Identifier Barotrauma.Identifier
---`Getter Public Instance Virtual`
---@field KeepDivingGearOn System.Boolean
---`Getter Public Instance Virtual`
---@field AllowAutomaticItemUnequipping System.Boolean
---`Getter NonPublic Instance Virtual`
---@field ForceOrderPriority System.Boolean
---`Getter NonPublic Instance Virtual`
---@field MaxTargets System.Int32
_G['AIObjectiveCleanupItems'] = {}

---`Method NonPublic Instance Virtual`
---@return System.Single
_G['AIObjectiveCleanupItems'].GetTargetPriority = function() end

---`Method NonPublic Instance Virtual`
---@param target Barotrauma.Item
---@return System.Boolean
_G['AIObjectiveCleanupItems'].IsValidTarget = function(target) end

---`Method Public Static`
---@param item Barotrauma.Item
---@param character Barotrauma.Character
---@param checkInventory System.Boolean
---@param allowUnloading? System.Boolean
---@param requireValidContainer? System.Boolean
---@param ignoreItemsMarkedForDeconstruction? System.Boolean
---@return System.Boolean
_G['AIObjectiveCleanupItems'].IsValidTarget = function(item, character, checkInventory, allowUnloading, requireValidContainer, ignoreItemsMarkedForDeconstruction) end

---`Method NonPublic Instance Virtual`
---@return (System.Collections.Generic.IEnumerable*1Barotrauma*Item)|(fun():(Barotrauma.Item))
_G['AIObjectiveCleanupItems'].GetList = function() end

---`Method NonPublic Instance Virtual`
---@param item Barotrauma.Item
---@return Barotrauma.AIObjective
_G['AIObjectiveCleanupItems'].ObjectiveConstructor = function(item) end

---`Method NonPublic Instance Virtual`
---@param objective Barotrauma.AIObjective
---@param target Barotrauma.Item
_G['AIObjectiveCleanupItems'].OnObjectiveCompleted = function(objective, target) end

---`Method Public Static`
---@param item Barotrauma.Item
---@param character Barotrauma.Character
---@return System.Boolean
_G['AIObjectiveCleanupItems'].IsItemInsideValidSubmarine = function(item, character) end

---`Method Public Static`
---@param container Barotrauma.Item
---@param character Barotrauma.Character
---@return System.Boolean
_G['AIObjectiveCleanupItems'].IsValidContainer = function(container, character) end

---`Method Public Instance Virtual`
_G['AIObjectiveCleanupItems'].OnDeselected = function() end

---`Constructor Public Instance`
---@overload fun(character:Barotrauma.Character, objectiveManager:Barotrauma.AIObjectiveManager, prioritizedItem?:Barotrauma.Item, priorityModifier?:System.Single):Barotrauma.AIObjectiveCleanupItems
---@param character Barotrauma.Character
---@param objectiveManager Barotrauma.AIObjectiveManager
---@param prioritizedItems (System.Collections.Generic.IEnumerable*1Barotrauma*Item)|(fun():(Barotrauma.Item))
---@param priorityModifier? System.Single
---@return Barotrauma.AIObjectiveCleanupItems
_G['AIObjectiveCleanupItems'] = function(character, objectiveManager, prioritizedItems, priorityModifier) end

---`Constructor Public Instance`
---@overload fun(character:Barotrauma.Character, objectiveManager:Barotrauma.AIObjectiveManager, prioritizedItem?:Barotrauma.Item, priorityModifier?:System.Single):Barotrauma.AIObjectiveCleanupItems
---@param character Barotrauma.Character
---@param objectiveManager Barotrauma.AIObjectiveManager
---@param prioritizedItems (System.Collections.Generic.IEnumerable*1Barotrauma*Item)|(fun():(Barotrauma.Item))
---@param priorityModifier? System.Single
---@return Barotrauma.AIObjectiveCleanupItems
_G['AIObjectiveCleanupItems'].__new = function(character, objectiveManager, prioritizedItems, priorityModifier) end

