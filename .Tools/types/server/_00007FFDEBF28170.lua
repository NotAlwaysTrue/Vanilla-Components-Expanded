---@meta
---@class Barotrauma.AIObjective : System.Object
---`Field Public Instance`
---@field SourceEventAction Barotrauma.EventAction
---`Field Public Instance`
---@field SourceObjective Barotrauma.AIObjective
---`Field NonPublic Instance`
---@field subObjectives (System.Collections.Generic.List*1Barotrauma*AIObjective)|(Barotrauma.AIObjective[])
---`Field Private Instance`
---@field _cumulatedDevotion System.Single
---`Field Private Instance`
---@field resetPriorityTimer System.Single
---`Field Private Instance`
---@field resetPriorityTime System.Single
---`Field Private Instance`
---@field _forceHighestPriority System.Boolean
---`Field Public Instance`
---@field character Barotrauma.Character
---`Field Public Instance`
---@field objectiveManager Barotrauma.AIObjectiveManager
---`Field Public Instance`
---@field Option Barotrauma.Identifier
---`Field Private Instance`
---@field _abandon System.Boolean
---`Field Private Instance`
---@field all (System.Collections.Generic.List*1Barotrauma*AIObjective)|(Barotrauma.AIObjective[])
---`Field Public Instance`
---@field AbortCondition (System.Func*1Barotrauma*AIObjective*1System*Boolean)|(fun(arg:Barotrauma.AIObjective):(System.Boolean))
---`Field Private Instance`
---@field Completed (System.Action)|(fun())
---`Field Private Instance`
---@field Abandoned (System.Action)|(fun())
---`Field Private Instance`
---@field Selected (System.Action)|(fun())
---`Field Private Instance`
---@field Deselected (System.Action)|(fun())
---`Field Private Instance`
---@field isCompleted System.Boolean
---`Field Private Instance`
---@field hasBeenChecked System.Boolean
---`Getter Public Instance Virtual`
---@field Devotion System.Single
---`Getter Public Instance Abstract Virtual`
---<br/>`Setter Public Instance Abstract Virtual`
---@field Identifier Barotrauma.Identifier
---`Getter Public Instance Virtual`
---@field DebugTag System.String
---`Getter Public Instance Virtual`
---@field ForceRun System.Boolean
---`Getter Public Instance Virtual`
---@field IgnoreUnsafeHulls System.Boolean
---`Getter Public Instance Virtual`
---@field AbandonWhenCannotCompleteSubObjectives System.Boolean
---`Getter Public Instance Virtual`
---@field AllowSubObjectiveSorting System.Boolean
---`Getter Public Instance Virtual`
---@field PrioritizeIfSubObjectivesActive System.Boolean
---`Getter Public Instance Virtual`
---@field AllowMultipleInstances System.Boolean
---`Getter NonPublic Instance Virtual`
---@field ConcurrentObjectives System.Boolean
---`Getter Public Instance Virtual`
---@field KeepDivingGearOn System.Boolean
---`Getter Public Instance Virtual`
---@field KeepDivingGearOnAlsoWhenInactive System.Boolean
---`Getter Public Instance Virtual`
---@field AllowAutomaticItemUnequipping System.Boolean
---`Getter NonPublic Instance Virtual`
---@field AllowOutsideSubmarine System.Boolean
---`Getter NonPublic Instance Virtual`
---@field AllowInFriendlySubs System.Boolean
---`Getter NonPublic Instance Virtual`
---@field AllowInAnySub System.Boolean
---`Getter NonPublic Instance Virtual`
---@field AllowWhileHandcuffed System.Boolean
---`Getter NonPublic Instance Virtual`
---@field AbandonIfDisallowed System.Boolean
---`Getter Public Instance Virtual`
---@field CanBeCompleted System.Boolean
---`Getter NonPublic Instance Virtual`
---@field MaxDevotion System.Single
---`Getter NonPublic Instance`
---<br/>`Setter NonPublic Instance`
---@field CumulatedDevotion System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Priority System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field BasePriority System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field PriorityModifier System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field ForceHighestPriority System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field ForceWalk System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field IgnoreAtOutpost System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Abandon System.Boolean
---`Getter Public Instance`
---@field SubObjectives (System.Collections.Generic.IEnumerable*1Barotrauma*AIObjective)|(fun():(Barotrauma.AIObjective))
---`Getter Public Instance`
---@field CurrentSubObjective Barotrauma.AIObjective
---`Getter NonPublic Instance`
---@field HumanAIController Barotrauma.HumanAIController
---`Getter NonPublic Instance`
---@field PathSteering Barotrauma.IndoorsSteeringManager
---`Getter NonPublic Instance`
---@field SteeringManager Barotrauma.SteeringManager
---`Getter Public Instance`
---@field IsAllowed System.Boolean
---`Getter Public Instance`
---<br/>`Setter NonPublic Instance`
---@field IsCompleted System.Boolean
_G['AIObjective'] = {}

---`Method Public Instance`
---@param includingSelf? System.Boolean
---@return (System.Collections.Generic.IEnumerable*1Barotrauma*AIObjective)|(fun():(Barotrauma.AIObjective))
_G['AIObjective'].GetSubObjectivesRecursive = function(includingSelf) end

---`Method Public Instance`
---@return Barotrauma.AIObjective
_G['AIObjective'].GetActiveObjective = function() end

---`Method Public Instance`
---@param deltaTime System.Single
_G['AIObjective'].TryComplete = function(deltaTime) end

---`Method Public Instance`
---@param objective Barotrauma.AIObjective
---@param addFirst? System.Boolean
_G['AIObjective'].AddSubObjective = function(objective, addFirst) end

---`Method Public Instance`
---@param objective Barotrauma.T-ref
_G['AIObjective'].RemoveSubObjective = function(objective) end

---`Method Public Instance`
_G['AIObjective'].SortSubObjectives = function() end

---`Method Public Instance`
---@return System.Boolean
_G['AIObjective'].IsIgnoredAtOutpost = function() end

---`Method NonPublic Instance`
_G['AIObjective'].HandleDisallowed = function() end

---`Method NonPublic Instance Virtual`
---@return System.Single
_G['AIObjective'].GetPriority = function() end

---`Method Public Instance`
---@return System.Single
_G['AIObjective'].CalculatePriority = function() end

---`Method Public Static`
---@param selfPos Microsoft.Xna.Framework.Vector2
---@param targetWorldPos Microsoft.Xna.Framework.Vector2
---@param factorAtMaxDistance System.Single
---@param verticalDistanceMultiplier? System.Single
---@param maxDistance? System.Single
---@param factorAtMinDistance? System.Single
---@return System.Single
_G['AIObjective'].GetDistanceFactor = function(selfPos, targetWorldPos, factorAtMaxDistance, verticalDistanceMultiplier, maxDistance, factorAtMinDistance) end

---`Method NonPublic Instance`
---@param targetWorldPos Microsoft.Xna.Framework.Vector2
---@param factorAtMaxDistance System.Single
---@param verticalDistanceMultiplier? System.Single
---@param maxDistance? System.Single
---@param factorAtMinDistance? System.Single
---@return System.Single
_G['AIObjective'].GetDistanceFactor = function(targetWorldPos, factorAtMaxDistance, verticalDistanceMultiplier, maxDistance, factorAtMinDistance) end

---`Method Private Instance`
---@param deltaTime System.Single
_G['AIObjective'].UpdateDevotion = function(deltaTime) end

---`Method Public Instance Virtual`
---@param otherObjective Barotrauma.AIObjective.T
---@return System.Boolean
_G['AIObjective'].IsDuplicate = function(otherObjective) end

---`Method Public Instance Virtual`
---@param deltaTime System.Single
_G['AIObjective'].Update = function(deltaTime) end

---`Method NonPublic Instance Virtual`
---@param dictionary (System.Collections.Generic.Dictionary*1Barotrauma*AIObjective*T1*1Barotrauma*AIObjective*T2)|({[Barotrauma.AIObjective.T1]:(Barotrauma.AIObjective.T2)})
---@param collection (System.Collections.Generic.IEnumerable*1Barotrauma*AIObjective*T1)|(fun():(Barotrauma.AIObjective.T1))
_G['AIObjective'].SyncRemovedObjectives = function(dictionary, collection) end

---`Method NonPublic Instance`
---@param objective Barotrauma.T-ref
---@param constructor (System.Func*1Barotrauma*AIObjective*T)|(fun():(Barotrauma.AIObjective.T))
---@param onCompleted? (System.Action)|(fun())
---@param onAbandon? (System.Action)|(fun())
---@return System.Boolean
_G['AIObjective'].TryAddSubObjective = function(objective, constructor, onCompleted, onAbandon) end

---`Method Public Instance Virtual`
_G['AIObjective'].OnSelected = function() end

---`Method Public Instance Virtual`
_G['AIObjective'].OnDeselected = function() end

---`Method NonPublic Instance Virtual`
_G['AIObjective'].OnCompleted = function() end

---`Method NonPublic Instance Virtual`
_G['AIObjective'].OnAbandon = function() end

---`Method Public Instance Virtual`
_G['AIObjective'].Reset = function() end

---`Method NonPublic Instance Abstract Virtual`
---@param deltaTime System.Single
_G['AIObjective'].Act = function(deltaTime) end

---`Method Private Instance`
---@return System.Boolean
_G['AIObjective'].Check = function() end

---`Method NonPublic Instance Abstract Virtual`
---@return System.Boolean
_G['AIObjective'].CheckObjectiveState = function() end

---`Method Private Instance`
---@return System.Boolean
_G['AIObjective'].CheckState = function() end

---`Method Private Instance`
_G['AIObjective'].CheckSubObjectives = function() end

---`Method NonPublic Static`
---@param character Barotrauma.Character
---@param item Barotrauma.Item
---@param allowWearing System.Boolean
---@return System.Boolean
_G['AIObjective'].CanPutInInventory = function(character, item, allowWearing) end

---`Method NonPublic Instance`
---@param item Barotrauma.Item
---@param allowWearing System.Boolean
---@return System.Boolean
_G['AIObjective'].CanEquip = function(item, allowWearing) end

---`Constructor Public Instance`
---@param character Barotrauma.Character
---@param objectiveManager Barotrauma.AIObjectiveManager
---@param priorityModifier System.Single
---@param option? Barotrauma.Identifier
---@return Barotrauma.AIObjective
_G['AIObjective'] = function(character, objectiveManager, priorityModifier, option) end

---`Constructor Public Instance`
---@param character Barotrauma.Character
---@param objectiveManager Barotrauma.AIObjectiveManager
---@param priorityModifier System.Single
---@param option? Barotrauma.Identifier
---@return Barotrauma.AIObjective
_G['AIObjective'].__new = function(character, objectiveManager, priorityModifier, option) end

