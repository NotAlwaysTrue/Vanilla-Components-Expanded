---@meta
---@class Barotrauma.Networking.GameClient : Barotrauma.Networking.NetworkMember
---`Field Public Instance`
---@field DebugServerVoipAmplitude System.Single
---`Field Private Instance`
---@field nameId System.UInt16
---`Field Public Instance`
---@field PendingName System.String
---`Field Private Instance`
---@field reconnectBox Barotrauma.GUIMessageBox
---`Field Private Instance`
---@field waitInServerQueueBox Barotrauma.GUIMessageBox
---`Field Public Instance`
---@field endRoundVoteText Barotrauma.LocalizedString
---`Field Public Instance`
---@field EndVoteTickBox Barotrauma.GUITickBox
---`Field Private Instance`
---@field buttonContainer Barotrauma.GUIComponent
---`Field Public Instance`
---@field NetStats Barotrauma.Networking.NetStats
---`Field NonPublic Instance`
---@field cameraFollowsSub Barotrauma.GUITickBox
---`Field Public Instance`
---@field EndCinematic Barotrauma.CameraTransition
---`Field Public Instance`
---@field LateCampaignJoin System.Boolean
---`Field Private Instance`
---@field permissions Barotrauma.Networking.ClientPermissions
---`Field Private Instance`
---@field permittedConsoleCommands (System.Collections.Generic.List*1Barotrauma*Identifier)|(Barotrauma.Identifier[])
---`Field Private Instance`
---@field connected System.Boolean
---`Field Private Instance`
---@field debugStartGameCampaignSaveID System.Nullable*1System*UInt16
---`Field Private Instance`
---@field roundInitStatus Barotrauma.Networking.GameClient.RoundInitStatus
---`Field Private Instance`
---@field otherClients (System.Collections.Generic.List*1Barotrauma*Networking*Client)|(Barotrauma.Networking.Client[])
---`Field Public Instance`
---@field ServerSubmarines (System.Collections.Generic.List*1Barotrauma*SubmarineInfo)|(Barotrauma.SubmarineInfo[])
---`Field Private Instance`
---@field canStart System.Boolean
---`Field Private Instance`
---@field lastSentChatMsgID System.UInt16
---`Field Private Instance`
---@field lastQueueChatMsgID System.UInt16
---`Field Private Instance`
---@field chatMsgQueue (System.Collections.Generic.List*1Barotrauma*Networking*ChatMessage)|(Barotrauma.Networking.ChatMessage[])
---`Field Public Instance`
---@field BlockedBySpamFilterTimer System.Single
---`Field Public Instance`
---@field LastSentEntityEventID System.UInt16
---`Field Public Instance`
---@field HasSpawned System.Boolean
---`Field Public Instance`
---@field TraitorFirstObjective Barotrauma.LocalizedString
---`Field Public Instance`
---@field TraitorMission Barotrauma.TraitorEventPrefab
---`Field Private Instance`
---@field previouslyConnectedClients (System.Collections.Generic.List*1Barotrauma*Networking*Client)|(Barotrauma.Networking.Client[])
---`Field Public Instance`
---@field FileReceiver Barotrauma.Networking.FileReceiver
---`Field Public Instance`
---@field EntityEventManager Barotrauma.Networking.ClientEntityEventManager
---`Field Private Instance`
---@field serverEndpoints (System.Collections.Immutable.ImmutableArray*1Barotrauma*Networking*Endpoint)|(Barotrauma.Networking.Endpoint[])
---`Field Private Instance`
---@field ownerKey Barotrauma.Option*1System*Int32
---`Field Public Instance`
---@field OnPermissionChanged Barotrauma.NamedEvent*1Barotrauma*Networking*GameClient*PermissionChangedEvent
---`Field Private Instance`
---@field connectCancelled System.Boolean
---`Field Private Instance`
---@field pendingIncomingMessages (System.Collections.Generic.List*1Barotrauma*Networking*IReadMessage)|(Barotrauma.Networking.IReadMessage[])
---`Field Private Instance`
---@field incomingMessagesToProcess (System.Collections.Generic.List*1Barotrauma*Networking*IReadMessage)|(Barotrauma.Networking.IReadMessage[])
---`Field Private Instance`
---@field startGameCoroutine Barotrauma.CoroutineHandle
---`Field Private Instance`
---@field requestNewRoundStart System.Boolean
---`Field Private Instance`
---@field initialUpdateReceived System.Boolean
---`Field Private Instance`
---@field debugEntityList (System.Collections.Generic.List*1Barotrauma*Networking*IServerSerializable)|(Barotrauma.Networking.IServerSerializable[])
---`Field NonPublic Instance`
---@field characterInfo Barotrauma.CharacterInfo
---`Field NonPublic Instance`
---@field myCharacter Barotrauma.Character
---`Field NonPublic Instance`
---@field inGameHUD Barotrauma.GUIFrame
---`Field NonPublic Instance`
---@field chatBox Barotrauma.ChatBox
---`Field Public Instance`
---@field ShowLogButton Barotrauma.GUIButton
---`Field Private Instance`
---@field hasPermissionToUseLogButton System.Boolean
---`Field Private Instance`
---@field votingInterface Barotrauma.VotingInterface
---`Field Private Instance`
---@field eventErrorWritten System.Boolean
---`Field Public Static`
---@field CampaignSaveTransferTimeOut System.TimeSpan
---`Field Public Static`
---@field LevelTransitionTimeOut System.TimeSpan
---`Field Public Static`
---@field MultiClientTestMode System.Boolean
---`Getter Public Instance Virtual`
---@field IsClient System.Boolean
---`Getter Public Instance Virtual`
---@field IsServer System.Boolean
---`Getter Public Instance Virtual`
---@field Voting Barotrauma.Voting
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field Name System.String
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field ClientPeer Barotrauma.Networking.ClientPeer
---`Getter Public Instance`
---@field FollowSubTickBox Barotrauma.GUITickBox
---`Getter Public Instance`
---@field IsFollowSubTickBoxVisible System.Boolean
---`Getter Public Instance`
---@field RoundStarting System.Boolean
---`Getter Public Instance`
---@field ServerName System.String
---`Getter Public Instance`
---@field IsBlockedBySpamFilter System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field EndRoundTimeRemaining System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field SessionId System.Byte
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field VoipClient Barotrauma.Networking.VoipClient
---`Getter Public Instance Virtual`
---@field ConnectedClients (System.Collections.Generic.IReadOnlyList*1Barotrauma*Networking*Client)|(Barotrauma.Networking.Client[])
---`Getter Public Instance`
---@field MyClient Barotrauma.Networking.Client
---`Getter Public Instance`
---@field Ping Barotrauma.Option*1System*Int32
---`Getter Public Instance`
---@field PreviouslyConnectedClients (System.Collections.Generic.IEnumerable*1Barotrauma*Networking*Client)|(fun():(Barotrauma.Networking.Client))
---`Getter Public Instance`
---@field MidRoundSyncing System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field WaitForNextRoundRespawn System.Nullable*1System*Boolean
---`Getter Public Instance`
---@field IsServerOwner System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field CharacterInfo Barotrauma.CharacterInfo
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Character Barotrauma.Character
---`Getter Public Instance`
---@field InGameHUD Barotrauma.GUIFrame
---`Getter Public Instance`
---@field ChatBox Barotrauma.ChatBox
---`Getter Public Instance`
---@field VotingInterface Barotrauma.VotingInterface
_G['GameClient'] = {}

---`Method Public Instance`
---@param value System.String
_G['GameClient'].SetName = function(value) end

---`Method Public Instance`
_G['GameClient'].ForceNameJobTeamUpdate = function() end

---`Method Public Instance`
_G['GameClient'].PrintReceiverTransters = function() end

---`Method Public Instance`
---@return Barotrauma.Networking.ServerInfo
_G['GameClient'].CreateServerInfoFromSettings = function() end

---`Method Private Instance`
_G['GameClient'].InitiateServerJoin = function() end

---`Method Public Static`
---@param isPublic System.Boolean
_G['GameClient'].SetLobbyPublic = function(isPublic) end

---`Method Private Instance`
---@return Barotrauma.Networking.ClientPeer
_G['GameClient'].CreateNetPeer = function() end

---`Method Public Instance`
_G['GameClient'].CreateServerCrashMessage = function() end

---`Method Private Instance`
---@param button Barotrauma.GUIButton
---@param obj System.Object
---@return System.Boolean
_G['GameClient'].ReturnToPreviousMenu = function(button, obj) end

---`Method Private Instance`
_G['GameClient'].CancelConnect = function() end

---`Method Private Instance`
---@return (System.Collections.Generic.IEnumerable*1Barotrauma*CoroutineStatus)|(fun():(Barotrauma.CoroutineStatus))
_G['GameClient'].WaitForStartingInfo = function() end

---`Method Public Instance`
---@param deltaTime System.Single
_G['GameClient'].Update = function(deltaTime) end

---`Method Private Instance`
---@param inc Barotrauma.Networking.IReadMessage
_G['GameClient'].ReadDataMessage = function(inc) end

---`Method Private Instance`
---@param inc Barotrauma.Networking.IReadMessage
_G['GameClient'].ReadStartGameFinalize = function(inc) end

---`Method Private Instance`
_G['GameClient'].ApplyDisembarkPerk = function() end

---`Method Private Instance`
---@param disconnectPacket Barotrauma.Networking.PeerDisconnectPacket
_G['GameClient'].OnClientPeerDisconnect = function(disconnectPacket) end

---`Method Private Instance`
---@param headerText Barotrauma.LocalizedString
---@param bodyText Barotrauma.LocalizedString
_G['GameClient'].CreateReconnectBox = function(headerText, bodyText) end

---`Method Private Instance`
_G['GameClient'].CloseReconnectBox = function() end

---`Method Private Instance`
_G['GameClient'].AskToWaitInQueue = function() end

---`Method Private Instance`
---@param peerDisconnectPacket Barotrauma.Networking.PeerDisconnectPacket
_G['GameClient'].AttemptReconnect = function(peerDisconnectPacket) end

---`Method Private Instance`
---@param connectCommand System.String
_G['GameClient'].UpdatePresence = function(connectCommand) end

---`Method Private Instance`
_G['GameClient'].OnConnectionInitializationComplete = function() end

---`Method Private Instance`
---@return (System.Collections.Generic.IEnumerable*1Barotrauma*CoroutineStatus)|(fun():(Barotrauma.CoroutineStatus))
_G['GameClient'].WaitInServerQueue = function() end

---`Method Private Static`
---@param inc Barotrauma.Networking.IReadMessage
_G['GameClient'].ReadAchievement = function(inc) end

---`Method Private Static`
---@param inc Barotrauma.Networking.IReadMessage
_G['GameClient'].ReadAchievementStat = function(inc) end

---`Method Private Static`
---@param inc Barotrauma.Networking.IReadMessage
_G['GameClient'].ReadCircuitBoxMessage = function(inc) end

---`Method Private Instance`
---@param inc Barotrauma.Networking.IReadMessage
_G['GameClient'].ReadPermissions = function(inc) end

---`Method Private Instance`
---@param newPermissions Barotrauma.Networking.ClientPermissions
---@param permittedConsoleCommands (System.Collections.Generic.IEnumerable*1Barotrauma*Identifier)|(fun():(Barotrauma.Identifier))
_G['GameClient'].SetMyPermissions = function(newPermissions, permittedConsoleCommands) end

---`Method Private Instance`
---@param inc Barotrauma.Networking.IReadMessage
---@return (System.Collections.Generic.IEnumerable*1Barotrauma*CoroutineStatus)|(fun():(Barotrauma.CoroutineStatus))
_G['GameClient'].StartGame = function(inc) end

---`Method Public Instance`
---@param endMessage System.String
---@param transitionType? Barotrauma.CampaignMode.TransitionType
---@param traitorResults? System.Nullable*1Barotrauma*TraitorManager*TraitorResults
---@return (System.Collections.Generic.IEnumerable*1Barotrauma*CoroutineStatus)|(fun():(Barotrauma.CoroutineStatus))
_G['GameClient'].EndGame = function(endMessage, transitionType, traitorResults) end

---`Method Private Instance`
---@param inc Barotrauma.Networking.IReadMessage
_G['GameClient'].ReadInitialUpdate = function(inc) end

---`Method Private Instance`
---@param inc Barotrauma.Networking.IReadMessage
_G['GameClient'].ReadClientList = function(inc) end

---`Method Private Instance`
---@param inc Barotrauma.Networking.IReadMessage
_G['GameClient'].ReadLobbyUpdate = function(inc) end

---`Method Private Instance`
---@param inc Barotrauma.Networking.IReadMessage
_G['GameClient'].ReadIngameUpdate = function(inc) end

---`Method Private Instance`
_G['GameClient'].SendLobbyUpdate = function() end

---`Method Private Instance`
_G['GameClient'].SendIngameUpdate = function() end

---`Method Public Instance`
---@overload fun(msg:Barotrauma.Networking.ChatMessage)
---@param message System.String
---@param type? Barotrauma.Networking.ChatMessageType
_G['GameClient'].SendChatMessage = function(message, type) end

---`Method Public Instance`
---@param waitForNextRoundRespawn System.Boolean
_G['GameClient'].SendRespawnPromptResponse = function(waitForNextRoundRespawn) end

---`Method Public Instance`
---@param bot Barotrauma.CharacterInfo
_G['GameClient'].SendTakeOverBotRequest = function(bot) end

---`Method Public Instance`
---@param bot Barotrauma.CharacterInfo
---@param pendingHire? System.Boolean
_G['GameClient'].ToggleReserveBench = function(bot, pendingHire) end

---`Method Public Instance`
---@param fileType Barotrauma.Networking.FileTransferType
---@param file System.String
---@param fileHash System.String
_G['GameClient'].RequestFile = function(fileType, file, fileHash) end

---`Method Public Instance`
---@overload fun(transfer:Barotrauma.Networking.FileReceiver.FileTransferIn)
---@param id System.Int32
_G['GameClient'].CancelFileTransfer = function(id) end

---`Method Public Instance`
---@param transfer Barotrauma.Networking.FileReceiver.FileTransferIn
---@param expecting System.Int32
---@param lastSeen System.Int32
---@param reliable? System.Boolean
_G['GameClient'].UpdateFileTransfer = function(transfer, expecting, lastSeen, reliable) end

---`Method Private Instance`
---@param transfer Barotrauma.Networking.FileReceiver.FileTransferIn
_G['GameClient'].OnFileReceived = function(transfer) end

---`Method Private Instance`
---@param transfer Barotrauma.Networking.FileReceiver.FileTransferIn
_G['GameClient'].OnTransferFailed = function(transfer) end

---`Method Public Instance Virtual`
---@param entity Barotrauma.Networking.INetSerializable
---@param extraData? Barotrauma.Networking.NetEntityEvent.IData
_G['GameClient'].CreateEntityEvent = function(entity, extraData) end

---`Method Public Instance`
---@param entity Barotrauma.Networking.INetSerializable
---@param extraData Barotrauma.Networking.NetEntityEvent.IData
---@param requireControlledCharacter System.Boolean
_G['GameClient'].CreateEntityEvent = function(entity, extraData, requireControlledCharacter) end

---`Method Public Instance`
---@param permission Barotrauma.Networking.ClientPermissions
---@return System.Boolean
_G['GameClient'].HasPermission = function(permission) end

---`Method Public Instance`
---@param commandName Barotrauma.Identifier
---@return System.Boolean
_G['GameClient'].HasConsoleCommandPermission = function(commandName) end

---`Method Public Instance`
_G['GameClient'].Quit = function() end

---`Method Public Instance`
---@param newName? System.String
_G['GameClient'].SendCharacterInfo = function(newName) end

---`Method Public Instance`
---@param msg Barotrauma.Networking.IWriteMessage
---@param newName? System.String
_G['GameClient'].WriteCharacterInfo = function(msg, newName) end

---`Method Public Instance`
---@param voteType Barotrauma.Networking.VoteType
---@param data System.Object
_G['GameClient'].Vote = function(voteType, data) end

---`Method Public Instance`
---@param votedClient Barotrauma.Networking.Client
_G['GameClient'].VoteForKick = function(votedClient) end

---`Method Public Instance`
---@param sub Barotrauma.SubmarineInfo
---@param transferItems System.Boolean
---@param voteType Barotrauma.Networking.VoteType
_G['GameClient'].InitiateSubmarineChange = function(sub, transferItems, voteType) end

---`Method Public Instance`
---@param starter Barotrauma.Networking.Client
---@param info Barotrauma.SubmarineInfo
---@param type Barotrauma.Networking.VoteType
---@param transferItems System.Boolean
---@param timeOut System.Single
_G['GameClient'].ShowSubmarineChangeVoteInterface = function(starter, info, type, transferItems, timeOut) end

---`Method Public Instance`
---@param starter Barotrauma.Networking.Client
---@param from Barotrauma.Networking.Client
---@param amount System.Int32
---@param to Barotrauma.Networking.Client
---@param timeOut System.Single
_G['GameClient'].ShowMoneyTransferVoteInterface = function(starter, from, amount, to, timeOut) end

---`Method Public Instance Virtual`
---@param message Barotrauma.Networking.ChatMessage
_G['GameClient'].AddChatMessage = function(message) end

---`Method Public Instance Virtual`
---@param kickedName System.String
---@param reason System.String
_G['GameClient'].KickPlayer = function(kickedName, reason) end

---`Method Public Instance Virtual`
---@param kickedName System.String
---@param reason System.String
---@param duration? System.Nullable*1System*TimeSpan
_G['GameClient'].BanPlayer = function(kickedName, reason, duration) end

---`Method Public Instance Virtual`
---@overload fun(playerName:System.String)
---@param endpoint Barotrauma.Networking.Endpoint
_G['GameClient'].UnbanPlayer = function(endpoint) end

---`Method Public Instance`
---@param targetClient Barotrauma.Networking.Client
_G['GameClient'].UpdateClientPermissions = function(targetClient) end

---`Method Public Instance`
_G['GameClient'].SendCampaignState = function() end

---`Method Public Instance`
---@param command System.String
_G['GameClient'].SendConsoleCommand = function(command) end

---`Method Public Instance`
---@param continueCampaign? System.Boolean
_G['GameClient'].RequestStartRound = function(continueCampaign) end

---`Method Public Instance`
---@param sub Barotrauma.SubmarineInfo
---@param type Barotrauma.SelectedSubType
_G['GameClient'].RequestSelectSub = function(sub, type) end

---`Method Public Instance`
---@param modeIndex System.Int32
_G['GameClient'].RequestSelectMode = function(modeIndex) end

---`Method Public Instance`
---@param sub Barotrauma.SubmarineInfo
---@param saveName System.String
---@param mapSeed System.String
---@param settings Barotrauma.CampaignSettings
_G['GameClient'].SetupNewCampaign = function(sub, saveName, mapSeed, settings) end

---`Method Public Instance`
---@param filePath System.String
---@param backupIndex Barotrauma.Option*1System*UInt32
_G['GameClient'].SetupLoadCampaign = function(filePath, backupIndex) end

---`Method Public Instance`
---@param save System.Boolean
---@param quitCampaign? System.Boolean
_G['GameClient'].RequestEndRound = function(save, quitCampaign) end

---`Method Public Instance`
_G['GameClient'].EndRoundForSelf = function() end

---`Method Public Instance`
---@param joinButton Barotrauma.GUIButton
---@return System.Boolean
_G['GameClient'].SendJoinOngoingRequest = function(joinButton) end

---`Method Private Instance`
---@param readyToStart System.Boolean
_G['GameClient'].SendStartGameResponse = function(readyToStart) end

---`Method Public Instance`
---@param tickBox Barotrauma.GUITickBox
---@return System.Boolean
_G['GameClient'].SetReadyToStart = function(tickBox) end

---`Method Public Instance`
---@param tickBox Barotrauma.GUITickBox
---@return System.Boolean
_G['GameClient'].ToggleEndRoundVote = function(tickBox) end

---`Method Public Instance`
_G['GameClient'].UpdateLogButtonPermissions = function() end

---`Method Private Instance`
_G['GameClient'].UpdateLogButtonVisibility = function() end

---`Method Public Instance`
---@param textBox Barotrauma.GUITextBox
---@param text System.String
---@return System.Boolean
_G['GameClient'].TypingChatMessage = function(textBox, text) end

---`Method Public Instance`
---@param textBox Barotrauma.GUITextBox
---@param message System.String
---@return System.Boolean
_G['GameClient'].EnterChatMessage = function(textBox, message) end

---`Method Public Instance`
_G['GameClient'].AddToGUIUpdateList = function() end

---`Method Public Instance`
---@param deltaTime System.Single
_G['GameClient'].UpdateHUD = function(deltaTime) end

---`Method Public Instance`
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
_G['GameClient'].Draw = function(spriteBatch) end

---`Method Public Instance`
---@param character Barotrauma.Character
---@param frame Barotrauma.GUIComponent
---@return System.Boolean
_G['GameClient'].SelectCrewCharacter = function(character, frame) end

---`Method Public Instance`
---@param client Barotrauma.Networking.Client
---@param frame Barotrauma.GUIComponent
---@return System.Boolean
_G['GameClient'].SelectCrewClient = function(client, frame) end

---`Method Private Instance`
---@param client Barotrauma.Networking.Client
---@param frame Barotrauma.GUIComponent
_G['GameClient'].CreateSelectionRelatedButtons = function(client, frame) end

---`Method Public Instance`
---@param clientName System.String
---@param ban System.Boolean
_G['GameClient'].CreateKickReasonPrompt = function(clientName, ban) end

---`Method Public Instance`
---@param error Barotrauma.Networking.ClientNetError
---@param expectedId? System.UInt16
---@param eventId? System.UInt16
---@param entityId? System.UInt16
_G['GameClient'].ReportError = function(error, expectedId, eventId, entityId) end

---`Method Private Instance`
---@param error Barotrauma.Networking.ClientNetError
---@param expectedID System.UInt16
---@param eventID System.UInt16
---@param entityID System.UInt16
_G['GameClient'].WriteEventErrorData = function(error, expectedID, eventID, entityID) end

---`Method Private Static`
---@param errorMsg System.String-ref
---@param causingEntity Barotrauma.Entity-ref
---@param e System.Exception
_G['GameClient'].AppendExceptionInfo = function(errorMsg, causingEntity, e) end

---`Method Private Static`
---@param e System.Exception
---@return Barotrauma.Entity
_G['GameClient'].GetCausingEntity = function(e) end

---`Method Public Instance`
_G['GameClient'].ForceTimeOut = function() end

---`Constructor Public Instance`
---@overload fun(newName:System.String, endpoint:Barotrauma.Networking.Endpoint, serverName:System.String, ownerKey:Barotrauma.Option*1System*Int32):Barotrauma.Networking.GameClient
---@overload fun(newName:System.String, endpoints:(System.Collections.Immutable.ImmutableArray*1Barotrauma*Networking*Endpoint)|(Barotrauma.Networking.Endpoint[]), serverName:System.String, ownerKey:Barotrauma.Option*1System*Int32):Barotrauma.Networking.GameClient
---@return Barotrauma.Networking.GameClient
_G['GameClient'] = function() end

---`Constructor Public Instance`
---@overload fun(newName:System.String, endpoint:Barotrauma.Networking.Endpoint, serverName:System.String, ownerKey:Barotrauma.Option*1System*Int32):Barotrauma.Networking.GameClient
---@overload fun(newName:System.String, endpoints:(System.Collections.Immutable.ImmutableArray*1Barotrauma*Networking*Endpoint)|(Barotrauma.Networking.Endpoint[]), serverName:System.String, ownerKey:Barotrauma.Option*1System*Int32):Barotrauma.Networking.GameClient
---@return Barotrauma.Networking.GameClient
_G['GameClient'].__new = function() end

---`Constructor Private Static`
---@overload fun(newName:System.String, endpoint:Barotrauma.Networking.Endpoint, serverName:System.String, ownerKey:Barotrauma.Option*1System*Int32):Barotrauma.Networking.GameClient
---@overload fun(newName:System.String, endpoints:(System.Collections.Immutable.ImmutableArray*1Barotrauma*Networking*Endpoint)|(Barotrauma.Networking.Endpoint[]), serverName:System.String, ownerKey:Barotrauma.Option*1System*Int32):Barotrauma.Networking.GameClient
---@return Barotrauma.Networking.GameClient
_G['GameClient'] = function() end

---`Constructor Private Static`
---@overload fun(newName:System.String, endpoint:Barotrauma.Networking.Endpoint, serverName:System.String, ownerKey:Barotrauma.Option*1System*Int32):Barotrauma.Networking.GameClient
---@overload fun(newName:System.String, endpoints:(System.Collections.Immutable.ImmutableArray*1Barotrauma*Networking*Endpoint)|(Barotrauma.Networking.Endpoint[]), serverName:System.String, ownerKey:Barotrauma.Option*1System*Int32):Barotrauma.Networking.GameClient
---@return Barotrauma.Networking.GameClient
_G['GameClient'].__new = function() end

