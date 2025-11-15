---@meta
---@class Barotrauma.SoldItem : System.Object
---`Getter Public Instance`
---@field ItemPrefab Barotrauma.ItemPrefab
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field ID System.UInt16
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Removed System.Boolean
---`Getter Public Instance`
---@field SellerID System.Byte
---`Getter Public Instance`
---@field Origin Barotrauma.SoldItem.SellOrigin
_G['SoldItem'] = {}

---`Method Public Instance`
---@param id System.UInt16
_G['SoldItem'].SetItemId = function(id) end

---`Constructor Public Instance`
---@param itemPrefab Barotrauma.ItemPrefab
---@param id System.UInt16
---@param removed System.Boolean
---@param sellerId System.Byte
---@param origin Barotrauma.SoldItem.SellOrigin
---@return Barotrauma.SoldItem
_G['SoldItem'] = function(itemPrefab, id, removed, sellerId, origin) end

---`Constructor Public Instance`
---@param itemPrefab Barotrauma.ItemPrefab
---@param id System.UInt16
---@param removed System.Boolean
---@param sellerId System.Byte
---@param origin Barotrauma.SoldItem.SellOrigin
---@return Barotrauma.SoldItem
_G['SoldItem'].__new = function(itemPrefab, id, removed, sellerId, origin) end

