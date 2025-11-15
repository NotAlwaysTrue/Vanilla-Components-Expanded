---@meta
---@class Voronoi2.DoubleVector2 : System.Object
---`Field Public Instance`
---@field X System.Double
---`Field Public Instance`
---@field Y System.Double
_G['Voronoi2']['DoubleVector2'] = {}

---`Method Public Instance`
---@param x System.Double
---@param y System.Double
_G['Voronoi2']['DoubleVector2'].SetPoint = function(x, y) end

---`Method Public Instance`
_G['Voronoi2']['DoubleVector2'].Normalize = function() end

---`Constructor Public Instance`
---@overload fun():Voronoi2.DoubleVector2
---@param x System.Double
---@param y System.Double
---@return Voronoi2.DoubleVector2
_G['Voronoi2']['DoubleVector2'] = function(x, y) end

---`Constructor Public Instance`
---@overload fun():Voronoi2.DoubleVector2
---@param x System.Double
---@param y System.Double
---@return Voronoi2.DoubleVector2
_G['Voronoi2']['DoubleVector2'].__new = function(x, y) end

