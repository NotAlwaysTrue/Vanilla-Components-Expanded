---@meta
---@class Barotrauma.UpgradePrice : System.ValueType
---`Field Public Instance`
---@field BasePrice System.Int32
---`Field Public Instance`
---@field IncreaseLow System.Int32
---`Field Public Instance`
---@field IncreaseHigh System.Int32
_G['UpgradePrice'] = {}

---`Method Public Instance`
---@param prefab Barotrauma.UpgradePrefab
---@param level System.Int32
---@param location? Barotrauma.Location
---@param characterList? (System.Collections.Immutable.ImmutableHashSet*1Barotrauma*Character)|(Barotrauma.Character[])
---@return System.Int32
_G['UpgradePrice'].GetBuyPrice = function(prefab, level, location, characterList) end

---`Constructor Public Instance`
---@param prefab Barotrauma.UpgradePrefab
---@param element Barotrauma.ContentXElement
---@return Barotrauma.UpgradePrice
_G['UpgradePrice'] = function(prefab, element) end

---`Constructor Public Instance`
---@param prefab Barotrauma.UpgradePrefab
---@param element Barotrauma.ContentXElement
---@return Barotrauma.UpgradePrice
_G['UpgradePrice'].__new = function(prefab, element) end

