---@meta
---@class Barotrauma.Networking.SteamId : Barotrauma.Networking.AccountId
---`Field Public Instance`
---@field Value System.UInt64
---`Field Private Static`
---@field steam64Prefix System.String
---`Field Private Static`
---@field steam40Prefix System.String
---`Field Private Static`
---@field usualAccountInstance System.UInt64
---`Field Private Static`
---@field usualAccountType System.UInt64
---`Getter Public Instance Virtual`
---@field StringRepresentation System.String
---`Getter Public Instance Virtual`
---@field EosStringRepresentation System.String
_G['SteamId'] = {}

---`Method Private Static`
---@param id System.UInt64
---@param offset System.Int32
---@param numberOfBits System.Int32
---@return System.UInt64
_G['SteamId'].ExtractBits = function(id, offset, numberOfBits) end

---`Method Private Static`
---@param id System.UInt64
---@return System.UInt64
_G['SteamId'].ExtractY = function(id) end

---`Method Private Static`
---@param id System.UInt64
---@return System.UInt64
_G['SteamId'].ExtractAccountNumberRemainder = function(id) end

---`Method Private Static`
---@param id System.UInt64
---@return System.UInt64
_G['SteamId'].ExtractAccountInstance = function(id) end

---`Method Private Static`
---@param id System.UInt64
---@return System.UInt64
_G['SteamId'].ExtractAccountType = function(id) end

---`Method Private Static`
---@param id System.UInt64
---@return System.UInt64
_G['SteamId'].ExtractUniverse = function(id) end

---`Method Public Instance Virtual`
---@return System.String
_G['SteamId'].ToString = function() end

---`Method Public Static`
---@param str System.String
---@return Barotrauma.Option*1Barotrauma*Networking*SteamId
_G['SteamId'].Parse = function(str) end

---`Method Public Instance Virtual`
---@param obj System.Object
---@return System.Boolean
_G['SteamId'].Equals = function(obj) end

---`Method Public Instance Virtual`
---@return System.Int32
_G['SteamId'].GetHashCode = function() end

---`Constructor Public Instance`
---@param value System.UInt64
---@return Barotrauma.Networking.SteamId
_G['SteamId'] = function(value) end

---`Constructor Public Instance`
---@param value System.UInt64
---@return Barotrauma.Networking.SteamId
_G['SteamId'].__new = function(value) end

