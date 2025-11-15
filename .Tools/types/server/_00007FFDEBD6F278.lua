---@meta
---@class Barotrauma.Option*1System*DateTime : System.ValueType
---`Field Private Instance`
---@field hasValue System.Boolean
---`Field Private Instance`
---@field value System.DateTime
_G['Option*1System*DateTime'] = {}

---`Method Public Instance`
---@return System.Boolean
_G['Option*1System*DateTime'].IsSome = function() end

---`Method Public Instance`
---@return System.Boolean
_G['Option*1System*DateTime'].IsNone = function() end

---`Method Public Instance`
---@overload fun(outValue:Barotrauma.T1-ref):(System.Boolean)
---@param outValue System.DateTime-ref
---@return System.Boolean
_G['Option*1System*DateTime'].TryUnwrap = function(outValue) end

---`Method Public Instance`
---@param selector (System.Func*1System*DateTime*1Barotrauma*Option*TType)|(fun(arg:System.DateTime):(Barotrauma.Option.TType))
---@return Barotrauma.Option*1Barotrauma*Option*TType
_G['Option*1System*DateTime'].Select = function(selector) end

---`Method Public Instance`
---@overload fun(binder:(System.Func*1System*DateTime*1Barotrauma*Option*2Barotrauma*Option*TType)|(fun(arg:System.DateTime):(Barotrauma.Option*1Barotrauma*Option*TType))):(Barotrauma.Option*1Barotrauma*Option*TType)
---@param binder (System.Func*1System*DateTime*1System*Threading*Tasks*Task*2Barotrauma*Option*3Barotrauma*Option*TType)|(fun(arg:System.DateTime):(System.Threading.Tasks.Task*1Barotrauma*Option*2Barotrauma*Option*TType))
---@return System.Threading.Tasks.Task*1Barotrauma*Option*2Barotrauma*Option*TType
_G['Option*1System*DateTime'].Bind = function(binder) end

---`Method Public Instance`
---@overload fun(some:(System.Func*1System*DateTime*1System*DateTime)|(fun(arg:System.DateTime):(System.DateTime)), none:(System.Func*1System*DateTime)|(fun():(System.DateTime))):(System.DateTime)
---@param some (System.Action*1System*DateTime)|(fun(obj:System.DateTime))
---@param none (System.Action)|(fun())
_G['Option*1System*DateTime'].Match = function(some, none) end

---`Method Public Instance`
---@overload fun(fallback:System.DateTime):(System.DateTime)
---@param fallback Barotrauma.Option*1System*DateTime
---@return Barotrauma.Option*1System*DateTime
_G['Option*1System*DateTime'].Fallback = function(fallback) end

---`Method Public Static`
---@param value System.DateTime
---@return Barotrauma.Option*1System*DateTime
_G['Option*1System*DateTime'].Some = function(value) end

---`Method Public Instance Virtual`
---@param obj System.Object
---@return System.Boolean
_G['Option*1System*DateTime'].Equals = function(obj) end

---`Method Public Instance`
---@param otherValue System.DateTime
---@return System.Boolean
_G['Option*1System*DateTime'].ValueEquals = function(otherValue) end

---`Method Public Instance Virtual`
---@return System.Int32
_G['Option*1System*DateTime'].GetHashCode = function() end

---`Method Public Static`
---@return Barotrauma.Option*1System*DateTime
_G['Option*1System*DateTime'].None = function() end

---`Method Public Instance Virtual`
---@return System.String
_G['Option*1System*DateTime'].ToString = function() end

---`Constructor Private Instance`
---@param hasValue System.Boolean
---@param value System.DateTime
---@return Barotrauma.Option*1System*DateTime
_G['Option*1System*DateTime'] = function(hasValue, value) end

---`Constructor Private Instance`
---@param hasValue System.Boolean
---@param value System.DateTime
---@return Barotrauma.Option*1System*DateTime
_G['Option*1System*DateTime'].__new = function(hasValue, value) end

