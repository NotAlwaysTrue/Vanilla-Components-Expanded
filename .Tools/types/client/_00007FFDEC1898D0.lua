---@meta
---@class Barotrauma.Networking.SteamP2PConnection : Barotrauma.Networking.P2PConnection*1Barotrauma*Networking*SteamP2PEndpoint
_G['SteamP2PConnection'] = {}

---`Method Public Instance Virtual`
---@param other Barotrauma.Networking.NetworkConnection
---@return System.Boolean
_G['SteamP2PConnection'].AddressMatches = function(other) end

---`Constructor Public Instance`
---@overload fun(steamId:Barotrauma.Networking.SteamId):Barotrauma.Networking.SteamP2PConnection
---@param endpoint Barotrauma.Networking.SteamP2PEndpoint
---@return Barotrauma.Networking.SteamP2PConnection
_G['SteamP2PConnection'] = function(endpoint) end

---`Constructor Public Instance`
---@overload fun(steamId:Barotrauma.Networking.SteamId):Barotrauma.Networking.SteamP2PConnection
---@param endpoint Barotrauma.Networking.SteamP2PEndpoint
---@return Barotrauma.Networking.SteamP2PConnection
_G['SteamP2PConnection'].__new = function(endpoint) end

