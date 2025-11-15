---@meta
---@class Barotrauma.CoOpMode : Barotrauma.MissionMode
_G['CoOpMode'] = {}

---`Constructor Public Instance`
---@overload fun(preset:Barotrauma.GameModePreset, missionPrefabs:(System.Collections.Generic.IEnumerable*1Barotrauma*MissionPrefab)|(fun():(Barotrauma.MissionPrefab))):Barotrauma.CoOpMode
---@param preset Barotrauma.GameModePreset
---@param missionTypes (System.Collections.Generic.IEnumerable*1Barotrauma*Identifier)|(fun():(Barotrauma.Identifier))
---@param seed System.String
---@return Barotrauma.CoOpMode
_G['CoOpMode'] = function(preset, missionTypes, seed) end

---`Constructor Public Instance`
---@overload fun(preset:Barotrauma.GameModePreset, missionPrefabs:(System.Collections.Generic.IEnumerable*1Barotrauma*MissionPrefab)|(fun():(Barotrauma.MissionPrefab))):Barotrauma.CoOpMode
---@param preset Barotrauma.GameModePreset
---@param missionTypes (System.Collections.Generic.IEnumerable*1Barotrauma*Identifier)|(fun():(Barotrauma.Identifier))
---@param seed System.String
---@return Barotrauma.CoOpMode
_G['CoOpMode'].__new = function(preset, missionTypes, seed) end

