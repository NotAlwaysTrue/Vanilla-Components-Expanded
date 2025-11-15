---@meta
---@class Barotrauma.FabricationRecipe.RequiredItemByIdentifier : Barotrauma.FabricationRecipe.RequiredItem
---`Field Public Instance`
---@field ItemPrefabIdentifier Barotrauma.Identifier
---`Field Public Instance`
---@field cachedItemPrefab Barotrauma.ItemPrefab
---`Field Private Instance`
---@field prevContentPackagesHash Barotrauma.Md5Hash
---`Getter Public Instance`
---@field ItemPrefab Barotrauma.ItemPrefab
---`Getter Public Instance Virtual`
---@field UintIdentifier System.UInt32
---`Getter Public Instance Virtual`
---@field ItemPrefabs (System.Collections.Generic.IEnumerable*1Barotrauma*ItemPrefab)|(fun():(Barotrauma.ItemPrefab))
---`Getter Public Instance Virtual`
---@field FirstMatchingPrefab Barotrauma.ItemPrefab
_G['FabricationRecipe']['RequiredItemByIdentifier'] = {}

---`Method Public Instance Virtual`
---@param item Barotrauma.Item
---@return System.Boolean
_G['FabricationRecipe']['RequiredItemByIdentifier'].MatchesItem = function(item) end

---`Method Public Instance Virtual`
---@return System.String
_G['FabricationRecipe']['RequiredItemByIdentifier'].ToString = function() end

---`Constructor Public Instance`
---@param itemPrefab Barotrauma.Identifier
---@param amount System.Int32
---@param minCondition System.Single
---@param maxCondition System.Single
---@param useCondition System.Boolean
---@param overrideDescription Barotrauma.LocalizedString
---@param overrideHeader Barotrauma.LocalizedString
---@return Barotrauma.FabricationRecipe.RequiredItemByIdentifier
_G['FabricationRecipe']['RequiredItemByIdentifier'] = function(itemPrefab, amount, minCondition, maxCondition, useCondition, overrideDescription, overrideHeader) end

---`Constructor Public Instance`
---@param itemPrefab Barotrauma.Identifier
---@param amount System.Int32
---@param minCondition System.Single
---@param maxCondition System.Single
---@param useCondition System.Boolean
---@param overrideDescription Barotrauma.LocalizedString
---@param overrideHeader Barotrauma.LocalizedString
---@return Barotrauma.FabricationRecipe.RequiredItemByIdentifier
_G['FabricationRecipe']['RequiredItemByIdentifier'].__new = function(itemPrefab, amount, minCondition, maxCondition, useCondition, overrideDescription, overrideHeader) end

