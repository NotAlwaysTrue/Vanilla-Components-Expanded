---@meta
---@class Barotrauma.EndMission : Barotrauma.Mission
---`Field Private Instance`
---@field bossPrefab Barotrauma.CharacterPrefab
---`Field Private Instance`
---@field minionPrefab Barotrauma.CharacterPrefab
---`Field Private Instance`
---@field spawnPointTag Barotrauma.Identifier
---`Field Private Instance`
---@field bossSpawnPoint Barotrauma.WayPoint
---`Field Private Instance`
---@field destructibleItemTag Barotrauma.Identifier
---`Field Private Instance`
---@field endCinematicSound System.String
---`Field Private Instance`
---@field minions (System.Collections.Immutable.ImmutableArray*1Barotrauma*Character)|(Barotrauma.Character[])
---`Field Private Instance`
---@field minionCount System.Int32
---`Field Private Instance`
---@field minionScatter System.Single
---`Field Private Instance`
---@field boss Barotrauma.Character
---`Field Private Instance`
---@field projectilePrefab Barotrauma.ItemPrefab
---`Field Private Instance`
---@field projectileTimer System.Single
---`Field Private Instance`
---@field startCinematicDistance System.Single
---`Field Private Instance`
---@field endCinematicTimer System.Single
---`Field Private Instance`
---@field destructibleItems (System.Collections.Generic.List*1Barotrauma*Item)|(Barotrauma.Item[])
---`Field NonPublic Instance`
---@field wakeUpCinematicDelay System.Single
---`Field NonPublic Instance`
---@field bossWakeUpDelay System.Single
---`Field NonPublic Instance`
---@field cameraWaitDuration System.Single
---`Getter Public Instance Virtual`
---@field SonarLabels (System.Collections.Generic.IEnumerable*1System*ValueTuple*2Barotrauma*LocalizedString*2Microsoft*Xna*Framework*Vector2)|(fun():(System.ValueTuple*1Barotrauma*LocalizedString*1Microsoft*Xna*Framework*Vector2))
---`Getter Public Instance Virtual`
---<br/>`Setter Public Instance Virtual`
---@field State System.Int32
---`Getter Private Instance`
---@field Phase Barotrauma.EndMission.MissionPhase
_G['EndMission'] = {}

---`Method Public Instance Virtual`
---@param msg Barotrauma.Networking.IWriteMessage
---@param c Barotrauma.Networking.Client
_G['EndMission'].ServerWriteInitial = function(msg, c) end

---`Method NonPublic Instance Virtual`
---@param level Barotrauma.Level
_G['EndMission'].StartMissionSpecific = function(level) end

---`Method NonPublic Instance Virtual`
---@param deltaTime System.Single
_G['EndMission'].UpdateMissionSpecific = function(deltaTime) end

---`Method NonPublic Instance Virtual`
---@return System.Boolean
_G['EndMission'].DetermineCompleted = function() end

---`Constructor Public Instance`
---@param prefab Barotrauma.MissionPrefab
---@param locations (Barotrauma.Location-arr)|(Barotrauma.Location[])
---@param sub Barotrauma.Submarine
---@return Barotrauma.EndMission
_G['EndMission'] = function(prefab, locations, sub) end

---`Constructor Public Instance`
---@param prefab Barotrauma.MissionPrefab
---@param locations (Barotrauma.Location-arr)|(Barotrauma.Location[])
---@param sub Barotrauma.Submarine
---@return Barotrauma.EndMission
_G['EndMission'].__new = function(prefab, locations, sub) end

