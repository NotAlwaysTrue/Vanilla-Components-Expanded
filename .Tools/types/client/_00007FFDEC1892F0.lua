---@meta
---@class Barotrauma.Networking.LidgrenConnection : Barotrauma.Networking.NetworkConnection*1Barotrauma*Networking*LidgrenEndpoint
---`Field Public Instance`
---@field NetConnection Lidgren.Network.NetConnection
_G['LidgrenConnection'] = {}

---`Method Public Instance Virtual`
---@param other Barotrauma.Networking.NetworkConnection
---@return System.Boolean
_G['LidgrenConnection'].AddressMatches = function(other) end

---`Constructor Public Instance`
---@param netConnection Lidgren.Network.NetConnection
---@return Barotrauma.Networking.LidgrenConnection
_G['LidgrenConnection'] = function(netConnection) end

---`Constructor Public Instance`
---@param netConnection Lidgren.Network.NetConnection
---@return Barotrauma.Networking.LidgrenConnection
_G['LidgrenConnection'].__new = function(netConnection) end

