---@meta
---@class Barotrauma.AIObjectiveManager : System.Object
---`Field Private Instance`
---@field character Barotrauma.Character
---`Field Private Instance`
---@field _waitTimer System.Single
---`Field Private Instance`
---@field currentOrder Barotrauma.AIObjective
---`Field Public Instance`
---@field FailedToFindDivingGearForDepth System.Boolean
---`Field Public Static`
---@field MaxObjectivePriority System.Single
---`Field Public Static`
---@field EmergencyObjectivePriority System.Single
---`Field Public Static`
---@field HighestOrderPriority System.Single
---`Field Public Static`
---@field LowestOrderPriority System.Single
---`Field Public Static`
---@field RunPriority System.Single
---`Field Public Static`
---@field baseDevotion System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field Objectives (System.Collections.Generic.List*1Barotrauma*AIObjective)|(Barotrauma.AIObjective[])
---`Getter Public Instance`
---@field HumanAIController Barotrauma.HumanAIController
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field WaitTimer System.Single
---`Getter Public Instance`
---@field CurrentOrders (System.Collections.Generic.List*1Barotrauma*Order)|(Barotrauma.Order[])
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field CurrentOrder Barotrauma.AIObjective
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field ForcedOrder Barotrauma.AIObjective
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field CurrentObjective Barotrauma.AIObjective
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field DelayedObjectives (System.Collections.Generic.Dictionary*1Barotrauma*AIObjective*1Barotrauma*CoroutineHandle)|({[Barotrauma.AIObjective]:(Barotrauma.CoroutineHandle)})
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field FailedAutonomousObjectives System.Boolean
_G['AIObjectiveManager'] = {}

---`Method Public Instance`
---@overload fun(objective:Barotrauma.AIObjective)
---@overload fun(objective:Barotrauma.AIObjectiveManager.T)
---@param objective Barotrauma.AIObjectiveManager.T
---@param delay System.Single
---@param callback? (System.Action)|(fun())
_G['AIObjectiveManager'].AddObjective = function(objective, delay, callback) end

---`Method Private Instance`
_G['AIObjectiveManager'].ClearIgnored = function() end

---`Method Public Instance`
_G['AIObjectiveManager'].CreateAutonomousObjectives = function() end

---`Method Public Instance`
---@return Barotrauma.AIObjectiveManager.T
_G['AIObjectiveManager'].GetObjective = function() end

---`Method Private Instance`
---@return Barotrauma.AIObjective
_G['AIObjectiveManager'].GetCurrentObjective = function() end

---`Method Public Instance`
---@return System.Single
_G['AIObjectiveManager'].GetCurrentPriority = function() end

---`Method Public Instance`
---@param deltaTime System.Single
_G['AIObjectiveManager'].UpdateObjectives = function(deltaTime) end

---`Method Public Instance`
_G['AIObjectiveManager'].SortObjectives = function() end

---`Method Public Instance`
---@param deltaTime System.Single
_G['AIObjectiveManager'].DoCurrentObjective = function(deltaTime) end

---`Method Public Instance`
---@param objective Barotrauma.AIObjective
_G['AIObjectiveManager'].SetForcedOrder = function(objective) end

---`Method Public Instance`
_G['AIObjectiveManager'].ClearForcedOrder = function() end

---`Method Public Instance`
---@param order Barotrauma.Order
---@param speak System.Boolean
_G['AIObjectiveManager'].SetOrder = function(order, speak) end

---`Method Public Instance`
---@param order Barotrauma.Order
---@param priorityModifier? System.Single
---@return Barotrauma.AIObjective
_G['AIObjectiveManager'].CreateObjective = function(order, priorityModifier) end

---`Method Private Instance`
---@param order Barotrauma.Order
_G['AIObjectiveManager'].DismissSelf = function(order) end

---`Method Private Instance`
---@return System.Boolean
_G['AIObjectiveManager'].IsAllowedToWait = function() end

---`Method Public Instance`
---@return System.Boolean
_G['AIObjectiveManager'].IsCurrentOrder = function() end

---`Method Public Instance`
---@return System.Boolean
_G['AIObjectiveManager'].IsCurrentObjective = function() end

---`Method Public Instance`
---@return System.Boolean
_G['AIObjectiveManager'].HasObjectiveOrOrder = function() end

---`Method Public Instance`
---@return Barotrauma.AIObjective
_G['AIObjectiveManager'].GetActiveObjective = function() end

---`Method Public Instance`
---@overload fun():(Barotrauma.AIObjectiveManager.T)
---@param objective Barotrauma.AIObjective
---@return Barotrauma.Order
_G['AIObjectiveManager'].GetOrder = function(objective) end

---`Method Public Instance`
---@return Barotrauma.AIObjectiveManager.T
_G['AIObjectiveManager'].GetLastActiveObjective = function() end

---`Method Public Instance`
---@return Barotrauma.AIObjectiveManager.T
_G['AIObjectiveManager'].GetFirstActiveObjective = function() end

---`Method Public Instance`
---@return (System.Collections.Generic.IEnumerable*1Barotrauma*AIObjectiveManager*T)|(fun():(Barotrauma.AIObjectiveManager.T))
_G['AIObjectiveManager'].GetActiveObjectives = function() end

---`Method Public Instance`
---@return System.Boolean
_G['AIObjectiveManager'].HasActiveObjective = function() end

---`Method Public Instance`
---@param objective Barotrauma.AIObjective
---@return System.Boolean
_G['AIObjectiveManager'].IsOrder = function(objective) end

---`Method Public Instance`
---@return System.Boolean
_G['AIObjectiveManager'].HasOrders = function() end

---`Method Public Instance`
---@param predicate? (System.Func*1Barotrauma*AIObjectiveManager*T*1System*Boolean)|(fun(arg:Barotrauma.AIObjectiveManager.T):(System.Boolean))
---@return System.Boolean
_G['AIObjectiveManager'].HasOrder = function(predicate) end

---`Method Public Instance`
---@param objective Barotrauma.AIObjective
---@return System.Single
_G['AIObjectiveManager'].GetOrderPriority = function(objective) end

---`Method Public Instance`
---@return Barotrauma.Order
_G['AIObjectiveManager'].GetCurrentOrderInfo = function() end

---`Constructor Public Instance`
---@param character Barotrauma.Character
---@return Barotrauma.AIObjectiveManager
_G['AIObjectiveManager'] = function(character) end

---`Constructor Public Instance`
---@param character Barotrauma.Character
---@return Barotrauma.AIObjectiveManager
_G['AIObjectiveManager'].__new = function(character) end

