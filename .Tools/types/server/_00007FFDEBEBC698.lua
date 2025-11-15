---@meta
---@class Barotrauma.AbandonedOutpostMission : Barotrauma.Mission
---`Field Private Instance`
---@field spawnedItems (System.Collections.Generic.List*1Barotrauma*Item)|(Barotrauma.Item[])
---`Field NonPublic Instance`
---@field requireKill (System.Collections.Generic.HashSet*1Barotrauma*Character)|(Barotrauma.Character[])
---`Field NonPublic Instance`
---@field requireRescue (System.Collections.Generic.HashSet*1Barotrauma*Character)|(Barotrauma.Character[])
---`Field Private Instance`
---@field itemTag Barotrauma.Identifier
---`Field Private Instance`
---@field itemConfig System.Xml.Linq.XElement
---`Field Private Instance`
---@field items (System.Collections.Generic.List*1Barotrauma*Item)|(Barotrauma.Item[])
---`Field Private Instance`
---@field hostagesKilledMessage Barotrauma.LocalizedString
---`Field Private Instance`
---@field endTimer System.Single
---`Field Private Instance`
---@field allowOrderingRescuees System.Boolean
---`Field NonPublic Instance`
---@field wasDocked System.Boolean
---`Field Private Instance`
---@field previousKillTargetsRemaining System.Int32
---`Field NonPublic Static`
---@field HostagesKilledState System.Int32
---`Field Private Static`
---@field EndDelay System.Single
---`Getter Public Instance Virtual`
---@field AllowRespawning System.Boolean
---`Getter Public Instance Virtual`
---@field AllowUndocking System.Boolean
---`Getter Public Instance Virtual`
---@field SonarLabels (System.Collections.Generic.IEnumerable*1System*ValueTuple*2Barotrauma*LocalizedString*2Microsoft*Xna*Framework*Vector2)|(fun():(System.ValueTuple*1Barotrauma*LocalizedString*1Microsoft*Xna*Framework*Vector2))
---`Getter Private Instance`
---@field Targets (System.Collections.Generic.IEnumerable*1Barotrauma*Entity)|(fun():(Barotrauma.Entity))
_G['AbandonedOutpostMission'] = {}

---`Method Public Instance Virtual`
---@param msg Barotrauma.Networking.IWriteMessage
---@param c Barotrauma.Networking.Client
_G['AbandonedOutpostMission'].ServerWriteInitial = function(msg, c) end

---`Method NonPublic Instance Virtual`
---@param level Barotrauma.Level
_G['AbandonedOutpostMission'].StartMissionSpecific = function(level) end

---`Method Private Instance`
---@param submarine Barotrauma.Submarine
_G['AbandonedOutpostMission'].InitItems = function(submarine) end

---`Method Private Instance`
_G['AbandonedOutpostMission'].TrackKillTargetCount = function() end

---`Method NonPublic Instance Virtual`
---@param deltaTime System.Single
_G['AbandonedOutpostMission'].UpdateMissionSpecific = function(deltaTime) end

---`Method NonPublic Instance Virtual`
---@return System.Boolean
_G['AbandonedOutpostMission'].DetermineCompleted = function() end

---`Method NonPublic Instance Virtual`
---@param completed System.Boolean
_G['AbandonedOutpostMission'].EndMissionSpecific = function(completed) end

---`Method NonPublic Instance Virtual`
---@param character Barotrauma.Character
---@param element System.Xml.Linq.XElement
_G['AbandonedOutpostMission'].InitCharacter = function(character, element) end

---`Method NonPublic Instance Virtual`
---@param humanPrefab Barotrauma.HumanPrefab
---@param element System.Xml.Linq.XElement
---@param submarine Barotrauma.Submarine
---@return Barotrauma.Character
_G['AbandonedOutpostMission'].LoadHuman = function(humanPrefab, element, submarine) end

---`Constructor Public Instance`
---@param prefab Barotrauma.MissionPrefab
---@param locations (Barotrauma.Location-arr)|(Barotrauma.Location[])
---@param sub Barotrauma.Submarine
---@return Barotrauma.AbandonedOutpostMission
_G['AbandonedOutpostMission'] = function(prefab, locations, sub) end

---`Constructor Public Instance`
---@param prefab Barotrauma.MissionPrefab
---@param locations (Barotrauma.Location-arr)|(Barotrauma.Location[])
---@param sub Barotrauma.Submarine
---@return Barotrauma.AbandonedOutpostMission
_G['AbandonedOutpostMission'].__new = function(prefab, locations, sub) end

