---@meta
---@class Barotrauma.CharacterInventory : Barotrauma.Inventory
---`Field Private Instance`
---@field screenResolution Microsoft.Xna.Framework.Point
---`Field Public Instance`
---@field SlotPositions (Microsoft.Xna.Framework.Vector2-arr)|(Microsoft.Xna.Framework.Vector2[])
---`Field Private Instance`
---@field layout Barotrauma.CharacterInventory.Layout
---`Field Private Instance`
---@field personalSlotArea Microsoft.Xna.Framework.Rectangle
---`Field Private Instance`
---@field character Barotrauma.Character
---`Field NonPublic Instance`
---@field IsEquipped (System.Boolean-arr)|(System.Boolean[])
---`Field Private Static`
---@field limbSlotIcons (System.Collections.Generic.Dictionary*1Barotrauma*InvSlotType*1Barotrauma*Sprite)|({[Barotrauma.InvSlotType]:(Barotrauma.Sprite)})
---`Field Public Static`
---@field SlotSize Microsoft.Xna.Framework.Point
---`Field Private Static`
---@field hideSubInventories (System.Collections.Generic.List*1Barotrauma*Inventory*SlotReference)|(Barotrauma.Inventory.SlotReference[])
---`Field Private Static`
---@field tempHighlightedSubInventorySlots (System.Collections.Generic.List*1Barotrauma*Inventory*SlotReference)|(Barotrauma.Inventory.SlotReference[])
---`Field Public Static`
---@field AnySlot (System.Collections.Generic.List*1Barotrauma*InvSlotType)|(Barotrauma.InvSlotType[])
---`Field Public Static`
---@field BagSlot (System.Collections.Generic.List*1Barotrauma*InvSlotType)|(Barotrauma.InvSlotType[])
---`Field Public Static`
---@field PersonalSlots Barotrauma.InvSlotType
---`Getter Public Static`
---@field LimbSlotIcons (System.Collections.Generic.Dictionary*1Barotrauma*InvSlotType*1Barotrauma*Sprite)|({[Barotrauma.InvSlotType]:(Barotrauma.Sprite)})
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field CurrentLayout Barotrauma.CharacterInventory.Layout
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

---`Method NonPublic Instance Virtual`
---@param slotIndex System.Int32
---@return Barotrauma.ItemInventory
_G['CharacterInventory'].GetActiveEquippedSubInventory = function(slotIndex) end

---`Method Public Instance Virtual`
_G['CharacterInventory'].CreateSlots = function() end

---`Method NonPublic Instance Virtual`
_G['CharacterInventory'].CalculateBackgroundFrame = function() end

---`Method Public Instance Virtual`
---@param i System.Int32
---@return System.Boolean
_G['CharacterInventory'].HideSlot = function(i) end

---`Method Public Instance`
_G['CharacterInventory'].RefreshSlotPositions = function() end

---`Method Private Instance`
---@param layout Barotrauma.CharacterInventory.Layout
_G['CharacterInventory'].SetSlotPositions = function(layout) end

---`Method NonPublic Instance Virtual`
---@param cam Barotrauma.Camera
_G['CharacterInventory'].ControlInput = function(cam) end

---`Method Public Instance Virtual`
---@param deltaTime System.Single
---@param cam Barotrauma.Camera
---@param isSubInventory? System.Boolean
_G['CharacterInventory'].Update = function(deltaTime, cam, isSubInventory) end

---`Method Public Instance`
_G['CharacterInventory'].UpdateSlotInput = function() end

---`Method Private Instance`
---@param item Barotrauma.Item
---@param slot Barotrauma.VisualSlot
---@param deltaTime System.Single
_G['CharacterInventory'].HandleButtonEquipStates = function(item, slot, deltaTime) end

---`Method Private Instance`
---@param slotRef Barotrauma.Inventory.SlotReference
---@param deltaTime System.Single
---@param cam Barotrauma.Camera
---@param hideSubInventories (System.Collections.Generic.List*1Barotrauma*Inventory*SlotReference)|(Barotrauma.Inventory.SlotReference[])
---@param isEquippedSubInventory System.Boolean
_G['CharacterInventory'].ShowSubInventory = function(slotRef, deltaTime, cam, hideSubInventories, isEquippedSubInventory) end

---`Method Public Instance`
_G['CharacterInventory'].AssignQuickUseNumKeys = function() end

---`Method Private Instance`
---@param item Barotrauma.Item
---@param allowEquip System.Boolean
---@param allowInventorySwap System.Boolean
---@param allowApplyTreatment System.Boolean
---@return Barotrauma.CharacterInventory.QuickUseAction
_G['CharacterInventory'].GetQuickUseAction = function(item, allowEquip, allowInventorySwap, allowApplyTreatment) end

---`Method Private Instance`
---@param item Barotrauma.Item
---@param allowEquip System.Boolean
---@param allowInventorySwap System.Boolean
---@param allowApplyTreatment System.Boolean
---@param action? System.Nullable*1Barotrauma*CharacterInventory*QuickUseAction
---@param playSound? System.Boolean
_G['CharacterInventory'].QuickUseItem = function(item, allowEquip, allowInventorySwap, allowApplyTreatment, action, playSound) end

---`Method Public Instance`
---@param item Barotrauma.Item
---@return System.Boolean
_G['CharacterInventory'].CanBeAutoMovedToCorrectSlots = function(item) end

---`Method Public Instance`
---@param item Barotrauma.Item
---@param color Microsoft.Xna.Framework.Color
_G['CharacterInventory'].FlashAllowedSlots = function(item, color) end

---`Method Public Instance`
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
_G['CharacterInventory'].DrawOwn = function(spriteBatch) end

---`Method Public Instance`
---@param msg Barotrauma.Networking.IWriteMessage
---@param extraData Barotrauma.Character.InventoryStateEventData
_G['CharacterInventory'].ClientEventWrite = function(msg, extraData) end

---`Method Public Static`
---@param s Barotrauma.InvSlotType
---@return System.Boolean
_G['CharacterInventory'].IsHandSlotType = function(s) end

---`Method Private Static`
---@param element Barotrauma.ContentXElement
---@return (System.String-arr)|(System.String[])
_G['CharacterInventory'].ParseSlotTypes = function(element) end

---`Method Private Instance`
---@param element System.Xml.Linq.XElement
_G['CharacterInventory'].InitProjSpecific = function(element) end

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

