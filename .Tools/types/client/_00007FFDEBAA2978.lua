---@meta
---@class System.Byte : System.ValueType, integer
---`Field Private Instance`
---@field m_value System.Byte
---`Field Public Static`
---@field MaxValue System.Byte
---`Field Public Static`
---@field MinValue System.Byte
_G['System']['Byte'] = {}

---`Method Public Instance Virtual`
---@overload fun(value:System.Object):(System.Int32)
---@param value System.Byte
---@return System.Int32
_G['System']['Byte'].CompareTo = function(value) end

---`Method Public Instance Virtual`
---@overload fun(obj:System.Object):(System.Boolean)
---@param obj System.Byte
---@return System.Boolean
_G['System']['Byte'].Equals = function(obj) end

---`Method Public Instance Virtual`
---@return System.Int32
_G['System']['Byte'].GetHashCode = function() end

---`Method Public Static`
---@overload fun(s:System.String):(System.Byte)
---@overload fun(s:System.String, style:System.Globalization.NumberStyles):(System.Byte)
---@overload fun(s:System.String, provider:System.IFormatProvider):(System.Byte)
---@overload fun(s:System.String, style:System.Globalization.NumberStyles, provider:System.IFormatProvider):(System.Byte)
---@overload fun(s:System.ReadOnlySpan*1System*Char, style?:System.Globalization.NumberStyles, provider?:System.IFormatProvider):(System.Byte)
---@overload fun(s:System.ReadOnlySpan*1System*Char, provider:System.IFormatProvider):(System.Byte)
---@overload fun(utf8Text:System.ReadOnlySpan*1System*Byte, style?:System.Globalization.NumberStyles, provider?:System.IFormatProvider):(System.Byte)
---@param utf8Text System.ReadOnlySpan*1System*Byte
---@param provider System.IFormatProvider
---@return System.Byte
_G['System']['Byte'].Parse = function(utf8Text, provider) end

---`Method Public Static`
---@overload fun(s:System.String, result:System.Byte-ref):(System.Boolean)
---@overload fun(s:System.ReadOnlySpan*1System*Char, result:System.Byte-ref):(System.Boolean)
---@overload fun(utf8Text:System.ReadOnlySpan*1System*Byte, result:System.Byte-ref):(System.Boolean)
---@overload fun(s:System.String, style:System.Globalization.NumberStyles, provider:System.IFormatProvider, result:System.Byte-ref):(System.Boolean)
---@overload fun(s:System.ReadOnlySpan*1System*Char, style:System.Globalization.NumberStyles, provider:System.IFormatProvider, result:System.Byte-ref):(System.Boolean)
---@overload fun(s:System.String, provider:System.IFormatProvider, result:System.Byte-ref):(System.Boolean)
---@overload fun(s:System.ReadOnlySpan*1System*Char, provider:System.IFormatProvider, result:System.Byte-ref):(System.Boolean)
---@overload fun(utf8Text:System.ReadOnlySpan*1System*Byte, style:System.Globalization.NumberStyles, provider:System.IFormatProvider, result:System.Byte-ref):(System.Boolean)
---@param utf8Text System.ReadOnlySpan*1System*Byte
---@param provider System.IFormatProvider
---@param result System.Byte-ref
---@return System.Boolean
_G['System']['Byte'].TryParse = function(utf8Text, provider, result) end

---`Method Public Instance Virtual`
---@overload fun():(System.String)
---@overload fun(provider:System.IFormatProvider):(System.String)
---@param format System.String
---@param provider System.IFormatProvider
---@return System.String
_G['System']['Byte'].ToString = function(format, provider) end

---`Method Public Instance`
---@param format System.String
---@return System.String
_G['System']['Byte'].ToString = function(format) end

---`Method Public Instance Virtual`
---@overload fun(destination:System.Span*1System*Char, charsWritten:System.Int32-ref, format?:System.ReadOnlySpan*1System*Char, provider?:System.IFormatProvider):(System.Boolean)
---@param utf8Destination System.Span*1System*Byte
---@param bytesWritten System.Int32-ref
---@param format? System.ReadOnlySpan*1System*Char
---@param provider? System.IFormatProvider
---@return System.Boolean
_G['System']['Byte'].TryFormat = function(utf8Destination, bytesWritten, format, provider) end

---`Method Public Instance Virtual`
---@return System.TypeCode
_G['System']['Byte'].GetTypeCode = function() end

---`Method Public Static`
---@param left System.Byte
---@param right System.Byte
---@return System.ValueTuple*1System*Byte*1System*Byte
_G['System']['Byte'].DivRem = function(left, right) end

---`Method Public Static`
---@param value System.Byte
---@return System.Byte
_G['System']['Byte'].LeadingZeroCount = function(value) end

---`Method Public Static`
---@param value System.Byte
---@return System.Byte
_G['System']['Byte'].PopCount = function(value) end

---`Method Public Static`
---@param value System.Byte
---@param rotateAmount System.Int32
---@return System.Byte
_G['System']['Byte'].RotateLeft = function(value, rotateAmount) end

---`Method Public Static`
---@param value System.Byte
---@param rotateAmount System.Int32
---@return System.Byte
_G['System']['Byte'].RotateRight = function(value, rotateAmount) end

---`Method Public Static`
---@param value System.Byte
---@return System.Byte
_G['System']['Byte'].TrailingZeroCount = function(value) end

---`Method Public Static`
---@param value System.Byte
---@return System.Boolean
_G['System']['Byte'].IsPow2 = function(value) end

---`Method Public Static`
---@param value System.Byte
---@return System.Byte
_G['System']['Byte'].Log2 = function(value) end

---`Method Public Static`
---@param value System.Byte
---@param min System.Byte
---@param max System.Byte
---@return System.Byte
_G['System']['Byte'].Clamp = function(value, min, max) end

---`Method Public Static`
---@param x System.Byte
---@param y System.Byte
---@return System.Byte
_G['System']['Byte'].Max = function(x, y) end

---`Method Public Static`
---@param x System.Byte
---@param y System.Byte
---@return System.Byte
_G['System']['Byte'].Min = function(x, y) end

---`Method Public Static`
---@param value System.Byte
---@return System.Int32
_G['System']['Byte'].Sign = function(value) end

---`Method Public Static`
---@param value System.Byte.TOther
---@return System.Byte
_G['System']['Byte'].CreateChecked = function(value) end

---`Method Public Static`
---@param value System.Byte.TOther
---@return System.Byte
_G['System']['Byte'].CreateSaturating = function(value) end

---`Method Public Static`
---@param value System.Byte.TOther
---@return System.Byte
_G['System']['Byte'].CreateTruncating = function(value) end

---`Method Public Static`
---@param value System.Byte
---@return System.Boolean
_G['System']['Byte'].IsEvenInteger = function(value) end

---`Method Public Static`
---@param value System.Byte
---@return System.Boolean
_G['System']['Byte'].IsOddInteger = function(value) end

---`Method Private Static`
---@param value System.Byte.TOther
---@param result System.Byte-ref
---@return System.Boolean
_G['System']['Byte'].TryConvertFromChecked = function(value, result) end

---`Method Private Static`
---@param value System.Byte.TOther
---@param result System.Byte-ref
---@return System.Boolean
_G['System']['Byte'].TryConvertFromSaturating = function(value, result) end

---`Method Private Static`
---@param value System.Byte.TOther
---@param result System.Byte-ref
---@return System.Boolean
_G['System']['Byte'].TryConvertFromTruncating = function(value, result) end

