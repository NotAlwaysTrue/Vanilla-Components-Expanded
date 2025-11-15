---@meta
---@class Barotrauma.Item.InventoryStateEventData : System.ValueType
---`Field Public Instance`
---@field Component Barotrauma.Items.Components.ItemContainer
---`Field Public Instance`
---@field SlotRange System.Range
---`Getter Public Instance Virtual`
---@field EventType Barotrauma.Item.EventType
_G['Item']['InventoryStateEventData'] = {}

---`Constructor Public Instance`
---@param component Barotrauma.Items.Components.ItemContainer
---@param slotRange System.Range
---@return Barotrauma.Item.InventoryStateEventData
_G['Item']['InventoryStateEventData'] = function(component, slotRange) end

---`Constructor Public Instance`
---@param component Barotrauma.Items.Components.ItemContainer
---@param slotRange System.Range
---@return Barotrauma.Item.InventoryStateEventData
_G['Item']['InventoryStateEventData'].__new = function(component, slotRange) end

