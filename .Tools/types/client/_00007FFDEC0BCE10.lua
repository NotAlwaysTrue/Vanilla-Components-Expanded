---@meta
---@class Barotrauma.AIObjectiveFixLeaks : Barotrauma.AIObjectiveLoop*1Barotrauma*Gap
---`Getter Public Instance Virtual`
---<br/>`Setter Public Instance Virtual`
---@field Identifier Barotrauma.Identifier
---`Getter Public Instance Virtual`
---@field ForceRun System.Boolean
---`Getter Public Instance Virtual`
---@field KeepDivingGearOn System.Boolean
---`Getter NonPublic Instance Virtual`
---@field AllowInFriendlySubs System.Boolean
---`Getter Private Instance`
---<br/>`Setter Private Instance`
---@field PrioritizedHull Barotrauma.Hull
_G['AIObjectiveFixLeaks'] = {}

---`Method NonPublic Instance Virtual`
---@param gap Barotrauma.Gap
---@return System.Boolean
_G['AIObjectiveFixLeaks'].IsValidTarget = function(gap) end

---`Method Public Static`
---@param gap Barotrauma.Gap
---@param character Barotrauma.Character
---@return System.Boolean
_G['AIObjectiveFixLeaks'].IsValidTarget = function(gap, character) end

---`Method Public Static`
---@param leak Barotrauma.Gap
---@return System.Single
_G['AIObjectiveFixLeaks'].GetLeakSeverity = function(leak) end

---`Method NonPublic Instance Virtual`
---@return System.Single
_G['AIObjectiveFixLeaks'].GetTargetPriority = function() end

---`Method NonPublic Instance Virtual`
---@return (System.Collections.Generic.IEnumerable*1Barotrauma*Gap)|(fun():(Barotrauma.Gap))
_G['AIObjectiveFixLeaks'].GetList = function() end

---`Method NonPublic Instance Virtual`
---@param gap Barotrauma.Gap
---@return Barotrauma.AIObjective
_G['AIObjectiveFixLeaks'].ObjectiveConstructor = function(gap) end

---`Method NonPublic Instance Virtual`
---@param objective Barotrauma.AIObjective
---@param target Barotrauma.Gap
_G['AIObjectiveFixLeaks'].OnObjectiveCompleted = function(objective, target) end

---`Constructor Public Instance`
---@param character Barotrauma.Character
---@param objectiveManager Barotrauma.AIObjectiveManager
---@param priorityModifier? System.Single
---@param prioritizedHull? Barotrauma.Hull
---@return Barotrauma.AIObjectiveFixLeaks
_G['AIObjectiveFixLeaks'] = function(character, objectiveManager, priorityModifier, prioritizedHull) end

---`Constructor Public Instance`
---@param character Barotrauma.Character
---@param objectiveManager Barotrauma.AIObjectiveManager
---@param priorityModifier? System.Single
---@param prioritizedHull? Barotrauma.Hull
---@return Barotrauma.AIObjectiveFixLeaks
_G['AIObjectiveFixLeaks'].__new = function(character, objectiveManager, priorityModifier, prioritizedHull) end

