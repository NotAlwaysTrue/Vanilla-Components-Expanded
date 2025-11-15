---@meta
---@class System.UInt32 : System.ValueType, integer
---`Field Private Instance`
---@field m_value System.UInt32
---`Field Public Static`
---@field MaxValue System.UInt32
---`Field Public Static`
---@field MinValue System.UInt32
_G['System']['UInt32'] = {}

---`Method Public Instance Virtual`
---@overload fun(value:System.Object):(System.Int32)
---@param value System.UInt32
---@return System.Int32
_G['System']['UInt32'].CompareTo = function(value) end

---`Method Public Instance Virtual`
---@overload fun(obj:System.Object):(System.Boolean)
---@param obj System.UInt32
---@return System.Boolean
_G['System']['UInt32'].Equals = function(obj) end

---`Method Public Instance Virtual`
---@return System.Int32
_G['System']['UInt32'].GetHashCode = function() end

---`Method Public Instance Virtual`
---@overload fun():(System.String)
---@overload fun(provider:System.IFormatProvider):(System.String)
---@param format System.String
---@param provider System.IFormatProvider
---@return System.String
_G['System']['UInt32'].ToString = function(format, provider) end

---`Method Public Instance`
---@param format System.String
---@return System.String
_G['System']['UInt32'].ToString = function(format) end

---`Method Public Instance Virtual`
---@overload fun(destination:System.Span*1System*Char, charsWritten:System.Int32-ref, format?:System.ReadOnlySpan*1System*Char, provider?:System.IFormatProvider):(System.Boolean)
---@param utf8Destination System.Span*1System*Byte
---@param bytesWritten System.Int32-ref
---@param format? System.ReadOnlySpan*1System*Char
---@param provider? System.IFormatProvider
---@return System.Boolean
_G['System']['UInt32'].TryFormat = function(utf8Destination, bytesWritten, format, provider) end

---`Method Public Static`
---@overload fun(s:System.String):(System.UInt32)
---@overload fun(s:System.String, style:System.Globalization.NumberStyles):(System.UInt32)
---@overload fun(s:System.String, provider:System.IFormatProvider):(System.UInt32)
---@overload fun(s:System.String, style:System.Globalization.NumberStyles, provider:System.IFormatProvider):(System.UInt32)
---@overload fun(s:System.ReadOnlySpan*1System*Char, style?:System.Globalization.NumberStyles, provider?:System.IFormatProvider):(System.UInt32)
---@overload fun(s:System.ReadOnlySpan*1System*Char, provider:System.IFormatProvider):(System.UInt32)
---@overload fun(utf8Text:System.ReadOnlySpan*1System*Byte, style?:System.Globalization.NumberStyles, provider?:System.IFormatProvider):(System.UInt32)
---@param utf8Text System.ReadOnlySpan*1System*Byte
---@param provider System.IFormatProvider
---@return System.UInt32
_G['System']['UInt32'].Parse = function(utf8Text, provider) end

---`Method Public Static`
---@overload fun(s:System.String, result:System.UInt32-ref):(System.Boolean)
---@overload fun(s:System.ReadOnlySpan*1System*Char, result:System.UInt32-ref):(System.Boolean)
---@overload fun(utf8Text:System.ReadOnlySpan*1System*Byte, result:System.UInt32-ref):(System.Boolean)
---@overload fun(s:System.String, style:System.Globalization.NumberStyles, provider:System.IFormatProvider, result:System.UInt32-ref):(System.Boolean)
---@overload fun(s:System.ReadOnlySpan*1System*Char, style:System.Globalization.NumberStyles, provider:System.IFormatProvider, result:System.UInt32-ref):(System.Boolean)
---@overload fun(s:System.String, provider:System.IFormatProvider, result:System.UInt32-ref):(System.Boolean)
---@overload fun(s:System.ReadOnlySpan*1System*Char, provider:System.IFormatProvider, result:System.UInt32-ref):(System.Boolean)
---@overload fun(utf8Text:System.ReadOnlySpan*1System*Byte, style:System.Globalization.NumberStyles, provider:System.IFormatProvider, result:System.UInt32-ref):(System.Boolean)
---@param utf8Text System.ReadOnlySpan*1System*Byte
---@param provider System.IFormatProvider
---@param result System.UInt32-ref
---@return System.Boolean
_G['System']['UInt32'].TryParse = function(utf8Text, provider, result) end

---`Method Public Instance Virtual`
---@return System.TypeCode
_G['System']['UInt32'].GetTypeCode = function() end

---`Method Public Static`
---@param left System.UInt32
---@param right System.UInt32
---@return System.ValueTuple*1System*UInt32*1System*UInt32
_G['System']['UInt32'].DivRem = function(left, right) end

---`Method Public Static`
---@param value System.UInt32
---@return System.UInt32
_G['System']['UInt32'].LeadingZeroCount = function(value) end

---`Method Public Static`
---@param value System.UInt32
---@return System.UInt32
_G['System']['UInt32'].PopCount = function(value) end

---`Method Public Static`
---@param value System.UInt32
---@param rotateAmount System.Int32
---@return System.UInt32
_G['System']['UInt32'].RotateLeft = function(value, rotateAmount) end

---`Method Public Static`
---@param value System.UInt32
---@param rotateAmount System.Int32
---@return System.UInt32
_G['System']['UInt32'].RotateRight = function(value, rotateAmount) end

---`Method Public Static`
---@param value System.UInt32
---@return System.UInt32
_G['System']['UInt32'].TrailingZeroCount = function(value) end

---`Method Public Static`
---@param value System.UInt32
---@return System.Boolean
_G['System']['UInt32'].IsPow2 = function(value) end

---`Method Public Static`
---@param value System.UInt32
---@return System.UInt32
_G['System']['UInt32'].Log2 = function(value) end

---`Method Public Static`
---@param value System.UInt32
---@param min System.UInt32
---@param max System.UInt32
---@return System.UInt32
_G['System']['UInt32'].Clamp = function(value, min, max) end

---`Method Public Static`
---@param x System.UInt32
---@param y System.UInt32
---@return System.UInt32
_G['System']['UInt32'].Max = function(x, y) end

---`Method Public Static`
---@param x System.UInt32
---@param y System.UInt32
---@return System.UInt32
_G['System']['UInt32'].Min = function(x, y) end

---`Method Public Static`
---@param value System.UInt32
---@return System.Int32
_G['System']['UInt32'].Sign = function(value) end

---`Method Public Static`
---@param value System.UInt32.TOther
---@return System.UInt32
_G['System']['UInt32'].CreateChecked = function(value) end

---`Method Public Static`
---@param value System.UInt32.TOther
---@return System.UInt32
_G['System']['UInt32'].CreateSaturating = function(value) end

---`Method Public Static`
---@param value System.UInt32.TOther
---@return System.UInt32
_G['System']['UInt32'].CreateTruncating = function(value) end

---`Method Public Static`
---@param value System.UInt32
---@return System.Boolean
_G['System']['UInt32'].IsEvenInteger = function(value) end

---`Method Public Static`
---@param value System.UInt32
---@return System.Boolean
_G['System']['UInt32'].IsOddInteger = function(value) end

---`Method Private Static`
---@param value System.UInt32.TOther
---@param result System.UInt32-ref
---@return System.Boolean
_G['System']['UInt32'].TryConvertFromChecked = function(value, result) end

---`Method Private Static`
---@param value System.UInt32.TOther
---@param result System.UInt32-ref
---@return System.Boolean
_G['System']['UInt32'].TryConvertFromSaturating = function(value, result) end

---`Method Private Static`
---@param value System.UInt32.TOther
---@param result System.UInt32-ref
---@return System.Boolean
_G['System']['UInt32'].TryConvertFromTruncating = function(value, result) end

