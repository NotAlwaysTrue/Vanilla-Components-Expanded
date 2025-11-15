---@meta
---@class Barotrauma.Networking.ClientPeer : System.Object
---`Field Public Instance`
---@field AutomaticallyAttemptedPassword System.String
---`Field NonPublic Instance`
---@field callbacks Barotrauma.Networking.ClientPeer.Callbacks
---`Field Public Instance`
---@field ServerEndpoint Barotrauma.Networking.Endpoint
---`Field Public Instance`
---@field AllServerEndpoints (System.Collections.Immutable.ImmutableArray*1Barotrauma*Networking*Endpoint)|(Barotrauma.Networking.Endpoint[])
---`Field NonPublic Instance`
---@field ownerKey Barotrauma.Option*1System*Int32
---`Field NonPublic Instance`
---@field isActive System.Boolean
---`Field NonPublic Instance`
---@field initializationStep Barotrauma.Networking.ConnectionInitialization
---`Field NonPublic Instance`
---@field passwordSalt System.Int32
---`Field NonPublic Instance`
---@field authTicket Barotrauma.Option*1Barotrauma*Networking*AuthenticationTicket
---`Field Private Instance`
---@field passwordMsgBox Barotrauma.GUIMessageBox
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field ServerContentPackages (System.Collections.Immutable.ImmutableArray*1Barotrauma*Networking*ServerContentPackage)|(Barotrauma.Networking.ServerContentPackage[])
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field AllowModDownloads System.Boolean
---`Getter Public Instance`
---<br/>`Setter NonPublic Instance`
---@field ServerConnection Barotrauma.Networking.NetworkConnection
---`Getter NonPublic Instance`
---@field IsOwner System.Boolean
---`Getter Public Instance`
---@field IsActive System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field ContentPackageOrderReceived System.Boolean
---`Getter Public Instance`
---@field WaitingForPassword System.Boolean
_G['ClientPeer'] = {}

---`Method Public Instance Abstract Virtual`
_G['ClientPeer'].Start = function() end

---`Method Public Instance Abstract Virtual`
---@param peerDisconnectPacket Barotrauma.Networking.PeerDisconnectPacket
_G['ClientPeer'].Close = function(peerDisconnectPacket) end

---`Method Public Instance Abstract Virtual`
---@param deltaTime System.Single
_G['ClientPeer'].Update = function(deltaTime) end

---`Method Public Instance Abstract Virtual`
---@param msg Barotrauma.Networking.IWriteMessage
---@param deliveryMethod Barotrauma.Networking.DeliveryMethod
---@param compressPastThreshold? System.Boolean
_G['ClientPeer'].Send = function(msg, deliveryMethod, compressPastThreshold) end

---`Method Public Instance Abstract Virtual`
---@param password System.String
_G['ClientPeer'].SendPassword = function(password) end

---`Method NonPublic Instance Abstract Virtual`
---@param headers Barotrauma.Networking.PeerPacketHeaders
---@param body Barotrauma.INetSerializableStruct
_G['ClientPeer'].SendMsgInternal = function(headers, body) end

---`Method NonPublic Instance Abstract Virtual`
---@return System.Threading.Tasks.Task*1Barotrauma*Option*2Barotrauma*Networking*AccountId
_G['ClientPeer'].GetAccountId = function() end

---`Method NonPublic Instance`
_G['ClientPeer'].OnInitializationComplete = function() end

---`Method NonPublic Instance`
---@param inc Barotrauma.Networking.ClientPeer.IncomingInitializationMessage
_G['ClientPeer'].ReadConnectionInitializationStep = function(inc) end

---`Method Public Instance Abstract Virtual`
_G['ClientPeer'].ForceTimeOut = function() end

---`Method Public Instance Abstract Virtual`
---@param msg Barotrauma.Networking.IWriteMessage
_G['ClientPeer'].DebugSendRawMessage = function(msg) end

---`Constructor NonPublic Instance`
---@param serverEndpoint Barotrauma.Networking.Endpoint
---@param allServerEndpoints (System.Collections.Immutable.ImmutableArray*1Barotrauma*Networking*Endpoint)|(Barotrauma.Networking.Endpoint[])
---@param callbacks Barotrauma.Networking.ClientPeer.Callbacks
---@param ownerKey Barotrauma.Option*1System*Int32
---@return Barotrauma.Networking.ClientPeer
_G['ClientPeer'] = function(serverEndpoint, allServerEndpoints, callbacks, ownerKey) end

---`Constructor NonPublic Instance`
---@param serverEndpoint Barotrauma.Networking.Endpoint
---@param allServerEndpoints (System.Collections.Immutable.ImmutableArray*1Barotrauma*Networking*Endpoint)|(Barotrauma.Networking.Endpoint[])
---@param callbacks Barotrauma.Networking.ClientPeer.Callbacks
---@param ownerKey Barotrauma.Option*1System*Int32
---@return Barotrauma.Networking.ClientPeer
_G['ClientPeer'].__new = function(serverEndpoint, allServerEndpoints, callbacks, ownerKey) end

