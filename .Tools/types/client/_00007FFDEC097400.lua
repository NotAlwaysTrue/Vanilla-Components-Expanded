---@meta
---@class Barotrauma.ItemInventory : Barotrauma.Inventory
---`Field Private Instance`
---@field container Barotrauma.Items.Components.ItemContainer
---`Getter Public Instance`
---@field Container Barotrauma.Items.Components.ItemContainer
_G['ItemInventory'] = {}

---`Method NonPublic Instance Virtual`
---@param cam Barotrauma.Camera
_G['ItemInventory'].ControlInput = function(cam) end

---`Method NonPublic Instance Virtual`
_G['ItemInventory'].CalculateBackgroundFrame = function() end

---`Method Public Instance Virtual`
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
---@param subInventory? System.Boolean
_G['ItemInventory'].Draw = function(spriteBatch, subInventory) end

---`Method Public Instance`
---@param msg Barotrauma.Networking.IWriteMessage
---@param extraData Barotrauma.Item.InventoryStateEventData
_G['ItemInventory'].ClientEventWrite = function(msg, extraData) end

---`Method Public Instance Virtual`
---@param item Barotrauma.Item
---@param ignoreCondition? System.Boolean
---@return System.Int32
_G['ItemInventory'].FindAllowedSlot = function(item, ignoreCondition) end

---`Method Public Instance Virtual`
---@overload fun(item:Barotrauma.Item, i:System.Int32, ignoreCondition?:System.Boolean):(System.Boolean)
---@param itemPrefab Barotrauma.ItemPrefab
---@param i System.Int32
---@param condition System.Nullable*1System*Single
---@param quality? System.Nullable*1System*Int32
---@return System.Boolean
_G['ItemInventory'].CanBePutInSlot = function(itemPrefab, i, condition, quality) end

---`Method Public Instance Virtual`
---@param itemPrefab Barotrauma.ItemPrefab
---@param i System.Int32
---@param condition System.Nullable*1System*Single
---@param ignoreItemsInSlot? System.Boolean
---@return System.Int32
_G['ItemInventory'].HowManyCanBePut = function(itemPrefab, i, condition, ignoreItemsInSlot) end

---`Method Public Instance Virtual`
---@param takeStacksIntoAccount? System.Boolean
---@return System.Boolean
_G['ItemInventory'].IsFull = function(takeStacksIntoAccount) end

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
_G['ItemInventory'].TryPutItem = function(item, i, allowSwapping, allowCombine, user, createNetworkEvent, ignoreCondition) end

---`Method NonPublic Instance Virtual`
---@param slotRange System.Range
_G['ItemInventory'].CreateNetworkEvent = function(slotRange) end

---`Method Public Instance Virtual`
---@param item Barotrauma.Item
_G['ItemInventory'].RemoveItem = function(item) end

---`Constructor Public Instance`
---@param owner Barotrauma.Item
---@param container Barotrauma.Items.Components.ItemContainer
---@param capacity System.Int32
---@param slotsPerRow? System.Int32
---@return Barotrauma.ItemInventory
_G['ItemInventory'] = function(owner, container, capacity, slotsPerRow) end

---`Constructor Public Instance`
---@param owner Barotrauma.Item
---@param container Barotrauma.Items.Components.ItemContainer
---@param capacity System.Int32
---@param slotsPerRow? System.Int32
---@return Barotrauma.ItemInventory
_G['ItemInventory'].__new = function(owner, container, capacity, slotsPerRow) end

