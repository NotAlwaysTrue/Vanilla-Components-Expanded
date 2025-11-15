---@meta
---@class Barotrauma.MissionPrefab : Barotrauma.PrefabWithUintIdentifier
---`Field Private Instance`
---@field portraits (System.Collections.Immutable.ImmutableArray*1Barotrauma*Sprite)|(Barotrauma.Sprite[])
---`Field Private Instance`
---@field hudIcon Barotrauma.Sprite
---`Field Private Instance`
---@field hudIconColor System.Nullable*1Microsoft*Xna*Framework*Color
---`Field Private Instance`
---@field overrideMusicOnState (System.Collections.Immutable.ImmutableDictionary*1System*Int32*1Barotrauma*Identifier)|({[System.Int32]:(Barotrauma.Identifier)})
---`Field Private Instance`
---@field constructor System.Reflection.ConstructorInfo
---`Field Public Instance`
---@field Type Barotrauma.Identifier
---`Field Public Instance`
---@field MissionClass System.Type
---`Field Public Instance`
---@field MultiplayerOnly System.Boolean
---`Field Public Instance`
---@field SingleplayerOnly System.Boolean
---`Field Public Instance`
---@field TextIdentifier Barotrauma.Identifier
---`Field Public Instance`
---@field Tags (System.Collections.Immutable.ImmutableHashSet*1Barotrauma*Identifier)|(Barotrauma.Identifier[])
---`Field Public Instance`
---@field Name Barotrauma.LocalizedString
---`Field Public Instance`
---@field Description Barotrauma.LocalizedString
---`Field Public Instance`
---@field SuccessMessage Barotrauma.LocalizedString
---`Field Public Instance`
---@field FailureMessage Barotrauma.LocalizedString
---`Field Public Instance`
---@field SonarLabel Barotrauma.LocalizedString
---`Field Public Instance`
---@field SonarIconIdentifier Barotrauma.Identifier
---`Field Public Instance`
---@field AchievementIdentifier Barotrauma.Identifier
---`Field Public Instance`
---@field ReputationRewards (System.Collections.Immutable.ImmutableList*1Barotrauma*MissionPrefab*ReputationReward)|(Barotrauma.MissionPrefab.ReputationReward[])
---`Field Public Instance`
---@field DataRewards (System.Collections.Generic.List*1System*ValueTuple*2Barotrauma*Identifier*2System*Object*2Barotrauma*SetDataAction*OperationType)|(System.ValueTuple*1Barotrauma*Identifier*1System*Object*1Barotrauma*SetDataAction*OperationType[])
---`Field Public Instance`
---@field Commonness System.Int32
---`Field Public Instance`
---@field Difficulty System.Nullable*1System*Int32
---`Field Public Instance`
---@field MinLevelDifficulty System.Int32
---`Field Public Instance`
---@field MaxLevelDifficulty System.Int32
---`Field Public Instance`
---@field Reward System.Int32
---`Field Public Instance`
---@field ExperienceMultiplier System.Single
---`Field Public Instance`
---@field Headers (System.Collections.Immutable.ImmutableArray*1Barotrauma*LocalizedString)|(Barotrauma.LocalizedString[])
---`Field Public Instance`
---@field Messages (System.Collections.Immutable.ImmutableArray*1Barotrauma*LocalizedString)|(Barotrauma.LocalizedString[])
---`Field Public Instance`
---@field AllowRetry System.Boolean
---`Field Public Instance`
---@field ShowSonarLabels System.Boolean
---`Field Public Instance`
---@field ShowInMenus System.Boolean
---`Field Public Instance`
---@field ShowStartMessage System.Boolean
---`Field Public Instance`
---@field IsSideObjective System.Boolean
---`Field Public Instance`
---@field AllowOtherMissionsInLevel System.Boolean
---`Field Public Instance`
---@field RequireWreck System.Boolean
---`Field Public Instance`
---@field RequireRuin System.Boolean
---`Field Public Instance`
---@field RequireBeaconStation System.Boolean
---`Field Public Instance`
---@field RequireThalamusWreck System.Boolean
---`Field Public Instance`
---@field SpawnBeaconStationInMiddle System.Boolean
---`Field Public Instance`
---@field AllowOutpostNPCs System.Boolean
---`Field Public Instance`
---@field ForceOutpostGenerationParameters Barotrauma.Identifier
---`Field Public Instance`
---@field ForceRespawnMode System.Nullable*1Barotrauma*Networking*RespawnMode
---`Field Public Instance`
---@field AllowOutpostSelectionFromTag Barotrauma.Identifier
---`Field Public Instance`
---@field LoadSubmarines System.Boolean
---`Field Public Instance`
---@field BlockLocationTypeChanges System.Boolean
---`Field Public Instance`
---@field ShowProgressBar System.Boolean
---`Field Public Instance`
---@field ShowProgressInNumbers System.Boolean
---`Field Public Instance`
---@field MaxProgressState System.Int32
---`Field Public Instance`
---@field ProgressBarLabel Barotrauma.LocalizedString
---`Field Public Instance`
---@field AllowedConnectionTypes (System.Collections.Generic.List*1System*ValueTuple*2Barotrauma*Identifier*2Barotrauma*Identifier)|(System.ValueTuple*1Barotrauma*Identifier*1Barotrauma*Identifier[])
---`Field Public Instance`
---@field AllowedLocationTypes (System.Collections.Generic.List*1Barotrauma*Identifier)|(Barotrauma.Identifier[])
---`Field Public Instance`
---@field RequiredLocationFaction Barotrauma.Identifier
---`Field Public Instance`
---@field UnhideEntitySubCategories (System.Collections.Generic.List*1System*String)|(System.String[])
---`Field Public Instance`
---@field TriggerEvents (System.Collections.Generic.List*1Barotrauma*MissionPrefab*TriggerEvent)|(Barotrauma.MissionPrefab.TriggerEvent[])
---`Field Public Instance`
---@field LocationTypeChangeOnCompleted Barotrauma.LocationTypeChange
---`Field Public Instance`
---@field ConfigElement Barotrauma.ContentXElement
---`Field Public Static`
---@field Prefabs (Barotrauma.PrefabCollection*1Barotrauma*MissionPrefab)|(fun():(Barotrauma.MissionPrefab))
---`Field Public Static`
---@field CoOpMissionClasses (System.Collections.Generic.Dictionary*1Barotrauma*Identifier*1System*Type)|({[Barotrauma.Identifier]:(System.Type)})
---`Field Public Static`
---@field PvPMissionClasses (System.Collections.Generic.Dictionary*1Barotrauma*Identifier*1System*Type)|({[Barotrauma.Identifier]:(System.Type)})
---`Field Public Static`
---@field HiddenMissionTypes (System.Collections.Generic.HashSet*1Barotrauma*Identifier)|(Barotrauma.Identifier[])
---`Field Public Static`
---@field MinDifficulty System.Int32
---`Field Public Static`
---@field MaxDifficulty System.Int32
---`Getter Public Instance`
---@field HasPortraits System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field Icon Barotrauma.Sprite
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field IconColor Microsoft.Xna.Framework.Color
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field DisplayTargetHudIcons System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field HudIconMaxDistance System.Single
---`Getter Public Instance`
---@field HudIcon Barotrauma.Sprite
---`Getter Public Instance`
---@field HudIconColor Microsoft.Xna.Framework.Color
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field ProgressBarColor Microsoft.Xna.Framework.Color
_G['MissionPrefab'] = {}

---`Method Public Instance`
---@param state System.Int32
---@return Barotrauma.Identifier
_G['MissionPrefab'].GetOverrideMusicType = function(state) end

---`Method Public Instance`
---@param randomSeed System.Int32
---@return Barotrauma.Sprite
_G['MissionPrefab'].GetPortrait = function(randomSeed) end

---`Method Private Instance`
---@param element Barotrauma.ContentXElement
---@return System.Type
_G['MissionPrefab'].FindMissionClass = function(element) end

---`Method Private Instance`
---@param element Barotrauma.ContentXElement
---@param missionClass System.Type
---@return System.Reflection.ConstructorInfo
_G['MissionPrefab'].FindMissionConstructor = function(element, missionClass) end

---`Method Private Instance`
---@param element Barotrauma.ContentXElement
_G['MissionPrefab'].InitProjSpecific = function(element) end

---`Method Public Instance`
---@param from Barotrauma.Location
---@param to Barotrauma.Location
---@return System.Boolean
_G['MissionPrefab'].IsAllowed = function(from, to) end

---`Method Public Instance`
---@param difficulty System.Single
---@return System.Boolean
_G['MissionPrefab'].IsAllowedDifficulty = function(difficulty) end

---`Method Public Instance`
---@param locations (Barotrauma.Location-arr)|(Barotrauma.Location[])
---@param sub Barotrauma.Submarine
---@return Barotrauma.Mission
_G['MissionPrefab'].Instantiate = function(locations, sub) end

---`Method Private Instance`
_G['MissionPrefab'].DisposeProjectSpecific = function() end

---`Method Public Instance Virtual`
_G['MissionPrefab'].Dispose = function() end

---`Method Public Static`
---@return (System.Collections.Generic.IEnumerable*1Barotrauma*Identifier)|(fun():(Barotrauma.Identifier))
_G['MissionPrefab'].GetAllMultiplayerSelectableMissionTypes = function() end

---`Constructor Public Instance`
---@overload fun(element:Barotrauma.ContentXElement, file:Barotrauma.MissionsFile):Barotrauma.MissionPrefab
---@return Barotrauma.MissionPrefab
_G['MissionPrefab'] = function() end

---`Constructor Public Instance`
---@overload fun(element:Barotrauma.ContentXElement, file:Barotrauma.MissionsFile):Barotrauma.MissionPrefab
---@return Barotrauma.MissionPrefab
_G['MissionPrefab'].__new = function() end

---`Constructor Private Static`
---@overload fun(element:Barotrauma.ContentXElement, file:Barotrauma.MissionsFile):Barotrauma.MissionPrefab
---@return Barotrauma.MissionPrefab
_G['MissionPrefab'] = function() end

---`Constructor Private Static`
---@overload fun(element:Barotrauma.ContentXElement, file:Barotrauma.MissionsFile):Barotrauma.MissionPrefab
---@return Barotrauma.MissionPrefab
_G['MissionPrefab'].__new = function() end

