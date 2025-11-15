---@meta
---@class System.Double : System.ValueType, number
---@operator mul(System.TimeSpan):System.TimeSpan
---`Field Private Instance`
---@field m_value System.Double
---`Field Public Static`
---@field MinValue System.Double
---`Field Public Static`
---@field MaxValue System.Double
---`Field Public Static`
---@field Epsilon System.Double
---`Field Public Static`
---@field NegativeInfinity System.Double
---`Field Public Static`
---@field PositiveInfinity System.Double
---`Field Public Static`
---@field NaN System.Double
---`Field Public Static`
---@field NegativeZero System.Double
---`Field Public Static`
---@field E System.Double
---`Field Public Static`
---@field Pi System.Double
---`Field Public Static`
---@field Tau System.Double
---`Getter NonPublic Instance`
---@field BiasedExponent System.UInt16
---`Getter NonPublic Instance`
---@field Exponent System.Int16
---`Getter NonPublic Instance`
---@field Significand System.UInt64
---`Getter NonPublic Instance`
---@field TrailingSignificand System.UInt64
_G['System']['Double'] = {}

---`Method NonPublic Static`
---@param bits System.UInt64
---@return System.UInt16
_G['System']['Double'].ExtractBiasedExponentFromBits = function(bits) end

---`Method NonPublic Static`
---@param bits System.UInt64
---@return System.UInt64
_G['System']['Double'].ExtractTrailingSignificandFromBits = function(bits) end

---`Method Public Static`
---@param d System.Double
---@return System.Boolean
_G['System']['Double'].IsFinite = function(d) end

---`Method Public Static`
---@param d System.Double
---@return System.Boolean
_G['System']['Double'].IsInfinity = function(d) end

---`Method Public Static`
---@param d System.Double
---@return System.Boolean
_G['System']['Double'].IsNaN = function(d) end

---`Method Public Static`
---@param d System.Double
---@return System.Boolean
_G['System']['Double'].IsNegative = function(d) end

---`Method Public Static`
---@param d System.Double
---@return System.Boolean
_G['System']['Double'].IsNegativeInfinity = function(d) end

---`Method Public Static`
---@param d System.Double
---@return System.Boolean
_G['System']['Double'].IsNormal = function(d) end

---`Method Public Static`
---@param d System.Double
---@return System.Boolean
_G['System']['Double'].IsPositiveInfinity = function(d) end

---`Method Public Static`
---@param d System.Double
---@return System.Boolean
_G['System']['Double'].IsSubnormal = function(d) end

---`Method Public Instance Virtual`
---@overload fun(value:System.Object):(System.Int32)
---@param value System.Double
---@return System.Int32
_G['System']['Double'].CompareTo = function(value) end

---`Method Public Instance Virtual`
---@overload fun(obj:System.Object):(System.Boolean)
---@param obj System.Double
---@return System.Boolean
_G['System']['Double'].Equals = function(obj) end

---`Method Public Instance Virtual`
---@return System.Int32
_G['System']['Double'].GetHashCode = function() end

---`Method Public Instance Virtual`
---@overload fun():(System.String)
---@overload fun(provider:System.IFormatProvider):(System.String)
---@param format System.String
---@param provider System.IFormatProvider
---@return System.String
_G['System']['Double'].ToString = function(format, provider) end

---`Method Public Instance`
---@param format System.String
---@return System.String
_G['System']['Double'].ToString = function(format) end

---`Method Public Instance Virtual`
---@overload fun(destination:System.Span*1System*Char, charsWritten:System.Int32-ref, format?:System.ReadOnlySpan*1System*Char, provider?:System.IFormatProvider):(System.Boolean)
---@param utf8Destination System.Span*1System*Byte
---@param bytesWritten System.Int32-ref
---@param format? System.ReadOnlySpan*1System*Char
---@param provider? System.IFormatProvider
---@return System.Boolean
_G['System']['Double'].TryFormat = function(utf8Destination, bytesWritten, format, provider) end

---`Method Public Static`
---@overload fun(s:System.String):(System.Double)
---@overload fun(s:System.String, style:System.Globalization.NumberStyles):(System.Double)
---@overload fun(s:System.String, provider:System.IFormatProvider):(System.Double)
---@overload fun(s:System.String, style:System.Globalization.NumberStyles, provider:System.IFormatProvider):(System.Double)
---@overload fun(s:System.ReadOnlySpan*1System*Char, style?:System.Globalization.NumberStyles, provider?:System.IFormatProvider):(System.Double)
---@overload fun(s:System.ReadOnlySpan*1System*Char, provider:System.IFormatProvider):(System.Double)
---@overload fun(utf8Text:System.ReadOnlySpan*1System*Byte, style?:System.Globalization.NumberStyles, provider?:System.IFormatProvider):(System.Double)
---@param utf8Text System.ReadOnlySpan*1System*Byte
---@param provider System.IFormatProvider
---@return System.Double
_G['System']['Double'].Parse = function(utf8Text, provider) end

---`Method Public Static`
---@overload fun(s:System.String, result:System.Double-ref):(System.Boolean)
---@overload fun(s:System.ReadOnlySpan*1System*Char, result:System.Double-ref):(System.Boolean)
---@overload fun(utf8Text:System.ReadOnlySpan*1System*Byte, result:System.Double-ref):(System.Boolean)
---@overload fun(s:System.String, style:System.Globalization.NumberStyles, provider:System.IFormatProvider, result:System.Double-ref):(System.Boolean)
---@overload fun(s:System.ReadOnlySpan*1System*Char, style:System.Globalization.NumberStyles, provider:System.IFormatProvider, result:System.Double-ref):(System.Boolean)
---@overload fun(s:System.String, provider:System.IFormatProvider, result:System.Double-ref):(System.Boolean)
---@overload fun(s:System.ReadOnlySpan*1System*Char, provider:System.IFormatProvider, result:System.Double-ref):(System.Boolean)
---@overload fun(utf8Text:System.ReadOnlySpan*1System*Byte, style:System.Globalization.NumberStyles, provider:System.IFormatProvider, result:System.Double-ref):(System.Boolean)
---@param utf8Text System.ReadOnlySpan*1System*Byte
---@param provider System.IFormatProvider
---@param result System.Double-ref
---@return System.Boolean
_G['System']['Double'].TryParse = function(utf8Text, provider, result) end

---`Method Public Instance Virtual`
---@return System.TypeCode
_G['System']['Double'].GetTypeCode = function() end

---`Method Public Static`
---@param value System.Double
---@return System.Boolean
_G['System']['Double'].IsPow2 = function(value) end

---`Method Public Static`
---@param value System.Double
---@return System.Double
_G['System']['Double'].Log2 = function(value) end

---`Method Public Static`
---@param x System.Double
---@return System.Double
_G['System']['Double'].Exp = function(x) end

---`Method Public Static`
---@param x System.Double
---@return System.Double
_G['System']['Double'].ExpM1 = function(x) end

---`Method Public Static`
---@param x System.Double
---@return System.Double
_G['System']['Double'].Exp2 = function(x) end

---`Method Public Static`
---@param x System.Double
---@return System.Double
_G['System']['Double'].Exp2M1 = function(x) end

---`Method Public Static`
---@param x System.Double
---@return System.Double
_G['System']['Double'].Exp10 = function(x) end

---`Method Public Static`
---@param x System.Double
---@return System.Double
_G['System']['Double'].Exp10M1 = function(x) end

---`Method Public Static`
---@param x System.Double
---@return System.Double
_G['System']['Double'].Ceiling = function(x) end

---`Method Public Static`
---@param x System.Double
---@return System.Double
_G['System']['Double'].Floor = function(x) end

---`Method Public Static`
---@overload fun(x:System.Double):(System.Double)
---@overload fun(x:System.Double, digits:System.Int32):(System.Double)
---@overload fun(x:System.Double, mode:System.MidpointRounding):(System.Double)
---@param x System.Double
---@param digits System.Int32
---@param mode System.MidpointRounding
---@return System.Double
_G['System']['Double'].Round = function(x, digits, mode) end

---`Method Public Static`
---@param x System.Double
---@return System.Double
_G['System']['Double'].Truncate = function(x) end

---`Method Public Static`
---@param y System.Double
---@param x System.Double
---@return System.Double
_G['System']['Double'].Atan2 = function(y, x) end

---`Method Public Static`
---@param y System.Double
---@param x System.Double
---@return System.Double
_G['System']['Double'].Atan2Pi = function(y, x) end

---`Method Public Static`
---@param x System.Double
---@return System.Double
_G['System']['Double'].BitDecrement = function(x) end

---`Method Public Static`
---@param x System.Double
---@return System.Double
_G['System']['Double'].BitIncrement = function(x) end

---`Method Public Static`
---@param left System.Double
---@param right System.Double
---@param addend System.Double
---@return System.Double
_G['System']['Double'].FusedMultiplyAdd = function(left, right, addend) end

---`Method Public Static`
---@param left System.Double
---@param right System.Double
---@return System.Double
_G['System']['Double'].Ieee754Remainder = function(left, right) end

---`Method Public Static`
---@param x System.Double
---@return System.Int32
_G['System']['Double'].ILogB = function(x) end

---`Method Public Static`
---@param value1 System.Double
---@param value2 System.Double
---@param amount System.Double
---@return System.Double
_G['System']['Double'].Lerp = function(value1, value2, amount) end

---`Method Public Static`
---@param x System.Double
---@return System.Double
_G['System']['Double'].ReciprocalEstimate = function(x) end

---`Method Public Static`
---@param x System.Double
---@return System.Double
_G['System']['Double'].ReciprocalSqrtEstimate = function(x) end

---`Method Public Static`
---@param x System.Double
---@param n System.Int32
---@return System.Double
_G['System']['Double'].ScaleB = function(x, n) end

---`Method Public Static`
---@param x System.Double
---@return System.Double
_G['System']['Double'].Acosh = function(x) end

---`Method Public Static`
---@param x System.Double
---@return System.Double
_G['System']['Double'].Asinh = function(x) end

---`Method Public Static`
---@param x System.Double
---@return System.Double
_G['System']['Double'].Atanh = function(x) end

---`Method Public Static`
---@param x System.Double
---@return System.Double
_G['System']['Double'].Cosh = function(x) end

---`Method Public Static`
---@param x System.Double
---@return System.Double
_G['System']['Double'].Sinh = function(x) end

---`Method Public Static`
---@param x System.Double
---@return System.Double
_G['System']['Double'].Tanh = function(x) end

---`Method Public Static`
---@overload fun(x:System.Double):(System.Double)
---@param x System.Double
---@param newBase System.Double
---@return System.Double
_G['System']['Double'].Log = function(x, newBase) end

---`Method Public Static`
---@param x System.Double
---@return System.Double
_G['System']['Double'].LogP1 = function(x) end

---`Method Public Static`
---@param x System.Double
---@return System.Double
_G['System']['Double'].Log2P1 = function(x) end

---`Method Public Static`
---@param x System.Double
---@return System.Double
_G['System']['Double'].Log10 = function(x) end

---`Method Public Static`
---@param x System.Double
---@return System.Double
_G['System']['Double'].Log10P1 = function(x) end

---`Method Public Static`
---@param value System.Double
---@param min System.Double
---@param max System.Double
---@return System.Double
_G['System']['Double'].Clamp = function(value, min, max) end

---`Method Public Static`
---@param value System.Double
---@param sign System.Double
---@return System.Double
_G['System']['Double'].CopySign = function(value, sign) end

---`Method Public Static`
---@param x System.Double
---@param y System.Double
---@return System.Double
_G['System']['Double'].Max = function(x, y) end

---`Method Public Static`
---@param x System.Double
---@param y System.Double
---@return System.Double
_G['System']['Double'].MaxNumber = function(x, y) end

---`Method Public Static`
---@param x System.Double
---@param y System.Double
---@return System.Double
_G['System']['Double'].Min = function(x, y) end

---`Method Public Static`
---@param x System.Double
---@param y System.Double
---@return System.Double
_G['System']['Double'].MinNumber = function(x, y) end

---`Method Public Static`
---@param value System.Double
---@return System.Int32
_G['System']['Double'].Sign = function(value) end

---`Method Public Static`
---@param value System.Double
---@return System.Double
_G['System']['Double'].Abs = function(value) end

---`Method Public Static`
---@param value System.Double.TOther
---@return System.Double
_G['System']['Double'].CreateChecked = function(value) end

---`Method Public Static`
---@param value System.Double.TOther
---@return System.Double
_G['System']['Double'].CreateSaturating = function(value) end

---`Method Public Static`
---@param value System.Double.TOther
---@return System.Double
_G['System']['Double'].CreateTruncating = function(value) end

---`Method Public Static`
---@param value System.Double
---@return System.Boolean
_G['System']['Double'].IsEvenInteger = function(value) end

---`Method Public Static`
---@param value System.Double
---@return System.Boolean
_G['System']['Double'].IsInteger = function(value) end

---`Method Public Static`
---@param value System.Double
---@return System.Boolean
_G['System']['Double'].IsOddInteger = function(value) end

---`Method Public Static`
---@param value System.Double
---@return System.Boolean
_G['System']['Double'].IsPositive = function(value) end

---`Method Public Static`
---@param value System.Double
---@return System.Boolean
_G['System']['Double'].IsRealNumber = function(value) end

---`Method Public Static`
---@param x System.Double
---@param y System.Double
---@return System.Double
_G['System']['Double'].MaxMagnitude = function(x, y) end

---`Method Public Static`
---@param x System.Double
---@param y System.Double
---@return System.Double
_G['System']['Double'].MaxMagnitudeNumber = function(x, y) end

---`Method Public Static`
---@param x System.Double
---@param y System.Double
---@return System.Double
_G['System']['Double'].MinMagnitude = function(x, y) end

---`Method Public Static`
---@param x System.Double
---@param y System.Double
---@return System.Double
_G['System']['Double'].MinMagnitudeNumber = function(x, y) end

---`Method Private Static`
---@param value System.Double.TOther
---@param result System.Double-ref
---@return System.Boolean
_G['System']['Double'].TryConvertFrom = function(value, result) end

---`Method Private Static`
---@param value System.Double
---@param result System.TOther-ref
---@return System.Boolean
_G['System']['Double'].TryConvertTo = function(value, result) end

---`Method Public Static`
---@param x System.Double
---@param y System.Double
---@return System.Double
_G['System']['Double'].Pow = function(x, y) end

---`Method Public Static`
---@param x System.Double
---@return System.Double
_G['System']['Double'].Cbrt = function(x) end

---`Method Public Static`
---@param x System.Double
---@param y System.Double
---@return System.Double
_G['System']['Double'].Hypot = function(x, y) end

---`Method Public Static`
---@param x System.Double
---@param n System.Int32
---@return System.Double
_G['System']['Double'].RootN = function(x, n) end

---`Method Public Static`
---@param x System.Double
---@return System.Double
_G['System']['Double'].Sqrt = function(x) end

---`Method Public Static`
---@param x System.Double
---@return System.Double
_G['System']['Double'].Acos = function(x) end

---`Method Public Static`
---@param x System.Double
---@return System.Double
_G['System']['Double'].AcosPi = function(x) end

---`Method Public Static`
---@param x System.Double
---@return System.Double
_G['System']['Double'].Asin = function(x) end

---`Method Public Static`
---@param x System.Double
---@return System.Double
_G['System']['Double'].AsinPi = function(x) end

---`Method Public Static`
---@param x System.Double
---@return System.Double
_G['System']['Double'].Atan = function(x) end

---`Method Public Static`
---@param x System.Double
---@return System.Double
_G['System']['Double'].AtanPi = function(x) end

---`Method Public Static`
---@param x System.Double
---@return System.Double
_G['System']['Double'].Cos = function(x) end

---`Method Public Static`
---@param x System.Double
---@return System.Double
_G['System']['Double'].CosPi = function(x) end

---`Method Public Static`
---@param degrees System.Double
---@return System.Double
_G['System']['Double'].DegreesToRadians = function(degrees) end

---`Method Public Static`
---@param radians System.Double
---@return System.Double
_G['System']['Double'].RadiansToDegrees = function(radians) end

---`Method Public Static`
---@param x System.Double
---@return System.Double
_G['System']['Double'].Sin = function(x) end

---`Method Public Static`
---@param x System.Double
---@return System.ValueTuple*1System*Double*1System*Double
_G['System']['Double'].SinCos = function(x) end

---`Method Public Static`
---@param x System.Double
---@return System.ValueTuple*1System*Double*1System*Double
_G['System']['Double'].SinCosPi = function(x) end

---`Method Public Static`
---@param x System.Double
---@return System.Double
_G['System']['Double'].SinPi = function(x) end

---`Method Public Static`
---@param x System.Double
---@return System.Double
_G['System']['Double'].Tan = function(x) end

---`Method Public Static`
---@param x System.Double
---@return System.Double
_G['System']['Double'].TanPi = function(x) end

---`Method Private Static`
---@param x System.Double
---@param xTail System.Double
---@return System.Double
_G['System']['Double'].CosForIntervalPiBy4 = function(x, xTail) end

---`Method Private Static`
---@param x System.Double
---@param xTail System.Double
---@return System.Double
_G['System']['Double'].SinForIntervalPiBy4 = function(x, xTail) end

---`Method Private Static`
---@param x System.Double
---@param xTail System.Double
---@param isReciprocal System.Boolean
---@return System.Double
_G['System']['Double'].TanForIntervalPiBy4 = function(x, xTail, isReciprocal) end

