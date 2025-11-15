---@meta
---@class Barotrauma.ItemPrefab : Barotrauma.MapEntityPrefab
---`Field Public Instance`
---@field UpgradePreviewScale System.Single
---`Field Private Instance`
---@field wearableDamageModifiers (System.Collections.Generic.IReadOnlyList*1Barotrauma*DamageModifier)|(Barotrauma.DamageModifier[])
---`Field Private Instance`
---@field wearableSkillModifiers (System.Collections.Generic.IReadOnlyDictionary*1Barotrauma*Identifier*1System*Single)|({[Barotrauma.Identifier]:(System.Single)})
---`Field Private Instance`
---@field defaultPrice Barotrauma.PriceInfo
---`Field Private Instance`
---@field treatmentSuitability (System.Collections.Immutable.ImmutableDictionary*1Barotrauma*Identifier*1System*Single)|({[Barotrauma.Identifier]:(System.Single)})
---`Field Private Instance`
---@field originalElement Barotrauma.ContentXElement
---`Field Private Instance`
---@field canSpriteFlipX System.Boolean
---`Field Private Instance`
---@field canSpriteFlipY System.Boolean
---`Field Private Instance`
---@field sprite Barotrauma.Sprite
---`Field Private Instance`
---@field name Barotrauma.LocalizedString
---`Field Private Instance`
---@field tags (System.Collections.Immutable.ImmutableHashSet*1Barotrauma*Identifier)|(Barotrauma.Identifier[])
---`Field Private Instance`
---@field allowedLinks (System.Collections.Immutable.ImmutableHashSet*1Barotrauma*Identifier)|(Barotrauma.Identifier[])
---`Field Private Instance`
---@field category Barotrauma.MapEntityCategory
---`Field Private Instance`
---@field aliases (System.Collections.Immutable.ImmutableHashSet*1System*String)|(System.String[])
---`Field Private Instance`
---@field health System.Single
---`Field Private Instance`
---@field impactTolerance System.Single
---`Field Private Instance`
---@field maxStackSize System.Int32
---`Field Private Instance`
---@field maxStackSizeCharacterInventory System.Int32
---`Field Private Instance`
---@field maxStackSizeHoldableOrWearableInventory System.Int32
---`Field Public Static`
---@field Prefabs (Barotrauma.PrefabCollection*1Barotrauma*ItemPrefab)|(fun():(Barotrauma.ItemPrefab))
---`Field Public Static`
---@field DefaultInteractDistance System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field UpgradeOverrideSprites (System.Collections.Immutable.ImmutableDictionary*1Barotrauma*Identifier*1System*Collections*Immutable*ImmutableArray*2Barotrauma*DecorativeSprite)|({[Barotrauma.Identifier]:((System.Collections.Immutable.ImmutableArray*1Barotrauma*DecorativeSprite)|(Barotrauma.DecorativeSprite[]))})
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field BrokenSprites (System.Collections.Immutable.ImmutableArray*1Barotrauma*BrokenItemSprite)|(Barotrauma.BrokenItemSprite[])
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field DecorativeSprites (System.Collections.Immutable.ImmutableArray*1Barotrauma*DecorativeSprite)|(Barotrauma.DecorativeSprite[])
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field ContainedSprites (System.Collections.Immutable.ImmutableArray*1Barotrauma*ContainedItemSprite)|(Barotrauma.ContainedItemSprite[])
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field DecorativeSpriteGroups (System.Collections.Immutable.ImmutableDictionary*1System*Int32*1System*Collections*Immutable*ImmutableArray*2Barotrauma*DecorativeSprite)|({[System.Int32]:((System.Collections.Immutable.ImmutableArray*1Barotrauma*DecorativeSprite)|(Barotrauma.DecorativeSprite[]))})
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field InventoryIcon Barotrauma.Sprite
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field MinimapIcon Barotrauma.Sprite
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field UpgradePreviewSprite Barotrauma.Sprite
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field InfectedSprite Barotrauma.Sprite
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field DamagedInfectedSprite Barotrauma.Sprite
---`Getter Public Instance`
---<br/>`Setter NonPublic Instance`
---@field InventoryIconColor Microsoft.Xna.Framework.Color
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field ImpactSoundTag System.String
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field ShowInStatusMonitor System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field Size Microsoft.Xna.Framework.Vector2
---`Getter Public Instance`
---@field DefaultPrice Barotrauma.PriceInfo
---`Getter Private Instance`
---<br/>`Setter Private Instance`
---@field StorePrices (System.Collections.Immutable.ImmutableDictionary*1Barotrauma*Identifier*1Barotrauma*PriceInfo)|({[Barotrauma.Identifier]:(Barotrauma.PriceInfo)})
---`Getter Public Instance`
---@field CanBeBought System.Boolean
---`Getter Public Instance`
---@field CanBeSold System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field Triggers (System.Collections.Immutable.ImmutableArray*1Microsoft*Xna*Framework*Rectangle)|(Microsoft.Xna.Framework.Rectangle[])
---`Getter Public Instance`
---@field IsOverride System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field ConfigElement Barotrauma.ContentXElement
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field DeconstructItems (System.Collections.Immutable.ImmutableArray*1Barotrauma*DeconstructItem)|(Barotrauma.DeconstructItem[])
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field FabricationRecipes (System.Collections.Immutable.ImmutableDictionary*1System*UInt32*1Barotrauma*FabricationRecipe)|({[System.UInt32]:(Barotrauma.FabricationRecipe)})
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field DeconstructTime System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field AllowDeconstruct System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field PreferredContainers (System.Collections.Immutable.ImmutableArray*1Barotrauma*PreferredContainer)|(Barotrauma.PreferredContainer[])
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field SkillRequirementHints (System.Collections.Immutable.ImmutableArray*1Barotrauma*SkillRequirementHint)|(Barotrauma.SkillRequirementHint[])
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field SwappableItem Barotrauma.SwappableItem
---`Getter Private Instance`
---<br/>`Setter Private Instance`
---@field LevelCommonness (System.Collections.Immutable.ImmutableDictionary*1Barotrauma*Identifier*1Barotrauma*ItemPrefab*CommonnessInfo)|({[Barotrauma.Identifier]:(Barotrauma.ItemPrefab.CommonnessInfo)})
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field LevelQuantity (System.Collections.Immutable.ImmutableDictionary*1Barotrauma*Identifier*1Barotrauma*ItemPrefab*FixedQuantityResourceInfo)|({[Barotrauma.Identifier]:(Barotrauma.ItemPrefab.FixedQuantityResourceInfo)})
---`Getter Public Instance Virtual`
---@field CanSpriteFlipX System.Boolean
---`Getter Public Instance Virtual`
---@field CanSpriteFlipY System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field AllowAsExtraCargo System.Nullable*1System*Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field RandomDeconstructionOutput System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field RandomDeconstructionOutputAmount System.Int32
---`Getter Public Instance Virtual`
---@field Sprite Barotrauma.Sprite
---`Getter Public Instance Virtual`
---@field OriginalName System.String
---`Getter Public Instance Virtual`
---@field Name Barotrauma.LocalizedString
---`Getter Public Instance Virtual`
---@field Tags (System.Collections.Immutable.ImmutableHashSet*1Barotrauma*Identifier)|(Barotrauma.Identifier[])
---`Getter Public Instance Virtual`
---@field AllowedLinks (System.Collections.Immutable.ImmutableHashSet*1Barotrauma*Identifier)|(Barotrauma.Identifier[])
---`Getter Public Instance Virtual`
---@field Category Barotrauma.MapEntityCategory
---`Getter Public Instance Virtual`
---@field Aliases (System.Collections.Immutable.ImmutableHashSet*1System*String)|(System.String[])
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field InteractDistance System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field InteractPriority System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field InteractThroughWalls System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field HideConditionBar System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field HideConditionInTooltip System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field UnlockedRecipeInToolTip Barotrauma.Identifier
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field RequireBodyInsideTrigger System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field RequireCursorInsideTrigger System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field RequireCampaignInteract System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field FocusOnSelected System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field OffsetOnSelected System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field GrabWhenSelected System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field AllowDeselectWhenIdling System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field Health System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field AllowSellingWhenBroken System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field AllowStealingAlways System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field Indestructible System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field DamagedByExplosions System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field DamagedByContainedItemExplosions System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field ExplosionDamageMultiplier System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field ItemDamageMultiplier System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field DamagedByProjectiles System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field DamagedByMeleeWeapons System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field DamagedByRepairTools System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field DamagedByMonsters System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field ImpactTolerance System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field ImpactDamage System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field ImpactDamageProbability System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field ReceiveSubmarineImpacts System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field OnDamagedThreshold System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field SonarSize System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field UseInHealthInterface System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field DisableItemUsageWhenSelected System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field CargoContainerIdentifier System.String
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field UseContainedSpriteColor System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field UseContainedInventoryIconColor System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field AddedRepairSpeedMultiplier System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field AddedPickingSpeedMultiplier System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field CannotRepairFail System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field EquipConfirmationText System.String
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field AllowRotatingInEditor System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field ShowContentsInTooltip System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field CanFlipX System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field CanFlipY System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field MinScale System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field MaxScale System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field IsDangerous System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field MaxStackSize System.Int32
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field MaxStackSizeCharacterInventory System.Int32
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field MaxStackSizeHoldableOrWearableInventory System.Int32
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field AllowDroppingOnSwap System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field AllowDroppingOnSwapWith (System.Collections.Immutable.ImmutableHashSet*1Barotrauma*Identifier)|(Barotrauma.Identifier[])
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field DontTransferBetweenSubs System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field ShowHealthBar System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field BotPriority System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field ShowNameInHealthBar System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field IsAITurretTarget System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field AITurretPriority System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field AISlowTurretPriority System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field AITurretTargetingMaxDistance System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field AllowStealingContainedItems System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field SignalComponentColor Microsoft.Xna.Framework.Color
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field DisableCommandMenuWhenSelected System.Boolean
---`Getter Public Instance Virtual`
---@field VariantOf Barotrauma.Identifier
---`Getter Public Instance Virtual`
---<br/>`Setter Public Instance Virtual`
---@field ParentPrefab Barotrauma.ItemPrefab
_G['ItemPrefab'] = {}

---`Method Private Instance`
---@param element Barotrauma.ContentXElement
---@param variantOf Barotrauma.ItemPrefab
_G['ItemPrefab'].ParseSubElementsClient = function(element, variantOf) end

---`Method Public Instance`
---@return System.Boolean
_G['ItemPrefab'].CanCharacterBuy = function() end

---`Method Public Instance`
---@param character Barotrauma.Character
---@return Barotrauma.LocalizedString
_G['ItemPrefab'].GetTooltip = function(character) end

---`Method Public Instance Virtual`
---@param cam Barotrauma.Camera
_G['ItemPrefab'].UpdatePlacing = function(cam) end

---`Method Public Instance Virtual`
---@overload fun(spriteBatch:Microsoft.Xna.Framework.Graphics.SpriteBatch, cam:Barotrauma.Camera)
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
---@param placeRect Microsoft.Xna.Framework.Rectangle
---@param scale? System.Single
---@param rotation? System.Single
---@param spriteEffects? Microsoft.Xna.Framework.Graphics.SpriteEffects
_G['ItemPrefab'].DrawPlacing = function(spriteBatch, placeRect, scale, rotation, spriteEffects) end

---`Method Public Instance`
---@param character Barotrauma.Character
---@return Barotrauma.LocalizedString
_G['ItemPrefab'].GetSkillRequirementHints = function(character) end

---`Method Public Instance`
---@param inventory Barotrauma.Inventory
---@return System.Int32
_G['ItemPrefab'].GetMaxStackSize = function(inventory) end

---`Method NonPublic Instance Virtual`
---@param element System.Xml.Linq.XElement
---@return Barotrauma.Identifier
_G['ItemPrefab'].DetermineIdentifier = function(element) end

---`Method Public Static`
---@param name System.String
---@return Barotrauma.Identifier
_G['ItemPrefab'].GenerateLegacyIdentifier = function(name) end

---`Method Public Instance`
---@param subElement Barotrauma.ContentXElement
---@param variantOf Barotrauma.ItemPrefab
---@return System.String
_G['ItemPrefab'].GetTexturePath = function(subElement, variantOf) end

---`Method Private Instance`
---@param variantOf Barotrauma.ItemPrefab
_G['ItemPrefab'].ParseConfigElement = function(variantOf) end

---`Method Public Instance`
---@param level Barotrauma.Level
---@return System.Nullable*1Barotrauma*ItemPrefab*CommonnessInfo
_G['ItemPrefab'].GetCommonnessInfo = function(level) end

---`Method Public Instance`
---@param treatmentIdentifier Barotrauma.Identifier
---@return System.Single
_G['ItemPrefab'].GetTreatmentSuitability = function(treatmentIdentifier) end

---`Method Public Instance`
---@param store Barotrauma.Location.StoreInfo
---@return Barotrauma.PriceInfo
_G['ItemPrefab'].GetPriceInfo = function(store) end

---`Method Public Instance`
---@overload fun(store:Barotrauma.Location.StoreInfo, priceInfo:Barotrauma.PriceInfo-ref):(System.Boolean)
---@param location Barotrauma.Location
---@return System.Boolean
_G['ItemPrefab'].CanBeBoughtFrom = function(location) end

---`Method Public Instance`
---@return System.Nullable*1System*Int32
_G['ItemPrefab'].GetMinPrice = function() end

---`Method Public Instance`
---@param maxCost? System.Int32
---@return (System.Collections.Immutable.ImmutableDictionary*1Barotrauma*Identifier*1Barotrauma*PriceInfo)|({[Barotrauma.Identifier]:(Barotrauma.PriceInfo)})
_G['ItemPrefab'].GetBuyPricesUnder = function(maxCost) end

---`Method Public Instance`
---@param minCost? System.Int32
---@param sellingImportant? System.Boolean
---@return (System.Collections.Immutable.ImmutableDictionary*1Barotrauma*Identifier*1Barotrauma*PriceInfo)|({[Barotrauma.Identifier]:(Barotrauma.PriceInfo)})
_G['ItemPrefab'].GetSellPricesOver = function(minCost, sellingImportant) end

---`Method Public Static`
---@param name System.String
---@param identifier Barotrauma.Identifier
---@return Barotrauma.ItemPrefab
_G['ItemPrefab'].Find = function(name, identifier) end

---`Method Public Instance`
---@overload fun(item:Barotrauma.Item, targetContainer:Barotrauma.Items.Components.ItemContainer, isPreferencesDefined:System.Boolean-ref, isSecondary:System.Boolean-ref, requireConditionRequirement?:System.Boolean, checkTransferConditions?:System.Boolean):(System.Boolean)
---@param item Barotrauma.Item
---@param identifiersOrTags (Barotrauma.Identifier-arr)|(Barotrauma.Identifier[])
---@param isPreferencesDefined System.Boolean-ref
---@param isSecondary System.Boolean-ref
---@return System.Boolean
_G['ItemPrefab'].IsContainerPreferred = function(item, identifiersOrTags, isPreferencesDefined, isSecondary) end

---`Method Public Static`
---@overload fun(preferences:(System.Collections.Generic.IEnumerable*1Barotrauma*Identifier)|(fun():(Barotrauma.Identifier)), c:Barotrauma.Items.Components.ItemContainer):(System.Boolean)
---@param preferences (System.Collections.Generic.IEnumerable*1Barotrauma*Identifier)|(fun():(Barotrauma.Identifier))
---@param ids (System.Collections.Generic.IEnumerable*1Barotrauma*Identifier)|(fun():(Barotrauma.Identifier))
---@return System.Boolean
_G['ItemPrefab'].IsContainerPreferred = function(preferences, ids) end

---`Method Private Static`
---@param item Barotrauma.Item
---@param pc Barotrauma.PreferredContainer
---@return System.Boolean
_G['ItemPrefab'].IsItemConditionAcceptable = function(item, pc) end

---`Method Private Static`
---@param item Barotrauma.Identifier
---@param pc Barotrauma.PreferredContainer
---@param targetContainer Barotrauma.Items.Components.ItemContainer
---@return System.Boolean
_G['ItemPrefab'].CanBeTransferred = function(item, pc, targetContainer) end

---`Method NonPublic Instance Virtual`
---@param rect Microsoft.Xna.Framework.Rectangle
_G['ItemPrefab'].CreateInstance = function(rect) end

---`Method Public Instance Virtual`
_G['ItemPrefab'].Dispose = function() end

---`Method Public Instance Virtual`
---@param parent Barotrauma.ItemPrefab
_G['ItemPrefab'].InheritFrom = function(parent) end

---`Method Public Instance`
---@return Barotrauma.ContentPackage
_G['ItemPrefab'].GetParentModPackageOrThisPackage = function() end

---`Method Public Instance Virtual`
---@return System.String
_G['ItemPrefab'].ToString = function() end

---`Method Public Static`
---@param itemNameOrId System.String
---@return Barotrauma.ItemPrefab
_G['ItemPrefab'].GetItemPrefab = function(itemNameOrId) end

---`Constructor Public Instance`
---@overload fun(element:Barotrauma.ContentXElement, file:Barotrauma.ItemFile):Barotrauma.ItemPrefab
---@return Barotrauma.ItemPrefab
_G['ItemPrefab'] = function() end

---`Constructor Public Instance`
---@overload fun(element:Barotrauma.ContentXElement, file:Barotrauma.ItemFile):Barotrauma.ItemPrefab
---@return Barotrauma.ItemPrefab
_G['ItemPrefab'].__new = function() end

---`Constructor Private Static`
---@overload fun(element:Barotrauma.ContentXElement, file:Barotrauma.ItemFile):Barotrauma.ItemPrefab
---@return Barotrauma.ItemPrefab
_G['ItemPrefab'] = function() end

---`Constructor Private Static`
---@overload fun(element:Barotrauma.ContentXElement, file:Barotrauma.ItemFile):Barotrauma.ItemPrefab
---@return Barotrauma.ItemPrefab
_G['ItemPrefab'].__new = function() end

