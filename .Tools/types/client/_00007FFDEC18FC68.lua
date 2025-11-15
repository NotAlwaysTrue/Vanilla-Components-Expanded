---@meta
---@class Barotrauma.Networking.LidgrenClientPeer : Barotrauma.Networking.ClientPeer*1Barotrauma*Networking*LidgrenEndpoint
---`Field Private Instance`
---@field netClient Lidgren.Network.NetClient
---`Field Private Instance`
---@field netPeerConfiguration Lidgren.Network.NetPeerConfiguration
---`Field Private Instance`
---@field incomingLidgrenMessages (System.Collections.Generic.List*1Lidgren*Network*NetIncomingMessage)|(Lidgren.Network.NetIncomingMessage[])
_G['LidgrenClientPeer'] = {}

---`Method Public Instance Virtual`
_G['LidgrenClientPeer'].Start = function() end

---`Method Public Instance Virtual`
---@param deltaTime System.Single
_G['LidgrenClientPeer'].Update = function(deltaTime) end

---`Method Private Instance`
---@param lidgrenMsg Lidgren.Network.NetIncomingMessage
_G['LidgrenClientPeer'].HandleDataMessage = function(lidgrenMsg) end

---`Method Private Instance`
---@param inc Lidgren.Network.NetIncomingMessage
_G['LidgrenClientPeer'].HandleStatusChanged = function(inc) end

---`Method Public Instance Virtual`
---@param password System.String
_G['LidgrenClientPeer'].SendPassword = function(password) end

---`Method Public Instance Virtual`
---@param peerDisconnectPacket Barotrauma.Networking.PeerDisconnectPacket
_G['LidgrenClientPeer'].Close = function(peerDisconnectPacket) end

---`Method Public Instance Virtual`
---@param msg Barotrauma.Networking.IWriteMessage
---@param deliveryMethod Barotrauma.Networking.DeliveryMethod
---@param compressPastThreshold? System.Boolean
_G['LidgrenClientPeer'].Send = function(msg, deliveryMethod, compressPastThreshold) end

---`Method NonPublic Instance Virtual`
---@param headers Barotrauma.Networking.PeerPacketHeaders
---@param body Barotrauma.INetSerializableStruct
_G['LidgrenClientPeer'].SendMsgInternal = function(headers, body) end

---`Method Private Instance`
---@param msg Barotrauma.Networking.IWriteMessage
---@param deliveryMethod Barotrauma.Networking.DeliveryMethod
---@return Lidgren.Network.NetSendResult
_G['LidgrenClientPeer'].ForwardToLidgren = function(msg, deliveryMethod) end

---`Method NonPublic Instance Virtual`
---@return System.Threading.Tasks.Task*1Barotrauma*Option*2Barotrauma*Networking*AccountId
_G['LidgrenClientPeer'].GetAccountId = function() end

---`Method Public Instance Virtual`
_G['LidgrenClientPeer'].ForceTimeOut = function() end

---`Method Public Instance Virtual`
---@param msg Barotrauma.Networking.IWriteMessage
_G['LidgrenClientPeer'].DebugSendRawMessage = function(msg) end

---`Constructor Public Instance`
---@param endpoint Barotrauma.Networking.LidgrenEndpoint
---@param callbacks Barotrauma.Networking.ClientPeer.Callbacks
---@param ownerKey Barotrauma.Option*1System*Int32
---@return Barotrauma.Networking.LidgrenClientPeer
_G['LidgrenClientPeer'] = function(endpoint, callbacks, ownerKey) end

---`Constructor Public Instance`
---@param endpoint Barotrauma.Networking.LidgrenEndpoint
---@param callbacks Barotrauma.Networking.ClientPeer.Callbacks
---@param ownerKey Barotrauma.Option*1System*Int32
---@return Barotrauma.Networking.LidgrenClientPeer
_G['LidgrenClientPeer'].__new = function(endpoint, callbacks, ownerKey) end

