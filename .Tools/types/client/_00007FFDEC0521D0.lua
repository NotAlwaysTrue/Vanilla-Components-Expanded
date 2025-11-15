---@meta
---@class Barotrauma.SalvageMission : Barotrauma.Mission
---`Field Private Instance`
---@field targets (System.Collections.Generic.List*1Barotrauma*SalvageMission*Target)|(Barotrauma.SalvageMission.Target[])
---`Field Private Instance`
---@field requiredDeliveryAmount System.Single
---`Field Private Instance`
---@field wreckTags (System.Collections.Immutable.ImmutableArray*1Barotrauma*Identifier)|(Barotrauma.Identifier[])
---`Field Private Instance`
---@field pickedUpMessage Barotrauma.LocalizedString
---`Field Private Instance`
---@field partiallyRetrievedMessage Barotrauma.LocalizedString
---`Field Private Instance`
---@field allRetrievedMessage Barotrauma.LocalizedString
---`Field Private Instance`
---@field rng Barotrauma.MTRandom
---`Getter Public Instance Virtual`
---@field DisplayAsCompleted System.Boolean
---`Getter Public Instance Virtual`
---@field DisplayAsFailed System.Boolean
---`Getter Public Instance Virtual`
---@field HudIconTargets (System.Collections.Generic.IEnumerable*1Barotrauma*Entity)|(fun():(Barotrauma.Entity))
---`Getter Public Instance`
---@field AnyTargetNeedsToBeRetrievedToSub System.Boolean
---`Getter Public Instance Virtual`
---@field SonarLabels (System.Collections.Generic.IEnumerable*1System*ValueTuple*2Barotrauma*LocalizedString*2Microsoft*Xna*Framework*Vector2)|(fun():(System.ValueTuple*1Barotrauma*LocalizedString*1Microsoft*Xna*Framework*Vector2))
_G['SalvageMission'] = {}

---`Method Private Instance`
_G['SalvageMission'].TryShowPickedUpMessage = function() end

---`Method Private Instance`
_G['SalvageMission'].TryShowRetrievedMessage = function() end

---`Method Private Instance`
---@param message Barotrauma.LocalizedString-ref
_G['SalvageMission'].HandleMessage = function(message) end

---`Method Public Instance Virtual`
---@param msg Barotrauma.Networking.IReadMessage
_G['SalvageMission'].ClientReadInitial = function(msg) end

---`Method Public Instance Virtual`
---@param msg Barotrauma.Networking.IReadMessage
_G['SalvageMission'].ClientRead = function(msg) end

---`Method Private Instance`
---@param element Barotrauma.ContentXElement
---@param parentTarget Barotrauma.SalvageMission.Target
_G['SalvageMission'].LoadTarget = function(element, parentTarget) end

---`Method Private Instance`
---@param targetElement Barotrauma.ContentXElement
---@return System.Int32
_G['SalvageMission'].GetAmount = function(targetElement) end

---`Method NonPublic Instance Virtual`
---@param level Barotrauma.Level
_G['SalvageMission'].StartMissionSpecific = function(level) end

---`Method Private Static`
---@param sub Barotrauma.Submarine
---@param spawnPosType Barotrauma.Level.PositionType
---@return System.Boolean
_G['SalvageMission'].IsValidSubmarine = function(sub, spawnPosType) end

---`Method NonPublic Instance Virtual`
---@param deltaTime System.Single
_G['SalvageMission'].UpdateMissionSpecific = function(deltaTime) end

---`Method NonPublic Instance Virtual`
---@return System.Boolean
_G['SalvageMission'].DetermineCompleted = function() end

---`Method NonPublic Instance Virtual`
---@param completed System.Boolean
_G['SalvageMission'].EndMissionSpecific = function(completed) end

---`Method Public Instance Virtual`
---@param levelData Barotrauma.LevelData
_G['SalvageMission'].AdjustLevelData = function(levelData) end

---`Method Private Static`
---@param tags (System.Collections.Immutable.ImmutableArray*1Barotrauma*Identifier)|(Barotrauma.Identifier[])
---@param levelData Barotrauma.LevelData
---@return Barotrauma.SubmarineInfo
_G['SalvageMission'].GetRandomWreckByTags = function(tags, levelData) end

---`Constructor Public Instance`
---@param prefab Barotrauma.MissionPrefab
---@param locations (Barotrauma.Location-arr)|(Barotrauma.Location[])
---@param sub Barotrauma.Submarine
---@return Barotrauma.SalvageMission
_G['SalvageMission'] = function(prefab, locations, sub) end

---`Constructor Public Instance`
---@param prefab Barotrauma.MissionPrefab
---@param locations (Barotrauma.Location-arr)|(Barotrauma.Location[])
---@param sub Barotrauma.Submarine
---@return Barotrauma.SalvageMission
_G['SalvageMission'].__new = function(prefab, locations, sub) end

