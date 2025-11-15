---@meta
---@class Barotrauma.AIObjectiveGetItems : Barotrauma.AIObjective
---`Field Public Instance`
---@field ItemFilter (System.Func*1Barotrauma*Item*1Barotrauma*Identifier*1System*Boolean)|(fun(arg1:Barotrauma.Item, arg2:Barotrauma.Identifier):(System.Boolean))
---`Field Private Instance`
---@field gearTags (System.Collections.Immutable.ImmutableArray*1Barotrauma*Identifier)|(Barotrauma.Identifier[])
---`Field Private Instance`
---@field ignoredTags (System.Collections.Immutable.ImmutableHashSet*1Barotrauma*Identifier)|(Barotrauma.Identifier[])
---`Field Private Instance`
---@field subObjectivesCreated System.Boolean
---`Field Public Instance`
---@field achievedItems (System.Collections.Generic.HashSet*1Barotrauma*Item)|(Barotrauma.Item[])
---`Getter Public Instance Virtual`
---<br/>`Setter Public Instance Virtual`
---@field Identifier Barotrauma.Identifier
---`Getter Public Instance Virtual`
---@field DebugTag System.String
---`Getter Public Instance Virtual`
---@field KeepDivingGearOn System.Boolean
---`Getter Public Instance Virtual`
---@field AllowMultipleInstances System.Boolean
---`Getter NonPublic Instance Virtual`
---@field AllowWhileHandcuffed System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field AllowStealing System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field TakeWholeStack System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field AllowVariants System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Equip System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Wear System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field CheckInventory System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field EvaluateCombatPriority System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field CheckPathForEachItem System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field RequireNonEmpty System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field RequireAllItems System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field RequireDivingSuitAdequate System.Boolean
_G['AIObjectiveGetItems'] = {}

---`Method NonPublic Instance Virtual`
---@return System.Boolean
_G['AIObjectiveGetItems'].CheckObjectiveState = function() end

---`Method NonPublic Instance Virtual`
---@param deltaTime System.Single
_G['AIObjectiveGetItems'].Act = function(deltaTime) end

---`Method Public Instance Virtual`
_G['AIObjectiveGetItems'].Reset = function() end

---`Constructor Public Instance`
---@param character Barotrauma.Character
---@param objectiveManager Barotrauma.AIObjectiveManager
---@param identifiersOrTags (System.Collections.Generic.IEnumerable*1Barotrauma*Identifier)|(fun():(Barotrauma.Identifier))
---@param priorityModifier? System.Single
---@return Barotrauma.AIObjectiveGetItems
_G['AIObjectiveGetItems'] = function(character, objectiveManager, identifiersOrTags, priorityModifier) end

---`Constructor Public Instance`
---@param character Barotrauma.Character
---@param objectiveManager Barotrauma.AIObjectiveManager
---@param identifiersOrTags (System.Collections.Generic.IEnumerable*1Barotrauma*Identifier)|(fun():(Barotrauma.Identifier))
---@param priorityModifier? System.Single
---@return Barotrauma.AIObjectiveGetItems
_G['AIObjectiveGetItems'].__new = function(character, objectiveManager, identifiersOrTags, priorityModifier) end

