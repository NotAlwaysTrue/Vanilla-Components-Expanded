---@meta
---@class System.Boolean : System.ValueType, boolean
---`Field Private Instance`
---@field m_value System.Boolean
---`Field Public Static`
---@field TrueString System.String
---`Field Public Static`
---@field FalseString System.String
_G['System']['Boolean'] = {}

---`Method Public Instance Virtual`
---@return System.Int32
_G['System']['Boolean'].GetHashCode = function() end

---`Method Public Instance Virtual`
---@overload fun():(System.String)
---@param provider System.IFormatProvider
---@return System.String
_G['System']['Boolean'].ToString = function(provider) end

---`Method Public Instance`
---@param destination System.Span*1System*Char
---@param charsWritten System.Int32-ref
---@return System.Boolean
_G['System']['Boolean'].TryFormat = function(destination, charsWritten) end

---`Method Public Instance Virtual`
---@overload fun(obj:System.Object):(System.Boolean)
---@param obj System.Boolean
---@return System.Boolean
_G['System']['Boolean'].Equals = function(obj) end

---`Method Public Instance Virtual`
---@overload fun(obj:System.Object):(System.Int32)
---@param value System.Boolean
---@return System.Int32
_G['System']['Boolean'].CompareTo = function(value) end

---`Method NonPublic Static`
---@param value System.ReadOnlySpan*1System*Char
---@return System.Boolean
_G['System']['Boolean'].IsTrueStringIgnoreCase = function(value) end

---`Method NonPublic Static`
---@param value System.ReadOnlySpan*1System*Char
---@return System.Boolean
_G['System']['Boolean'].IsFalseStringIgnoreCase = function(value) end

---`Method Public Static`
---@overload fun(value:System.String):(System.Boolean)
---@param value System.ReadOnlySpan*1System*Char
---@return System.Boolean
_G['System']['Boolean'].Parse = function(value) end

---`Method Public Static`
---@overload fun(value:System.String, result:System.Boolean-ref):(System.Boolean)
---@param value System.ReadOnlySpan*1System*Char
---@param result System.Boolean-ref
---@return System.Boolean
_G['System']['Boolean'].TryParse = function(value, result) end

---`Method Private Static`
---@param value System.ReadOnlySpan*1System*Char
---@return System.ReadOnlySpan*1System*Char
_G['System']['Boolean'].TrimWhiteSpaceAndNull = function(value) end

---`Method Public Instance Virtual`
---@return System.TypeCode
_G['System']['Boolean'].GetTypeCode = function() end

---`Constructor Private Static`
---@return System.Boolean
_G['System']['Boolean'] = function() end

---`Constructor Private Static`
---@return System.Boolean
_G['System']['Boolean'].__new = function() end

