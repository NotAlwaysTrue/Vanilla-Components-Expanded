---@meta
---@class Barotrauma.LuaByte : System.ValueType
---`Field Public Instance`
---@field Value System.Byte
_G['Byte'] = {}

---`Method Public Instance Virtual`
---@return System.String
_G['Byte'].ToString = function() end

---`Constructor Public Instance`
---@overload fun(v:System.Double):Barotrauma.LuaByte
---@param v System.String
---@param radix? System.Int32
---@return Barotrauma.LuaByte
_G['Byte'] = function(v, radix) end

---`Constructor Public Instance`
---@overload fun(v:System.Double):Barotrauma.LuaByte
---@param v System.String
---@param radix? System.Int32
---@return Barotrauma.LuaByte
_G['Byte'].__new = function(v, radix) end

