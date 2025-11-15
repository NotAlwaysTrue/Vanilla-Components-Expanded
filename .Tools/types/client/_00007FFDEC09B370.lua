---@meta
---@class Barotrauma.CharacterParams.InventoryParams : Barotrauma.CharacterParams.SubParam
---`Getter Public Instance Virtual`
---@field Name System.String
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field Slots System.String
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field AccessibleWhenAlive System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field Commonness System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field Items (System.Collections.Generic.List*1Barotrauma*CharacterParams*InventoryParams*InventoryItem)|(Barotrauma.CharacterParams.InventoryParams.InventoryItem[])
_G['CharacterParams']['InventoryParams'] = {}

---`Method Public Instance`
---@param identifier? System.String
_G['CharacterParams']['InventoryParams'].AddItem = function(identifier) end

---`Method Public Instance`
---@param item Barotrauma.CharacterParams.InventoryParams.InventoryItem
---@return System.Boolean
_G['CharacterParams']['InventoryParams'].RemoveItem = function(item) end

---`Constructor Public Instance`
---@param element Barotrauma.ContentXElement
---@param character Barotrauma.CharacterParams
---@return Barotrauma.CharacterParams.InventoryParams
_G['CharacterParams']['InventoryParams'] = function(element, character) end

---`Constructor Public Instance`
---@param element Barotrauma.ContentXElement
---@param character Barotrauma.CharacterParams
---@return Barotrauma.CharacterParams.InventoryParams
_G['CharacterParams']['InventoryParams'].__new = function(element, character) end

