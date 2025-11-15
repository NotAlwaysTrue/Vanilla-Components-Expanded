---@meta
---@class Barotrauma.Location : System.Object
---`Field Public Instance`
---@field Connections (System.Collections.Generic.List*1Barotrauma*LocationConnection)|(Barotrauma.LocationConnection[])
---`Field Private Instance`
---@field nameFormatIndex System.Int32
---`Field Private Instance`
---@field nameIdentifier Barotrauma.Identifier
---`Field Private Instance`
---@field rawName System.String
---`Field Private Instance`
---@field addInitialMissionsForType Barotrauma.LocationType
---`Field Public Instance`
---@field WorldStepsSinceVisited System.Int32
---`Field Public Instance`
---@field ProximityTimer (System.Collections.Generic.Dictionary*1Barotrauma*LocationTypeChange*Requirement*1System*Int32)|({[Barotrauma.LocationTypeChange.Requirement]:(System.Int32)})
---`Field Public Instance`
---@field PendingLocationTypeChange System.Nullable*1System*ValueTuple*2Barotrauma*LocationTypeChange*2System*Int32*2Barotrauma*MissionPrefab
---`Field Public Instance`
---@field LocationTypeChangeCooldown System.Int32
---`Field Public Instance`
---@field DisallowLocationTypeChanges System.Boolean
---`Field Public Instance`
---@field OverrideIconColor System.Nullable*1Microsoft*Xna*Framework*Color
---`Field Private Instance`
---@field takenItems (System.Collections.Generic.List*1Barotrauma*Location*TakenItem)|(Barotrauma.Location.TakenItem[])
---`Field Private Instance`
---@field killedCharacterIdentifiers (System.Collections.Generic.HashSet*1System*Int32)|(System.Int32[])
---`Field Private Instance`
---@field availableMissions (System.Collections.Generic.List*1Barotrauma*Mission)|(Barotrauma.Mission[])
---`Field Private Instance`
---@field selectedMissions (System.Collections.Generic.List*1Barotrauma*Mission)|(Barotrauma.Mission[])
---`Field Private Instance`
---@field priceMultiplier System.Single
---`Field Private Instance`
---@field mechanicalpriceMultiplier System.Single
---`Field Public Instance`
---@field LastTypeChangeMessage System.String
---`Field Public Instance`
---@field TimeSinceLastTypeChange System.Int32
---`Field Public Instance`
---@field IsGateBetweenBiomes System.Boolean
---`Field Private Instance`
---@field loadedMissions (System.Collections.Generic.List*1Barotrauma*Location*LoadedMission)|(Barotrauma.Location.LoadedMission[])
---`Field Public Instance`
---@field HireManager Barotrauma.HireManager
---`Field Public Static`
---@field ClearStoresDelay System.Int32
---`Field Private Static`
---@field SpecialsUpdateInterval System.Int32
---`Field Private Static`
---@field MechanicalMaxDiscountPercentage System.Single
---`Field Private Static`
---@field HealMaxDiscountPercentage System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field DisplayName Barotrauma.LocalizedString
---`Getter Public Instance`
---@field NameIdentifier Barotrauma.Identifier
---`Getter Public Instance`
---@field NameFormatIndex System.Int32
---`Getter Public Instance`
---@field Discovered System.Boolean
---`Getter Public Instance`
---@field Visited System.Boolean
---`Getter Public Instance`
---@field LocationTypeChangesBlocked System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Biome Barotrauma.Biome
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field MapPosition Microsoft.Xna.Framework.Vector2
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field Type Barotrauma.LocationType
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field OriginalType Barotrauma.LocationType
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field LevelData Barotrauma.LevelData
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field PortraitId System.Int32
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Faction Barotrauma.Faction
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field SecondaryFaction Barotrauma.Faction
---`Getter Public Instance`
---@field Reputation Barotrauma.Reputation
---`Getter Public Instance`
---@field IsFactionHostile System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field TurnsInRadiation System.Int32
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field Stores (System.Collections.Generic.Dictionary*1Barotrauma*Identifier*1Barotrauma*Location*StoreInfo)|({[Barotrauma.Identifier]:(Barotrauma.Location.StoreInfo)})
---`Getter Private Instance`
---@field StoreMaxReputationModifier System.Single
---`Getter Private Instance`
---@field StoreMinReputationModifier System.Single
---`Getter Private Instance`
---@field StoreSellPriceModifier System.Single
---`Getter Private Instance`
---@field StoreBuyPriceModifier System.Single
---`Getter Private Instance`
---@field DailySpecialPriceModifier System.Single
---`Getter Private Instance`
---@field RequestGoodBuyPriceModifier System.Single
---`Getter Private Instance`
---@field RequestGoodSellPriceModifier System.Single
---`Getter Public Instance`
---@field StoreInitialBalance System.Int32
---`Getter Private Instance`
---@field StorePriceModifierRange System.Int32
---`Getter Public Instance`
---@field DailySpecialsCount System.Int32
---`Getter Public Instance`
---@field RequestedGoodsCount System.Int32
---`Getter Private Instance`
---<br/>`Setter Private Instance`
---@field StepsSinceSpecialsUpdated System.Int32
---`Getter Public Instance`
---@field StoreIdentifiers (System.Collections.Generic.HashSet*1Barotrauma*Identifier)|(Barotrauma.Identifier[])
---`Getter Public Instance`
---@field TakenItems (System.Collections.Generic.IEnumerable*1Barotrauma*Location*TakenItem)|(fun():(Barotrauma.Location.TakenItem))
---`Getter Public Instance`
---@field KilledCharacterIdentifiers (System.Collections.Generic.IEnumerable*1System*Int32)|(fun():(System.Int32))
---`Getter Public Instance`
---@field AvailableMissions (System.Collections.Generic.IEnumerable*1Barotrauma*Mission)|(fun():(Barotrauma.Mission))
---`Getter Public Instance`
---@field AvailableAndVisibleMissions (System.Collections.Generic.IEnumerable*1Barotrauma*Mission)|(fun():(Barotrauma.Mission))
---`Getter Public Instance`
---@field SelectedMissions (System.Collections.Generic.IEnumerable*1Barotrauma*Mission)|(fun():(Barotrauma.Mission))
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field PriceMultiplier System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field MechanicalPriceMultiplier System.Single
_G['Location'] = {}

---`Method Public Instance`
---@param mission Barotrauma.Mission
_G['Location'].SelectMission = function(mission) end

---`Method Public Instance`
---@param mission Barotrauma.Mission
_G['Location'].DeselectMission = function(mission) end

---`Method Public Instance`
---@return (System.Collections.Generic.List*1System*Int32)|(System.Int32[])
_G['Location'].GetSelectedMissionIndices = function() end

---`Method Public Instance`
---@param missionIndices (System.Collections.Generic.IEnumerable*1System*Int32)|(fun():(System.Int32))
_G['Location'].SetSelectedMissionIndices = function(missionIndices) end

---`Method Public Instance Virtual`
---@return System.String
_G['Location'].ToString = function() end

---`Method Public Instance`
---@param element System.Xml.Linq.XElement
---@param campaign Barotrauma.CampaignMode
_G['Location'].LoadChangingProperties = function(element, campaign) end

---`Method Public Instance`
---@param locationElement System.Xml.Linq.XElement
_G['Location'].LoadLocationTypeChange = function(locationElement) end

---`Method Public Instance`
---@param locationElement System.Xml.Linq.XElement
_G['Location'].LoadMissions = function(locationElement) end

---`Method Public Static`
---@param position Microsoft.Xna.Framework.Vector2
---@param zone System.Nullable*1System*Int32
---@param biomeId System.Nullable*1Barotrauma*Identifier
---@param rand System.Random
---@param requireOutpost System.Boolean
---@param forceLocationType? Barotrauma.LocationType
---@param existingLocations? (System.Collections.Generic.IEnumerable*1Barotrauma*Location)|(fun():(Barotrauma.Location))
---@return Barotrauma.Location
_G['Location'].CreateRandom = function(position, zone, biomeId, rand, requireOutpost, forceLocationType, existingLocations) end

---`Method Public Instance`
---@param campaign Barotrauma.CampaignMode
---@param newType Barotrauma.LocationType
---@param createStores? System.Boolean
---@param unlockInitialMissions? System.Boolean
_G['Location'].ChangeType = function(campaign, newType, createStores, unlockInitialMissions) end

---`Method Public Instance`
---@param campaign Barotrauma.CampaignMode
_G['Location'].TryAssignFactionBasedOnLocationType = function(campaign) end

---`Method Public Instance`
---@param randSync? Barotrauma.Rand.RandSync
_G['Location'].UnlockInitialMissions = function(randSync) end

---`Method Public Instance`
---@overload fun(missionPrefab:Barotrauma.MissionPrefab, connection:Barotrauma.LocationConnection)
---@param missionPrefab Barotrauma.MissionPrefab
_G['Location'].UnlockMission = function(missionPrefab) end

---`Method Public Instance`
---@param identifier Barotrauma.Identifier
---@param invokingContentPackage? Barotrauma.ContentPackage
---@return Barotrauma.Mission
_G['Location'].UnlockMissionByIdentifier = function(identifier, invokingContentPackage) end

---`Method Public Instance`
---@param tag Barotrauma.Identifier
---@param random? System.Random
---@param invokingContentPackage? Barotrauma.ContentPackage
---@return Barotrauma.Mission
_G['Location'].UnlockMissionByTag = function(tag, random, invokingContentPackage) end

---`Method Private Instance`
---@param mission Barotrauma.Mission
_G['Location'].AddMission = function(mission) end

---`Method Private Instance`
---@overload fun(prefab:Barotrauma.MissionPrefab, connection:Barotrauma.LocationConnection-ref):(Barotrauma.Mission)
---@overload fun(prefab:Barotrauma.MissionPrefab, connection:Barotrauma.LocationConnection):(Barotrauma.Mission)
---@param prefab Barotrauma.MissionPrefab
---@return Barotrauma.Mission
_G['Location'].InstantiateMission = function(prefab) end

---`Method Public Instance`
---@param map Barotrauma.Map
_G['Location'].InstantiateLoadedMissions = function(map) end

---`Method Public Instance`
_G['Location'].ClearMissions = function() end

---`Method Public Instance`
---@return System.Boolean
_G['Location'].HasOutpost = function() end

---`Method Public Instance`
---@return System.Boolean
_G['Location'].IsCriticallyRadiated = function() end

---`Method Public Instance`
---@overload fun(overrideDescriptionIdentifier:Barotrauma.Identifier-ref):(Barotrauma.LocationType)
---@return Barotrauma.LocationType
_G['Location'].GetLocationTypeToDisplay = function() end

---`Method Public Instance`
---@param connection Barotrauma.LocationConnection
---@return (System.Collections.Generic.IEnumerable*1Barotrauma*Mission)|(fun():(Barotrauma.Mission))
_G['Location'].GetMissionsInConnection = function(connection) end

---`Method Public Instance`
---@param character Barotrauma.CharacterInfo
_G['Location'].RemoveHireableCharacter = function(character) end

---`Method Public Instance`
---@return (System.Collections.Generic.IEnumerable*1Barotrauma*CharacterInfo)|(fun():(Barotrauma.CharacterInfo))
_G['Location'].GetHireableCharacters = function() end

---`Method Public Instance`
---@param hireableCharacters (System.Collections.Generic.IEnumerable*1Barotrauma*CharacterInfo)|(fun():(Barotrauma.CharacterInfo))
_G['Location'].ForceHireableCharacters = function(hireableCharacters) end

---`Method Private Instance`
---@param type Barotrauma.LocationType
---@param rand System.Random
---@param existingLocations (System.Collections.Generic.IEnumerable*1Barotrauma*Location)|(fun():(Barotrauma.Location))
_G['Location'].CreateRandomName = function(type, rand, existingLocations) end

---`Method Public Static`
---@overload fun(locationTypeIdentifier:Barotrauma.Identifier, nameFormatIndex:System.Int32, nameId:Barotrauma.Identifier):(Barotrauma.LocalizedString)
---@param type Barotrauma.LocationType
---@param nameFormatIndex System.Int32
---@param nameId Barotrauma.Identifier
---@return Barotrauma.LocalizedString
_G['Location'].GetName = function(type, nameFormatIndex, nameId) end

---`Method Public Instance`
---@param nameId Barotrauma.Identifier
_G['Location'].ForceName = function(nameId) end

---`Method Public Instance`
---@param locationElement System.Xml.Linq.XElement
_G['Location'].LoadStores = function(locationElement) end

---`Method Public Instance`
---@return System.Boolean
_G['Location'].IsRadiated = function() end

---`Method Public Instance`
---@param items (System.Collections.Generic.IEnumerable*1Barotrauma*Item)|(fun():(Barotrauma.Item))
_G['Location'].RegisterTakenItems = function(items) end

---`Method Public Instance`
---@param characters (System.Collections.Generic.IEnumerable*1Barotrauma*Character)|(fun():(Barotrauma.Character))
_G['Location'].RegisterKilledCharacters = function(characters) end

---`Method Public Instance`
_G['Location'].RemoveTakenItems = function() end

---`Method Public Instance`
---@param cost System.Int32
---@return System.Int32
_G['Location'].GetAdjustedMechanicalCost = function(cost) end

---`Method Public Instance`
---@param cost System.Int32
---@return System.Int32
_G['Location'].GetAdjustedHealCost = function(cost) end

---`Method Public Instance`
---@param identifier Barotrauma.Identifier
---@return Barotrauma.Location.StoreInfo
_G['Location'].GetStore = function(identifier) end

---`Method Public Instance`
---@param force? System.Boolean
_G['Location'].CreateStores = function(force) end

---`Method Public Instance`
---@param createStoresIfNotCreated? System.Boolean
_G['Location'].UpdateStores = function(createStoresIfNotCreated) end

---`Method Public Instance`
_G['Location'].UpdateSpecials = function() end

---`Method Private Instance`
_G['Location'].UpdateStoreIdentifiers = function() end

---`Method Private Instance`
---@param identifier Barotrauma.Identifier
_G['Location'].AddNewStore = function(identifier) end

---`Method Public Instance`
---@param items (System.Collections.Generic.Dictionary*1Barotrauma*Identifier*1System*Collections*Generic*List*2Barotrauma*SoldItem)|({[Barotrauma.Identifier]:((System.Collections.Generic.List*1Barotrauma*SoldItem)|(Barotrauma.SoldItem[]))})
_G['Location'].AddStock = function(items) end

---`Method Public Instance`
_G['Location'].ClearStores = function() end

---`Method Public Instance`
---@param items (System.Collections.Generic.Dictionary*1Barotrauma*Identifier*1System*Collections*Generic*List*2Barotrauma*PurchasedItem)|({[Barotrauma.Identifier]:((System.Collections.Generic.List*1Barotrauma*PurchasedItem)|(Barotrauma.PurchasedItem[]))})
_G['Location'].RemoveStock = function(items) end

---`Method Public Static`
---@return System.Int32
_G['Location'].GetExtraSpecialSalesCount = function() end

---`Method Public Instance`
---@return System.Boolean
_G['Location'].CanHaveSubsForSale = function() end

---`Method Public Instance`
---@param submarineClass? Barotrauma.SubmarineClass
---@return System.Int32
_G['Location'].HighestSubmarineTierAvailable = function(submarineClass) end

---`Method Public Instance`
---@param info Barotrauma.SubmarineInfo
---@return System.Boolean
_G['Location'].IsSubmarineAvailable = function(info) end

---`Method Private Instance`
---@param interactionType Barotrauma.CampaignMode.InteractionType
---@return System.Boolean
_G['Location'].CanHaveCampaignInteraction = function(interactionType) end

---`Method Public Instance`
---@param campaign Barotrauma.CampaignMode
_G['Location'].Reset = function(campaign) end

---`Method Public Instance`
---@param map Barotrauma.Map
---@param parentElement System.Xml.Linq.XElement
---@return System.Xml.Linq.XElement
_G['Location'].Save = function(map, parentElement) end

---`Method Public Instance`
_G['Location'].Remove = function() end

---`Method Public Instance`
_G['Location'].RemoveProjSpecific = function() end

---`Constructor Public Instance`
---@overload fun(mapPosition:Microsoft.Xna.Framework.Vector2, zone:System.Nullable*1System*Int32, biomeId:System.Nullable*1Barotrauma*Identifier, rand:System.Random, requireOutpost?:System.Boolean, forceLocationType?:Barotrauma.LocationType, existingLocations?:(System.Collections.Generic.IEnumerable*1Barotrauma*Location)|(fun():(Barotrauma.Location))):Barotrauma.Location
---@param campaign Barotrauma.CampaignMode
---@param element System.Xml.Linq.XElement
---@return Barotrauma.Location
_G['Location'] = function(campaign, element) end

---`Constructor Public Instance`
---@overload fun(mapPosition:Microsoft.Xna.Framework.Vector2, zone:System.Nullable*1System*Int32, biomeId:System.Nullable*1Barotrauma*Identifier, rand:System.Random, requireOutpost?:System.Boolean, forceLocationType?:Barotrauma.LocationType, existingLocations?:(System.Collections.Generic.IEnumerable*1Barotrauma*Location)|(fun():(Barotrauma.Location))):Barotrauma.Location
---@param campaign Barotrauma.CampaignMode
---@param element System.Xml.Linq.XElement
---@return Barotrauma.Location
_G['Location'].__new = function(campaign, element) end

