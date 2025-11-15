---@meta
---@class Barotrauma.LuaSingle : System.ValueType
---`Field Public Instance`
---@field Value System.Single
_G['Single'] = {}
_G['Float'] = _G['Single']

---`Method Public Instance Virtual`
---@return System.String
_G['Single'].ToString = function() end

---`Constructor Public Instance`
---@overload fun(v:System.Double):Barotrauma.LuaSingle
---@param v System.String
---@return Barotrauma.LuaSingle
_G['Single'] = function(v) end

---`Constructor Public Instance`
---@overload fun(v:System.Double):Barotrauma.LuaSingle
---@param v System.String
---@return Barotrauma.LuaSingle
_G['Single'].__new = function(v) end

