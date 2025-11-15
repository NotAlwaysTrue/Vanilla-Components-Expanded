---@meta
---@class Barotrauma.Option*1Barotrauma*Networking*AccountId : System.ValueType
---`Field Private Instance`
---@field hasValue System.Boolean
---`Field Private Instance`
---@field value Barotrauma.Networking.AccountId
_G['Option*1Barotrauma*Networking*AccountId'] = {}

---`Method Public Instance`
---@return System.Boolean
_G['Option*1Barotrauma*Networking*AccountId'].IsSome = function() end

---`Method Public Instance`
---@return System.Boolean
_G['Option*1Barotrauma*Networking*AccountId'].IsNone = function() end

---`Method Public Instance`
---@overload fun(outValue:Barotrauma.T1-ref):(System.Boolean)
---@param outValue Barotrauma.Networking.AccountId-ref
---@return System.Boolean
_G['Option*1Barotrauma*Networking*AccountId'].TryUnwrap = function(outValue) end

---`Method Public Instance`
---@param selector (System.Func*1Barotrauma*Networking*AccountId*1Barotrauma*Option*TType)|(fun(arg:Barotrauma.Networking.AccountId):(Barotrauma.Option.TType))
---@return Barotrauma.Option*1Barotrauma*Option*TType
_G['Option*1Barotrauma*Networking*AccountId'].Select = function(selector) end

---`Method Public Instance`
---@overload fun(binder:(System.Func*1Barotrauma*Networking*AccountId*1Barotrauma*Option*2Barotrauma*Option*TType)|(fun(arg:Barotrauma.Networking.AccountId):(Barotrauma.Option*1Barotrauma*Option*TType))):(Barotrauma.Option*1Barotrauma*Option*TType)
---@param binder (System.Func*1Barotrauma*Networking*AccountId*1System*Threading*Tasks*Task*2Barotrauma*Option*3Barotrauma*Option*TType)|(fun(arg:Barotrauma.Networking.AccountId):(System.Threading.Tasks.Task*1Barotrauma*Option*2Barotrauma*Option*TType))
---@return System.Threading.Tasks.Task*1Barotrauma*Option*2Barotrauma*Option*TType
_G['Option*1Barotrauma*Networking*AccountId'].Bind = function(binder) end

---`Method Public Instance`
---@overload fun(some:(System.Func*1Barotrauma*Networking*AccountId*1Barotrauma*Networking*AccountId)|(fun(arg:Barotrauma.Networking.AccountId):(Barotrauma.Networking.AccountId)), none:(System.Func*1Barotrauma*Networking*AccountId)|(fun():(Barotrauma.Networking.AccountId))):(Barotrauma.Networking.AccountId)
---@param some (System.Action*1Barotrauma*Networking*AccountId)|(fun(obj:Barotrauma.Networking.AccountId))
---@param none (System.Action)|(fun())
_G['Option*1Barotrauma*Networking*AccountId'].Match = function(some, none) end

---`Method Public Instance`
---@overload fun(fallback:Barotrauma.Networking.AccountId):(Barotrauma.Networking.AccountId)
---@param fallback Barotrauma.Option*1Barotrauma*Networking*AccountId
---@return Barotrauma.Option*1Barotrauma*Networking*AccountId
_G['Option*1Barotrauma*Networking*AccountId'].Fallback = function(fallback) end

---`Method Public Static`
---@param value Barotrauma.Networking.AccountId
---@return Barotrauma.Option*1Barotrauma*Networking*AccountId
_G['Option*1Barotrauma*Networking*AccountId'].Some = function(value) end

---`Method Public Instance Virtual`
---@param obj System.Object
---@return System.Boolean
_G['Option*1Barotrauma*Networking*AccountId'].Equals = function(obj) end

---`Method Public Instance`
---@param otherValue Barotrauma.Networking.AccountId
---@return System.Boolean
_G['Option*1Barotrauma*Networking*AccountId'].ValueEquals = function(otherValue) end

---`Method Public Instance Virtual`
---@return System.Int32
_G['Option*1Barotrauma*Networking*AccountId'].GetHashCode = function() end

---`Method Public Static`
---@return Barotrauma.Option*1Barotrauma*Networking*AccountId
_G['Option*1Barotrauma*Networking*AccountId'].None = function() end

---`Method Public Instance Virtual`
---@return System.String
_G['Option*1Barotrauma*Networking*AccountId'].ToString = function() end

---`Constructor Private Instance`
---@param hasValue System.Boolean
---@param value Barotrauma.Networking.AccountId
---@return Barotrauma.Option*1Barotrauma*Networking*AccountId
_G['Option*1Barotrauma*Networking*AccountId'] = function(hasValue, value) end

---`Constructor Private Instance`
---@param hasValue System.Boolean
---@param value Barotrauma.Networking.AccountId
---@return Barotrauma.Option*1Barotrauma*Networking*AccountId
_G['Option*1Barotrauma*Networking*AccountId'].__new = function(hasValue, value) end

