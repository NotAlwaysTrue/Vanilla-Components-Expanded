---@meta
---@class System.Single : System.ValueType, number
---@operator mul(Microsoft.Xna.Framework.Vector2):Microsoft.Xna.Framework.Vector2
---@operator mul(Microsoft.Xna.Framework.Vector3):Microsoft.Xna.Framework.Vector3
---@operator mul(Microsoft.Xna.Framework.Vector4):Microsoft.Xna.Framework.Vector4
---`Field Private Instance`
---@field m_value System.Single
---`Field Public Static`
---@field MinValue System.Single
---`Field Public Static`
---@field MaxValue System.Single
---`Field Public Static`
---@field Epsilon System.Single
---`Field Public Static`
---@field NegativeInfinity System.Single
---`Field Public Static`
---@field PositiveInfinity System.Single
---`Field Public Static`
---@field NaN System.Single
---`Field Public Static`
---@field NegativeZero System.Single
---`Field Public Static`
---@field E System.Single
---`Field Public Static`
---@field Pi System.Single
---`Field Public Static`
---@field Tau System.Single
---`Getter NonPublic Instance`
---@field BiasedExponent System.Byte
---`Getter NonPublic Instance`
---@field Exponent System.SByte
---`Getter NonPublic Instance`
---@field Significand System.UInt32
---`Getter NonPublic Instance`
---@field TrailingSignificand System.UInt32
_G['System']['Single'] = {}

---`Method NonPublic Static`
---@param bits System.UInt32
---@return System.Byte
_G['System']['Single'].ExtractBiasedExponentFromBits = function(bits) end

---`Method NonPublic Static`
---@param bits System.UInt32
---@return System.UInt32
_G['System']['Single'].ExtractTrailingSignificandFromBits = function(bits) end

---`Method Public Static`
---@param f System.Single
---@return System.Boolean
_G['System']['Single'].IsFinite = function(f) end

---`Method Public Static`
---@param f System.Single
---@return System.Boolean
_G['System']['Single'].IsInfinity = function(f) end

---`Method Public Static`
---@param f System.Single
---@return System.Boolean
_G['System']['Single'].IsNaN = function(f) end

---`Method Public Static`
---@param f System.Single
---@return System.Boolean
_G['System']['Single'].IsNegative = function(f) end

---`Method Public Static`
---@param f System.Single
---@return System.Boolean
_G['System']['Single'].IsNegativeInfinity = function(f) end

---`Method Public Static`
---@param f System.Single
---@return System.Boolean
_G['System']['Single'].IsNormal = function(f) end

---`Method Public Static`
---@param f System.Single
---@return System.Boolean
_G['System']['Single'].IsPositiveInfinity = function(f) end

---`Method Public Static`
---@param f System.Single
---@return System.Boolean
_G['System']['Single'].IsSubnormal = function(f) end

---`Method Public Instance Virtual`
---@overload fun(value:System.Object):(System.Int32)
---@param value System.Single
---@return System.Int32
_G['System']['Single'].CompareTo = function(value) end

---`Method Public Instance Virtual`
---@overload fun(obj:System.Object):(System.Boolean)
---@param obj System.Single
---@return System.Boolean
_G['System']['Single'].Equals = function(obj) end

---`Method Public Instance Virtual`
---@return System.Int32
_G['System']['Single'].GetHashCode = function() end

---`Method Public Instance Virtual`
---@overload fun():(System.String)
---@overload fun(provider:System.IFormatProvider):(System.String)
---@param format System.String
---@param provider System.IFormatProvider
---@return System.String
_G['System']['Single'].ToString = function(format, provider) end

---`Method Public Instance`
---@param format System.String
---@return System.String
_G['System']['Single'].ToString = function(format) end

---`Method Public Instance Virtual`
---@overload fun(destination:System.Span*1System*Char, charsWritten:System.Int32-ref, format?:System.ReadOnlySpan*1System*Char, provider?:System.IFormatProvider):(System.Boolean)
---@param utf8Destination System.Span*1System*Byte
---@param bytesWritten System.Int32-ref
---@param format? System.ReadOnlySpan*1System*Char
---@param provider? System.IFormatProvider
---@return System.Boolean
_G['System']['Single'].TryFormat = function(utf8Destination, bytesWritten, format, provider) end

---`Method Public Static`
---@overload fun(s:System.String):(System.Single)
---@overload fun(s:System.String, style:System.Globalization.NumberStyles):(System.Single)
---@overload fun(s:System.String, provider:System.IFormatProvider):(System.Single)
---@overload fun(s:System.String, style:System.Globalization.NumberStyles, provider:System.IFormatProvider):(System.Single)
---@overload fun(s:System.ReadOnlySpan*1System*Char, style?:System.Globalization.NumberStyles, provider?:System.IFormatProvider):(System.Single)
---@overload fun(s:System.ReadOnlySpan*1System*Char, provider:System.IFormatProvider):(System.Single)
---@overload fun(utf8Text:System.ReadOnlySpan*1System*Byte, style?:System.Globalization.NumberStyles, provider?:System.IFormatProvider):(System.Single)
---@param utf8Text System.ReadOnlySpan*1System*Byte
---@param provider System.IFormatProvider
---@return System.Single
_G['System']['Single'].Parse = function(utf8Text, provider) end

---`Method Public Static`
---@overload fun(s:System.String, result:System.Single-ref):(System.Boolean)
---@overload fun(s:System.ReadOnlySpan*1System*Char, result:System.Single-ref):(System.Boolean)
---@overload fun(utf8Text:System.ReadOnlySpan*1System*Byte, result:System.Single-ref):(System.Boolean)
---@overload fun(s:System.String, style:System.Globalization.NumberStyles, provider:System.IFormatProvider, result:System.Single-ref):(System.Boolean)
---@overload fun(s:System.ReadOnlySpan*1System*Char, style:System.Globalization.NumberStyles, provider:System.IFormatProvider, result:System.Single-ref):(System.Boolean)
---@overload fun(s:System.String, provider:System.IFormatProvider, result:System.Single-ref):(System.Boolean)
---@overload fun(s:System.ReadOnlySpan*1System*Char, provider:System.IFormatProvider, result:System.Single-ref):(System.Boolean)
---@overload fun(utf8Text:System.ReadOnlySpan*1System*Byte, style:System.Globalization.NumberStyles, provider:System.IFormatProvider, result:System.Single-ref):(System.Boolean)
---@param utf8Text System.ReadOnlySpan*1System*Byte
---@param provider System.IFormatProvider
---@param result System.Single-ref
---@return System.Boolean
_G['System']['Single'].TryParse = function(utf8Text, provider, result) end

---`Method Public Instance Virtual`
---@return System.TypeCode
_G['System']['Single'].GetTypeCode = function() end

---`Method Public Static`
---@param value System.Single
---@return System.Boolean
_G['System']['Single'].IsPow2 = function(value) end

---`Method Public Static`
---@param value System.Single
---@return System.Single
_G['System']['Single'].Log2 = function(value) end

---`Method Public Static`
---@param x System.Single
---@return System.Single
_G['System']['Single'].Exp = function(x) end

---`Method Public Static`
---@param x System.Single
---@return System.Single
_G['System']['Single'].ExpM1 = function(x) end

---`Method Public Static`
---@param x System.Single
---@return System.Single
_G['System']['Single'].Exp2 = function(x) end

---`Method Public Static`
---@param x System.Single
---@return System.Single
_G['System']['Single'].Exp2M1 = function(x) end

---`Method Public Static`
---@param x System.Single
---@return System.Single
_G['System']['Single'].Exp10 = function(x) end

---`Method Public Static`
---@param x System.Single
---@return System.Single
_G['System']['Single'].Exp10M1 = function(x) end

---`Method Public Static`
---@param x System.Single
---@return System.Single
_G['System']['Single'].Ceiling = function(x) end

---`Method Public Static`
---@param x System.Single
---@return System.Single
_G['System']['Single'].Floor = function(x) end

---`Method Public Static`
---@overload fun(x:System.Single):(System.Single)
---@overload fun(x:System.Single, digits:System.Int32):(System.Single)
---@overload fun(x:System.Single, mode:System.MidpointRounding):(System.Single)
---@param x System.Single
---@param digits System.Int32
---@param mode System.MidpointRounding
---@return System.Single
_G['System']['Single'].Round = function(x, digits, mode) end

---`Method Public Static`
---@param x System.Single
---@return System.Single
_G['System']['Single'].Truncate = function(x) end

---`Method Public Static`
---@param y System.Single
---@param x System.Single
---@return System.Single
_G['System']['Single'].Atan2 = function(y, x) end

---`Method Public Static`
---@param y System.Single
---@param x System.Single
---@return System.Single
_G['System']['Single'].Atan2Pi = function(y, x) end

---`Method Public Static`
---@param x System.Single
---@return System.Single
_G['System']['Single'].BitDecrement = function(x) end

---`Method Public Static`
---@param x System.Single
---@return System.Single
_G['System']['Single'].BitIncrement = function(x) end

---`Method Public Static`
---@param left System.Single
---@param right System.Single
---@param addend System.Single
---@return System.Single
_G['System']['Single'].FusedMultiplyAdd = function(left, right, addend) end

---`Method Public Static`
---@param left System.Single
---@param right System.Single
---@return System.Single
_G['System']['Single'].Ieee754Remainder = function(left, right) end

---`Method Public Static`
---@param x System.Single
---@return System.Int32
_G['System']['Single'].ILogB = function(x) end

---`Method Public Static`
---@param value1 System.Single
---@param value2 System.Single
---@param amount System.Single
---@return System.Single
_G['System']['Single'].Lerp = function(value1, value2, amount) end

---`Method Public Static`
---@param x System.Single
---@return System.Single
_G['System']['Single'].ReciprocalEstimate = function(x) end

---`Method Public Static`
---@param x System.Single
---@return System.Single
_G['System']['Single'].ReciprocalSqrtEstimate = function(x) end

---`Method Public Static`
---@param x System.Single
---@param n System.Int32
---@return System.Single
_G['System']['Single'].ScaleB = function(x, n) end

---`Method Public Static`
---@param x System.Single
---@return System.Single
_G['System']['Single'].Acosh = function(x) end

---`Method Public Static`
---@param x System.Single
---@return System.Single
_G['System']['Single'].Asinh = function(x) end

---`Method Public Static`
---@param x System.Single
---@return System.Single
_G['System']['Single'].Atanh = function(x) end

---`Method Public Static`
---@param x System.Single
---@return System.Single
_G['System']['Single'].Cosh = function(x) end

---`Method Public Static`
---@param x System.Single
---@return System.Single
_G['System']['Single'].Sinh = function(x) end

---`Method Public Static`
---@param x System.Single
---@return System.Single
_G['System']['Single'].Tanh = function(x) end

---`Method Public Static`
---@overload fun(x:System.Single):(System.Single)
---@param x System.Single
---@param newBase System.Single
---@return System.Single
_G['System']['Single'].Log = function(x, newBase) end

---`Method Public Static`
---@param x System.Single
---@return System.Single
_G['System']['Single'].LogP1 = function(x) end

---`Method Public Static`
---@param x System.Single
---@return System.Single
_G['System']['Single'].Log10 = function(x) end

---`Method Public Static`
---@param x System.Single
---@return System.Single
_G['System']['Single'].Log2P1 = function(x) end

---`Method Public Static`
---@param x System.Single
---@return System.Single
_G['System']['Single'].Log10P1 = function(x) end

---`Method Public Static`
---@param value System.Single
---@param min System.Single
---@param max System.Single
---@return System.Single
_G['System']['Single'].Clamp = function(value, min, max) end

---`Method Public Static`
---@param value System.Single
---@param sign System.Single
---@return System.Single
_G['System']['Single'].CopySign = function(value, sign) end

---`Method Public Static`
---@param x System.Single
---@param y System.Single
---@return System.Single
_G['System']['Single'].Max = function(x, y) end

---`Method Public Static`
---@param x System.Single
---@param y System.Single
---@return System.Single
_G['System']['Single'].MaxNumber = function(x, y) end

---`Method Public Static`
---@param x System.Single
---@param y System.Single
---@return System.Single
_G['System']['Single'].Min = function(x, y) end

---`Method Public Static`
---@param x System.Single
---@param y System.Single
---@return System.Single
_G['System']['Single'].MinNumber = function(x, y) end

---`Method Public Static`
---@param value System.Single
---@return System.Int32
_G['System']['Single'].Sign = function(value) end

---`Method Public Static`
---@param value System.Single
---@return System.Single
_G['System']['Single'].Abs = function(value) end

---`Method Public Static`
---@param value System.Single.TOther
---@return System.Single
_G['System']['Single'].CreateChecked = function(value) end

---`Method Public Static`
---@param value System.Single.TOther
---@return System.Single
_G['System']['Single'].CreateSaturating = function(value) end

---`Method Public Static`
---@param value System.Single.TOther
---@return System.Single
_G['System']['Single'].CreateTruncating = function(value) end

---`Method Public Static`
---@param value System.Single
---@return System.Boolean
_G['System']['Single'].IsEvenInteger = function(value) end

---`Method Public Static`
---@param value System.Single
---@return System.Boolean
_G['System']['Single'].IsInteger = function(value) end

---`Method Public Static`
---@param value System.Single
---@return System.Boolean
_G['System']['Single'].IsOddInteger = function(value) end

---`Method Public Static`
---@param value System.Single
---@return System.Boolean
_G['System']['Single'].IsPositive = function(value) end

---`Method Public Static`
---@param value System.Single
---@return System.Boolean
_G['System']['Single'].IsRealNumber = function(value) end

---`Method Public Static`
---@param x System.Single
---@param y System.Single
---@return System.Single
_G['System']['Single'].MaxMagnitude = function(x, y) end

---`Method Public Static`
---@param x System.Single
---@param y System.Single
---@return System.Single
_G['System']['Single'].MaxMagnitudeNumber = function(x, y) end

---`Method Public Static`
---@param x System.Single
---@param y System.Single
---@return System.Single
_G['System']['Single'].MinMagnitude = function(x, y) end

---`Method Public Static`
---@param x System.Single
---@param y System.Single
---@return System.Single
_G['System']['Single'].MinMagnitudeNumber = function(x, y) end

---`Method Private Static`
---@param value System.Single.TOther
---@param result System.Single-ref
---@return System.Boolean
_G['System']['Single'].TryConvertFrom = function(value, result) end

---`Method Private Static`
---@param value System.Single
---@param result System.TOther-ref
---@return System.Boolean
_G['System']['Single'].TryConvertTo = function(value, result) end

---`Method Public Static`
---@param x System.Single
---@param y System.Single
---@return System.Single
_G['System']['Single'].Pow = function(x, y) end

---`Method Public Static`
---@param x System.Single
---@return System.Single
_G['System']['Single'].Cbrt = function(x) end

---`Method Public Static`
---@param x System.Single
---@param y System.Single
---@return System.Single
_G['System']['Single'].Hypot = function(x, y) end

---`Method Public Static`
---@param x System.Single
---@param n System.Int32
---@return System.Single
_G['System']['Single'].RootN = function(x, n) end

---`Method Public Static`
---@param x System.Single
---@return System.Single
_G['System']['Single'].Sqrt = function(x) end

---`Method Public Static`
---@param x System.Single
---@return System.Single
_G['System']['Single'].Acos = function(x) end

---`Method Public Static`
---@param x System.Single
---@return System.Single
_G['System']['Single'].AcosPi = function(x) end

---`Method Public Static`
---@param x System.Single
---@return System.Single
_G['System']['Single'].Asin = function(x) end

---`Method Public Static`
---@param x System.Single
---@return System.Single
_G['System']['Single'].AsinPi = function(x) end

---`Method Public Static`
---@param x System.Single
---@return System.Single
_G['System']['Single'].Atan = function(x) end

---`Method Public Static`
---@param x System.Single
---@return System.Single
_G['System']['Single'].AtanPi = function(x) end

---`Method Public Static`
---@param x System.Single
---@return System.Single
_G['System']['Single'].Cos = function(x) end

---`Method Public Static`
---@param x System.Single
---@return System.Single
_G['System']['Single'].CosPi = function(x) end

---`Method Public Static`
---@param degrees System.Single
---@return System.Single
_G['System']['Single'].DegreesToRadians = function(degrees) end

---`Method Public Static`
---@param radians System.Single
---@return System.Single
_G['System']['Single'].RadiansToDegrees = function(radians) end

---`Method Public Static`
---@param x System.Single
---@return System.Single
_G['System']['Single'].Sin = function(x) end

---`Method Public Static`
---@param x System.Single
---@return System.ValueTuple*1System*Single*1System*Single
_G['System']['Single'].SinCos = function(x) end

---`Method Public Static`
---@param x System.Single
---@return System.ValueTuple*1System*Single*1System*Single
_G['System']['Single'].SinCosPi = function(x) end

---`Method Public Static`
---@param x System.Single
---@return System.Single
_G['System']['Single'].SinPi = function(x) end

---`Method Public Static`
---@param x System.Single
---@return System.Single
_G['System']['Single'].Tan = function(x) end

---`Method Public Static`
---@param x System.Single
---@return System.Single
_G['System']['Single'].TanPi = function(x) end

---`Method Private Static`
---@param x System.Single
---@return System.Single
_G['System']['Single'].CosForIntervalPiBy4 = function(x) end

---`Method Private Static`
---@param x System.Single
---@return System.Single
_G['System']['Single'].SinForIntervalPiBy4 = function(x) end

---`Method Private Static`
---@param x System.Single
---@param isReciprocal System.Boolean
---@return System.Single
_G['System']['Single'].TanForIntervalPiBy4 = function(x, isReciprocal) end

