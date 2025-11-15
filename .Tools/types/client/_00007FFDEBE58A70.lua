---@meta
---@class Barotrauma.LuaDouble : System.ValueType
---`Field Public Instance`
---@field Value System.Double
_G['Double'] = {}

---`Method Public Instance Virtual`
---@return System.String
_G['Double'].ToString = function() end

---`Constructor Public Instance`
---@overload fun(v:System.Double):Barotrauma.LuaDouble
---@param v System.String
---@return Barotrauma.LuaDouble
_G['Double'] = function(v) end

---`Constructor Public Instance`
---@overload fun(v:System.Double):Barotrauma.LuaDouble
---@param v System.String
---@return Barotrauma.LuaDouble
_G['Double'].__new = function(v) end

