---@meta
---@class Barotrauma.Map : System.Object
---`Field Private Instance`
---@field mapAnimQueue (System.Collections.Generic.Queue*1Barotrauma*Map*MapAnim)|(fun():(Barotrauma.Map.MapAnim))
---`Field Public Instance`
---@field DrawOffset Microsoft.Xna.Framework.Vector2
---`Field Private Instance`
---@field drawOffsetNoise Microsoft.Xna.Framework.Vector2
---`Field Private Instance`
---@field currLocationIndicatorPos Microsoft.Xna.Framework.Vector2
---`Field Private Instance`
---@field zoom System.Single
---`Field Private Instance`
---@field targetZoom System.Single
---`Field Private Instance`
---@field borders Microsoft.Xna.Framework.Rectangle
---`Field Private Instance`
---@field mapTiles (Barotrauma.Sprite[,])|(Barotrauma.Sprite[])
---`Field Private Instance`
---@field tileDiscovered (System.Boolean[,])|(System.Boolean[])
---`Field Private Instance`
---@field connectionHighlightState System.Single
---`Field Private Instance`
---@field tooltip System.Nullable*1System*ValueTuple*2Microsoft*Xna*Framework*Rectangle*2Barotrauma*RichString
---`Field Private Instance`
---@field pendingSubInfo Barotrauma.SubmarineInfo.PendingSubInfo
---`Field Private Instance`
---@field beaconStationActiveText Barotrauma.RichString
---`Field Private Instance`
---@field beaconStationInactiveText Barotrauma.RichString
---`Field Private Instance`
---@field locationInfoOverlay Barotrauma.GUIComponent
---`Field Private Instance`
---@field editor Barotrauma.GUIComponent
---`Field Private Instance`
---@field editorEnabled System.Boolean
---`Field Private Instance`
---@field mapNotifications (System.Collections.Generic.List*1Barotrauma*Map*MapNotification)|(Barotrauma.Map.MapNotification[])
---`Field Private Instance`
---@field hudVisibility System.Single
---`Field Private Instance`
---@field cameraNoiseStrength System.Single
---`Field Public Instance`
---@field AllowDebugTeleport System.Boolean
---`Field Private Instance`
---@field generationParams Barotrauma.MapGenerationParams
---`Field Private Instance`
---@field furthestDiscoveredLocation Barotrauma.Location
---`Field Public Instance`
---@field OnLocationSelected (System.Action*1Barotrauma*Location*1Barotrauma*LocationConnection)|(fun(arg1:Barotrauma.Location, arg2:Barotrauma.LocationConnection))
---`Field Public Instance`
---@field OnMissionsSelected (System.Action*1Barotrauma*LocationConnection*1System*Collections*Generic*IEnumerable*2Barotrauma*Mission)|(fun(arg1:Barotrauma.LocationConnection, arg2:(System.Collections.Generic.IEnumerable*1Barotrauma*Mission)|(fun():(Barotrauma.Mission))))
---`Field Public Instance`
---@field OnLocationChanged Barotrauma.NamedEvent*1Barotrauma*Map*LocationChangeInfo
---`Field Private Instance`
---@field endLocations (System.Collections.Generic.List*1Barotrauma*Location)|(Barotrauma.Location[])
---`Field Private Instance`
---@field locationsDiscovered (System.Collections.Generic.List*1Barotrauma*Location)|(Barotrauma.Location[])
---`Field Private Instance`
---@field locationsVisited (System.Collections.Generic.List*1Barotrauma*Location)|(Barotrauma.Location[])
---`Field Public Instance`
---@field Radiation Barotrauma.Radiation
---`Field Private Instance`
---@field trackedLocationDiscoveryAndVisitOrder System.Boolean
---`Field Private Instance`
---@field _orderedBiomes (System.Linq.IOrderedEnumerable*1Barotrauma*Biome)|(fun():(Barotrauma.Biome))
---`Field Private Static`
---@field noiseOverlay Barotrauma.Sprite
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field HighlightedLocation Barotrauma.Location
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field Width System.Int32
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field Height System.Int32
---`Getter Public Instance`
---@field EndLocations (System.Collections.Generic.IReadOnlyList*1Barotrauma*Location)|(Barotrauma.Location[])
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field StartLocation Barotrauma.Location
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field CurrentLocation Barotrauma.Location
---`Getter Public Instance`
---@field CurrentLocationIndex System.Int32
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field SelectedLocation Barotrauma.Location
---`Getter Public Instance`
---@field SelectedLocationIndex System.Int32
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field SelectedConnection Barotrauma.LocationConnection
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field Seed System.String
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field Locations (System.Collections.Generic.List*1Barotrauma*Location)|(Barotrauma.Location[])
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field Connections (System.Collections.Generic.List*1Barotrauma*LocationConnection)|(Barotrauma.LocationConnection[])
---`Getter Public Instance`
---@field OrderedBiomes (System.Linq.IOrderedEnumerable*1Barotrauma*Biome)|(fun():(Barotrauma.Biome))
_G['Map'] = {}

---`Method Private Instance`
_G['Map'].CreateEditor = function() end

---`Method Private Instance`
---@param prevLocation Barotrauma.Location
---@param newLocation Barotrauma.Location
_G['Map'].LocationChanged = function(prevLocation, newLocation) end

---`Method Private Instance`
---@param location Barotrauma.Location
---@param removeFromAdjacentLocations? System.Boolean
_G['Map'].RemoveFogOfWar = function(location, removeFromAdjacentLocations) end

---`Method Private Instance`
---@param location Barotrauma.Location
---@return System.Boolean
_G['Map'].IsInFogOfWar = function(location) end

---`Method Public Instance`
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
---@param container Barotrauma.GUICustomComponent
_G['Map'].DrawNotifications = function(spriteBatch, container) end

---`Method Private Instance`
---@param deltaTime System.Single
---@param mapContainer Barotrauma.GUICustomComponent
_G['Map'].UpdateNotifications = function(deltaTime, mapContainer) end

---`Method Private Instance`
---@param location Barotrauma.Location
_G['Map'].CreateLocationInfoOverlay = function(location) end

---`Method Public Instance`
---@param campaign Barotrauma.CampaignMode
---@param deltaTime System.Single
---@param mapContainer Barotrauma.GUICustomComponent
_G['Map'].Update = function(campaign, deltaTime, mapContainer) end

---`Method Public Instance`
---@param campaign Barotrauma.CampaignMode
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
---@param mapContainer Barotrauma.GUICustomComponent
_G['Map'].Draw = function(campaign, spriteBatch, mapContainer) end

---`Method Public Static`
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
---@param rect Microsoft.Xna.Framework.Rectangle
---@param strength System.Single
_G['Map'].DrawNoise = function(spriteBatch, rect, strength) end

---`Method Private Static`
---@return System.Single
_G['Map'].GetPerlinNoise = function() end

---`Method Private Instance`
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
---@param connection Barotrauma.LocationConnection
---@param viewArea Microsoft.Xna.Framework.Rectangle
---@param viewOffset Microsoft.Xna.Framework.Vector2
---@param currentDisplayLocation Barotrauma.Location
---@param overrideColor? System.Nullable*1Microsoft*Xna*Framework*Color
_G['Map'].DrawConnection = function(spriteBatch, connection, viewArea, viewOffset, currentDisplayLocation, overrideColor) end

---`Method Private Instance`
---@param tooltipPos Microsoft.Xna.Framework.Vector2
---@return System.Boolean
_G['Map'].IsPreferredTooltip = function(tooltipPos) end

---`Method Private Instance`
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
---@param rect Microsoft.Xna.Framework.Rectangle
_G['Map'].DrawDecorativeHUD = function(spriteBatch, rect) end

---`Method Private Instance`
---@param anim Barotrauma.Map.MapAnim
---@param deltaTime System.Single
_G['Map'].UpdateMapAnim = function(anim, deltaTime) end

---`Method Public Instance`
_G['Map'].ResetPendingSub = function() end

---`Method Public Instance`
---@return (System.Collections.Generic.IEnumerable*1System*Int32)|(fun():(System.Int32))
_G['Map'].GetSelectedMissionIndices = function() end

---`Method Private Instance`
_G['Map'].InitProjectSpecific = function() end

---`Method Private Instance`
---@param campaign Barotrauma.CampaignMode
_G['Map'].Generate = function(campaign) end

---`Method Private Instance`
_G['Map'].GenerateAllLocationConnectionVisuals = function() end

---`Method Private Instance`
---@param connection Barotrauma.LocationConnection
_G['Map'].GenerateLocationConnectionVisuals = function(connection) end

---`Method Public Instance`
---@param xPos System.Single
---@return System.Int32
_G['Map'].GetZoneIndex = function(xPos) end

---`Method Public Instance`
---@overload fun(mapPos:Microsoft.Xna.Framework.Vector2):(Barotrauma.Biome)
---@param xPos System.Single
---@return Barotrauma.Biome
_G['Map'].GetBiome = function(xPos) end

---`Method Private Instance`
---@param rand System.Random
_G['Map'].AssignBiomes = function(rand) end

---`Method Private Instance`
---@return Barotrauma.Location
_G['Map'].GetPreviousToEndLocation = function() end

---`Method Private Instance`
---@param campaign Barotrauma.CampaignMode
---@param location Barotrauma.Location
_G['Map'].ForceLocationTypeToNone = function(campaign, location) end

---`Method Private Instance`
---@param campaign Barotrauma.CampaignMode
_G['Map'].CreateEndLocation = function(campaign) end

---`Method Private Instance`
_G['Map'].AssignEndLocationLevelData = function() end

---`Method Private Instance`
---@param seeds (System.Collections.Generic.List*1Barotrauma*LocationConnection)|(Barotrauma.LocationConnection[])
_G['Map'].ExpandBiomes = function(seeds) end

---`Method Public Instance`
_G['Map'].MoveToNextLocation = function() end

---`Method Public Instance`
---@param index System.Int32
_G['Map'].SetLocation = function(index) end

---`Method Public Instance`
---@overload fun(index:System.Int32)
---@param location Barotrauma.Location
_G['Map'].SelectLocation = function(location) end

---`Method Public Instance`
---@param missionIndices (System.Collections.Generic.IEnumerable*1System*Int32)|(fun():(System.Int32))
_G['Map'].SelectMission = function(missionIndices) end

---`Method Public Instance`
---@param preferUndiscovered System.Boolean
_G['Map'].SelectRandomLocation = function(preferUndiscovered) end

---`Method Public Instance`
---@param campaign Barotrauma.CampaignMode
---@param transitionType Barotrauma.CampaignMode.TransitionType
---@param roundDuration System.Single
_G['Map'].ProgressWorld = function(campaign, transitionType, roundDuration) end

---`Method Private Instance`
---@param campaign Barotrauma.CampaignMode
_G['Map'].ProgressWorld = function(campaign) end

---`Method Private Instance`
---@param campaign Barotrauma.CampaignMode
---@param location Barotrauma.Location
---@return System.Boolean
_G['Map'].ProgressLocationTypeChanges = function(campaign, location) end

---`Method Private Instance`
---@param campaign Barotrauma.CampaignMode
---@param location Barotrauma.Location
---@param change Barotrauma.LocationTypeChange
---@return System.Boolean
_G['Map'].ChangeLocationType = function(campaign, location, change) end

---`Method Public Static`
---@param startLocation Barotrauma.Location
---@param maxDistance System.Int32
---@param criteria (System.Func*1Barotrauma*Location*1System*Boolean)|(fun(arg:Barotrauma.Location):(System.Boolean))
---@param connectionCriteria? (System.Func*1Barotrauma*LocationConnection*1System*Boolean)|(fun(arg:Barotrauma.LocationConnection):(System.Boolean))
---@return System.Boolean
_G['Map'].LocationOrConnectionWithinDistance = function(startLocation, maxDistance, criteria, connectionCriteria) end

---`Method Public Static`
---@param startLocation Barotrauma.Location
---@param maxDistance System.Int32
---@param criteria (System.Func*1Barotrauma*Location*1System*Boolean)|(fun(arg:Barotrauma.Location):(System.Boolean))
---@param connectionCriteria? (System.Func*1Barotrauma*LocationConnection*1System*Boolean)|(fun(arg:Barotrauma.LocationConnection):(System.Boolean))
---@return System.Int32
_G['Map'].GetDistanceToClosestLocationOrConnection = function(startLocation, maxDistance, criteria, connectionCriteria) end

---`Method Private Instance`
---@param location Barotrauma.Location
---@param prevName Barotrauma.LocalizedString
---@param change Barotrauma.LocationTypeChange
_G['Map'].ChangeLocationTypeProjSpecific = function(location, prevName, change) end

---`Method Private Instance`
_G['Map'].ClearAnimQueue = function() end

---`Method Public Instance`
---@param location Barotrauma.Location
---@param checkTalents? System.Boolean
_G['Map'].Discover = function(location, checkTalents) end

---`Method Public Instance`
---@param location Barotrauma.Location
---@param resetTimeSinceVisited? System.Boolean
_G['Map'].Visit = function(location, resetTimeSinceVisited) end

---`Method Public Instance`
_G['Map'].ClearLocationHistory = function() end

---`Method Public Instance`
---@param location Barotrauma.Location
---@return System.Nullable*1System*Int32
_G['Map'].GetDiscoveryIndex = function(location) end

---`Method Public Instance`
---@param location Barotrauma.Location
---@param includeLocationsWithoutOutpost? System.Boolean
---@return System.Nullable*1System*Int32
_G['Map'].GetVisitIndex = function(location, includeLocationsWithoutOutpost) end

---`Method Public Instance`
---@param location Barotrauma.Location
---@return System.Boolean
_G['Map'].IsDiscovered = function(location) end

---`Method Public Instance`
---@param location Barotrauma.Location
---@return System.Boolean
_G['Map'].IsVisited = function(location) end

---`Method Private Instance`
---@param location Barotrauma.Location
_G['Map'].RemoveFogOfWarProjSpecific = function(location) end

---`Method Public Static`
---@param campaign Barotrauma.CampaignMode
---@param element System.Xml.Linq.XElement
---@return Barotrauma.Map
_G['Map'].Load = function(campaign, element) end

---`Method Public Instance`
---@param campaign Barotrauma.CampaignMode
---@param element System.Xml.Linq.XElement
---@param showNotifications System.Boolean
_G['Map'].LoadState = function(campaign, element, showNotifications) end

---`Method Public Instance`
---@param element System.Xml.Linq.XElement
_G['Map'].Save = function(element) end

---`Method Public Instance`
_G['Map'].Remove = function() end

---`Method Private Instance`
_G['Map'].RemoveProjSpecific = function() end

---`Constructor Public Instance`
---@overload fun(settings:Barotrauma.CampaignSettings):Barotrauma.Map
---@overload fun(campaign:Barotrauma.CampaignMode, element:System.Xml.Linq.XElement):Barotrauma.Map
---@param campaign Barotrauma.CampaignMode
---@param seed System.String
---@return Barotrauma.Map
_G['Map'] = function(campaign, seed) end

---`Constructor Public Instance`
---@overload fun(settings:Barotrauma.CampaignSettings):Barotrauma.Map
---@overload fun(campaign:Barotrauma.CampaignMode, element:System.Xml.Linq.XElement):Barotrauma.Map
---@param campaign Barotrauma.CampaignMode
---@param seed System.String
---@return Barotrauma.Map
_G['Map'].__new = function(campaign, seed) end

---`Constructor Private Instance`
---@overload fun(settings:Barotrauma.CampaignSettings):Barotrauma.Map
---@overload fun(campaign:Barotrauma.CampaignMode, element:System.Xml.Linq.XElement):Barotrauma.Map
---@param campaign Barotrauma.CampaignMode
---@param seed System.String
---@return Barotrauma.Map
_G['Map'] = function(campaign, seed) end

---`Constructor Private Instance`
---@overload fun(settings:Barotrauma.CampaignSettings):Barotrauma.Map
---@overload fun(campaign:Barotrauma.CampaignMode, element:System.Xml.Linq.XElement):Barotrauma.Map
---@param campaign Barotrauma.CampaignMode
---@param seed System.String
---@return Barotrauma.Map
_G['Map'].__new = function(campaign, seed) end

