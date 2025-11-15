---@meta
---@class Barotrauma.CombatMission : Barotrauma.Mission
---`Field Private Instance`
---@field clientKills (System.Collections.Generic.Dictionary*1System*Byte*1System*Int32)|({[System.Byte]:(System.Int32)})
---`Field Private Instance`
---@field clientDeaths (System.Collections.Generic.Dictionary*1System*Byte*1System*Int32)|({[System.Byte]:(System.Int32)})
---`Field Private Instance`
---@field botKills (System.Collections.Generic.Dictionary*1System*UInt16*1System*Int32)|({[System.UInt16]:(System.Int32)})
---`Field Private Instance`
---@field botDeaths (System.Collections.Generic.Dictionary*1System*UInt16*1System*Int32)|({[System.UInt16]:(System.Int32)})
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
---`Getter Public Instance Virtual`
---@field Description Barotrauma.LocalizedString
---`Getter Public Instance Virtual`
---@field DisplayAsCompleted System.Boolean
---`Getter Public Instance Virtual`
---@field DisplayAsFailed System.Boolean
---`Getter Public Instance Virtual`
---@field SonarLabels (System.Collections.Generic.IEnumerable*1System*ValueTuple*2Barotrauma*LocalizedString*2Microsoft*Xna*Framework*Vector2)|(fun():(System.ValueTuple*1Barotrauma*LocalizedString*1Microsoft*Xna*Framework*Vector2))
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

---`Method Public Static`
---@param teamID Barotrauma.CharacterTeamType
---@return Microsoft.Xna.Framework.Color
_G['CombatMission'].GetTeamColor = function(teamID) end

---`Method Public Instance`
---@param client Barotrauma.Networking.Client
---@return System.Int32
_G['CombatMission'].GetClientKillCount = function(client) end

---`Method Public Instance`
---@param client Barotrauma.Networking.Client
---@return System.Int32
_G['CombatMission'].GetClientDeathCount = function(client) end

---`Method Public Instance`
---@param botInfo Barotrauma.CharacterInfo
---@return System.Int32
_G['CombatMission'].GetBotKillCount = function(botInfo) end

---`Method Public Instance`
---@param botInfo Barotrauma.CharacterInfo
---@return System.Int32
_G['CombatMission'].GetBotDeathCount = function(botInfo) end

---`Method Public Instance Virtual`
---@param msg Barotrauma.Networking.IReadMessage
_G['CombatMission'].ClientRead = function(msg) end

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

