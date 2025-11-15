---@meta
---@class Barotrauma.Networking.P2PServerPeer : Barotrauma.Networking.ServerPeer*1Barotrauma*Networking*P2PConnection
---`Field Private Instance`
---@field started System.Boolean
---`Field Private Instance`
---@field ownerEndpoint Barotrauma.Networking.P2PEndpoint
_G['P2PServerPeer'] = {}

---`Method Public Instance Virtual`
_G['P2PServerPeer'].Start = function() end

---`Method Public Instance Virtual`
_G['P2PServerPeer'].Close = function() end

---`Method Public Instance Virtual`
---@param deltaTime System.Single
_G['P2PServerPeer'].Update = function(deltaTime) end

---`Method Private Instance`
---@param inc Barotrauma.Networking.IReadMessage
_G['P2PServerPeer'].HandleDataMessage = function(inc) end

---`Method Public Instance Virtual`
---@param msg Barotrauma.Networking.IWriteMessage
---@param conn Barotrauma.Networking.NetworkConnection
---@param deliveryMethod Barotrauma.Networking.DeliveryMethod
---@param compressPastThreshold? System.Boolean
_G['P2PServerPeer'].Send = function(msg, conn, deliveryMethod, compressPastThreshold) end

---`Method Private Instance`
---@param endpoint Barotrauma.Networking.P2PEndpoint
---@param peerDisconnectPacket Barotrauma.Networking.PeerDisconnectPacket
_G['P2PServerPeer'].SendDisconnectMessage = function(endpoint, peerDisconnectPacket) end

---`Method Public Instance Virtual`
---@param conn Barotrauma.Networking.NetworkConnection
---@param peerDisconnectPacket Barotrauma.Networking.PeerDisconnectPacket
_G['P2PServerPeer'].Disconnect = function(conn, peerDisconnectPacket) end

---`Method NonPublic Instance Virtual`
---@param conn Barotrauma.Networking.P2PConnection
---@param headers Barotrauma.Networking.PeerPacketHeaders
---@param body Barotrauma.INetSerializableStruct
_G['P2PServerPeer'].SendMsgInternal = function(conn, headers, body) end

---`Method Private Instance`
---@param connEndpoint Barotrauma.Networking.P2PEndpoint
---@param headers Barotrauma.Networking.PeerPacketHeaders
---@param body Barotrauma.INetSerializableStruct
_G['P2PServerPeer'].SendMsgInternal = function(connEndpoint, headers, body) end

---`Method Private Static`
---@param msg Barotrauma.Networking.IWriteMessage
_G['P2PServerPeer'].ForwardToOwnerProcess = function(msg) end

---`Method NonPublic Instance Virtual`
---@param packet Barotrauma.Networking.ClientAuthTicketAndVersionPacket
---@param pendingClient Barotrauma.Networking.ServerPeer.PendingClient*1Barotrauma*Networking*P2PConnection
_G['P2PServerPeer'].ProcessAuthTicket = function(packet, pendingClient) end

---`Constructor Public Instance`
---@param ownerEp Barotrauma.Networking.P2PEndpoint
---@param ownerKey System.Int32
---@param settings Barotrauma.Networking.ServerSettings
---@param callbacks Barotrauma.Networking.ServerPeer.Callbacks
---@return Barotrauma.Networking.P2PServerPeer
_G['P2PServerPeer'] = function(ownerEp, ownerKey, settings, callbacks) end

---`Constructor Public Instance`
---@param ownerEp Barotrauma.Networking.P2PEndpoint
---@param ownerKey System.Int32
---@param settings Barotrauma.Networking.ServerSettings
---@param callbacks Barotrauma.Networking.ServerPeer.Callbacks
---@return Barotrauma.Networking.P2PServerPeer
_G['P2PServerPeer'].__new = function(ownerEp, ownerKey, settings, callbacks) end

