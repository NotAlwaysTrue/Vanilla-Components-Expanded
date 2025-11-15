---@meta
---@class Barotrauma.NetLobbyScreen : Barotrauma.Screen
---`Field Private Instance`
---@field chatBox Barotrauma.GUIListBox
---`Field Private Instance`
---@field chatRow Barotrauma.GUILayoutGroup
---`Field Private Instance`
---@field serverLogReverseButton Barotrauma.GUIButton
---`Field Private Instance`
---@field serverLogBox Barotrauma.GUIListBox
---`Field Private Instance`
---@field serverLogFilterTicks Barotrauma.GUIListBox
---`Field Private Instance`
---@field playStyleIconContainer Barotrauma.GUIComponent
---`Field Private Instance`
---@field chatSelector Barotrauma.GUIDropDown
---`Field Private Instance`
---@field chatInput Barotrauma.GUITextBox
---`Field Private Instance`
---@field serverLogFilter Barotrauma.GUITextBox
---`Field Private Instance`
---@field micIcon Barotrauma.GUIImage
---`Field Private Instance`
---@field levelDifficultySlider Barotrauma.GUIScrollBar
---`Field Private Instance`
---@field traitorElements (System.Collections.Generic.List*1Barotrauma*GUIComponent)|(Barotrauma.GUIComponent[])
---`Field Private Instance`
---@field traitorProbabilitySlider Barotrauma.GUIScrollBar
---`Field Private Instance`
---@field traitorDangerGroup Barotrauma.GUILayoutGroup
---`Field Private Instance`
---@field outpostDropdown Barotrauma.GUIDropDown
---`Field Private Instance`
---@field outpostDropdownUpToDate System.Boolean
---`Field Private Instance`
---@field missionTypeTickBoxes (Barotrauma.GUITickBox-arr)|(Barotrauma.GUITickBox[])
---`Field Private Instance`
---@field missionTypeList Barotrauma.GUIListBox
---`Field Private Instance`
---@field joinOnGoingRoundButton Barotrauma.GUIButton
---`Field Private Instance`
---@field roundControlsHolder Barotrauma.GUILayoutGroup
---`Field Private Instance`
---@field spectateBox Barotrauma.GUITickBox
---`Field Private Instance`
---@field afkBox Barotrauma.GUITickBox
---`Field Private Instance`
---@field playerInfoContent Barotrauma.GUILayoutGroup
---`Field Private Instance`
---@field changesPendingText Barotrauma.GUIComponent
---`Field Private Instance`
---@field createPendingChangesText System.Boolean
---`Field Private Instance`
---@field subSearchBox Barotrauma.GUITextBox
---`Field Private Instance`
---@field subPreviewContainer Barotrauma.GUIComponent
---`Field Private Instance`
---@field autoRestartBox Barotrauma.GUITickBox
---`Field Private Instance`
---@field autoRestartText Barotrauma.GUITextBlock
---`Field Private Instance`
---@field shuttleTickBox Barotrauma.GUITickBox
---`Field Private Instance`
---@field backgroundSprite Barotrauma.Sprite
---`Field Private Instance`
---@field jobPreferencesButton Barotrauma.GUIButton
---`Field Private Instance`
---@field appearanceButton Barotrauma.GUIButton
---`Field Private Instance`
---@field characterInfoFrame Barotrauma.GUIFrame
---`Field Private Instance`
---@field appearanceFrame Barotrauma.GUIFrame
---`Field Private Instance`
---@field respawnModeSelection Barotrauma.GUISelectionCarousel*1Barotrauma*Networking*RespawnMode
---`Field Private Instance`
---@field respawnModeLabel Barotrauma.GUITextBlock
---`Field Private Instance`
---@field respawnIntervalElement Barotrauma.GUIComponent
---`Field Private Instance`
---@field midRoundRespawnSettings (System.Collections.Generic.List*1Barotrauma*GUIComponent)|(Barotrauma.GUIComponent[])
---`Field Private Instance`
---@field permadeathEnabledRespawnSettings (System.Collections.Generic.List*1Barotrauma*GUIComponent)|(Barotrauma.GUIComponent[])
---`Field Private Instance`
---@field permadeathDisabledRespawnSettings (System.Collections.Generic.List*1Barotrauma*GUIComponent)|(Barotrauma.GUIComponent[])
---`Field Private Instance`
---@field ironmanDisabledRespawnSettings (System.Collections.Generic.List*1Barotrauma*GUIComponent)|(Barotrauma.GUIComponent[])
---`Field Private Instance`
---@field campaignDisabledElements (System.Collections.Generic.List*1Barotrauma*GUIComponent)|(Barotrauma.GUIComponent[])
---`Field Private Instance`
---@field campaignHiddenElements (System.Collections.Generic.List*1Barotrauma*GUIComponent)|(Barotrauma.GUIComponent[])
---`Field Private Instance`
---@field pvpOnlyElements (System.Collections.Generic.List*1Barotrauma*GUIComponent)|(Barotrauma.GUIComponent[])
---`Field Private Instance`
---@field disembarkPerkSettings (System.Collections.Generic.List*1Barotrauma*GUIComponent)|(Barotrauma.GUIComponent[])
---`Field Private Instance`
---@field respawnSettings (System.Collections.Generic.List*1Barotrauma*GUIComponent)|(Barotrauma.GUIComponent[])
---`Field Private Instance`
---@field prevResolutionForJobSelectionFrame Microsoft.Xna.Framework.Point
---`Field Private Instance`
---@field micIconStyle Barotrauma.Identifier
---`Field Private Instance`
---@field micCheckTimer System.Single
---`Field Private Instance`
---@field autoRestartTimer System.Single
---`Field Private Instance`
---@field campaignCharacterInfo Barotrauma.CharacterInfo
---`Field Private Instance`
---@field clientDisabledElements (System.Collections.Generic.List*1Barotrauma*GUIComponent)|(Barotrauma.GUIComponent[])
---`Field Private Instance`
---@field clientHiddenElements (System.Collections.Generic.List*1Barotrauma*GUIComponent)|(Barotrauma.GUIComponent[])
---`Field Private Instance`
---@field botSettingsElements (System.Collections.Generic.List*1Barotrauma*GUIComponent)|(Barotrauma.GUIComponent[])
---`Field Private Instance`
---@field settingAssignedComponents (System.Collections.Generic.Dictionary*1Barotrauma*GUIComponent*1System*String)|({[Barotrauma.GUIComponent]:(System.String)})
---`Field Private Instance`
---@field chatPanelTabButtons (System.Collections.Generic.List*1Barotrauma*GUIButton)|(Barotrauma.GUIButton[])
---`Field Private Instance`
---@field publicOrPrivateText Barotrauma.GUITextBlock
---`Field Private Instance`
---@field playstyleText Barotrauma.GUITextBlock
---`Field Private Instance`
---@field selectedModeIndex System.Int32
---`Field Public Instance`
---@field PlayerList Barotrauma.GUIListBox
---`Field Public Instance`
---@field Team1Count System.Int32
---`Field Public Instance`
---@field Team2Count System.Int32
---`Field Private Instance`
---@field pvpTeamChoiceTeam1 Barotrauma.GUITextBlock
---`Field Private Instance`
---@field pvpTeamChoiceMiddleButton Barotrauma.GUITextBlock
---`Field Private Instance`
---@field pvpTeamChoiceTeam2 Barotrauma.GUITextBlock
---`Field Public Instance`
---@field SelectedSub Barotrauma.SubmarineInfo
---`Field Public Instance`
---@field SelectedEnemySub Barotrauma.SubmarineInfo
---`Field Public Instance`
---@field CampaignSetupUI Barotrauma.MultiPlayerCampaignSetupUI
---`Field Private Instance`
---@field gameModeSettingsContent Barotrauma.GUIFrame
---`Field Private Instance`
---@field gameModeSettingsLayout Barotrauma.GUILayoutGroup
---`Field Private Instance`
---@field upgradesTabButton Barotrauma.GUIButton
---`Field Private Instance`
---@field respawnTabButton Barotrauma.GUIButton
---`Field Private Instance`
---@field disembarkPerkSettingList Barotrauma.GUIListBox
---`Field Private Instance`
---@field disembarkPerkDisabledDisclaimer Barotrauma.GUIComponent
---`Field Private Instance`
---@field noPerksAvailableDisclaimer Barotrauma.GUIComponent
---`Field Private Instance`
---@field disembarkPerkFooterText Barotrauma.GUITextBlock
---`Field Private Instance`
---@field isUpdatingPerks System.Boolean
---`Field Private Instance`
---@field prevPlayStyle System.Nullable*1Barotrauma*Networking*PlayStyle
---`Field Private Instance`
---@field prevIsPublic System.Nullable*1System*Boolean
---`Field Public Instance`
---@field FailedSelectedSub System.Nullable*1Barotrauma*NetLobbyScreen*FailedSubInfo
---`Field Public Instance`
---@field FailedSelectedEnemySub System.Nullable*1Barotrauma*NetLobbyScreen*FailedSubInfo
---`Field Public Instance`
---@field FailedSelectedShuttle System.Nullable*1Barotrauma*NetLobbyScreen*FailedSubInfo
---`Field Public Instance`
---@field FailedCampaignSubs (System.Collections.Generic.List*1Barotrauma*NetLobbyScreen*FailedSubInfo)|(Barotrauma.NetLobbyScreen.FailedSubInfo[])
---`Field Public Instance`
---@field FailedOwnedSubs (System.Collections.Generic.List*1Barotrauma*NetLobbyScreen*FailedSubInfo)|(Barotrauma.NetLobbyScreen.FailedSubInfo[])
---`Field Private Instance`
---@field visibilityMenuOrder (System.Collections.Generic.List*1Barotrauma*SubmarineInfo)|(Barotrauma.SubmarineInfo[])
---`Field Private Instance`
---@field lastUpdateID System.UInt16
---`Field Private Instance`
---@field levelSeed System.String
---`Field Private Static`
---@field jobVariantTooltip Barotrauma.GUIComponent
---`Field Public Static`
---@field TeamChatSelected System.Boolean
---`Field Private Static`
---@field MicCheckInterval System.Single
---`Field Private Static`
---@field MainPanelWidth System.Single
---`Field Private Static`
---@field SidePanelWidth System.Single
---`Field Private Static`
---@field PanelSpacing System.Single
---`Field Public Static`
---@field PleaseWaitPopupUserData System.String
---`Field Public Static`
---@field SeparatistsIconUserData System.String
---`Field Public Static`
---@field CoalitionIconUserData System.String
---`Field Private Static`
---@field RoundStartWarningBoxUserData System.String
---`Getter Public Instance`
---@field ChatInput Barotrauma.GUITextBox
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field MissionTypeFrame Barotrauma.GUIFrame
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field CampaignSetupFrame Barotrauma.GUIFrame
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field CampaignFrame Barotrauma.GUIFrame
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field QuitCampaignButton Barotrauma.GUIButton
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field LevelSeedBox Barotrauma.GUITextBox
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field SettingsButton Barotrauma.GUIButton
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field ServerMessageButton Barotrauma.GUIButton
---`Getter Public Static`
---<br/>`Setter Public Static`
---@field JobInfoFrame Barotrauma.GUIButton
---`Getter Public Instance`
---@field Spectating System.Boolean
---`Getter Public Instance`
---@field AFKSelected System.Boolean
---`Getter Public Instance`
---@field PermadeathMode System.Boolean
---`Getter Public Instance`
---@field PermanentlyDead System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field PlayerFrame Barotrauma.GUIButton
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field SubVisibilityButton Barotrauma.GUIButton
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field CharacterAppearanceCustomizationMenu Barotrauma.CharacterInfo.AppearanceCustomizationMenu
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field JobSelectionFrame Barotrauma.GUIFrame
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field JobPreferenceContainer Barotrauma.GUIFrame
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field JobList Barotrauma.GUIListBox
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field CampaignCharacterDiscarded System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field FileTransferFrame Barotrauma.GUIComponent
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field FileTransferTitle Barotrauma.GUITextBlock
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field FileTransferProgressBar Barotrauma.GUIProgressBar
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field FileTransferProgressText Barotrauma.GUITextBlock
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field Favorite Barotrauma.GUITickBox
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field LogButtons Barotrauma.GUILayoutGroup
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field SubList Barotrauma.GUIListBox
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field ShuttleList Barotrauma.GUIDropDown
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field ModeList Barotrauma.GUIListBox
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field SelectedModeIndex System.Int32
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field HighlightedModeIndex System.Int32
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field CharacterNameBox Barotrauma.GUITextBox
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field TeamPreferenceListBox Barotrauma.GUIListBox
---`Getter Private Instance`
---@field TeamPreference Barotrauma.CharacterTeamType
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field StartButton Barotrauma.GUIButton
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field EndButton Barotrauma.GUIButton
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field ReadyToStartBox Barotrauma.GUITickBox
---`Getter Public Instance`
---@field SelectedShuttle Barotrauma.SubmarineInfo
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field UsingShuttle System.Boolean
---`Getter Public Instance`
---@field SelectedMode Barotrauma.GameModePreset
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field MissionTypes (System.Collections.Generic.IEnumerable*1Barotrauma*Identifier)|(fun():(Barotrauma.Identifier))
---`Getter Public Instance`
---@field JobPreferences (System.Collections.Generic.List*1Barotrauma*JobVariant)|(Barotrauma.JobVariant[])
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field LevelSeed System.String
---`Getter Private Static`
---@field PanelBorderSize System.Int32
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field LastUpdateID System.UInt16
_G['NetLobbyScreen'] = {}

---`Method Public Instance`
---@return (System.Collections.Generic.IReadOnlyList*1Barotrauma*SubmarineInfo)|(Barotrauma.SubmarineInfo[])
_G['NetLobbyScreen'].GetSubList = function() end

---`Method Private Static`
---@param parent Barotrauma.GUIComponent
---@return Microsoft.Xna.Framework.Point
_G['NetLobbyScreen'].GetSizeWithoutBorder = function(parent) end

---`Method Private Instance`
---@param component Barotrauma.GUIComponent
---@param settingName System.String
_G['NetLobbyScreen'].AssignComponentToServerSetting = function(component, settingName) end

---`Method Public Instance`
_G['NetLobbyScreen'].AssignComponentsToServerSettings = function() end

---`Method Private Instance`
---@param parent Barotrauma.GUIComponent
_G['NetLobbyScreen'].CreateServerInfoContents = function(parent) end

---`Method Private Instance`
---@param serverName System.String
---@param message System.String
_G['NetLobbyScreen'].CreateServerMessagePopup = function(serverName, message) end

---`Method Public Instance`
_G['NetLobbyScreen'].RefreshPlaystyleIcons = function() end

---`Method Private Instance`
---@param parent Barotrauma.GUIComponent
_G['NetLobbyScreen'].CreateGameModeDropdown = function(parent) end

---`Method Private Instance`
---@param parent Barotrauma.GUIComponent
_G['NetLobbyScreen'].CreateSubmarineListPanel = function(parent) end

---`Method Private Instance`
---@param parent Barotrauma.GUIComponent
_G['NetLobbyScreen'].CreateSubmarineInfoPanel = function(parent) end

---`Method Private Instance`
---@param parent Barotrauma.GUIComponent
---@return Barotrauma.GUIComponent
_G['NetLobbyScreen'].CreateGameModePanel = function(parent) end

---`Method Private Instance`
---@param parent Barotrauma.GUIComponent
---@return Barotrauma.GUIComponent
_G['NetLobbyScreen'].CreateGameModeSettingsPanel = function(parent) end

---`Method Private Instance`
_G['NetLobbyScreen'].SelectRespawnTab = function() end

---`Method Private Instance`
_G['NetLobbyScreen'].SelectUpgradesTab = function() end

---`Method Private Instance`
---@param buttonToEnable Barotrauma.GUIButton
---@param buttonToDisable Barotrauma.GUIButton
---@param elementsToEnable (System.Collections.Generic.ICollection*1Barotrauma*GUIComponent)|(fun():(Barotrauma.GUIComponent))
---@param elementsToDisable (System.Collections.Generic.ICollection*1Barotrauma*GUIComponent)|(fun():(Barotrauma.GUIComponent))
_G['NetLobbyScreen'].SelectTabShared = function(buttonToEnable, buttonToDisable, elementsToEnable, elementsToDisable) end

---`Method Private Instance`
---@param parent Barotrauma.GUIComponent
---@return Barotrauma.GUIComponent
_G['NetLobbyScreen'].CreateGeneralSettingsPanel = function(parent) end

---`Method Public Instance`
---@param parent Barotrauma.GUIComponent
_G['NetLobbyScreen'].CreateDisembarkPointPanel = function(parent) end

---`Method Private Instance`
---@param box Barotrauma.GUIListBox
_G['NetLobbyScreen'].UpdatePerkFooterText = function(box) end

---`Method Public Instance`
_G['NetLobbyScreen'].UpdateDisembarkPointListFromServerSettings = function() end

---`Method Public Static`
---@param info Barotrauma.SubmarineInfo
_G['NetLobbyScreen'].SelectShuttle = function(info) end

---`Method Public Static`
---@param textTag System.String
---@param parent Barotrauma.GUIComponent
---@param toolTipTag? System.String
---@return Barotrauma.GUITextBlock
_G['NetLobbyScreen'].CreateSubHeader = function(textTag, parent, toolTipTag) end

---`Method Public Static`
---@overload fun(parent:Barotrauma.GUIComponent, headerTag:System.String, valueLabelTag:System.String, tooltipTag:System.String, slider:Barotrauma.GUIScrollBar-ref, label:Barotrauma.GUITextBlock-ref, step?:System.Nullable*1System*Single, range?:System.Nullable*1Microsoft*Xna*Framework*Vector2):(Barotrauma.GUIComponent)
---@param parent Barotrauma.GUIComponent
---@param headerTag System.String
---@param valueLabelTag System.String
---@param tooltipTag System.String
---@param slider Barotrauma.GUIScrollBar-ref
---@param label Barotrauma.GUITextBlock-ref
---@param header Barotrauma.GUITextBlock-ref
---@param step? System.Nullable*1System*Single
---@param range? System.Nullable*1Microsoft*Xna*Framework*Vector2
---@return Barotrauma.GUIComponent
_G['NetLobbyScreen'].CreateLabeledSlider = function(parent, headerTag, valueLabelTag, tooltipTag, slider, label, header, step, range) end

---`Method Public Static`
---@param parent Barotrauma.GUIComponent
---@param labelTag System.String
---@param min System.Int32
---@param max System.Int32
---@param toolTipTag? System.String
---@param font? Barotrauma.GUIFont
---@return Barotrauma.GUINumberInput
_G['NetLobbyScreen'].CreateLabeledNumberInput = function(parent, labelTag, min, max, toolTipTag, font) end

---`Method Public Static`
---@param parent Barotrauma.GUIComponent
---@param labelTag System.String
---@param numElements System.Int32
---@param toolTipTag? System.String
---@return Barotrauma.GUIDropDown
_G['NetLobbyScreen'].CreateLabeledDropdown = function(parent, labelTag, numElements, toolTipTag) end

---`Method Private Instance`
---@param rightPanel Barotrauma.GUIComponent
_G['NetLobbyScreen'].CreateSidePanelContents = function(rightPanel) end

---`Method Private Instance`
---@param bottomBar Barotrauma.GUIComponent
_G['NetLobbyScreen'].CreateBottomPanelContents = function(bottomBar) end

---`Method Public Instance`
_G['NetLobbyScreen'].StopWaitingForStartRound = function() end

---`Method Public Static`
---@param startButton Barotrauma.GUIButton
---@return (System.Collections.Generic.IEnumerable*1Barotrauma*CoroutineStatus)|(fun():(Barotrauma.CoroutineStatus))
_G['NetLobbyScreen'].WaitForStartRound = function(startButton) end

---`Method Public Instance Virtual`
_G['NetLobbyScreen'].Deselect = function() end

---`Method Public Instance Virtual`
_G['NetLobbyScreen'].Select = function() end

---`Method Public Instance`
_G['NetLobbyScreen'].RefreshEnabledElements = function() end

---`Method Public Instance`
_G['NetLobbyScreen'].ShowSpectateButton = function() end

---`Method Public Instance`
---@param newCampaignCharacterInfo Barotrauma.CharacterInfo
_G['NetLobbyScreen'].SetCampaignCharacterInfo = function(newCampaignCharacterInfo) end

---`Method Private Instance`
---@overload fun(characterInfo:Barotrauma.CharacterInfo, allowEditing?:System.Boolean)
---@param characterInfo Barotrauma.CharacterInfo
---@param allowEditing System.Boolean
---@param parent Barotrauma.GUIComponent
---@param createPendingText? System.Boolean
_G['NetLobbyScreen'].UpdatePlayerFrame = function(characterInfo, allowEditing, parent, createPendingText) end

---`Method Public Instance`
---@param parent Barotrauma.GUIComponent
---@param createPendingText? System.Boolean
---@param alwaysAllowEditing? System.Boolean
_G['NetLobbyScreen'].CreatePlayerFrame = function(parent, createPendingText, alwaysAllowEditing) end

---`Method Public Instance`
---@param preference Barotrauma.CharacterTeamType
_G['NetLobbyScreen'].UpdateSelectedSub = function(preference) end

---`Method Public Instance`
---@param onYes (System.Action)|(fun())
_G['NetLobbyScreen'].TryDiscardCampaignCharacter = function(onYes) end

---`Method Private Instance`
_G['NetLobbyScreen'].CreateChangesPendingText = function() end

---`Method Public Static`
---@param parent Barotrauma.GUIComponent
_G['NetLobbyScreen'].CreateChangesPendingFrame = function(parent) end

---`Method Private Static`
---@param jobPrefab Barotrauma.JobPrefab
---@param team Barotrauma.CharacterTeamType
---@param variant System.Int32
---@param isPvPMode System.Boolean
---@param parentSlot Barotrauma.GUIComponent
_G['NetLobbyScreen'].CreateJobVariantTooltip = function(jobPrefab, team, variant, isPvPMode, parentSlot) end

---`Method Private Instance`
---@param dangerLevel System.Int32
_G['NetLobbyScreen'].SetTraitorDangerIndicators = function(dangerLevel) end

---`Method Public Instance`
---@param tickBox Barotrauma.GUITickBox
---@return System.Boolean
_G['NetLobbyScreen'].ToggleSpectate = function(tickBox) end

---`Method Public Instance`
---@param spectate System.Boolean
_G['NetLobbyScreen'].SetSpectate = function(spectate) end

---`Method Public Instance`
_G['NetLobbyScreen'].RefreshPvpTeamSelectionButtons = function() end

---`Method Public Instance`
_G['NetLobbyScreen'].ResetPvpTeamSelection = function() end

---`Method Public Instance`
---@param allowSpectating System.Boolean
_G['NetLobbyScreen'].SetAllowSpectating = function(allowSpectating) end

---`Method Public Instance`
---@param allowAFK System.Boolean
_G['NetLobbyScreen'].SetAllowAFK = function(allowAFK) end

---`Method Public Instance`
---@param enabled System.Boolean
---@param timer? System.Single
_G['NetLobbyScreen'].SetAutoRestart = function(enabled, timer) end

---`Method Public Instance`
---@param missionTypes (System.Collections.Generic.IEnumerable*1Barotrauma*Identifier)|(fun():(Barotrauma.Identifier))
_G['NetLobbyScreen'].SetMissionTypes = function(missionTypes) end

---`Method Private Instance`
_G['NetLobbyScreen'].RefreshOutpostDropdown = function() end

---`Method Public Instance`
---@param subList Barotrauma.GUIComponent
---@param submarines (System.Collections.Generic.IEnumerable*1Barotrauma*SubmarineInfo)|(fun():(Barotrauma.SubmarineInfo))
_G['NetLobbyScreen'].UpdateSubList = function(subList, submarines) end

---`Method Private Instance`
---@param subList Barotrauma.GUIComponent
---@param sub Barotrauma.SubmarineInfo
_G['NetLobbyScreen'].AddSubmarine = function(subList, sub) end

---`Method Private Instance`
---@param parent Barotrauma.GUIComponent
---@param sub Barotrauma.SubmarineInfo
---@param subTextBlock Barotrauma.GUITextBlock
---@param subList Barotrauma.GUIComponent
_G['NetLobbyScreen'].CreateSubmarineClassText = function(parent, sub, subTextBlock, subList) end

---`Method Public Instance`
---@param component Barotrauma.GUIComponent
---@param userData System.Object
---@return System.Boolean
_G['NetLobbyScreen'].VotableClicked = function(component, userData) end

---`Method Public Instance`
---@param client Barotrauma.Networking.Client
_G['NetLobbyScreen'].AddPlayer = function(client) end

---`Method Private Instance`
---@param client Barotrauma.Networking.Client
---@param ... Barotrauma.GUIComponent
---@return (System.Action*1Microsoft*Xna*Framework*Graphics*SpriteBatch*1Barotrauma*GUICustomComponent)|(fun(arg1:Microsoft.Xna.Framework.Graphics.SpriteBatch, arg2:Barotrauma.GUICustomComponent))
_G['NetLobbyScreen'].DrawDownloadThrobber = function(client, ...) end

---`Method Private Static`
---@param client Barotrauma.Networking.Client
---@param otherComponents (Barotrauma.GUIComponent-arr)|(Barotrauma.GUIComponent[])
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
---@param component Barotrauma.GUICustomComponent
_G['NetLobbyScreen'].DrawDownloadThrobber = function(client, otherComponents, spriteBatch, component) end

---`Method Public Instance`
---@param client Barotrauma.Networking.Client
_G['NetLobbyScreen'].SetPlayerNameAndJobPreference = function(client) end

---`Method Public Instance`
---@param client Barotrauma.Networking.Client
---@param muted System.Boolean
---@param mutedLocally System.Boolean
_G['NetLobbyScreen'].SetPlayerVoiceIconState = function(client, muted, mutedLocally) end

---`Method Public Instance`
---@param client Barotrauma.Networking.Client
_G['NetLobbyScreen'].SetPlayerSpeaking = function(client) end

---`Method Public Instance`
---@param client Barotrauma.Networking.Client
_G['NetLobbyScreen'].RemovePlayer = function(client) end

---`Method Public Static`
---@param area Barotrauma.GUITextBlock.ClickableArea
---@return Barotrauma.Networking.Client
_G['NetLobbyScreen'].ExtractClientFromClickableArea = function(area) end

---`Method Public Instance`
---@overload fun(component:Barotrauma.GUITextBlock, area:Barotrauma.GUITextBlock.ClickableArea)
---@param selectedClient Barotrauma.Networking.Client
---@return System.Boolean
_G['NetLobbyScreen'].SelectPlayer = function(selectedClient) end

---`Method Public Instance`
---@param component Barotrauma.GUITextBlock
---@param area Barotrauma.GUITextBlock.ClickableArea
_G['NetLobbyScreen'].ShowPlayerContextMenu = function(component, area) end

---`Method Public Static`
---@param client Barotrauma.Networking.Client
_G['NetLobbyScreen'].CreateModerationContextMenu = function(client) end

---`Method Private Instance`
---@param button Barotrauma.GUIButton
---@param userData System.Object
---@return System.Boolean
_G['NetLobbyScreen'].ClosePlayerFrame = function(button, userData) end

---`Method Public Static`
---@param client Barotrauma.Networking.Client
_G['NetLobbyScreen'].KickPlayer = function(client) end

---`Method Public Static`
---@param client Barotrauma.Networking.Client
_G['NetLobbyScreen'].BanPlayer = function(client) end

---`Method Public Instance Virtual`
_G['NetLobbyScreen'].AddToGUIUpdateList = function() end

---`Method Public Instance Virtual`
---@param deltaTime System.Double
_G['NetLobbyScreen'].Update = function(deltaTime) end

---`Method Public Static`
_G['NetLobbyScreen'].UpdateJobVariantSelectionIfNeeded = function() end

---`Method Private Instance`
---@param deltaTime System.Single
_G['NetLobbyScreen'].UpdateMicIcon = function(deltaTime) end

---`Method Public Instance Virtual`
---@param deltaTime System.Double
---@param graphics Microsoft.Xna.Framework.Graphics.GraphicsDevice
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
_G['NetLobbyScreen'].Draw = function(deltaTime, graphics, spriteBatch) end

---`Method Private Instance`
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
---@param component Barotrauma.GUICustomComponent
_G['NetLobbyScreen'].DrawServerBanner = function(spriteBatch, component) end

---`Method Private Static`
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
---@param component Barotrauma.GUICustomComponent
---@param jobVariant Barotrauma.JobVariant
---@param team Barotrauma.CharacterTeamType
---@param isPvPMode System.Boolean
---@param itemsPerRow System.Int32
_G['NetLobbyScreen'].DrawJobVariantItems = function(spriteBatch, component, jobVariant, team, isPvPMode, itemsPerRow) end

---`Method Public Instance`
---@param message Barotrauma.Networking.ChatMessage
_G['NetLobbyScreen'].NewChatMessage = function(message) end

---`Method Private Instance`
---@param button Barotrauma.GUIButton
---@param userData System.Object
---@return System.Boolean
_G['NetLobbyScreen'].SelectJobPreferencesTab = function(button, userData) end

---`Method Private Instance`
---@param button Barotrauma.GUIButton
---@param _ System.Object
---@return System.Boolean
_G['NetLobbyScreen'].SelectAppearanceTab = function(button, _) end

---`Method Public Instance`
---@return System.Boolean
_G['NetLobbyScreen'].SaveAppearance = function() end

---`Method Private Instance`
---@param _ Barotrauma.GUIButton
---@param obj System.Object
---@return System.Boolean
_G['NetLobbyScreen'].SwitchJob = function(_, obj) end

---`Method Private Instance`
---@param _ Barotrauma.GUIComponent
---@param __ System.Object
---@return System.Boolean
_G['NetLobbyScreen'].OpenJobSelection = function(_, __) end

---`Method Private Static`
---@param parent Barotrauma.GUIComponent
---@param jobPrefab Barotrauma.JobPrefab
---@param team Barotrauma.CharacterTeamType
---@param isPvPMode System.Boolean
---@param selectedByPlayer System.Boolean
---@return (Barotrauma.GUIImage-arr)|(Barotrauma.GUIImage[])
_G['NetLobbyScreen'].AddJobSpritesToGUIComponent = function(parent, jobPrefab, team, isPvPMode, selectedByPlayer) end

---`Method Public Instance`
---@param modeIndex System.Int32
_G['NetLobbyScreen'].SelectMode = function(modeIndex) end

---`Method Public Instance`
---@param modeIndex System.Int32
_G['NetLobbyScreen'].HighlightMode = function(modeIndex) end

---`Method Private Instance`
_G['NetLobbyScreen'].RefreshMissionTypes = function() end

---`Method Private Instance`
_G['NetLobbyScreen'].RefreshGameModeSettingsContent = function() end

---`Method Private Instance`
_G['NetLobbyScreen'].RefreshGameModeContent = function() end

---`Method Public Instance`
_G['NetLobbyScreen'].RefreshStartButtonVisibility = function() end

---`Method Public Instance`
_G['NetLobbyScreen'].RefreshChatrow = function() end

---`Method Public Instance`
---@param enabled System.Boolean
_G['NetLobbyScreen'].ToggleCampaignMode = function(enabled) end

---`Method Public Instance`
---@param submarine Barotrauma.SubmarineInfo
_G['NetLobbyScreen'].TryDisplayCampaignSubmarine = function(submarine) end

---`Method Private Instance`
---@param button Barotrauma.GUIButton
---@param obj System.Object
---@return System.Boolean
_G['NetLobbyScreen'].ViewJobInfo = function(button, obj) end

---`Method Private Instance`
---@param button Barotrauma.GUIButton
---@param obj System.Object
---@return System.Boolean
_G['NetLobbyScreen'].CloseJobInfo = function(button, obj) end

---`Method Private Instance`
---@param characterInfo Barotrauma.CharacterInfo
_G['NetLobbyScreen'].UpdateJobPreferences = function(characterInfo) end

---`Method Private Static`
---@param jobPrefab Barotrauma.JobVariant
---@param variantIndex System.Int32
---@param variantCount System.Int32
---@param slot Barotrauma.GUIComponent
---@return Barotrauma.GUIButton
_G['NetLobbyScreen'].CreateJobVariantButton = function(jobPrefab, variantIndex, variantCount, slot) end

---`Method Public Instance`
---@param subName System.String
---@param md5Hash System.String
---@param type Barotrauma.SelectedSubType
---@param subList Barotrauma.GUIListBox
---@param showPreview? System.Boolean
---@return System.Boolean
_G['NetLobbyScreen'].TrySelectSub = function(subName, md5Hash, type, subList, showPreview) end

---`Method Public Instance`
---@param serverSubmarine Barotrauma.SubmarineInfo
---@param deliveryData Barotrauma.NetLobbyScreen.SubmarineDeliveryData
---@return System.Boolean
_G['NetLobbyScreen'].CheckIfCampaignSubMatches = function(serverSubmarine, deliveryData) end

---`Method Private Instance`
---@param sub Barotrauma.SubmarineInfo
_G['NetLobbyScreen'].CreateSubPreview = function(sub) end

---`Method Private Instance`
_G['NetLobbyScreen'].RecalculateSubDescription = function() end

---`Method Private Instance`
_G['NetLobbyScreen'].CreateSubmarineVisibilityMenu = function() end

---`Method Public Instance`
_G['NetLobbyScreen'].UpdateSubVisibility = function() end

---`Method Public Instance`
_G['NetLobbyScreen'].OnRoundEnded = function() end

---`Method Public Instance`
---@param waitUntilTime Barotrauma.SerializableDateTime
---@param team1SubName System.String
---@param team1IncompatiblePerks (System.Collections.Immutable.ImmutableArray*1Barotrauma*DisembarkPerkPrefab)|(Barotrauma.DisembarkPerkPrefab[])
---@param team2SubName System.String
---@param team2IncompatiblePerks (System.Collections.Immutable.ImmutableArray*1Barotrauma*DisembarkPerkPrefab)|(Barotrauma.DisembarkPerkPrefab[])
_G['NetLobbyScreen'].ShowStartRoundWarning = function(waitUntilTime, team1SubName, team1IncompatiblePerks, team2SubName, team2IncompatiblePerks) end

---`Method Public Instance`
_G['NetLobbyScreen'].CloseStartRoundWarning = function() end

---`Method Public Instance`
---@param difficulty System.Single
_G['NetLobbyScreen'].SetLevelDifficulty = function(difficulty) end

---`Method Public Instance`
---@param botCount System.Int32
_G['NetLobbyScreen'].SetBotCount = function(botCount) end

---`Method Public Instance`
---@param botSpawnMode Barotrauma.Networking.BotSpawnMode
_G['NetLobbyScreen'].SetBotSpawnMode = function(botSpawnMode) end

---`Method Public Instance`
---@param probability System.Single
_G['NetLobbyScreen'].SetTraitorProbability = function(probability) end

---`Method Public Instance`
---@param dangerLevel System.Int32
_G['NetLobbyScreen'].SetTraitorDangerLevel = function(dangerLevel) end

---`Constructor Public Instance`
---@return Barotrauma.NetLobbyScreen
_G['NetLobbyScreen'] = function() end

---`Constructor Public Instance`
---@return Barotrauma.NetLobbyScreen
_G['NetLobbyScreen'].__new = function() end

