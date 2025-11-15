---@meta
---@class Barotrauma.AIObjectiveReturn : Barotrauma.AIObjective
---`Field Private Instance`
---@field moveInsideObjective Barotrauma.AIObjectiveGoTo
---`Field Private Instance`
---@field moveOutsideObjective Barotrauma.AIObjectiveGoTo
---`Field Private Instance`
---@field usingEscapeBehavior System.Boolean
---`Field Private Instance`
---@field isSteeringThroughGap System.Boolean
---`Getter Public Instance Virtual`
---<br/>`Setter Public Instance Virtual`
---@field Identifier Barotrauma.Identifier
---`Getter Public Instance`
---@field Target Barotrauma.Submarine
---`Getter NonPublic Instance Virtual`
---@field AllowOutsideSubmarine System.Boolean
---`Getter NonPublic Instance Virtual`
---@field AllowInAnySub System.Boolean
_G['AIObjectiveReturn'] = {}

---`Method NonPublic Instance Virtual`
---@return System.Single
_G['AIObjectiveReturn'].GetPriority = function() end

---`Method NonPublic Instance Virtual`
---@param deltaTime System.Single
_G['AIObjectiveReturn'].Act = function(deltaTime) end

---`Method NonPublic Instance Virtual`
---@return System.Boolean
_G['AIObjectiveReturn'].CheckObjectiveState = function() end

---`Method Public Instance Virtual`
_G['AIObjectiveReturn'].Reset = function() end

---`Method NonPublic Instance Virtual`
_G['AIObjectiveReturn'].OnAbandon = function() end

---`Constructor Public Instance`
---@param character Barotrauma.Character
---@param orderGiver Barotrauma.Character
---@param objectiveManager Barotrauma.AIObjectiveManager
---@param priorityModifier? System.Single
---@return Barotrauma.AIObjectiveReturn
_G['AIObjectiveReturn'] = function(character, orderGiver, objectiveManager, priorityModifier) end

---`Constructor Public Instance`
---@param character Barotrauma.Character
---@param orderGiver Barotrauma.Character
---@param objectiveManager Barotrauma.AIObjectiveManager
---@param priorityModifier? System.Single
---@return Barotrauma.AIObjectiveReturn
_G['AIObjectiveReturn'].__new = function(character, orderGiver, objectiveManager, priorityModifier) end

