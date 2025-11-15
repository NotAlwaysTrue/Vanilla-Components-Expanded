---@meta
---@class Barotrauma.AIObjectiveContainItem : Barotrauma.AIObjective
---`Field Public Instance`
---@field GetItemPriority (System.Func*1Barotrauma*Item*1System*Single)|(fun(arg:Barotrauma.Item):(System.Single))
---`Field Public Instance`
---@field ignoredContainerIdentifiers (System.Collections.Immutable.ImmutableHashSet*1Barotrauma*Identifier)|(Barotrauma.Identifier[])
---`Field Public Instance`
---@field checkInventory System.Boolean
---`Field Private Instance`
---@field spawnItemIfNotFound System.Boolean
---`Field Public Instance`
---@field itemIdentifiers (System.Collections.Immutable.ImmutableHashSet*1Barotrauma*Identifier)|(Barotrauma.Identifier[])
---`Field Public Instance`
---@field container Barotrauma.Items.Components.ItemContainer
---`Field Private Instance`
---@field item Barotrauma.Item
---`Field Public Instance`
---@field TargetSlot System.Nullable*1System*Int32
---`Field Private Instance`
---@field getItemObjective Barotrauma.AIObjectiveGetItem
---`Field Private Instance`
---@field goToObjective Barotrauma.AIObjectiveGoTo
---`Field Private Instance`
---@field containedItems (System.Collections.Generic.HashSet*1Barotrauma*Item)|(Barotrauma.Item[])
---`Field Private Instance`
---@field _itemCount System.Int32
---`Getter Public Instance Virtual`
---<br/>`Setter Public Instance Virtual`
---@field Identifier Barotrauma.Identifier
---`Getter NonPublic Instance Virtual`
---@field AllowWhileHandcuffed System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field ItemToContain Barotrauma.Item
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field AllowToFindDivingGear System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field AllowDangerousPressure System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field ConditionLevel System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Equip System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field RemoveEmpty System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field RemoveExisting System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field RemoveExistingWhenNecessary System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field RemoveExistingPredicate (System.Func*1Barotrauma*Item*1System*Boolean)|(fun(arg:Barotrauma.Item):(System.Boolean))
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field RemoveMax System.Nullable*1System*Int32
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field MoveWholeStack System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field AllowStealing System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field ItemCount System.Int32
_G['AIObjectiveContainItem'] = {}

---`Method NonPublic Instance Virtual`
---@return System.Boolean
_G['AIObjectiveContainItem'].CheckObjectiveState = function() end

---`Method Private Instance`
---@return System.Boolean
_G['AIObjectiveContainItem'].CountItems = function() end

---`Method Private Instance`
---@param item Barotrauma.Item
---@return System.Boolean
_G['AIObjectiveContainItem'].CheckItem = function(item) end

---`Method NonPublic Instance Virtual`
---@param deltaTime System.Single
_G['AIObjectiveContainItem'].Act = function(deltaTime) end

---`Method Public Instance`
---@param item Barotrauma.Item
---@return System.Boolean
_G['AIObjectiveContainItem'].IsInTargetSlot = function(item) end

---`Method Public Instance Virtual`
_G['AIObjectiveContainItem'].Reset = function() end

---`Constructor Public Instance`
---@overload fun(character:Barotrauma.Character, item:Barotrauma.Item, container:Barotrauma.Items.Components.ItemContainer, objectiveManager:Barotrauma.AIObjectiveManager, priorityModifier?:System.Single):Barotrauma.AIObjectiveContainItem
---@overload fun(character:Barotrauma.Character, itemIdentifier:Barotrauma.Identifier, container:Barotrauma.Items.Components.ItemContainer, objectiveManager:Barotrauma.AIObjectiveManager, priorityModifier?:System.Single, spawnItemIfNotFound?:System.Boolean):Barotrauma.AIObjectiveContainItem
---@param character Barotrauma.Character
---@param itemIdentifiers (System.Collections.Immutable.ImmutableHashSet*1Barotrauma*Identifier)|(Barotrauma.Identifier[])
---@param container Barotrauma.Items.Components.ItemContainer
---@param objectiveManager Barotrauma.AIObjectiveManager
---@param priorityModifier? System.Single
---@param spawnItemIfNotFound? System.Boolean
---@return Barotrauma.AIObjectiveContainItem
_G['AIObjectiveContainItem'] = function(character, itemIdentifiers, container, objectiveManager, priorityModifier, spawnItemIfNotFound) end

---`Constructor Public Instance`
---@overload fun(character:Barotrauma.Character, item:Barotrauma.Item, container:Barotrauma.Items.Components.ItemContainer, objectiveManager:Barotrauma.AIObjectiveManager, priorityModifier?:System.Single):Barotrauma.AIObjectiveContainItem
---@overload fun(character:Barotrauma.Character, itemIdentifier:Barotrauma.Identifier, container:Barotrauma.Items.Components.ItemContainer, objectiveManager:Barotrauma.AIObjectiveManager, priorityModifier?:System.Single, spawnItemIfNotFound?:System.Boolean):Barotrauma.AIObjectiveContainItem
---@param character Barotrauma.Character
---@param itemIdentifiers (System.Collections.Immutable.ImmutableHashSet*1Barotrauma*Identifier)|(Barotrauma.Identifier[])
---@param container Barotrauma.Items.Components.ItemContainer
---@param objectiveManager Barotrauma.AIObjectiveManager
---@param priorityModifier? System.Single
---@param spawnItemIfNotFound? System.Boolean
---@return Barotrauma.AIObjectiveContainItem
_G['AIObjectiveContainItem'].__new = function(character, itemIdentifiers, container, objectiveManager, priorityModifier, spawnItemIfNotFound) end

