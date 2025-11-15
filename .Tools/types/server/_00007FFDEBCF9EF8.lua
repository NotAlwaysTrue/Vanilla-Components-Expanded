---@meta
---@class Barotrauma.LuaInt32 : System.ValueType
---`Field Public Instance`
---@field Value System.Int32
_G['Int32'] = {}

---`Method Public Instance Virtual`
---@return System.String
_G['Int32'].ToString = function() end

---`Constructor Public Instance`
---@overload fun(v:System.Double):Barotrauma.LuaInt32
---@param v System.String
---@param radix? System.Int32
---@return Barotrauma.LuaInt32
_G['Int32'] = function(v, radix) end

---`Constructor Public Instance`
---@overload fun(v:System.Double):Barotrauma.LuaInt32
---@param v System.String
---@param radix? System.Int32
---@return Barotrauma.LuaInt32
_G['Int32'].__new = function(v, radix) end

