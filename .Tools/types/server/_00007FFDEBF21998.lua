---@meta
---@class Barotrauma.CreatureMetrics : System.Object
---`Field Private Static`
---@field vanillaCharacters (System.Collections.Generic.IEnumerable*1Barotrauma*CharacterFile)|(fun():(Barotrauma.CharacterFile))
---`Field Private Static`
---@field path System.String
---`Getter Public Static`
---<br/>`Setter Private Static`
---@field RecentlyEncountered (System.Collections.Generic.HashSet*1Barotrauma*Identifier)|(Barotrauma.Identifier[])
---`Getter Public Static`
---<br/>`Setter Private Static`
---@field Encountered (System.Collections.Generic.HashSet*1Barotrauma*Identifier)|(Barotrauma.Identifier[])
---`Getter Public Static`
---<br/>`Setter Private Static`
---@field Unlocked (System.Collections.Generic.HashSet*1Barotrauma*Identifier)|(Barotrauma.Identifier[])
---`Getter Public Static`
---<br/>`Setter Private Static`
---@field Killed (System.Collections.Generic.HashSet*1Barotrauma*Identifier)|(Barotrauma.Identifier[])
---`Getter Public Static`
---<br/>`Setter Private Static`
---@field IsInitialized System.Boolean
---`Getter Public Static`
---<br/>`Setter Public Static`
---@field UnlockAll System.Boolean
_G['CreatureMetrics'] = {}

---`Method Public Static`
_G['CreatureMetrics'].Init = function() end

---`Method Private Static`
_G['CreatureMetrics'].Load = function() end

---`Method Public Static`
_G['CreatureMetrics'].Save = function() end

---`Method Public Static`
---@param species Barotrauma.Identifier
_G['CreatureMetrics'].RecordKill = function(species) end

---`Method Public Static`
---@param species Barotrauma.Identifier
_G['CreatureMetrics'].AddEncounter = function(species) end

---`Method Public Static`
---@param species Barotrauma.Identifier
_G['CreatureMetrics'].UnlockInEditor = function(species) end

---`Method Private Static`
_G['CreatureMetrics'].SyncSets = function() end

---`Constructor Private Static`
---@return Barotrauma.CreatureMetrics
_G['CreatureMetrics'] = function() end

---`Constructor Private Static`
---@return Barotrauma.CreatureMetrics
_G['CreatureMetrics'].__new = function() end

