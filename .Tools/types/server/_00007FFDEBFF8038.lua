---@meta
---@class Barotrauma.Networking.GameServer : Barotrauma.Networking.NetworkMember
---`Field Public Instance`
---@field SubmarineSwitchLoad System.Boolean
---`Field Private Instance`
---@field connectedClients (System.Collections.Generic.List*1Barotrauma*Networking*Client)|(Barotrauma.Networking.Client[])
---`Field Private Instance`
---@field clientsAttemptingToReconnectSoon (System.Collections.Generic.List*1Barotrauma*Networking*Client)|(Barotrauma.Networking.Client[])
---`Field Private Instance`
---@field previousPlayers (System.Collections.Generic.List*1Barotrauma*Networking*PreviousPlayer)|(Barotrauma.Networking.PreviousPlayer[])
---`Field Private Instance`
---@field roundStartSeed System.Int32
---`Field Private Instance`
---@field started System.Boolean
---`Field Private Instance`
---@field serverPeer Barotrauma.Networking.ServerPeer
---`Field Private Instance`
---@field refreshMasterTimer System.DateTime
---`Field Private Instance`
---@field refreshMasterInterval System.TimeSpan
---`Field Private Instance`
---@field registeredToSteamMaster System.Boolean
---`Field Private Instance`
---@field roundStartTime System.DateTime
---`Field Private Instance`
---@field wasReadyToStartAutomatically System.Boolean
---`Field Private Instance`
---@field autoRestartTimerRunning System.Boolean
---`Field Private Instance`
---@field initiatedStartGame System.Boolean
---`Field Private Instance`
---@field startGameCoroutine Barotrauma.CoroutineHandle
---`Field Private Instance`
---@field entityEventManager Barotrauma.Networking.ServerEntityEventManager
---`Field Private Instance`
---@field traitorManager Barotrauma.TraitorManager
---`Field Private Instance`
---@field ownerKey Barotrauma.Option*1System*Int32
---`Field Private Instance`
---@field ownerEndpoint Barotrauma.Option*1Barotrauma*Networking*P2PEndpoint
---`Field Private Instance`
---@field lastPingTime System.Double
---`Field Private Instance`
---@field lastPingData (System.Byte-arr)|(System.Byte[])
---`Field Private Instance`
---@field dosProtection Barotrauma.DoSProtection
---`Field Private Instance`
---@field isRoundStartWarningActive System.Boolean
---`Field Private Instance`
---@field charInfoRateLimiter Barotrauma.RateLimiter
---`Field Public Instance`
---@field JobAssignmentDebugLog (System.Collections.Generic.List*1System*String)|(System.String[])
---`Field Private Static`
---@field pvpAutoBalanceCountdownRemaining System.Single
---`Field Private Static`
---@field pendingMessagesToOwner (System.Collections.Generic.Queue*1Barotrauma*Networking*ChatMessage)|(fun():(Barotrauma.Networking.ChatMessage))
---`Field Private Static`
---@field PvpAutoBalanceCountdown System.Int32
---`Getter Public Instance Virtual`
---@field IsServer System.Boolean
---`Getter Public Instance Virtual`
---@field IsClient System.Boolean
---`Getter Public Instance Virtual`
---@field Voting Barotrauma.Voting
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field ServerName System.String
---`Getter Public Instance`
---@field ServerPeer Barotrauma.Networking.ServerPeer
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field EndRoundTimer System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field EndRoundDelay System.Single
---`Getter Public Instance`
---@field EndRoundTimeRemaining System.Single
---`Getter Private Instance`
---@field Team1Count System.Int32
---`Getter Private Instance`
---@field Team2Count System.Int32
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field VoipServer Barotrauma.Networking.VoipServer
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field FileSender Barotrauma.Networking.FileSender
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field ModSender Barotrauma.Networking.ModSender
---`Getter Public Instance`
---@field TraitorManager Barotrauma.TraitorManager
---`Getter Public Instance Virtual`
---@field ConnectedClients (System.Collections.Generic.IReadOnlyList*1Barotrauma*Networking*Client)|(Barotrauma.Networking.Client[])
---`Getter Public Instance`
---@field EntityEventManager Barotrauma.Networking.ServerEntityEventManager
---`Getter Public Instance`
---@field Port System.Int32
---`Getter Public Instance`
---@field QueryPort System.Int32
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field OwnerConnection Barotrauma.Networking.NetworkConnection
_G['GameServer'] = {}

---`Method Public Instance`
_G['GameServer'].PrintSenderTransters = function() end

---`Method Public Instance`
_G['GameServer'].ClearRecentlyDisconnectedClients = function() end

---`Method Public Instance`
---@param conn Barotrauma.Networking.NetworkConnection
---@return System.Boolean
_G['GameServer'].FindAndRemoveRecentlyDisconnectedConnection = function(conn) end

---`Method Public Instance`
---@param registerToServerList System.Boolean
_G['GameServer'].StartServer = function(registerToServerList) end

---`Method Public Static`
---@param message System.String
---@param messageType Barotrauma.Networking.ChatMessageType
_G['GameServer'].AddPendingMessageToOwner = function(message, messageType) end

---`Method Private Instance`
---@param connection Barotrauma.Networking.NetworkConnection
_G['GameServer'].OnOwnerDetermined = function(connection) end

---`Method Public Instance`
_G['GameServer'].NotifyCrash = function() end

---`Method Private Instance`
---@param connection Barotrauma.Networking.NetworkConnection
---@param clientName System.String
_G['GameServer'].OnInitializationComplete = function(connection, clientName) end

---`Method Private Instance`
---@param connection Barotrauma.Networking.NetworkConnection
---@param peerDisconnectPacket Barotrauma.Networking.PeerDisconnectPacket
_G['GameServer'].OnClientDisconnect = function(connection, peerDisconnectPacket) end

---`Method Public Instance`
---@param deltaTime System.Single
_G['GameServer'].Update = function(deltaTime) end

---`Method Private Instance`
_G['GameServer'].UpdatePing = function() end

---`Method Private Instance`
---@param sender Barotrauma.Networking.NetworkConnection
---@param inc Barotrauma.Networking.IReadMessage
_G['GameServer'].ReadDataMessage = function(sender, inc) end

---`Method Private Instance`
---@param inc Barotrauma.Networking.IReadMessage
---@param connectedClient Barotrauma.Networking.Client
_G['GameServer'].SendBackupIndices = function(inc, connectedClient) end

---`Method Private Instance`
---@param inc Barotrauma.Networking.IReadMessage
---@param c Barotrauma.Networking.Client
_G['GameServer'].HandleClientError = function(inc, c) end

---`Method Private Instance`
---@param client Barotrauma.Networking.Client
---@param errorStr System.String
_G['GameServer'].WriteEventErrorData = function(client, errorStr) end

---`Method Public Instance Virtual`
---@param entity Barotrauma.Networking.INetSerializable
---@param extraData? Barotrauma.Networking.NetEntityEvent.IData
_G['GameServer'].CreateEntityEvent = function(entity, extraData) end

---`Method Private Instance`
---@return System.Byte
_G['GameServer'].GetNewClientSessionId = function() end

---`Method Private Instance`
---@param inc Barotrauma.Networking.IReadMessage
_G['GameServer'].ClientReadLobby = function(inc) end

---`Method Private Instance`
---@param inc Barotrauma.Networking.IReadMessage
_G['GameServer'].ClientReadIngame = function(inc) end

---`Method Private Instance`
---@param inc Barotrauma.Networking.IReadMessage
---@param sender Barotrauma.Networking.Client
_G['GameServer'].ReadCrewMessage = function(inc, sender) end

---`Method Private Instance`
---@param inc Barotrauma.Networking.IReadMessage
---@param sender Barotrauma.Networking.Client
_G['GameServer'].ReadMoneyMessage = function(inc, sender) end

---`Method Private Instance`
---@param inc Barotrauma.Networking.IReadMessage
---@param sender Barotrauma.Networking.Client
_G['GameServer'].ReadRewardDistributionMessage = function(inc, sender) end

---`Method Private Instance`
---@param client Barotrauma.Networking.Client
_G['GameServer'].ResetRewardDistribution = function(client) end

---`Method Private Instance`
---@param inc Barotrauma.Networking.IReadMessage
---@param sender Barotrauma.Networking.Client
_G['GameServer'].ReadMedicalMessage = function(inc, sender) end

---`Method Private Static`
---@param inc Barotrauma.Networking.IReadMessage
---@param sender Barotrauma.Networking.Client
_G['GameServer'].ReadCircuitBoxMessage = function(inc, sender) end

---`Method Private Instance`
---@param inc Barotrauma.Networking.IReadMessage
---@param sender Barotrauma.Networking.Client
_G['GameServer'].ReadReadyToSpawnMessage = function(inc, sender) end

---`Method Private Instance`
---@param inc Barotrauma.Networking.IReadMessage
---@param sender Barotrauma.Networking.Client
_G['GameServer'].ReadTakeOverBotMessage = function(inc, sender) end

---`Method Private Static`
---@param campaign Barotrauma.CampaignMode
---@param botInfo Barotrauma.CharacterInfo
---@param client Barotrauma.Networking.Client
_G['GameServer'].SpawnAndTakeOverBot = function(campaign, botInfo, client) end

---`Method Private Static`
---@param campaign Barotrauma.CampaignMode
---@param botInfo Barotrauma.CharacterInfo
---@param client Barotrauma.Networking.Client
_G['GameServer'].SpawnAndTakeOverBotInShuttle = function(campaign, botInfo, client) end

---`Method Private Static`
---@param campaign Barotrauma.CampaignMode
---@param botInfo Barotrauma.CharacterInfo
---@param client Barotrauma.Networking.Client
_G['GameServer'].TransferPreviousSalaryToBot = function(campaign, botInfo, client) end

---`Method Private Instance`
---@param inc Barotrauma.Networking.IReadMessage
_G['GameServer'].ClientReadServerCommand = function(inc) end

---`Method Private Instance`
---@param c Barotrauma.Networking.Client
_G['GameServer'].ClientWrite = function(c) end

---`Method Private Instance`
---@param c Barotrauma.Networking.Client
---@param outmsg Barotrauma.Networking.IWriteMessage
_G['GameServer'].ClientWriteInitial = function(c, outmsg) end

---`Method Private Instance`
---@param c Barotrauma.Networking.Client
_G['GameServer'].ClientWriteIngame = function(c) end

---`Method Private Instance`
---@param segmentTable Barotrauma.Networking.SegmentTableWriter
---@param c Barotrauma.Networking.Client
---@param outmsg Barotrauma.Networking.IWriteMessage
_G['GameServer'].WriteClientList = function(segmentTable, c, outmsg) end

---`Method Public Instance`
---@param c Barotrauma.Networking.Client
_G['GameServer'].ClientWriteLobby = function(c) end

---`Method Private Static`
---@param segmentTable Barotrauma.Networking.SegmentTableWriter
---@param outmsg Barotrauma.Networking.IWriteMessage
---@param c Barotrauma.Networking.Client
_G['GameServer'].WriteChatMessages = function(segmentTable, outmsg, c) end

---`Method Public Instance`
---@return Barotrauma.Networking.GameServer.TryStartGameResult
_G['GameServer'].TryStartGame = function() end

---`Method Private Instance`
---@param team1Sub Barotrauma.SubmarineInfo
---@param team2Sub Barotrauma.SubmarineInfo
---@param preset Barotrauma.GameModePreset
---@param incompatiblePerks Barotrauma.PerkCollection-ref
---@return System.Boolean
_G['GameServer'].CheckIfAnyPerksAreIncompatible = function(team1Sub, team2Sub, preset, incompatiblePerks) end

---`Method Private Instance`
_G['GameServer'].AbortStartGameIfWarningActive = function() end

---`Method Private Instance`
---@param incompatiblePerks Barotrauma.PerkCollection
---@param selectedSub Barotrauma.SubmarineInfo
---@param selectedEnemySub Barotrauma.Option*1Barotrauma*SubmarineInfo
---@param selectedShuttle Barotrauma.SubmarineInfo
---@param selectedMode Barotrauma.GameModePreset
---@return (System.Collections.Generic.IEnumerable*1Barotrauma*CoroutineStatus)|(fun():(Barotrauma.CoroutineStatus))
_G['GameServer'].WarnAndDelayStartGame = function(incompatiblePerks, selectedSub, selectedEnemySub, selectedShuttle, selectedMode) end

---`Method Private Instance`
---@param selectedSub Barotrauma.SubmarineInfo
---@param selectedEnemySub Barotrauma.Option*1Barotrauma*SubmarineInfo
---@param selectedShuttle Barotrauma.SubmarineInfo
---@param selectedMode Barotrauma.GameModePreset
---@return (System.Collections.Generic.IEnumerable*1Barotrauma*CoroutineStatus)|(fun():(Barotrauma.CoroutineStatus))
_G['GameServer'].InitiateStartGame = function(selectedSub, selectedEnemySub, selectedShuttle, selectedMode) end

---`Method Private Instance`
---@param selectedSub Barotrauma.SubmarineInfo
---@param selectedShuttle Barotrauma.SubmarineInfo
---@param selectedEnemySub Barotrauma.Option*1Barotrauma*SubmarineInfo
---@param selectedMode Barotrauma.GameModePreset
---@param settings Barotrauma.CampaignSettings
---@return (System.Collections.Generic.IEnumerable*1Barotrauma*CoroutineStatus)|(fun():(Barotrauma.CoroutineStatus))
_G['GameServer'].StartGame = function(selectedSub, selectedShuttle, selectedEnemySub, selectedMode, settings) end

---`Method Private Instance`
---@overload fun(seed:System.Int32, levelSeed:System.String, gameSession:Barotrauma.GameSession, clients:(System.Collections.Generic.List*1Barotrauma*Networking*Client)|(Barotrauma.Networking.Client[]), includesFinalize:System.Boolean)
---@param seed System.Int32
---@param levelSeed System.String
---@param gameSession Barotrauma.GameSession
---@param client Barotrauma.Networking.Client
---@param includesFinalize System.Boolean
_G['GameServer'].SendStartMessage = function(seed, levelSeed, gameSession, client, includesFinalize) end

---`Method Private Instance`
---@param client Barotrauma.Networking.Client
---@return System.Boolean
_G['GameServer'].TrySendCampaignSetupInfo = function(client) end

---`Method Private Instance`
---@return System.Boolean
_G['GameServer'].IsUsingRespawnShuttle = function() end

---`Method Private Instance`
---@param client Barotrauma.Networking.Client
_G['GameServer'].SendRoundStartFinalize = function(client) end

---`Method Private Instance`
---@param msg Barotrauma.Networking.IWriteMessage
---@param client Barotrauma.Networking.Client
_G['GameServer'].WriteRoundStartFinalize = function(msg, client) end

---`Method Public Instance`
---@param transitionType? Barotrauma.CampaignMode.TransitionType
---@param wasSaved? System.Boolean
---@param missions? (System.Collections.Generic.IEnumerable*1Barotrauma*Mission)|(fun():(Barotrauma.Mission))
_G['GameServer'].EndGame = function(transitionType, wasSaved, missions) end

---`Method Public Instance Virtual`
---@param message Barotrauma.Networking.ChatMessage
_G['GameServer'].AddChatMessage = function(message) end

---`Method Private Instance`
---@param c Barotrauma.Networking.Client
---@param inc Barotrauma.Networking.IReadMessage
---@return System.Boolean
_G['GameServer'].ReadClientNameChange = function(c, inc) end

---`Method Public Instance`
---@param c Barotrauma.Networking.Client
---@param newName System.String
---@param clientRenamingSelf? System.Boolean
---@return System.Boolean
_G['GameServer'].TryChangeClientName = function(c, newName, clientRenamingSelf) end

---`Method Public Instance`
---@param c Barotrauma.Networking.Client
---@param newName System.String
---@param clientRenamingSelf? System.Boolean
---@return System.Boolean
_G['GameServer'].IsNameValid = function(c, newName, clientRenamingSelf) end

---`Method Public Instance Virtual`
---@param playerName System.String
---@param reason System.String
_G['GameServer'].KickPlayer = function(playerName, reason) end

---`Method Public Instance`
---@overload fun(conn:Barotrauma.Networking.NetworkConnection, reason:System.String)
---@param client Barotrauma.Networking.Client
---@param reason System.String
---@param resetKarma? System.Boolean
_G['GameServer'].KickClient = function(client, reason, resetKarma) end

---`Method Public Instance Virtual`
---@param playerName System.String
---@param reason System.String
---@param duration? System.Nullable*1System*TimeSpan
_G['GameServer'].BanPlayer = function(playerName, reason, duration) end

---`Method Public Instance`
---@param client Barotrauma.Networking.Client
---@param reason System.String
---@param duration? System.Nullable*1System*TimeSpan
_G['GameServer'].BanClient = function(client, reason, duration) end

---`Method Public Instance`
---@param previousPlayer Barotrauma.Networking.PreviousPlayer
---@param reason System.String
---@param duration? System.Nullable*1System*TimeSpan
_G['GameServer'].BanPreviousPlayer = function(previousPlayer, reason, duration) end

---`Method Public Instance Virtual`
---@overload fun(playerName:System.String)
---@param endpoint Barotrauma.Networking.Endpoint
_G['GameServer'].UnbanPlayer = function(endpoint) end

---`Method Public Instance`
---@overload fun(senderConnection:Barotrauma.Networking.NetworkConnection, peerDisconnectPacket:Barotrauma.Networking.PeerDisconnectPacket)
---@param client Barotrauma.Networking.Client
---@param peerDisconnectPacket Barotrauma.Networking.PeerDisconnectPacket
_G['GameServer'].DisconnectClient = function(client, peerDisconnectPacket) end

---`Method Private Instance`
_G['GameServer'].UpdateCrewFrame = function() end

---`Method Public Instance`
---@overload fun(txt:System.String, recipient:Barotrauma.Networking.Client, messageType?:Barotrauma.Networking.ChatMessageType)
---@param msg Barotrauma.Networking.ChatMessage
---@param recipient Barotrauma.Networking.Client
_G['GameServer'].SendDirectChatMessage = function(msg, recipient) end

---`Method Public Instance`
---@param txt System.String
---@param recipient Barotrauma.Networking.Client
---@param color? System.Nullable*1Microsoft*Xna*Framework*Color
_G['GameServer'].SendConsoleMessage = function(txt, recipient, color) end

---`Method Public Instance`
---@param message System.String
---@param type? System.Nullable*1Barotrauma*Networking*ChatMessageType
---@param senderClient? Barotrauma.Networking.Client
---@param senderCharacter? Barotrauma.Character
---@param changeType? Barotrauma.Networking.PlayerConnectionChangeType
---@param chatMode? Barotrauma.ChatMode
_G['GameServer'].SendChatMessage = function(message, type, senderClient, senderCharacter, changeType, chatMode) end

---`Method Public Instance`
---@param message Barotrauma.Networking.OrderChatMessage
_G['GameServer'].SendOrderChatMessage = function(message) end

---`Method Private Instance`
---@param transfer Barotrauma.Networking.FileSender.FileTransferOut
_G['GameServer'].FileTransferChanged = function(transfer) end

---`Method Public Instance`
---@param transfer Barotrauma.Networking.FileSender.FileTransferOut
_G['GameServer'].SendCancelTransferMsg = function(transfer) end

---`Method Public Instance`
---@param checkActiveVote? System.Boolean
_G['GameServer'].UpdateVoteStatus = function(checkActiveVote) end

---`Method Public Instance`
---@param recipients (System.Collections.Generic.List*1Barotrauma*Networking*Client)|(Barotrauma.Networking.Client[])
_G['GameServer'].SendVoteStatus = function(recipients) end

---`Method Public Instance`
---@return System.Boolean
_G['GameServer'].TrySwitchSubmarine = function() end

---`Method Public Instance`
---@param client Barotrauma.Networking.Client
_G['GameServer'].UpdateClientPermissions = function(client) end

---`Method Private Instance`
---@param recipient Barotrauma.Networking.Client
---@param client Barotrauma.Networking.Client
---@return (System.Collections.Generic.IEnumerable*1Barotrauma*CoroutineStatus)|(fun():(Barotrauma.CoroutineStatus))
_G['GameServer'].SendClientPermissionsAfterClientListSynced = function(recipient, client) end

---`Method Private Instance`
---@param recipient Barotrauma.Networking.Client
---@param client Barotrauma.Networking.Client
_G['GameServer'].SendClientPermissions = function(recipient, client) end

---`Method Public Instance`
---@overload fun(character:Barotrauma.Character, achievementIdentifier:Barotrauma.Identifier)
---@param client Barotrauma.Networking.Client
---@param achievementIdentifier Barotrauma.Identifier
_G['GameServer'].GiveAchievement = function(client, achievementIdentifier) end

---`Method Public Instance`
---@overload fun(character:Barotrauma.Character, stat:Barotrauma.AchievementStat, amount:System.Int32)
---@param client Barotrauma.Networking.Client
---@param stat Barotrauma.AchievementStat
---@param amount System.Int32
_G['GameServer'].IncrementStat = function(client, stat, amount) end

---`Method Public Instance`
---@param team Barotrauma.CharacterTeamType
---@param identifier Barotrauma.Identifier
_G['GameServer'].UnlockRecipe = function(team, identifier) end

---`Method Public Instance`
---@param msg Barotrauma.Networking.WriteOnlyMessage
---@param client Barotrauma.Networking.Client
_G['GameServer'].SendTraitorMessage = function(msg, client) end

---`Method Public Instance`
_G['GameServer'].UpdateCheatsEnabled = function() end

---`Method Public Instance`
---@param client Barotrauma.Networking.Client
---@param newCharacter Barotrauma.Character
_G['GameServer'].SetClientCharacter = function(client, newCharacter) end

---`Method Private Instance`
---@param message Barotrauma.Networking.IReadMessage
---@param sender Barotrauma.Networking.Client
_G['GameServer'].UpdateCharacterInfo = function(message, sender) end

---`Method Public Instance`
---@param unassigned (System.Collections.Generic.List*1Barotrauma*Networking*Client)|(Barotrauma.Networking.Client[])
_G['GameServer'].AssignJobs = function(unassigned) end

---`Method Public Instance`
---@param bots (System.Collections.Generic.List*1Barotrauma*CharacterInfo)|(Barotrauma.CharacterInfo[])
---@param teamID Barotrauma.CharacterTeamType
---@param isPvP System.Boolean
_G['GameServer'].AssignBotJobs = function(bots, teamID, isPvP) end

---`Method Private Instance`
---@param clients (System.Collections.Generic.List*1Barotrauma*Networking*Client)|(Barotrauma.Networking.Client[])
---@param job Barotrauma.JobPrefab
---@param forceAssign? System.Boolean
---@return Barotrauma.Networking.Client
_G['GameServer'].FindClientWithJobPreference = function(clients, job, forceAssign) end

---`Method Public Instance`
---@param mission Barotrauma.Mission
_G['GameServer'].UpdateMissionState = function(mission) end

---`Method Public Static`
---@param character Barotrauma.Character
---@return System.String
_G['GameServer'].CharacterLogName = function(character) end

---`Method Public Static`
---@param line System.String
---@param messageType Barotrauma.Networking.ServerLog.MessageType
_G['GameServer'].Log = function(line, messageType) end

---`Method Public Instance`
_G['GameServer'].Quit = function() end

---`Method Private Instance`
_G['GameServer'].UpdateClientLobbies = function() end

---`Method Private Instance`
---@return (System.Collections.Generic.List*1Barotrauma*Networking*Client)|(Barotrauma.Networking.Client[])
_G['GameServer'].GetPlayingClients = function() end

---`Method Public Instance`
---@param assignUnassignedNow? System.Boolean
---@param autoBalanceNow? System.Boolean
_G['GameServer'].RefreshPvpTeamAssignments = function(assignUnassignedNow, autoBalanceNow) end

---`Method Public Instance`
---@param client Barotrauma.Networking.Client
_G['GameServer'].AssignClientToPvpTeamMidgame = function(client) end

---`Method Private Instance`
_G['GameServer'].StopAutoBalanceCountdown = function() end

---`Constructor Public Instance`
---@overload fun(name:System.String, listenIp:System.Net.IPAddress, port:System.Int32, queryPort:System.Int32, isPublic:System.Boolean, password:System.String, attemptUPnP:System.Boolean, maxPlayers:System.Int32, ownerKey:Barotrauma.Option*1System*Int32, ownerEndpoint:Barotrauma.Option*1Barotrauma*Networking*P2PEndpoint):Barotrauma.Networking.GameServer
---@return Barotrauma.Networking.GameServer
_G['GameServer'] = function() end

---`Constructor Public Instance`
---@overload fun(name:System.String, listenIp:System.Net.IPAddress, port:System.Int32, queryPort:System.Int32, isPublic:System.Boolean, password:System.String, attemptUPnP:System.Boolean, maxPlayers:System.Int32, ownerKey:Barotrauma.Option*1System*Int32, ownerEndpoint:Barotrauma.Option*1Barotrauma*Networking*P2PEndpoint):Barotrauma.Networking.GameServer
---@return Barotrauma.Networking.GameServer
_G['GameServer'].__new = function() end

---`Constructor Private Static`
---@overload fun(name:System.String, listenIp:System.Net.IPAddress, port:System.Int32, queryPort:System.Int32, isPublic:System.Boolean, password:System.String, attemptUPnP:System.Boolean, maxPlayers:System.Int32, ownerKey:Barotrauma.Option*1System*Int32, ownerEndpoint:Barotrauma.Option*1Barotrauma*Networking*P2PEndpoint):Barotrauma.Networking.GameServer
---@return Barotrauma.Networking.GameServer
_G['GameServer'] = function() end

---`Constructor Private Static`
---@overload fun(name:System.String, listenIp:System.Net.IPAddress, port:System.Int32, queryPort:System.Int32, isPublic:System.Boolean, password:System.String, attemptUPnP:System.Boolean, maxPlayers:System.Int32, ownerKey:Barotrauma.Option*1System*Int32, ownerEndpoint:Barotrauma.Option*1Barotrauma*Networking*P2PEndpoint):Barotrauma.Networking.GameServer
---@return Barotrauma.Networking.GameServer
_G['GameServer'].__new = function() end

