---@meta
---@class Barotrauma.Mission : System.Object
---`Field Private Instance`
---@field shownMessages (System.Collections.Generic.List*1Barotrauma*LocalizedString)|(Barotrauma.LocalizedString[])
---`Field Public Instance`
---@field Prefab Barotrauma.MissionPrefab
---`Field Private Instance`
---@field completed System.Boolean
---`Field NonPublic Instance`
---@field failed System.Boolean
---`Field NonPublic Instance`
---@field level Barotrauma.Level
---`Field NonPublic Instance`
---@field state System.Int32
---`Field NonPublic Instance`
---@field completeCheckDataAction Barotrauma.CheckDataAction
---`Field Public Instance`
---@field Headers (System.Collections.Immutable.ImmutableArray*1Barotrauma*LocalizedString)|(Barotrauma.LocalizedString[])
---`Field Public Instance`
---@field Messages (System.Collections.Immutable.ImmutableArray*1Barotrauma*LocalizedString)|(Barotrauma.LocalizedString[])
---`Field Private Instance`
---@field finalReward System.Nullable*1System*Int32
---`Field Private Instance`
---@field successMessage Barotrauma.LocalizedString
---`Field Private Instance`
---@field failureMessage Barotrauma.LocalizedString
---`Field NonPublic Instance`
---@field description Barotrauma.LocalizedString
---`Field NonPublic Instance`
---@field descriptionWithoutReward Barotrauma.LocalizedString
---`Field Public Instance`
---@field ForceFailure System.Boolean
---`Field Public Instance`
---@field OriginLocation Barotrauma.Location
---`Field Public Instance`
---@field Locations (Barotrauma.Location-arr)|(Barotrauma.Location[])
---`Field Private Instance`
---@field delayedTriggerEvents (System.Collections.Generic.List*1Barotrauma*Mission*DelayedTriggerEvent)|(Barotrauma.Mission.DelayedTriggerEvent[])
---`Field Public Instance`
---@field OnMissionStateChanged (System.Action*1Barotrauma*Mission)|(fun(obj:Barotrauma.Mission))
---`Field NonPublic Instance`
---@field characterConfig Barotrauma.ContentXElement
---`Field NonPublic Instance`
---@field characters (System.Collections.Generic.List*1Barotrauma*Character)|(Barotrauma.Character[])
---`Field NonPublic Instance`
---@field characterItems (System.Collections.Generic.Dictionary*1Barotrauma*Character*1System*Collections*Generic*List*2Barotrauma*Item)|({[Barotrauma.Character]:((System.Collections.Generic.List*1Barotrauma*Item)|(Barotrauma.Item[]))})
---`Getter Public Instance`
---@field ShownMessages (System.Collections.Generic.IEnumerable*1Barotrauma*LocalizedString)|(fun():(Barotrauma.LocalizedString))
---`Getter Public Instance`
---@field DisplayTargetHudIcons System.Boolean
---`Getter Public Instance Virtual`
---@field HudIconTargets (System.Collections.Generic.IEnumerable*1Barotrauma*Entity)|(fun():(Barotrauma.Entity))
---`Getter Public Instance Abstract Virtual`
---@field DisplayAsCompleted System.Boolean
---`Getter Public Instance Abstract Virtual`
---@field DisplayAsFailed System.Boolean
---`Getter Public Instance Virtual`
---<br/>`Setter Public Instance Virtual`
---@field State System.Int32
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field TimesAttempted System.Int32
---`Getter NonPublic Static`
---@field IsClient System.Boolean
---`Getter Public Instance Virtual`
---@field Name Barotrauma.LocalizedString
---`Getter Public Instance Virtual`
---@field SuccessMessage Barotrauma.LocalizedString
---`Getter Public Instance Virtual`
---@field FailureMessage Barotrauma.LocalizedString
---`Getter Public Instance Virtual`
---@field Description Barotrauma.LocalizedString
---`Getter Public Instance Virtual`
---@field AllowUndocking System.Boolean
---`Getter Public Instance Virtual`
---@field Reward System.Int32
---`Getter Public Instance`
---@field ReputationRewards (System.Collections.Immutable.ImmutableList*1Barotrauma*MissionPrefab*ReputationReward)|(Barotrauma.MissionPrefab.ReputationReward[])
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Completed System.Boolean
---`Getter Public Instance`
---@field Failed System.Boolean
---`Getter Public Instance Virtual`
---@field AllowRespawning System.Boolean
---`Getter Public Instance Virtual`
---@field TeamCount System.Int32
---`Getter Public Instance Virtual`
---@field EnemySubmarineInfo Barotrauma.SubmarineInfo
---`Getter Public Instance Virtual`
---@field SonarLabels (System.Collections.Generic.IEnumerable*1System*ValueTuple*2Barotrauma*LocalizedString*2Microsoft*Xna*Framework*Vector2)|(fun():(System.ValueTuple*1Barotrauma*LocalizedString*1Microsoft*Xna*Framework*Vector2))
---`Getter Public Instance`
---@field SonarIconIdentifier Barotrauma.Identifier
---`Getter Public Instance`
---@field Difficulty System.Nullable*1System*Int32
_G['Mission'] = {}

---`Method Public Instance`
---@return Microsoft.Xna.Framework.Color
_G['Mission'].GetDifficultyColor = function() end

---`Method Public Static`
---@param difficulty System.Int32
---@return Microsoft.Xna.Framework.Color
_G['Mission'].GetDifficultyColor = function(difficulty) end

---`Method NonPublic Instance`
---@param sub Barotrauma.Submarine
---@return Barotrauma.LocalizedString
_G['Mission'].GetRewardAmountText = function(sub) end

---`Method Public Instance Virtual`
---@param sub Barotrauma.Submarine
---@return Barotrauma.RichString
_G['Mission'].GetMissionRewardText = function(sub) end

---`Method Public Instance`
---@return Barotrauma.RichString
_G['Mission'].GetDifficultyToolTipText = function() end

---`Method Public Instance`
---@return Barotrauma.RichString
_G['Mission'].GetReputationRewardText = function() end

---`Method Private Instance`
---@param header Barotrauma.LocalizedString
---@param message Barotrauma.LocalizedString
---@return (System.Collections.Generic.IEnumerable*1Barotrauma*CoroutineStatus)|(fun():(Barotrauma.CoroutineStatus))
_G['Mission'].ShowMessageBoxWhenRoundSummaryIsNotActive = function(header, message) end

---`Method NonPublic Instance`
---@param header Barotrauma.LocalizedString
---@param message Barotrauma.LocalizedString
_G['Mission'].CreateMessageBox = function(header, message) end

---`Method Public Instance`
---@return Barotrauma.Identifier
_G['Mission'].GetOverrideMusicType = function() end

---`Method Public Instance Virtual`
---@param msg Barotrauma.Networking.IReadMessage
_G['Mission'].ClientRead = function(msg) end

---`Method Public Instance Virtual`
---@param msg Barotrauma.Networking.IReadMessage
_G['Mission'].ClientReadInitial = function(msg) end

---`Method Public Instance`
---@param message Barotrauma.LocalizedString
---@param sub Barotrauma.Submarine
---@param replaceReward? System.Boolean
---@return Barotrauma.LocalizedString
_G['Mission'].ReplaceVariablesInMissionMessage = function(message, sub, replaceReward) end

---`Method NonPublic Instance Virtual`
---@param previousState System.Int32
_G['Mission'].MissionStateChanged = function(previousState) end

---`Method Public Instance Virtual`
---@param level Barotrauma.LevelData
_G['Mission'].SetLevel = function(level) end

---`Method Public Static`
---@overload fun(locations:(Barotrauma.Location-arr)|(Barotrauma.Location[]), seed:System.String, requireCorrectLocationType:System.Boolean, missionTypes:(System.Collections.Generic.IEnumerable*1Barotrauma*Identifier)|(fun():(Barotrauma.Identifier)), isSinglePlayer?:System.Boolean, difficultyLevel?:System.Nullable*1System*Single):(Barotrauma.Mission)
---@param locations (Barotrauma.Location-arr)|(Barotrauma.Location[])
---@param rand Barotrauma.MTRandom
---@param requireCorrectLocationType System.Boolean
---@param missionTypes (System.Collections.Generic.IEnumerable*1Barotrauma*Identifier)|(fun():(Barotrauma.Identifier))
---@param isSinglePlayer? System.Boolean
---@param difficultyLevel? System.Nullable*1System*Single
---@return Barotrauma.Mission
_G['Mission'].LoadRandom = function(locations, rand, requireCorrectLocationType, missionTypes, isSinglePlayer, difficultyLevel) end

---`Method Public Instance Virtual`
---@param sub Barotrauma.Submarine
---@return System.Single
_G['Mission'].GetBaseReward = function(sub) end

---`Method Public Instance`
---@param sub Barotrauma.Submarine
---@return System.Int32
_G['Mission'].GetReward = function(sub) end

---`Method NonPublic Instance`
---@param submarine Barotrauma.Submarine
_G['Mission'].InitCharacters = function(submarine) end

---`Method Private Instance`
---@param sub Barotrauma.Submarine
---@return Barotrauma.SpawnAction.SpawnLocationType
_G['Mission'].GetSpawnLocationTypeFromSubmarineType = function(sub) end

---`Method NonPublic Instance Virtual`
---@param humanPrefab Barotrauma.HumanPrefab
---@param element System.Xml.Linq.XElement
---@param submarine Barotrauma.Submarine
---@return Barotrauma.Character
_G['Mission'].LoadHuman = function(humanPrefab, element, submarine) end

---`Method NonPublic Instance Virtual`
---@param monsterPrefab Barotrauma.CharacterPrefab
---@param element System.Xml.Linq.XElement
---@param submarine Barotrauma.Submarine
---@return Barotrauma.Character
_G['Mission'].LoadMonster = function(monsterPrefab, element, submarine) end

---`Method NonPublic Instance Virtual`
---@param character Barotrauma.Character
---@param element System.Xml.Linq.XElement
_G['Mission'].InitCharacter = function(character, element) end

---`Method Public Instance`
---@param level Barotrauma.Level
_G['Mission'].Start = function(level) end

---`Method NonPublic Instance Virtual`
---@param level Barotrauma.Level
_G['Mission'].StartMissionSpecific = function(level) end

---`Method Public Instance`
---@param deltaTime System.Single
_G['Mission'].Update = function(deltaTime) end

---`Method NonPublic Instance Virtual`
---@param deltaTime System.Single
_G['Mission'].UpdateMissionSpecific = function(deltaTime) end

---`Method NonPublic Instance`
---@param missionState System.Int32
_G['Mission'].ShowMessage = function(missionState) end

---`Method Private Instance`
---@param missionState System.Int32
_G['Mission'].ShowMessageProjSpecific = function(missionState) end

---`Method NonPublic Instance Virtual`
---@param message Barotrauma.LocalizedString
---@param color? System.Boolean
---@return Barotrauma.LocalizedString
_G['Mission'].ModifyMessage = function(message, color) end

---`Method Private Instance`
---@param state System.Int32
_G['Mission'].TryTriggerEvents = function(state) end

---`Method Private Instance`
---@param trigger Barotrauma.MissionPrefab.TriggerEvent
_G['Mission'].TryTriggerEvent = function(trigger) end

---`Method Private Instance`
---@param trigger Barotrauma.MissionPrefab.TriggerEvent
_G['Mission'].TriggerEvent = function(trigger) end

---`Method Public Instance`
_G['Mission'].End = function() end

---`Method NonPublic Instance Abstract Virtual`
---@return System.Boolean
_G['Mission'].DetermineCompleted = function() end

---`Method NonPublic Instance Virtual`
---@param completed System.Boolean
_G['Mission'].EndMissionSpecific = function(completed) end

---`Method Public Instance`
---@param sub Barotrauma.Submarine
---@return System.Int32
_G['Mission'].GetFinalReward = function(sub) end

---`Method Private Instance`
---@param sub Barotrauma.Submarine
_G['Mission'].CalculateFinalReward = function(sub) end

---`Method Private Instance`
---@return System.Single
_G['Mission'].CalculateDifficultyXPMultiplier = function() end

---`Method Private Instance`
_G['Mission'].GiveReward = function() end

---`Method Private Instance`
---@param crew (System.Collections.Generic.IEnumerable*1Barotrauma*Character)|(fun():(Barotrauma.Character))
---@param experienceGain System.Int32
_G['Mission'].DistributeExperienceToCrew = function(crew, experienceGain) end

---`Method Public Static`
---@param crew (System.Collections.Generic.IEnumerable*1Barotrauma*Character)|(fun():(Barotrauma.Character))
---@param rewardDistribution? System.Int32
---@return System.Int32
_G['Mission'].GetRewardDistibutionSum = function(crew, rewardDistribution) end

---`Method Public Static`
---@param rewardDistribution System.Int32
---@param crew (System.Collections.Generic.IEnumerable*1Barotrauma*Character)|(fun():(Barotrauma.Character))
---@param reward Barotrauma.Option*1System*Int32
---@return System.ValueTuple*1System*Int32*1System*Int32*1System*Single
_G['Mission'].GetRewardShare = function(rewardDistribution, crew, reward) end

---`Method NonPublic Instance`
---@param change Barotrauma.LocationTypeChange
_G['Mission'].ChangeLocationType = function(change) end

---`Method Public Instance Virtual`
---@param levelData Barotrauma.LevelData
_G['Mission'].AdjustLevelData = function(levelData) end

---`Method NonPublic Instance`
---@param element System.Xml.Linq.XElement
---@return Barotrauma.HumanPrefab
_G['Mission'].GetHumanPrefabFromElement = function(element) end

---`Method NonPublic Static`
---@param humanPrefab Barotrauma.HumanPrefab
---@param characters (System.Collections.Generic.List*1Barotrauma*Character)|(Barotrauma.Character[])
---@param characterItems (System.Collections.Generic.Dictionary*1Barotrauma*Character*1System*Collections*Generic*List*2Barotrauma*Item)|({[Barotrauma.Character]:((System.Collections.Generic.List*1Barotrauma*Item)|(Barotrauma.Item[]))})
---@param submarine Barotrauma.Submarine
---@param teamType Barotrauma.CharacterTeamType
---@param positionToStayIn? Barotrauma.ISpatialEntity
---@param humanPrefabRandSync? Barotrauma.Rand.RandSync
---@return Barotrauma.Character
_G['Mission'].CreateHuman = function(humanPrefab, characters, characterItems, submarine, teamType, positionToStayIn, humanPrefabRandSync) end

---`Method NonPublic Instance`
---@param element System.Xml.Linq.XElement
---@return Barotrauma.ItemPrefab
_G['Mission'].FindItemPrefab = function(element) end

---`Method NonPublic Instance`
---@param itemPrefab Barotrauma.ItemPrefab
---@param cargoRoomSub Barotrauma.Submarine-ref
---@return System.Nullable*1Microsoft*Xna*Framework*Vector2
_G['Mission'].GetCargoSpawnPosition = function(itemPrefab, cargoRoomSub) end

---`Method NonPublic Static`
---@param tags (System.Collections.Generic.IEnumerable*1Barotrauma*Identifier)|(fun():(Barotrauma.Identifier))
---@param levelData Barotrauma.LevelData
---@param submarineSelector (System.Func*1Barotrauma*SubmarineInfo*1System*Boolean)|(fun(arg:Barotrauma.SubmarineInfo):(System.Boolean))
---@param submarineTypeName System.String
---@return Barotrauma.SubmarineInfo
_G['Mission'].GetRandomSubmarineByTagsAndDifficulty = function(tags, levelData, submarineSelector, submarineTypeName) end

---`Constructor Public Instance`
---@param prefab Barotrauma.MissionPrefab
---@param locations (Barotrauma.Location-arr)|(Barotrauma.Location[])
---@param sub Barotrauma.Submarine
---@return Barotrauma.Mission
_G['Mission'] = function(prefab, locations, sub) end

---`Constructor Public Instance`
---@param prefab Barotrauma.MissionPrefab
---@param locations (Barotrauma.Location-arr)|(Barotrauma.Location[])
---@param sub Barotrauma.Submarine
---@return Barotrauma.Mission
_G['Mission'].__new = function(prefab, locations, sub) end

