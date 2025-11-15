---@meta
---@class Barotrauma.Option*1Barotrauma*Networking*BannedPlayer : System.ValueType
---`Field Private Instance`
---@field hasValue System.Boolean
---`Field Private Instance`
---@field value Barotrauma.Networking.BannedPlayer
_G['Option*1Barotrauma*Networking*BannedPlayer'] = {}

---`Method Public Instance`
---@return System.Boolean
_G['Option*1Barotrauma*Networking*BannedPlayer'].IsSome = function() end

---`Method Public Instance`
---@return System.Boolean
_G['Option*1Barotrauma*Networking*BannedPlayer'].IsNone = function() end

---`Method Public Instance`
---@overload fun(outValue:Barotrauma.T1-ref):(System.Boolean)
---@param outValue Barotrauma.Networking.BannedPlayer-ref
---@return System.Boolean
_G['Option*1Barotrauma*Networking*BannedPlayer'].TryUnwrap = function(outValue) end

---`Method Public Instance`
---@param selector (System.Func*1Barotrauma*Networking*BannedPlayer*1Barotrauma*Option*TType)|(fun(arg:Barotrauma.Networking.BannedPlayer):(Barotrauma.Option.TType))
---@return Barotrauma.Option*1Barotrauma*Option*TType
_G['Option*1Barotrauma*Networking*BannedPlayer'].Select = function(selector) end

---`Method Public Instance`
---@overload fun(binder:(System.Func*1Barotrauma*Networking*BannedPlayer*1Barotrauma*Option*2Barotrauma*Option*TType)|(fun(arg:Barotrauma.Networking.BannedPlayer):(Barotrauma.Option*1Barotrauma*Option*TType))):(Barotrauma.Option*1Barotrauma*Option*TType)
---@param binder (System.Func*1Barotrauma*Networking*BannedPlayer*1System*Threading*Tasks*Task*2Barotrauma*Option*3Barotrauma*Option*TType)|(fun(arg:Barotrauma.Networking.BannedPlayer):(System.Threading.Tasks.Task*1Barotrauma*Option*2Barotrauma*Option*TType))
---@return System.Threading.Tasks.Task*1Barotrauma*Option*2Barotrauma*Option*TType
_G['Option*1Barotrauma*Networking*BannedPlayer'].Bind = function(binder) end

---`Method Public Instance`
---@overload fun(some:(System.Func*1Barotrauma*Networking*BannedPlayer*1Barotrauma*Networking*BannedPlayer)|(fun(arg:Barotrauma.Networking.BannedPlayer):(Barotrauma.Networking.BannedPlayer)), none:(System.Func*1Barotrauma*Networking*BannedPlayer)|(fun():(Barotrauma.Networking.BannedPlayer))):(Barotrauma.Networking.BannedPlayer)
---@param some (System.Action*1Barotrauma*Networking*BannedPlayer)|(fun(obj:Barotrauma.Networking.BannedPlayer))
---@param none (System.Action)|(fun())
_G['Option*1Barotrauma*Networking*BannedPlayer'].Match = function(some, none) end

---`Method Public Instance`
---@overload fun(fallback:Barotrauma.Networking.BannedPlayer):(Barotrauma.Networking.BannedPlayer)
---@param fallback Barotrauma.Option*1Barotrauma*Networking*BannedPlayer
---@return Barotrauma.Option*1Barotrauma*Networking*BannedPlayer
_G['Option*1Barotrauma*Networking*BannedPlayer'].Fallback = function(fallback) end

---`Method Public Static`
---@param value Barotrauma.Networking.BannedPlayer
---@return Barotrauma.Option*1Barotrauma*Networking*BannedPlayer
_G['Option*1Barotrauma*Networking*BannedPlayer'].Some = function(value) end

---`Method Public Instance Virtual`
---@param obj System.Object
---@return System.Boolean
_G['Option*1Barotrauma*Networking*BannedPlayer'].Equals = function(obj) end

---`Method Public Instance`
---@param otherValue Barotrauma.Networking.BannedPlayer
---@return System.Boolean
_G['Option*1Barotrauma*Networking*BannedPlayer'].ValueEquals = function(otherValue) end

---`Method Public Instance Virtual`
---@return System.Int32
_G['Option*1Barotrauma*Networking*BannedPlayer'].GetHashCode = function() end

---`Method Public Static`
---@return Barotrauma.Option*1Barotrauma*Networking*BannedPlayer
_G['Option*1Barotrauma*Networking*BannedPlayer'].None = function() end

---`Method Public Instance Virtual`
---@return System.String
_G['Option*1Barotrauma*Networking*BannedPlayer'].ToString = function() end

---`Constructor Private Instance`
---@param hasValue System.Boolean
---@param value Barotrauma.Networking.BannedPlayer
---@return Barotrauma.Option*1Barotrauma*Networking*BannedPlayer
_G['Option*1Barotrauma*Networking*BannedPlayer'] = function(hasValue, value) end

---`Constructor Private Instance`
---@param hasValue System.Boolean
---@param value Barotrauma.Networking.BannedPlayer
---@return Barotrauma.Option*1Barotrauma*Networking*BannedPlayer
_G['Option*1Barotrauma*Networking*BannedPlayer'].__new = function(hasValue, value) end

