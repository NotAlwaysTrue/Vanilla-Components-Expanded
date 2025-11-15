---@meta
---@class Barotrauma.LuaUInt64 : System.ValueType
---`Field Public Instance`
---@field Value System.UInt64
_G['UInt64'] = {}

---`Method Public Instance Virtual`
---@return System.String
_G['UInt64'].ToString = function() end

---`Constructor Public Instance`
---@overload fun(v:System.Double):Barotrauma.LuaUInt64
---@overload fun(lo:System.Double, hi:System.Double):Barotrauma.LuaUInt64
---@param v System.String
---@param radix? System.Int32
---@return Barotrauma.LuaUInt64
_G['UInt64'] = function(v, radix) end

---`Constructor Public Instance`
---@overload fun(v:System.Double):Barotrauma.LuaUInt64
---@overload fun(lo:System.Double, hi:System.Double):Barotrauma.LuaUInt64
---@param v System.String
---@param radix? System.Int32
---@return Barotrauma.LuaUInt64
_G['UInt64'].__new = function(v, radix) end

