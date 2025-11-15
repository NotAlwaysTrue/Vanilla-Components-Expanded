---@meta
---@class Barotrauma.LocationType : Barotrauma.PrefabWithUintIdentifier
---`Field Private Instance`
---@field rawNames (System.Collections.Immutable.ImmutableArray*1System*String)|(System.String[])
---`Field Private Instance`
---@field portraits (System.Collections.Immutable.ImmutableArray*1Barotrauma*Sprite)|(Barotrauma.Sprite[])
---`Field Private Instance`
---@field hireableJobs (System.Collections.Immutable.ImmutableArray*1System*ValueTuple*2Barotrauma*Identifier*2System*Single*2System*Boolean)|(System.ValueTuple*1Barotrauma*Identifier*1System*Single*1System*Boolean[])
---`Field Private Instance`
---@field totalHireableWeight System.Single
---`Field Public Instance`
---@field Name Barotrauma.LocalizedString
---`Field Public Instance`
---@field Description Barotrauma.LocalizedString
---`Field Public Instance`
---@field ForceLocationName Barotrauma.Identifier
---`Field Public Instance`
---@field BeaconStationChance System.Single
---`Field Public Instance`
---@field OutpostTeam Barotrauma.CharacterTeamType
---`Field Public Instance`
---@field IsAnyOutpost System.Boolean
---`Field Public Instance`
---@field CanChangeTo (System.Collections.Generic.List*1Barotrauma*LocationTypeChange)|(Barotrauma.LocationTypeChange[])
---`Field Public Instance`
---@field MissionIdentifiers (System.Collections.Immutable.ImmutableArray*1Barotrauma*Identifier)|(Barotrauma.Identifier[])
---`Field Public Instance`
---@field MissionTags (System.Collections.Immutable.ImmutableArray*1Barotrauma*Identifier)|(Barotrauma.Identifier[])
---`Field Public Instance`
---@field AreaSettings (System.Collections.Generic.List*1Barotrauma*LocationType*AreaSettingData)|(Barotrauma.LocationType.AreaSettingData[])
---`Field Public Instance`
---@field HideEntitySubcategories (System.Collections.Generic.List*1System*String)|(System.String[])
---`Field Private Instance`
---@field nameIdentifiers System.Nullable*1System*Collections*Immutable*ImmutableArray*2Barotrauma*Identifier
---`Field Private Instance`
---@field nameFormatLanguage Barotrauma.LanguageIdentifier
---`Field Private Instance`
---@field nameFormats System.Nullable*1System*Collections*Immutable*ImmutableArray*2System*String
---`Field Private Instance`
---@field forceOutpostGenerationParamsIdentifier Barotrauma.Identifier
---`Field Public Instance`
---@field BackgroundMusicLocationType Barotrauma.Identifier
---`Field Public Instance`
---@field ShowSonarMarker System.Boolean
---`Field Public Static`
---@field Prefabs (Barotrauma.PrefabCollection*1Barotrauma*LocationType)|(fun():(Barotrauma.LocationType))
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field BiomeGate Barotrauma.LocationType.BiomeGateSetting
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field ForceAsStartOutpost System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field AllowInRandomLevels System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field UsePortraitInRandomLoadingScreens System.Boolean
---`Getter Public Instance`
---@field NameFormats (System.Collections.Generic.IReadOnlyList*1System*String)|(System.String[])
---`Getter Public Instance`
---@field HasHireableCharacters System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field HasOutpost System.Boolean
---`Getter Public Instance`
---@field ReplaceInRadiation Barotrauma.Identifier
---`Getter Public Instance`
---@field DescriptionInRadiation Barotrauma.Identifier
---`Getter Public Instance`
---@field Faction Barotrauma.Identifier
---`Getter Public Instance`
---@field SecondaryFaction Barotrauma.Identifier
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field Sprite Barotrauma.Sprite
---`Getter Public Instance`
---@field RadiationSprite Barotrauma.Sprite
---`Getter Public Instance`
---@field IgnoreGenericEvents System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field EventLocationType Barotrauma.Identifier
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field UseOutpostModulesOfLocationType Barotrauma.Identifier
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field SpriteColor Microsoft.Xna.Framework.Color
---`Getter Public Instance`
---@field StoreMaxReputationModifier System.Single
---`Getter Public Instance`
---@field StoreMinReputationModifier System.Single
---`Getter Public Instance`
---@field StoreSellPriceModifier System.Single
---`Getter Public Instance`
---@field StoreBuyPriceModifier System.Single
---`Getter Public Instance`
---@field DailySpecialPriceModifier System.Single
---`Getter Public Instance`
---@field RequestGoodPriceModifier System.Single
---`Getter Public Instance`
---@field RequestGoodBuyPriceModifier System.Single
---`Getter Public Instance`
---@field StoreInitialBalance System.Int32
---`Getter Public Instance`
---@field StorePriceModifierRange System.Int32
---`Getter Public Instance`
---@field DailySpecialsCount System.Int32
---`Getter Public Instance`
---@field RequestedGoodsCount System.Int32
_G['LocationType'] = {}

---`Method Public Instance Virtual`
---@return System.String
_G['LocationType'].ToString = function() end

---`Method Public Instance`
---@return (System.Collections.Generic.IEnumerable*1Barotrauma*JobPrefab)|(fun():(Barotrauma.JobPrefab))
_G['LocationType'].GetHireablesMissingFromCrew = function() end

---`Method Public Instance`
---@return Barotrauma.JobPrefab
_G['LocationType'].GetRandomHireable = function() end

---`Method Public Instance`
---@param randomSeed System.Int32
---@return Barotrauma.Sprite
_G['LocationType'].GetPortrait = function(randomSeed) end

---`Method Public Instance`
---@param rand System.Random
---@param existingLocations (System.Collections.Generic.IEnumerable*1Barotrauma*Location)|(fun():(Barotrauma.Location))
---@return Barotrauma.Identifier
_G['LocationType'].GetRandomNameId = function(rand, existingLocations) end

---`Method Public Instance`
---@param rand System.Random
---@param existingLocations (System.Collections.Generic.IEnumerable*1Barotrauma*Location)|(fun():(Barotrauma.Location))
---@return System.String
_G['LocationType'].GetRandomRawName = function(rand, existingLocations) end

---`Method Public Static`
---@param rand System.Random
---@param zone? System.Nullable*1System*Int32
---@param biomeId? System.Nullable*1Barotrauma*Identifier
---@param requireOutpost? System.Boolean
---@param predicate? (System.Func*1Barotrauma*LocationType*1System*Boolean)|(fun(arg:Barotrauma.LocationType):(System.Boolean))
---@return Barotrauma.LocationType
_G['LocationType'].Random = function(rand, zone, biomeId, requireOutpost, predicate) end

---`Method Public Instance`
---@param zone System.Nullable*1System*Int32
---@param biomeIdentifier System.Nullable*1Barotrauma*Identifier
---@return System.Boolean
_G['LocationType'].IsValidForZoneOrBiome = function(zone, biomeIdentifier) end

---`Method Public Instance`
---@return Barotrauma.OutpostGenerationParams
_G['LocationType'].GetForcedOutpostGenerationParams = function() end

---`Method Public Instance`
---@return System.Boolean
_G['LocationType'].HasCounts = function() end

---`Method Public Instance Virtual`
_G['LocationType'].Dispose = function() end

---`Constructor Public Instance`
---@overload fun(element:Barotrauma.ContentXElement, file:Barotrauma.LocationTypesFile):Barotrauma.LocationType
---@return Barotrauma.LocationType
_G['LocationType'] = function() end

---`Constructor Public Instance`
---@overload fun(element:Barotrauma.ContentXElement, file:Barotrauma.LocationTypesFile):Barotrauma.LocationType
---@return Barotrauma.LocationType
_G['LocationType'].__new = function() end

---`Constructor Private Static`
---@overload fun(element:Barotrauma.ContentXElement, file:Barotrauma.LocationTypesFile):Barotrauma.LocationType
---@return Barotrauma.LocationType
_G['LocationType'] = function() end

---`Constructor Private Static`
---@overload fun(element:Barotrauma.ContentXElement, file:Barotrauma.LocationTypesFile):Barotrauma.LocationType
---@return Barotrauma.LocationType
_G['LocationType'].__new = function() end

