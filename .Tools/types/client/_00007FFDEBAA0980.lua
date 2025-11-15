---@meta
---@class System.SByte : System.ValueType, integer
---`Field Private Instance`
---@field m_value System.SByte
---`Field Public Static`
---@field MaxValue System.SByte
---`Field Public Static`
---@field MinValue System.SByte
_G['System']['SByte'] = {}

---`Method Public Instance Virtual`
---@overload fun(obj:System.Object):(System.Int32)
---@param value System.SByte
---@return System.Int32
_G['System']['SByte'].CompareTo = function(value) end

---`Method Public Instance Virtual`
---@overload fun(obj:System.Object):(System.Boolean)
---@param obj System.SByte
---@return System.Boolean
_G['System']['SByte'].Equals = function(obj) end

---`Method Public Instance Virtual`
---@return System.Int32
_G['System']['SByte'].GetHashCode = function() end

---`Method Public Instance Virtual`
---@overload fun():(System.String)
---@overload fun(provider:System.IFormatProvider):(System.String)
---@param format System.String
---@param provider System.IFormatProvider
---@return System.String
_G['System']['SByte'].ToString = function(format, provider) end

---`Method Public Instance`
---@param format System.String
---@return System.String
_G['System']['SByte'].ToString = function(format) end

---`Method Public Instance Virtual`
---@overload fun(destination:System.Span*1System*Char, charsWritten:System.Int32-ref, format?:System.ReadOnlySpan*1System*Char, provider?:System.IFormatProvider):(System.Boolean)
---@param utf8Destination System.Span*1System*Byte
---@param bytesWritten System.Int32-ref
---@param format? System.ReadOnlySpan*1System*Char
---@param provider? System.IFormatProvider
---@return System.Boolean
_G['System']['SByte'].TryFormat = function(utf8Destination, bytesWritten, format, provider) end

---`Method Public Static`
---@overload fun(s:System.String):(System.SByte)
---@overload fun(s:System.String, style:System.Globalization.NumberStyles):(System.SByte)
---@overload fun(s:System.String, provider:System.IFormatProvider):(System.SByte)
---@overload fun(s:System.String, style:System.Globalization.NumberStyles, provider:System.IFormatProvider):(System.SByte)
---@overload fun(s:System.ReadOnlySpan*1System*Char, style?:System.Globalization.NumberStyles, provider?:System.IFormatProvider):(System.SByte)
---@overload fun(s:System.ReadOnlySpan*1System*Char, provider:System.IFormatProvider):(System.SByte)
---@overload fun(utf8Text:System.ReadOnlySpan*1System*Byte, style?:System.Globalization.NumberStyles, provider?:System.IFormatProvider):(System.SByte)
---@param utf8Text System.ReadOnlySpan*1System*Byte
---@param provider System.IFormatProvider
---@return System.SByte
_G['System']['SByte'].Parse = function(utf8Text, provider) end

---`Method Public Static`
---@overload fun(s:System.String, result:System.SByte-ref):(System.Boolean)
---@overload fun(s:System.ReadOnlySpan*1System*Char, result:System.SByte-ref):(System.Boolean)
---@overload fun(utf8Text:System.ReadOnlySpan*1System*Byte, result:System.SByte-ref):(System.Boolean)
---@overload fun(s:System.String, style:System.Globalization.NumberStyles, provider:System.IFormatProvider, result:System.SByte-ref):(System.Boolean)
---@overload fun(s:System.ReadOnlySpan*1System*Char, style:System.Globalization.NumberStyles, provider:System.IFormatProvider, result:System.SByte-ref):(System.Boolean)
---@overload fun(s:System.String, provider:System.IFormatProvider, result:System.SByte-ref):(System.Boolean)
---@overload fun(s:System.ReadOnlySpan*1System*Char, provider:System.IFormatProvider, result:System.SByte-ref):(System.Boolean)
---@overload fun(utf8Text:System.ReadOnlySpan*1System*Byte, style:System.Globalization.NumberStyles, provider:System.IFormatProvider, result:System.SByte-ref):(System.Boolean)
---@param utf8Text System.ReadOnlySpan*1System*Byte
---@param provider System.IFormatProvider
---@param result System.SByte-ref
---@return System.Boolean
_G['System']['SByte'].TryParse = function(utf8Text, provider, result) end

---`Method Public Instance Virtual`
---@return System.TypeCode
_G['System']['SByte'].GetTypeCode = function() end

---`Method Public Static`
---@param left System.SByte
---@param right System.SByte
---@return System.ValueTuple*1System*SByte*1System*SByte
_G['System']['SByte'].DivRem = function(left, right) end

---`Method Public Static`
---@param value System.SByte
---@return System.SByte
_G['System']['SByte'].LeadingZeroCount = function(value) end

---`Method Public Static`
---@param value System.SByte
---@return System.SByte
_G['System']['SByte'].PopCount = function(value) end

---`Method Public Static`
---@param value System.SByte
---@param rotateAmount System.Int32
---@return System.SByte
_G['System']['SByte'].RotateLeft = function(value, rotateAmount) end

---`Method Public Static`
---@param value System.SByte
---@param rotateAmount System.Int32
---@return System.SByte
_G['System']['SByte'].RotateRight = function(value, rotateAmount) end

---`Method Public Static`
---@param value System.SByte
---@return System.SByte
_G['System']['SByte'].TrailingZeroCount = function(value) end

---`Method Public Static`
---@param value System.SByte
---@return System.Boolean
_G['System']['SByte'].IsPow2 = function(value) end

---`Method Public Static`
---@param value System.SByte
---@return System.SByte
_G['System']['SByte'].Log2 = function(value) end

---`Method Public Static`
---@param value System.SByte
---@param min System.SByte
---@param max System.SByte
---@return System.SByte
_G['System']['SByte'].Clamp = function(value, min, max) end

---`Method Public Static`
---@param value System.SByte
---@param sign System.SByte
---@return System.SByte
_G['System']['SByte'].CopySign = function(value, sign) end

---`Method Public Static`
---@param x System.SByte
---@param y System.SByte
---@return System.SByte
_G['System']['SByte'].Max = function(x, y) end

---`Method Public Static`
---@param x System.SByte
---@param y System.SByte
---@return System.SByte
_G['System']['SByte'].Min = function(x, y) end

---`Method Public Static`
---@param value System.SByte
---@return System.Int32
_G['System']['SByte'].Sign = function(value) end

---`Method Public Static`
---@param value System.SByte
---@return System.SByte
_G['System']['SByte'].Abs = function(value) end

---`Method Public Static`
---@param value System.SByte.TOther
---@return System.SByte
_G['System']['SByte'].CreateChecked = function(value) end

---`Method Public Static`
---@param value System.SByte.TOther
---@return System.SByte
_G['System']['SByte'].CreateSaturating = function(value) end

---`Method Public Static`
---@param value System.SByte.TOther
---@return System.SByte
_G['System']['SByte'].CreateTruncating = function(value) end

---`Method Public Static`
---@param value System.SByte
---@return System.Boolean
_G['System']['SByte'].IsEvenInteger = function(value) end

---`Method Public Static`
---@param value System.SByte
---@return System.Boolean
_G['System']['SByte'].IsNegative = function(value) end

---`Method Public Static`
---@param value System.SByte
---@return System.Boolean
_G['System']['SByte'].IsOddInteger = function(value) end

---`Method Public Static`
---@param value System.SByte
---@return System.Boolean
_G['System']['SByte'].IsPositive = function(value) end

---`Method Public Static`
---@param x System.SByte
---@param y System.SByte
---@return System.SByte
_G['System']['SByte'].MaxMagnitude = function(x, y) end

---`Method Public Static`
---@param x System.SByte
---@param y System.SByte
---@return System.SByte
_G['System']['SByte'].MinMagnitude = function(x, y) end

---`Method Private Static`
---@param value System.SByte.TOther
---@param result System.SByte-ref
---@return System.Boolean
_G['System']['SByte'].TryConvertFromChecked = function(value, result) end

---`Method Private Static`
---@param value System.SByte.TOther
---@param result System.SByte-ref
---@return System.Boolean
_G['System']['SByte'].TryConvertFromSaturating = function(value, result) end

---`Method Private Static`
---@param value System.SByte.TOther
---@param result System.SByte-ref
---@return System.Boolean
_G['System']['SByte'].TryConvertFromTruncating = function(value, result) end

