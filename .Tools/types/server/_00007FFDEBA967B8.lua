---@meta
---@class System.UInt16 : System.ValueType, integer
---`Field Private Instance`
---@field m_value System.UInt16
---`Field Public Static`
---@field MaxValue System.UInt16
---`Field Public Static`
---@field MinValue System.UInt16
_G['System']['UInt16'] = {}

---`Method Public Instance Virtual`
---@overload fun(value:System.Object):(System.Int32)
---@param value System.UInt16
---@return System.Int32
_G['System']['UInt16'].CompareTo = function(value) end

---`Method Public Instance Virtual`
---@overload fun(obj:System.Object):(System.Boolean)
---@param obj System.UInt16
---@return System.Boolean
_G['System']['UInt16'].Equals = function(obj) end

---`Method Public Instance Virtual`
---@return System.Int32
_G['System']['UInt16'].GetHashCode = function() end

---`Method Public Instance Virtual`
---@overload fun():(System.String)
---@overload fun(provider:System.IFormatProvider):(System.String)
---@param format System.String
---@param provider System.IFormatProvider
---@return System.String
_G['System']['UInt16'].ToString = function(format, provider) end

---`Method Public Instance`
---@param format System.String
---@return System.String
_G['System']['UInt16'].ToString = function(format) end

---`Method Public Instance Virtual`
---@overload fun(destination:System.Span*1System*Char, charsWritten:System.Int32-ref, format?:System.ReadOnlySpan*1System*Char, provider?:System.IFormatProvider):(System.Boolean)
---@param utf8Destination System.Span*1System*Byte
---@param bytesWritten System.Int32-ref
---@param format? System.ReadOnlySpan*1System*Char
---@param provider? System.IFormatProvider
---@return System.Boolean
_G['System']['UInt16'].TryFormat = function(utf8Destination, bytesWritten, format, provider) end

---`Method Public Static`
---@overload fun(s:System.String):(System.UInt16)
---@overload fun(s:System.String, style:System.Globalization.NumberStyles):(System.UInt16)
---@overload fun(s:System.String, provider:System.IFormatProvider):(System.UInt16)
---@overload fun(s:System.String, style:System.Globalization.NumberStyles, provider:System.IFormatProvider):(System.UInt16)
---@overload fun(s:System.ReadOnlySpan*1System*Char, style?:System.Globalization.NumberStyles, provider?:System.IFormatProvider):(System.UInt16)
---@overload fun(s:System.ReadOnlySpan*1System*Char, provider:System.IFormatProvider):(System.UInt16)
---@overload fun(utf8Text:System.ReadOnlySpan*1System*Byte, style?:System.Globalization.NumberStyles, provider?:System.IFormatProvider):(System.UInt16)
---@param utf8Text System.ReadOnlySpan*1System*Byte
---@param provider System.IFormatProvider
---@return System.UInt16
_G['System']['UInt16'].Parse = function(utf8Text, provider) end

---`Method Public Static`
---@overload fun(s:System.String, result:System.UInt16-ref):(System.Boolean)
---@overload fun(s:System.ReadOnlySpan*1System*Char, result:System.UInt16-ref):(System.Boolean)
---@overload fun(utf8Text:System.ReadOnlySpan*1System*Byte, result:System.UInt16-ref):(System.Boolean)
---@overload fun(s:System.String, style:System.Globalization.NumberStyles, provider:System.IFormatProvider, result:System.UInt16-ref):(System.Boolean)
---@overload fun(s:System.ReadOnlySpan*1System*Char, style:System.Globalization.NumberStyles, provider:System.IFormatProvider, result:System.UInt16-ref):(System.Boolean)
---@overload fun(s:System.String, provider:System.IFormatProvider, result:System.UInt16-ref):(System.Boolean)
---@overload fun(s:System.ReadOnlySpan*1System*Char, provider:System.IFormatProvider, result:System.UInt16-ref):(System.Boolean)
---@overload fun(utf8Text:System.ReadOnlySpan*1System*Byte, style:System.Globalization.NumberStyles, provider:System.IFormatProvider, result:System.UInt16-ref):(System.Boolean)
---@param utf8Text System.ReadOnlySpan*1System*Byte
---@param provider System.IFormatProvider
---@param result System.UInt16-ref
---@return System.Boolean
_G['System']['UInt16'].TryParse = function(utf8Text, provider, result) end

---`Method Public Instance Virtual`
---@return System.TypeCode
_G['System']['UInt16'].GetTypeCode = function() end

---`Method Public Static`
---@param left System.UInt16
---@param right System.UInt16
---@return System.ValueTuple*1System*UInt16*1System*UInt16
_G['System']['UInt16'].DivRem = function(left, right) end

---`Method Public Static`
---@param value System.UInt16
---@return System.UInt16
_G['System']['UInt16'].LeadingZeroCount = function(value) end

---`Method Public Static`
---@param value System.UInt16
---@return System.UInt16
_G['System']['UInt16'].PopCount = function(value) end

---`Method Public Static`
---@param value System.UInt16
---@param rotateAmount System.Int32
---@return System.UInt16
_G['System']['UInt16'].RotateLeft = function(value, rotateAmount) end

---`Method Public Static`
---@param value System.UInt16
---@param rotateAmount System.Int32
---@return System.UInt16
_G['System']['UInt16'].RotateRight = function(value, rotateAmount) end

---`Method Public Static`
---@param value System.UInt16
---@return System.UInt16
_G['System']['UInt16'].TrailingZeroCount = function(value) end

---`Method Public Static`
---@param value System.UInt16
---@return System.Boolean
_G['System']['UInt16'].IsPow2 = function(value) end

---`Method Public Static`
---@param value System.UInt16
---@return System.UInt16
_G['System']['UInt16'].Log2 = function(value) end

---`Method Public Static`
---@param value System.UInt16
---@param min System.UInt16
---@param max System.UInt16
---@return System.UInt16
_G['System']['UInt16'].Clamp = function(value, min, max) end

---`Method Public Static`
---@param x System.UInt16
---@param y System.UInt16
---@return System.UInt16
_G['System']['UInt16'].Max = function(x, y) end

---`Method Public Static`
---@param x System.UInt16
---@param y System.UInt16
---@return System.UInt16
_G['System']['UInt16'].Min = function(x, y) end

---`Method Public Static`
---@param value System.UInt16
---@return System.Int32
_G['System']['UInt16'].Sign = function(value) end

---`Method Public Static`
---@param value System.UInt16.TOther
---@return System.UInt16
_G['System']['UInt16'].CreateChecked = function(value) end

---`Method Public Static`
---@param value System.UInt16.TOther
---@return System.UInt16
_G['System']['UInt16'].CreateSaturating = function(value) end

---`Method Public Static`
---@param value System.UInt16.TOther
---@return System.UInt16
_G['System']['UInt16'].CreateTruncating = function(value) end

---`Method Public Static`
---@param value System.UInt16
---@return System.Boolean
_G['System']['UInt16'].IsEvenInteger = function(value) end

---`Method Public Static`
---@param value System.UInt16
---@return System.Boolean
_G['System']['UInt16'].IsOddInteger = function(value) end

---`Method Private Static`
---@param value System.UInt16.TOther
---@param result System.UInt16-ref
---@return System.Boolean
_G['System']['UInt16'].TryConvertFromChecked = function(value, result) end

---`Method Private Static`
---@param value System.UInt16.TOther
---@param result System.UInt16-ref
---@return System.Boolean
_G['System']['UInt16'].TryConvertFromSaturating = function(value, result) end

---`Method Private Static`
---@param value System.UInt16.TOther
---@param result System.UInt16-ref
---@return System.Boolean
_G['System']['UInt16'].TryConvertFromTruncating = function(value, result) end

