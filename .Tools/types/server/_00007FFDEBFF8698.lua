---@meta
---@class Barotrauma.Networking.ServerPeer : System.Object
---`Field NonPublic Instance`
---@field callbacks Barotrauma.Networking.ServerPeer.Callbacks
_G['ServerPeer'] = {}

---`Method Public Instance Abstract Virtual`
_G['ServerPeer'].Start = function() end

---`Method Public Instance Abstract Virtual`
_G['ServerPeer'].Close = function() end

---`Method Public Instance Abstract Virtual`
---@param deltaTime System.Single
_G['ServerPeer'].Update = function(deltaTime) end

---`Method Public Instance Abstract Virtual`
---@param msg Barotrauma.Networking.IWriteMessage
---@param conn Barotrauma.Networking.NetworkConnection
---@param deliveryMethod Barotrauma.Networking.DeliveryMethod
---@param compressPastThreshold? System.Boolean
_G['ServerPeer'].Send = function(msg, conn, deliveryMethod, compressPastThreshold) end

---`Method Public Instance Abstract Virtual`
---@param conn Barotrauma.Networking.NetworkConnection
---@param peerDisconnectPacket Barotrauma.Networking.PeerDisconnectPacket
_G['ServerPeer'].Disconnect = function(conn, peerDisconnectPacket) end

---`Method Private Instance`
---@param conn Barotrauma.Networking.NetworkConnection
_G['ServerPeer'].LogMalformedMessage = function(conn) end

---`Method NonPublic Static`
_G['ServerPeer'].LogMalformedMessage = function() end

---`Method NonPublic Instance`
---@param serverSettings Barotrauma.Networking.ServerSettings
---@param connection Barotrauma.Networking.NetworkConnection
---@return System.Boolean
_G['ServerPeer'].ShouldAskForPassword = function(serverSettings, connection) end

---`Constructor NonPublic Instance`
---@param callbacks Barotrauma.Networking.ServerPeer.Callbacks
---@return Barotrauma.Networking.ServerPeer
_G['ServerPeer'] = function(callbacks) end

---`Constructor NonPublic Instance`
---@param callbacks Barotrauma.Networking.ServerPeer.Callbacks
---@return Barotrauma.Networking.ServerPeer
_G['ServerPeer'].__new = function(callbacks) end

