---@meta
---@class Barotrauma.NetLobbyScreen : Barotrauma.Screen
---`Field Private Instance`
---@field selectedSub Barotrauma.SubmarineInfo
---`Field Private Instance`
---@field selectedEnemySub Barotrauma.SubmarineInfo
---`Field Private Instance`
---@field selectedShuttle Barotrauma.SubmarineInfo
---`Field Public Instance`
---@field RadiationEnabled System.Boolean
---`Field Private Instance`
---@field selectedModeIndex System.Int32
---`Field Private Instance`
---@field subs (System.Collections.Generic.List*1Barotrauma*SubmarineInfo)|(Barotrauma.SubmarineInfo[])
---`Field Private Instance`
---@field lastUpdateID System.UInt16
---`Field Private Instance`
---@field levelSeed System.String
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field SelectedSub Barotrauma.SubmarineInfo
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field SelectedEnemySub Barotrauma.SubmarineInfo
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field SelectedShuttle Barotrauma.SubmarineInfo
---`Getter Public Instance`
---@field GameModes (Barotrauma.GameModePreset-arr)|(Barotrauma.GameModePreset[])
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field SelectedModeIndex System.Int32
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field SelectedModeIdentifier Barotrauma.Identifier
---`Getter Public Instance`
---@field SelectedMode Barotrauma.GameModePreset
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field MissionTypes (System.Collections.Generic.IEnumerable*1Barotrauma*Identifier)|(fun():(Barotrauma.Identifier))
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field LevelSeed System.String
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field LastUpdateID System.UInt16
_G['NetLobbyScreen'] = {}

---`Method Public Instance`
---@return (System.Collections.Generic.IReadOnlyList*1Barotrauma*SubmarineInfo)|(Barotrauma.SubmarineInfo[])
_G['NetLobbyScreen'].GetSubList = function() end

---`Method Public Instance`
---@param sub Barotrauma.SubmarineInfo
_G['NetLobbyScreen'].AddSub = function(sub) end

---`Method Public Instance`
---@param enabled System.Boolean
_G['NetLobbyScreen'].ToggleCampaignMode = function(enabled) end

---`Method Public Instance Virtual`
_G['NetLobbyScreen'].Select = function() end

---`Method Public Instance`
_G['NetLobbyScreen'].RandomizeSettings = function() end

---`Method Public Instance`
---@param difficulty System.Single
_G['NetLobbyScreen'].SetLevelDifficulty = function(difficulty) end

---`Method Public Instance`
---@param botCount System.Int32
_G['NetLobbyScreen'].SetBotCount = function(botCount) end

---`Method Public Instance`
---@param botSpawnMode Barotrauma.Networking.BotSpawnMode
_G['NetLobbyScreen'].SetBotSpawnMode = function(botSpawnMode) end

---`Method Public Instance`
---@param probability System.Single
_G['NetLobbyScreen'].SetTraitorProbability = function(probability) end

---`Method Public Instance`
---@param dangerLevel System.Int32
_G['NetLobbyScreen'].SetTraitorDangerLevel = function(dangerLevel) end

---`Constructor Public Instance`
---@return Barotrauma.NetLobbyScreen
_G['NetLobbyScreen'] = function() end

---`Constructor Public Instance`
---@return Barotrauma.NetLobbyScreen
_G['NetLobbyScreen'].__new = function() end

