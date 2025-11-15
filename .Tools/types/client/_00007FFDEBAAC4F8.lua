---@meta
---@class System.UInt64 : System.ValueType, integer
---`Field Private Instance`
---@field m_value System.UInt64
---`Field Public Static`
---@field MaxValue System.UInt64
---`Field Public Static`
---@field MinValue System.UInt64
_G['System']['UInt64'] = {}

---`Method Public Instance Virtual`
---@overload fun(value:System.Object):(System.Int32)
---@param value System.UInt64
---@return System.Int32
_G['System']['UInt64'].CompareTo = function(value) end

---`Method Public Instance Virtual`
---@overload fun(obj:System.Object):(System.Boolean)
---@param obj System.UInt64
---@return System.Boolean
_G['System']['UInt64'].Equals = function(obj) end

---`Method Public Instance Virtual`
---@return System.Int32
_G['System']['UInt64'].GetHashCode = function() end

---`Method Public Instance Virtual`
---@overload fun():(System.String)
---@overload fun(provider:System.IFormatProvider):(System.String)
---@param format System.String
---@param provider System.IFormatProvider
---@return System.String
_G['System']['UInt64'].ToString = function(format, provider) end

---`Method Public Instance`
---@param format System.String
---@return System.String
_G['System']['UInt64'].ToString = function(format) end

---`Method Public Instance Virtual`
---@overload fun(destination:System.Span*1System*Char, charsWritten:System.Int32-ref, format?:System.ReadOnlySpan*1System*Char, provider?:System.IFormatProvider):(System.Boolean)
---@param utf8Destination System.Span*1System*Byte
---@param bytesWritten System.Int32-ref
---@param format? System.ReadOnlySpan*1System*Char
---@param provider? System.IFormatProvider
---@return System.Boolean
_G['System']['UInt64'].TryFormat = function(utf8Destination, bytesWritten, format, provider) end

---`Method Public Static`
---@overload fun(s:System.String):(System.UInt64)
---@overload fun(s:System.String, style:System.Globalization.NumberStyles):(System.UInt64)
---@overload fun(s:System.String, provider:System.IFormatProvider):(System.UInt64)
---@overload fun(s:System.String, style:System.Globalization.NumberStyles, provider:System.IFormatProvider):(System.UInt64)
---@overload fun(s:System.ReadOnlySpan*1System*Char, style?:System.Globalization.NumberStyles, provider?:System.IFormatProvider):(System.UInt64)
---@overload fun(s:System.ReadOnlySpan*1System*Char, provider:System.IFormatProvider):(System.UInt64)
---@overload fun(utf8Text:System.ReadOnlySpan*1System*Byte, style?:System.Globalization.NumberStyles, provider?:System.IFormatProvider):(System.UInt64)
---@param utf8Text System.ReadOnlySpan*1System*Byte
---@param provider System.IFormatProvider
---@return System.UInt64
_G['System']['UInt64'].Parse = function(utf8Text, provider) end

---`Method Public Static`
---@overload fun(s:System.String, result:System.UInt64-ref):(System.Boolean)
---@overload fun(s:System.ReadOnlySpan*1System*Char, result:System.UInt64-ref):(System.Boolean)
---@overload fun(utf8Text:System.ReadOnlySpan*1System*Byte, result:System.UInt64-ref):(System.Boolean)
---@overload fun(s:System.String, style:System.Globalization.NumberStyles, provider:System.IFormatProvider, result:System.UInt64-ref):(System.Boolean)
---@overload fun(s:System.ReadOnlySpan*1System*Char, style:System.Globalization.NumberStyles, provider:System.IFormatProvider, result:System.UInt64-ref):(System.Boolean)
---@overload fun(s:System.String, provider:System.IFormatProvider, result:System.UInt64-ref):(System.Boolean)
---@overload fun(s:System.ReadOnlySpan*1System*Char, provider:System.IFormatProvider, result:System.UInt64-ref):(System.Boolean)
---@overload fun(utf8Text:System.ReadOnlySpan*1System*Byte, style:System.Globalization.NumberStyles, provider:System.IFormatProvider, result:System.UInt64-ref):(System.Boolean)
---@param utf8Text System.ReadOnlySpan*1System*Byte
---@param provider System.IFormatProvider
---@param result System.UInt64-ref
---@return System.Boolean
_G['System']['UInt64'].TryParse = function(utf8Text, provider, result) end

---`Method Public Instance Virtual`
---@return System.TypeCode
_G['System']['UInt64'].GetTypeCode = function() end

---`Method Public Static`
---@param left System.UInt64
---@param right System.UInt64
---@return System.ValueTuple*1System*UInt64*1System*UInt64
_G['System']['UInt64'].DivRem = function(left, right) end

---`Method Public Static`
---@param value System.UInt64
---@return System.UInt64
_G['System']['UInt64'].LeadingZeroCount = function(value) end

---`Method Public Static`
---@param value System.UInt64
---@return System.UInt64
_G['System']['UInt64'].PopCount = function(value) end

---`Method Public Static`
---@param value System.UInt64
---@param rotateAmount System.Int32
---@return System.UInt64
_G['System']['UInt64'].RotateLeft = function(value, rotateAmount) end

---`Method Public Static`
---@param value System.UInt64
---@param rotateAmount System.Int32
---@return System.UInt64
_G['System']['UInt64'].RotateRight = function(value, rotateAmount) end

---`Method Public Static`
---@param value System.UInt64
---@return System.UInt64
_G['System']['UInt64'].TrailingZeroCount = function(value) end

---`Method Public Static`
---@param value System.UInt64
---@return System.Boolean
_G['System']['UInt64'].IsPow2 = function(value) end

---`Method Public Static`
---@param value System.UInt64
---@return System.UInt64
_G['System']['UInt64'].Log2 = function(value) end

---`Method Public Static`
---@param value System.UInt64
---@param min System.UInt64
---@param max System.UInt64
---@return System.UInt64
_G['System']['UInt64'].Clamp = function(value, min, max) end

---`Method Public Static`
---@param x System.UInt64
---@param y System.UInt64
---@return System.UInt64
_G['System']['UInt64'].Max = function(x, y) end

---`Method Public Static`
---@param x System.UInt64
---@param y System.UInt64
---@return System.UInt64
_G['System']['UInt64'].Min = function(x, y) end

---`Method Public Static`
---@param value System.UInt64
---@return System.Int32
_G['System']['UInt64'].Sign = function(value) end

---`Method Public Static`
---@param value System.UInt64.TOther
---@return System.UInt64
_G['System']['UInt64'].CreateChecked = function(value) end

---`Method Public Static`
---@param value System.UInt64.TOther
---@return System.UInt64
_G['System']['UInt64'].CreateSaturating = function(value) end

---`Method Public Static`
---@param value System.UInt64.TOther
---@return System.UInt64
_G['System']['UInt64'].CreateTruncating = function(value) end

---`Method Public Static`
---@param value System.UInt64
---@return System.Boolean
_G['System']['UInt64'].IsEvenInteger = function(value) end

---`Method Public Static`
---@param value System.UInt64
---@return System.Boolean
_G['System']['UInt64'].IsOddInteger = function(value) end

---`Method Private Static`
---@param value System.UInt64.TOther
---@param result System.UInt64-ref
---@return System.Boolean
_G['System']['UInt64'].TryConvertFromChecked = function(value, result) end

---`Method Private Static`
---@param value System.UInt64.TOther
---@param result System.UInt64-ref
---@return System.Boolean
_G['System']['UInt64'].TryConvertFromSaturating = function(value, result) end

---`Method Private Static`
---@param value System.UInt64.TOther
---@param result System.UInt64-ref
---@return System.Boolean
_G['System']['UInt64'].TryConvertFromTruncating = function(value, result) end

