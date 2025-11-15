---@meta
---@class Barotrauma.Networking.NetworkMember : System.Object
---`Field NonPublic Instance`
---@field updateTimer System.DateTime
---`Field Public Instance`
---@field ShowNetStats System.Boolean
---`Field Public Instance`
---@field SimulatedRandomLatency System.Single
---`Field Public Instance`
---@field SimulatedMinimumLatency System.Single
---`Field Public Instance`
---@field SimulatedLoss System.Single
---`Field Public Instance`
---@field SimulatedDuplicatesChance System.Single
---`Getter Public Instance`
---@field Character Barotrauma.Character
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field LastClientListUpdateID System.UInt16
---`Getter Public Instance Abstract Virtual`
---@field IsServer System.Boolean
---`Getter Public Instance Abstract Virtual`
---@field IsClient System.Boolean
---`Getter Public Instance Abstract Virtual`
---@field Voting Barotrauma.Voting
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field KarmaManager Barotrauma.KarmaManager
---`Getter Public Instance`
---<br/>`Setter NonPublic Instance`
---@field GameStarted System.Boolean
---`Getter Public Instance Abstract Virtual`
---@field ConnectedClients (System.Collections.Generic.IReadOnlyList*1Barotrauma*Networking*Client)|(Barotrauma.Networking.Client[])
---`Getter Public Instance`
---<br/>`Setter NonPublic Instance`
---@field RespawnManager Barotrauma.Networking.RespawnManager
---`Getter Public Instance`
---<br/>`Setter NonPublic Instance`
---@field ServerSettings Barotrauma.Networking.ServerSettings
---`Getter Public Instance`
---@field UpdateInterval System.TimeSpan
_G['NetworkMember'] = {}

---`Method Public Instance Abstract Virtual`
---@param entity Barotrauma.Networking.INetSerializable
---@param extraData? Barotrauma.Networking.NetEntityEvent.IData
_G['NetworkMember'].CreateEntityEvent = function(entity, extraData) end

---`Method Public Instance`
---@param message System.String
---@param type Barotrauma.Networking.ChatMessageType
---@param senderName? System.String
---@param senderClient? Barotrauma.Networking.Client
---@param senderEntity? Barotrauma.Entity
---@param changeType? Barotrauma.Networking.PlayerConnectionChangeType
---@param textColor? System.Nullable*1Microsoft*Xna*Framework*Color
_G['NetworkMember'].AddChatMessage = function(message, type, senderName, senderClient, senderEntity, changeType, textColor) end

---`Method Public Instance Abstract Virtual`
---@param message Barotrauma.Networking.ChatMessage
_G['NetworkMember'].AddChatMessage = function(message) end

---`Method Public Static`
---@param client Barotrauma.Networking.Client
---@param name? System.String
---@return System.String
_G['NetworkMember'].ClientLogName = function(client, name) end

---`Method Public Instance Abstract Virtual`
---@param kickedName System.String
---@param reason System.String
_G['NetworkMember'].KickPlayer = function(kickedName, reason) end

---`Method Public Instance Abstract Virtual`
---@param kickedName System.String
---@param reason System.String
---@param duration? System.Nullable*1System*TimeSpan
_G['NetworkMember'].BanPlayer = function(kickedName, reason, duration) end

---`Method Public Instance Abstract Virtual`
---@overload fun(playerName:System.String)
---@param endpoint Barotrauma.Networking.Endpoint
_G['NetworkMember'].UnbanPlayer = function(endpoint) end

---`Method Public Static`
---@param myVersion System.Version
---@param remoteVersion System.Version
---@return System.Boolean
_G['NetworkMember'].IsCompatible = function(myVersion, remoteVersion) end

---`Constructor NonPublic Instance`
---@return Barotrauma.Networking.NetworkMember
_G['NetworkMember'] = function() end

---`Constructor NonPublic Instance`
---@return Barotrauma.Networking.NetworkMember
_G['NetworkMember'].__new = function() end

