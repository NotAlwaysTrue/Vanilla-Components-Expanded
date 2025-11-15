---@meta
---@class Barotrauma.AIObjectiveDeconstructItems : Barotrauma.AIObjectiveLoop*1Barotrauma*Item
---`Field Private Instance`
---@field checkedDeconstructorExists System.Boolean
---`Getter Public Instance Virtual`
---<br/>`Setter Public Instance Virtual`
---@field Identifier Barotrauma.Identifier
---`Getter NonPublic Instance Virtual`
---@field IgnoreListClearInterval System.Single
---`Getter NonPublic Instance Virtual`
---@field AllowInFriendlySubs System.Boolean
---`Getter NonPublic Instance Virtual`
---@field MaxTargets System.Int32
_G['AIObjectiveDeconstructItems'] = {}

---`Method Public Instance Virtual`
_G['AIObjectiveDeconstructItems'].OnSelected = function() end

---`Method Public Instance Virtual`
_G['AIObjectiveDeconstructItems'].Reset = function() end

---`Method NonPublic Instance Virtual`
---@return System.Single
_G['AIObjectiveDeconstructItems'].GetTargetPriority = function() end

---`Method NonPublic Instance Virtual`
---@param target Barotrauma.Item
---@return System.Boolean
_G['AIObjectiveDeconstructItems'].IsValidTarget = function(target) end

---`Method Private Static`
---@param item Barotrauma.Item
---@param character Barotrauma.Character
---@param checkInventory System.Boolean
---@return System.Boolean
_G['AIObjectiveDeconstructItems'].IsValidTarget = function(item, character, checkInventory) end

---`Method NonPublic Instance Virtual`
---@return (System.Collections.Generic.IEnumerable*1Barotrauma*Item)|(fun():(Barotrauma.Item))
_G['AIObjectiveDeconstructItems'].GetList = function() end

---`Method NonPublic Instance Virtual`
---@param item Barotrauma.Item
---@return Barotrauma.AIObjective
_G['AIObjectiveDeconstructItems'].ObjectiveConstructor = function(item) end

---`Method NonPublic Instance Virtual`
---@param objective Barotrauma.AIObjective
---@param target Barotrauma.Item
_G['AIObjectiveDeconstructItems'].OnObjectiveCompleted = function(objective, target) end

---`Method Public Instance Virtual`
_G['AIObjectiveDeconstructItems'].OnDeselected = function() end

---`Constructor Public Instance`
---@param character Barotrauma.Character
---@param objectiveManager Barotrauma.AIObjectiveManager
---@param priorityModifier? System.Single
---@return Barotrauma.AIObjectiveDeconstructItems
_G['AIObjectiveDeconstructItems'] = function(character, objectiveManager, priorityModifier) end

---`Constructor Public Instance`
---@param character Barotrauma.Character
---@param objectiveManager Barotrauma.AIObjectiveManager
---@param priorityModifier? System.Single
---@return Barotrauma.AIObjectiveDeconstructItems
_G['AIObjectiveDeconstructItems'].__new = function(character, objectiveManager, priorityModifier) end

