---@meta
---@class Barotrauma.Biome : Barotrauma.PrefabWithUintIdentifier
---`Field Public Instance`
---@field OldIdentifier Barotrauma.Identifier
---`Field Public Instance`
---@field DisplayName Barotrauma.LocalizedString
---`Field Public Instance`
---@field Description Barotrauma.LocalizedString
---`Field Public Instance`
---@field IsEndBiome System.Boolean
---`Field Public Instance`
---@field EndBiomeLocationCount System.Int32
---`Field Public Instance`
---@field MinDifficulty System.Single
---`Field Private Instance`
---@field maxDifficulty System.Single
---`Field Public Instance`
---@field ExperienceFromMissionRewards System.Single
---`Field Public Instance`
---@field AllowedZones (System.Collections.Immutable.ImmutableHashSet*1System*Int32)|(System.Int32[])
---`Field Private Instance`
---@field submarineAvailability System.Nullable*1Barotrauma*Biome*SubmarineAvailability
---`Field Private Instance`
---@field submarineAvailabilityOverrides (System.Collections.Immutable.ImmutableHashSet*1Barotrauma*Biome*SubmarineAvailability)|(Barotrauma.Biome.SubmarineAvailability[])
---`Field Public Static`
---@field Prefabs (Barotrauma.PrefabCollection*1Barotrauma*Biome)|(fun():(Barotrauma.Biome))
---`Getter Public Instance`
---@field ActualMaxDifficulty System.Single
---`Getter Public Instance`
---@field AdjustedMaxDifficulty System.Single
_G['Biome'] = {}

---`Method Public Static`
---@param element Barotrauma.ContentXElement
---@return Barotrauma.Identifier
_G['Biome'].ParseIdentifier = function(element) end

---`Method Public Instance`
---@param subClass Barotrauma.SubmarineClass
---@param locationType Barotrauma.Identifier
---@return System.Int32
_G['Biome'].HighestSubmarineTierAvailable = function(subClass, locationType) end

---`Method Public Instance`
---@param info Barotrauma.SubmarineInfo
---@param locationType Barotrauma.Identifier
---@return System.Boolean
_G['Biome'].IsSubmarineAvailable = function(info, locationType) end

---`Method Public Instance Virtual`
_G['Biome'].Dispose = function() end

---`Constructor Public Instance`
---@overload fun(element:Barotrauma.ContentXElement, file:Barotrauma.LevelGenerationParametersFile):Barotrauma.Biome
---@return Barotrauma.Biome
_G['Biome'] = function() end

---`Constructor Public Instance`
---@overload fun(element:Barotrauma.ContentXElement, file:Barotrauma.LevelGenerationParametersFile):Barotrauma.Biome
---@return Barotrauma.Biome
_G['Biome'].__new = function() end

---`Constructor Private Static`
---@overload fun(element:Barotrauma.ContentXElement, file:Barotrauma.LevelGenerationParametersFile):Barotrauma.Biome
---@return Barotrauma.Biome
_G['Biome'] = function() end

---`Constructor Private Static`
---@overload fun(element:Barotrauma.ContentXElement, file:Barotrauma.LevelGenerationParametersFile):Barotrauma.Biome
---@return Barotrauma.Biome
_G['Biome'].__new = function() end

