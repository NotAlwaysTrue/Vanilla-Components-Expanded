---@meta
---@class Barotrauma.RelatedItem : System.Object
---`Field Private Instance`
---@field type Barotrauma.RelatedItem.RelationType
---`Field Public Instance`
---@field StatusEffects (System.Collections.Generic.List*1Barotrauma*StatusEffect)|(Barotrauma.StatusEffect[])
---`Field Public Instance`
---@field Msg Barotrauma.LocalizedString
---`Field Public Instance`
---@field MsgTag Barotrauma.Identifier
---`Field Public Instance`
---@field TargetSlot System.Int32
---`Field Public Instance`
---@field CharacterInventorySlotType Barotrauma.InvSlotType
---`Field Public Instance`
---@field ItemPos System.Nullable*1Microsoft*Xna*Framework*Vector2
---`Field Public Instance`
---@field Hide System.Boolean
---`Field Public Instance`
---@field Rotation System.Single
---`Field Public Instance`
---@field SetActive System.Boolean
---`Field Public Instance`
---@field BlameEquipperForDeath System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field MatchOnEmpty System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field RequireEmpty System.Boolean
---`Getter Private Instance`
---@field RequireOrMatchOnEmpty System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field IgnoreInEditor System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field ExcludedIdentifiers (System.Collections.Immutable.ImmutableHashSet*1Barotrauma*Identifier)|(Barotrauma.Identifier[])
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field ExcludeBroken System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field ExcludeFullCondition System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field AllowVariants System.Boolean
---`Getter Public Instance`
---@field Type Barotrauma.RelatedItem.RelationType
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field IsOptional System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field JoinedIdentifiers System.String
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field Identifiers (System.Collections.Immutable.ImmutableHashSet*1Barotrauma*Identifier)|(Barotrauma.Identifier[])
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field JoinedExcludedIdentifiers System.String
_G['RelatedItem'] = {}

---`Method Public Instance`
---@overload fun(item:Barotrauma.Item):(System.Boolean)
---@param itemPrefab Barotrauma.ItemPrefab
---@return System.Boolean
_G['RelatedItem'].MatchesItem = function(itemPrefab) end

---`Method Public Instance`
---@param character Barotrauma.Character
---@param parentItem Barotrauma.Item
---@return System.Boolean
_G['RelatedItem'].CheckRequirements = function(character, parentItem) end

---`Method Private Instance`
---@param parentItem Barotrauma.Item
---@return System.Boolean
_G['RelatedItem'].CheckContained = function(parentItem) end

---`Method Public Instance`
---@param element System.Xml.Linq.XElement
_G['RelatedItem'].Save = function(element) end

---`Method Public Static`
---@param element Barotrauma.ContentXElement
---@param returnEmpty System.Boolean
---@param parentDebugName System.String
---@return Barotrauma.RelatedItem
_G['RelatedItem'].Load = function(element, returnEmpty, parentDebugName) end

---`Constructor Public Instance`
---@overload fun(identifiers:(Barotrauma.Identifier-arr)|(Barotrauma.Identifier[]), excludedIdentifiers:(Barotrauma.Identifier-arr)|(Barotrauma.Identifier[])):Barotrauma.RelatedItem
---@param element Barotrauma.ContentXElement
---@param parentDebugName System.String
---@return Barotrauma.RelatedItem
_G['RelatedItem'] = function(element, parentDebugName) end

---`Constructor Public Instance`
---@overload fun(identifiers:(Barotrauma.Identifier-arr)|(Barotrauma.Identifier[]), excludedIdentifiers:(Barotrauma.Identifier-arr)|(Barotrauma.Identifier[])):Barotrauma.RelatedItem
---@param element Barotrauma.ContentXElement
---@param parentDebugName System.String
---@return Barotrauma.RelatedItem
_G['RelatedItem'].__new = function(element, parentDebugName) end

