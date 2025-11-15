---@meta
---@class Barotrauma.PurchasedItem : System.Object
---`Field Public Instance`
---@field BuyerCharacterInfoIdentifier System.Int32
---`Field Public Instance`
---@field Delivered System.Boolean
---`Getter Public Instance`
---@field ItemPrefab Barotrauma.ItemPrefab
---`Getter Public Instance`
---@field ItemPrefabIdentifier Barotrauma.Identifier
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Quantity System.Int32
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field IsStoreComponentEnabled System.Nullable*1System*Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field DeliverImmediately System.Boolean
_G['PurchasedItem'] = {}

---`Method Public Instance Virtual`
---@return System.String
_G['PurchasedItem'].ToString = function() end

---`Constructor Public Instance`
---@overload fun(itemPrefab:Barotrauma.ItemPrefab, quantity:System.Int32, buyerCharacterInfoId:System.Int32):Barotrauma.PurchasedItem
---@overload fun(itemPrefab:Barotrauma.ItemPrefab, quantity:System.Int32, buyer:Barotrauma.Networking.Client):Barotrauma.PurchasedItem
---@param itemPrefabId Barotrauma.Identifier
---@param quantity System.Int32
---@param buyer Barotrauma.Networking.Client
---@return Barotrauma.PurchasedItem
_G['PurchasedItem'] = function(itemPrefabId, quantity, buyer) end

---`Constructor Public Instance`
---@overload fun(itemPrefab:Barotrauma.ItemPrefab, quantity:System.Int32, buyerCharacterInfoId:System.Int32):Barotrauma.PurchasedItem
---@overload fun(itemPrefab:Barotrauma.ItemPrefab, quantity:System.Int32, buyer:Barotrauma.Networking.Client):Barotrauma.PurchasedItem
---@param itemPrefabId Barotrauma.Identifier
---@param quantity System.Int32
---@param buyer Barotrauma.Networking.Client
---@return Barotrauma.PurchasedItem
_G['PurchasedItem'].__new = function(itemPrefabId, quantity, buyer) end

