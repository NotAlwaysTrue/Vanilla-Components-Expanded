---@meta
---@class Barotrauma.FabricationRecipe : System.Object
---`Field Public Instance`
---@field TargetItemPrefabIdentifier Barotrauma.Identifier
---`Field Private Instance`
---@field displayName System.Lazy*1Barotrauma*LocalizedString
---`Field Public Instance`
---@field RequiredItems (System.Collections.Immutable.ImmutableArray*1Barotrauma*FabricationRecipe*RequiredItem)|(Barotrauma.FabricationRecipe.RequiredItem[])
---`Field Public Instance`
---@field SuitableFabricatorIdentifiers (System.Collections.Immutable.ImmutableArray*1Barotrauma*Identifier)|(Barotrauma.Identifier[])
---`Field Public Instance`
---@field RequiredTime System.Single
---`Field Public Instance`
---@field RequiredMoney System.Int32
---`Field Public Instance`
---@field RequiresRecipe System.Boolean
---`Field Public Instance`
---@field HideIfNoRecipe System.Boolean
---`Field Public Instance`
---@field OutCondition System.Single
---`Field Public Instance`
---@field RequiredSkills (System.Collections.Immutable.ImmutableArray*1Barotrauma*Skill)|(Barotrauma.Skill[])
---`Field Public Instance`
---@field RecipeHash System.UInt32
---`Field Public Instance`
---@field Amount System.Int32
---`Field Public Instance`
---@field Quality System.Nullable*1System*Int32
---`Field Public Instance`
---@field HideForNonTraitors System.Boolean
---`Field Public Instance`
---@field MoveToSlot Barotrauma.InvSlotType
---`Field Public Instance`
---@field FabricationLimitMin System.Int32
---`Field Public Instance`
---@field FabricationLimitMax System.Int32
---`Getter Public Instance`
---@field TargetItem Barotrauma.ItemPrefab
---`Getter Public Instance`
---@field DisplayName Barotrauma.LocalizedString
_G['FabricationRecipe'] = {}

---`Method Private Instance`
---@return System.UInt32
_G['FabricationRecipe'].GenerateHash = function() end

---`Constructor Public Instance`
---@param element Barotrauma.ContentXElement
---@param itemPrefab Barotrauma.Identifier
---@return Barotrauma.FabricationRecipe
_G['FabricationRecipe'] = function(element, itemPrefab) end

---`Constructor Public Instance`
---@param element Barotrauma.ContentXElement
---@param itemPrefab Barotrauma.Identifier
---@return Barotrauma.FabricationRecipe
_G['FabricationRecipe'].__new = function(element, itemPrefab) end

