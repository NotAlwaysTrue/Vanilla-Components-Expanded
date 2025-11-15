---@meta
---@class Barotrauma.Option*1Barotrauma*ContentPackageId : System.ValueType
---`Field Private Instance`
---@field hasValue System.Boolean
---`Field Private Instance`
---@field value Barotrauma.ContentPackageId
_G['Option*1Barotrauma*ContentPackageId'] = {}

---`Method Public Instance`
---@return System.Boolean
_G['Option*1Barotrauma*ContentPackageId'].IsSome = function() end

---`Method Public Instance`
---@return System.Boolean
_G['Option*1Barotrauma*ContentPackageId'].IsNone = function() end

---`Method Public Instance`
---@overload fun(outValue:Barotrauma.T1-ref):(System.Boolean)
---@param outValue Barotrauma.ContentPackageId-ref
---@return System.Boolean
_G['Option*1Barotrauma*ContentPackageId'].TryUnwrap = function(outValue) end

---`Method Public Instance`
---@param selector (System.Func*1Barotrauma*ContentPackageId*1Barotrauma*Option*TType)|(fun(arg:Barotrauma.ContentPackageId):(Barotrauma.Option.TType))
---@return Barotrauma.Option*1Barotrauma*Option*TType
_G['Option*1Barotrauma*ContentPackageId'].Select = function(selector) end

---`Method Public Instance`
---@overload fun(binder:(System.Func*1Barotrauma*ContentPackageId*1Barotrauma*Option*2Barotrauma*Option*TType)|(fun(arg:Barotrauma.ContentPackageId):(Barotrauma.Option*1Barotrauma*Option*TType))):(Barotrauma.Option*1Barotrauma*Option*TType)
---@param binder (System.Func*1Barotrauma*ContentPackageId*1System*Threading*Tasks*Task*2Barotrauma*Option*3Barotrauma*Option*TType)|(fun(arg:Barotrauma.ContentPackageId):(System.Threading.Tasks.Task*1Barotrauma*Option*2Barotrauma*Option*TType))
---@return System.Threading.Tasks.Task*1Barotrauma*Option*2Barotrauma*Option*TType
_G['Option*1Barotrauma*ContentPackageId'].Bind = function(binder) end

---`Method Public Instance`
---@overload fun(some:(System.Func*1Barotrauma*ContentPackageId*1Barotrauma*ContentPackageId)|(fun(arg:Barotrauma.ContentPackageId):(Barotrauma.ContentPackageId)), none:(System.Func*1Barotrauma*ContentPackageId)|(fun():(Barotrauma.ContentPackageId))):(Barotrauma.ContentPackageId)
---@param some (System.Action*1Barotrauma*ContentPackageId)|(fun(obj:Barotrauma.ContentPackageId))
---@param none (System.Action)|(fun())
_G['Option*1Barotrauma*ContentPackageId'].Match = function(some, none) end

---`Method Public Instance`
---@overload fun(fallback:Barotrauma.ContentPackageId):(Barotrauma.ContentPackageId)
---@param fallback Barotrauma.Option*1Barotrauma*ContentPackageId
---@return Barotrauma.Option*1Barotrauma*ContentPackageId
_G['Option*1Barotrauma*ContentPackageId'].Fallback = function(fallback) end

---`Method Public Static`
---@param value Barotrauma.ContentPackageId
---@return Barotrauma.Option*1Barotrauma*ContentPackageId
_G['Option*1Barotrauma*ContentPackageId'].Some = function(value) end

---`Method Public Instance Virtual`
---@param obj System.Object
---@return System.Boolean
_G['Option*1Barotrauma*ContentPackageId'].Equals = function(obj) end

---`Method Public Instance`
---@param otherValue Barotrauma.ContentPackageId
---@return System.Boolean
_G['Option*1Barotrauma*ContentPackageId'].ValueEquals = function(otherValue) end

---`Method Public Instance Virtual`
---@return System.Int32
_G['Option*1Barotrauma*ContentPackageId'].GetHashCode = function() end

---`Method Public Static`
---@return Barotrauma.Option*1Barotrauma*ContentPackageId
_G['Option*1Barotrauma*ContentPackageId'].None = function() end

---`Method Public Instance Virtual`
---@return System.String
_G['Option*1Barotrauma*ContentPackageId'].ToString = function() end

---`Constructor Private Instance`
---@param hasValue System.Boolean
---@param value Barotrauma.ContentPackageId
---@return Barotrauma.Option*1Barotrauma*ContentPackageId
_G['Option*1Barotrauma*ContentPackageId'] = function(hasValue, value) end

---`Constructor Private Instance`
---@param hasValue System.Boolean
---@param value Barotrauma.ContentPackageId
---@return Barotrauma.Option*1Barotrauma*ContentPackageId
_G['Option*1Barotrauma*ContentPackageId'].__new = function(hasValue, value) end

