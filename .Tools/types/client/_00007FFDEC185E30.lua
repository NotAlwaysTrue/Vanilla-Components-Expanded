---@meta
---@class Barotrauma.Networking.ServerSettings : System.Object
---`Field Private Instance`
---@field tempMonsterEnabled (System.Collections.Generic.Dictionary*1Barotrauma*Identifier*1System*Boolean)|({[Barotrauma.Identifier]:(System.Boolean)})
---`Field Private Instance`
---@field settingsFrame Barotrauma.GUIFrame
---`Field Private Instance`
---@field settingsTabs (System.Collections.Generic.Dictionary*1Barotrauma*Networking*ServerSettings*SettingsTab*1Barotrauma*GUIComponent)|({[Barotrauma.Networking.ServerSettings.SettingsTab]:(Barotrauma.GUIComponent)})
---`Field Private Instance`
---@field tabButtons (System.Collections.Generic.Dictionary*1Barotrauma*Networking*ServerSettings*SettingsTab*1Barotrauma*GUIButton)|({[Barotrauma.Networking.ServerSettings.SettingsTab]:(Barotrauma.GUIButton)})
---`Field Private Instance`
---@field selectedTab Barotrauma.Networking.ServerSettings.SettingsTab
---`Field Private Instance`
---@field karmaElements (System.Collections.Generic.List*1Barotrauma*GUIComponent)|(Barotrauma.GUIComponent[])
---`Field Private Instance`
---@field karmaPresetDD Barotrauma.GUIDropDown
---`Field Private Instance`
---@field karmaSettingsList Barotrauma.GUIListBox
---`Field Private Instance`
---@field extraCargoPanel Barotrauma.GUIComponent
---`Field Private Instance`
---@field monstersEnabledPanel Barotrauma.GUIComponent
---`Field Private Instance`
---@field extraCargoButton Barotrauma.GUIButton
---`Field Private Instance`
---@field monstersEnabledButton Barotrauma.GUIButton
---`Field Public Instance`
---@field ServerDetailsChanged System.Boolean
---`Field Private Instance`
---@field netProperties (System.Collections.Generic.Dictionary*1System*UInt32*1Barotrauma*Networking*ServerSettings*NetPropertyData)|({[System.UInt32]:(Barotrauma.Networking.ServerSettings.NetPropertyData)})
---`Field Private Instance`
---@field serverName System.String
---`Field Private Instance`
---@field serverMessageText System.String
---`Field Public Instance`
---@field Port System.Int32
---`Field Public Instance`
---@field QueryPort System.Int32
---`Field Public Instance`
---@field ListenIPAddress System.Net.IPAddress
---`Field Public Instance`
---@field EnableUPnP System.Boolean
---`Field Public Instance`
---@field ServerLog Barotrauma.Networking.ServerLog
---`Field Private Instance`
---@field selectedLevelDifficulty System.Single
---`Field Private Instance`
---@field password System.String
---`Field Public Instance`
---@field AutoRestartTimer System.Single
---`Field Private Instance`
---@field autoRestart System.Boolean
---`Field Private Instance`
---@field maxPlayers System.Int32
---`Field Private Instance`
---@field tickRate System.Int32
---`Field Private Instance`
---@field maxLagCompensation System.Int32
---`Field Private Instance`
---@field allowSpectating System.Boolean
---`Field Private Instance`
---@field allowAFK System.Boolean
---`Field Private Instance`
---@field voiceChatEnabled System.Boolean
---`Field Private Instance`
---@field playstyleSelection Barotrauma.Networking.PlayStyle
---`Field Private Instance`
---@field respawnMode Barotrauma.Networking.RespawnMode
---`Field Private Instance`
---@field traitorProbability System.Single
---`Field Private Instance`
---@field traitorDangerLevel System.Int32
---`Field Private Instance`
---@field traitorsMinPlayerCount System.Int32
---`Field Private Instance`
---@field subSelectionMode Barotrauma.Networking.SelectionMode
---`Field Private Instance`
---@field modeSelectionMode Barotrauma.Networking.SelectionMode
---`Field Private Instance`
---@field karmaEnabled System.Boolean
---`Field Private Instance`
---@field karmaPreset System.String
---`Field Private Instance`
---@field allowSubVoting System.Boolean
---`Field Private Instance`
---@field allowModeVoting System.Boolean
---`Field Private Static`
---@field packetAmountTooltip Barotrauma.LocalizedString
---`Field Private Static`
---@field packetAmountTooltipWarning Barotrauma.RichString
---`Field Public Static`
---@field SuppressNetworkMessages System.Boolean
---`Field Public Static`
---@field PermissionPresetFile System.String
---`Field Public Static`
---@field PermissionPresetFileCustom System.String
---`Field Public Static`
---@field PacketLimitMin System.Int32
---`Field Public Static`
---@field PacketLimitWarning System.Int32
---`Field Public Static`
---@field PacketLimitDefault System.Int32
---`Field Public Static`
---@field PacketLimitMax System.Int32
---`Field Public Static`
---@field SettingsFile System.String
---`Field Public Static`
---@field MaxExtraCargoItemsOfType System.Int32
---`Field Public Static`
---@field MaxExtraCargoItemTypes System.Int32
---`Field Public Static`
---@field DefaultTickRate System.Int32
---`Getter Public Instance Virtual`
---@field Name System.String
---`Getter Public Instance Virtual`
---<br/>`Setter Private Instance`
---@field SerializableProperties (System.Collections.Generic.Dictionary*1Barotrauma*Identifier*1Barotrauma*SerializableProperty)|({[Barotrauma.Identifier]:(Barotrauma.SerializableProperty)})
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field ServerName System.String
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field ServerMessageText System.String
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field MonsterEnabled (System.Collections.Generic.Dictionary*1Barotrauma*Identifier*1System*Boolean)|({[Barotrauma.Identifier]:(System.Boolean)})
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field ExtraCargo (System.Collections.Generic.Dictionary*1Barotrauma*ItemPrefab*1System*Int32)|({[Barotrauma.ItemPrefab]:(System.Int32)})
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field HiddenSubs (System.Collections.Generic.HashSet*1System*String)|(System.String[])
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field ClientPermissions (System.Collections.Generic.List*1Barotrauma*Networking*ServerSettings*SavedClientPermission)|(Barotrauma.Networking.ServerSettings.SavedClientPermission[])
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field IsPublic System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field TickRate System.Int32
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field MaxLagCompensation System.Int32
---`Getter Public Instance`
---@field MaxLagCompensationSeconds System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field RequireAuthentication System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field RandomizeSeed System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field UseRespawnShuttle System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field RespawnInterval System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field MaxTransportTime System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field MinRespawnRatio System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field SkillLossPercentageOnDeath System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field SkillLossPercentageOnImmediateRespawn System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field ReplaceCostPercentage System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field AllowBotTakeoverOnPermadeath System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field IronmanMode System.Boolean
---`Getter Public Instance`
---@field IronmanModeActive System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field AutoRestartInterval System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field StartWhenClientsReady System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field PvpTeamSelectionMode Barotrauma.PvpTeamSelectionMode
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field PvpAutoBalanceThreshold System.Int32
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field StartWhenClientsReadyRatio System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field PvPStunResist System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field PvPSpawnMonsters System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field PvPSpawnWrecks System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field Biome Barotrauma.Identifier
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field SelectedOutpostName Barotrauma.Identifier
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field AllowSpectating System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field AllowAFK System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field SaveServerLogs System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field AllowModDownloads System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field AllowFileTransfers System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field VoiceChatEnabled System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field PlayStyle Barotrauma.Networking.PlayStyle
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field LosMode Barotrauma.LosMode
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field ShowEnemyHealthBars Barotrauma.EnemyHealthBarMode
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field LinesPerLogFile System.Int32
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field AutoRestart System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field HasPassword System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field AllowVoteKick System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field AllowEndVoting System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field RespawnMode Barotrauma.Networking.RespawnMode
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field BotCount System.Int32
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field MaxBotCount System.Int32
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field BotSpawnMode Barotrauma.Networking.BotSpawnMode
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field DisableBotConversations System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field SelectedLevelDifficulty System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field AllowDisguises System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field AllowRewiring System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field AllowImmediateItemDelivery System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field LockAllDefaultWires System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field AllowLinkingWifiToChat System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field AllowFriendlyFire System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field AllowDragAndDropGive System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field DestructibleOutposts System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field KillableNPCs System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field BanAfterWrongPassword System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field MaxPasswordRetriesBeforeBan System.Int32
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field EnableDoSProtection System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field MaxPacketAmount System.Int32
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field SelectedSubmarine System.String
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field SelectedShuttle System.String
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field TraitorProbability System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field TraitorDangerLevel System.Int32
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field TraitorsMinPlayerCount System.Int32
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field MinPercentageOfPlayersForTraitorAccusation System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Language Barotrauma.LanguageIdentifier
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field SubSelectionMode Barotrauma.Networking.SelectionMode
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field ModeSelectionMode Barotrauma.Networking.SelectionMode
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field BanList Barotrauma.Networking.BanList
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field EndVoteRequiredRatio System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field VoteRequiredRatio System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field VoteTimeout System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field KickVoteRequiredRatio System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field DisallowKickVoteTime System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field KillDisconnectedTime System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field DespawnDisconnectedPermadeathTime System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field KickAFKTime System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field MinimumMidRoundSyncTimeout System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field KarmaEnabled System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field KarmaPreset System.String
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field GameModeIdentifier Barotrauma.Identifier
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field MissionTypes System.String
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field MaxPlayers System.Int32
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field AllowedRandomMissionTypes (System.Collections.Generic.List*1Barotrauma*Identifier)|(Barotrauma.Identifier[])
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field AutoBanTime System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field MaxAutoBanTime System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field LootedMoneyDestination Barotrauma.Networking.LootedMoneyDestination
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field MaximumMoneyTransferRequest System.Int32
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field NewCampaignDefaultSalary System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field TrackOpponentInPvP System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field DisembarkPointAllowance System.Int32
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field SelectedCoalitionPerks (Barotrauma.Identifier-arr)|(Barotrauma.Identifier[])
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field WinScorePvP System.Int32
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field SelectedSeparatistsPerks (Barotrauma.Identifier-arr)|(Barotrauma.Identifier[])
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field CampaignSettings Barotrauma.CampaignSettings
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field AllowSubVoting System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field AllowModeVoting System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field AllowedClientNameChars (System.Collections.Generic.List*1Barotrauma*Range*2System*Int32)|(Barotrauma.Range*1System*Int32[])
_G['ServerSettings'] = {}

---`Method Public Instance`
---@param incMsg Barotrauma.Networking.IReadMessage
_G['ServerSettings'].ClientAdminRead = function(incMsg) end

---`Method Public Instance`
---@param incMsg Barotrauma.Networking.IReadMessage
_G['ServerSettings'].ClientRead = function(incMsg) end

---`Method Public Static`
---@return System.Boolean
_G['ServerSettings'].HasPermissionToChangePerks = function() end

---`Method Public Instance`
_G['ServerSettings'].ClientAdminWritePerks = function() end

---`Method Public Instance`
---@param dataToSend Barotrauma.Networking.ServerSettings.NetFlags
---@param addedMissionType? Barotrauma.Identifier
---@param removedMissionType? Barotrauma.Identifier
---@param traitorDangerLevel? System.Int32
_G['ServerSettings'].ClientAdminWrite = function(dataToSend, addedMissionType, removedMissionType, traitorDangerLevel) end

---`Method Private Instance`
---@param name System.String
---@return Barotrauma.Networking.ServerSettings.NetPropertyData
_G['ServerSettings'].GetPropertyData = function(name) end

---`Method Public Instance`
---@param propertyName System.String
---@param component Barotrauma.GUIComponent
_G['ServerSettings'].AssignGUIComponent = function(propertyName, component) end

---`Method Public Instance`
_G['ServerSettings'].AddToGUIUpdateList = function() end

---`Method Private Instance`
_G['ServerSettings'].CreateSettingsFrame = function() end

---`Method Private Instance`
---@param parent Barotrauma.GUIComponent
---@param interactable System.Boolean
_G['ServerSettings'].SetElementInteractability = function(parent, interactable) end

---`Method Private Instance`
---@param parent Barotrauma.GUIComponent
_G['ServerSettings'].CreateServerIdentityTab = function(parent) end

---`Method Private Static`
_G['ServerSettings'].CreateChangePasswordPrompt = function() end

---`Method Private Instance`
---@param parent Barotrauma.GUIComponent
_G['ServerSettings'].CreateGeneralTab = function(parent) end

---`Method Private Instance`
---@return Barotrauma.GUIComponent
_G['ServerSettings'].CreateMonstersEnabledPanel = function() end

---`Method Private Instance`
---@return Barotrauma.GUIComponent
_G['ServerSettings'].CreateExtraCargoPanel = function() end

---`Method Private Instance`
---@param parent Barotrauma.GUIComponent
_G['ServerSettings'].CreateAntigriefingTab = function(parent) end

---`Method Private Instance`
---@param parent Barotrauma.GUIComponent
_G['ServerSettings'].CreateBanlistTab = function(parent) end

---`Method Private Instance`
---@param button Barotrauma.GUIButton
---@param obj System.Object
---@return System.Boolean
_G['ServerSettings'].SelectSettingsTab = function(button, obj) end

---`Method Public Instance`
_G['ServerSettings'].Close = function() end

---`Method Public Instance`
---@param button Barotrauma.GUIButton
---@param obj System.Object
---@return System.Boolean
_G['ServerSettings'].ToggleSettingsFrame = function(button, obj) end

---`Method Private Instance`
_G['ServerSettings'].InitProjSpecific = function() end

---`Method Public Instance`
---@param password System.String
_G['ServerSettings'].SetPassword = function(password) end

---`Method Public Static`
---@param password (System.Byte-arr)|(System.Byte[])
---@param salt System.Int32
---@return (System.Byte-arr)|(System.Byte[])
_G['ServerSettings'].SaltPassword = function(password, salt) end

---`Method Public Instance`
---@param input (System.Byte-arr)|(System.Byte[])
---@param salt System.Int32
---@return System.Boolean
_G['ServerSettings'].IsPasswordCorrect = function(input, salt) end

---`Method Private Instance`
_G['ServerSettings'].InitMonstersEnabled = function() end

---`Method Private Static`
---@param monsterEnabled (System.Collections.Generic.IReadOnlyDictionary*1Barotrauma*Identifier*1System*Boolean)|({[Barotrauma.Identifier]:(System.Boolean)})
---@return (System.Collections.Generic.IReadOnlyList*1Barotrauma*Identifier)|(Barotrauma.Identifier[])
_G['ServerSettings'].ExtractAndSortKeys = function(monsterEnabled) end

---`Method Public Instance`
---@param inc Barotrauma.Networking.IReadMessage
---@return System.Boolean
_G['ServerSettings'].ReadMonsterEnabled = function(inc) end

---`Method Public Instance`
---@param msg Barotrauma.Networking.IWriteMessage
---@param monsterEnabled? (System.Collections.Generic.Dictionary*1Barotrauma*Identifier*1System*Boolean)|({[Barotrauma.Identifier]:(System.Boolean)})
_G['ServerSettings'].WriteMonsterEnabled = function(msg, monsterEnabled) end

---`Method Public Instance`
---@param msg Barotrauma.Networking.IReadMessage
---@return System.Boolean
_G['ServerSettings'].ReadExtraCargo = function(msg) end

---`Method Public Instance`
---@param msg Barotrauma.Networking.IWriteMessage
_G['ServerSettings'].WriteExtraCargo = function(msg) end

---`Method Public Instance`
---@param msg Barotrauma.Networking.IWriteMessage
_G['ServerSettings'].WritePerks = function(msg) end

---`Method Public Instance`
---@param msg Barotrauma.Networking.IReadMessage
---@return System.Boolean
_G['ServerSettings'].ReadPerks = function(msg) end

---`Method Public Instance`
---@param msg Barotrauma.Networking.IReadMessage
_G['ServerSettings'].ReadHiddenSubs = function(msg) end

---`Method Public Instance`
---@param msg Barotrauma.Networking.IWriteMessage
_G['ServerSettings'].WriteHiddenSubs = function(msg) end

---`Method Public Instance`
---@param setter (System.Action*1Barotrauma*Identifier*1System*Object)|(fun(arg1:Barotrauma.Identifier, arg2:System.Object))
_G['ServerSettings'].UpdateServerListInfo = function(setter) end

---`Method Private Instance`
---@overload fun()
---@param availableMissionClasses (System.Collections.Generic.IEnumerable*1System*Type)|(fun():(System.Type))
_G['ServerSettings'].ValidateMissionTypes = function(availableMissionClasses) end

---`Constructor Public Instance`
---@overload fun(networkMember:Barotrauma.Networking.NetworkMember, serverName:System.String, port:System.Int32, queryPort:System.Int32, maxPlayers:System.Int32, isPublic:System.Boolean, enableUPnP:System.Boolean, listenIp:System.Net.IPAddress):Barotrauma.Networking.ServerSettings
---@return Barotrauma.Networking.ServerSettings
_G['ServerSettings'] = function() end

---`Constructor Public Instance`
---@overload fun(networkMember:Barotrauma.Networking.NetworkMember, serverName:System.String, port:System.Int32, queryPort:System.Int32, maxPlayers:System.Int32, isPublic:System.Boolean, enableUPnP:System.Boolean, listenIp:System.Net.IPAddress):Barotrauma.Networking.ServerSettings
---@return Barotrauma.Networking.ServerSettings
_G['ServerSettings'].__new = function() end

---`Constructor Private Static`
---@overload fun(networkMember:Barotrauma.Networking.NetworkMember, serverName:System.String, port:System.Int32, queryPort:System.Int32, maxPlayers:System.Int32, isPublic:System.Boolean, enableUPnP:System.Boolean, listenIp:System.Net.IPAddress):Barotrauma.Networking.ServerSettings
---@return Barotrauma.Networking.ServerSettings
_G['ServerSettings'] = function() end

---`Constructor Private Static`
---@overload fun(networkMember:Barotrauma.Networking.NetworkMember, serverName:System.String, port:System.Int32, queryPort:System.Int32, maxPlayers:System.Int32, isPublic:System.Boolean, enableUPnP:System.Boolean, listenIp:System.Net.IPAddress):Barotrauma.Networking.ServerSettings
---@return Barotrauma.Networking.ServerSettings
_G['ServerSettings'].__new = function() end

