---@meta
---@class Barotrauma.LuaInt16 : System.ValueType
---`Field Public Instance`
---@field Value System.Int16
_G['Int16'] = {}
_G['Short'] = _G['Int16']

---`Method Public Instance Virtual`
---@return System.String
_G['Int16'].ToString = function() end

---`Constructor Public Instance`
---@overload fun(v:System.Double):Barotrauma.LuaInt16
---@param v System.String
---@param radix? System.Int32
---@return Barotrauma.LuaInt16
_G['Int16'] = function(v, radix) end

---`Constructor Public Instance`
---@overload fun(v:System.Double):Barotrauma.LuaInt16
---@param v System.String
---@param radix? System.Int32
---@return Barotrauma.LuaInt16
_G['Int16'].__new = function(v, radix) end

