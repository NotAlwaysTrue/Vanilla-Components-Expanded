---@meta
---@class Barotrauma.FabricationRecipe.RequiredItem : System.Object
---`Field Public Instance`
---@field Amount System.Int32
---`Field Public Instance`
---@field MinCondition System.Single
---`Field Public Instance`
---@field MaxCondition System.Single
---`Field Public Instance`
---@field UseCondition System.Boolean
---`Field Public Instance`
---@field DefaultItem Barotrauma.Identifier
---`Getter Public Instance Abstract Virtual`
---@field ItemPrefabs (System.Collections.Generic.IEnumerable*1Barotrauma*ItemPrefab)|(fun():(Barotrauma.ItemPrefab))
---`Getter Public Instance Abstract Virtual`
---@field UintIdentifier System.UInt32
---`Getter Public Instance Abstract Virtual`
---@field FirstMatchingPrefab Barotrauma.ItemPrefab
---`Getter Public Instance`
---@field OverrideHeader Barotrauma.LocalizedString
---`Getter Public Instance`
---@field OverrideDescription Barotrauma.LocalizedString
_G['FabricationRecipe']['RequiredItem'] = {}

---`Method Public Instance Abstract Virtual`
---@param item Barotrauma.Item
---@return System.Boolean
_G['FabricationRecipe']['RequiredItem'].MatchesItem = function(item) end

---`Method Public Instance`
---@param conditionPercentage System.Single
---@return System.Boolean
_G['FabricationRecipe']['RequiredItem'].IsConditionSuitable = function(conditionPercentage) end

---`Constructor Public Instance`
---@param amount System.Int32
---@param minCondition System.Single
---@param maxCondition System.Single
---@param useCondition System.Boolean
---@param overrideDescription Barotrauma.LocalizedString
---@param overrideHeader Barotrauma.LocalizedString
---@param defaultItem Barotrauma.Identifier
---@return Barotrauma.FabricationRecipe.RequiredItem
_G['FabricationRecipe']['RequiredItem'] = function(amount, minCondition, maxCondition, useCondition, overrideDescription, overrideHeader, defaultItem) end

---`Constructor Public Instance`
---@param amount System.Int32
---@param minCondition System.Single
---@param maxCondition System.Single
---@param useCondition System.Boolean
---@param overrideDescription Barotrauma.LocalizedString
---@param overrideHeader Barotrauma.LocalizedString
---@param defaultItem Barotrauma.Identifier
---@return Barotrauma.FabricationRecipe.RequiredItem
_G['FabricationRecipe']['RequiredItem'].__new = function(amount, minCondition, maxCondition, useCondition, overrideDescription, overrideHeader, defaultItem) end

