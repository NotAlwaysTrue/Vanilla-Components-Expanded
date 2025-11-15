---@meta
---@class Barotrauma.Networking.PipeConnection : Barotrauma.Networking.NetworkConnection*1Barotrauma*Networking*PipeEndpoint
_G['PipeConnection'] = {}

---`Method Public Instance Virtual`
---@param other Barotrauma.Networking.NetworkConnection
---@return System.Boolean
_G['PipeConnection'].AddressMatches = function(other) end

---`Constructor Public Instance`
---@param accountId Barotrauma.Option*1Barotrauma*Networking*AccountId
---@return Barotrauma.Networking.PipeConnection
_G['PipeConnection'] = function(accountId) end

---`Constructor Public Instance`
---@param accountId Barotrauma.Option*1Barotrauma*Networking*AccountId
---@return Barotrauma.Networking.PipeConnection
_G['PipeConnection'].__new = function(accountId) end

