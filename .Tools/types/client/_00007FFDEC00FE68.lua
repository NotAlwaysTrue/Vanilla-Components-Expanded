---@meta
---@class Barotrauma.GameSession : System.Object
---`Field Private Instance`
---@field tabMenu Barotrauma.TabMenu
---`Field Private Instance`
---@field topLeftButtonGroup Barotrauma.GUILayoutGroup
---`Field Private Instance`
---@field crewListButton Barotrauma.GUIButton
---`Field Private Instance`
---@field commandButton Barotrauma.GUIButton
---`Field Private Instance`
---@field tabMenuButton Barotrauma.GUIButton
---`Field Private Instance`
---@field talentPointNotification Barotrauma.GUIImage
---`Field Private Instance`
---@field deathChoiceInfoFrame Barotrauma.GUIComponent
---`Field Private Instance`
---@field deathChoiceButtonContainer Barotrauma.GUIComponent
---`Field Private Instance`
---@field respawnInfoText Barotrauma.GUITextBlock
---`Field Private Instance`
---@field deathChoiceTickBox Barotrauma.GUITickBox
---`Field Private Instance`
---@field takeOverBotButton Barotrauma.GUIButton
---`Field Private Instance`
---@field hrManagerButton Barotrauma.GUIButton
---`Field Public Instance`
---@field DeathPrompt Barotrauma.DeathPrompt
---`Field Private Instance`
---@field eventLogNotification Barotrauma.GUIImage
---`Field Private Instance`
---@field prevTopLeftButtonsResolution Microsoft.Xna.Framework.Point
---`Field Public Instance`
---@field EventManager Barotrauma.EventManager
---`Field Public Instance`
---@field GameMode Barotrauma.GameMode
---`Field Private Instance`
---@field dummyLocations (Barotrauma.Location-arr)|(Barotrauma.Location[])
---`Field Public Instance`
---@field CrewManager Barotrauma.CrewManager
---`Field Public Instance`
---@field TimeSpentCleaning System.Double
---`Field Public Instance`
---@field TimeSpentPainting System.Double
---`Field Private Instance`
---@field missions (System.Collections.Generic.List*1Barotrauma*Mission)|(Barotrauma.Mission[])
---`Field Private Instance`
---@field casualties (System.Collections.Generic.HashSet*1Barotrauma*Character)|(Barotrauma.Character[])
---`Field Private Instance`
---@field permadeathsPerAccount (System.Collections.Generic.Dictionary*1Barotrauma*Option*2Barotrauma*Networking*AccountId*1System*Int32)|({[Barotrauma.Option*1Barotrauma*Networking*AccountId]:(System.Int32)})
---`Field Public Instance`
---@field WinningTeam System.Nullable*1Barotrauma*CharacterTeamType
---`Field Public Instance`
---@field ForceOutpostModule Barotrauma.SubmarineInfo
---`Field Public Instance`
---@field OwnedSubmarines (System.Collections.Generic.List*1Barotrauma*SubmarineInfo)|(Barotrauma.SubmarineInfo[])
---`Field Private Instance`
---@field unlockedRecipes (System.Collections.Generic.HashSet*1System*ValueTuple*2Barotrauma*CharacterTeamType*2Barotrauma*Identifier)|(System.ValueTuple*1Barotrauma*CharacterTeamType*1Barotrauma*Identifier[])
---`Field Public Static`
---@field MinimumLoadingTime System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field RoundSummary Barotrauma.RoundSummary
---`Getter Public Static`
---@field IsTabMenuOpen System.Boolean
---`Getter Public Static`
---@field TabMenuInstance Barotrauma.TabMenu
---`Getter Public Instance`
---@field AllowHrManagerBotTakeover System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field LastSaveVersion System.Version
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field RoundDuration System.Single
---`Getter Public Instance`
---@field Missions (System.Collections.Generic.IEnumerable*1Barotrauma*Mission)|(fun():(Barotrauma.Mission))
---`Getter Public Instance`
---@field Casualties (System.Collections.Generic.IEnumerable*1Barotrauma*Character)|(fun():(Barotrauma.Character))
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field IsRunning System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field RoundEnding System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field Level Barotrauma.Level
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field LevelData Barotrauma.LevelData
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field MirrorLevel System.Boolean
---`Getter Public Instance`
---@field Map Barotrauma.Map
---`Getter Public Instance`
---@field Campaign Barotrauma.CampaignMode
---`Getter Public Instance`
---@field StartLocation Barotrauma.Location
---`Getter Public Instance`
---@field EndLocation Barotrauma.Location
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field SubmarineInfo Barotrauma.SubmarineInfo
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field EnemySubmarineInfo Barotrauma.SubmarineInfo
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Submarine Barotrauma.Submarine
---`Getter Public Instance`
---@field UnlockedRecipes (System.Collections.Generic.IEnumerable*1System*ValueTuple*2Barotrauma*CharacterTeamType*2Barotrauma*Identifier)|(fun():(System.ValueTuple*1Barotrauma*CharacterTeamType*1Barotrauma*Identifier))
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field DataPath Barotrauma.CampaignDataPath
---`Getter Public Instance`
---@field TraitorsEnabled System.Boolean
_G['GameSession'] = {}

---`Method Public Instance`
---@return System.Boolean
_G['GameSession'].ToggleTabMenu = function() end

---`Method Private Instance`
_G['GameSession'].CreateTopLeftButtons = function() end

---`Method Public Instance`
_G['GameSession'].AddToGUIUpdateList = function() end

---`Method Public Static`
---@param parent Barotrauma.GUIComponent
---@param offset? System.Boolean
---@return Barotrauma.GUIImage
_G['GameSession'].CreateNotificationIcon = function(parent, offset) end

---`Method Public Instance`
---@param enabled System.Boolean
_G['GameSession'].EnableEventLogNotificationIcon = function(enabled) end

---`Method Public Static`
---@param indicator Barotrauma.GUIImage
_G['GameSession'].UpdateTalentNotificationIndicator = function(indicator) end

---`Method Public Instance`
_G['GameSession'].HUDScaleChanged = function() end

---`Method Public Instance`
---@param text System.String
---@param textColor Microsoft.Xna.Framework.Color
---@param waitForNextRoundRespawn System.Boolean
---@param hideButtons? System.Boolean
_G['GameSession'].SetRespawnInfo = function(text, textColor, waitForNextRoundRespawn, hideButtons) end

---`Method Public Instance`
_G['GameSession'].RefreshAnyOpenPlayerInfo = function() end

---`Method Public Instance`
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
_G['GameSession'].Draw = function(spriteBatch) end

---`Method Public Instance`
---@param accountId Barotrauma.Option*1Barotrauma*Networking*AccountId
_G['GameSession'].IncrementPermadeath = function(accountId) end

---`Method Public Instance`
---@param accountId Barotrauma.Option*1Barotrauma*Networking*AccountId
---@return System.Int32
_G['GameSession'].PermadeathCountForAccount = function(accountId) end

---`Method Private Instance`
---@param submarineInfo Barotrauma.SubmarineInfo
---@param ownedSubmarines? (System.Collections.Generic.List*1Barotrauma*SubmarineInfo)|(Barotrauma.SubmarineInfo[])
_G['GameSession'].InitOwnedSubs = function(submarineInfo, ownedSubmarines) end

---`Method Private Instance`
---@param gameModePreset Barotrauma.GameModePreset
---@param seed System.String
---@param selectedSub Barotrauma.SubmarineInfo
---@param settings Barotrauma.CampaignSettings
---@param missionPrefabs? (System.Collections.Generic.IEnumerable*1Barotrauma*MissionPrefab)|(fun():(Barotrauma.MissionPrefab))
---@param missionTypes? (System.Collections.Generic.IEnumerable*1Barotrauma*Identifier)|(fun():(Barotrauma.Identifier))
---@return Barotrauma.GameMode
_G['GameSession'].InstantiateGameMode = function(gameModePreset, seed, selectedSub, settings, missionPrefabs, missionTypes) end

---`Method Public Static`
---@overload fun(levelData:Barotrauma.LevelData, forceLocationType?:Barotrauma.LocationType):((Barotrauma.Location-arr)|(Barotrauma.Location[]))
---@param seed System.String
---@param forceLocationType? Barotrauma.LocationType
---@return (Barotrauma.Location-arr)|(Barotrauma.Location[])
_G['GameSession'].CreateDummyLocations = function(seed, forceLocationType) end

---`Method Private Static`
---@param rand System.Random
---@param forceLocationType? Barotrauma.LocationType
---@return (Barotrauma.Location-arr)|(Barotrauma.Location[])
_G['GameSession'].CreateDummyLocations = function(rand, forceLocationType) end

---`Method Public Static`
---@param preset Barotrauma.GameModePreset
---@return System.Boolean
_G['GameSession'].ShouldApplyDisembarkPoints = function(preset) end

---`Method Public Instance`
_G['GameSession'].LoadPreviousSave = function() end

---`Method Public Instance`
---@param newSubmarine Barotrauma.SubmarineInfo
---@param transferItems System.Boolean
---@param client? Barotrauma.Networking.Client
_G['GameSession'].SwitchSubmarine = function(newSubmarine, transferItems, client) end

---`Method Public Instance`
---@param newSubmarine Barotrauma.SubmarineInfo
---@param client? Barotrauma.Networking.Client
---@return System.Boolean
_G['GameSession'].TryPurchaseSubmarine = function(newSubmarine, client) end

---`Method Public Instance`
---@param query Barotrauma.SubmarineInfo
---@return System.Boolean
_G['GameSession'].IsSubmarineOwned = function(query) end

---`Method Public Instance`
---@return System.Boolean
_G['GameSession'].IsCurrentLocationRadiated = function() end

---`Method Public Instance`
---@overload fun(levelSeed:System.String, difficulty?:System.Nullable*1System*Single, levelGenerationParams?:Barotrauma.LevelGenerationParams, forceBiome?:Barotrauma.Identifier)
---@param levelData Barotrauma.LevelData
---@param mirrorLevel? System.Boolean
---@param startOutpost? Barotrauma.SubmarineInfo
---@param endOutpost? Barotrauma.SubmarineInfo
_G['GameSession'].StartRound = function(levelData, mirrorLevel, startOutpost, endOutpost) end

---`Method Private Instance`
---@param moduleInfo Barotrauma.SubmarineInfo
---@param outpostSub Barotrauma.Submarine-ref
---@return System.Boolean
_G['GameSession'].TryGenerateStationAroundModule = function(moduleInfo, outpostSub) end

---`Method Private Instance`
---@param level Barotrauma.Level
_G['GameSession'].InitializeLevel = function(level) end

---`Method Public Static`
---@param sub Barotrauma.Submarine
---@param level Barotrauma.Level
---@param placeAtStart? System.Boolean
---@param forceDocking? System.Boolean
_G['GameSession'].PlaceSubAtInitialPosition = function(sub, level, placeAtStart, forceDocking) end

---`Method Public Instance`
---@param deltaTime System.Single
_G['GameSession'].Update = function(deltaTime) end

---`Method Public Instance`
---@param index System.Int32
---@return Barotrauma.Mission
_G['GameSession'].GetMission = function(index) end

---`Method Public Instance`
---@param mission Barotrauma.Mission
---@return System.Int32
_G['GameSession'].GetMissionIndex = function(mission) end

---`Method Public Instance`
---@param missionIdentifiers (System.Collections.Generic.List*1Barotrauma*Identifier)|(Barotrauma.Identifier[])
_G['GameSession'].EnforceMissionOrder = function(missionIdentifiers) end

---`Method Private Instance`
---@param deltaTime System.Single
_G['GameSession'].UpdateProjSpecific = function(deltaTime) end

---`Method Public Static`
---@param type Barotrauma.CharacterType
---@return (System.Collections.Immutable.ImmutableHashSet*1Barotrauma*Character)|(Barotrauma.Character[])
_G['GameSession'].GetSessionCrewCharacters = function(type) end

---`Method Public Instance`
---@param endMessage System.String
---@param transitionType? Barotrauma.CampaignMode.TransitionType
---@param traitorResults? System.Nullable*1Barotrauma*TraitorManager*TraitorResults
---@param createRoundSummary? System.Boolean
_G['GameSession'].EndRound = function(endMessage, transitionType, traitorResults, createRoundSummary) end

---`Method Public Instance`
_G['GameSession'].EndMissions = function() end

---`Method Public Static`
---@return Barotrauma.PerkCollection
_G['GameSession'].GetPerks = function() end

---`Method Public Static`
---@param preset Barotrauma.GameModePreset
---@param missionTypes (System.Collections.Generic.IEnumerable*1Barotrauma*Identifier)|(fun():(Barotrauma.Identifier))
---@return System.Boolean
_G['GameSession'].ValidatedDisembarkPoints = function(preset, missionTypes) end

---`Method Public Static`
---@param preset Barotrauma.GameModePreset
---@param missionTypes (System.Collections.Generic.IEnumerable*1Barotrauma*Identifier)|(fun():(Barotrauma.Identifier))
---@return System.Boolean
_G['GameSession'].ShouldIgnorePerksThatCanNotApplyWithoutSubmarine = function(preset, missionTypes) end

---`Method Private Instance`
_G['GameSession'].LogStartRoundStats = function() end

---`Method Public Instance`
---@param eventId System.String
---@param traitorResults? System.Nullable*1Barotrauma*TraitorManager*TraitorResults
_G['GameSession'].LogEndRoundStats = function(eventId, traitorResults) end

---`Method Public Instance`
---@param character Barotrauma.Character
_G['GameSession'].KillCharacter = function(character) end

---`Method Public Instance`
---@param character Barotrauma.Character
_G['GameSession'].ReviveCharacter = function(character) end

---`Method Public Instance`
---@param team Barotrauma.CharacterTeamType
---@param identifier Barotrauma.Identifier
---@param showNotifications System.Boolean
_G['GameSession'].UnlockRecipe = function(team, identifier, showNotifications) end

---`Method Public Instance`
---@param character Barotrauma.Character
---@param itemIdentifier Barotrauma.Identifier
---@return System.Boolean
_G['GameSession'].HasUnlockedRecipe = function(character, itemIdentifier) end

---`Method Public Static`
---@param contentPackageNames (System.Collections.Generic.IList*1System*String)|(System.String[])
---@param errorMsg Barotrauma.LocalizedString-ref
---@return System.Boolean
_G['GameSession'].IsCompatibleWithEnabledContentPackages = function(contentPackageNames, errorMsg) end

---`Method Public Instance`
---@param filePath System.String
---@param isSavingOnLoading System.Boolean
_G['GameSession'].Save = function(filePath, isSavingOnLoading) end

---`Constructor Private Instance`
---@overload fun(submarineInfo:Barotrauma.SubmarineInfo):Barotrauma.GameSession
---@overload fun(submarineInfo:Barotrauma.SubmarineInfo, enemySubmarineInfo:Barotrauma.SubmarineInfo):Barotrauma.GameSession
---@overload fun(submarineInfo:Barotrauma.SubmarineInfo, enemySub:Barotrauma.Option*1Barotrauma*SubmarineInfo, dataPath:Barotrauma.CampaignDataPath, gameModePreset:Barotrauma.GameModePreset, settings:Barotrauma.CampaignSettings, seed?:System.String, missionTypes?:(System.Collections.Generic.IEnumerable*1Barotrauma*Identifier)|(fun():(Barotrauma.Identifier))):Barotrauma.GameSession
---@overload fun(submarineInfo:Barotrauma.SubmarineInfo, enemySub:Barotrauma.Option*1Barotrauma*SubmarineInfo, gameModePreset:Barotrauma.GameModePreset, seed?:System.String, missionPrefabs?:(System.Collections.Generic.IEnumerable*1Barotrauma*MissionPrefab)|(fun():(Barotrauma.MissionPrefab))):Barotrauma.GameSession
---@param submarineInfo Barotrauma.SubmarineInfo
---@param ownedSubmarines (System.Collections.Generic.List*1Barotrauma*SubmarineInfo)|(Barotrauma.SubmarineInfo[])
---@param doc System.Xml.Linq.XDocument
---@param campaignData Barotrauma.CampaignDataPath
---@return Barotrauma.GameSession
_G['GameSession'] = function(submarineInfo, ownedSubmarines, doc, campaignData) end

---`Constructor Private Instance`
---@overload fun(submarineInfo:Barotrauma.SubmarineInfo):Barotrauma.GameSession
---@overload fun(submarineInfo:Barotrauma.SubmarineInfo, enemySubmarineInfo:Barotrauma.SubmarineInfo):Barotrauma.GameSession
---@overload fun(submarineInfo:Barotrauma.SubmarineInfo, enemySub:Barotrauma.Option*1Barotrauma*SubmarineInfo, dataPath:Barotrauma.CampaignDataPath, gameModePreset:Barotrauma.GameModePreset, settings:Barotrauma.CampaignSettings, seed?:System.String, missionTypes?:(System.Collections.Generic.IEnumerable*1Barotrauma*Identifier)|(fun():(Barotrauma.Identifier))):Barotrauma.GameSession
---@overload fun(submarineInfo:Barotrauma.SubmarineInfo, enemySub:Barotrauma.Option*1Barotrauma*SubmarineInfo, gameModePreset:Barotrauma.GameModePreset, seed?:System.String, missionPrefabs?:(System.Collections.Generic.IEnumerable*1Barotrauma*MissionPrefab)|(fun():(Barotrauma.MissionPrefab))):Barotrauma.GameSession
---@param submarineInfo Barotrauma.SubmarineInfo
---@param ownedSubmarines (System.Collections.Generic.List*1Barotrauma*SubmarineInfo)|(Barotrauma.SubmarineInfo[])
---@param doc System.Xml.Linq.XDocument
---@param campaignData Barotrauma.CampaignDataPath
---@return Barotrauma.GameSession
_G['GameSession'].__new = function(submarineInfo, ownedSubmarines, doc, campaignData) end

---`Constructor Public Instance`
---@overload fun(submarineInfo:Barotrauma.SubmarineInfo):Barotrauma.GameSession
---@overload fun(submarineInfo:Barotrauma.SubmarineInfo, enemySubmarineInfo:Barotrauma.SubmarineInfo):Barotrauma.GameSession
---@overload fun(submarineInfo:Barotrauma.SubmarineInfo, enemySub:Barotrauma.Option*1Barotrauma*SubmarineInfo, dataPath:Barotrauma.CampaignDataPath, gameModePreset:Barotrauma.GameModePreset, settings:Barotrauma.CampaignSettings, seed?:System.String, missionTypes?:(System.Collections.Generic.IEnumerable*1Barotrauma*Identifier)|(fun():(Barotrauma.Identifier))):Barotrauma.GameSession
---@overload fun(submarineInfo:Barotrauma.SubmarineInfo, enemySub:Barotrauma.Option*1Barotrauma*SubmarineInfo, gameModePreset:Barotrauma.GameModePreset, seed?:System.String, missionPrefabs?:(System.Collections.Generic.IEnumerable*1Barotrauma*MissionPrefab)|(fun():(Barotrauma.MissionPrefab))):Barotrauma.GameSession
---@param submarineInfo Barotrauma.SubmarineInfo
---@param ownedSubmarines (System.Collections.Generic.List*1Barotrauma*SubmarineInfo)|(Barotrauma.SubmarineInfo[])
---@param doc System.Xml.Linq.XDocument
---@param campaignData Barotrauma.CampaignDataPath
---@return Barotrauma.GameSession
_G['GameSession'] = function(submarineInfo, ownedSubmarines, doc, campaignData) end

---`Constructor Public Instance`
---@overload fun(submarineInfo:Barotrauma.SubmarineInfo):Barotrauma.GameSession
---@overload fun(submarineInfo:Barotrauma.SubmarineInfo, enemySubmarineInfo:Barotrauma.SubmarineInfo):Barotrauma.GameSession
---@overload fun(submarineInfo:Barotrauma.SubmarineInfo, enemySub:Barotrauma.Option*1Barotrauma*SubmarineInfo, dataPath:Barotrauma.CampaignDataPath, gameModePreset:Barotrauma.GameModePreset, settings:Barotrauma.CampaignSettings, seed?:System.String, missionTypes?:(System.Collections.Generic.IEnumerable*1Barotrauma*Identifier)|(fun():(Barotrauma.Identifier))):Barotrauma.GameSession
---@overload fun(submarineInfo:Barotrauma.SubmarineInfo, enemySub:Barotrauma.Option*1Barotrauma*SubmarineInfo, gameModePreset:Barotrauma.GameModePreset, seed?:System.String, missionPrefabs?:(System.Collections.Generic.IEnumerable*1Barotrauma*MissionPrefab)|(fun():(Barotrauma.MissionPrefab))):Barotrauma.GameSession
---@param submarineInfo Barotrauma.SubmarineInfo
---@param ownedSubmarines (System.Collections.Generic.List*1Barotrauma*SubmarineInfo)|(Barotrauma.SubmarineInfo[])
---@param doc System.Xml.Linq.XDocument
---@param campaignData Barotrauma.CampaignDataPath
---@return Barotrauma.GameSession
_G['GameSession'].__new = function(submarineInfo, ownedSubmarines, doc, campaignData) end

