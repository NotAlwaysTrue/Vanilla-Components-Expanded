---@meta
---@class Barotrauma.AIObjectiveIdle : Barotrauma.AIObjective
---`Field Private Instance`
---@field behavior Barotrauma.AIObjectiveIdle.BehaviorType
---`Field Private Instance`
---@field newTargetIntervalMin System.Single
---`Field Private Instance`
---@field newTargetIntervalMax System.Single
---`Field Private Instance`
---@field standStillMin System.Single
---`Field Private Instance`
---@field standStillMax System.Single
---`Field Private Instance`
---@field walkDurationMin System.Single
---`Field Private Instance`
---@field walkDurationMax System.Single
---`Field Private Instance`
---@field currentTarget Barotrauma.Hull
---`Field Private Instance`
---@field newTargetTimer System.Single
---`Field Private Instance`
---@field searchingNewHull System.Boolean
---`Field Private Instance`
---@field standStillTimer System.Single
---`Field Private Instance`
---@field walkDuration System.Single
---`Field Private Instance`
---@field tooCloseCharacter Barotrauma.Character
---`Field Private Instance`
---@field chairCheckTimer System.Single
---`Field Private Instance`
---@field autonomousObjectiveRetryTimer System.Single
---`Field Private Instance`
---@field targetHulls (System.Collections.Generic.List*1Barotrauma*Hull)|(Barotrauma.Hull[])
---`Field Private Instance`
---@field hullWeights (System.Collections.Generic.List*1System*Single)|(System.Single[])
---`Field Public Instance`
---@field PreferredOutpostModuleTypes (System.Collections.Generic.HashSet*1Barotrauma*Identifier)|(Barotrauma.Identifier[])
---`Field Private Instance`
---@field timerMargin System.Single
---`Field Private Instance`
---@field checkItemsInterval System.Single
---`Field Private Instance`
---@field checkItemsTimer System.Single
---`Field Private Instance`
---@field itemsToClean (System.Collections.Generic.List*1Barotrauma*Item)|(Barotrauma.Item[])
---`Field Private Instance`
---@field ignoredItems (System.Collections.Generic.List*1Barotrauma*Item)|(Barotrauma.Item[])
---`Field Private Static`
---@field chairCheckInterval System.Single
---`Getter Public Instance Virtual`
---<br/>`Setter Public Instance Virtual`
---@field Identifier Barotrauma.Identifier
---`Getter Public Instance Virtual`
---@field AllowAutomaticItemUnequipping System.Boolean
---`Getter NonPublic Instance Virtual`
---@field AllowInAnySub System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Behavior Barotrauma.AIObjectiveIdle.BehaviorType
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field TargetHull Barotrauma.Hull
---`Getter Public Instance Virtual`
---@field CanBeCompleted System.Boolean
_G['AIObjectiveIdle'] = {}

---`Method NonPublic Instance Virtual`
---@return System.Boolean
_G['AIObjectiveIdle'].CheckObjectiveState = function() end

---`Method Public Instance`
---@param max? System.Single
_G['AIObjectiveIdle'].CalculatePriority = function(max) end

---`Method NonPublic Instance Virtual`
---@return System.Single
_G['AIObjectiveIdle'].GetPriority = function() end

---`Method Public Instance Virtual`
---@param deltaTime System.Single
_G['AIObjectiveIdle'].Update = function(deltaTime) end

---`Method Private Instance`
_G['AIObjectiveIdle'].SetTargetTimerLow = function() end

---`Method Private Instance`
_G['AIObjectiveIdle'].SetTargetTimerHigh = function() end

---`Method Private Instance`
_G['AIObjectiveIdle'].SetTargetTimerNormal = function() end

---`Method Private Instance`
---@return System.Boolean
_G['AIObjectiveIdle'].IsSteeringFinished = function() end

---`Method NonPublic Instance Virtual`
---@param deltaTime System.Single
_G['AIObjectiveIdle'].Act = function(deltaTime) end

---`Method Public Instance`
---@param deltaTime System.Single
_G['AIObjectiveIdle'].Wander = function(deltaTime) end

---`Method Public Instance`
---@param target Barotrauma.ISpatialEntity
---@param waitTime System.Single
_G['AIObjectiveIdle'].FaceTargetAndWait = function(target, waitTime) end

---`Method Private Instance`
_G['AIObjectiveIdle'].FindTargetHulls = function() end

---`Method Private Instance`
---@param deltaTime System.Single
_G['AIObjectiveIdle'].CleanupItems = function(deltaTime) end

---`Method Public Static`
---@param hull Barotrauma.Hull
---@return System.Boolean
_G['AIObjectiveIdle'].IsForbidden = function(hull) end

---`Method Public Instance Virtual`
_G['AIObjectiveIdle'].Reset = function() end

---`Method Public Instance Virtual`
_G['AIObjectiveIdle'].OnDeselected = function() end

---`Constructor Public Instance`
---@param character Barotrauma.Character
---@param objectiveManager Barotrauma.AIObjectiveManager
---@param priorityModifier? System.Single
---@return Barotrauma.AIObjectiveIdle
_G['AIObjectiveIdle'] = function(character, objectiveManager, priorityModifier) end

---`Constructor Public Instance`
---@param character Barotrauma.Character
---@param objectiveManager Barotrauma.AIObjectiveManager
---@param priorityModifier? System.Single
---@return Barotrauma.AIObjectiveIdle
_G['AIObjectiveIdle'].__new = function(character, objectiveManager, priorityModifier) end

