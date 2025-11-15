---@meta
---@class Barotrauma.LuaUInt16 : System.ValueType
---`Field Public Instance`
---@field Value System.UInt16
_G['UInt16'] = {}
_G['UShort'] = _G['UInt16']

---`Method Public Instance Virtual`
---@return System.String
_G['UInt16'].ToString = function() end

---`Constructor Public Instance`
---@overload fun(v:System.Double):Barotrauma.LuaUInt16
---@param v System.String
---@param radix? System.Int32
---@return Barotrauma.LuaUInt16
_G['UInt16'] = function(v, radix) end

---`Constructor Public Instance`
---@overload fun(v:System.Double):Barotrauma.LuaUInt16
---@param v System.String
---@param radix? System.Int32
---@return Barotrauma.LuaUInt16
_G['UInt16'].__new = function(v, radix) end

