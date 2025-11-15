---@meta
---@class Barotrauma.Networking.Address : System.Object
---`Getter Public Instance Abstract Virtual`
---@field StringRepresentation System.String
---`Getter Public Instance Abstract Virtual`
---@field IsLocalHost System.Boolean
_G['Address'] = {}

---`Method Public Static`
---@param str System.String
---@return Barotrauma.Option*1Barotrauma*Networking*Address
_G['Address'].Parse = function(str) end

---`Method Public Instance Abstract Virtual`
---@param obj System.Object
---@return System.Boolean
_G['Address'].Equals = function(obj) end

---`Method Public Instance Abstract Virtual`
---@return System.Int32
_G['Address'].GetHashCode = function() end

---`Method Public Instance Virtual`
---@return System.String
_G['Address'].ToString = function() end

---`Constructor NonPublic Instance`
---@return Barotrauma.Networking.Address
_G['Address'] = function() end

---`Constructor NonPublic Instance`
---@return Barotrauma.Networking.Address
_G['Address'].__new = function() end

