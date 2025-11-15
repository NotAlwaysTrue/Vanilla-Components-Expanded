---@meta
---@class Barotrauma.Networking.AccountInfo : System.ValueType
---`Field Public Instance`
---@field AccountId Barotrauma.Option*1Barotrauma*Networking*AccountId
---`Field Public Instance`
---@field OtherMatchingIds (System.Collections.Immutable.ImmutableArray*1Barotrauma*Networking*AccountId)|(Barotrauma.Networking.AccountId[])
---`Field Public Static`
---@field None Barotrauma.Networking.AccountInfo
---`Getter Public Instance`
---@field IsNone System.Boolean
_G['AccountInfo'] = {}

---`Method Public Instance`
---@param accountId Barotrauma.Networking.AccountId
---@return System.Boolean
_G['AccountInfo'].Matches = function(accountId) end

---`Method Public Instance Virtual`
---@param obj System.Object
---@return System.Boolean
_G['AccountInfo'].Equals = function(obj) end

---`Method Public Instance Virtual`
---@return System.Int32
_G['AccountInfo'].GetHashCode = function() end

---`Constructor Public Instance`
---@overload fun(accountId:Barotrauma.Networking.AccountId, ...:Barotrauma.Networking.AccountId):Barotrauma.Networking.AccountInfo
---@overload fun(accountId:Barotrauma.Option*1Barotrauma*Networking*AccountId, ...:Barotrauma.Networking.AccountId):Barotrauma.Networking.AccountInfo
---@return Barotrauma.Networking.AccountInfo
_G['AccountInfo'] = function() end

---`Constructor Public Instance`
---@overload fun(accountId:Barotrauma.Networking.AccountId, ...:Barotrauma.Networking.AccountId):Barotrauma.Networking.AccountInfo
---@overload fun(accountId:Barotrauma.Option*1Barotrauma*Networking*AccountId, ...:Barotrauma.Networking.AccountId):Barotrauma.Networking.AccountInfo
---@return Barotrauma.Networking.AccountInfo
_G['AccountInfo'].__new = function() end

---`Constructor Private Static`
---@overload fun(accountId:Barotrauma.Networking.AccountId, ...:Barotrauma.Networking.AccountId):Barotrauma.Networking.AccountInfo
---@overload fun(accountId:Barotrauma.Option*1Barotrauma*Networking*AccountId, ...:Barotrauma.Networking.AccountId):Barotrauma.Networking.AccountInfo
---@return Barotrauma.Networking.AccountInfo
_G['AccountInfo'] = function() end

---`Constructor Private Static`
---@overload fun(accountId:Barotrauma.Networking.AccountId, ...:Barotrauma.Networking.AccountId):Barotrauma.Networking.AccountInfo
---@overload fun(accountId:Barotrauma.Option*1Barotrauma*Networking*AccountId, ...:Barotrauma.Networking.AccountId):Barotrauma.Networking.AccountInfo
---@return Barotrauma.Networking.AccountInfo
_G['AccountInfo'].__new = function() end

