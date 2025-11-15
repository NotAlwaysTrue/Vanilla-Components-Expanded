---@meta
---@class Barotrauma.TabMenu : System.Object
---`Field Private Instance`
---@field infoFrame Barotrauma.GUIFrame
---`Field Private Instance`
---@field contentFrame Barotrauma.GUIFrame
---`Field Private Instance`
---@field tabButtons (System.Collections.Generic.List*1Barotrauma*GUIButton)|(Barotrauma.GUIButton[])
---`Field Private Instance`
---@field infoFrameHolder Barotrauma.GUIFrame
---`Field Private Instance`
---@field linkedGUIList (System.Collections.Generic.List*1Barotrauma*TabMenu*LinkedGUI)|(Barotrauma.TabMenu.LinkedGUI[])
---`Field Private Instance`
---@field logList Barotrauma.GUIListBox
---`Field Private Instance`
---@field crewListArray (Barotrauma.GUIListBox-arr)|(Barotrauma.GUIListBox[])
---`Field Private Instance`
---@field sizeMultiplier System.Single
---`Field Private Instance`
---@field crew (System.Collections.Generic.IEnumerable*1Barotrauma*Character)|(fun():(Barotrauma.Character))
---`Field Private Instance`
---@field teamIDs (System.Collections.Generic.List*1Barotrauma*CharacterTeamType)|(Barotrauma.CharacterTeamType[])
---`Field Private Instance`
---@field isTransferMenuOpen System.Boolean
---`Field Private Instance`
---@field isSending System.Boolean
---`Field Private Instance`
---@field transferMenu Barotrauma.GUIComponent
---`Field Private Instance`
---@field transferMenuButton Barotrauma.GUIButton
---`Field Private Instance`
---@field transferMenuOpenState System.Single
---`Field Private Instance`
---@field transferMenuStateCompleted System.Boolean
---`Field Private Instance`
---@field registeredEvents (System.Collections.Generic.HashSet*1Barotrauma*Identifier)|(Barotrauma.Identifier[])
---`Field Private Instance`
---@field talentMenu Barotrauma.TalentMenu
---`Field Private Instance`
---@field jobColumnWidth System.Int32
---`Field Private Instance`
---@field characterColumnWidth System.Int32
---`Field Private Instance`
---@field pingColumnWidth System.Int32
---`Field Private Instance`
---@field walletColumnWidth System.Int32
---`Field Private Instance`
---@field deathColumnWidth System.Int32
---`Field Private Instance`
---@field killColumnWidth System.Int32
---`Field Private Instance`
---@field talentPointNotification Barotrauma.GUIImage
---`Field Private Instance`
---@field eventLogNotification Barotrauma.GUIImage
---`Field Public Static`
---@field PendingChanges System.Boolean
---`Field Private Static`
---@field initialized System.Boolean
---`Field Private Static`
---@field spectateIcon Barotrauma.UISprite
---`Field Private Static`
---@field disconnectedIcon Barotrauma.UISprite
---`Field Private Static`
---@field ownerIcon Barotrauma.Sprite
---`Field Private Static`
---@field moderatorIcon Barotrauma.Sprite
---`Field Public Static`
---@field PendingChangesFrame Barotrauma.GUIFrame
---`Field Public Static`
---@field OwnCharacterBGColor Microsoft.Xna.Framework.Color
---`Field Private Static`
---@field storedMessages (System.Collections.Generic.List*1System*ValueTuple*2System*String*2Barotrauma*Networking*PlayerConnectionChangeType)|(System.ValueTuple*1System*String*1Barotrauma*Networking*PlayerConnectionChangeType[])
---`Field Private Static`
---@field inLobbyString System.String
---`Field Private Static`
---@field JobColumnWidthPercentage System.Single
---`Field Private Static`
---@field CharacterColumnWidthPercentage System.Single
---`Field Private Static`
---@field KillColumnWidthPercentage System.Single
---`Field Private Static`
---@field DeathColumnWidthPercentage System.Single
---`Field Private Static`
---@field PingColumnWidthPercentage System.Single
---`Field Private Static`
---@field WalletColumnWidthPercentage System.Single
---`Getter Public Static`
---<br/>`Setter Private Static`
---@field SelectedTab Barotrauma.TabMenu.InfoFrameTab
_G['TabMenu'] = {}

---`Method Public Instance`
_G['TabMenu'].Initialize = function() end

---`Method Public Instance`
---@param deltaTime System.Single
_G['TabMenu'].Update = function(deltaTime) end

---`Method Public Instance`
_G['TabMenu'].AddToGUIUpdateList = function() end

---`Method Public Static`
_G['TabMenu'].OnRoundEnded = function() end

---`Method Private Instance`
---@param selectedTab Barotrauma.TabMenu.InfoFrameTab
_G['TabMenu'].CreateInfoFrame = function(selectedTab) end

---`Method Public Instance`
---@param selectedTab Barotrauma.TabMenu.InfoFrameTab
_G['TabMenu'].SelectInfoFrameTab = function(selectedTab) end

---`Method Private Instance`
---@param crewFrame Barotrauma.GUIFrame
_G['TabMenu'].CreateCrewListFrame = function(crewFrame) end

---`Method Private Instance`
---@param headerFrame Barotrauma.GUILayoutGroup
_G['TabMenu'].CreateSinglePlayerListContentHolder = function(headerFrame) end

---`Method Private Instance`
---@param refresh System.Boolean
_G['TabMenu'].CreateSinglePlayerList = function(refresh) end

---`Method Private Instance`
---@param character Barotrauma.Character
---@param i System.Int32
_G['TabMenu'].CreateSinglePlayerCharacterElement = function(character, i) end

---`Method Private Instance`
---@param headerFrame Barotrauma.GUILayoutGroup
_G['TabMenu'].CreateMultiPlayerListContentHolder = function(headerFrame) end

---`Method Private Instance`
---@param refresh System.Boolean
_G['TabMenu'].CreateMultiPlayerList = function(refresh) end

---`Method Private Instance`
---@param character Barotrauma.Character
---@param client Barotrauma.Networking.Client
---@param teamID System.Int32
---@param justCharacterInfo? Barotrauma.CharacterInfo
_G['TabMenu'].CreateMultiPlayerCharacterElement = function(character, client, teamID, justCharacterInfo) end

---`Method Private Instance`
---@param client Barotrauma.Networking.Client
_G['TabMenu'].CreateMultiPlayerClientElement = function(client) end

---`Method Private Instance`
---@param client Barotrauma.Networking.Client
---@return System.Int32
_G['TabMenu'].GetTeamIndex = function(client) end

---`Method Private Instance`
---@param character Barotrauma.Character
---@param paddedFrame Barotrauma.GUILayoutGroup
_G['TabMenu'].CreateWalletCrewFrame = function(character, paddedFrame) end

---`Method Private Instance`
---@param client Barotrauma.Networking.Client
---@param paddedFrame Barotrauma.GUILayoutGroup
---@param permissionIcon Barotrauma.GUIImage-ref
_G['TabMenu'].CreateNameWithPermissionIcon = function(client, paddedFrame, permissionIcon) end

---`Method Private Instance`
---@param client Barotrauma.Networking.Client
---@return Barotrauma.Sprite
_G['TabMenu'].GetPermissionIcon = function(client) end

---`Method Private Instance`
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
---@param area Microsoft.Xna.Framework.Rectangle
---@param client Barotrauma.Networking.Client
_G['TabMenu'].DrawClientJobIcon = function(spriteBatch, area, client) end

---`Method Private Instance`
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
---@param area Microsoft.Xna.Framework.Rectangle
_G['TabMenu'].DrawDisconnectedIcon = function(spriteBatch, area) end

---`Method Private Instance`
---@param userData System.Object
---@param crewList Barotrauma.GUIComponent
---@return System.Boolean
_G['TabMenu'].SelectElement = function(userData, crewList) end

---`Method Private Instance`
---@param parent Barotrauma.GUIComponent
---@param character Barotrauma.Character
---@param campaign Barotrauma.MultiPlayerCampaign
_G['TabMenu'].CreateWalletFrame = function(parent, character, campaign) end

---`Method Private Static`
---@param character Barotrauma.Option*1Barotrauma*Character
---@param newValue System.Int32
_G['TabMenu'].SetRewardDistribution = function(character, newValue) end

---`Method Private Static`
_G['TabMenu'].ResetRewardDistributions = function() end

---`Method Private Static`
---@param scroll System.Single
---@param step System.Single
---@return System.Int32
_G['TabMenu'].RoundRewardDistribution = function(scroll, step) end

---`Method Private Instance`
---@param frame Barotrauma.GUIFrame
---@param client Barotrauma.Networking.Client
---@param permissionIcon? Barotrauma.Sprite
---@return Barotrauma.GUIComponent
_G['TabMenu'].CreateClientInfoFrame = function(frame, client, permissionIcon) end

---`Method Private Instance`
---@param crewFrame Barotrauma.GUIFrame
_G['TabMenu'].CreateMultiPlayerLogContent = function(crewFrame) end

---`Method Public Static`
---@param message Barotrauma.Networking.ChatMessage
_G['TabMenu'].StorePlayerConnectionChangeMessage = function(message) end

---`Method Private Instance`
_G['TabMenu'].RemoveCurrentElements = function() end

---`Method Private Instance`
---@param line System.String
---@param type Barotrauma.Networking.PlayerConnectionChangeType
_G['TabMenu'].AddLineToLog = function(line, type) end

---`Method Private Instance`
---@param infoFrame Barotrauma.GUIFrame
_G['TabMenu'].CreateMissionInfo = function(infoFrame) end

---`Method Private Static`
---@param infoFrame Barotrauma.GUIFrame
---@param sub Barotrauma.Submarine
_G['TabMenu'].CreateSubmarineInfo = function(infoFrame, sub) end

---`Method Public Static`
---@param character Barotrauma.Character
---@param info Barotrauma.CharacterInfo
---@param parent Barotrauma.GUIListBox
_G['TabMenu'].CreateSkillList = function(character, info, parent) end

---`Method Public Instance`
---@param character Barotrauma.Character
_G['TabMenu'].OnExperienceChanged = function(character) end

---`Method Public Instance`
_G['TabMenu'].OnClose = function() end

---`Constructor Public Instance`
---@overload fun():Barotrauma.TabMenu
---@return Barotrauma.TabMenu
_G['TabMenu'] = function() end

---`Constructor Public Instance`
---@overload fun():Barotrauma.TabMenu
---@return Barotrauma.TabMenu
_G['TabMenu'].__new = function() end

---`Constructor Private Static`
---@overload fun():Barotrauma.TabMenu
---@return Barotrauma.TabMenu
_G['TabMenu'] = function() end

---`Constructor Private Static`
---@overload fun():Barotrauma.TabMenu
---@return Barotrauma.TabMenu
_G['TabMenu'].__new = function() end

