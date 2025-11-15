---@meta
---@class Barotrauma.MonsterMission : Barotrauma.Mission
---`Field Private Instance`
---@field monsterPrefabs (System.Collections.Generic.HashSet*1System*ValueTuple*2Barotrauma*CharacterPrefab*2Microsoft*Xna*Framework*Point)|(System.ValueTuple*1Barotrauma*CharacterPrefab*1Microsoft*Xna*Framework*Point[])
---`Field Private Instance`
---@field monsters (System.Collections.Generic.List*1Barotrauma*Character)|(Barotrauma.Character[])
---`Field Private Instance`
---@field sonarPositions (System.Collections.Generic.List*1Microsoft*Xna*Framework*Vector2)|(Microsoft.Xna.Framework.Vector2[])
---`Field Private Instance`
---@field tempSonarPositions (System.Collections.Generic.List*1Microsoft*Xna*Framework*Vector2)|(Microsoft.Xna.Framework.Vector2[])
---`Field Private Instance`
---@field maxSonarMarkerDistance System.Single
---`Field Private Instance`
---@field spawnPosType Barotrauma.Level.PositionType
---`Field Private Instance`
---@field spawnPos System.Nullable*1Microsoft*Xna*Framework*Vector2
---`Getter Public Instance Virtual`
---@field DisplayAsCompleted System.Boolean
---`Getter Public Instance Virtual`
---@field DisplayAsFailed System.Boolean
---`Getter Public Instance Virtual`
---@field SonarLabels (System.Collections.Generic.IEnumerable*1System*ValueTuple*2Barotrauma*LocalizedString*2Microsoft*Xna*Framework*Vector2)|(fun():(System.ValueTuple*1Barotrauma*LocalizedString*1Microsoft*Xna*Framework*Vector2))
_G['MonsterMission'] = {}

---`Method Public Instance Virtual`
---@param msg Barotrauma.Networking.IReadMessage
_G['MonsterMission'].ClientReadInitial = function(msg) end

---`Method NonPublic Instance Virtual`
---@param level Barotrauma.Level
_G['MonsterMission'].StartMissionSpecific = function(level) end

---`Method Private Instance`
---@param monsters (System.Collections.Generic.IEnumerable*1Barotrauma*Character)|(fun():(Barotrauma.Character))
_G['MonsterMission'].InitializeMonsters = function(monsters) end

---`Method NonPublic Instance Virtual`
---@param previousState System.Int32
_G['MonsterMission'].MissionStateChanged = function(previousState) end

---`Method NonPublic Instance Virtual`
---@param deltaTime System.Single
_G['MonsterMission'].UpdateMissionSpecific = function(deltaTime) end

---`Method NonPublic Instance Virtual`
---@return System.Boolean
_G['MonsterMission'].DetermineCompleted = function() end

---`Method NonPublic Instance Virtual`
---@param completed System.Boolean
_G['MonsterMission'].EndMissionSpecific = function(completed) end

---`Method Public Static`
---@param enemy Barotrauma.Character
---@return System.Boolean
_G['MonsterMission'].IsEliminated = function(enemy) end

---`Constructor Public Instance`
---@param prefab Barotrauma.MissionPrefab
---@param locations (Barotrauma.Location-arr)|(Barotrauma.Location[])
---@param sub Barotrauma.Submarine
---@return Barotrauma.MonsterMission
_G['MonsterMission'] = function(prefab, locations, sub) end

---`Constructor Public Instance`
---@param prefab Barotrauma.MissionPrefab
---@param locations (Barotrauma.Location-arr)|(Barotrauma.Location[])
---@param sub Barotrauma.Submarine
---@return Barotrauma.MonsterMission
_G['MonsterMission'].__new = function(prefab, locations, sub) end

