---@meta
---@class System.Int32 : System.ValueType, integer
---`Field Private Instance`
---@field m_value System.Int32
---`Field Public Static`
---@field MaxValue System.Int32
---`Field Public Static`
---@field MinValue System.Int32
_G['System']['Int32'] = {}

---`Method Public Instance Virtual`
---@overload fun(value:System.Object):(System.Int32)
---@param value System.Int32
---@return System.Int32
_G['System']['Int32'].CompareTo = function(value) end

---`Method Public Instance Virtual`
---@overload fun(obj:System.Object):(System.Boolean)
---@param obj System.Int32
---@return System.Boolean
_G['System']['Int32'].Equals = function(obj) end

---`Method Public Instance Virtual`
---@return System.Int32
_G['System']['Int32'].GetHashCode = function() end

---`Method Public Instance Virtual`
---@overload fun():(System.String)
---@overload fun(provider:System.IFormatProvider):(System.String)
---@param format System.String
---@param provider System.IFormatProvider
---@return System.String
_G['System']['Int32'].ToString = function(format, provider) end

---`Method Public Instance`
---@param format System.String
---@return System.String
_G['System']['Int32'].ToString = function(format) end

---`Method Public Instance Virtual`
---@overload fun(destination:System.Span*1System*Char, charsWritten:System.Int32-ref, format?:System.ReadOnlySpan*1System*Char, provider?:System.IFormatProvider):(System.Boolean)
---@param utf8Destination System.Span*1System*Byte
---@param bytesWritten System.Int32-ref
---@param format? System.ReadOnlySpan*1System*Char
---@param provider? System.IFormatProvider
---@return System.Boolean
_G['System']['Int32'].TryFormat = function(utf8Destination, bytesWritten, format, provider) end

---`Method Public Static`
---@overload fun(s:System.String):(System.Int32)
---@overload fun(s:System.String, style:System.Globalization.NumberStyles):(System.Int32)
---@overload fun(s:System.String, provider:System.IFormatProvider):(System.Int32)
---@overload fun(s:System.String, style:System.Globalization.NumberStyles, provider:System.IFormatProvider):(System.Int32)
---@overload fun(s:System.ReadOnlySpan*1System*Char, style?:System.Globalization.NumberStyles, provider?:System.IFormatProvider):(System.Int32)
---@overload fun(s:System.ReadOnlySpan*1System*Char, provider:System.IFormatProvider):(System.Int32)
---@overload fun(utf8Text:System.ReadOnlySpan*1System*Byte, style?:System.Globalization.NumberStyles, provider?:System.IFormatProvider):(System.Int32)
---@param utf8Text System.ReadOnlySpan*1System*Byte
---@param provider System.IFormatProvider
---@return System.Int32
_G['System']['Int32'].Parse = function(utf8Text, provider) end

---`Method Public Static`
---@overload fun(s:System.String, result:System.Int32-ref):(System.Boolean)
---@overload fun(s:System.ReadOnlySpan*1System*Char, result:System.Int32-ref):(System.Boolean)
---@overload fun(utf8Text:System.ReadOnlySpan*1System*Byte, result:System.Int32-ref):(System.Boolean)
---@overload fun(s:System.String, style:System.Globalization.NumberStyles, provider:System.IFormatProvider, result:System.Int32-ref):(System.Boolean)
---@overload fun(s:System.ReadOnlySpan*1System*Char, style:System.Globalization.NumberStyles, provider:System.IFormatProvider, result:System.Int32-ref):(System.Boolean)
---@overload fun(s:System.String, provider:System.IFormatProvider, result:System.Int32-ref):(System.Boolean)
---@overload fun(s:System.ReadOnlySpan*1System*Char, provider:System.IFormatProvider, result:System.Int32-ref):(System.Boolean)
---@overload fun(utf8Text:System.ReadOnlySpan*1System*Byte, style:System.Globalization.NumberStyles, provider:System.IFormatProvider, result:System.Int32-ref):(System.Boolean)
---@param utf8Text System.ReadOnlySpan*1System*Byte
---@param provider System.IFormatProvider
---@param result System.Int32-ref
---@return System.Boolean
_G['System']['Int32'].TryParse = function(utf8Text, provider, result) end

---`Method Public Instance Virtual`
---@return System.TypeCode
_G['System']['Int32'].GetTypeCode = function() end

---`Method Public Static`
---@param left System.Int32
---@param right System.Int32
---@return System.ValueTuple*1System*Int32*1System*Int32
_G['System']['Int32'].DivRem = function(left, right) end

---`Method Public Static`
---@param value System.Int32
---@return System.Int32
_G['System']['Int32'].LeadingZeroCount = function(value) end

---`Method Public Static`
---@param value System.Int32
---@return System.Int32
_G['System']['Int32'].PopCount = function(value) end

---`Method Public Static`
---@param value System.Int32
---@param rotateAmount System.Int32
---@return System.Int32
_G['System']['Int32'].RotateLeft = function(value, rotateAmount) end

---`Method Public Static`
---@param value System.Int32
---@param rotateAmount System.Int32
---@return System.Int32
_G['System']['Int32'].RotateRight = function(value, rotateAmount) end

---`Method Public Static`
---@param value System.Int32
---@return System.Int32
_G['System']['Int32'].TrailingZeroCount = function(value) end

---`Method Public Static`
---@param value System.Int32
---@return System.Boolean
_G['System']['Int32'].IsPow2 = function(value) end

---`Method Public Static`
---@param value System.Int32
---@return System.Int32
_G['System']['Int32'].Log2 = function(value) end

---`Method Public Static`
---@param value System.Int32
---@param min System.Int32
---@param max System.Int32
---@return System.Int32
_G['System']['Int32'].Clamp = function(value, min, max) end

---`Method Public Static`
---@param value System.Int32
---@param sign System.Int32
---@return System.Int32
_G['System']['Int32'].CopySign = function(value, sign) end

---`Method Public Static`
---@param x System.Int32
---@param y System.Int32
---@return System.Int32
_G['System']['Int32'].Max = function(x, y) end

---`Method Public Static`
---@param x System.Int32
---@param y System.Int32
---@return System.Int32
_G['System']['Int32'].Min = function(x, y) end

---`Method Public Static`
---@param value System.Int32
---@return System.Int32
_G['System']['Int32'].Sign = function(value) end

---`Method Public Static`
---@param value System.Int32
---@return System.Int32
_G['System']['Int32'].Abs = function(value) end

---`Method Public Static`
---@param value System.Int32.TOther
---@return System.Int32
_G['System']['Int32'].CreateChecked = function(value) end

---`Method Public Static`
---@param value System.Int32.TOther
---@return System.Int32
_G['System']['Int32'].CreateSaturating = function(value) end

---`Method Public Static`
---@param value System.Int32.TOther
---@return System.Int32
_G['System']['Int32'].CreateTruncating = function(value) end

---`Method Public Static`
---@param value System.Int32
---@return System.Boolean
_G['System']['Int32'].IsEvenInteger = function(value) end

---`Method Public Static`
---@param value System.Int32
---@return System.Boolean
_G['System']['Int32'].IsNegative = function(value) end

---`Method Public Static`
---@param value System.Int32
---@return System.Boolean
_G['System']['Int32'].IsOddInteger = function(value) end

---`Method Public Static`
---@param value System.Int32
---@return System.Boolean
_G['System']['Int32'].IsPositive = function(value) end

---`Method Public Static`
---@param x System.Int32
---@param y System.Int32
---@return System.Int32
_G['System']['Int32'].MaxMagnitude = function(x, y) end

---`Method Public Static`
---@param x System.Int32
---@param y System.Int32
---@return System.Int32
_G['System']['Int32'].MinMagnitude = function(x, y) end

---`Method Private Static`
---@param value System.Int32.TOther
---@param result System.Int32-ref
---@return System.Boolean
_G['System']['Int32'].TryConvertFromChecked = function(value, result) end

---`Method Private Static`
---@param value System.Int32.TOther
---@param result System.Int32-ref
---@return System.Boolean
_G['System']['Int32'].TryConvertFromSaturating = function(value, result) end

---`Method Private Static`
---@param value System.Int32.TOther
---@param result System.Int32-ref
---@return System.Boolean
_G['System']['Int32'].TryConvertFromTruncating = function(value, result) end

