---@meta
---@class System.Int64 : System.ValueType, integer
---`Field Private Instance`
---@field m_value System.Int64
---`Field Public Static`
---@field MaxValue System.Int64
---`Field Public Static`
---@field MinValue System.Int64
_G['System']['Int64'] = {}

---`Method Public Instance Virtual`
---@overload fun(value:System.Object):(System.Int32)
---@param value System.Int64
---@return System.Int32
_G['System']['Int64'].CompareTo = function(value) end

---`Method Public Instance Virtual`
---@overload fun(obj:System.Object):(System.Boolean)
---@param obj System.Int64
---@return System.Boolean
_G['System']['Int64'].Equals = function(obj) end

---`Method Public Instance Virtual`
---@return System.Int32
_G['System']['Int64'].GetHashCode = function() end

---`Method Public Instance Virtual`
---@overload fun():(System.String)
---@overload fun(provider:System.IFormatProvider):(System.String)
---@param format System.String
---@param provider System.IFormatProvider
---@return System.String
_G['System']['Int64'].ToString = function(format, provider) end

---`Method Public Instance`
---@param format System.String
---@return System.String
_G['System']['Int64'].ToString = function(format) end

---`Method Public Instance Virtual`
---@overload fun(destination:System.Span*1System*Char, charsWritten:System.Int32-ref, format?:System.ReadOnlySpan*1System*Char, provider?:System.IFormatProvider):(System.Boolean)
---@param utf8Destination System.Span*1System*Byte
---@param bytesWritten System.Int32-ref
---@param format? System.ReadOnlySpan*1System*Char
---@param provider? System.IFormatProvider
---@return System.Boolean
_G['System']['Int64'].TryFormat = function(utf8Destination, bytesWritten, format, provider) end

---`Method Public Static`
---@overload fun(s:System.String):(System.Int64)
---@overload fun(s:System.String, style:System.Globalization.NumberStyles):(System.Int64)
---@overload fun(s:System.String, provider:System.IFormatProvider):(System.Int64)
---@overload fun(s:System.String, style:System.Globalization.NumberStyles, provider:System.IFormatProvider):(System.Int64)
---@overload fun(s:System.ReadOnlySpan*1System*Char, style?:System.Globalization.NumberStyles, provider?:System.IFormatProvider):(System.Int64)
---@overload fun(s:System.ReadOnlySpan*1System*Char, provider:System.IFormatProvider):(System.Int64)
---@overload fun(utf8Text:System.ReadOnlySpan*1System*Byte, style?:System.Globalization.NumberStyles, provider?:System.IFormatProvider):(System.Int64)
---@param utf8Text System.ReadOnlySpan*1System*Byte
---@param provider System.IFormatProvider
---@return System.Int64
_G['System']['Int64'].Parse = function(utf8Text, provider) end

---`Method Public Static`
---@overload fun(s:System.String, result:System.Int64-ref):(System.Boolean)
---@overload fun(s:System.ReadOnlySpan*1System*Char, result:System.Int64-ref):(System.Boolean)
---@overload fun(utf8Text:System.ReadOnlySpan*1System*Byte, result:System.Int64-ref):(System.Boolean)
---@overload fun(s:System.String, style:System.Globalization.NumberStyles, provider:System.IFormatProvider, result:System.Int64-ref):(System.Boolean)
---@overload fun(s:System.ReadOnlySpan*1System*Char, style:System.Globalization.NumberStyles, provider:System.IFormatProvider, result:System.Int64-ref):(System.Boolean)
---@overload fun(s:System.String, provider:System.IFormatProvider, result:System.Int64-ref):(System.Boolean)
---@overload fun(s:System.ReadOnlySpan*1System*Char, provider:System.IFormatProvider, result:System.Int64-ref):(System.Boolean)
---@overload fun(utf8Text:System.ReadOnlySpan*1System*Byte, style:System.Globalization.NumberStyles, provider:System.IFormatProvider, result:System.Int64-ref):(System.Boolean)
---@param utf8Text System.ReadOnlySpan*1System*Byte
---@param provider System.IFormatProvider
---@param result System.Int64-ref
---@return System.Boolean
_G['System']['Int64'].TryParse = function(utf8Text, provider, result) end

---`Method Public Instance Virtual`
---@return System.TypeCode
_G['System']['Int64'].GetTypeCode = function() end

---`Method Public Static`
---@param left System.Int64
---@param right System.Int64
---@return System.ValueTuple*1System*Int64*1System*Int64
_G['System']['Int64'].DivRem = function(left, right) end

---`Method Public Static`
---@param value System.Int64
---@return System.Int64
_G['System']['Int64'].LeadingZeroCount = function(value) end

---`Method Public Static`
---@param value System.Int64
---@return System.Int64
_G['System']['Int64'].PopCount = function(value) end

---`Method Public Static`
---@param value System.Int64
---@param rotateAmount System.Int32
---@return System.Int64
_G['System']['Int64'].RotateLeft = function(value, rotateAmount) end

---`Method Public Static`
---@param value System.Int64
---@param rotateAmount System.Int32
---@return System.Int64
_G['System']['Int64'].RotateRight = function(value, rotateAmount) end

---`Method Public Static`
---@param value System.Int64
---@return System.Int64
_G['System']['Int64'].TrailingZeroCount = function(value) end

---`Method Public Static`
---@param value System.Int64
---@return System.Boolean
_G['System']['Int64'].IsPow2 = function(value) end

---`Method Public Static`
---@param value System.Int64
---@return System.Int64
_G['System']['Int64'].Log2 = function(value) end

---`Method Public Static`
---@param value System.Int64
---@param min System.Int64
---@param max System.Int64
---@return System.Int64
_G['System']['Int64'].Clamp = function(value, min, max) end

---`Method Public Static`
---@param value System.Int64
---@param sign System.Int64
---@return System.Int64
_G['System']['Int64'].CopySign = function(value, sign) end

---`Method Public Static`
---@param x System.Int64
---@param y System.Int64
---@return System.Int64
_G['System']['Int64'].Max = function(x, y) end

---`Method Public Static`
---@param x System.Int64
---@param y System.Int64
---@return System.Int64
_G['System']['Int64'].Min = function(x, y) end

---`Method Public Static`
---@param value System.Int64
---@return System.Int32
_G['System']['Int64'].Sign = function(value) end

---`Method Public Static`
---@param value System.Int64
---@return System.Int64
_G['System']['Int64'].Abs = function(value) end

---`Method Public Static`
---@param value System.Int64.TOther
---@return System.Int64
_G['System']['Int64'].CreateChecked = function(value) end

---`Method Public Static`
---@param value System.Int64.TOther
---@return System.Int64
_G['System']['Int64'].CreateSaturating = function(value) end

---`Method Public Static`
---@param value System.Int64.TOther
---@return System.Int64
_G['System']['Int64'].CreateTruncating = function(value) end

---`Method Public Static`
---@param value System.Int64
---@return System.Boolean
_G['System']['Int64'].IsEvenInteger = function(value) end

---`Method Public Static`
---@param value System.Int64
---@return System.Boolean
_G['System']['Int64'].IsNegative = function(value) end

---`Method Public Static`
---@param value System.Int64
---@return System.Boolean
_G['System']['Int64'].IsOddInteger = function(value) end

---`Method Public Static`
---@param value System.Int64
---@return System.Boolean
_G['System']['Int64'].IsPositive = function(value) end

---`Method Public Static`
---@param x System.Int64
---@param y System.Int64
---@return System.Int64
_G['System']['Int64'].MaxMagnitude = function(x, y) end

---`Method Public Static`
---@param x System.Int64
---@param y System.Int64
---@return System.Int64
_G['System']['Int64'].MinMagnitude = function(x, y) end

---`Method Private Static`
---@param value System.Int64.TOther
---@param result System.Int64-ref
---@return System.Boolean
_G['System']['Int64'].TryConvertFromChecked = function(value, result) end

---`Method Private Static`
---@param value System.Int64.TOther
---@param result System.Int64-ref
---@return System.Boolean
_G['System']['Int64'].TryConvertFromSaturating = function(value, result) end

---`Method Private Static`
---@param value System.Int64.TOther
---@param result System.Int64-ref
---@return System.Boolean
_G['System']['Int64'].TryConvertFromTruncating = function(value, result) end

