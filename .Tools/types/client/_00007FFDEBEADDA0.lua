---@meta
---@class Barotrauma.Option*1Barotrauma*Networking*SteamId : System.ValueType
---`Field Private Instance`
---@field hasValue System.Boolean
---`Field Private Instance`
---@field value Barotrauma.Networking.SteamId
_G['Option*1Barotrauma*Networking*SteamId'] = {}

---`Method Public Instance`
---@return System.Boolean
_G['Option*1Barotrauma*Networking*SteamId'].IsSome = function() end

---`Method Public Instance`
---@return System.Boolean
_G['Option*1Barotrauma*Networking*SteamId'].IsNone = function() end

---`Method Public Instance`
---@overload fun(outValue:Barotrauma.T1-ref):(System.Boolean)
---@param outValue Barotrauma.Networking.SteamId-ref
---@return System.Boolean
_G['Option*1Barotrauma*Networking*SteamId'].TryUnwrap = function(outValue) end

---`Method Public Instance`
---@param selector (System.Func*1Barotrauma*Networking*SteamId*1Barotrauma*Option*TType)|(fun(arg:Barotrauma.Networking.SteamId):(Barotrauma.Option.TType))
---@return Barotrauma.Option*1Barotrauma*Option*TType
_G['Option*1Barotrauma*Networking*SteamId'].Select = function(selector) end

---`Method Public Instance`
---@overload fun(binder:(System.Func*1Barotrauma*Networking*SteamId*1Barotrauma*Option*2Barotrauma*Option*TType)|(fun(arg:Barotrauma.Networking.SteamId):(Barotrauma.Option*1Barotrauma*Option*TType))):(Barotrauma.Option*1Barotrauma*Option*TType)
---@param binder (System.Func*1Barotrauma*Networking*SteamId*1System*Threading*Tasks*Task*2Barotrauma*Option*3Barotrauma*Option*TType)|(fun(arg:Barotrauma.Networking.SteamId):(System.Threading.Tasks.Task*1Barotrauma*Option*2Barotrauma*Option*TType))
---@return System.Threading.Tasks.Task*1Barotrauma*Option*2Barotrauma*Option*TType
_G['Option*1Barotrauma*Networking*SteamId'].Bind = function(binder) end

---`Method Public Instance`
---@overload fun(some:(System.Func*1Barotrauma*Networking*SteamId*1Barotrauma*Networking*SteamId)|(fun(arg:Barotrauma.Networking.SteamId):(Barotrauma.Networking.SteamId)), none:(System.Func*1Barotrauma*Networking*SteamId)|(fun():(Barotrauma.Networking.SteamId))):(Barotrauma.Networking.SteamId)
---@param some (System.Action*1Barotrauma*Networking*SteamId)|(fun(obj:Barotrauma.Networking.SteamId))
---@param none (System.Action)|(fun())
_G['Option*1Barotrauma*Networking*SteamId'].Match = function(some, none) end

---`Method Public Instance`
---@overload fun(fallback:Barotrauma.Networking.SteamId):(Barotrauma.Networking.SteamId)
---@param fallback Barotrauma.Option*1Barotrauma*Networking*SteamId
---@return Barotrauma.Option*1Barotrauma*Networking*SteamId
_G['Option*1Barotrauma*Networking*SteamId'].Fallback = function(fallback) end

---`Method Public Static`
---@param value Barotrauma.Networking.SteamId
---@return Barotrauma.Option*1Barotrauma*Networking*SteamId
_G['Option*1Barotrauma*Networking*SteamId'].Some = function(value) end

---`Method Public Instance Virtual`
---@param obj System.Object
---@return System.Boolean
_G['Option*1Barotrauma*Networking*SteamId'].Equals = function(obj) end

---`Method Public Instance`
---@param otherValue Barotrauma.Networking.SteamId
---@return System.Boolean
_G['Option*1Barotrauma*Networking*SteamId'].ValueEquals = function(otherValue) end

---`Method Public Instance Virtual`
---@return System.Int32
_G['Option*1Barotrauma*Networking*SteamId'].GetHashCode = function() end

---`Method Public Static`
---@return Barotrauma.Option*1Barotrauma*Networking*SteamId
_G['Option*1Barotrauma*Networking*SteamId'].None = function() end

---`Method Public Instance Virtual`
---@return System.String
_G['Option*1Barotrauma*Networking*SteamId'].ToString = function() end

---`Constructor Private Instance`
---@param hasValue System.Boolean
---@param value Barotrauma.Networking.SteamId
---@return Barotrauma.Option*1Barotrauma*Networking*SteamId
_G['Option*1Barotrauma*Networking*SteamId'] = function(hasValue, value) end

---`Constructor Private Instance`
---@param hasValue System.Boolean
---@param value Barotrauma.Networking.SteamId
---@return Barotrauma.Option*1Barotrauma*Networking*SteamId
_G['Option*1Barotrauma*Networking*SteamId'].__new = function(hasValue, value) end

