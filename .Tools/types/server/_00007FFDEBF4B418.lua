---@meta
---@class Barotrauma.AIObjectiveRepairItem : Barotrauma.AIObjective
---`Field Private Instance`
---@field goToObjective Barotrauma.AIObjectiveGoTo
---`Field Private Instance`
---@field refuelObjective Barotrauma.AIObjectiveContainItem
---`Field Private Instance`
---@field repairTool Barotrauma.Items.Components.RepairTool
---`Field Private Instance`
---@field waitTimer System.Single
---`Field Private Instance`
---@field isPriority System.Boolean
---`Field Private Instance`
---@field conditionCheckTimer System.Single
---`Field Private Instance`
---@field previousCondition System.Single
---`Field Private Static`
---@field WaitTimeBeforeRepair System.Single
---`Field Private Static`
---@field conditionCheckDelay System.Single
---`Getter Public Instance Virtual`
---<br/>`Setter Public Instance Virtual`
---@field Identifier Barotrauma.Identifier
---`Getter Public Instance Virtual`
---@field DebugTag System.String
---`Getter NonPublic Instance Virtual`
---@field AllowInFriendlySubs System.Boolean
---`Getter Public Instance Virtual`
---@field KeepDivingGearOn System.Boolean
---`Getter NonPublic Instance Virtual`
---@field AllowWhileHandcuffed System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field Item Barotrauma.Item
_G['AIObjectiveRepairItem'] = {}

---`Method Private Instance`
---@return System.Boolean
_G['AIObjectiveRepairItem'].IsRepairing = function() end

---`Method Public Static`
---@param character Barotrauma.Character
---@param item Barotrauma.Item
---@return System.Boolean
_G['AIObjectiveRepairItem'].IsRepairing = function(character, item) end

---`Method NonPublic Instance Virtual`
---@return System.Single
_G['AIObjectiveRepairItem'].GetPriority = function() end

---`Method NonPublic Instance Virtual`
---@return System.Boolean
_G['AIObjectiveRepairItem'].CheckObjectiveState = function() end

---`Method NonPublic Instance Virtual`
---@param deltaTime System.Single
_G['AIObjectiveRepairItem'].Act = function(deltaTime) end

---`Method Private Instance`
---@param deltaTime System.Single
_G['AIObjectiveRepairItem'].CheckPreviousCondition = function(deltaTime) end

---`Method Private Instance`
_G['AIObjectiveRepairItem'].FindRepairTool = function() end

---`Method Private Instance`
---@param deltaTime System.Single
_G['AIObjectiveRepairItem'].OperateRepairTool = function(deltaTime) end

---`Method Public Instance Virtual`
_G['AIObjectiveRepairItem'].Reset = function() end

---`Constructor Public Instance`
---@param character Barotrauma.Character
---@param item Barotrauma.Item
---@param objectiveManager Barotrauma.AIObjectiveManager
---@param priorityModifier? System.Single
---@param isPriority? System.Boolean
---@return Barotrauma.AIObjectiveRepairItem
_G['AIObjectiveRepairItem'] = function(character, item, objectiveManager, priorityModifier, isPriority) end

---`Constructor Public Instance`
---@param character Barotrauma.Character
---@param item Barotrauma.Item
---@param objectiveManager Barotrauma.AIObjectiveManager
---@param priorityModifier? System.Single
---@param isPriority? System.Boolean
---@return Barotrauma.AIObjectiveRepairItem
_G['AIObjectiveRepairItem'].__new = function(character, item, objectiveManager, priorityModifier, isPriority) end

