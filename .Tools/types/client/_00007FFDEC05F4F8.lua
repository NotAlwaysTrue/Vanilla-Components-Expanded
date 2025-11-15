---@meta
---@class Barotrauma.EventSet : Barotrauma.Prefab
---`Field Public Instance`
---@field IsCampaignSet System.Boolean
---`Field Public Instance`
---@field MinLevelDifficulty System.Single
---`Field Public Instance`
---@field MaxLevelDifficulty System.Single
---`Field Public Instance`
---@field BiomeIdentifier Barotrauma.Identifier
---`Field Public Instance`
---@field LevelType Barotrauma.LevelData.LevelType
---`Field Public Instance`
---@field RequiredLayer Barotrauma.Identifier
---`Field Public Instance`
---@field RequiredSpawnPointTag Barotrauma.Identifier
---`Field Public Instance`
---@field LocationTypeIdentifiers (System.Collections.Immutable.ImmutableArray*1Barotrauma*Identifier)|(Barotrauma.Identifier[])
---`Field Public Instance`
---@field Faction Barotrauma.Identifier
---`Field Public Instance`
---@field ChooseRandom System.Boolean
---`Field Private Instance`
---@field eventCount System.Int32
---`Field Public Instance`
---@field SubSetCount System.Int32
---`Field Private Instance`
---@field overrideEventCount (System.Collections.Generic.Dictionary*1Barotrauma*Identifier*1System*Int32)|({[Barotrauma.Identifier]:(System.Int32)})
---`Field Public Instance`
---@field Exhaustible System.Boolean
---`Field Public Instance`
---@field MinDistanceTraveled System.Single
---`Field Public Instance`
---@field MinMissionTime System.Single
---`Field Public Instance`
---@field MinIntensity System.Single
---`Field Public Instance`
---@field MaxIntensity System.Single
---`Field Public Instance`
---@field AllowAtStart System.Boolean
---`Field Public Instance`
---@field IgnoreCoolDown System.Boolean
---`Field Public Instance`
---@field TriggerEventCooldown System.Boolean
---`Field Public Instance`
---@field IgnoreIntensity System.Boolean
---`Field Public Instance`
---@field PerRuin System.Boolean
---`Field Public Instance`
---@field PerCave System.Boolean
---`Field Public Instance`
---@field PerWreck System.Boolean
---`Field Public Instance`
---@field DisableInHuntingGrounds System.Boolean
---`Field Public Instance`
---@field OncePerLevel System.Boolean
---`Field Public Instance`
---@field DelayWhenCrewAway System.Boolean
---`Field Public Instance`
---@field Additive System.Boolean
---`Field Public Instance`
---@field SelectAlways System.Boolean
---`Field Public Instance`
---@field DefaultCommonness System.Single
---`Field Public Instance`
---@field OverrideCommonness (System.Collections.Immutable.ImmutableDictionary*1Barotrauma*Identifier*1System*Single)|({[Barotrauma.Identifier]:(System.Single)})
---`Field Public Instance`
---@field ResetTime System.Single
---`Field Public Instance`
---@field ForceAtDiscoveredNr System.Int32
---`Field Public Instance`
---@field ForceAtVisitedNr System.Int32
---`Field Public Instance`
---@field CampaignTutorialOnly System.Boolean
---`Field Public Instance`
---@field EventPrefabs (System.Collections.Immutable.ImmutableArray*1Barotrauma*EventSet*SubEventPrefab)|(Barotrauma.EventSet.SubEventPrefab[])
---`Field Public Instance`
---@field ChildSets (System.Collections.Immutable.ImmutableArray*1Barotrauma*EventSet)|(Barotrauma.EventSet[])
---`Field Public Static`
---@field Prefabs (Barotrauma.PrefabCollection*1Barotrauma*EventSet)|(fun():(Barotrauma.EventSet))
---`Field Private Static`
---@field AllEventPrefabs (System.Collections.Generic.Dictionary*1Barotrauma*Identifier*1Barotrauma*EventPrefab)|({[Barotrauma.Identifier]:(Barotrauma.EventPrefab)})
_G['EventSet'] = {}

---`Method Public Static`
---@param identifier System.String
---@return Barotrauma.Sprite
_G['EventSet'].GetEventSprite = function(identifier) end

---`Method Public Static`
---@return (System.Collections.Generic.IEnumerable*1Barotrauma*EventPrefab)|(fun():(Barotrauma.EventPrefab))
_G['EventSet'].GetAllEventPrefabs = function() end

---`Method Public Static`
_G['EventSet'].RefreshAllEventPrefabs = function() end

---`Method Private Static`
---@param set Barotrauma.EventSet
_G['EventSet'].AddChildEventPrefabs = function(set) end

---`Method Public Static`
---@param identifier Barotrauma.Identifier
---@return Barotrauma.EventPrefab
_G['EventSet'].GetEventPrefab = function(identifier) end

---`Method Private Static`
---@param parent Barotrauma.EventSet
---@param element System.Xml.Linq.XElement
---@param file Barotrauma.RandomEventsFile
---@return Barotrauma.Identifier
_G['EventSet'].DetermineIdentifier = function(parent, element, file) end

---`Method Public Instance`
_G['EventSet'].CheckLocationTypeErrors = function() end

---`Method Public Instance`
---@param level Barotrauma.Level
---@return System.Single
_G['EventSet'].GetCommonness = function(level) end

---`Method Public Instance`
---@param level Barotrauma.Level
---@return System.Int32
_G['EventSet'].GetEventCount = function(level) end

---`Method Public Static`
---@param simulatedRoundCount? System.Int32
---@param filter? (System.Func*1Barotrauma*MonsterEvent*1System*Boolean)|(fun(arg:Barotrauma.MonsterEvent):(System.Boolean))
---@param fullLog? System.Boolean
---@return (System.Collections.Generic.List*1System*String)|(System.String[])
_G['EventSet'].GetDebugStatistics = function(simulatedRoundCount, filter, fullLog) end

---`Method Public Instance Virtual`
---@return System.String
_G['EventSet'].ToString = function() end

---`Method Public Instance Virtual`
_G['EventSet'].Dispose = function() end

---`Constructor Public Instance`
---@overload fun(element:Barotrauma.ContentXElement, file:Barotrauma.RandomEventsFile, parentSet?:Barotrauma.EventSet):Barotrauma.EventSet
---@return Barotrauma.EventSet
_G['EventSet'] = function() end

---`Constructor Public Instance`
---@overload fun(element:Barotrauma.ContentXElement, file:Barotrauma.RandomEventsFile, parentSet?:Barotrauma.EventSet):Barotrauma.EventSet
---@return Barotrauma.EventSet
_G['EventSet'].__new = function() end

---`Constructor Private Static`
---@overload fun(element:Barotrauma.ContentXElement, file:Barotrauma.RandomEventsFile, parentSet?:Barotrauma.EventSet):Barotrauma.EventSet
---@return Barotrauma.EventSet
_G['EventSet'] = function() end

---`Constructor Private Static`
---@overload fun(element:Barotrauma.ContentXElement, file:Barotrauma.RandomEventsFile, parentSet?:Barotrauma.EventSet):Barotrauma.EventSet
---@return Barotrauma.EventSet
_G['EventSet'].__new = function() end

