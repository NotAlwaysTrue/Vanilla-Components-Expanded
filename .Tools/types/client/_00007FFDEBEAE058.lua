---@meta
---@class Barotrauma.Option*1Barotrauma*Networking*EpicAccountId : System.ValueType
---`Field Private Instance`
---@field hasValue System.Boolean
---`Field Private Instance`
---@field value Barotrauma.Networking.EpicAccountId
_G['Option*1Barotrauma*Networking*EpicAccountId'] = {}

---`Method Public Instance`
---@return System.Boolean
_G['Option*1Barotrauma*Networking*EpicAccountId'].IsSome = function() end

---`Method Public Instance`
---@return System.Boolean
_G['Option*1Barotrauma*Networking*EpicAccountId'].IsNone = function() end

---`Method Public Instance`
---@overload fun(outValue:Barotrauma.T1-ref):(System.Boolean)
---@param outValue Barotrauma.Networking.EpicAccountId-ref
---@return System.Boolean
_G['Option*1Barotrauma*Networking*EpicAccountId'].TryUnwrap = function(outValue) end

---`Method Public Instance`
---@param selector (System.Func*1Barotrauma*Networking*EpicAccountId*1Barotrauma*Option*TType)|(fun(arg:Barotrauma.Networking.EpicAccountId):(Barotrauma.Option.TType))
---@return Barotrauma.Option*1Barotrauma*Option*TType
_G['Option*1Barotrauma*Networking*EpicAccountId'].Select = function(selector) end

---`Method Public Instance`
---@overload fun(binder:(System.Func*1Barotrauma*Networking*EpicAccountId*1Barotrauma*Option*2Barotrauma*Option*TType)|(fun(arg:Barotrauma.Networking.EpicAccountId):(Barotrauma.Option*1Barotrauma*Option*TType))):(Barotrauma.Option*1Barotrauma*Option*TType)
---@param binder (System.Func*1Barotrauma*Networking*EpicAccountId*1System*Threading*Tasks*Task*2Barotrauma*Option*3Barotrauma*Option*TType)|(fun(arg:Barotrauma.Networking.EpicAccountId):(System.Threading.Tasks.Task*1Barotrauma*Option*2Barotrauma*Option*TType))
---@return System.Threading.Tasks.Task*1Barotrauma*Option*2Barotrauma*Option*TType
_G['Option*1Barotrauma*Networking*EpicAccountId'].Bind = function(binder) end

---`Method Public Instance`
---@overload fun(some:(System.Func*1Barotrauma*Networking*EpicAccountId*1Barotrauma*Networking*EpicAccountId)|(fun(arg:Barotrauma.Networking.EpicAccountId):(Barotrauma.Networking.EpicAccountId)), none:(System.Func*1Barotrauma*Networking*EpicAccountId)|(fun():(Barotrauma.Networking.EpicAccountId))):(Barotrauma.Networking.EpicAccountId)
---@param some (System.Action*1Barotrauma*Networking*EpicAccountId)|(fun(obj:Barotrauma.Networking.EpicAccountId))
---@param none (System.Action)|(fun())
_G['Option*1Barotrauma*Networking*EpicAccountId'].Match = function(some, none) end

---`Method Public Instance`
---@overload fun(fallback:Barotrauma.Networking.EpicAccountId):(Barotrauma.Networking.EpicAccountId)
---@param fallback Barotrauma.Option*1Barotrauma*Networking*EpicAccountId
---@return Barotrauma.Option*1Barotrauma*Networking*EpicAccountId
_G['Option*1Barotrauma*Networking*EpicAccountId'].Fallback = function(fallback) end

---`Method Public Static`
---@param value Barotrauma.Networking.EpicAccountId
---@return Barotrauma.Option*1Barotrauma*Networking*EpicAccountId
_G['Option*1Barotrauma*Networking*EpicAccountId'].Some = function(value) end

---`Method Public Instance Virtual`
---@param obj System.Object
---@return System.Boolean
_G['Option*1Barotrauma*Networking*EpicAccountId'].Equals = function(obj) end

---`Method Public Instance`
---@param otherValue Barotrauma.Networking.EpicAccountId
---@return System.Boolean
_G['Option*1Barotrauma*Networking*EpicAccountId'].ValueEquals = function(otherValue) end

---`Method Public Instance Virtual`
---@return System.Int32
_G['Option*1Barotrauma*Networking*EpicAccountId'].GetHashCode = function() end

---`Method Public Static`
---@return Barotrauma.Option*1Barotrauma*Networking*EpicAccountId
_G['Option*1Barotrauma*Networking*EpicAccountId'].None = function() end

---`Method Public Instance Virtual`
---@return System.String
_G['Option*1Barotrauma*Networking*EpicAccountId'].ToString = function() end

---`Constructor Private Instance`
---@param hasValue System.Boolean
---@param value Barotrauma.Networking.EpicAccountId
---@return Barotrauma.Option*1Barotrauma*Networking*EpicAccountId
_G['Option*1Barotrauma*Networking*EpicAccountId'] = function(hasValue, value) end

---`Constructor Private Instance`
---@param hasValue System.Boolean
---@param value Barotrauma.Networking.EpicAccountId
---@return Barotrauma.Option*1Barotrauma*Networking*EpicAccountId
_G['Option*1Barotrauma*Networking*EpicAccountId'].__new = function(hasValue, value) end

