---@meta
---@class Barotrauma.Option*1Barotrauma*Character : System.ValueType
---`Field Private Instance`
---@field hasValue System.Boolean
---`Field Private Instance`
---@field value Barotrauma.Character
_G['Option*1Barotrauma*Character'] = {}

---`Method Public Instance`
---@return System.Boolean
_G['Option*1Barotrauma*Character'].IsSome = function() end

---`Method Public Instance`
---@return System.Boolean
_G['Option*1Barotrauma*Character'].IsNone = function() end

---`Method Public Instance`
---@overload fun(outValue:Barotrauma.T1-ref):(System.Boolean)
---@param outValue Barotrauma.Character-ref
---@return System.Boolean
_G['Option*1Barotrauma*Character'].TryUnwrap = function(outValue) end

---`Method Public Instance`
---@param selector (System.Func*1Barotrauma*Character*1Barotrauma*Option*TType)|(fun(arg:Barotrauma.Character):(Barotrauma.Option.TType))
---@return Barotrauma.Option*1Barotrauma*Option*TType
_G['Option*1Barotrauma*Character'].Select = function(selector) end

---`Method Public Instance`
---@overload fun(binder:(System.Func*1Barotrauma*Character*1Barotrauma*Option*2Barotrauma*Option*TType)|(fun(arg:Barotrauma.Character):(Barotrauma.Option*1Barotrauma*Option*TType))):(Barotrauma.Option*1Barotrauma*Option*TType)
---@param binder (System.Func*1Barotrauma*Character*1System*Threading*Tasks*Task*2Barotrauma*Option*3Barotrauma*Option*TType)|(fun(arg:Barotrauma.Character):(System.Threading.Tasks.Task*1Barotrauma*Option*2Barotrauma*Option*TType))
---@return System.Threading.Tasks.Task*1Barotrauma*Option*2Barotrauma*Option*TType
_G['Option*1Barotrauma*Character'].Bind = function(binder) end

---`Method Public Instance`
---@overload fun(some:(System.Func*1Barotrauma*Character*1Barotrauma*Character)|(fun(arg:Barotrauma.Character):(Barotrauma.Character)), none:(System.Func*1Barotrauma*Character)|(fun():(Barotrauma.Character))):(Barotrauma.Character)
---@param some (System.Action*1Barotrauma*Character)|(fun(obj:Barotrauma.Character))
---@param none (System.Action)|(fun())
_G['Option*1Barotrauma*Character'].Match = function(some, none) end

---`Method Public Instance`
---@overload fun(fallback:Barotrauma.Character):(Barotrauma.Character)
---@param fallback Barotrauma.Option*1Barotrauma*Character
---@return Barotrauma.Option*1Barotrauma*Character
_G['Option*1Barotrauma*Character'].Fallback = function(fallback) end

---`Method Public Static`
---@param value Barotrauma.Character
---@return Barotrauma.Option*1Barotrauma*Character
_G['Option*1Barotrauma*Character'].Some = function(value) end

---`Method Public Instance Virtual`
---@param obj System.Object
---@return System.Boolean
_G['Option*1Barotrauma*Character'].Equals = function(obj) end

---`Method Public Instance`
---@param otherValue Barotrauma.Character
---@return System.Boolean
_G['Option*1Barotrauma*Character'].ValueEquals = function(otherValue) end

---`Method Public Instance Virtual`
---@return System.Int32
_G['Option*1Barotrauma*Character'].GetHashCode = function() end

---`Method Public Static`
---@return Barotrauma.Option*1Barotrauma*Character
_G['Option*1Barotrauma*Character'].None = function() end

---`Method Public Instance Virtual`
---@return System.String
_G['Option*1Barotrauma*Character'].ToString = function() end

---`Constructor Private Instance`
---@param hasValue System.Boolean
---@param value Barotrauma.Character
---@return Barotrauma.Option*1Barotrauma*Character
_G['Option*1Barotrauma*Character'] = function(hasValue, value) end

---`Constructor Private Instance`
---@param hasValue System.Boolean
---@param value Barotrauma.Character
---@return Barotrauma.Option*1Barotrauma*Character
_G['Option*1Barotrauma*Character'].__new = function(hasValue, value) end

