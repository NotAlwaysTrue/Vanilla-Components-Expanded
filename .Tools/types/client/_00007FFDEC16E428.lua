---@meta
---@class Barotrauma.UpgradePrefab : Barotrauma.UpgradeContentPrefab
---`Field Public Instance`
---@field DecorativeSprites (System.Collections.Immutable.ImmutableArray*1Barotrauma*DecorativeSprite)|(Barotrauma.DecorativeSprite[])
---`Field Public Instance`
---@field MaxLevel System.Int32
---`Field Private Instance`
---@field upgradeCategoryIdentifiers (System.Collections.Immutable.ImmutableHashSet*1Barotrauma*Identifier)|(Barotrauma.Identifier[])
---`Field Private Instance`
---@field MaxLevelsMods (System.Collections.Immutable.ImmutableArray*1Barotrauma*UpgradeMaxLevelMod)|(Barotrauma.UpgradeMaxLevelMod[])
---`Field Public Instance`
---@field ResourceCosts (System.Collections.Immutable.ImmutableHashSet*1Barotrauma*UpgradeResourceCost)|(Barotrauma.UpgradeResourceCost[])
---`Field Public Static`
---@field Prefabs (Barotrauma.PrefabCollection*1Barotrauma*UpgradePrefab)|(fun():(Barotrauma.UpgradePrefab))
---`Field Private Static`
---@field crushDepthUpgradePrc System.Nullable*1System*Int32
---`Field Private Static`
---@field increaseWallHealthMaxLevel System.Nullable*1System*Int32
---`Field Public Static`
---@field CrushDepthDefaultUpgradePrc System.Int32
---`Field Public Static`
---@field IncreaseWallHealthDefaultMaxLevel System.Int32
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field Sprite Barotrauma.Sprite
---`Getter Public Instance`
---@field Name Barotrauma.LocalizedString
---`Getter Public Instance`
---@field Description Barotrauma.LocalizedString
---`Getter Public Instance`
---@field IncreaseOnTooltip System.Single
---`Getter Public Instance`
---@field UpgradeCategories (System.Collections.Generic.IEnumerable*1Barotrauma*UpgradeCategory)|(fun():(Barotrauma.UpgradeCategory))
---`Getter Public Instance`
---@field Price Barotrauma.UpgradePrice
---`Getter Private Instance`
---@field isOverride System.Boolean
---`Getter Public Instance`
---@field SourceElement Barotrauma.ContentXElement
---`Getter Public Instance`
---@field SuppressWarnings System.Boolean
---`Getter Public Instance`
---@field HideInMenus System.Boolean
---`Getter Public Instance`
---@field TargetItems (System.Collections.Generic.IEnumerable*1Barotrauma*Identifier)|(fun():(Barotrauma.Identifier))
---`Getter Public Instance`
---@field IsWallUpgrade System.Boolean
---`Getter Private Instance`
---@field targetProperties (System.Collections.Generic.Dictionary*1System*String*1System*String-arr)|({[System.String]:((System.String-arr)|(System.String[]))})
---`Getter Public Static`
---@field CrushDepthUpgradePrc System.Int32
---`Getter Public Static`
---@field IncreaseWallHealthMaxLevel System.Int32
_G['UpgradePrefab'] = {}

---`Method Public Instance`
---@return System.Int32
_G['UpgradePrefab'].GetMaxLevelForCurrentSub = function() end

---`Method Public Instance`
---@param info Barotrauma.SubmarineInfo
---@return System.Int32
_G['UpgradePrefab'].GetMaxLevel = function(info) end

---`Method Public Instance`
---@param info Barotrauma.SubmarineInfo
---@return System.Boolean
_G['UpgradePrefab'].IsApplicable = function(info) end

---`Method Public Instance`
---@param character Barotrauma.Character
---@param currentLevel System.Int32
---@return System.Boolean
_G['UpgradePrefab'].HasResourcesToUpgrade = function(character, currentLevel) end

---`Method Public Instance`
---@param character Barotrauma.Character
---@param currentLevel System.Int32
---@return System.Boolean
_G['UpgradePrefab'].TryTakeResources = function(character, currentLevel) end

---`Method Public Instance`
---@param level System.Int32
---@return (System.Collections.Immutable.ImmutableArray*1Barotrauma*ApplicableResourceCollection)|(Barotrauma.ApplicableResourceCollection[])
_G['UpgradePrefab'].GetApplicableResources = function(level) end

---`Method Public Instance`
---@param item Barotrauma.MapEntity
---@return System.Boolean
_G['UpgradePrefab'].IsDisallowed = function(item) end

---`Method Public Static`
---@param identifier Barotrauma.Identifier
---@return Barotrauma.UpgradePrefab
_G['UpgradePrefab'].Find = function(identifier) end

---`Method Public Static`
---@param value System.String
---@param attribute? Barotrauma.Identifier
---@param sourceElement? System.Xml.Linq.XElement
---@param suppressWarnings? System.Boolean
---@return System.Int32
_G['UpgradePrefab'].ParsePercentage = function(value, attribute, sourceElement, suppressWarnings) end

---`Method Public Instance Virtual`
_G['UpgradePrefab'].Dispose = function() end

---`Constructor Public Instance`
---@overload fun(element:Barotrauma.ContentXElement, file:Barotrauma.UpgradeModulesFile):Barotrauma.UpgradePrefab
---@return Barotrauma.UpgradePrefab
_G['UpgradePrefab'] = function() end

---`Constructor Public Instance`
---@overload fun(element:Barotrauma.ContentXElement, file:Barotrauma.UpgradeModulesFile):Barotrauma.UpgradePrefab
---@return Barotrauma.UpgradePrefab
_G['UpgradePrefab'].__new = function() end

---`Constructor Private Static`
---@overload fun(element:Barotrauma.ContentXElement, file:Barotrauma.UpgradeModulesFile):Barotrauma.UpgradePrefab
---@return Barotrauma.UpgradePrefab
_G['UpgradePrefab'] = function() end

---`Constructor Private Static`
---@overload fun(element:Barotrauma.ContentXElement, file:Barotrauma.UpgradeModulesFile):Barotrauma.UpgradePrefab
---@return Barotrauma.UpgradePrefab
_G['UpgradePrefab'].__new = function() end

