---@meta
---@class Barotrauma.CombatMission : Barotrauma.Mission
---`Field Private Instance`
---@field teamDead (System.Boolean-arr)|(System.Boolean[])
---`Field Private Instance`
---@field crews (System.Collections.Generic.List)|((System.Collections.Generic.List*1Barotrauma*Character)|(Barotrauma.Character[])[])
---`Field Private Instance`
---@field kills (System.Collections.Generic.List*1Barotrauma*CombatMission*KillCount)|(Barotrauma.CombatMission.KillCount[])
---`Field Private Instance`
---@field roundEndTimer System.Single
---`Field Private Instance`
---@field timeInTargetSubmarineTimer System.Single
---`Field Private Instance`
---@field subs (Barotrauma.Submarine-arr)|(Barotrauma.Submarine[])
---`Field Private Instance`
---@field descriptions (Barotrauma.LocalizedString-arr)|(Barotrauma.LocalizedString[])
---`Field Private Instance`
---@field allowRespawning System.Boolean
---`Field Private Instance`
---@field winCondition Barotrauma.CombatMission.WinCondition
---`Field Private Instance`
---@field targetSubmarine Barotrauma.Submarine
---`Field Private Instance`
---@field targetSubmarineSonarLabel Barotrauma.LocalizedString
---`Field Public Instance`
---@field PointsPerKill System.Int32
---`Field Public Instance`
---@field Scores (System.Int32-arr)|(System.Int32[])
---`Field Private Static`
---@field teamNames (Barotrauma.LocalizedString-arr)|(Barotrauma.LocalizedString[])
---`Field Private Static`
---@field RoundEndDuration System.Single
---`Getter Public Instance Virtual`
---@field Description Barotrauma.LocalizedString
---`Getter Public Instance Virtual`
---@field AllowRespawning System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field TargetSubmarineType Barotrauma.TagAction.SubType
---`Getter Public Instance`
---@field WinScore System.Int32
---`Getter Public Instance`
---@field HasWinScore System.Boolean
---`Getter Public Static`
---@field Winner Barotrauma.CharacterTeamType
---`Getter Public Instance Virtual`
---@field SuccessMessage Barotrauma.LocalizedString
_G['CombatMission'] = {}

---`Method NonPublic Instance Virtual`
---@param deltaTime System.Single
_G['CombatMission'].UpdateMissionSpecific = function(deltaTime) end

---`Method Private Instance`
_G['CombatMission'].CheckTeamCharacters = function() end

---`Method Private Instance`
---@param deltaTime System.Single
_G['CombatMission'].CheckWinCondition = function(deltaTime) end

---`Method Private Instance`
_G['CombatMission'].CheckScore = function() end

---`Method Private Instance`
---@param deltaTime System.Single
_G['CombatMission'].CheckTargetSubmarineControl = function(deltaTime) end

---`Method Public Instance`
---@param team Barotrauma.CharacterTeamType
---@param amount System.Int32
_G['CombatMission'].AddToScore = function(team, amount) end

---`Method Private Instance`
---@param character Barotrauma.Character
_G['CombatMission'].AddKill = function(character) end

---`Method Private Instance`
---@param teamIndex System.Int32
_G['CombatMission'].SetWinningTeam = function(teamIndex) end

---`Method Public Instance Virtual`
---@param msg Barotrauma.Networking.IWriteMessage
_G['CombatMission'].ServerWrite = function(msg) end

---`Method Public Static`
---@param teamID Barotrauma.CharacterTeamType
---@return Barotrauma.LocalizedString
_G['CombatMission'].GetTeamName = function(teamID) end

---`Method Public Static`
---@param character Barotrauma.Character
---@return System.Boolean
_G['CombatMission'].IsInWinningTeam = function(character) end

---`Method NonPublic Instance Virtual`
---@param level Barotrauma.Level
_G['CombatMission'].StartMissionSpecific = function(level) end

---`Method NonPublic Instance Virtual`
---@return System.Boolean
_G['CombatMission'].DetermineCompleted = function() end

---`Constructor Public Instance`
---@overload fun(prefab:Barotrauma.MissionPrefab, locations:(Barotrauma.Location-arr)|(Barotrauma.Location[]), sub:Barotrauma.Submarine):Barotrauma.CombatMission
---@return Barotrauma.CombatMission
_G['CombatMission'] = function() end

---`Constructor Public Instance`
---@overload fun(prefab:Barotrauma.MissionPrefab, locations:(Barotrauma.Location-arr)|(Barotrauma.Location[]), sub:Barotrauma.Submarine):Barotrauma.CombatMission
---@return Barotrauma.CombatMission
_G['CombatMission'].__new = function() end

---`Constructor Private Static`
---@overload fun(prefab:Barotrauma.MissionPrefab, locations:(Barotrauma.Location-arr)|(Barotrauma.Location[]), sub:Barotrauma.Submarine):Barotrauma.CombatMission
---@return Barotrauma.CombatMission
_G['CombatMission'] = function() end

---`Constructor Private Static`
---@overload fun(prefab:Barotrauma.MissionPrefab, locations:(Barotrauma.Location-arr)|(Barotrauma.Location[]), sub:Barotrauma.Submarine):Barotrauma.CombatMission
---@return Barotrauma.CombatMission
_G['CombatMission'].__new = function() end

