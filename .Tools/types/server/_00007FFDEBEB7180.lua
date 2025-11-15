---@meta
---@class Barotrauma.PvPMode : Barotrauma.MissionMode
_G['PvPMode'] = {}

---`Constructor Public Instance`
---@overload fun(preset:Barotrauma.GameModePreset, missionPrefabs:(System.Collections.Generic.IEnumerable*1Barotrauma*MissionPrefab)|(fun():(Barotrauma.MissionPrefab))):Barotrauma.PvPMode
---@param preset Barotrauma.GameModePreset
---@param missionTypes (System.Collections.Generic.IEnumerable*1Barotrauma*Identifier)|(fun():(Barotrauma.Identifier))
---@param seed System.String
---@return Barotrauma.PvPMode
_G['PvPMode'] = function(preset, missionTypes, seed) end

---`Constructor Public Instance`
---@overload fun(preset:Barotrauma.GameModePreset, missionPrefabs:(System.Collections.Generic.IEnumerable*1Barotrauma*MissionPrefab)|(fun():(Barotrauma.MissionPrefab))):Barotrauma.PvPMode
---@param preset Barotrauma.GameModePreset
---@param missionTypes (System.Collections.Generic.IEnumerable*1Barotrauma*Identifier)|(fun():(Barotrauma.Identifier))
---@param seed System.String
---@return Barotrauma.PvPMode
_G['PvPMode'].__new = function(preset, missionTypes, seed) end

