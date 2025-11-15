---@meta
---@class Barotrauma.GoToMission : Barotrauma.Mission
_G['GoToMission'] = {}

---`Method NonPublic Instance Virtual`
---@param deltaTime System.Single
_G['GoToMission'].UpdateMissionSpecific = function(deltaTime) end

---`Method NonPublic Instance Virtual`
---@return System.Boolean
_G['GoToMission'].DetermineCompleted = function() end

---`Constructor Public Instance`
---@param prefab Barotrauma.MissionPrefab
---@param locations (Barotrauma.Location-arr)|(Barotrauma.Location[])
---@param sub Barotrauma.Submarine
---@return Barotrauma.GoToMission
_G['GoToMission'] = function(prefab, locations, sub) end

---`Constructor Public Instance`
---@param prefab Barotrauma.MissionPrefab
---@param locations (Barotrauma.Location-arr)|(Barotrauma.Location[])
---@param sub Barotrauma.Submarine
---@return Barotrauma.GoToMission
_G['GoToMission'].__new = function(prefab, locations, sub) end

