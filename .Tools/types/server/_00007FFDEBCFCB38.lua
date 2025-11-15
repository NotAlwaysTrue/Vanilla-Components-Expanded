---@meta
---@class Barotrauma.LuaCsNetworking : System.Object
---`Field Private Instance`
---@field clientRegisterCount (System.Collections.Generic.Dictionary*1System*String*1System*Int32)|({[System.String]:(System.Int32)})
---`Field Private Instance`
---@field currentId System.UInt16
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
---`Field Private Static`
---@field MaxRegisterPerClient System.Int32
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field FileSenderMaxPacketsPerUpdate System.Int32
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field LastClientListUpdateID System.UInt16
_G['Networking'] = {}

---`Method Public Instance`
---@param netMessage Barotrauma.Networking.IReadMessage
---@param header Barotrauma.Networking.ClientPacketHeader
---@param client? Barotrauma.Networking.Client
_G['Networking'].NetMessageReceived = function(netMessage, header, client) end

---`Method Private Instance`
---@param netMessage Barotrauma.Networking.IReadMessage
---@param client? Barotrauma.Networking.Client
_G['Networking'].HandleNetMessageId = function(netMessage, client) end

---`Method Public Instance`
---@overload fun(netMessageName:System.String):(Barotrauma.Networking.IWriteMessage)
---@return Barotrauma.Networking.IWriteMessage
_G['Networking'].Start = function() end

---`Method Public Instance`
---@param netMessageName System.String
---@param callback (Barotrauma.LuaCsAction)|(fun(...:System.Object))
_G['Networking'].Receive = function(netMessageName, callback) end

---`Method Public Instance`
---@param name System.String
---@return System.UInt16
_G['Networking'].RegisterId = function(name) end

---`Method Private Instance`
---@param netMessage Barotrauma.Networking.IReadMessage
---@param client Barotrauma.Networking.Client
_G['Networking'].RequestIdSingle = function(netMessage, client) end

---`Method Private Instance`
---@param id System.UInt16
---@param name System.String
_G['Networking'].WriteIdToAll = function(id, name) end

---`Method Private Instance`
---@param client Barotrauma.Networking.Client
_G['Networking'].WriteAllIds = function(client) end

---`Method Public Instance`
---@param client Barotrauma.Networking.Client
_G['Networking'].ClientWriteLobby = function(client) end

---`Method Public Instance`
---@param netMessage Barotrauma.Networking.IWriteMessage
---@param connection? Barotrauma.Networking.NetworkConnection
---@param deliveryMethod? Barotrauma.Networking.DeliveryMethod
_G['Networking'].Send = function(netMessage, connection, deliveryMethod) end

---`Method Public Instance`
---@param client Barotrauma.Networking.Client
_G['Networking'].UpdateClientPermissions = function(client) end

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

