---@meta
---@class Barotrauma.EscortMission : Barotrauma.Mission
---`Field Private Instance`
---@field terroristItemConfig Barotrauma.ContentXElement
---`Field Private Instance`
---@field characterStatusEffects (System.Collections.Generic.Dictionary*1Barotrauma*HumanPrefab*1System*Collections*Generic*List*2Barotrauma*StatusEffect)|({[Barotrauma.HumanPrefab]:((System.Collections.Generic.List*1Barotrauma*StatusEffect)|(Barotrauma.StatusEffect[]))})
---`Field Private Instance`
---@field baseEscortedCharacters System.Int32
---`Field Private Instance`
---@field scalingEscortedCharacters System.Single
---`Field Private Instance`
---@field terroristChance System.Single
---`Field Private Instance`
---@field terroristAnnounceDialogTag System.String
---`Field Private Instance`
---@field calculatedReward System.Int32
---`Field Private Instance`
---@field missionSub Barotrauma.Submarine
---`Field Private Instance`
---@field vipCharacter Barotrauma.Character
---`Field Private Instance`
---@field terroristCharacters (System.Collections.Generic.List*1Barotrauma*Character)|(Barotrauma.Character[])
---`Field Private Instance`
---@field terroristsShouldAct System.Boolean
---`Field Private Instance`
---@field terroristDistanceSquared System.Single
---`Field Private Static`
---@field TerroristTeamChangeIdentifier System.String
_G['EscortMission'] = {}

---`Method Public Instance Virtual`
---@param msg Barotrauma.Networking.IWriteMessage
---@param c Barotrauma.Networking.Client
_G['EscortMission'].ServerWriteInitial = function(msg, c) end

---`Method Private Instance`
_G['EscortMission'].CalculateReward = function() end

---`Method Public Instance Virtual`
---@param sub Barotrauma.Submarine
---@return System.Single
_G['EscortMission'].GetBaseReward = function(sub) end

---`Method Private Instance`
---@param inMission? System.Boolean
---@return System.Int32
_G['EscortMission'].CalculateScalingEscortedCharacterCount = function(inMission) end

---`Method Private Instance`
_G['EscortMission'].InitEscort = function() end

---`Method Private Instance`
_G['EscortMission'].InitCharacters = function() end

---`Method NonPublic Instance Virtual`
---@param level Barotrauma.Level
_G['EscortMission'].StartMissionSpecific = function(level) end

---`Method Private Instance`
_G['EscortMission'].TryToTriggerTerrorists = function() end

---`Method Private Instance`
---@param characterList (System.Collections.Generic.IEnumerable*1Barotrauma*Character)|(fun():(Barotrauma.Character))
---@return System.Boolean
_G['EscortMission'].NonTerroristsStillAlive = function(characterList) end

---`Method NonPublic Instance Virtual`
---@param deltaTime System.Single
_G['EscortMission'].UpdateMissionSpecific = function(deltaTime) end

---`Method Private Static`
---@param character Barotrauma.Character
---@return System.Boolean
_G['EscortMission'].Survived = function(character) end

---`Method Private Static`
---@param character Barotrauma.Character
---@return System.Boolean
_G['EscortMission'].IsAlive = function(character) end

---`Method NonPublic Instance Virtual`
---@return System.Boolean
_G['EscortMission'].DetermineCompleted = function() end

---`Method NonPublic Instance Virtual`
---@param completed System.Boolean
_G['EscortMission'].EndMissionSpecific = function(completed) end

---`Constructor Public Instance`
---@param prefab Barotrauma.MissionPrefab
---@param locations (Barotrauma.Location-arr)|(Barotrauma.Location[])
---@param sub Barotrauma.Submarine
---@return Barotrauma.EscortMission
_G['EscortMission'] = function(prefab, locations, sub) end

---`Constructor Public Instance`
---@param prefab Barotrauma.MissionPrefab
---@param locations (Barotrauma.Location-arr)|(Barotrauma.Location[])
---@param sub Barotrauma.Submarine
---@return Barotrauma.EscortMission
_G['EscortMission'].__new = function(prefab, locations, sub) end

