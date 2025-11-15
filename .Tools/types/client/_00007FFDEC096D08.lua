---@meta
---@class Barotrauma.Item : Barotrauma.MapEntity
---`Field Private Instance`
---@field positionBuffer (System.Collections.Generic.List*1Barotrauma*PosInfo)|(Barotrauma.PosInfo[])
---`Field Private Instance`
---@field activeHUDs (System.Collections.Generic.List*1Barotrauma*Items*Components*ItemComponent)|(Barotrauma.Items.Components.ItemComponent[])
---`Field Private Instance`
---@field activeEditors (System.Collections.Generic.List*1Barotrauma*SerializableEntityEditor)|(Barotrauma.SerializableEntityEditor[])
---`Field Private Instance`
---@field iconStyle Barotrauma.GUIComponentStyle
---`Field Public Instance`
---@field LastImpactSoundTime System.Single
---`Field Private Instance`
---@field editingHUDRefreshTimer System.Single
---`Field Private Instance`
---@field activeContainedSprite Barotrauma.ContainedItemSprite
---`Field Private Instance`
---@field spriteAnimState (System.Collections.Generic.Dictionary*1Barotrauma*DecorativeSprite*1Barotrauma*DecorativeSprite*State)|({[Barotrauma.DecorativeSprite]:(Barotrauma.DecorativeSprite.State)})
---`Field Public Instance`
---@field DrawDepthOffset System.Single
---`Field Private Instance`
---@field fakeBroken System.Boolean
---`Field Private Instance`
---@field activeSprite Barotrauma.Sprite
---`Field Private Instance`
---@field itemInUseWarning Barotrauma.GUITextBlock
---`Field Private Instance`
---@field cachedVisibleExtents System.Nullable*1Microsoft*Xna*Framework*Rectangle
---`Field Private Instance`
---@field debugInitialHudPositions (System.Collections.Generic.List*1Microsoft*Xna*Framework*Rectangle)|(Microsoft.Xna.Framework.Rectangle[])
---`Field Private Instance`
---@field prevActiveHUDs (System.Collections.Generic.List*1Barotrauma*Items*Components*ItemComponent)|(Barotrauma.Items.Components.ItemComponent[])
---`Field Private Instance`
---@field activeComponents (System.Collections.Generic.List*1Barotrauma*Items*Components*ItemComponent)|(Barotrauma.Items.Components.ItemComponent[])
---`Field Private Instance`
---@field maxPriorityHUDs (System.Collections.Generic.List*1Barotrauma*Items*Components*ItemComponent)|(Barotrauma.Items.Components.ItemComponent[])
---`Field Private Instance`
---@field texts (System.Collections.Generic.List*1Barotrauma*ColoredText)|(Barotrauma.ColoredText[])
---`Field Private Instance`
---@field tags (System.Collections.Generic.HashSet*1Barotrauma*Identifier)|(Barotrauma.Identifier[])
---`Field Private Instance`
---@field isWire System.Boolean
---`Field Private Instance`
---@field isLogic System.Boolean
---`Field Private Instance`
---@field currentHull Barotrauma.Hull
---`Field Private Instance`
---@field campaignInteractionType Barotrauma.CampaignMode.InteractionType
---`Field Public Instance`
---@field Visible System.Boolean
---`Field Public Instance`
---@field SpriteEffects Microsoft.Xna.Framework.Graphics.SpriteEffects
---`Field Private Instance`
---@field componentsByType (System.Collections.Generic.Dictionary*1System*Type*1System*Collections*Generic*List*2Barotrauma*Items*Components*ItemComponent)|({[System.Type]:((System.Collections.Generic.List*1Barotrauma*Items*Components*ItemComponent)|(Barotrauma.Items.Components.ItemComponent[]))})
---`Field Private Instance`
---@field components (System.Collections.Generic.List*1Barotrauma*Items*Components*ItemComponent)|(Barotrauma.Items.Components.ItemComponent[])
---`Field Private Instance`
---@field updateableComponents (System.Collections.Generic.List*1Barotrauma*Items*Components*ItemComponent)|(Barotrauma.Items.Components.ItemComponent[])
---`Field Private Instance`
---@field drawableComponents (System.Collections.Generic.List*1Barotrauma*Items*Components*IDrawableComponent)|(Barotrauma.Items.Components.IDrawableComponent[])
---`Field Private Instance`
---@field hasComponentsToDraw System.Boolean
---`Field Public Instance`
---@field body Barotrauma.PhysicsBody
---`Field Private Instance`
---@field originalWaterDragCoefficient System.Single
---`Field Private Instance`
---@field overrideWaterDragCoefficient System.Nullable*1System*Single
---`Field Public Instance`
---@field StaticBodyConfig System.Xml.Linq.XElement
---`Field Public Instance`
---@field StaticFixtures (System.Collections.Generic.List*1FarseerPhysics*Dynamics*Fixture)|(FarseerPhysics.Dynamics.Fixture[])
---`Field Private Instance`
---@field transformDirty System.Boolean
---`Field Private Instance`
---@field lastSentCondition System.Single
---`Field Private Instance`
---@field sendConditionUpdateTimer System.Single
---`Field Private Instance`
---@field prevCondition System.Single
---`Field Private Instance`
---@field condition System.Single
---`Field Private Instance`
---@field inWater System.Boolean
---`Field Private Instance`
---@field hasInWaterStatusEffects System.Boolean
---`Field Private Instance`
---@field hasNotInWaterStatusEffects System.Boolean
---`Field Private Instance`
---@field parentInventory Barotrauma.Inventory
---`Field Private Instance`
---@field ownInventory Barotrauma.ItemInventory
---`Field Private Instance`
---@field defaultRect Microsoft.Xna.Framework.Rectangle
---`Field Private Instance`
---@field connections (System.Collections.Generic.Dictionary*1System*String*1Barotrauma*Items*Components*Connection)|({[System.String]:(Barotrauma.Items.Components.Connection)})
---`Field Private Instance`
---@field repairables (System.Collections.Generic.List*1Barotrauma*Items*Components*Repairable)|(Barotrauma.Items.Components.Repairable[])
---`Field Private Instance`
---@field qualityComponent Barotrauma.Items.Components.Quality
---`Field Private Instance`
---@field impactQueue (System.Collections.Concurrent.ConcurrentQueue*1System*Single)|(fun():(System.Single))
---`Field Private Instance`
---@field hasStatusEffectsOfType (System.Boolean-arr)|(System.Boolean[])
---`Field Private Instance`
---@field statusEffectLists (System.Collections.Generic.Dictionary*1Barotrauma*ActionType*1System*Collections*Generic*List*2Barotrauma*StatusEffect)|({[Barotrauma.ActionType]:((System.Collections.Generic.List*1Barotrauma*StatusEffect)|(Barotrauma.StatusEffect[]))})
---`Field Private Instance`
---@field conditionMultiplierCampaign System.Single
---`Field Public Instance`
---@field OnInteract (System.Action)|(fun())
---`Field Private Instance`
---@field hasInGameEditableProperties System.Nullable*1System*Boolean
---`Field Public Instance`
---@field Equipper Barotrauma.Character
---`Field Private Instance`
---@field rootContainer Barotrauma.Item
---`Field Private Instance`
---@field inWaterProofContainer System.Boolean
---`Field Private Instance`
---@field container Barotrauma.Item
---`Field Private Instance`
---@field description System.String
---`Field Private Instance`
---@field descriptionTag System.String
---`Field Private Instance`
---@field scale System.Single
---`Field NonPublic Instance`
---@field spriteColor Microsoft.Xna.Framework.Color
---`Field Public Instance`
---@field HighlightColor System.Nullable*1Microsoft*Xna*Framework*Color
---`Field Public Instance`
---@field OnInsertedEffectsAppliedOnPreviousRound System.Boolean
---`Field Private Instance`
---@field offsetOnSelectedMultiplier System.Single
---`Field Private Instance`
---@field healthMultiplier System.Single
---`Field Private Instance`
---@field maxRepairConditionMultiplier System.Single
---`Field Private Instance`
---@field indestructible System.Nullable*1System*Boolean
---`Field Private Instance`
---@field isDangerous System.Nullable*1System*Boolean
---`Field Public Instance`
---@field UnequipAutomatically System.Boolean
---`Field Public Instance`
---@field StolenDuringRound System.Boolean
---`Field Private Instance`
---@field spawnedInCurrentOutpost System.Boolean
---`Field Private Instance`
---@field allowStealing System.Boolean
---`Field Public Instance`
---@field IsSalvageMissionItem System.Boolean
---`Field Private Instance`
---@field originalOutpost System.String
---`Field Private Instance`
---@field waterProof System.Boolean
---`Field Private Instance`
---@field allowedSlots (System.Collections.Generic.HashSet*1Barotrauma*InvSlotType)|(Barotrauma.InvSlotType[])
---`Field Public Instance`
---@field OwnInventories (System.Collections.Immutable.ImmutableArray*1Barotrauma*ItemInventory)|(Barotrauma.ItemInventory[])
---`Field Public Instance`
---@field AvailableSwaps (System.Collections.Generic.HashSet*1Barotrauma*ItemPrefab)|(Barotrauma.ItemPrefab[])
---`Field Private Instance`
---@field allPropertyObjects (System.Collections.Generic.List*1Barotrauma*ISerializableEntity)|(Barotrauma.ISerializableEntity[])
---`Field Private Instance`
---@field statManager Barotrauma.ItemStatManager
---`Field Public Instance`
---@field OnDeselect (System.Action*1Barotrauma*Character)|(fun(obj:Barotrauma.Character))
---`Field Private Instance`
---@field targets (System.Collections.Generic.List*1Barotrauma*ISerializableEntity)|(Barotrauma.ISerializableEntity[])
---`Field Private Instance`
---@field isActive System.Boolean
---`Field Public Instance`
---@field IsInRemoveQueue System.Boolean
---`Field Private Instance`
---@field delayedSignals (System.Collections.Generic.HashSet*1System*ValueTuple*2Barotrauma*Items*Components*Signal*2Barotrauma*Items*Components*Connection)|(System.ValueTuple*1Barotrauma*Items*Components*Signal*1Barotrauma*Items*Components*Connection[])
---`Field Private Instance`
---@field droppedStack (System.Collections.Generic.List*1Barotrauma*Item)|(Barotrauma.Item[])
---`Field Private Instance`
---@field isDroppedStackOwner System.Boolean
---`Field Public Static`
---@field ShowItems System.Boolean
---`Field Public Static`
---@field ShowWires System.Boolean
---`Field Public Static`
---@field ItemList (System.Collections.Generic.List*1Barotrauma*Item)|(Barotrauma.Item[])
---`Field Private Static`
---@field _dangerousItems (System.Collections.Generic.HashSet*1Barotrauma*Item)|(Barotrauma.Item[])
---`Field Private Static`
---@field _repairableItems (System.Collections.Generic.List*1Barotrauma*Item)|(Barotrauma.Item[])
---`Field Private Static`
---@field _cleanableItems (System.Collections.Generic.List*1Barotrauma*Item)|(Barotrauma.Item[])
---`Field Private Static`
---@field _deconstructItems (System.Collections.Generic.HashSet*1Barotrauma*Item)|(Barotrauma.Item[])
---`Field Private Static`
---@field _sonarVisibleItems (System.Collections.Generic.List*1Barotrauma*Item)|(Barotrauma.Item[])
---`Field Private Static`
---@field _turretTargetItems (System.Collections.Generic.List*1Barotrauma*Item)|(Barotrauma.Item[])
---`Field Private Static`
---@field _chairItems (System.Collections.Generic.List*1Barotrauma*Item)|(Barotrauma.Item[])
---`Field Public Static`
---@field ShowLinks System.Boolean
---`Field Private Static`
---@field itemsWithPendingConditionUpdates (System.Collections.Generic.List*1Barotrauma*Item)|(Barotrauma.Item[])
---`Field Public Static`
---@field connectionPairs (System.Collections.Immutable.ImmutableArray*1System*ValueTuple*2Barotrauma*Identifier*2Barotrauma*Identifier)|(System.ValueTuple*1Barotrauma*Identifier*1Barotrauma*Identifier[])
---`Field Public Static`
---@field ImpactSoundInterval System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field IconStyle Barotrauma.GUIComponentStyle
---`Getter Public Instance`
---@field ActiveHUDs (System.Collections.Generic.IEnumerable*1Barotrauma*Items*Components*ItemComponent)|(fun():(Barotrauma.Items.Components.ItemComponent))
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field FakeBroken System.Boolean
---`Getter Public Instance Virtual`
---@field Sprite Barotrauma.Sprite
---`Getter Public Instance Virtual`
---<br/>`Setter Public Instance Virtual`
---@field Rect Microsoft.Xna.Framework.Rectangle
---`Getter Public Instance Virtual`
---@field DrawBelowWater System.Boolean
---`Getter Public Instance Virtual`
---@field DrawOverWater System.Boolean
---`Getter Private Instance`
---@field ItemInUseWarning Barotrauma.GUITextBlock
---`Getter Public Instance Virtual`
---@field SelectableInEditor System.Boolean
---`Getter Public Static`
---@field DangerousItems (System.Collections.Generic.IReadOnlyCollection*1Barotrauma*Item)|(fun():(Barotrauma.Item))
---`Getter Public Static`
---@field RepairableItems (System.Collections.Generic.IReadOnlyCollection*1Barotrauma*Item)|(fun():(Barotrauma.Item))
---`Getter Public Static`
---@field CleanableItems (System.Collections.Generic.IReadOnlyCollection*1Barotrauma*Item)|(fun():(Barotrauma.Item))
---`Getter Public Static`
---@field DeconstructItems (System.Collections.Generic.HashSet*1Barotrauma*Item)|(Barotrauma.Item[])
---`Getter Public Static`
---@field SonarVisibleItems (System.Collections.Generic.IReadOnlyCollection*1Barotrauma*Item)|(fun():(Barotrauma.Item))
---`Getter Public Static`
---@field TurretTargetItems (System.Collections.Generic.IReadOnlyCollection*1Barotrauma*Item)|(fun():(Barotrauma.Item))
---`Getter Public Static`
---@field ChairItems (System.Collections.Generic.IReadOnlyCollection*1Barotrauma*Item)|(fun():(Barotrauma.Item))
---`Getter Public Instance`
---@field Prefab Barotrauma.ItemPrefab
---`Getter Public Instance Virtual`
---@field ContentPackage Barotrauma.ContentPackage
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field CurrentHull Barotrauma.Hull
---`Getter Public Instance`
---@field HullOxygenPercentage System.Single
---`Getter Public Instance`
---@field CampaignInteractionType Barotrauma.CampaignMode.InteractionType
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field FullyInitialized System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field WaterDragCoefficient System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field BodyType FarseerPhysics.BodyType
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field DefaultRect Microsoft.Xna.Framework.Rectangle
---`Getter Public Instance Virtual`
---<br/>`Setter NonPublic Instance`
---@field SerializableProperties (System.Collections.Generic.Dictionary*1Barotrauma*Identifier*1Barotrauma*SerializableProperty)|({[Barotrauma.Identifier]:(Barotrauma.SerializableProperty)})
---`Getter Private Instance`
---@field HasInGameEditableProperties System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field EditableWhenEquipped System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field ParentInventory Barotrauma.Inventory
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field RootContainer Barotrauma.Item
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field Container Barotrauma.Item
---`Getter Public Instance Virtual`
---@field Name System.String
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Description System.String
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field DescriptionTag System.String
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field NonInteractable System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field NonPlayerTeamInteractable System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field AllowSwapping System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field PurchasedNewSwap System.Boolean
---`Getter Public Instance`
---@field IsPlayerTeamInteractable System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Rotation System.Single
---`Getter Public Instance`
---@field ImpactTolerance System.Single
---`Getter Public Instance`
---@field ImpactDamage System.Single
---`Getter Public Instance`
---@field ImpactDamageProbability System.Single
---`Getter Public Instance`
---@field InteractDistance System.Single
---`Getter Public Instance`
---@field InteractPriority System.Single
---`Getter Public Instance Virtual`
---@field Position Microsoft.Xna.Framework.Vector2
---`Getter Public Instance Virtual`
---@field SimPosition Microsoft.Xna.Framework.Vector2
---`Getter Public Instance`
---@field InteractionRect Microsoft.Xna.Framework.Rectangle
---`Getter Public Instance Virtual`
---<br/>`Setter Public Instance Virtual`
---@field Scale System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field PositionUpdateInterval System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field SpriteColor Microsoft.Xna.Framework.Color
---`Getter Public Instance`
---<br/>`Setter NonPublic Instance`
---@field InventoryIconColor Microsoft.Xna.Framework.Color
---`Getter Public Instance`
---<br/>`Setter NonPublic Instance`
---@field ContainerColor Microsoft.Xna.Framework.Color
---`Getter Public Instance`
---@field ContainerIdentifier Barotrauma.Identifier
---`Getter Public Instance`
---@field IsContained System.Boolean
---`Getter Public Instance`
---@field Speed System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field SonarLabel System.String
---`Getter Public Instance`
---@field PhysicsBodyActive System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field SoundRange System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field SightRange System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field IsShootable System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field RequireAimToUse System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field RequireAimToSecondaryUse System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field DontCleanUp System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field OnInsertedEffectsApplied System.Boolean
---`Getter Public Instance`
---@field Color Microsoft.Xna.Framework.Color
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field IsFullCondition System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field MaxCondition System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field ConditionPercentage System.Single
---`Getter Public Instance`
---@field ConditionPercentageRelativeToDefaultMaxCondition System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field OffsetOnSelectedMultiplier System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field HealthMultiplier System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field MaxRepairConditionMultiplier System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field HasBeenInstantiatedOnce System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Condition System.Single
---`Getter Private Instance`
---<br/>`Setter Private Instance`
---@field ConditionLastUpdated System.Double
---`Getter Private Instance`
---<br/>`Setter Private Instance`
---@field LastConditionChange System.Single
---`Getter Public Instance`
---@field ConditionIncreasedRecently System.Boolean
---`Getter Public Instance Virtual`
---@field Health System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Indestructible System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field AllowDeconstruct System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field IsDangerous System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field InvulnerableToDamage System.Boolean
---`Getter Public Instance`
---@field Illegitimate System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field SpawnedInCurrentOutpost System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field AllowStealing System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field OriginalOutpost System.String
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Tags System.String
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field FireProof System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field WaterProof System.Boolean
---`Getter Public Instance`
---@field UseInHealthInterface System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Quality System.Int32
---`Getter Public Instance`
---@field InWater System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field LastSentSignalRecipients (System.Collections.Generic.List*1Barotrauma*Items*Components*Connection)|(Barotrauma.Items.Components.Connection[])
---`Getter Public Instance`
---@field ConfigFilePath Barotrauma.ContentPath
---`Getter Public Instance`
---@field AllowedSlots (System.Collections.Generic.IEnumerable*1Barotrauma*InvSlotType)|(fun():(Barotrauma.InvSlotType))
---`Getter Public Instance`
---@field Connections (System.Collections.Generic.List*1Barotrauma*Items*Components*Connection)|(Barotrauma.Items.Components.Connection[])
---`Getter Public Instance`
---@field ContainedItems (System.Collections.Generic.IEnumerable*1Barotrauma*Item)|(fun():(Barotrauma.Item))
---`Getter Public Instance`
---@field OwnInventory Barotrauma.ItemInventory
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field DisplaySideBySideWhenLinked System.Boolean
---`Getter Public Instance`
---@field Repairables (System.Collections.Generic.List*1Barotrauma*Items*Components*Repairable)|(Barotrauma.Items.Components.Repairable[])
---`Getter Public Instance`
---@field Components (System.Collections.Generic.List*1Barotrauma*Items*Components*ItemComponent)|(Barotrauma.Items.Components.ItemComponent[])
---`Getter Public Instance Virtual`
---@field Linkable System.Boolean
---`Getter Public Instance`
---@field WorldPositionX System.Single
---`Getter Public Instance`
---@field WorldPositionY System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field PositionX System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field PositionY System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Infector Barotrauma.MapCreatures.Behavior.BallastFloraBranch
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field PendingItemSwap Barotrauma.ItemPrefab
---`Getter Public Instance`
---@field AllPropertyObjects (System.Collections.Generic.IReadOnlyList*1Barotrauma*ISerializableEntity)|(Barotrauma.ISerializableEntity[])
---`Getter Public Instance Virtual`
---<br/>`Setter Public Instance Virtual`
---@field OrderedToBeIgnored System.Boolean
---`Getter Public Instance`
---@field HasBallastFloraInHull System.Boolean
---`Getter Public Instance`
---@field IsClaimedByBallastFlora System.Boolean
---`Getter Public Instance`
---@field InPlayerSubmarine System.Boolean
---`Getter Public Instance`
---@field InBeaconStation System.Boolean
---`Getter Public Instance`
---@field IsLadder System.Boolean
---`Getter Public Instance`
---@field IsSecondaryItem System.Boolean
---`Getter Public Instance`
---@field StatManager Barotrauma.ItemStatManager
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field LastEatenTime System.Single
---`Getter Public Instance`
---@field DroppedStack (System.Collections.Generic.IEnumerable*1Barotrauma*Item)|(fun():(Barotrauma.Item))
_G['Item'] = {}

---`Method Public Instance Virtual`
---@return System.Single
_G['Item'].GetDrawDepth = function() end

---`Method Public Instance`
---@param defaultColor? System.Nullable*1Microsoft*Xna*Framework*Color
---@param withHighlight? System.Boolean
---@return Microsoft.Xna.Framework.Color
_G['Item'].GetSpriteColor = function(defaultColor, withHighlight) end

---`Method NonPublic Instance Virtual`
_G['Item'].CheckIsHighlighted = function() end

---`Method Public Instance`
---@return Microsoft.Xna.Framework.Color
_G['Item'].GetInventoryIconColor = function() end

---`Method Public Instance`
_G['Item'].InitSpriteStates = function() end

---`Method Public Instance`
_G['Item'].ResetCachedVisibleSize = function() end

---`Method Public Instance Virtual`
---@param worldView Microsoft.Xna.Framework.Rectangle
---@return System.Boolean
_G['Item'].IsVisible = function(worldView) end

---`Method Public Instance Virtual`
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
---@param editing System.Boolean
---@param back? System.Boolean
_G['Item'].Draw = function(spriteBatch, editing, back) end

---`Method Public Instance`
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
---@param editing System.Boolean
---@param back? System.Boolean
---@param overrideColor? System.Nullable*1Microsoft*Xna*Framework*Color
---@param overrideDepth? System.Nullable*1System*Single
_G['Item'].Draw = function(spriteBatch, editing, back, overrideColor, overrideDepth) end

---`Method Public Instance`
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
---@param drawPos Microsoft.Xna.Framework.Vector2
---@param flipX System.Boolean
---@param flipY System.Boolean
---@param rotation System.Single
---@param depth System.Single
---@param overrideColor? System.Nullable*1Microsoft*Xna*Framework*Color
_G['Item'].DrawDecorativeSprites = function(spriteBatch, drawPos, flipX, flipY, rotation, depth, overrideColor) end

---`Method Public Instance`
---@param ic Barotrauma.Items.Components.ItemComponent
_G['Item'].CheckNeedsSoundUpdate = function(ic) end

---`Method Public Instance`
---@param deltaTime System.Single
_G['Item'].UpdateSpriteStates = function(deltaTime) end

---`Method Public Instance Virtual`
---@param cam Barotrauma.Camera
---@param deltaTime System.Single
_G['Item'].UpdateEditing = function(cam, deltaTime) end

---`Method Public Instance Virtual`
---@param position Microsoft.Xna.Framework.Vector2
---@return System.Boolean
_G['Item'].IsMouseOn = function(position) end

---`Method Public Instance`
---@param inGame? System.Boolean
---@return Barotrauma.GUIComponent
_G['Item'].CreateEditingHUD = function(inGame) end

---`Method Private Instance`
---@param upgrade Barotrauma.Upgrade
---@return (System.Collections.Immutable.ImmutableArray*1Barotrauma*DecorativeSprite)|(Barotrauma.DecorativeSprite[])
_G['Item'].GetUpgradeSprites = function(upgrade) end

---`Method Public Instance Virtual`
---@param upgrade Barotrauma.Upgrade
---@param createNetworkEvent? System.Boolean
---@return System.Boolean
_G['Item'].AddUpgrade = function(upgrade, createNetworkEvent) end

---`Method Public Instance`
---@param tagTextBox Barotrauma.GUITextBox
_G['Item'].CreateContainerTagPicker = function(tagTextBox) end

---`Method Private Static`
---@param tag Barotrauma.ContainerTagPrefab
---@param location Microsoft.Xna.Framework.Point
---@param popupParent Barotrauma.GUIComponent
---@param prefabAndProbabilities (System.Collections.Immutable.ImmutableArray*1Barotrauma*ContainerTagPrefab*ItemAndProbability)|(Barotrauma.ContainerTagPrefab.ItemAndProbability[])
_G['Item'].CreateContainerTagItemListPopup = function(tag, location, popupParent, prefabAndProbabilities) end

---`Method Private Static`
---@param ip Barotrauma.ItemPrefab
---@param probability System.Single
---@return System.Boolean
_G['Item'].ShouldHideItemPrefab = function(ip, probability) end

---`Method Private Instance`
---@param ignoreLocking? System.Boolean
_G['Item'].SetHUDLayout = function(ignoreLocking) end

---`Method Public Instance`
---@param cam Barotrauma.Camera
---@param character Barotrauma.Character
---@param deltaTime System.Single
_G['Item'].UpdateHUD = function(cam, character, deltaTime) end

---`Method Public Instance`
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
---@param cam Barotrauma.Camera
---@param character Barotrauma.Character
_G['Item'].DrawHUD = function(spriteBatch, cam, character) end

---`Method Public Instance`
---@param character Barotrauma.Character
---@param recreateHudTexts? System.Boolean
---@return (System.Collections.Generic.List*1Barotrauma*ColoredText)|(Barotrauma.ColoredText[])
_G['Item'].GetHUDTexts = function(character, recreateHudTexts) end

---`Method Private Static`
---@param character Barotrauma.Character
---@param itemComponent Barotrauma.Items.Components.ItemComponent
---@return Barotrauma.Item.InteractionVisibility
_G['Item'].GetComponentInteractionVisibility = function(character, itemComponent) end

---`Method Public Instance`
---@param character Barotrauma.Character
---@return System.Boolean
_G['Item'].HasVisibleInteraction = function(character) end

---`Method Public Instance`
---@param ignoreLocking? System.Boolean
_G['Item'].ForceHUDLayoutUpdate = function(ignoreLocking) end

---`Method Public Instance Virtual`
---@param order? System.Int32
_G['Item'].AddToGUIUpdateList = function(order) end

---`Method Public Instance Virtual`
---@param msg Barotrauma.Networking.IReadMessage
---@param sendingTime System.Single
_G['Item'].ClientEventRead = function(msg, sendingTime) end

---`Method Public Instance Virtual`
---@param msg Barotrauma.Networking.IWriteMessage
---@param extraData? Barotrauma.Networking.NetEntityEvent.IData
_G['Item'].ClientEventWrite = function(msg, extraData) end

---`Method Public Instance Virtual`
---@param msg Barotrauma.Networking.IReadMessage
---@param sendingTime System.Single
_G['Item'].ClientReadPosition = function(msg, sendingTime) end

---`Method Public Instance`
---@overload fun(ic:Barotrauma.Item.T)
---@param ic Barotrauma.Item.T
---@param extraData Barotrauma.Items.Components.ItemComponent.IEventData
_G['Item'].CreateClientEvent = function(ic, extraData) end

---`Method Public Static`
---@param msg Barotrauma.Networking.IReadMessage
---@param spawn? System.Boolean
---@return Barotrauma.Item
_G['Item'].ReadSpawnData = function(msg, spawn) end

---`Method Public Instance`
_G['Item'].OnPlayerSkillsChanged = function() end

---`Method Public Instance`
---@param interactionType Barotrauma.CampaignMode.InteractionType
---@param targetClients? (System.Collections.Generic.IEnumerable*1Barotrauma*Networking*Client)|(fun():(Barotrauma.Networking.Client))
_G['Item'].AssignCampaignInteractionType = function(interactionType, targetClients) end

---`Method Private Instance`
---@param interactionType Barotrauma.CampaignMode.InteractionType
---@param targetClients (System.Collections.Generic.IEnumerable*1Barotrauma*Networking*Client)|(fun():(Barotrauma.Networking.Client))
_G['Item'].AssignCampaignInteractionTypeProjSpecific = function(interactionType, targetClients) end

---`Method Public Instance`
_G['Item'].ResetWaterDragCoefficient = function() end

---`Method Public Instance`
---@param character Barotrauma.Character
---@return System.Boolean
_G['Item'].IsInteractable = function(character) end

---`Method Public Instance Virtual`
---@return System.String
_G['Item'].ToString = function() end

---`Method Public Instance Virtual`
---@param character Barotrauma.Character
---@return System.Boolean
_G['Item'].IgnoreByAI = function(character) end

---`Method Private Instance`
_G['Item'].InitProjSpecific = function() end

---`Method Public Instance`
---@param container Barotrauma.Items.Components.ItemContainer
---@param isPreferencesDefined System.Boolean-ref
---@param isSecondary System.Boolean-ref
---@param requireConditionRestriction? System.Boolean
---@return System.Boolean
_G['Item'].IsContainerPreferred = function(container, isPreferencesDefined, isSecondary, requireConditionRestriction) end

---`Method Public Instance Virtual`
---@return Barotrauma.MapEntity
_G['Item'].Clone = function() end

---`Method Public Instance`
---@param component Barotrauma.Items.Components.ItemComponent
_G['Item'].AddComponent = function(component) end

---`Method Public Instance`
---@param drawable Barotrauma.Items.Components.IDrawableComponent
_G['Item'].EnableDrawableComponent = function(drawable) end

---`Method Public Instance`
---@param drawable Barotrauma.Items.Components.IDrawableComponent
_G['Item'].DisableDrawableComponent = function(drawable) end

---`Method Public Instance`
---@param component Barotrauma.Items.Components.ItemComponent
---@return System.Int32
_G['Item'].GetComponentIndex = function(component) end

---`Method Public Instance`
---@return Barotrauma.Item.T
_G['Item'].GetComponent = function() end

---`Method Public Instance`
---@return (System.Collections.Generic.IEnumerable*1Barotrauma*Item*T)|(fun():(Barotrauma.Item.T))
_G['Item'].GetComponents = function() end

---`Method Public Instance`
---@param statType Barotrauma.Items.Components.Quality.StatType
---@return System.Single
_G['Item'].GetQualityModifier = function(statType) end

---`Method Public Instance`
---@param contained Barotrauma.Item
_G['Item'].RemoveContained = function(contained) end

---`Method Public Instance`
---@param simPosition Microsoft.Xna.Framework.Vector2
---@param rotation System.Single
---@param findNewHull? System.Boolean
---@param setPrevTransform? System.Boolean
_G['Item'].SetTransform = function(simPosition, rotation, findNewHull, setPrevTransform) end

---`Method Public Instance`
---@param otherItem Barotrauma.Item
---@return System.Boolean
_G['Item'].AllowDroppingOnSwapWith = function(otherItem) end

---`Method Public Instance`
_G['Item'].SetActiveSprite = function() end

---`Method Private Instance`
_G['Item'].SetActiveSpriteProjSpecific = function() end

---`Method Public Instance`
_G['Item'].CheckCleanable = function() end

---`Method Public Instance Virtual`
---@param amount Microsoft.Xna.Framework.Vector2
---@param ignoreContacts? System.Boolean
_G['Item'].Move = function(amount, ignoreContacts) end

---`Method Public Instance`
---@param trigger Microsoft.Xna.Framework.Rectangle
---@param world? System.Boolean
---@return Microsoft.Xna.Framework.Rectangle
_G['Item'].TransformTrigger = function(trigger, world) end

---`Method Public Instance Virtual`
---@return Barotrauma.Quad2D
_G['Item'].GetTransformedQuad = function() end

---`Method Public Static`
_G['Item'].UpdateHulls = function() end

---`Method Public Instance`
---@return Barotrauma.Hull
_G['Item'].FindHull = function() end

---`Method Private Instance`
_G['Item'].RefreshRootContainer = function() end

---`Method Private Instance`
_G['Item'].RefreshInWaterProofContainer = function() end

---`Method Public Instance`
---@param character Barotrauma.Character
---@return System.Boolean
_G['Item'].HasAccess = function(character) end

---`Method Public Instance`
---@param entity Barotrauma.Entity
---@return System.Boolean
_G['Item'].IsOwnedBy = function(entity) end

---`Method Public Instance`
---@return Barotrauma.Entity
_G['Item'].GetRootInventoryOwner = function() end

---`Method Public Instance`
---@param predicate (System.Func*1Barotrauma*Inventory*1System*Boolean)|(fun(arg:Barotrauma.Inventory):(System.Boolean))
---@return Barotrauma.Inventory
_G['Item'].FindParentInventory = function(predicate) end

---`Method Public Instance`
_G['Item'].SetContainedItemPositions = function() end

---`Method Public Instance`
---@overload fun(tag:System.String)
---@param tag Barotrauma.Identifier
_G['Item'].AddTag = function(tag) end

---`Method Public Instance`
---@param tag Barotrauma.Identifier
_G['Item'].RemoveTag = function(tag) end

---`Method Public Instance`
---@overload fun(tag:Barotrauma.Identifier):(System.Boolean)
---@param allowedTags (System.Collections.Generic.IEnumerable*1Barotrauma*Identifier)|(fun():(Barotrauma.Identifier))
---@return System.Boolean
_G['Item'].HasTag = function(allowedTags) end

---`Method Public Instance`
---@param identifiersOrTags (System.Collections.Generic.IEnumerable*1Barotrauma*Identifier)|(fun():(Barotrauma.Identifier))
---@return System.Boolean
_G['Item'].HasIdentifierOrTags = function(identifiersOrTags) end

---`Method Public Instance`
---@overload fun(tag:System.String, newTag:System.String)
---@param tag Barotrauma.Identifier
---@param newTag Barotrauma.Identifier
_G['Item'].ReplaceTag = function(tag, newTag) end

---`Method Public Instance`
---@return (System.Collections.Generic.IReadOnlyCollection*1Barotrauma*Identifier)|(fun():(Barotrauma.Identifier))
_G['Item'].GetTags = function() end

---`Method Public Instance`
---@overload fun(conditional:Barotrauma.PropertyConditional):(System.Boolean)
---@param conditional Barotrauma.PropertyConditional
---@param checkContainer System.Boolean
---@return System.Boolean
_G['Item'].ConditionalMatches = function(conditional, checkContainer) end

---`Method Public Instance`
---@param type Barotrauma.ActionType
---@param deltaTime System.Single
---@param character? Barotrauma.Character
---@param limb? Barotrauma.Limb
---@param useTarget? Barotrauma.Entity
---@param isNetworkEvent? System.Boolean
---@param worldPosition? System.Nullable*1Microsoft*Xna*Framework*Vector2
_G['Item'].ApplyStatusEffects = function(type, deltaTime, character, limb, useTarget, isNetworkEvent, worldPosition) end

---`Method Public Instance`
---@param effect Barotrauma.StatusEffect
---@param type Barotrauma.ActionType
---@param deltaTime System.Single
---@param character? Barotrauma.Character
---@param limb? Barotrauma.Limb
---@param useTarget? Barotrauma.Entity
---@param isNetworkEvent? System.Boolean
---@param checkCondition? System.Boolean
---@param worldPosition? System.Nullable*1Microsoft*Xna*Framework*Vector2
_G['Item'].ApplyStatusEffect = function(effect, type, deltaTime, character, limb, useTarget, isNetworkEvent, checkCondition, worldPosition) end

---`Method Public Instance Virtual`
---@param attacker Barotrauma.Character
---@param worldPosition Microsoft.Xna.Framework.Vector2
---@param attack Barotrauma.Attack
---@param impulseDirection Microsoft.Xna.Framework.Vector2
---@param deltaTime System.Single
---@param playSound? System.Boolean
---@return Barotrauma.AttackResult
_G['Item'].AddDamage = function(attacker, worldPosition, attack, impulseDirection, deltaTime, playSound) end

---`Method Private Instance`
---@param value System.Single
---@param isNetworkEvent System.Boolean
---@param executeEffects? System.Boolean
_G['Item'].SetCondition = function(value, isNetworkEvent, executeEffects) end

---`Method Public Instance`
_G['Item'].RecalculateConditionValues = function() end

---`Method Private Instance`
---@return System.Boolean
_G['Item'].IsInWater = function() end

---`Method Public Instance`
_G['Item'].SendPendingNetworkUpdates = function() end

---`Method Private Instance`
_G['Item'].SendPendingNetworkUpdatesInternal = function() end

---`Method Public Instance`
---@param loadingRound System.Boolean
_G['Item'].CreateStatusEvent = function(loadingRound) end

---`Method Public Static`
---@param deltaTime System.Single
_G['Item'].UpdatePendingConditionUpdates = function(deltaTime) end

---`Method Public Instance Virtual`
---@param deltaTime System.Single
---@param cam Barotrauma.Camera
_G['Item'].Update = function(deltaTime, cam) end

---`Method Private Instance`
_G['Item'].Splash = function() end

---`Method Public Instance`
_G['Item'].UpdateTransform = function() end

---`Method Private Instance`
_G['Item'].ApplyWaterForces = function() end

---`Method Private Instance`
---@param f1 FarseerPhysics.Dynamics.Fixture
---@param f2 FarseerPhysics.Dynamics.Fixture
---@param contact FarseerPhysics.Dynamics.Contacts.Contact
---@return System.Boolean
_G['Item'].OnCollision = function(f1, f2, contact) end

---`Method Public Instance`
---@param impactStrength System.Single
---@param recursive? System.Boolean
_G['Item'].ReceiveImpact = function(impactStrength, recursive) end

---`Method Private Instance`
---@param impact System.Single
_G['Item'].OnCollisionProjSpecific = function(impact) end

---`Method Public Instance Virtual`
---@param relativeToSub System.Boolean
---@param force? System.Boolean
_G['Item'].FlipX = function(relativeToSub, force) end

---`Method Public Instance Virtual`
---@param relativeToSub System.Boolean
---@param force? System.Boolean
_G['Item'].FlipY = function(relativeToSub, force) end

---`Method Public Instance`
---@param connectionFilter? (System.Func*1Barotrauma*Items*Components*Connection*1System*Boolean)|(fun(arg:Barotrauma.Items.Components.Connection):(System.Boolean))
---@return Barotrauma.Item.T
_G['Item'].GetDirectlyConnectedComponent = function(connectionFilter) end

---`Method Public Instance`
---@param recursive? System.Boolean
---@param allowTraversingBackwards? System.Boolean
---@param connectionFilter? (System.Func*1Barotrauma*Items*Components*Connection*1System*Boolean)|(fun(arg:Barotrauma.Items.Components.Connection):(System.Boolean))
---@return (System.Collections.Generic.List*1Barotrauma*Item*T)|(Barotrauma.Item.T[])
_G['Item'].GetConnectedComponents = function(recursive, allowTraversingBackwards, connectionFilter) end

---`Method Private Instance`
---@overload fun(alreadySearched:(System.Collections.Generic.HashSet*1Barotrauma*Items*Components*Connection)|(Barotrauma.Items.Components.Connection[]), connectedComponents:(System.Collections.Generic.List*1Barotrauma*Item*T)|(Barotrauma.Item.T[]), ignoreInactiveRelays?:System.Boolean, allowTraversingBackwards?:System.Boolean)
---@param c Barotrauma.Items.Components.Connection
---@param alreadySearched (System.Collections.Generic.HashSet*1Barotrauma*Items*Components*Connection)|(Barotrauma.Items.Components.Connection[])
---@param connectedComponents (System.Collections.Generic.List*1Barotrauma*Item*T)|(Barotrauma.Item.T[])
---@param ignoreInactiveRelays System.Boolean
---@param allowTraversingBackwards? System.Boolean
_G['Item'].GetConnectedComponentsRecursive = function(c, alreadySearched, connectedComponents, ignoreInactiveRelays, allowTraversingBackwards) end

---`Method Public Instance`
---@param c Barotrauma.Items.Components.Connection
---@param ignoreInactiveRelays? System.Boolean
---@param allowTraversingBackwards? System.Boolean
---@return (System.Collections.Generic.List*1Barotrauma*Item*T)|(Barotrauma.Item.T[])
_G['Item'].GetConnectedComponentsRecursive = function(c, ignoreInactiveRelays, allowTraversingBackwards) end

---`Method Public Instance`
---@param tags? System.Nullable*1System*Collections*Immutable*ImmutableArray*2Barotrauma*Identifier
---@return Barotrauma.Items.Components.Controller
_G['Item'].FindController = function(tags) end

---`Method Public Instance`
---@param controller Barotrauma.Items.Components.Controller-ref
---@param tags? System.Nullable*1System*Collections*Immutable*ImmutableArray*2Barotrauma*Identifier
---@return System.Boolean
_G['Item'].TryFindController = function(controller, tags) end

---`Method Public Instance`
---@overload fun(signal:System.String, connectionName:System.String)
---@overload fun(signal:Barotrauma.Items.Components.Signal, connectionName:System.String)
---@param signal Barotrauma.Items.Components.Signal
---@param connection Barotrauma.Items.Components.Connection
_G['Item'].SendSignal = function(signal, connection) end

---`Method Private Instance`
---@param signal Barotrauma.Items.Components.Signal
---@param connection Barotrauma.Items.Components.Connection
---@return (System.Collections.Generic.IEnumerable*1Barotrauma*CoroutineStatus)|(fun():(Barotrauma.CoroutineStatus))
_G['Item'].DelaySignal = function(signal, connection) end

---`Method Public Instance`
---@overload fun(worldPosition:Microsoft.Xna.Framework.Vector2):(System.Boolean)
---@param worldPosition Microsoft.Xna.Framework.Vector2
---@param transformedTrigger Microsoft.Xna.Framework.Rectangle-ref
---@return System.Boolean
_G['Item'].IsInsideTrigger = function(worldPosition, transformedTrigger) end

---`Method Public Instance`
---@param c Barotrauma.Networking.Client
---@return System.Boolean
_G['Item'].CanClientAccess = function(c) end

---`Method Public Instance`
---@param user Barotrauma.Character
---@param ignoreRequiredItems? System.Boolean
---@param forceSelectKey? System.Boolean
---@param forceUseKey? System.Boolean
---@return System.Boolean
_G['Item'].TryInteract = function(user, ignoreRequiredItems, forceSelectKey, forceUseKey) end

---`Method Public Instance`
---@return System.Single
_G['Item'].GetContainedItemConditionPercentage = function() end

---`Method Public Instance`
---@param deltaTime System.Single
---@param user? Barotrauma.Character
---@param targetLimb? Barotrauma.Limb
---@param useTarget? Barotrauma.Entity
---@param userForOnUsedEvent? Barotrauma.Character
_G['Item'].Use = function(deltaTime, user, targetLimb, useTarget, userForOnUsedEvent) end

---`Method Public Instance`
---@param deltaTime System.Single
---@param character? Barotrauma.Character
_G['Item'].SecondaryUse = function(deltaTime, character) end

---`Method Public Instance`
---@param user Barotrauma.Character
---@param character Barotrauma.Character
---@param targetLimb Barotrauma.Limb
_G['Item'].ApplyTreatment = function(user, character, targetLimb) end

---`Method Public Instance`
---@param item Barotrauma.Item
---@param user Barotrauma.Character
---@return System.Boolean
_G['Item'].Combine = function(item, user) end

---`Method Public Instance`
---@param dropper Barotrauma.Character
---@param createNetworkEvent? System.Boolean
---@param setTransform? System.Boolean
_G['Item'].Drop = function(dropper, createNetworkEvent, setTransform) end

---`Method Public Instance`
---@param items (System.Collections.Generic.IEnumerable*1Barotrauma*Item)|(fun():(Barotrauma.Item))
---@param allowClientExecute System.Boolean
_G['Item'].CreateDroppedStack = function(items, allowClientExecute) end

---`Method Private Instance`
---@param allowClientExecute System.Boolean
_G['Item'].RemoveFromDroppedStack = function(allowClientExecute) end

---`Method Private Instance`
_G['Item'].SetDroppedStackItemStates = function() end

---`Method Public Instance`
---@return (System.Collections.Generic.IEnumerable*1Barotrauma*Item)|(fun():(Barotrauma.Item))
_G['Item'].GetStackedItems = function() end

---`Method Public Instance`
---@param character Barotrauma.Character
_G['Item'].Equip = function(character) end

---`Method Public Instance`
---@param character Barotrauma.Character
_G['Item'].Unequip = function(character) end

---`Method Public Instance`
---@return (System.Collections.Generic.List*1System*ValueTuple*2System*Object*2Barotrauma*SerializableProperty)|(System.ValueTuple*1System*Object*1Barotrauma*SerializableProperty[])
_G['Item'].GetProperties = function() end

---`Method Private Instance`
---@param msg Barotrauma.Networking.IWriteMessage
---@param extraData Barotrauma.Item.ChangePropertyEventData
---@param inGameEditableOnly System.Boolean
_G['Item'].WritePropertyChange = function(msg, extraData, inGameEditableOnly) end

---`Method Private Instance`
---@param ignoreConditions? System.Boolean
---@return (System.Collections.Generic.List*1System*ValueTuple*2System*Object*2Barotrauma*SerializableProperty)|(System.ValueTuple*1System*Object*1Barotrauma*SerializableProperty[])
_G['Item'].GetInGameEditableProperties = function(ignoreConditions) end

---`Method Private Instance`
---@param msg Barotrauma.Networking.IReadMessage
---@param inGameEditableOnly System.Boolean
---@param sender? Barotrauma.Networking.Client
_G['Item'].ReadPropertyChange = function(msg, inGameEditableOnly, sender) end

---`Method Private Instance`
---@param deltaTime System.Single
_G['Item'].UpdateNetPosition = function(deltaTime) end

---`Method Public Static`
---@overload fun(element:Barotrauma.ContentXElement, submarine:Barotrauma.Submarine, idRemap:Barotrauma.IdRemap):(Barotrauma.Item)
---@param element Barotrauma.ContentXElement
---@param submarine Barotrauma.Submarine
---@param createNetworkEvent System.Boolean
---@param idRemap Barotrauma.IdRemap
---@return Barotrauma.Item
_G['Item'].Load = function(element, submarine, createNetworkEvent, idRemap) end

---`Method Private Instance`
---@param replacement Barotrauma.ItemPrefab
---@param newId System.UInt16
_G['Item'].ReplaceFromNetwork = function(replacement, newId) end

---`Method Public Instance`
---@param replacement Barotrauma.ItemPrefab
_G['Item'].ReplaceWithLinkedItems = function(replacement) end

---`Method Private Instance`
---@param replacement Barotrauma.ItemPrefab
---@param newId Barotrauma.Option*1System*UInt16
---@param createEntityEvent System.Boolean
_G['Item'].Replace = function(replacement, newId, createEntityEvent) end

---`Method Public Instance`
---@param swappingTo Barotrauma.SwappableItem
---@return (System.Collections.Generic.Dictionary*1Barotrauma*Item*1Barotrauma*ItemPrefab)|({[Barotrauma.Item]:(Barotrauma.ItemPrefab)})
_G['Item'].GetConnectedItemsToSwap = function(swappingTo) end

---`Method Public Instance Virtual`
---@param parentElement System.Xml.Linq.XElement
---@return System.Xml.Linq.XElement
_G['Item'].Save = function(parentElement) end

---`Method Public Instance Virtual`
_G['Item'].Reset = function() end

---`Method Public Instance Virtual`
_G['Item'].OnMapLoaded = function() end

---`Method Public Instance Virtual`
_G['Item'].ShallowRemove = function() end

---`Method Public Instance Virtual`
_G['Item'].Remove = function() end

---`Method Private Instance`
_G['Item'].RemoveFromLists = function() end

---`Method Private Instance`
_G['Item'].RemoveProjSpecific = function() end

---`Method Public Static`
---@param prefab Barotrauma.ItemPrefab
_G['Item'].RemoveByPrefab = function(prefab) end

---`Method Public Instance`
---@param component System.String
---@return System.Object
_G['Item'].GetComponentString = function(component) end

---`Constructor Public Instance`
---@overload fun(itemPrefab:Barotrauma.ItemPrefab, position:Microsoft.Xna.Framework.Vector2, submarine:Barotrauma.Submarine, id?:System.UInt16, callOnItemLoaded?:System.Boolean):Barotrauma.Item
---@overload fun(newRect:Microsoft.Xna.Framework.Rectangle, itemPrefab:Barotrauma.ItemPrefab, submarine:Barotrauma.Submarine, callOnItemLoaded?:System.Boolean, id?:System.UInt16):Barotrauma.Item
---@return Barotrauma.Item
_G['Item'] = function() end

---`Constructor Public Instance`
---@overload fun(itemPrefab:Barotrauma.ItemPrefab, position:Microsoft.Xna.Framework.Vector2, submarine:Barotrauma.Submarine, id?:System.UInt16, callOnItemLoaded?:System.Boolean):Barotrauma.Item
---@overload fun(newRect:Microsoft.Xna.Framework.Rectangle, itemPrefab:Barotrauma.ItemPrefab, submarine:Barotrauma.Submarine, callOnItemLoaded?:System.Boolean, id?:System.UInt16):Barotrauma.Item
---@return Barotrauma.Item
_G['Item'].__new = function() end

---`Constructor Private Static`
---@overload fun(itemPrefab:Barotrauma.ItemPrefab, position:Microsoft.Xna.Framework.Vector2, submarine:Barotrauma.Submarine, id?:System.UInt16, callOnItemLoaded?:System.Boolean):Barotrauma.Item
---@overload fun(newRect:Microsoft.Xna.Framework.Rectangle, itemPrefab:Barotrauma.ItemPrefab, submarine:Barotrauma.Submarine, callOnItemLoaded?:System.Boolean, id?:System.UInt16):Barotrauma.Item
---@return Barotrauma.Item
_G['Item'] = function() end

---`Constructor Private Static`
---@overload fun(itemPrefab:Barotrauma.ItemPrefab, position:Microsoft.Xna.Framework.Vector2, submarine:Barotrauma.Submarine, id?:System.UInt16, callOnItemLoaded?:System.Boolean):Barotrauma.Item
---@overload fun(newRect:Microsoft.Xna.Framework.Rectangle, itemPrefab:Barotrauma.ItemPrefab, submarine:Barotrauma.Submarine, callOnItemLoaded?:System.Boolean, id?:System.UInt16):Barotrauma.Item
---@return Barotrauma.Item
_G['Item'].__new = function() end

