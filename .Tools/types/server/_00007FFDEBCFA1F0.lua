---@meta
---@class Barotrauma.LuaInt64 : System.ValueType
---`Field Public Instance`
---@field Value System.Int64
_G['Int64'] = {}

---`Method Public Instance Virtual`
---@return System.String
_G['Int64'].ToString = function() end

---`Constructor Public Instance`
---@overload fun(v:System.Double):Barotrauma.LuaInt64
---@overload fun(lo:System.Double, hi:System.Double):Barotrauma.LuaInt64
---@param v System.String
---@param radix? System.Int32
---@return Barotrauma.LuaInt64
_G['Int64'] = function(v, radix) end

---`Constructor Public Instance`
---@overload fun(v:System.Double):Barotrauma.LuaInt64
---@overload fun(lo:System.Double, hi:System.Double):Barotrauma.LuaInt64
---@param v System.String
---@param radix? System.Int32
---@return Barotrauma.LuaInt64
_G['Int64'].__new = function(v, radix) end

