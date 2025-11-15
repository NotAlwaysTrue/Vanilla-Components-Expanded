---@meta
---@class Barotrauma.LevelData : System.Object
---`Field Public Instance`
---@field Type Barotrauma.LevelData.LevelType
---`Field Public Instance`
---@field Seed System.String
---`Field Public Instance`
---@field Difficulty System.Single
---`Field Public Instance`
---@field Biome Barotrauma.Biome
---`Field Public Instance`
---@field HasBeaconStation System.Boolean
---`Field Public Instance`
---@field IsBeaconActive System.Boolean
---`Field Public Instance`
---@field HasHuntingGrounds System.Boolean
---`Field Public Instance`
---@field OriginallyHadHuntingGrounds System.Boolean
---`Field Public Instance`
---@field ForceOutpostGenerationParams Barotrauma.OutpostGenerationParams
---`Field Public Instance`
---@field ForceBeaconStation Barotrauma.SubmarineInfo
---`Field Public Instance`
---@field ForceWreck Barotrauma.SubmarineInfo
---`Field Public Instance`
---@field ForceRuinGenerationParams Barotrauma.RuinGeneration.RuinGenerationParams
---`Field Public Instance`
---@field AllowInvalidOutpost System.Boolean
---`Field Public Instance`
---@field Size Microsoft.Xna.Framework.Point
---`Field Public Instance`
---@field InitialDepth System.Int32
---`Field Public Instance`
---@field MinMainPathWidth System.Nullable*1System*Int32
---`Field Public Instance`
---@field EventHistory (System.Collections.Generic.List*1Barotrauma*Identifier)|(Barotrauma.Identifier[])
---`Field Public Instance`
---@field NonRepeatableEvents (System.Collections.Generic.List*1Barotrauma*Identifier)|(Barotrauma.Identifier[])
---`Field Public Instance`
---@field FinishedEvents (System.Collections.Generic.Dictionary*1Barotrauma*EventSet*1System*Int32)|({[Barotrauma.EventSet]:(System.Int32)})
---`Field Private Instance`
---@field allEventsExhausted System.Boolean
---`Field Private Instance`
---@field exhaustedEventSets (System.Collections.Generic.HashSet*1Barotrauma*Identifier)|(Barotrauma.Identifier[])
---`Field Public Static`
---@field ConsoleForceWreck Barotrauma.SubmarineInfo
---`Field Public Static`
---@field ConsoleForceBeaconStation Barotrauma.SubmarineInfo
---`Field Public Static`
---@field ForceThalamus Barotrauma.LevelData.ThalamusSpawn
---`Field Public Static`
---@field HuntingGroundsDifficultyThreshold System.Single
---`Field Public Static`
---@field MaxHuntingGroundsProbability System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field GenerationParams Barotrauma.LevelGenerationParams
---`Getter Public Instance`
---@field CrushDepth System.Single
---`Getter Public Instance`
---@field RealWorldCrushDepth System.Single
---`Getter Public Instance`
---@field OutpostGenerationParamsExist System.Boolean
_G['LevelData'] = {}

---`Method Public Instance`
---@param minDifficulty System.Single
---@param maxDifficulty System.Single
---@return System.Boolean
_G['LevelData'].IsAllowedDifficulty = function(minDifficulty, maxDifficulty) end

---`Method Public Static`
---@param seed? System.String
---@param difficulty? System.Nullable*1System*Single
---@param generationParams? Barotrauma.LevelGenerationParams
---@param biomeId? Barotrauma.Identifier
---@param requireOutpost? System.Boolean
---@param pvpOnly? System.Boolean
---@return Barotrauma.LevelData
_G['LevelData'].CreateRandom = function(seed, difficulty, generationParams, biomeId, requireOutpost, pvpOnly) end

---`Method Public Instance`
---@param eventSet Barotrauma.EventSet
_G['LevelData'].ExhaustEventSet = function(eventSet) end

---`Method Public Instance`
---@param eventSet Barotrauma.EventSet
---@return System.Boolean
_G['LevelData'].IsEventSetExhausted = function(eventSet) end

---`Method Public Instance`
_G['LevelData'].ResetExhaustedEventSets = function() end

---`Method Public Instance`
---@param seed System.String
_G['LevelData'].ReassignGenerationParams = function(seed) end

---`Method Public Static`
---@param location Barotrauma.Location
---@param levelData Barotrauma.LevelData
---@return (System.Collections.Generic.IEnumerable*1Barotrauma*OutpostGenerationParams)|(fun():(Barotrauma.OutpostGenerationParams))
_G['LevelData'].GetSuitableOutpostGenerationParams = function(location, levelData) end

---`Method Public Instance`
---@param parentElement System.Xml.Linq.XElement
_G['LevelData'].Save = function(parentElement) end

---`Constructor Public Instance`
---@overload fun(seed:System.String, difficulty:System.Single, sizeFactor:System.Single, generationParams:Barotrauma.LevelGenerationParams, biome:Barotrauma.Biome):Barotrauma.LevelData
---@overload fun(element:System.Xml.Linq.XElement, forceDifficulty?:System.Nullable*1System*Single, clampDifficultyToBiome?:System.Boolean):Barotrauma.LevelData
---@overload fun(locationConnection:Barotrauma.LocationConnection):Barotrauma.LevelData
---@param location Barotrauma.Location
---@param map Barotrauma.Map
---@param difficulty System.Single
---@return Barotrauma.LevelData
_G['LevelData'] = function(location, map, difficulty) end

---`Constructor Public Instance`
---@overload fun(seed:System.String, difficulty:System.Single, sizeFactor:System.Single, generationParams:Barotrauma.LevelGenerationParams, biome:Barotrauma.Biome):Barotrauma.LevelData
---@overload fun(element:System.Xml.Linq.XElement, forceDifficulty?:System.Nullable*1System*Single, clampDifficultyToBiome?:System.Boolean):Barotrauma.LevelData
---@overload fun(locationConnection:Barotrauma.LocationConnection):Barotrauma.LevelData
---@param location Barotrauma.Location
---@param map Barotrauma.Map
---@param difficulty System.Single
---@return Barotrauma.LevelData
_G['LevelData'].__new = function(location, map, difficulty) end

