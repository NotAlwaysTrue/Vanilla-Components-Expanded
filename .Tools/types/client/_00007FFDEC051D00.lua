---@meta
---@class Barotrauma.PirateMission : Barotrauma.Mission
---`Field Private Instance`
---@field submarineTypeConfig Barotrauma.ContentXElement
---`Field Private Instance`
---@field characterTypeConfig Barotrauma.ContentXElement
---`Field Private Instance`
---@field addedMissionDifficultyPerPlayer System.Single
---`Field Private Instance`
---@field missionDifficulty System.Single
---`Field Private Instance`
---@field alternateReward System.Int32
---`Field Private Instance`
---@field factionIdentifier Barotrauma.Identifier
---`Field Private Instance`
---@field enemySub Barotrauma.Submarine
---`Field Private Instance`
---@field characterStatusEffects (System.Collections.Generic.Dictionary*1Barotrauma*HumanPrefab*1System*Collections*Generic*List*2Barotrauma*StatusEffect)|({[Barotrauma.HumanPrefab]:((System.Collections.Generic.List*1Barotrauma*StatusEffect)|(Barotrauma.StatusEffect[]))})
---`Field Private Instance`
---@field pirateSightingUpdateFrequency System.Single
---`Field Private Instance`
---@field pirateSightingUpdateTimer System.Single
---`Field Private Instance`
---@field lastSighting System.Nullable*1Microsoft*Xna*Framework*Vector2
---`Field Private Instance`
---@field levelData Barotrauma.LevelData
---`Field Private Instance`
---@field outsideOfSonarRange System.Boolean
---`Field Private Instance`
---@field patrolPositions (System.Collections.Generic.List*1Microsoft*Xna*Framework*Vector2)|(Microsoft.Xna.Framework.Vector2[])
---`Field Private Instance`
---@field submarineInfo Barotrauma.SubmarineInfo
---`Field Private Static`
---@field RandomnessModifier System.Single
---`Field Private Static`
---@field ShipRandomnessModifier System.Single
---`Field Private Static`
---@field MaxDifficulty System.Single
---`Getter Public Instance Virtual`
---@field DisplayAsCompleted System.Boolean
---`Getter Public Instance Virtual`
---@field DisplayAsFailed System.Boolean
---`Getter Public Instance Virtual`
---@field TeamCount System.Int32
---`Getter Public Instance Virtual`
---@field SonarLabels (System.Collections.Generic.IEnumerable*1System*ValueTuple*2Barotrauma*LocalizedString*2Microsoft*Xna*Framework*Vector2)|(fun():(System.ValueTuple*1Barotrauma*LocalizedString*1Microsoft*Xna*Framework*Vector2))
---`Getter Public Instance Virtual`
---@field EnemySubmarineInfo Barotrauma.SubmarineInfo
_G['PirateMission'] = {}

---`Method Public Instance Virtual`
---@param msg Barotrauma.Networking.IReadMessage
_G['PirateMission'].ClientReadInitial = function(msg) end

---`Method Public Instance Virtual`
---@param sub Barotrauma.Submarine
---@return System.Single
_G['PirateMission'].GetBaseReward = function(sub) end

---`Method Public Instance Virtual`
---@param level Barotrauma.LevelData
_G['PirateMission'].SetLevel = function(level) end

---`Method Private Static`
---@param preferredDifficulty System.Single
---@param levelDifficulty System.Single
---@param randomnessModifier System.Single
---@param rand System.Random
---@return System.Single
_G['PirateMission'].GetDifficultyModifiedValue = function(preferredDifficulty, levelDifficulty, randomnessModifier, rand) end

---`Method Private Static`
---@param minAmount System.Int32
---@param maxAmount System.Int32
---@param levelDifficulty System.Single
---@param rand System.Random
---@return System.Int32
_G['PirateMission'].GetDifficultyModifiedAmount = function(minAmount, maxAmount, levelDifficulty, rand) end

---`Method Private Instance`
---@param levelDifficulty System.Single
---@param randomnessModifier System.Single
---@return Barotrauma.SubmarineInfo
_G['PirateMission'].GetRandomDifficultyModifiedSubmarine = function(levelDifficulty, randomnessModifier) end

---`Method Private Instance`
---@param parentElement System.Xml.Linq.XElement
---@param levelDifficulty System.Single
---@param randomnessModifier System.Single
---@return System.Xml.Linq.XElement
_G['PirateMission'].GetRandomDifficultyModifiedElement = function(parentElement, levelDifficulty, randomnessModifier) end

---`Method Private Instance`
---@param preferredSpawnPos Microsoft.Xna.Framework.Vector2-ref
_G['PirateMission'].CreateMissionPositions = function(preferredSpawnPos) end

---`Method Private Instance`
_G['PirateMission'].InitPirateShip = function() end

---`Method Private Instance`
_G['PirateMission'].InitPirates = function() end

---`Method NonPublic Instance Virtual`
---@param level Barotrauma.Level
_G['PirateMission'].StartMissionSpecific = function(level) end

---`Method NonPublic Instance Virtual`
---@param deltaTime System.Single
_G['PirateMission'].UpdateMissionSpecific = function(deltaTime) end

---`Method Private Instance`
---@return System.Boolean
_G['PirateMission'].CheckWinState = function() end

---`Method Private Static`
---@param character Barotrauma.Character
---@return System.Boolean
_G['PirateMission'].DeadOrCaptured = function(character) end

---`Method NonPublic Instance Virtual`
---@return System.Boolean
_G['PirateMission'].DetermineCompleted = function() end

---`Method NonPublic Instance Virtual`
---@param completed System.Boolean
_G['PirateMission'].EndMissionSpecific = function(completed) end

---`Constructor Public Instance`
---@param prefab Barotrauma.MissionPrefab
---@param locations (Barotrauma.Location-arr)|(Barotrauma.Location[])
---@param sub Barotrauma.Submarine
---@return Barotrauma.PirateMission
_G['PirateMission'] = function(prefab, locations, sub) end

---`Constructor Public Instance`
---@param prefab Barotrauma.MissionPrefab
---@param locations (Barotrauma.Location-arr)|(Barotrauma.Location[])
---@param sub Barotrauma.Submarine
---@return Barotrauma.PirateMission
_G['PirateMission'].__new = function(prefab, locations, sub) end

