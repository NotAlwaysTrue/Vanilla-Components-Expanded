---@meta
---@class Barotrauma.BeaconMission : Barotrauma.Mission
---`Field Private Instance`
---@field swarmSpawned System.Boolean
---`Field Private Instance`
---@field monsterSets (System.Collections.Generic.List*1Barotrauma*BeaconMission*MonsterSet)|(Barotrauma.BeaconMission.MonsterSet[])
---`Field Private Instance`
---@field sonarLabel Barotrauma.LocalizedString
---`Field Private Instance`
---@field beaconTags (System.Collections.Immutable.ImmutableArray*1Barotrauma*Identifier)|(Barotrauma.Identifier[])
---`Getter Public Instance Virtual`
---@field DisplayAsCompleted System.Boolean
---`Getter Public Instance Virtual`
---@field DisplayAsFailed System.Boolean
---`Getter Public Instance Virtual`
---@field SonarLabels (System.Collections.Generic.IEnumerable*1System*ValueTuple*2Barotrauma*LocalizedString*2Microsoft*Xna*Framework*Vector2)|(fun():(System.ValueTuple*1Barotrauma*LocalizedString*1Microsoft*Xna*Framework*Vector2))
_G['BeaconMission'] = {}

---`Method Private Instance`
---@param monsterElement System.Xml.Linq.XElement
---@param set Barotrauma.BeaconMission.MonsterSet
_G['BeaconMission'].LoadMonsters = function(monsterElement, set) end

---`Method NonPublic Instance Virtual`
---@param deltaTime System.Single
_G['BeaconMission'].UpdateMissionSpecific = function(deltaTime) end

---`Method NonPublic Instance Virtual`
---@return System.Boolean
_G['BeaconMission'].DetermineCompleted = function() end

---`Method NonPublic Instance Virtual`
---@param completed System.Boolean
_G['BeaconMission'].EndMissionSpecific = function(completed) end

---`Method Public Instance Virtual`
---@param levelData Barotrauma.LevelData
_G['BeaconMission'].AdjustLevelData = function(levelData) end

---`Method Private Static`
---@param tags (System.Collections.Immutable.ImmutableArray*1Barotrauma*Identifier)|(Barotrauma.Identifier[])
---@param levelData Barotrauma.LevelData
---@return Barotrauma.SubmarineInfo
_G['BeaconMission'].GetRandomBeaconByTags = function(tags, levelData) end

---`Constructor Public Instance`
---@param prefab Barotrauma.MissionPrefab
---@param locations (Barotrauma.Location-arr)|(Barotrauma.Location[])
---@param sub Barotrauma.Submarine
---@return Barotrauma.BeaconMission
_G['BeaconMission'] = function(prefab, locations, sub) end

---`Constructor Public Instance`
---@param prefab Barotrauma.MissionPrefab
---@param locations (Barotrauma.Location-arr)|(Barotrauma.Location[])
---@param sub Barotrauma.Submarine
---@return Barotrauma.BeaconMission
_G['BeaconMission'].__new = function(prefab, locations, sub) end

