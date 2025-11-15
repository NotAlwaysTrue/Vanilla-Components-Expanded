---@meta
---@class Steamworks.SteamServer : Steamworks.SteamServerClass*1Steamworks*SteamServer
---`Field Private Static`
---@field OnValidateAuthTicketResponse (System.Action*1Steamworks*SteamId*1Steamworks*SteamId*1Steamworks*AuthResponse)|(fun(arg1:Steamworks.SteamId, arg2:Steamworks.SteamId, arg3:Steamworks.AuthResponse))
---`Field Private Static`
---@field OnSteamServersConnected (System.Action)|(fun())
---`Field Private Static`
---@field OnSteamServerConnectFailure (System.Action*1Steamworks*Result*1System*Boolean)|(fun(arg1:Steamworks.Result, arg2:System.Boolean))
---`Field Private Static`
---@field OnSteamServersDisconnected (System.Action*1Steamworks*Result)|(fun(obj:Steamworks.Result))
---`Field Private Static`
---@field OnSteamNetAuthenticationStatus (System.Action*1Steamworks*SteamNetworkingAvailability)|(fun(obj:Steamworks.SteamNetworkingAvailability))
---`Field Private Static`
---@field openInterfaces (System.Collections.Generic.List*1Steamworks*SteamClass)|(Steamworks.SteamClass[])
---`Field Private Static`
---@field _dedicatedServer System.Boolean
---`Field Private Static`
---@field _maxplayers System.Int32
---`Field Private Static`
---@field _botcount System.Int32
---`Field Private Static`
---@field _mapname System.String
---`Field Private Static`
---@field _modDir System.String
---`Field Private Static`
---@field _product System.String
---`Field Private Static`
---@field _gameDescription System.String
---`Field Private Static`
---@field _serverName System.String
---`Field Private Static`
---@field _passworded System.Boolean
---`Field Private Static`
---@field _gametags System.String
---`Field Private Static`
---@field KeyValue (System.Collections.Generic.Dictionary*1System*String*1System*String)|({[System.String]:(System.String)})
---`Getter NonPublic Static`
---@field Internal Steamworks.ISteamGameServer
---`Getter Public Static`
---@field IsValid System.Boolean
---`Getter Public Static`
---<br/>`Setter Public Static`
---@field DedicatedServer System.Boolean
---`Getter Public Static`
---<br/>`Setter Public Static`
---@field MaxPlayers System.Int32
---`Getter Public Static`
---<br/>`Setter Public Static`
---@field BotCount System.Int32
---`Getter Public Static`
---<br/>`Setter Public Static`
---@field MapName System.String
---`Getter Public Static`
---<br/>`Setter NonPublic Static`
---@field ModDir System.String
---`Getter Public Static`
---<br/>`Setter NonPublic Static`
---@field Product System.String
---`Getter Public Static`
---<br/>`Setter NonPublic Static`
---@field GameDescription System.String
---`Getter Public Static`
---<br/>`Setter Public Static`
---@field ServerName System.String
---`Getter Public Static`
---<br/>`Setter Public Static`
---@field Passworded System.Boolean
---`Getter Public Static`
---<br/>`Setter Public Static`
---@field GameTags System.String
---`Getter Public Static`
---@field SteamId Steamworks.SteamId
---`Getter Public Static`
---@field LoggedOn System.Boolean
---`Getter Public Static`
---@field PublicIp System.Net.IPAddress
---<br/>`Setter Public Static`
---@field AutomaticHeartbeats System.Boolean
---<br/>`Setter Public Static`
---@field AdvertiseServer System.Boolean
_G['Steamworks']['SteamServer'] = {}

---`Method NonPublic Instance Virtual`
---@param server System.Boolean
---@return System.Boolean
_G['Steamworks']['SteamServer'].InitializeInterface = function(server) end

---`Method NonPublic Static`
_G['Steamworks']['SteamServer'].InstallEvents = function() end

---`Method Public Static`
---@param appid Steamworks.AppId
---@param init Steamworks.SteamServerInit
---@param asyncCallbacks? System.Boolean
_G['Steamworks']['SteamServer'].Init = function(appid, init, asyncCallbacks) end

---`Method NonPublic Static`
_G['Steamworks']['SteamServer'].AddInterface = function() end

---`Method NonPublic Static`
_G['Steamworks']['SteamServer'].ShutdownInterfaces = function() end

---`Method Public Static`
_G['Steamworks']['SteamServer'].Shutdown = function() end

---`Method Public Static`
_G['Steamworks']['SteamServer'].RunCallbacks = function() end

---`Method Public Static`
_G['Steamworks']['SteamServer'].LogOnAnonymous = function() end

---`Method Public Static`
_G['Steamworks']['SteamServer'].LogOff = function() end

---`Method Public Static`
_G['Steamworks']['SteamServer'].ForceHeartbeat = function() end

---`Method Public Static`
---@param steamid Steamworks.SteamId
---@param name System.String
---@param score System.Int32
_G['Steamworks']['SteamServer'].UpdatePlayer = function(steamid, name, score) end

---`Method Public Static`
---@param Key System.String
---@param Value System.String
_G['Steamworks']['SteamServer'].SetKey = function(Key, Value) end

---`Method Public Static`
_G['Steamworks']['SteamServer'].ClearKeys = function() end

---`Method Public Static`
---@param data (System.Byte-arr)|(System.Byte[])
---@param steamid Steamworks.SteamId
---@return Steamworks.BeginAuthResult
_G['Steamworks']['SteamServer'].BeginAuthSession = function(data, steamid) end

---`Method Public Static`
---@param steamid Steamworks.SteamId
_G['Steamworks']['SteamServer'].EndAuthSession = function(steamid) end

---`Method Public Static`
---@param packet Steamworks.Data.OutgoingPacket-ref
---@return System.Boolean
_G['Steamworks']['SteamServer'].GetOutgoingPacket = function(packet) end

---`Method Public Static`
---@overload fun(data:(System.Byte-arr)|(System.Byte[]), size:System.Int32, address:System.UInt32, port:System.UInt16)
---@param ptr System.IntPtr
---@param size System.Int32
---@param address System.UInt32
---@param port System.UInt16
_G['Steamworks']['SteamServer'].HandleIncomingPacket = function(ptr, size, address, port) end

---`Method Public Static`
---@param steamid Steamworks.SteamId
---@param appid Steamworks.AppId
---@return Steamworks.UserHasLicenseForAppResult
_G['Steamworks']['SteamServer'].UserHasLicenseForApp = function(steamid, appid) end

---`Constructor Public Instance`
---@overload fun():Steamworks.SteamServer
---@return Steamworks.SteamServer
_G['Steamworks']['SteamServer'] = function() end

---`Constructor Public Instance`
---@overload fun():Steamworks.SteamServer
---@return Steamworks.SteamServer
_G['Steamworks']['SteamServer'].__new = function() end

---`Constructor Private Static`
---@overload fun():Steamworks.SteamServer
---@return Steamworks.SteamServer
_G['Steamworks']['SteamServer'] = function() end

---`Constructor Private Static`
---@overload fun():Steamworks.SteamServer
---@return Steamworks.SteamServer
_G['Steamworks']['SteamServer'].__new = function() end

