---@meta
---@class Barotrauma.LuaCsNetworking : System.Object
---`Field Private Instance`
---@field receiveQueue (System.Collections.Generic.Dictionary*1System*UInt16*1System*Collections*Generic*Queue*2Barotrauma*Networking*IReadMessage)|({[System.UInt16]:((System.Collections.Generic.Queue*1Barotrauma*Networking*IReadMessage)|(fun():(Barotrauma.Networking.IReadMessage)))})
---`Field Public Instance`
---@field RestrictMessageSize System.Boolean
---`Field Private Instance`
---@field netReceives (System.Collections.Generic.Dictionary*1System*String*1Barotrauma*LuaCsAction)|({[System.String]:((Barotrauma.LuaCsAction)|(fun(...:System.Object)))})
---`Field Private Instance`
---@field idToString (System.Collections.Generic.Dictionary*1System*UInt16*1System*String)|({[System.UInt16]:(System.String)})
---`Field Private Instance`
---@field stringToId (System.Collections.Generic.Dictionary*1System*String*1System*UInt16)|({[System.String]:(System.UInt16)})
---`Field Private Static`
---@field client System.Net.Http.HttpClient
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field LastClientListUpdateID System.UInt16
_G['Networking'] = {}

---`Method Public Instance`
_G['Networking'].SendSyncMessage = function() end

---`Method Public Instance`
---@param netMessage Barotrauma.Networking.IReadMessage
---@param header Barotrauma.Networking.ServerPacketHeader
---@param client? Barotrauma.Networking.Client
_G['Networking'].NetMessageReceived = function(netMessage, header, client) end

---`Method Public Instance`
---@overload fun(netMessageName:System.String):(Barotrauma.Networking.IWriteMessage)
---@return Barotrauma.Networking.IWriteMessage
_G['Networking'].Start = function() end

---`Method Public Instance`
---@param netMessageName System.String
---@param callback (Barotrauma.LuaCsAction)|(fun(...:System.Object))
_G['Networking'].Receive = function(netMessageName, callback) end

---`Method Public Instance`
---@param netMessageName System.String
_G['Networking'].RequestId = function(netMessageName) end

---`Method Public Instance`
---@param netMessage Barotrauma.Networking.IWriteMessage
---@param deliveryMethod? Barotrauma.Networking.DeliveryMethod
_G['Networking'].Send = function(netMessage, deliveryMethod) end

---`Method Private Instance`
---@param netMessage Barotrauma.Networking.IReadMessage
---@param client? Barotrauma.Networking.Client
_G['Networking'].HandleNetMessageId = function(netMessage, client) end

---`Method Private Instance`
---@param netMessage Barotrauma.Networking.IReadMessage
_G['Networking'].ReadIds = function(netMessage) end

---`Method Public Instance`
_G['Networking'].Initialize = function() end

---`Method Public Instance`
---@param netMessageName System.String
_G['Networking'].Remove = function(netMessageName) end

---`Method Public Instance`
---@param id System.UInt16
---@return System.String
_G['Networking'].IdToString = function(id) end

---`Method Public Instance`
---@param name System.String
---@return System.UInt16
_G['Networking'].StringToId = function(name) end

---`Method Private Instance`
---@param netMessage Barotrauma.Networking.IReadMessage
---@param name System.String
---@param client? Barotrauma.Networking.Client
_G['Networking'].HandleNetMessage = function(netMessage, name, client) end

---`Method Private Instance`
---@param netMessage Barotrauma.Networking.IReadMessage
---@param client? Barotrauma.Networking.Client
_G['Networking'].HandleNetMessageString = function(netMessage, client) end

---`Method Public Instance`
---@param url System.String
---@param callback (Barotrauma.LuaCsAction)|(fun(...:System.Object))
---@param data? System.String
---@param method? System.String
---@param contentType? System.String
---@param headers? (System.Collections.Generic.Dictionary*1System*String*1System*String)|({[System.String]:(System.String)})
---@param savePath? System.String
_G['Networking'].HttpRequest = function(url, callback, data, method, contentType, headers, savePath) end

---`Method Public Instance`
---@param url System.String
---@param callback (Barotrauma.LuaCsAction)|(fun(...:System.Object))
---@param data System.String
---@param contentType? System.String
---@param headers? (System.Collections.Generic.Dictionary*1System*String*1System*String)|({[System.String]:(System.String)})
---@param savePath? System.String
_G['Networking'].HttpPost = function(url, callback, data, contentType, headers, savePath) end

---`Method Public Instance`
---@param url System.String
---@param callback (Barotrauma.LuaCsAction)|(fun(...:System.Object))
---@param headers? (System.Collections.Generic.Dictionary*1System*String*1System*String)|({[System.String]:(System.String)})
---@param savePath? System.String
_G['Networking'].HttpGet = function(url, callback, headers, savePath) end

---`Method Public Instance`
---@param entity Barotrauma.Networking.INetSerializable
---@param extraData Barotrauma.Networking.NetEntityEvent.IData
_G['Networking'].CreateEntityEvent = function(entity, extraData) end

---`Constructor Public Instance`
---@overload fun():Barotrauma.LuaCsNetworking
---@return Barotrauma.LuaCsNetworking
_G['Networking'] = function() end

---`Constructor Public Instance`
---@overload fun():Barotrauma.LuaCsNetworking
---@return Barotrauma.LuaCsNetworking
_G['Networking'].__new = function() end

---`Constructor Private Static`
---@overload fun():Barotrauma.LuaCsNetworking
---@return Barotrauma.LuaCsNetworking
_G['Networking'] = function() end

---`Constructor Private Static`
---@overload fun():Barotrauma.LuaCsNetworking
---@return Barotrauma.LuaCsNetworking
_G['Networking'].__new = function() end

