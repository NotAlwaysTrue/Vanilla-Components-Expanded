---@meta
---@class Barotrauma.AIObjectiveOperateItem : Barotrauma.AIObjective
---`Field Private Instance`
---@field component Barotrauma.Items.Components.ItemComponent
---`Field Private Instance`
---@field controller Barotrauma.Items.Components.ItemComponent
---`Field Private Instance`
---@field operateTarget Barotrauma.Entity
---`Field Private Instance`
---@field requireEquip System.Boolean
---`Field Private Instance`
---@field useController System.Boolean
---`Field Private Instance`
---@field goToObjective Barotrauma.AIObjectiveGoTo
---`Field Private Instance`
---@field getItemObjective Barotrauma.AIObjectiveGetItem
---`Field Public Instance`
---@field EndNodeFilter (System.Func*1Barotrauma*PathNode*1System*Boolean)|(fun(arg:Barotrauma.PathNode):(System.Boolean))
---`Field Public Instance`
---@field completionCondition (System.Func*1System*Boolean)|(fun():(System.Boolean))
---`Field Private Instance`
---@field isDoneOperating System.Boolean
---`Field Public Instance`
---@field OverridePriority System.Nullable*1System*Single
---`Getter Public Instance Virtual`
---<br/>`Setter Public Instance Virtual`
---@field Identifier Barotrauma.Identifier
---`Getter Public Instance Virtual`
---@field DebugTag System.String
---`Getter Public Instance Virtual`
---@field AllowAutomaticItemUnequipping System.Boolean
---`Getter Public Instance Virtual`
---@field AllowMultipleInstances System.Boolean
---`Getter NonPublic Instance Virtual`
---@field AllowInAnySub System.Boolean
---`Getter NonPublic Instance Virtual`
---@field AllowWhileHandcuffed System.Boolean
---`Getter Public Instance Virtual`
---@field PrioritizeIfSubObjectivesActive System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Override System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Repeat System.Boolean
---`Getter Public Instance Virtual`
---@field CanBeCompleted System.Boolean
---`Getter Public Instance`
---@field OperateTarget Barotrauma.Entity
---`Getter Public Instance`
---@field Component Barotrauma.Items.Components.ItemComponent
_G['AIObjectiveOperateItem'] = {}

---`Method Public Instance Virtual`
---@param otherObjective Barotrauma.AIObjectiveOperateItem.T
---@return System.Boolean
_G['AIObjectiveOperateItem'].IsDuplicate = function(otherObjective) end

---`Method Public Instance`
---@return Barotrauma.Items.Components.ItemComponent
_G['AIObjectiveOperateItem'].GetTarget = function() end

---`Method NonPublic Instance Virtual`
---@return System.Single
_G['AIObjectiveOperateItem'].GetPriority = function() end

---`Method NonPublic Instance Virtual`
---@param deltaTime System.Single
_G['AIObjectiveOperateItem'].Act = function(deltaTime) end

---`Method NonPublic Instance Virtual`
---@return System.Boolean
_G['AIObjectiveOperateItem'].CheckObjectiveState = function() end

---`Method Public Instance Virtual`
_G['AIObjectiveOperateItem'].Reset = function() end

---`Method Private Instance`
---@param target Barotrauma.Items.Components.ItemComponent
---@return System.Boolean
_G['AIObjectiveOperateItem'].IsItemOperatedByAnother = function(target) end

---`Constructor Public Instance`
---@param item Barotrauma.Items.Components.ItemComponent
---@param character Barotrauma.Character
---@param objectiveManager Barotrauma.AIObjectiveManager
---@param option Barotrauma.Identifier
---@param requireEquip System.Boolean
---@param operateTarget? Barotrauma.Entity
---@param useController? System.Boolean
---@param controller? Barotrauma.Items.Components.ItemComponent
---@param priorityModifier? System.Single
---@return Barotrauma.AIObjectiveOperateItem
_G['AIObjectiveOperateItem'] = function(item, character, objectiveManager, option, requireEquip, operateTarget, useController, controller, priorityModifier) end

---`Constructor Public Instance`
---@param item Barotrauma.Items.Components.ItemComponent
---@param character Barotrauma.Character
---@param objectiveManager Barotrauma.AIObjectiveManager
---@param option Barotrauma.Identifier
---@param requireEquip System.Boolean
---@param operateTarget? Barotrauma.Entity
---@param useController? System.Boolean
---@param controller? Barotrauma.Items.Components.ItemComponent
---@param priorityModifier? System.Single
---@return Barotrauma.AIObjectiveOperateItem
_G['AIObjectiveOperateItem'].__new = function(item, character, objectiveManager, option, requireEquip, operateTarget, useController, controller, priorityModifier) end

