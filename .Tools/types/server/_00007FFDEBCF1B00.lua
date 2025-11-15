---@meta
---@class System.TimeSpan : System.ValueType
---@operator unm:System.TimeSpan
---@operator sub(System.TimeSpan):System.TimeSpan
---@operator add(System.TimeSpan):System.TimeSpan
---@operator mul(System.Double):System.TimeSpan
---@operator div(System.Double):System.TimeSpan
---@operator div(System.TimeSpan):System.Double
---`Field NonPublic Instance`
---@field _ticks System.Int64
---`Field Public Static`
---@field Zero System.TimeSpan
---`Field Public Static`
---@field MaxValue System.TimeSpan
---`Field Public Static`
---@field MinValue System.TimeSpan
---`Field Public Static`
---@field NanosecondsPerTick System.Int64
---`Field Public Static`
---@field TicksPerMicrosecond System.Int64
---`Field Public Static`
---@field TicksPerMillisecond System.Int64
---`Field Public Static`
---@field TicksPerSecond System.Int64
---`Field Public Static`
---@field TicksPerMinute System.Int64
---`Field Public Static`
---@field TicksPerHour System.Int64
---`Field Public Static`
---@field TicksPerDay System.Int64
---`Getter Public Instance`
---@field Ticks System.Int64
---`Getter Public Instance`
---@field Days System.Int32
---`Getter Public Instance`
---@field Hours System.Int32
---`Getter Public Instance`
---@field Milliseconds System.Int32
---`Getter Public Instance`
---@field Microseconds System.Int32
---`Getter Public Instance`
---@field Nanoseconds System.Int32
---`Getter Public Instance`
---@field Minutes System.Int32
---`Getter Public Instance`
---@field Seconds System.Int32
---`Getter Public Instance`
---@field TotalDays System.Double
---`Getter Public Instance`
---@field TotalHours System.Double
---`Getter Public Instance`
---@field TotalMilliseconds System.Double
---`Getter Public Instance`
---@field TotalMicroseconds System.Double
---`Getter Public Instance`
---@field TotalNanoseconds System.Double
---`Getter Public Instance`
---@field TotalMinutes System.Double
---`Getter Public Instance`
---@field TotalSeconds System.Double
_G['TimeSpan'] = {}

---`Method Public Instance`
---@param ts System.TimeSpan
---@return System.TimeSpan
_G['TimeSpan'].Add = function(ts) end

---`Method Public Static`
---@param t1 System.TimeSpan
---@param t2 System.TimeSpan
---@return System.Int32
_G['TimeSpan'].Compare = function(t1, t2) end

---`Method Public Instance Virtual`
---@overload fun(value:System.Object):(System.Int32)
---@param value System.TimeSpan
---@return System.Int32
_G['TimeSpan'].CompareTo = function(value) end

---`Method Public Static`
---@param value System.Double
---@return System.TimeSpan
_G['TimeSpan'].FromDays = function(value) end

---`Method Public Instance`
---@return System.TimeSpan
_G['TimeSpan'].Duration = function() end

---`Method Public Instance Virtual`
---@overload fun(value:System.Object):(System.Boolean)
---@param obj System.TimeSpan
---@return System.Boolean
_G['TimeSpan'].Equals = function(obj) end

---`Method Public Static`
---@param t1 System.TimeSpan
---@param t2 System.TimeSpan
---@return System.Boolean
_G['TimeSpan'].Equals = function(t1, t2) end

---`Method Public Instance Virtual`
---@return System.Int32
_G['TimeSpan'].GetHashCode = function() end

---`Method Public Static`
---@param value System.Double
---@return System.TimeSpan
_G['TimeSpan'].FromHours = function(value) end

---`Method Private Static`
---@param value System.Double
---@param scale System.Double
---@return System.TimeSpan
_G['TimeSpan'].Interval = function(value, scale) end

---`Method Private Static`
---@param ticks System.Double
---@return System.TimeSpan
_G['TimeSpan'].IntervalFromDoubleTicks = function(ticks) end

---`Method Public Static`
---@param value System.Double
---@return System.TimeSpan
_G['TimeSpan'].FromMilliseconds = function(value) end

---`Method Public Static`
---@param value System.Double
---@return System.TimeSpan
_G['TimeSpan'].FromMicroseconds = function(value) end

---`Method Public Static`
---@param value System.Double
---@return System.TimeSpan
_G['TimeSpan'].FromMinutes = function(value) end

---`Method Public Instance`
---@return System.TimeSpan
_G['TimeSpan'].Negate = function() end

---`Method Public Static`
---@param value System.Double
---@return System.TimeSpan
_G['TimeSpan'].FromSeconds = function(value) end

---`Method Public Instance`
---@param ts System.TimeSpan
---@return System.TimeSpan
_G['TimeSpan'].Subtract = function(ts) end

---`Method Public Instance`
---@param factor System.Double
---@return System.TimeSpan
_G['TimeSpan'].Multiply = function(factor) end

---`Method Public Instance`
---@overload fun(divisor:System.Double):(System.TimeSpan)
---@param ts System.TimeSpan
---@return System.Double
_G['TimeSpan'].Divide = function(ts) end

---`Method Public Static`
---@param value System.Int64
---@return System.TimeSpan
_G['TimeSpan'].FromTicks = function(value) end

---`Method NonPublic Static`
---@param hour System.Int32
---@param minute System.Int32
---@param second System.Int32
---@return System.Int64
_G['TimeSpan'].TimeToTicks = function(hour, minute, second) end

---`Method Private Static`
---@param style System.Globalization.TimeSpanStyles
---@param parameterName System.String
_G['TimeSpan'].ValidateStyles = function(style, parameterName) end

---`Method Public Static`
---@overload fun(s:System.String):(System.TimeSpan)
---@overload fun(input:System.String, formatProvider:System.IFormatProvider):(System.TimeSpan)
---@param input System.ReadOnlySpan*1System*Char
---@param formatProvider? System.IFormatProvider
---@return System.TimeSpan
_G['TimeSpan'].Parse = function(input, formatProvider) end

---`Method Public Static`
---@overload fun(input:System.String, format:System.String, formatProvider:System.IFormatProvider):(System.TimeSpan)
---@overload fun(input:System.String, formats:(System.String-arr)|(System.String[]), formatProvider:System.IFormatProvider):(System.TimeSpan)
---@overload fun(input:System.String, format:System.String, formatProvider:System.IFormatProvider, styles:System.Globalization.TimeSpanStyles):(System.TimeSpan)
---@overload fun(input:System.ReadOnlySpan*1System*Char, format:System.ReadOnlySpan*1System*Char, formatProvider:System.IFormatProvider, styles?:System.Globalization.TimeSpanStyles):(System.TimeSpan)
---@overload fun(input:System.String, formats:(System.String-arr)|(System.String[]), formatProvider:System.IFormatProvider, styles:System.Globalization.TimeSpanStyles):(System.TimeSpan)
---@param input System.ReadOnlySpan*1System*Char
---@param formats (System.String-arr)|(System.String[])
---@param formatProvider System.IFormatProvider
---@param styles? System.Globalization.TimeSpanStyles
---@return System.TimeSpan
_G['TimeSpan'].ParseExact = function(input, formats, formatProvider, styles) end

---`Method Public Static`
---@overload fun(s:System.String, result:System.TimeSpan-ref):(System.Boolean)
---@overload fun(s:System.ReadOnlySpan*1System*Char, result:System.TimeSpan-ref):(System.Boolean)
---@overload fun(input:System.String, formatProvider:System.IFormatProvider, result:System.TimeSpan-ref):(System.Boolean)
---@param input System.ReadOnlySpan*1System*Char
---@param formatProvider System.IFormatProvider
---@param result System.TimeSpan-ref
---@return System.Boolean
_G['TimeSpan'].TryParse = function(input, formatProvider, result) end

---`Method Public Static`
---@overload fun(input:System.String, format:System.String, formatProvider:System.IFormatProvider, result:System.TimeSpan-ref):(System.Boolean)
---@overload fun(input:System.ReadOnlySpan*1System*Char, format:System.ReadOnlySpan*1System*Char, formatProvider:System.IFormatProvider, result:System.TimeSpan-ref):(System.Boolean)
---@overload fun(input:System.String, formats:(System.String-arr)|(System.String[]), formatProvider:System.IFormatProvider, result:System.TimeSpan-ref):(System.Boolean)
---@overload fun(input:System.ReadOnlySpan*1System*Char, formats:(System.String-arr)|(System.String[]), formatProvider:System.IFormatProvider, result:System.TimeSpan-ref):(System.Boolean)
---@overload fun(input:System.String, format:System.String, formatProvider:System.IFormatProvider, styles:System.Globalization.TimeSpanStyles, result:System.TimeSpan-ref):(System.Boolean)
---@overload fun(input:System.ReadOnlySpan*1System*Char, format:System.ReadOnlySpan*1System*Char, formatProvider:System.IFormatProvider, styles:System.Globalization.TimeSpanStyles, result:System.TimeSpan-ref):(System.Boolean)
---@overload fun(input:System.String, formats:(System.String-arr)|(System.String[]), formatProvider:System.IFormatProvider, styles:System.Globalization.TimeSpanStyles, result:System.TimeSpan-ref):(System.Boolean)
---@param input System.ReadOnlySpan*1System*Char
---@param formats (System.String-arr)|(System.String[])
---@param formatProvider System.IFormatProvider
---@param styles System.Globalization.TimeSpanStyles
---@param result System.TimeSpan-ref
---@return System.Boolean
_G['TimeSpan'].TryParseExact = function(input, formats, formatProvider, styles, result) end

---`Method Public Instance Virtual`
---@overload fun():(System.String)
---@param format System.String
---@param formatProvider System.IFormatProvider
---@return System.String
_G['TimeSpan'].ToString = function(format, formatProvider) end

---`Method Public Instance`
---@param format System.String
---@return System.String
_G['TimeSpan'].ToString = function(format) end

---`Method Public Instance Virtual`
---@overload fun(destination:System.Span*1System*Char, charsWritten:System.Int32-ref, format?:System.ReadOnlySpan*1System*Char, formatProvider?:System.IFormatProvider):(System.Boolean)
---@param utf8Destination System.Span*1System*Byte
---@param bytesWritten System.Int32-ref
---@param format? System.ReadOnlySpan*1System*Char
---@param formatProvider? System.IFormatProvider
---@return System.Boolean
_G['TimeSpan'].TryFormat = function(utf8Destination, bytesWritten, format, formatProvider) end

---`Constructor Public Instance`
---@overload fun(ticks:System.Int64):System.TimeSpan
---@overload fun(hours:System.Int32, minutes:System.Int32, seconds:System.Int32):System.TimeSpan
---@overload fun(days:System.Int32, hours:System.Int32, minutes:System.Int32, seconds:System.Int32):System.TimeSpan
---@overload fun(days:System.Int32, hours:System.Int32, minutes:System.Int32, seconds:System.Int32, milliseconds:System.Int32):System.TimeSpan
---@overload fun(days:System.Int32, hours:System.Int32, minutes:System.Int32, seconds:System.Int32, milliseconds:System.Int32, microseconds:System.Int32):System.TimeSpan
---@return System.TimeSpan
_G['TimeSpan'] = function() end

---`Constructor Public Instance`
---@overload fun(ticks:System.Int64):System.TimeSpan
---@overload fun(hours:System.Int32, minutes:System.Int32, seconds:System.Int32):System.TimeSpan
---@overload fun(days:System.Int32, hours:System.Int32, minutes:System.Int32, seconds:System.Int32):System.TimeSpan
---@overload fun(days:System.Int32, hours:System.Int32, minutes:System.Int32, seconds:System.Int32, milliseconds:System.Int32):System.TimeSpan
---@overload fun(days:System.Int32, hours:System.Int32, minutes:System.Int32, seconds:System.Int32, milliseconds:System.Int32, microseconds:System.Int32):System.TimeSpan
---@return System.TimeSpan
_G['TimeSpan'].__new = function() end

---`Constructor Private Static`
---@overload fun(ticks:System.Int64):System.TimeSpan
---@overload fun(hours:System.Int32, minutes:System.Int32, seconds:System.Int32):System.TimeSpan
---@overload fun(days:System.Int32, hours:System.Int32, minutes:System.Int32, seconds:System.Int32):System.TimeSpan
---@overload fun(days:System.Int32, hours:System.Int32, minutes:System.Int32, seconds:System.Int32, milliseconds:System.Int32):System.TimeSpan
---@overload fun(days:System.Int32, hours:System.Int32, minutes:System.Int32, seconds:System.Int32, milliseconds:System.Int32, microseconds:System.Int32):System.TimeSpan
---@return System.TimeSpan
_G['TimeSpan'] = function() end

---`Constructor Private Static`
---@overload fun(ticks:System.Int64):System.TimeSpan
---@overload fun(hours:System.Int32, minutes:System.Int32, seconds:System.Int32):System.TimeSpan
---@overload fun(days:System.Int32, hours:System.Int32, minutes:System.Int32, seconds:System.Int32):System.TimeSpan
---@overload fun(days:System.Int32, hours:System.Int32, minutes:System.Int32, seconds:System.Int32, milliseconds:System.Int32):System.TimeSpan
---@overload fun(days:System.Int32, hours:System.Int32, minutes:System.Int32, seconds:System.Int32, milliseconds:System.Int32, microseconds:System.Int32):System.TimeSpan
---@return System.TimeSpan
_G['TimeSpan'].__new = function() end

