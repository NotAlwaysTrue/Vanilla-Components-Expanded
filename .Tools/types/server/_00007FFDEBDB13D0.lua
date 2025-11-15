---@meta
---@class System.Math : System.Object
---`Field Public Static`
---@field E System.Double
---`Field Public Static`
---@field PI System.Double
---`Field Public Static`
---@field Tau System.Double
---`Getter Private Static`
---@field RoundPower10Double System.ReadOnlySpan*1System*Double
_G['System']['Math'] = {}

---`Method Public Static`
---@param d System.Double
---@return System.Double
_G['System']['Math'].Acos = function(d) end

---`Method Public Static`
---@param d System.Double
---@return System.Double
_G['System']['Math'].Acosh = function(d) end

---`Method Public Static`
---@param d System.Double
---@return System.Double
_G['System']['Math'].Asin = function(d) end

---`Method Public Static`
---@param d System.Double
---@return System.Double
_G['System']['Math'].Asinh = function(d) end

---`Method Public Static`
---@param d System.Double
---@return System.Double
_G['System']['Math'].Atan = function(d) end

---`Method Public Static`
---@param d System.Double
---@return System.Double
_G['System']['Math'].Atanh = function(d) end

---`Method Public Static`
---@param y System.Double
---@param x System.Double
---@return System.Double
_G['System']['Math'].Atan2 = function(y, x) end

---`Method Public Static`
---@param d System.Double
---@return System.Double
_G['System']['Math'].Cbrt = function(d) end

---`Method Public Static`
---@overload fun(a:System.Double):(System.Double)
---@param d System.Decimal
---@return System.Decimal
_G['System']['Math'].Ceiling = function(d) end

---`Method Public Static`
---@param d System.Double
---@return System.Double
_G['System']['Math'].Cos = function(d) end

---`Method Public Static`
---@param value System.Double
---@return System.Double
_G['System']['Math'].Cosh = function(value) end

---`Method Public Static`
---@param d System.Double
---@return System.Double
_G['System']['Math'].Exp = function(d) end

---`Method Public Static`
---@overload fun(d:System.Double):(System.Double)
---@param d System.Decimal
---@return System.Decimal
_G['System']['Math'].Floor = function(d) end

---`Method Public Static`
---@param x System.Double
---@param y System.Double
---@param z System.Double
---@return System.Double
_G['System']['Math'].FusedMultiplyAdd = function(x, y, z) end

---`Method Public Static`
---@overload fun(d:System.Double):(System.Double)
---@param a System.Double
---@param newBase System.Double
---@return System.Double
_G['System']['Math'].Log = function(a, newBase) end

---`Method Public Static`
---@param x System.Double
---@return System.Double
_G['System']['Math'].Log2 = function(x) end

---`Method Public Static`
---@param d System.Double
---@return System.Double
_G['System']['Math'].Log10 = function(d) end

---`Method Public Static`
---@param x System.Double
---@param y System.Double
---@return System.Double
_G['System']['Math'].Pow = function(x, y) end

---`Method Public Static`
---@param a System.Double
---@return System.Double
_G['System']['Math'].Sin = function(a) end

---`Method Public Static`
---@param x System.Double
---@return System.ValueTuple*1System*Double*1System*Double
_G['System']['Math'].SinCos = function(x) end

---`Method Private Static`
---@param x System.Double
---@param sin System.Double-ptr
---@param cos System.Double-ptr
_G['System']['Math'].SinCos = function(x, sin, cos) end

---`Method Public Static`
---@param value System.Double
---@return System.Double
_G['System']['Math'].Sinh = function(value) end

---`Method Public Static`
---@param d System.Double
---@return System.Double
_G['System']['Math'].Sqrt = function(d) end

---`Method Public Static`
---@param a System.Double
---@return System.Double
_G['System']['Math'].Tan = function(a) end

---`Method Public Static`
---@param value System.Double
---@return System.Double
_G['System']['Math'].Tanh = function(value) end

---`Method Private Static`
---@param x System.Double
---@param intptr System.Double-ptr
---@return System.Double
_G['System']['Math'].ModF = function(x, intptr) end

---`Method Public Static`
---@overload fun(value:System.Int16):(System.Int16)
---@overload fun(value:System.Int32):(System.Int32)
---@overload fun(value:System.Int64):(System.Int64)
---@overload fun(value:System.IntPtr):(System.IntPtr)
---@overload fun(value:System.SByte):(System.SByte)
---@overload fun(value:System.Decimal):(System.Decimal)
---@overload fun(value:System.Double):(System.Double)
---@param value System.Single
---@return System.Single
_G['System']['Math'].Abs = function(value) end

---`Method NonPublic Static`
_G['System']['Math'].ThrowNegateTwosCompOverflow = function() end

---`Method Public Static`
---@overload fun(a:System.Int32, b:System.Int32):(System.Int64)
---@overload fun(a:System.UInt64, b:System.UInt64, low:System.UInt64-ref):(System.UInt64)
---@param a System.Int64
---@param b System.Int64
---@param low System.Int64-ref
---@return System.Int64
_G['System']['Math'].BigMul = function(a, b, low) end

---`Method Public Static`
---@param x System.Double
---@return System.Double
_G['System']['Math'].BitDecrement = function(x) end

---`Method Public Static`
---@param x System.Double
---@return System.Double
_G['System']['Math'].BitIncrement = function(x) end

---`Method Public Static`
---@param x System.Double
---@param y System.Double
---@return System.Double
_G['System']['Math'].CopySign = function(x, y) end

---`Method Public Static`
---@overload fun(a:System.Int32, b:System.Int32, result:System.Int32-ref):(System.Int32)
---@overload fun(a:System.Int64, b:System.Int64, result:System.Int64-ref):(System.Int64)
---@overload fun(left:System.SByte, right:System.SByte):(System.ValueTuple*1System*SByte*1System*SByte)
---@overload fun(left:System.Byte, right:System.Byte):(System.ValueTuple*1System*Byte*1System*Byte)
---@overload fun(left:System.Int16, right:System.Int16):(System.ValueTuple*1System*Int16*1System*Int16)
---@overload fun(left:System.UInt16, right:System.UInt16):(System.ValueTuple*1System*UInt16*1System*UInt16)
---@overload fun(left:System.Int32, right:System.Int32):(System.ValueTuple*1System*Int32*1System*Int32)
---@overload fun(left:System.UInt32, right:System.UInt32):(System.ValueTuple*1System*UInt32*1System*UInt32)
---@overload fun(left:System.Int64, right:System.Int64):(System.ValueTuple*1System*Int64*1System*Int64)
---@overload fun(left:System.UInt64, right:System.UInt64):(System.ValueTuple*1System*UInt64*1System*UInt64)
---@overload fun(left:System.IntPtr, right:System.IntPtr):(System.ValueTuple*1System*IntPtr*1System*IntPtr)
---@param left System.UIntPtr
---@param right System.UIntPtr
---@return System.ValueTuple*1System*UIntPtr*1System*UIntPtr
_G['System']['Math'].DivRem = function(left, right) end

---`Method Public Static`
---@overload fun(value:System.Byte, min:System.Byte, max:System.Byte):(System.Byte)
---@overload fun(value:System.Decimal, min:System.Decimal, max:System.Decimal):(System.Decimal)
---@overload fun(value:System.Double, min:System.Double, max:System.Double):(System.Double)
---@overload fun(value:System.Int16, min:System.Int16, max:System.Int16):(System.Int16)
---@overload fun(value:System.Int32, min:System.Int32, max:System.Int32):(System.Int32)
---@overload fun(value:System.Int64, min:System.Int64, max:System.Int64):(System.Int64)
---@overload fun(value:System.IntPtr, min:System.IntPtr, max:System.IntPtr):(System.IntPtr)
---@overload fun(value:System.SByte, min:System.SByte, max:System.SByte):(System.SByte)
---@overload fun(value:System.Single, min:System.Single, max:System.Single):(System.Single)
---@overload fun(value:System.UInt16, min:System.UInt16, max:System.UInt16):(System.UInt16)
---@overload fun(value:System.UInt32, min:System.UInt32, max:System.UInt32):(System.UInt32)
---@overload fun(value:System.UInt64, min:System.UInt64, max:System.UInt64):(System.UInt64)
---@param value System.UIntPtr
---@param min System.UIntPtr
---@param max System.UIntPtr
---@return System.UIntPtr
_G['System']['Math'].Clamp = function(value, min, max) end

---`Method Public Static`
---@param x System.Double
---@param y System.Double
---@return System.Double
_G['System']['Math'].IEEERemainder = function(x, y) end

---`Method Public Static`
---@param x System.Double
---@return System.Int32
_G['System']['Math'].ILogB = function(x) end

---`Method Public Static`
---@overload fun(val1:System.Byte, val2:System.Byte):(System.Byte)
---@overload fun(val1:System.Decimal, val2:System.Decimal):(System.Decimal)
---@overload fun(val1:System.Double, val2:System.Double):(System.Double)
---@overload fun(val1:System.Int16, val2:System.Int16):(System.Int16)
---@overload fun(val1:System.Int32, val2:System.Int32):(System.Int32)
---@overload fun(val1:System.Int64, val2:System.Int64):(System.Int64)
---@overload fun(val1:System.IntPtr, val2:System.IntPtr):(System.IntPtr)
---@overload fun(val1:System.SByte, val2:System.SByte):(System.SByte)
---@overload fun(val1:System.Single, val2:System.Single):(System.Single)
---@overload fun(val1:System.UInt16, val2:System.UInt16):(System.UInt16)
---@overload fun(val1:System.UInt32, val2:System.UInt32):(System.UInt32)
---@overload fun(val1:System.UInt64, val2:System.UInt64):(System.UInt64)
---@param val1 System.UIntPtr
---@param val2 System.UIntPtr
---@return System.UIntPtr
_G['System']['Math'].Max = function(val1, val2) end

---`Method Public Static`
---@param x System.Double
---@param y System.Double
---@return System.Double
_G['System']['Math'].MaxMagnitude = function(x, y) end

---`Method Public Static`
---@overload fun(val1:System.Byte, val2:System.Byte):(System.Byte)
---@overload fun(val1:System.Decimal, val2:System.Decimal):(System.Decimal)
---@overload fun(val1:System.Double, val2:System.Double):(System.Double)
---@overload fun(val1:System.Int16, val2:System.Int16):(System.Int16)
---@overload fun(val1:System.Int32, val2:System.Int32):(System.Int32)
---@overload fun(val1:System.Int64, val2:System.Int64):(System.Int64)
---@overload fun(val1:System.IntPtr, val2:System.IntPtr):(System.IntPtr)
---@overload fun(val1:System.SByte, val2:System.SByte):(System.SByte)
---@overload fun(val1:System.Single, val2:System.Single):(System.Single)
---@overload fun(val1:System.UInt16, val2:System.UInt16):(System.UInt16)
---@overload fun(val1:System.UInt32, val2:System.UInt32):(System.UInt32)
---@overload fun(val1:System.UInt64, val2:System.UInt64):(System.UInt64)
---@param val1 System.UIntPtr
---@param val2 System.UIntPtr
---@return System.UIntPtr
_G['System']['Math'].Min = function(val1, val2) end

---`Method Public Static`
---@param x System.Double
---@param y System.Double
---@return System.Double
_G['System']['Math'].MinMagnitude = function(x, y) end

---`Method Public Static`
---@param d System.Double
---@return System.Double
_G['System']['Math'].ReciprocalEstimate = function(d) end

---`Method Public Static`
---@param d System.Double
---@return System.Double
_G['System']['Math'].ReciprocalSqrtEstimate = function(d) end

---`Method Public Static`
---@overload fun(d:System.Decimal):(System.Decimal)
---@overload fun(d:System.Decimal, decimals:System.Int32):(System.Decimal)
---@overload fun(d:System.Decimal, mode:System.MidpointRounding):(System.Decimal)
---@overload fun(d:System.Decimal, decimals:System.Int32, mode:System.MidpointRounding):(System.Decimal)
---@overload fun(a:System.Double):(System.Double)
---@overload fun(value:System.Double, digits:System.Int32):(System.Double)
---@overload fun(value:System.Double, mode:System.MidpointRounding):(System.Double)
---@param value System.Double
---@param digits System.Int32
---@param mode System.MidpointRounding
---@return System.Double
_G['System']['Math'].Round = function(value, digits, mode) end

---`Method Public Static`
---@overload fun(value:System.Decimal):(System.Int32)
---@overload fun(value:System.Double):(System.Int32)
---@overload fun(value:System.Int16):(System.Int32)
---@overload fun(value:System.Int32):(System.Int32)
---@overload fun(value:System.Int64):(System.Int32)
---@overload fun(value:System.IntPtr):(System.Int32)
---@overload fun(value:System.SByte):(System.Int32)
---@param value System.Single
---@return System.Int32
_G['System']['Math'].Sign = function(value) end

---`Method Public Static`
---@overload fun(d:System.Decimal):(System.Decimal)
---@param d System.Double
---@return System.Double
_G['System']['Math'].Truncate = function(d) end

---`Method NonPublic Static`
---@param min System.Math.T
---@param max System.Math.T
_G['System']['Math'].ThrowMinMaxException = function(min, max) end

---`Method Public Static`
---@param x System.Double
---@param n System.Int32
---@return System.Double
_G['System']['Math'].ScaleB = function(x, n) end

