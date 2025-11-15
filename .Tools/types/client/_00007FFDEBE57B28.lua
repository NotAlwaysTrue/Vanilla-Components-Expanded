---@meta
---@class Barotrauma.LuaSByte : System.ValueType
---`Field Public Instance`
---@field Value System.SByte
_G['SByte'] = {}

---`Method Public Instance Virtual`
---@return System.String
_G['SByte'].ToString = function() end

---`Constructor Public Instance`
---@overload fun(v:System.Double):Barotrauma.LuaSByte
---@param v System.String
---@param radix? System.Int32
---@return Barotrauma.LuaSByte
_G['SByte'] = function(v, radix) end

---`Constructor Public Instance`
---@overload fun(v:System.Double):Barotrauma.LuaSByte
---@param v System.String
---@param radix? System.Int32
---@return Barotrauma.LuaSByte
_G['SByte'].__new = function(v, radix) end

