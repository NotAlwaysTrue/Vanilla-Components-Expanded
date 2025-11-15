---@meta
---@class Barotrauma.AIObjectiveRepairItems : Barotrauma.AIObjectiveLoop*1Barotrauma*Item
---`Field Public Instance`
---@field RelevantSkill Barotrauma.Identifier
---`Field Public Static`
---@field RequiredSuccessFactor System.Single
---`Getter Public Instance Virtual`
---<br/>`Setter Public Instance Virtual`
---@field Identifier Barotrauma.Identifier
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field PrioritizedItem Barotrauma.Item
---`Getter Public Instance Virtual`
---@field AllowMultipleInstances System.Boolean
---`Getter NonPublic Instance Virtual`
---@field AllowInFriendlySubs System.Boolean
_G['AIObjectiveRepairItems'] = {}

---`Method Public Instance Virtual`
---@param otherObjective Barotrauma.AIObjectiveRepairItems.T
---@return System.Boolean
_G['AIObjectiveRepairItems'].IsDuplicate = function(otherObjective) end

---`Method NonPublic Instance Virtual`
_G['AIObjectiveRepairItems'].CreateObjectives = function() end

---`Method NonPublic Instance Virtual`
---@param item Barotrauma.Item
---@return System.Boolean
_G['AIObjectiveRepairItems'].IsValidTarget = function(item) end

---`Method Public Static`
---@param item Barotrauma.Item
---@param character Barotrauma.Character
---@return System.Boolean
_G['AIObjectiveRepairItems'].IsValidTarget = function(item, character) end

---`Method Public Static`
---@param item Barotrauma.Item
---@param character Barotrauma.Character
---@param humanAIController Barotrauma.HumanAIController
---@return System.Boolean
_G['AIObjectiveRepairItems'].ViableForRepair = function(item, character, humanAIController) end

---`Method Public Static`
---@param item Barotrauma.Item
---@return System.Boolean
_G['AIObjectiveRepairItems'].NearlyFullCondition = function(item) end

---`Method NonPublic Instance Virtual`
---@return System.Single
_G['AIObjectiveRepairItems'].GetTargetPriority = function() end

---`Method Public Static`
---@param item Barotrauma.Item
---@param character Barotrauma.Character
---@param requiredSuccessFactor? System.Single
---@return System.Single
_G['AIObjectiveRepairItems'].GetTargetPriority = function(item, character, requiredSuccessFactor) end

---`Method NonPublic Instance Virtual`
---@return (System.Collections.Generic.IEnumerable*1Barotrauma*Item)|(fun():(Barotrauma.Item))
_G['AIObjectiveRepairItems'].GetList = function() end

---`Method NonPublic Instance Virtual`
---@param item Barotrauma.Item
---@return Barotrauma.AIObjective
_G['AIObjectiveRepairItems'].ObjectiveConstructor = function(item) end

---`Method NonPublic Instance Virtual`
---@param objective Barotrauma.AIObjective
---@param target Barotrauma.Item
_G['AIObjectiveRepairItems'].OnObjectiveCompleted = function(objective, target) end

---`Method Public Static`
---@param character Barotrauma.Character
---@param target Barotrauma.Item
---@return System.Boolean
_G['AIObjectiveRepairItems'].IsItemRepairedByAnother = function(character, target) end

---`Constructor Public Instance`
---@param character Barotrauma.Character
---@param objectiveManager Barotrauma.AIObjectiveManager
---@param priorityModifier? System.Single
---@param prioritizedItem? Barotrauma.Item
---@return Barotrauma.AIObjectiveRepairItems
_G['AIObjectiveRepairItems'] = function(character, objectiveManager, priorityModifier, prioritizedItem) end

---`Constructor Public Instance`
---@param character Barotrauma.Character
---@param objectiveManager Barotrauma.AIObjectiveManager
---@param priorityModifier? System.Single
---@param prioritizedItem? Barotrauma.Item
---@return Barotrauma.AIObjectiveRepairItems
_G['AIObjectiveRepairItems'].__new = function(character, objectiveManager, priorityModifier, prioritizedItem) end

