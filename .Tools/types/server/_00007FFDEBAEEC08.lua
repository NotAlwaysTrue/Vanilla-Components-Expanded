---@meta
---@class System.String : System.Object, {[System.Int32]:System.Char}, string
---`Field Private Instance`
---@field _stringLength System.Int32
---`Field Private Instance`
---@field _firstChar System.Char
---`Field Public Static`
---@field Empty System.String
---`Getter Public Instance`
---@field Length System.Int32
_G['System']['String'] = {}

---`Method NonPublic Static`
---@param length System.Int32
---@return System.String
_G['System']['String'].FastAllocateString = function(length) end

---`Method NonPublic Instance`
---@param data System.Byte
_G['System']['String'].SetTrailByte = function(data) end

---`Method NonPublic Instance`
---@param data System.Byte-ref
---@return System.Boolean
_G['System']['String'].TryGetTrailByte = function(data) end

---`Method Private Instance`
---@return System.String
_G['System']['String'].Intern = function() end

---`Method Public Static`
---@param str System.String
---@return System.String
_G['System']['String'].Intern = function(str) end

---`Method Private Instance`
---@return System.String
_G['System']['String'].IsInterned = function() end

---`Method Public Static`
---@param str System.String
---@return System.String
_G['System']['String'].IsInterned = function(str) end

---`Method NonPublic Static`
---@param src System.String
---@param dest System.IntPtr
---@param len System.Int32
_G['System']['String'].InternalCopy = function(src, dest, len) end

---`Method NonPublic Instance`
---@param pbNativeBuffer System.Byte-ptr
---@param cbNativeBuffer System.Int32
---@param encoding System.Text.Encoding
---@return System.Int32
_G['System']['String'].GetBytesFromEncoding = function(pbNativeBuffer, cbNativeBuffer, encoding) end

---`Method Private Static`
---@param strA System.String
---@param strB System.String
---@return System.Boolean
_G['System']['String'].EqualsHelper = function(strA, strB) end

---`Method Private Static`
---@overload fun(strA:System.String, indexA:System.Int32, countA:System.Int32, strB:System.String, indexB:System.Int32, countB:System.Int32):(System.Int32)
---@param strA System.String
---@param strB System.String
---@return System.Int32
_G['System']['String'].CompareOrdinalHelper = function(strA, strB) end

---`Method NonPublic Static`
---@param strA System.String
---@param strB System.String
---@return System.Boolean
_G['System']['String'].EqualsOrdinalIgnoreCase = function(strA, strB) end

---`Method Private Static`
---@param strA System.String
---@param strB System.String
---@return System.Boolean
_G['System']['String'].EqualsOrdinalIgnoreCaseNoLengthCheck = function(strA, strB) end

---`Method Public Static`
---@overload fun(strA:System.String, strB:System.String):(System.Int32)
---@overload fun(strA:System.String, strB:System.String, ignoreCase:System.Boolean):(System.Int32)
---@overload fun(strA:System.String, strB:System.String, comparisonType:System.StringComparison):(System.Int32)
---@overload fun(strA:System.String, strB:System.String, culture:System.Globalization.CultureInfo, options:System.Globalization.CompareOptions):(System.Int32)
---@overload fun(strA:System.String, strB:System.String, ignoreCase:System.Boolean, culture:System.Globalization.CultureInfo):(System.Int32)
---@overload fun(strA:System.String, indexA:System.Int32, strB:System.String, indexB:System.Int32, length:System.Int32):(System.Int32)
---@overload fun(strA:System.String, indexA:System.Int32, strB:System.String, indexB:System.Int32, length:System.Int32, ignoreCase:System.Boolean):(System.Int32)
---@overload fun(strA:System.String, indexA:System.Int32, strB:System.String, indexB:System.Int32, length:System.Int32, ignoreCase:System.Boolean, culture:System.Globalization.CultureInfo):(System.Int32)
---@overload fun(strA:System.String, indexA:System.Int32, strB:System.String, indexB:System.Int32, length:System.Int32, culture:System.Globalization.CultureInfo, options:System.Globalization.CompareOptions):(System.Int32)
---@param strA System.String
---@param indexA System.Int32
---@param strB System.String
---@param indexB System.Int32
---@param length System.Int32
---@param comparisonType System.StringComparison
---@return System.Int32
_G['System']['String'].Compare = function(strA, indexA, strB, indexB, length, comparisonType) end

---`Method Public Static`
---@overload fun(strA:System.String, strB:System.String):(System.Int32)
---@param strA System.String
---@param indexA System.Int32
---@param strB System.String
---@param indexB System.Int32
---@param length System.Int32
---@return System.Int32
_G['System']['String'].CompareOrdinal = function(strA, indexA, strB, indexB, length) end

---`Method NonPublic Static`
---@param strA System.ReadOnlySpan*1System*Char
---@param strB System.ReadOnlySpan*1System*Char
---@return System.Int32
_G['System']['String'].CompareOrdinal = function(strA, strB) end

---`Method Public Instance Virtual`
---@overload fun(value:System.Object):(System.Int32)
---@param strB System.String
---@return System.Int32
_G['System']['String'].CompareTo = function(strB) end

---`Method Public Instance`
---@overload fun(value:System.String):(System.Boolean)
---@overload fun(value:System.String, comparisonType:System.StringComparison):(System.Boolean)
---@overload fun(value:System.String, ignoreCase:System.Boolean, culture:System.Globalization.CultureInfo):(System.Boolean)
---@param value System.Char
---@return System.Boolean
_G['System']['String'].EndsWith = function(value) end

---`Method Public Instance Virtual`
---@overload fun(obj:System.Object):(System.Boolean)
---@param value System.String
---@return System.Boolean
_G['System']['String'].Equals = function(value) end

---`Method Public Instance`
---@param value System.String
---@param comparisonType System.StringComparison
---@return System.Boolean
_G['System']['String'].Equals = function(value, comparisonType) end

---`Method Public Static`
---@overload fun(a:System.String, b:System.String):(System.Boolean)
---@param a System.String
---@param b System.String
---@param comparisonType System.StringComparison
---@return System.Boolean
_G['System']['String'].Equals = function(a, b, comparisonType) end

---`Method Public Instance Virtual`
---@return System.Int32
_G['System']['String'].GetHashCode = function() end

---`Method Public Instance`
---@param comparisonType System.StringComparison
---@return System.Int32
_G['System']['String'].GetHashCode = function(comparisonType) end

---`Method Public Static`
---@overload fun(value:System.ReadOnlySpan*1System*Char):(System.Int32)
---@param value System.ReadOnlySpan*1System*Char
---@param comparisonType System.StringComparison
---@return System.Int32
_G['System']['String'].GetHashCode = function(value, comparisonType) end

---`Method NonPublic Instance`
---@return System.Int32
_G['System']['String'].GetHashCodeOrdinalIgnoreCase = function() end

---`Method NonPublic Static`
---@param value System.ReadOnlySpan*1System*Char
---@return System.Int32
_G['System']['String'].GetHashCodeOrdinalIgnoreCase = function(value) end

---`Method NonPublic Instance`
---@return System.Int32
_G['System']['String'].GetNonRandomizedHashCode = function() end

---`Method NonPublic Instance`
---@return System.Int32
_G['System']['String'].GetNonRandomizedHashCodeOrdinalIgnoreCase = function() end

---`Method Public Instance`
---@overload fun(value:System.String):(System.Boolean)
---@overload fun(value:System.String, comparisonType:System.StringComparison):(System.Boolean)
---@overload fun(value:System.String, ignoreCase:System.Boolean, culture:System.Globalization.CultureInfo):(System.Boolean)
---@param value System.Char
---@return System.Boolean
_G['System']['String'].StartsWith = function(value) end

---`Method NonPublic Static`
---@param comparisonType System.StringComparison
_G['System']['String'].CheckStringComparison = function(comparisonType) end

---`Method NonPublic Static`
---@param comparisonType System.StringComparison
---@return System.Globalization.CompareOptions
_G['System']['String'].GetCaseCompareOfComparisonCulture = function(comparisonType) end

---`Method Private Static`
---@param comparisonType System.StringComparison
---@return System.Globalization.CompareOptions
_G['System']['String'].GetCompareOptionsFromOrdinalStringComparison = function(comparisonType) end

---`Method Private Static`
---@overload fun(value:(System.Char-arr)|(System.Char[])):(System.String)
---@overload fun(value:(System.Char-arr)|(System.Char[]), startIndex:System.Int32, length:System.Int32):(System.String)
---@overload fun(ptr:System.Char-ptr):(System.String)
---@overload fun(ptr:System.Char-ptr, startIndex:System.Int32, length:System.Int32):(System.String)
---@overload fun(value:System.SByte-ptr):(System.String)
---@overload fun(value:System.SByte-ptr, startIndex:System.Int32, length:System.Int32):(System.String)
---@overload fun(value:System.SByte-ptr, startIndex:System.Int32, length:System.Int32, enc:System.Text.Encoding):(System.String)
---@overload fun(c:System.Char, count:System.Int32):(System.String)
---@param value System.ReadOnlySpan*1System*Char
---@return System.String
_G['System']['String'].Ctor = function(value) end

---`Method Private Static`
---@param pb System.Byte-ptr
---@param numBytes System.Int32
---@return System.String
_G['System']['String'].CreateStringForSByteConstructor = function(pb, numBytes) end

---`Method Public Static`
---@overload fun(length:System.Int32, state:System.String.TState, action:(System.Buffers.SpanAction*1System*Char*1System*String*TState)|(fun(span:System.Span*1System*Char, arg:System.String.TState))):(System.String)
---@overload fun(provider:System.IFormatProvider, handler:System.Runtime.CompilerServices.DefaultInterpolatedStringHandler-ref):(System.String)
---@param provider System.IFormatProvider
---@param initialBuffer System.Span*1System*Char
---@param handler System.Runtime.CompilerServices.DefaultInterpolatedStringHandler-ref
---@return System.String
_G['System']['String'].Create = function(provider, initialBuffer, handler) end

---`Method NonPublic Instance`
---@param startIndex System.Int32
---@param count System.Int32
---@param slice System.ReadOnlySpan
---@return System.Boolean
_G['System']['String'].TryGetSpan = function(startIndex, count, slice) end

---`Method Public Instance Virtual`
---@return System.Object
_G['System']['String'].Clone = function() end

---`Method Public Static`
---@param str System.String
---@return System.String
_G['System']['String'].Copy = function(str) end

---`Method Public Instance`
---@overload fun(sourceIndex:System.Int32, destination:(System.Char-arr)|(System.Char[]), destinationIndex:System.Int32, count:System.Int32)
---@param destination System.Span*1System*Char
_G['System']['String'].CopyTo = function(destination) end

---`Method Public Instance`
---@param destination System.Span*1System*Char
---@return System.Boolean
_G['System']['String'].TryCopyTo = function(destination) end

---`Method Public Instance`
---@overload fun():((System.Char-arr)|(System.Char[]))
---@param startIndex System.Int32
---@param length System.Int32
---@return (System.Char-arr)|(System.Char[])
_G['System']['String'].ToCharArray = function(startIndex, length) end

---`Method Public Static`
---@param value System.String
---@return System.Boolean
_G['System']['String'].IsNullOrEmpty = function(value) end

---`Method Public Static`
---@param value System.String
---@return System.Boolean
_G['System']['String'].IsNullOrWhiteSpace = function(value) end

---`Method Public Instance`
---@return System.Char-ref
_G['System']['String'].GetPinnableReference = function() end

---`Method NonPublic Instance`
---@return System.Char-ref
_G['System']['String'].GetRawStringData = function() end

---`Method NonPublic Instance`
---@return System.UInt16-ref
_G['System']['String'].GetRawStringDataAsUInt16 = function() end

---`Method NonPublic Static`
---@param bytes System.Byte-ptr
---@param byteLength System.Int32
---@param encoding System.Text.Encoding
---@return System.String
_G['System']['String'].CreateStringFromEncoding = function(bytes, byteLength, encoding) end

---`Method NonPublic Static`
---@overload fun(c:System.Char):(System.String)
---@param c1 System.Char
---@param c2 System.Char
---@return System.String
_G['System']['String'].CreateFromChar = function(c1, c2) end

---`Method Public Instance Virtual`
---@overload fun():(System.String)
---@param provider System.IFormatProvider
---@return System.String
_G['System']['String'].ToString = function(provider) end

---`Method Public Instance`
---@return System.CharEnumerator
_G['System']['String'].GetEnumerator = function() end

---`Method Public Instance`
---@return System.Text.StringRuneEnumerator
_G['System']['String'].EnumerateRunes = function() end

---`Method NonPublic Static`
---@param ptr System.Char-ptr
---@return System.Int32
_G['System']['String'].wcslen = function(ptr) end

---`Method NonPublic Static`
---@param ptr System.Byte-ptr
---@return System.Int32
_G['System']['String'].strlen = function(ptr) end

---`Method Public Instance Virtual`
---@return System.TypeCode
_G['System']['String'].GetTypeCode = function() end

---`Method Public Instance`
---@overload fun():(System.Boolean)
---@param normalizationForm System.Text.NormalizationForm
---@return System.Boolean
_G['System']['String'].IsNormalized = function(normalizationForm) end

---`Method Public Instance`
---@overload fun():(System.String)
---@param normalizationForm System.Text.NormalizationForm
---@return System.String
_G['System']['String'].Normalize = function(normalizationForm) end

---`Method Private Static`
---@param dest System.String
---@param destPos System.Int32
---@param src System.String
_G['System']['String'].CopyStringContent = function(dest, destPos, src) end

---`Method Public Static`
---@overload fun(arg0:System.Object):(System.String)
---@overload fun(arg0:System.Object, arg1:System.Object):(System.String)
---@overload fun(arg0:System.Object, arg1:System.Object, arg2:System.Object):(System.String)
---@overload fun(...:System.Object):(System.String)
---@overload fun(values:(System.Collections.Generic.IEnumerable*1System*String*T)|(fun():(System.String.T))):(System.String)
---@overload fun(values:(System.Collections.Generic.IEnumerable*1System*String)|(fun():(System.String))):(System.String)
---@overload fun(str0:System.String, str1:System.String):(System.String)
---@overload fun(str0:System.String, str1:System.String, str2:System.String):(System.String)
---@overload fun(str0:System.String, str1:System.String, str2:System.String, str3:System.String):(System.String)
---@overload fun(str0:System.ReadOnlySpan*1System*Char, str1:System.ReadOnlySpan*1System*Char):(System.String)
---@overload fun(str0:System.ReadOnlySpan*1System*Char, str1:System.ReadOnlySpan*1System*Char, str2:System.ReadOnlySpan*1System*Char):(System.String)
---@overload fun(str0:System.ReadOnlySpan*1System*Char, str1:System.ReadOnlySpan*1System*Char, str2:System.ReadOnlySpan*1System*Char, str3:System.ReadOnlySpan*1System*Char):(System.String)
---@param ... System.String
---@return System.String
_G['System']['String'].Concat = function(...) end

---`Method NonPublic Static`
---@param str0 System.ReadOnlySpan*1System*Char
---@param str1 System.ReadOnlySpan*1System*Char
---@param str2 System.ReadOnlySpan*1System*Char
---@param str3 System.ReadOnlySpan*1System*Char
---@param str4 System.ReadOnlySpan*1System*Char
---@return System.String
_G['System']['String'].Concat = function(str0, str1, str2, str3, str4) end

---`Method Public Static`
---@overload fun(format:System.String, arg0:System.Object):(System.String)
---@overload fun(format:System.String, arg0:System.Object, arg1:System.Object):(System.String)
---@overload fun(format:System.String, arg0:System.Object, arg1:System.Object, arg2:System.Object):(System.String)
---@overload fun(format:System.String, ...:System.Object):(System.String)
---@overload fun(provider:System.IFormatProvider, format:System.String, arg0:System.Object):(System.String)
---@overload fun(provider:System.IFormatProvider, format:System.String, arg0:System.Object, arg1:System.Object):(System.String)
---@overload fun(provider:System.IFormatProvider, format:System.String, arg0:System.Object, arg1:System.Object, arg2:System.Object):(System.String)
---@overload fun(provider:System.IFormatProvider, format:System.String, ...:System.Object):(System.String)
---@overload fun(provider:System.IFormatProvider, format:System.Text.CompositeFormat, arg0:System.String.TArg0):(System.String)
---@overload fun(provider:System.IFormatProvider, format:System.Text.CompositeFormat, arg0:System.String.TArg0, arg1:System.String.TArg1):(System.String)
---@overload fun(provider:System.IFormatProvider, format:System.Text.CompositeFormat, arg0:System.String.TArg0, arg1:System.String.TArg1, arg2:System.String.TArg2):(System.String)
---@overload fun(provider:System.IFormatProvider, format:System.Text.CompositeFormat, ...:System.Object):(System.String)
---@param provider System.IFormatProvider
---@param format System.Text.CompositeFormat
---@param args System.ReadOnlySpan*1System*Object
---@return System.String
_G['System']['String'].Format = function(provider, format, args) end

---`Method Private Static`
---@param provider System.IFormatProvider
---@param format System.Text.CompositeFormat
---@param arg0 System.String.TArg0
---@param arg1 System.String.TArg1
---@param arg2 System.String.TArg2
---@param args System.ReadOnlySpan*1System*Object
---@return System.String
_G['System']['String'].Format = function(provider, format, arg0, arg1, arg2, args) end

---`Method Private Static`
---@param provider System.IFormatProvider
---@param format System.String
---@param args System.ReadOnlySpan*1System*Object
---@return System.String
_G['System']['String'].FormatHelper = function(provider, format, args) end

---`Method Public Instance`
---@param startIndex System.Int32
---@param value System.String
---@return System.String
_G['System']['String'].Insert = function(startIndex, value) end

---`Method Public Static`
---@overload fun(separator:System.Char, ...:System.String):(System.String)
---@overload fun(separator:System.String, ...:System.String):(System.String)
---@overload fun(separator:System.Char, value:(System.String-arr)|(System.String[]), startIndex:System.Int32, count:System.Int32):(System.String)
---@overload fun(separator:System.String, value:(System.String-arr)|(System.String[]), startIndex:System.Int32, count:System.Int32):(System.String)
---@overload fun(separator:System.String, values:(System.Collections.Generic.IEnumerable*1System*String)|(fun():(System.String))):(System.String)
---@overload fun(separator:System.Char, ...:System.Object):(System.String)
---@overload fun(separator:System.String, ...:System.Object):(System.String)
---@overload fun(separator:System.Char, values:(System.Collections.Generic.IEnumerable*1System*String*T)|(fun():(System.String.T))):(System.String)
---@param separator System.String
---@param values (System.Collections.Generic.IEnumerable*1System*String*T)|(fun():(System.String.T))
---@return System.String
_G['System']['String'].Join = function(separator, values) end

---`Method Private Static`
---@overload fun(separator:System.ReadOnlySpan*1System*Char, value:(System.String-arr)|(System.String[]), startIndex:System.Int32, count:System.Int32):(System.String)
---@overload fun(separator:System.ReadOnlySpan*1System*Char, values:(System.Object-arr)|(System.Object[])):(System.String)
---@overload fun(separator:System.ReadOnlySpan*1System*Char, values:(System.Collections.Generic.IEnumerable*1System*String*T)|(fun():(System.String.T))):(System.String)
---@param separator System.ReadOnlySpan*1System*Char
---@param values System.ReadOnlySpan*1System*String
---@return System.String
_G['System']['String'].JoinCore = function(separator, values) end

---`Method Public Instance`
---@overload fun(totalWidth:System.Int32):(System.String)
---@param totalWidth System.Int32
---@param paddingChar System.Char
---@return System.String
_G['System']['String'].PadLeft = function(totalWidth, paddingChar) end

---`Method Public Instance`
---@overload fun(totalWidth:System.Int32):(System.String)
---@param totalWidth System.Int32
---@param paddingChar System.Char
---@return System.String
_G['System']['String'].PadRight = function(totalWidth, paddingChar) end

---`Method Public Instance`
---@overload fun(startIndex:System.Int32, count:System.Int32):(System.String)
---@param startIndex System.Int32
---@return System.String
_G['System']['String'].Remove = function(startIndex) end

---`Method Public Instance`
---@overload fun(oldValue:System.String, newValue:System.String, ignoreCase:System.Boolean, culture:System.Globalization.CultureInfo):(System.String)
---@overload fun(oldValue:System.String, newValue:System.String, comparisonType:System.StringComparison):(System.String)
---@overload fun(oldChar:System.Char, newChar:System.Char):(System.String)
---@param oldValue System.String
---@param newValue System.String
---@return System.String
_G['System']['String'].Replace = function(oldValue, newValue) end

---`Method Private Instance`
---@param oldValue System.String
---@param newValue System.String
---@param ci System.Globalization.CompareInfo
---@param options System.Globalization.CompareOptions
---@return System.String
_G['System']['String'].ReplaceCore = function(oldValue, newValue, ci, options) end

---`Method Private Static`
---@param searchSpace System.ReadOnlySpan*1System*Char
---@param oldValue System.ReadOnlySpan*1System*Char
---@param newValue System.ReadOnlySpan*1System*Char
---@param compareInfo System.Globalization.CompareInfo
---@param options System.Globalization.CompareOptions
---@return System.String
_G['System']['String'].ReplaceCore = function(searchSpace, oldValue, newValue, compareInfo, options) end

---`Method Private Instance`
---@param oldValueLength System.Int32
---@param newValue System.String
---@param indices System.ReadOnlySpan*1System*Int32
---@return System.String
_G['System']['String'].ReplaceHelper = function(oldValueLength, newValue, indices) end

---`Method Public Instance`
---@overload fun():(System.String)
---@param replacementText System.String
---@return System.String
_G['System']['String'].ReplaceLineEndings = function(replacementText) end

---`Method Private Instance`
---@param replacementText System.String
---@return System.String
_G['System']['String'].ReplaceLineEndingsCore = function(replacementText) end

---`Method Private Static`
---@param text System.ReadOnlySpan*1System*Char
---@param replacementText System.String
---@param stride System.Int32-ref
---@return System.Int32
_G['System']['String'].IndexOfNewlineChar = function(text, replacementText, stride) end

---`Method Private Instance`
---@return System.String
_G['System']['String'].ReplaceLineEndingsWithLineFeed = function() end

---`Method Public Instance`
---@overload fun(separator:System.Char, options?:System.StringSplitOptions):((System.String-arr)|(System.String[]))
---@overload fun(separator:System.Char, count:System.Int32, options?:System.StringSplitOptions):((System.String-arr)|(System.String[]))
---@overload fun(...:System.Char):((System.String-arr)|(System.String[]))
---@overload fun(separator:(System.Char-arr)|(System.Char[]), count:System.Int32):((System.String-arr)|(System.String[]))
---@overload fun(separator:(System.Char-arr)|(System.Char[]), options:System.StringSplitOptions):((System.String-arr)|(System.String[]))
---@overload fun(separator:(System.Char-arr)|(System.Char[]), count:System.Int32, options:System.StringSplitOptions):((System.String-arr)|(System.String[]))
---@overload fun(separator:System.String, options?:System.StringSplitOptions):((System.String-arr)|(System.String[]))
---@overload fun(separator:System.String, count:System.Int32, options?:System.StringSplitOptions):((System.String-arr)|(System.String[]))
---@overload fun(separator:(System.String-arr)|(System.String[]), options:System.StringSplitOptions):((System.String-arr)|(System.String[]))
---@param separator (System.String-arr)|(System.String[])
---@param count System.Int32
---@param options System.StringSplitOptions
---@return (System.String-arr)|(System.String[])
_G['System']['String'].Split = function(separator, count, options) end

---`Method Private Instance`
---@overload fun(separators:System.ReadOnlySpan*1System*Char, count:System.Int32, options:System.StringSplitOptions):((System.String-arr)|(System.String[]))
---@overload fun(separator:System.String, separators:(System.String-arr)|(System.String[]), count:System.Int32, options:System.StringSplitOptions):((System.String-arr)|(System.String[]))
---@param separator System.String
---@param count System.Int32
---@param options System.StringSplitOptions
---@return (System.String-arr)|(System.String[])
_G['System']['String'].SplitInternal = function(separator, count, options) end

---`Method Private Instance`
---@param options System.StringSplitOptions
---@param count System.Int32
---@return (System.String-arr)|(System.String[])
_G['System']['String'].CreateSplitArrayOfThisAsSoleValue = function(options, count) end

---`Method Private Instance`
---@param sepList System.ReadOnlySpan*1System*Int32
---@param lengthList System.ReadOnlySpan*1System*Int32
---@param defaultLength System.Int32
---@param count System.Int32
---@return (System.String-arr)|(System.String[])
_G['System']['String'].SplitWithoutPostProcessing = function(sepList, lengthList, defaultLength, count) end

---`Method Private Instance`
---@param sepList System.ReadOnlySpan*1System*Int32
---@param lengthList System.ReadOnlySpan*1System*Int32
---@param defaultLength System.Int32
---@param count System.Int32
---@param options System.StringSplitOptions
---@return (System.String-arr)|(System.String[])
_G['System']['String'].SplitWithPostProcessing = function(sepList, lengthList, defaultLength, count, options) end

---`Method NonPublic Static`
---@overload fun(source:System.ReadOnlySpan*1System*Char, separators:System.ReadOnlySpan*1System*Char, sepListBuilder:System.Collections.Generic.ValueListBuilder)
---@param source System.ReadOnlySpan*1System*Char
---@param separators System.ReadOnlySpan*1System*String
---@param sepListBuilder System.Collections.Generic.ValueListBuilder
---@param lengthListBuilder System.Collections.Generic.ValueListBuilder
_G['System']['String'].MakeSeparatorListAny = function(source, separators, sepListBuilder, lengthListBuilder) end

---`Method Private Static`
---@param sourceSpan System.ReadOnlySpan*1System*Char
---@param sepListBuilder System.Collections.Generic.ValueListBuilder
---@param c System.Char
---@param c2 System.Char
---@param c3 System.Char
_G['System']['String'].MakeSeparatorListVectorized = function(sourceSpan, sepListBuilder, c, c2, c3) end

---`Method NonPublic Static`
---@param source System.ReadOnlySpan*1System*Char
---@param separator System.ReadOnlySpan*1System*Char
---@param sepListBuilder System.Collections.Generic.ValueListBuilder
_G['System']['String'].MakeSeparatorList = function(source, separator, sepListBuilder) end

---`Method NonPublic Static`
---@param options System.StringSplitOptions
_G['System']['String'].CheckStringSplitOptions = function(options) end

---`Method Public Instance`
---@overload fun(startIndex:System.Int32):(System.String)
---@param startIndex System.Int32
---@param length System.Int32
---@return System.String
_G['System']['String'].Substring = function(startIndex, length) end

---`Method Private Instance`
---@param startIndex System.Int32
---@param length System.Int32
_G['System']['String'].ThrowSubstringArgumentOutOfRange = function(startIndex, length) end

---`Method Private Instance`
---@param startIndex System.Int32
---@param length System.Int32
---@return System.String
_G['System']['String'].InternalSubString = function(startIndex, length) end

---`Method Public Instance`
---@overload fun():(System.String)
---@param culture System.Globalization.CultureInfo
---@return System.String
_G['System']['String'].ToLower = function(culture) end

---`Method Public Instance`
---@return System.String
_G['System']['String'].ToLowerInvariant = function() end

---`Method Public Instance`
---@overload fun():(System.String)
---@param culture System.Globalization.CultureInfo
---@return System.String
_G['System']['String'].ToUpper = function(culture) end

---`Method Public Instance`
---@return System.String
_G['System']['String'].ToUpperInvariant = function() end

---`Method Public Instance`
---@overload fun():(System.String)
---@overload fun(trimChar:System.Char):(System.String)
---@param ... System.Char
---@return System.String
_G['System']['String'].Trim = function(...) end

---`Method Public Instance`
---@overload fun():(System.String)
---@overload fun(trimChar:System.Char):(System.String)
---@param ... System.Char
---@return System.String
_G['System']['String'].TrimStart = function(...) end

---`Method Public Instance`
---@overload fun():(System.String)
---@overload fun(trimChar:System.Char):(System.String)
---@param ... System.Char
---@return System.String
_G['System']['String'].TrimEnd = function(...) end

---`Method Private Instance`
---@param trimType System.Text.TrimType
---@return System.String
_G['System']['String'].TrimWhiteSpaceHelper = function(trimType) end

---`Method Private Instance`
---@param trimChars System.Char-ptr
---@param trimCharsLength System.Int32
---@param trimType System.Text.TrimType
---@return System.String
_G['System']['String'].TrimHelper = function(trimChars, trimCharsLength, trimType) end

---`Method Private Instance`
---@param start System.Int32
---@param luaKey__end System.Int32
---@return System.String
_G['System']['String'].CreateTrimmedString = function(start, luaKey__end) end

---`Method Public Instance`
---@overload fun(value:System.String):(System.Boolean)
---@overload fun(value:System.String, comparisonType:System.StringComparison):(System.Boolean)
---@overload fun(value:System.Char):(System.Boolean)
---@param value System.Char
---@param comparisonType System.StringComparison
---@return System.Boolean
_G['System']['String'].Contains = function(value, comparisonType) end

---`Method Public Instance`
---@overload fun(value:System.Char):(System.Int32)
---@overload fun(value:System.Char, startIndex:System.Int32):(System.Int32)
---@overload fun(value:System.Char, comparisonType:System.StringComparison):(System.Int32)
---@overload fun(value:System.Char, startIndex:System.Int32, count:System.Int32):(System.Int32)
---@overload fun(value:System.String):(System.Int32)
---@overload fun(value:System.String, startIndex:System.Int32):(System.Int32)
---@overload fun(value:System.String, startIndex:System.Int32, count:System.Int32):(System.Int32)
---@overload fun(value:System.String, comparisonType:System.StringComparison):(System.Int32)
---@overload fun(value:System.String, startIndex:System.Int32, comparisonType:System.StringComparison):(System.Int32)
---@param value System.String
---@param startIndex System.Int32
---@param count System.Int32
---@param comparisonType System.StringComparison
---@return System.Int32
_G['System']['String'].IndexOf = function(value, startIndex, count, comparisonType) end

---`Method Private Instance`
---@param value System.Char
---@return System.Int32
_G['System']['String'].IndexOfCharOrdinalIgnoreCase = function(value) end

---`Method Public Instance`
---@overload fun(anyOf:(System.Char-arr)|(System.Char[])):(System.Int32)
---@overload fun(anyOf:(System.Char-arr)|(System.Char[]), startIndex:System.Int32):(System.Int32)
---@param anyOf (System.Char-arr)|(System.Char[])
---@param startIndex System.Int32
---@param count System.Int32
---@return System.Int32
_G['System']['String'].IndexOfAny = function(anyOf, startIndex, count) end

---`Method Public Instance`
---@overload fun(value:System.Char):(System.Int32)
---@overload fun(value:System.Char, startIndex:System.Int32):(System.Int32)
---@overload fun(value:System.Char, startIndex:System.Int32, count:System.Int32):(System.Int32)
---@overload fun(value:System.String):(System.Int32)
---@overload fun(value:System.String, startIndex:System.Int32):(System.Int32)
---@overload fun(value:System.String, startIndex:System.Int32, count:System.Int32):(System.Int32)
---@overload fun(value:System.String, comparisonType:System.StringComparison):(System.Int32)
---@overload fun(value:System.String, startIndex:System.Int32, comparisonType:System.StringComparison):(System.Int32)
---@param value System.String
---@param startIndex System.Int32
---@param count System.Int32
---@param comparisonType System.StringComparison
---@return System.Int32
_G['System']['String'].LastIndexOf = function(value, startIndex, count, comparisonType) end

---`Method Public Instance`
---@overload fun(anyOf:(System.Char-arr)|(System.Char[])):(System.Int32)
---@overload fun(anyOf:(System.Char-arr)|(System.Char[]), startIndex:System.Int32):(System.Int32)
---@param anyOf (System.Char-arr)|(System.Char[])
---@param startIndex System.Int32
---@param count System.Int32
---@return System.Int32
_G['System']['String'].LastIndexOfAny = function(anyOf, startIndex, count) end

---`Constructor Public Instance`
---@overload fun(value:(System.Char-arr)|(System.Char[])):System.String
---@overload fun(value:(System.Char-arr)|(System.Char[]), startIndex:System.Int32, length:System.Int32):System.String
---@overload fun(value:System.Char-ptr):System.String
---@overload fun(value:System.Char-ptr, startIndex:System.Int32, length:System.Int32):System.String
---@overload fun(value:System.SByte-ptr):System.String
---@overload fun(value:System.SByte-ptr, startIndex:System.Int32, length:System.Int32):System.String
---@overload fun(value:System.SByte-ptr, startIndex:System.Int32, length:System.Int32, enc:System.Text.Encoding):System.String
---@overload fun(c:System.Char, count:System.Int32):System.String
---@param value System.ReadOnlySpan*1System*Char
---@return System.String
_G['System']['String'] = function(value) end

---`Constructor Public Instance`
---@overload fun(value:(System.Char-arr)|(System.Char[])):System.String
---@overload fun(value:(System.Char-arr)|(System.Char[]), startIndex:System.Int32, length:System.Int32):System.String
---@overload fun(value:System.Char-ptr):System.String
---@overload fun(value:System.Char-ptr, startIndex:System.Int32, length:System.Int32):System.String
---@overload fun(value:System.SByte-ptr):System.String
---@overload fun(value:System.SByte-ptr, startIndex:System.Int32, length:System.Int32):System.String
---@overload fun(value:System.SByte-ptr, startIndex:System.Int32, length:System.Int32, enc:System.Text.Encoding):System.String
---@overload fun(c:System.Char, count:System.Int32):System.String
---@param value System.ReadOnlySpan*1System*Char
---@return System.String
_G['System']['String'].__new = function(value) end

