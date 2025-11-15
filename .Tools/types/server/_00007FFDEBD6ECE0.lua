---@meta
---@class Barotrauma.Networking.EpicAccountId : Barotrauma.Networking.AccountId
---`Field Private Static`
---@field prefix System.String
---`Getter Public Instance Virtual`
---@field StringRepresentation System.String
---`Getter Public Instance Virtual`
---@field EosStringRepresentation System.String
_G['EpicAccountId'] = {}

---`Method Public Instance Virtual`
---@param obj System.Object
---@return System.Boolean
_G['EpicAccountId'].Equals = function(obj) end

---`Method Public Instance Virtual`
---@return System.Int32
_G['EpicAccountId'].GetHashCode = function() end

---`Method Public Static`
---@param str System.String
---@return Barotrauma.Option*1Barotrauma*Networking*EpicAccountId
_G['EpicAccountId'].Parse = function(str) end

---`Constructor Private Instance`
---@param value System.String
---@return Barotrauma.Networking.EpicAccountId
_G['EpicAccountId'] = function(value) end

---`Constructor Private Instance`
---@param value System.String
---@return Barotrauma.Networking.EpicAccountId
_G['EpicAccountId'].__new = function(value) end

