---@meta
---@class Barotrauma.AIObjectiveRescueAll : Barotrauma.AIObjectiveLoop*1Barotrauma*Character
---`Field Private Instance`
---@field charactersWithMinorInjuries (System.Collections.Generic.HashSet*1Barotrauma*Character)|(Barotrauma.Character[])
---`Field Private Static`
---@field vitalityThreshold System.Single
---`Field Private Static`
---@field vitalityThresholdForOrders System.Single
---`Getter Public Instance Virtual`
---<br/>`Setter Public Instance Virtual`
---@field Identifier Barotrauma.Identifier
---`Getter Public Instance Virtual`
---@field ForceRun System.Boolean
---`Getter Public Instance Virtual`
---@field InverseTargetPriority System.Boolean
---`Getter NonPublic Instance Virtual`
---@field AllowOutsideSubmarine System.Boolean
---`Getter NonPublic Instance Virtual`
---@field AllowInAnySub System.Boolean
_G['AIObjectiveRescueAll'] = {}

---`Method Public Static`
---@param manager Barotrauma.AIObjectiveManager
---@param character Barotrauma.Character
---@param target Barotrauma.Character
---@return System.Single
_G['AIObjectiveRescueAll'].GetVitalityThreshold = function(manager, character, target) end

---`Method NonPublic Instance Virtual`
---@param target Barotrauma.Character
---@return System.Boolean
_G['AIObjectiveRescueAll'].IsValidTarget = function(target) end

---`Method Public Static`
---@param target Barotrauma.Character
---@param character Barotrauma.Character
---@param ignoredAsMinorWounds System.Boolean-ref
---@return System.Boolean
_G['AIObjectiveRescueAll'].IsValidTarget = function(target, character, ignoredAsMinorWounds) end

---`Method NonPublic Instance Virtual`
---@return (System.Collections.Generic.IEnumerable*1Barotrauma*Character)|(fun():(Barotrauma.Character))
_G['AIObjectiveRescueAll'].GetList = function() end

---`Method NonPublic Instance Virtual`
---@return System.Single
_G['AIObjectiveRescueAll'].GetTargetPriority = function() end

---`Method Public Static`
---@param character Barotrauma.Character
---@return System.Single
_G['AIObjectiveRescueAll'].GetVitalityFactor = function(character) end

---`Method Public Static`
---@param character Barotrauma.Character
---@param ignoreTreatmentThreshold System.Boolean
---@return (System.Collections.Generic.IEnumerable*1Barotrauma*Affliction)|(fun():(Barotrauma.Affliction))
_G['AIObjectiveRescueAll'].GetTreatableAfflictions = function(character, ignoreTreatmentThreshold) end

---`Method NonPublic Instance Virtual`
---@param target Barotrauma.Character
---@return Barotrauma.AIObjective
_G['AIObjectiveRescueAll'].ObjectiveConstructor = function(target) end

---`Method NonPublic Instance Virtual`
---@param objective Barotrauma.AIObjective
---@param target Barotrauma.Character
_G['AIObjectiveRescueAll'].OnObjectiveCompleted = function(objective, target) end

---`Method Private Static`
---@param target Barotrauma.Character
---@param humanAI Barotrauma.HumanAIController
---@return System.Boolean
_G['AIObjectiveRescueAll'].IsValidTargetForAI = function(target, humanAI) end

---`Constructor Public Instance`
---@param character Barotrauma.Character
---@param objectiveManager Barotrauma.AIObjectiveManager
---@param priorityModifier? System.Single
---@return Barotrauma.AIObjectiveRescueAll
_G['AIObjectiveRescueAll'] = function(character, objectiveManager, priorityModifier) end

---`Constructor Public Instance`
---@param character Barotrauma.Character
---@param objectiveManager Barotrauma.AIObjectiveManager
---@param priorityModifier? System.Single
---@return Barotrauma.AIObjectiveRescueAll
_G['AIObjectiveRescueAll'].__new = function(character, objectiveManager, priorityModifier) end

