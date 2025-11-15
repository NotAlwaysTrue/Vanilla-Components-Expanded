---@meta
---@class Barotrauma.Networking.EosP2PAddress : Barotrauma.Networking.P2PAddress
---`Field Public Instance`
---@field EosStringRepresentation System.String
---`Field Private Static`
---@field prefix System.String
---`Getter Public Instance Virtual`
---@field StringRepresentation System.String
---`Getter Public Instance Virtual`
---@field IsLocalHost System.Boolean
_G['EosP2PAddress'] = {}

---`Method Public Static`
---@param addressStr System.String
---@return Barotrauma.Option*1Barotrauma*Networking*EosP2PAddress
_G['EosP2PAddress'].Parse = function(addressStr) end

---`Method Public Instance Virtual`
---@param obj System.Object
---@return System.Boolean
_G['EosP2PAddress'].Equals = function(obj) end

---`Method Public Instance Virtual`
---@return System.Int32
_G['EosP2PAddress'].GetHashCode = function() end

---`Constructor Public Instance`
---@param value System.String
---@return Barotrauma.Networking.EosP2PAddress
_G['EosP2PAddress'] = function(value) end

---`Constructor Public Instance`
---@param value System.String
---@return Barotrauma.Networking.EosP2PAddress
_G['EosP2PAddress'].__new = function(value) end

