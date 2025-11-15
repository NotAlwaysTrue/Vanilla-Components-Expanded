---@meta
---@class Barotrauma.FabricationRecipe.RequiredItemByTag : Barotrauma.FabricationRecipe.RequiredItem
---`Field Public Instance`
---@field Tag Barotrauma.Identifier
---`Field Private Instance`
---@field cachedPrefabs (System.Collections.Generic.List*1Barotrauma*ItemPrefab)|(Barotrauma.ItemPrefab[])
---`Field Private Instance`
---@field prevContentPackagesHash Barotrauma.Md5Hash
---`Getter Public Instance Virtual`
---@field UintIdentifier System.UInt32
---`Getter Public Instance Virtual`
---@field ItemPrefabs (System.Collections.Generic.IEnumerable*1Barotrauma*ItemPrefab)|(fun():(Barotrauma.ItemPrefab))
---`Getter Public Instance Virtual`
---@field FirstMatchingPrefab Barotrauma.ItemPrefab
_G['FabricationRecipe']['RequiredItemByTag'] = {}

---`Method Public Instance Virtual`
---@param item Barotrauma.Item
---@return System.Boolean
_G['FabricationRecipe']['RequiredItemByTag'].MatchesItem = function(item) end

---`Method Public Instance Virtual`
---@return System.String
_G['FabricationRecipe']['RequiredItemByTag'].ToString = function() end

---`Constructor Public Instance`
---@param tag Barotrauma.Identifier
---@param amount System.Int32
---@param minCondition System.Single
---@param maxCondition System.Single
---@param useCondition System.Boolean
---@param overrideDescription Barotrauma.LocalizedString
---@param overrideHeader Barotrauma.LocalizedString
---@param defaultItem Barotrauma.Identifier
---@return Barotrauma.FabricationRecipe.RequiredItemByTag
_G['FabricationRecipe']['RequiredItemByTag'] = function(tag, amount, minCondition, maxCondition, useCondition, overrideDescription, overrideHeader, defaultItem) end

---`Constructor Public Instance`
---@param tag Barotrauma.Identifier
---@param amount System.Int32
---@param minCondition System.Single
---@param maxCondition System.Single
---@param useCondition System.Boolean
---@param overrideDescription Barotrauma.LocalizedString
---@param overrideHeader Barotrauma.LocalizedString
---@param defaultItem Barotrauma.Identifier
---@return Barotrauma.FabricationRecipe.RequiredItemByTag
_G['FabricationRecipe']['RequiredItemByTag'].__new = function(tag, amount, minCondition, maxCondition, useCondition, overrideDescription, overrideHeader, defaultItem) end

