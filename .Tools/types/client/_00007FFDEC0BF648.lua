---@meta
---@class Barotrauma.AIObjectiveGoTo : Barotrauma.AIObjective
---`Field Public Instance`
---@field IsFindDivingGearSubObjective System.Boolean
---`Field Private Instance`
---@field findDivingGear Barotrauma.AIObjectiveFindDivingGear
---`Field Private Instance`
---@field repeat System.Boolean
---`Field Private Instance`
---@field waitUntilPathUnreachable System.Single
---`Field Private Instance`
---@field getDivingGearIfNeeded System.Boolean
---`Field Public Instance`
---@field requiredCondition (System.Func*1System*Boolean)|(fun():(System.Boolean))
---`Field Public Instance`
---@field endNodeFilter (System.Func*1Barotrauma*PathNode*1System*Boolean)|(fun(arg:Barotrauma.PathNode):(System.Boolean))
---`Field Public Instance`
---@field PriorityGetter (System.Func*1System*Single)|(fun():(System.Single))
---`Field Public Instance`
---@field IsFollowOrder System.Boolean
---`Field Public Instance`
---@field IsWaitOrder System.Boolean
---`Field Public Instance`
---@field Mimic System.Boolean
---`Field Public Instance`
---@field ExtraDistanceWhileSwimming System.Single
---`Field Public Instance`
---@field ExtraDistanceOutsideSub System.Single
---`Field Private Instance`
---@field _closeEnoughMultiplier System.Single
---`Field Private Instance`
---@field _closeEnough System.Single
---`Field Private Instance`
---@field minDistance System.Single
---`Field Private Instance`
---@field seekGapsInterval System.Single
---`Field Private Instance`
---@field seekGapsTimer System.Single
---`Field Private Instance`
---@field cantFindDivingGear System.Boolean
---`Field Private Instance`
---@field ExoSuitRefuel Barotrauma.Identifier
---`Field Private Instance`
---@field ExoSuitOutOfFuel Barotrauma.Identifier
---`Field Public Instance`
---@field OverridePriority System.Nullable*1System*Single
---`Field Private Instance`
---@field avoidLookAheadDistance System.Single
---`Field Private Instance`
---@field pathWaitingTime System.Single
---`Field Private Instance`
---@field useScooter System.Boolean
---`Field Private Instance`
---@field checkScooterTimer System.Single
---`Field Private Instance`
---@field checkExoSuitTimer System.Single
---`Field Public Static`
---@field DialogCannotReachTarget Barotrauma.Identifier
---`Field Public Static`
---@field DialogCannotReachPlace Barotrauma.Identifier
---`Field Public Static`
---@field DialogCannotReachPatient Barotrauma.Identifier
---`Field Public Static`
---@field DialogCannotReachFire Barotrauma.Identifier
---`Field Public Static`
---@field DialogCannotReachLeak Barotrauma.Identifier
---`Field Private Static`
---@field CheckScooterTime System.Single
---`Field Private Static`
---@field CheckExoSuitTime System.Single
---`Getter Public Instance Virtual`
---<br/>`Setter Public Instance Virtual`
---@field Identifier Barotrauma.Identifier
---`Getter Public Instance Virtual`
---@field DebugTag System.String
---`Getter Public Instance Virtual`
---@field KeepDivingGearOn System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field SpeakIfFails System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field DebugLogWhenFails System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field UsePathingOutside System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field CloseEnoughMultiplier System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field CloseEnough System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field IgnoreIfTargetDead System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field AllowGoingOutside System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field FaceTargetOnCompleted System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field AlwaysUseEuclideanDistance System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field UseDistanceRelativeToAimSourcePos System.Boolean
---`Getter Public Instance Virtual`
---@field AbandonWhenCannotCompleteSubObjectives System.Boolean
---`Getter NonPublic Instance Virtual`
---@field AllowOutsideSubmarine System.Boolean
---`Getter NonPublic Instance Virtual`
---@field AllowInAnySub System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field DialogueIdentifier Barotrauma.Identifier
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field TargetName Barotrauma.LocalizedString
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field Target Barotrauma.ISpatialEntity
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field SpeakCannotReachCondition (System.Func*1System*Boolean)|(fun():(System.Boolean))
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field TargetGap Barotrauma.Gap
---`Getter Public Instance`
---@field IsCloseEnough System.Boolean
_G['AIObjectiveGoTo'] = {}

---`Method NonPublic Instance Virtual`
---@return System.Single
_G['AIObjectiveGoTo'].GetPriority = function() end

---`Method Private Instance`
_G['AIObjectiveGoTo'].SpeakCannotReach = function() end

---`Method Public Instance`
---@param deltaTime System.Single
_G['AIObjectiveGoTo'].ForceAct = function(deltaTime) end

---`Method NonPublic Instance Virtual`
---@param deltaTime System.Single
_G['AIObjectiveGoTo'].Act = function(deltaTime) end

---`Method Public Instance`
---@return Barotrauma.Hull
_G['AIObjectiveGoTo'].GetTargetHull = function() end

---`Method Public Static`
---@param target Barotrauma.ISpatialEntity
---@return Barotrauma.Hull
_G['AIObjectiveGoTo'].GetTargetHull = function(target) end

---`Method Private Instance`
---@param maxDistance System.Single
_G['AIObjectiveGoTo'].SeekGaps = function(maxDistance) end

---`Method NonPublic Instance Virtual`
---@return System.Boolean
_G['AIObjectiveGoTo'].CheckObjectiveState = function() end

---`Method NonPublic Instance Virtual`
_G['AIObjectiveGoTo'].OnAbandon = function() end

---`Method Private Instance`
_G['AIObjectiveGoTo'].StopMovement = function() end

---`Method NonPublic Instance Virtual`
_G['AIObjectiveGoTo'].OnCompleted = function() end

---`Method Public Instance Virtual`
_G['AIObjectiveGoTo'].Reset = function() end

---`Method Public Instance`
---@param run System.Boolean
---@return System.Boolean
_G['AIObjectiveGoTo'].ShouldRun = function(run) end

---`Constructor Public Instance`
---@overload fun(target:Barotrauma.ISpatialEntity, character:Barotrauma.Character, objectiveManager:Barotrauma.AIObjectiveManager, luaKey__repeat?:System.Boolean, getDivingGearIfNeeded?:System.Boolean, priorityModifier?:System.Single, closeEnough?:System.Single):Barotrauma.AIObjectiveGoTo
---@return Barotrauma.AIObjectiveGoTo
_G['AIObjectiveGoTo'] = function() end

---`Constructor Public Instance`
---@overload fun(target:Barotrauma.ISpatialEntity, character:Barotrauma.Character, objectiveManager:Barotrauma.AIObjectiveManager, luaKey__repeat?:System.Boolean, getDivingGearIfNeeded?:System.Boolean, priorityModifier?:System.Single, closeEnough?:System.Single):Barotrauma.AIObjectiveGoTo
---@return Barotrauma.AIObjectiveGoTo
_G['AIObjectiveGoTo'].__new = function() end

---`Constructor Private Static`
---@overload fun(target:Barotrauma.ISpatialEntity, character:Barotrauma.Character, objectiveManager:Barotrauma.AIObjectiveManager, luaKey__repeat?:System.Boolean, getDivingGearIfNeeded?:System.Boolean, priorityModifier?:System.Single, closeEnough?:System.Single):Barotrauma.AIObjectiveGoTo
---@return Barotrauma.AIObjectiveGoTo
_G['AIObjectiveGoTo'] = function() end

---`Constructor Private Static`
---@overload fun(target:Barotrauma.ISpatialEntity, character:Barotrauma.Character, objectiveManager:Barotrauma.AIObjectiveManager, luaKey__repeat?:System.Boolean, getDivingGearIfNeeded?:System.Boolean, priorityModifier?:System.Single, closeEnough?:System.Single):Barotrauma.AIObjectiveGoTo
---@return Barotrauma.AIObjectiveGoTo
_G['AIObjectiveGoTo'].__new = function() end

