---@meta
---@class Barotrauma.Inventory : System.Object
---`Field Private Instance`
---@field receivedItemIds (System.Collections.Generic.Dictionary*1Barotrauma*Networking*Client*1System*Collections*Generic*List)|({[Barotrauma.Networking.Client]:((System.Collections.Generic.List)|((System.Collections.Generic.List*1System*UInt16)|(System.UInt16[])[]))})
---`Field Public Instance`
---@field Owner Barotrauma.Entity
---`Field NonPublic Instance`
---@field capacity System.Int32
---`Field NonPublic Instance`
---@field slots (Barotrauma.ItemSlot-arr)|(Barotrauma.Inventory.ItemSlot[])
---`Field Public Instance`
---@field Locked System.Boolean
---`Field NonPublic Instance`
---@field syncItemsDelay System.Single
---`Field Private Instance`
---@field extraStackSize System.Int32
---`Field Private Instance`
---@field allItemsList (System.Collections.Generic.List*1Barotrauma*Item)|(Barotrauma.Item[])
---`Field Public Instance`
---@field AllowSwappingContainedItems System.Boolean
---`Field Public Static`
---@field MaxPossibleStackSize System.Int32
---`Field Public Static`
---@field MaxItemsPerNetworkEvent System.Int32
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field ExtraStackSize System.Int32
---`Getter Public Instance Virtual`
---@field AllItems (System.Collections.Generic.IEnumerable*1Barotrauma*Item)|(fun():(Barotrauma.Item))
---`Getter Public Instance`
---@field AllItemsMod (System.Collections.Generic.IEnumerable*1Barotrauma*Item)|(fun():(Barotrauma.Item))
---`Getter Public Instance`
---@field Capacity System.Int32
---`Getter Public Static`
---@field IsDragAndDropGiveAllowed System.Boolean
---`Getter Public Instance`
---@field EmptySlotCount System.Int32
_G['Inventory'] = {}

---`Method Public Instance Virtual`
---@param msg Barotrauma.Networking.IReadMessage
---@param sender Barotrauma.Networking.Client
_G['Inventory'].ServerEventRead = function(msg, sender) end

---`Method Private Instance`
---@param character Barotrauma.Character
_G['Inventory'].EnsureItemsInBothHands = function(character) end

---`Method Public Instance`
---@param checkForDuplicates System.Boolean
---@return (System.Collections.Generic.IEnumerable*1Barotrauma*Item)|(fun():(Barotrauma.Item))
_G['Inventory'].GetAllItems = function(checkForDuplicates) end

---`Method Private Instance`
_G['Inventory'].NotifyItemComponentsOfChange = function() end

---`Method Public Instance`
---@param item Barotrauma.Item
---@return System.Boolean
_G['Inventory'].Contains = function(item) end

---`Method Public Instance`
---@return Barotrauma.Item
_G['Inventory'].FirstOrDefault = function() end

---`Method Public Instance`
---@return Barotrauma.Item
_G['Inventory'].LastOrDefault = function() end

---`Method Private Instance`
---@param index System.Int32
---@return System.Boolean
_G['Inventory'].IsIndexInRange = function(index) end

---`Method Public Instance`
---@param index System.Int32
---@return Barotrauma.Item
_G['Inventory'].GetItemAt = function(index) end

---`Method Public Instance`
---@param index System.Int32
---@return (System.Collections.Generic.IEnumerable*1Barotrauma*Item)|(fun():(Barotrauma.Item))
_G['Inventory'].GetItemsAt = function(index) end

---`Method Public Instance`
---@param item Barotrauma.Item
---@param index System.Int32
---@return System.Int32
_G['Inventory'].GetItemStackSlotIndex = function(item, index) end

---`Method Public Instance`
---@param item Barotrauma.Item
---@return System.Int32
_G['Inventory'].FindIndex = function(item) end

---`Method Public Instance`
---@param item Barotrauma.Item
---@return (System.Collections.Generic.List*1System*Int32)|(System.Int32[])
_G['Inventory'].FindIndices = function(item) end

---`Method Public Instance Virtual`
---@param item Barotrauma.Item
---@return System.Boolean
_G['Inventory'].ItemOwnsSelf = function(item) end

---`Method Public Instance Virtual`
---@param item Barotrauma.Item
---@param ignoreCondition? System.Boolean
---@return System.Int32
_G['Inventory'].FindAllowedSlot = function(item, ignoreCondition) end

---`Method Public Instance`
---@param item Barotrauma.Item
---@return System.Boolean
_G['Inventory'].CanBePut = function(item) end

---`Method Public Instance Virtual`
---@overload fun(item:Barotrauma.Item, i:System.Int32, ignoreCondition?:System.Boolean):(System.Boolean)
---@param itemPrefab Barotrauma.ItemPrefab
---@param i System.Int32
---@param condition? System.Nullable*1System*Single
---@param quality? System.Nullable*1System*Int32
---@return System.Boolean
_G['Inventory'].CanBePutInSlot = function(itemPrefab, i, condition, quality) end

---`Method Public Instance`
---@param itemPrefab Barotrauma.ItemPrefab
---@param condition? System.Nullable*1System*Single
---@param quality? System.Nullable*1System*Int32
---@return System.Boolean
_G['Inventory'].CanProbablyBePut = function(itemPrefab, condition, quality) end

---`Method Public Instance`
---@param itemPrefab Barotrauma.ItemPrefab
---@param condition? System.Nullable*1System*Single
---@return System.Int32
_G['Inventory'].HowManyCanBePut = function(itemPrefab, condition) end

---`Method Public Instance Virtual`
---@param itemPrefab Barotrauma.ItemPrefab
---@param i System.Int32
---@param condition System.Nullable*1System*Single
---@param ignoreItemsInSlot? System.Boolean
---@return System.Int32
_G['Inventory'].HowManyCanBePut = function(itemPrefab, i, condition, ignoreItemsInSlot) end

---`Method Public Instance Virtual`
---@overload fun(item:Barotrauma.Item, user:Barotrauma.Character, allowedSlots?:(System.Collections.Generic.IEnumerable*1Barotrauma*InvSlotType)|(fun():(Barotrauma.InvSlotType)), createNetworkEvent?:System.Boolean, ignoreCondition?:System.Boolean):(System.Boolean)
---@param item Barotrauma.Item
---@param i System.Int32
---@param allowSwapping System.Boolean
---@param allowCombine System.Boolean
---@param user Barotrauma.Character
---@param createNetworkEvent? System.Boolean
---@param ignoreCondition? System.Boolean
---@return System.Boolean
_G['Inventory'].TryPutItem = function(item, i, allowSwapping, allowCombine, user, createNetworkEvent, ignoreCondition) end

---`Method NonPublic Instance Virtual`
---@param item Barotrauma.Item
---@param i System.Int32
---@param user Barotrauma.Character
---@param removeItem? System.Boolean
---@param createNetworkEvent? System.Boolean
_G['Inventory'].PutItem = function(item, i, user, removeItem, createNetworkEvent) end

---`Method Public Instance`
---@return System.Boolean
_G['Inventory'].IsEmpty = function() end

---`Method Public Instance Virtual`
---@param takeStacksIntoAccount? System.Boolean
---@return System.Boolean
_G['Inventory'].IsFull = function(takeStacksIntoAccount) end

---`Method NonPublic Instance`
---@param index System.Int32
---@param item Barotrauma.Item
---@param user Barotrauma.Character
---@param createNetworkEvent System.Boolean
---@param swapWholeStack System.Boolean
---@return System.Boolean
_G['Inventory'].TrySwapping = function(index, item, user, createNetworkEvent, swapWholeStack) end

---`Method Public Instance`
_G['Inventory'].CreateNetworkEvent = function() end

---`Method NonPublic Instance Virtual`
---@param slotRange System.Range
_G['Inventory'].CreateNetworkEvent = function(slotRange) end

---`Method Public Instance`
---@param predicate (System.Func*1Barotrauma*Item*1System*Boolean)|(fun(arg:Barotrauma.Item):(System.Boolean))
---@param recursive System.Boolean
---@return Barotrauma.Item
_G['Inventory'].FindItem = function(predicate, recursive) end

---`Method Public Instance`
---@param predicate? (System.Func*1Barotrauma*Item*1System*Boolean)|(fun(arg:Barotrauma.Item):(System.Boolean))
---@param recursive? System.Boolean
---@param list? (System.Collections.Generic.List*1Barotrauma*Item)|(Barotrauma.Item[])
---@return (System.Collections.Generic.List*1Barotrauma*Item)|(Barotrauma.Item[])
_G['Inventory'].FindAllItems = function(predicate, recursive, list) end

---`Method Public Instance`
---@param tag Barotrauma.Identifier
---@param recursive? System.Boolean
---@return Barotrauma.Item
_G['Inventory'].FindItemByTag = function(tag, recursive) end

---`Method Public Instance`
---@param identifier Barotrauma.Identifier
---@param recursive? System.Boolean
---@return Barotrauma.Item
_G['Inventory'].FindItemByIdentifier = function(identifier, recursive) end

---`Method Public Instance Virtual`
---@param item Barotrauma.Item
_G['Inventory'].RemoveItem = function(item) end

---`Method Public Instance`
---@param item Barotrauma.Item
---@param index System.Int32
_G['Inventory'].ForceToSlot = function(item, index) end

---`Method Public Instance`
---@param item Barotrauma.Item
---@param index System.Int32
_G['Inventory'].ForceRemoveFromSlot = function(item, index) end

---`Method Public Instance`
---@param item Barotrauma.Item
---@param index System.Int32
---@return System.Boolean
_G['Inventory'].IsInSlot = function(item, index) end

---`Method Public Instance`
---@param index System.Int32
---@return System.Boolean
_G['Inventory'].IsSlotEmpty = function(index) end

---`Method Public Instance`
---@param msg Barotrauma.Networking.IReadMessage
---@param receivedItemIds (System.Collections.Generic.List)|((System.Collections.Generic.List*1System*UInt16)|(System.UInt16[])[])
---@param readyToApply System.Boolean-ref
_G['Inventory'].SharedRead = function(msg, receivedItemIds, readyToApply) end

---`Method Public Instance`
---@param msg Barotrauma.Networking.IWriteMessage
---@param slotRange System.Range
_G['Inventory'].SharedWrite = function(msg, slotRange) end

---`Method Public Instance`
_G['Inventory'].DeleteAllItems = function() end

---`Constructor Public Instance`
---@param owner Barotrauma.Entity
---@param capacity System.Int32
---@param slotsPerRow? System.Int32
---@return Barotrauma.Inventory
_G['Inventory'] = function(owner, capacity, slotsPerRow) end

---`Constructor Public Instance`
---@param owner Barotrauma.Entity
---@param capacity System.Int32
---@param slotsPerRow? System.Int32
---@return Barotrauma.Inventory
_G['Inventory'].__new = function(owner, capacity, slotsPerRow) end

