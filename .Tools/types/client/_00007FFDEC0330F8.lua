---@meta
---@class Barotrauma.MissionMode : Barotrauma.GameMode
---`Field Private Instance`
---@field missions (System.Collections.Generic.List*1Barotrauma*Mission)|(Barotrauma.Mission[])
---`Getter Public Instance Virtual`
---@field Missions (System.Collections.Generic.IEnumerable*1Barotrauma*Mission)|(fun():(Barotrauma.Mission))
_G['MissionMode'] = {}

---`Method Public Instance Virtual`
_G['MissionMode'].ShowStartMessage = function() end

---`Method NonPublic Static`
---@param missionPrefabs (System.Collections.Generic.IEnumerable*1Barotrauma*MissionPrefab)|(fun():(Barotrauma.MissionPrefab))
---@param missionClasses (System.Collections.Generic.Dictionary*1Barotrauma*Identifier*1System*Type)|({[Barotrauma.Identifier]:(System.Type)})
---@return (System.Collections.Generic.IEnumerable*1Barotrauma*MissionPrefab)|(fun():(Barotrauma.MissionPrefab))
_G['MissionMode'].ValidateMissionPrefabs = function(missionPrefabs, missionClasses) end

---`Method Public Static`
---@param missionTypes (System.Collections.Generic.IEnumerable*1Barotrauma*Identifier)|(fun():(Barotrauma.Identifier))
---@param missionClasses (System.Collections.Generic.Dictionary*1Barotrauma*Identifier*1System*Type)|({[Barotrauma.Identifier]:(System.Type)})
---@return (System.Collections.Generic.IEnumerable*1Barotrauma*Identifier)|(fun():(Barotrauma.Identifier))
_G['MissionMode'].ValidateMissionTypes = function(missionTypes, missionClasses) end

---`Constructor Public Instance`
---@overload fun(preset:Barotrauma.GameModePreset, missionPrefabs:(System.Collections.Generic.IEnumerable*1Barotrauma*MissionPrefab)|(fun():(Barotrauma.MissionPrefab))):Barotrauma.MissionMode
---@param preset Barotrauma.GameModePreset
---@param missionTypes (System.Collections.Generic.IEnumerable*1Barotrauma*Identifier)|(fun():(Barotrauma.Identifier))
---@param seed System.String
---@return Barotrauma.MissionMode
_G['MissionMode'] = function(preset, missionTypes, seed) end

---`Constructor Public Instance`
---@overload fun(preset:Barotrauma.GameModePreset, missionPrefabs:(System.Collections.Generic.IEnumerable*1Barotrauma*MissionPrefab)|(fun():(Barotrauma.MissionPrefab))):Barotrauma.MissionMode
---@param preset Barotrauma.GameModePreset
---@param missionTypes (System.Collections.Generic.IEnumerable*1Barotrauma*Identifier)|(fun():(Barotrauma.Identifier))
---@param seed System.String
---@return Barotrauma.MissionMode
_G['MissionMode'].__new = function(preset, missionTypes, seed) end

