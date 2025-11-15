---@meta
---@class Barotrauma.CharacterInventory : Barotrauma.Inventory
---`Field Private Instance`
---@field character Barotrauma.Character
---`Field NonPublic Instance`
---@field IsEquipped (System.Boolean-arr)|(System.Boolean[])
---`Field Public Static`
---@field AnySlot (System.Collections.Generic.List*1Barotrauma*InvSlotType)|(Barotrauma.InvSlotType[])
---`Field Public Static`
---@field BagSlot (System.Collections.Generic.List*1Barotrauma*InvSlotType)|(Barotrauma.InvSlotType[])
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field SlotTypes (Barotrauma.InvSlotType-arr)|(Barotrauma.InvSlotType[])
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field AccessibleWhenAlive System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field AccessibleByOwner System.Boolean
_G['CharacterInventory'] = {}

---`Method Public Instance`
---@param msg Barotrauma.Networking.IWriteMessage
---@param c Barotrauma.Networking.Client
---@param inventoryData Barotrauma.Character.InventoryStateEventData
_G['CharacterInventory'].ServerEventWrite = function(msg, c, inventoryData) end

---`Method Public Static`
---@param s Barotrauma.InvSlotType
---@return System.Boolean
_G['CharacterInventory'].IsHandSlotType = function(s) end

---`Method Private Static`
---@param element Barotrauma.ContentXElement
---@return (System.String-arr)|(System.String[])
_G['CharacterInventory'].ParseSlotTypes = function(element) end

---`Method Public Instance`
---@param tag Barotrauma.Identifier
---@return Barotrauma.Item
_G['CharacterInventory'].FindEquippedItemByTag = function(tag) end

---`Method Public Instance`
---@param limbSlot Barotrauma.InvSlotType
---@return System.Int32
_G['CharacterInventory'].FindLimbSlot = function(limbSlot) end

---`Method Public Instance`
---@param limbSlot Barotrauma.InvSlotType
---@return Barotrauma.Item
_G['CharacterInventory'].GetItemInLimbSlot = function(limbSlot) end

---`Method Public Instance`
---@param item Barotrauma.Item
---@param limbSlot Barotrauma.InvSlotType
---@return System.Boolean
_G['CharacterInventory'].IsInLimbSlot = function(item, limbSlot) end

---`Method Public Instance`
---@param item Barotrauma.Item
---@param slotType Barotrauma.InvSlotType
---@return System.Boolean
_G['CharacterInventory'].CanBePut = function(item, slotType) end

---`Method Public Instance Virtual`
---@overload fun(item:Barotrauma.Item, i:System.Int32, ignoreCondition?:System.Boolean):(System.Boolean)
---@param itemPrefab Barotrauma.ItemPrefab
---@param i System.Int32
---@param condition System.Nullable*1System*Single
---@param quality? System.Nullable*1System*Int32
---@return System.Boolean
_G['CharacterInventory'].CanBePutInSlot = function(itemPrefab, i, condition, quality) end

---`Method Public Instance Virtual`
---@param item Barotrauma.Item
_G['CharacterInventory'].RemoveItem = function(item) end

---`Method Public Instance`
---@param item Barotrauma.Item
---@param tryEquipFromSameStack System.Boolean
_G['CharacterInventory'].RemoveItem = function(item, tryEquipFromSameStack) end

---`Method Public Instance`
---@param item Barotrauma.Item
---@param user Barotrauma.Character
---@param allowedSlots? (System.Collections.Generic.IEnumerable*1Barotrauma*InvSlotType)|(fun():(Barotrauma.InvSlotType))
---@param createNetworkEvent? System.Boolean
---@return System.Boolean
_G['CharacterInventory'].TryPutItemWithAutoEquipCheck = function(item, user, allowedSlots, createNetworkEvent) end

---`Method Public Instance Virtual`
---@overload fun(item:Barotrauma.Item, user:Barotrauma.Character, allowedSlots?:(System.Collections.Generic.IEnumerable*1Barotrauma*InvSlotType)|(fun():(Barotrauma.InvSlotType)), createNetworkEvent?:System.Boolean, ignoreCondition?:System.Boolean):(System.Boolean)
---@param item Barotrauma.Item
---@param index System.Int32
---@param allowSwapping System.Boolean
---@param allowCombine System.Boolean
---@param user Barotrauma.Character
---@param createNetworkEvent? System.Boolean
---@param ignoreCondition? System.Boolean
---@return System.Boolean
_G['CharacterInventory'].TryPutItem = function(item, index, allowSwapping, allowCombine, user, createNetworkEvent, ignoreCondition) end

---`Method Public Instance`
---@param item Barotrauma.Item
---@return System.Boolean
_G['CharacterInventory'].IsAnySlotAvailable = function(item) end

---`Method Private Instance`
---@param item Barotrauma.Item
---@param inWrongSlot System.Boolean
---@return System.Int32
_G['CharacterInventory'].GetFreeAnySlot = function(item, inWrongSlot) end

---`Method NonPublic Instance Virtual`
---@param item Barotrauma.Item
---@param i System.Int32
---@param user Barotrauma.Character
---@param removeItem? System.Boolean
---@param createNetworkEvent? System.Boolean
_G['CharacterInventory'].PutItem = function(item, i, user, removeItem, createNetworkEvent) end

---`Method NonPublic Instance Virtual`
---@param slotRange System.Range
_G['CharacterInventory'].CreateNetworkEvent = function(slotRange) end

---`Constructor Public Instance`
---@overload fun(element:Barotrauma.ContentXElement, character:Barotrauma.Character, spawnInitialItems:System.Boolean):Barotrauma.CharacterInventory
---@return Barotrauma.CharacterInventory
_G['CharacterInventory'] = function() end

---`Constructor Public Instance`
---@overload fun(element:Barotrauma.ContentXElement, character:Barotrauma.Character, spawnInitialItems:System.Boolean):Barotrauma.CharacterInventory
---@return Barotrauma.CharacterInventory
_G['CharacterInventory'].__new = function() end

---`Constructor Private Static`
---@overload fun(element:Barotrauma.ContentXElement, character:Barotrauma.Character, spawnInitialItems:System.Boolean):Barotrauma.CharacterInventory
---@return Barotrauma.CharacterInventory
_G['CharacterInventory'] = function() end

---`Constructor Private Static`
---@overload fun(element:Barotrauma.ContentXElement, character:Barotrauma.Character, spawnInitialItems:System.Boolean):Barotrauma.CharacterInventory
---@return Barotrauma.CharacterInventory
_G['CharacterInventory'].__new = function() end

