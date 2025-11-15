---@meta
---@class Barotrauma.LuaUInt32 : System.ValueType
---`Field Public Instance`
---@field Value System.UInt32
_G['UInt32'] = {}

---`Method Public Instance Virtual`
---@return System.String
_G['UInt32'].ToString = function() end

---`Constructor Public Instance`
---@overload fun(v:System.Double):Barotrauma.LuaUInt32
---@param v System.String
---@param radix? System.Int32
---@return Barotrauma.LuaUInt32
_G['UInt32'] = function(v, radix) end

---`Constructor Public Instance`
---@overload fun(v:System.Double):Barotrauma.LuaUInt32
---@param v System.String
---@param radix? System.Int32
---@return Barotrauma.LuaUInt32
_G['UInt32'].__new = function(v, radix) end

