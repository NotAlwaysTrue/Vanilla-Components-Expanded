---@meta
---@class Barotrauma.PvPMode : Barotrauma.MissionMode
---`Field Private Instance`
---@field scoreContainer Barotrauma.GUIComponent
---`Field Private Instance`
---@field scoreTexts (Barotrauma.GUITextBlock-arr)|(Barotrauma.GUITextBlock[])
---`Field Private Instance`
---@field scoreTextShadows (Barotrauma.GUITextBlock-arr)|(Barotrauma.GUITextBlock[])
---`Field Private Instance`
---@field prevScores (System.Int32-arr)|(System.Int32[])
_G['PvPMode'] = {}

---`Method Private Instance`
_G['PvPMode'].InitUI = function() end

---`Method Public Instance Virtual`
_G['PvPMode'].AddToGUIUpdateList = function() end

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

