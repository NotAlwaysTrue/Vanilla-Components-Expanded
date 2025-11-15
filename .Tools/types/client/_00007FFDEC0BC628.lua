---@meta
---@class Barotrauma.AIObjectiveFindSafety : Barotrauma.AIObjective
---`Field Private Instance`
---@field currentHullSafety System.Single
---`Field Private Instance`
---@field searchHullTimer System.Single
---`Field Private Instance`
---@field goToObjective Barotrauma.AIObjectiveGoTo
---`Field Private Instance`
---@field divingGearObjective Barotrauma.AIObjectiveFindDivingGear
---`Field Private Instance`
---@field resetPriority System.Boolean
---`Field Private Instance`
---@field currentSafeHull Barotrauma.Hull
---`Field Private Instance`
---@field previousSafeHull Barotrauma.Hull
---`Field Private Instance`
---@field cannotFindSafeHull System.Boolean
---`Field Private Instance`
---@field cannotFindDivingGear System.Boolean
---`Field Private Instance`
---@field findDivingGearAttempts System.Int32
---`Field Private Instance`
---@field retryCounter System.Int32
---`Field Private Instance`
---@field retryResetTime System.Single
---`Field Private Instance`
---@field retryTimer System.Single
---`Field Private Instance`
---@field hulls (System.Collections.Generic.List*1Barotrauma*Hull)|(Barotrauma.Hull[])
---`Field Private Instance`
---@field hullSearchIndex System.Int32
---`Field Private Instance`
---@field bestHullValue System.Single
---`Field Private Instance`
---@field bestHullIsAirlock System.Boolean
---`Field Private Instance`
---@field potentialBestHull Barotrauma.Hull
---`Field Private Instance`
---@field stopWatch System.Diagnostics.Stopwatch
---`Field Private Static`
---@field PriorityIncrease System.Single
---`Field Private Static`
---@field PriorityDecrease System.Single
---`Field Private Static`
---@field SearchHullInterval System.Single
---`Getter Public Instance Virtual`
---<br/>`Setter Public Instance Virtual`
---@field Identifier Barotrauma.Identifier
---`Getter Public Instance Virtual`
---@field ForceRun System.Boolean
---`Getter Public Instance Virtual`
---@field KeepDivingGearOn System.Boolean
---`Getter Public Instance Virtual`
---@field IgnoreUnsafeHulls System.Boolean
---`Getter NonPublic Instance Virtual`
---@field ConcurrentObjectives System.Boolean
---`Getter NonPublic Instance Virtual`
---@field AllowOutsideSubmarine System.Boolean
---`Getter NonPublic Instance Virtual`
---@field AllowInAnySub System.Boolean
---`Getter Public Instance Virtual`
---@field AbandonWhenCannotCompleteSubObjectives System.Boolean
---`Getter Public Instance Virtual`
---@field CanBeCompleted System.Boolean
_G['AIObjectiveFindSafety'] = {}

---`Method NonPublic Instance Virtual`
---@return System.Boolean
_G['AIObjectiveFindSafety'].CheckObjectiveState = function() end

---`Method NonPublic Instance Virtual`
---@return System.Single
_G['AIObjectiveFindSafety'].GetPriority = function() end

---`Method Public Instance Virtual`
---@param deltaTime System.Single
_G['AIObjectiveFindSafety'].Update = function(deltaTime) end

---`Method NonPublic Instance Virtual`
---@param deltaTime System.Single
_G['AIObjectiveFindSafety'].Act = function(deltaTime) end

---`Method Public Instance`
---@param deltaTime System.Single
_G['AIObjectiveFindSafety'].UpdateSimpleEscape = function(deltaTime) end

---`Method Public Instance`
---@param bestHull Barotrauma.Hull-ref
---@param ignoredHulls? (System.Collections.Generic.IEnumerable*1Barotrauma*Hull)|(fun():(Barotrauma.Hull))
---@param allowChangingSubmarine? System.Boolean
---@return Barotrauma.AIObjectiveFindSafety.HullSearchStatus
_G['AIObjectiveFindSafety'].FindBestHull = function(bestHull, ignoredHulls, allowChangingSubmarine) end

---`Method Public Instance Virtual`
_G['AIObjectiveFindSafety'].Reset = function() end

---`Method Private Instance`
---@param targetHull Barotrauma.Hull
---@param minOxygen? System.Single
---@return System.Boolean
_G['AIObjectiveFindSafety'].NeedMoreDivingGear = function(targetHull, minOxygen) end

---`Constructor Public Instance`
---@param character Barotrauma.Character
---@param objectiveManager Barotrauma.AIObjectiveManager
---@param priorityModifier? System.Single
---@return Barotrauma.AIObjectiveFindSafety
_G['AIObjectiveFindSafety'] = function(character, objectiveManager, priorityModifier) end

---`Constructor Public Instance`
---@param character Barotrauma.Character
---@param objectiveManager Barotrauma.AIObjectiveManager
---@param priorityModifier? System.Single
---@return Barotrauma.AIObjectiveFindSafety
_G['AIObjectiveFindSafety'].__new = function(character, objectiveManager, priorityModifier) end

