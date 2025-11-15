---@meta
---@class Barotrauma.AIObjectiveGetItem : Barotrauma.AIObjective
---`Field Public Instance`
---@field ignoredItems (System.Collections.Generic.HashSet*1Barotrauma*Item)|(Barotrauma.Item[])
---`Field Public Instance`
---@field GetItemPriority (System.Func*1Barotrauma*Item*1System*Single)|(fun(arg:Barotrauma.Item):(System.Single))
---`Field Public Instance`
---@field ItemFilter (System.Func*1Barotrauma*Item*1System*Boolean)|(fun(arg:Barotrauma.Item):(System.Boolean))
---`Field Public Instance`
---@field IdentifiersOrTags (System.Collections.Immutable.ImmutableHashSet*1Barotrauma*Identifier)|(Barotrauma.Identifier[])
---`Field Private Instance`
---@field spawnItemIfNotFound System.Boolean
---`Field Private Instance`
---@field targetItem Barotrauma.Item
---`Field Private Instance`
---@field originalTarget Barotrauma.Item
---`Field Public Instance`
---@field ContainTarget Barotrauma.Items.Components.ItemContainer
---`Field Private Instance`
---@field moveToTarget Barotrauma.ISpatialEntity
---`Field Private Instance`
---@field isDoneSeeking System.Boolean
---`Field Private Instance`
---@field currentSearchIndex System.Int32
---`Field Public Instance`
---@field ignoredContainerIdentifiers (System.Collections.Immutable.ImmutableHashSet*1Barotrauma*Identifier)|(Barotrauma.Identifier[])
---`Field Public Instance`
---@field ignoredIdentifiersOrTags (System.Collections.Immutable.ImmutableHashSet*1Barotrauma*Identifier)|(Barotrauma.Identifier[])
---`Field Private Instance`
---@field goToObjective Barotrauma.AIObjectiveGoTo
---`Field Private Instance`
---@field currItemPriority System.Single
---`Field Private Instance`
---@field checkInventory System.Boolean
---`Field Public Instance`
---@field IsFindDivingGearSubObjective System.Boolean
---`Field Private Instance`
---@field _itemCount System.Int32
---`Field Private Instance`
---@field sw System.Diagnostics.Stopwatch
---`Field Private Instance`
---@field itemCandidates (System.Collections.Generic.List*1System*ValueTuple*2Barotrauma*Item*2System*Single)|(System.ValueTuple*1Barotrauma*Item*1System*Single[])
---`Field Private Instance`
---@field itemList (System.Collections.Generic.List*1Barotrauma*Item)|(Barotrauma.Item[])
---`Field Public Static`
---@field AllowedItemsToTake (Barotrauma.Identifier-arr)|(Barotrauma.Identifier[])
---`Field Public Static`
---@field DefaultReach System.Single
---`Field Public Static`
---@field MaxReach System.Single
---`Getter Public Instance Virtual`
---<br/>`Setter Public Instance Virtual`
---@field Identifier Barotrauma.Identifier
---`Getter Public Instance Virtual`
---@field DebugTag System.String
---`Getter Public Instance Virtual`
---@field AbandonWhenCannotCompleteSubObjectives System.Boolean
---`Getter Public Instance Virtual`
---@field AllowMultipleInstances System.Boolean
---`Getter NonPublic Instance Virtual`
---@field AllowWhileHandcuffed System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field TargetCondition System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field AllowDangerousPressure System.Boolean
---`Getter Public Instance`
---@field TargetItem Barotrauma.Item
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field AllowToFindDivingGear System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field MustBeSpecificItem System.Boolean
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
---@field RequireNonEmpty System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field EvaluateCombatPriority System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field CheckPathForEachItem System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field SpeakIfFails System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field CannotFindDialogueIdentifierOverride System.String
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field CannotFindDialogueCondition (System.Func*1System*Boolean)|(fun():(System.Boolean))
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field ItemCount System.Int32
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field EquipSlotType System.Nullable*1Barotrauma*InvSlotType
---`Getter Private Instance`
---@field StopWatch System.Diagnostics.Stopwatch
_G['AIObjectiveGetItem'] = {}

---`Method Public Static`
---@param identifiersOrTags (System.Collections.Generic.IEnumerable*1Barotrauma*Identifier)|(fun():(Barotrauma.Identifier))
---@return (System.Collections.Generic.IEnumerable*1Barotrauma*Identifier)|(fun():(Barotrauma.Identifier))
_G['AIObjectiveGetItem'].ParseGearTags = function(identifiersOrTags) end

---`Method Public Static`
---@param identifiersOrTags (System.Collections.Generic.IEnumerable*1Barotrauma*Identifier)|(fun():(Barotrauma.Identifier))
---@return (System.Collections.Generic.IEnumerable*1Barotrauma*Identifier)|(fun():(Barotrauma.Identifier))
_G['AIObjectiveGetItem'].ParseIgnoredTags = function(identifiersOrTags) end

---`Method Public Static`
---@param targetEntity Barotrauma.ISpatialEntity
---@return (System.Func*1Barotrauma*PathNode*1System*Boolean)|(fun(arg:Barotrauma.PathNode):(System.Boolean))
_G['AIObjectiveGetItem'].CreateEndNodeFilter = function(targetEntity) end

---`Method Private Instance`
---@return System.Boolean
_G['AIObjectiveGetItem'].CheckInventory = function() end

---`Method Private Instance`
---@return System.Boolean
_G['AIObjectiveGetItem'].CountItems = function() end

---`Method NonPublic Instance Virtual`
---@param deltaTime System.Single
_G['AIObjectiveGetItem'].Act = function(deltaTime) end

---`Method Private Instance`
_G['AIObjectiveGetItem'].FindTargetItem = function() end

---`Method Private Instance`
_G['AIObjectiveGetItem'].HandlePotentialItems = function() end

---`Method Private Instance`
---@return Barotrauma.ItemPrefab
_G['AIObjectiveGetItem'].FindItemToSpawn = function() end

---`Method NonPublic Instance Virtual`
---@return System.Boolean
_G['AIObjectiveGetItem'].CheckObjectiveState = function() end

---`Method Private Instance`
---@param item Barotrauma.Item
---@return System.Boolean
_G['AIObjectiveGetItem'].CheckItem = function(item) end

---`Method Public Instance Virtual`
_G['AIObjectiveGetItem'].Reset = function() end

---`Method Private Instance`
_G['AIObjectiveGetItem'].ResetInternal = function() end

---`Method NonPublic Instance Virtual`
_G['AIObjectiveGetItem'].OnAbandon = function() end

---`Method Private Instance`
_G['AIObjectiveGetItem'].SpeakCannotFind = function() end

---`Constructor Public Instance`
---@overload fun(character:Barotrauma.Character, targetItem:Barotrauma.Item, objectiveManager:Barotrauma.AIObjectiveManager, equip?:System.Boolean, priorityModifier?:System.Single):Barotrauma.AIObjectiveGetItem
---@overload fun(character:Barotrauma.Character, identifierOrTag:Barotrauma.Identifier, objectiveManager:Barotrauma.AIObjectiveManager, equip?:System.Boolean, checkInventory?:System.Boolean, priorityModifier?:System.Single, spawnItemIfNotFound?:System.Boolean):Barotrauma.AIObjectiveGetItem
---@overload fun(character:Barotrauma.Character, identifiersOrTags:(System.Collections.Generic.IEnumerable*1Barotrauma*Identifier)|(fun():(Barotrauma.Identifier)), objectiveManager:Barotrauma.AIObjectiveManager, equip?:System.Boolean, checkInventory?:System.Boolean, priorityModifier?:System.Single, spawnItemIfNotFound?:System.Boolean):Barotrauma.AIObjectiveGetItem
---@return Barotrauma.AIObjectiveGetItem
_G['AIObjectiveGetItem'] = function() end

---`Constructor Public Instance`
---@overload fun(character:Barotrauma.Character, targetItem:Barotrauma.Item, objectiveManager:Barotrauma.AIObjectiveManager, equip?:System.Boolean, priorityModifier?:System.Single):Barotrauma.AIObjectiveGetItem
---@overload fun(character:Barotrauma.Character, identifierOrTag:Barotrauma.Identifier, objectiveManager:Barotrauma.AIObjectiveManager, equip?:System.Boolean, checkInventory?:System.Boolean, priorityModifier?:System.Single, spawnItemIfNotFound?:System.Boolean):Barotrauma.AIObjectiveGetItem
---@overload fun(character:Barotrauma.Character, identifiersOrTags:(System.Collections.Generic.IEnumerable*1Barotrauma*Identifier)|(fun():(Barotrauma.Identifier)), objectiveManager:Barotrauma.AIObjectiveManager, equip?:System.Boolean, checkInventory?:System.Boolean, priorityModifier?:System.Single, spawnItemIfNotFound?:System.Boolean):Barotrauma.AIObjectiveGetItem
---@return Barotrauma.AIObjectiveGetItem
_G['AIObjectiveGetItem'].__new = function() end

---`Constructor Private Static`
---@overload fun(character:Barotrauma.Character, targetItem:Barotrauma.Item, objectiveManager:Barotrauma.AIObjectiveManager, equip?:System.Boolean, priorityModifier?:System.Single):Barotrauma.AIObjectiveGetItem
---@overload fun(character:Barotrauma.Character, identifierOrTag:Barotrauma.Identifier, objectiveManager:Barotrauma.AIObjectiveManager, equip?:System.Boolean, checkInventory?:System.Boolean, priorityModifier?:System.Single, spawnItemIfNotFound?:System.Boolean):Barotrauma.AIObjectiveGetItem
---@overload fun(character:Barotrauma.Character, identifiersOrTags:(System.Collections.Generic.IEnumerable*1Barotrauma*Identifier)|(fun():(Barotrauma.Identifier)), objectiveManager:Barotrauma.AIObjectiveManager, equip?:System.Boolean, checkInventory?:System.Boolean, priorityModifier?:System.Single, spawnItemIfNotFound?:System.Boolean):Barotrauma.AIObjectiveGetItem
---@return Barotrauma.AIObjectiveGetItem
_G['AIObjectiveGetItem'] = function() end

---`Constructor Private Static`
---@overload fun(character:Barotrauma.Character, targetItem:Barotrauma.Item, objectiveManager:Barotrauma.AIObjectiveManager, equip?:System.Boolean, priorityModifier?:System.Single):Barotrauma.AIObjectiveGetItem
---@overload fun(character:Barotrauma.Character, identifierOrTag:Barotrauma.Identifier, objectiveManager:Barotrauma.AIObjectiveManager, equip?:System.Boolean, checkInventory?:System.Boolean, priorityModifier?:System.Single, spawnItemIfNotFound?:System.Boolean):Barotrauma.AIObjectiveGetItem
---@overload fun(character:Barotrauma.Character, identifiersOrTags:(System.Collections.Generic.IEnumerable*1Barotrauma*Identifier)|(fun():(Barotrauma.Identifier)), objectiveManager:Barotrauma.AIObjectiveManager, equip?:System.Boolean, checkInventory?:System.Boolean, priorityModifier?:System.Single, spawnItemIfNotFound?:System.Boolean):Barotrauma.AIObjectiveGetItem
---@return Barotrauma.AIObjectiveGetItem
_G['AIObjectiveGetItem'].__new = function() end

