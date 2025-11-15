---@meta
---@class Microsoft.Xna.Framework.Rectangle : System.ValueType
---`Field Public Instance`
---@field X System.Int32
---`Field Public Instance`
---@field Y System.Int32
---`Field Public Instance`
---@field Width System.Int32
---`Field Public Instance`
---@field Height System.Int32
---`Field Private Static`
---@field emptyRectangle Microsoft.Xna.Framework.Rectangle
---`Getter Public Static`
---@field Empty Microsoft.Xna.Framework.Rectangle
---`Getter Public Instance`
---@field Left System.Int32
---`Getter Public Instance`
---@field Right System.Int32
---`Getter Public Instance`
---@field Top System.Int32
---`Getter Public Instance`
---@field Bottom System.Int32
---`Getter Public Instance`
---@field IsEmpty System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Location Microsoft.Xna.Framework.Point
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Size Microsoft.Xna.Framework.Point
---`Getter Public Instance`
---@field Center Microsoft.Xna.Framework.Point
---`Getter NonPublic Instance`
---@field DebugDisplayString System.String
_G['Rectangle'] = {}

---`Method Public Instance`
---@overload fun(x:System.Int32, y:System.Int32):(System.Boolean)
---@overload fun(x:System.Single, y:System.Single):(System.Boolean)
---@overload fun(value:Microsoft.Xna.Framework.Point):(System.Boolean)
---@overload fun(value:Microsoft.Xna.Framework.Point-ref, result:System.Boolean-ref)
---@overload fun(value:Microsoft.Xna.Framework.Vector2):(System.Boolean)
---@overload fun(value:Microsoft.Xna.Framework.Vector2-ref, result:System.Boolean-ref)
---@overload fun(value:Microsoft.Xna.Framework.Rectangle):(System.Boolean)
---@param value Microsoft.Xna.Framework.Rectangle-ref
---@param result System.Boolean-ref
_G['Rectangle'].Contains = function(value, result) end

---`Method Public Instance Virtual`
---@overload fun(obj:System.Object):(System.Boolean)
---@param other Microsoft.Xna.Framework.Rectangle
---@return System.Boolean
_G['Rectangle'].Equals = function(other) end

---`Method Public Instance Virtual`
---@return System.Int32
_G['Rectangle'].GetHashCode = function() end

---`Method Public Instance`
---@overload fun(horizontalAmount:System.Int32, verticalAmount:System.Int32)
---@overload fun(horizontalAmount:System.Single, verticalAmount:System.Single)
---@param amount Microsoft.Xna.Framework.Vector2
_G['Rectangle'].Inflate = function(amount) end

---`Method Public Instance`
---@overload fun(value:Microsoft.Xna.Framework.Rectangle):(System.Boolean)
---@param value Microsoft.Xna.Framework.Rectangle-ref
---@param result System.Boolean-ref
_G['Rectangle'].Intersects = function(value, result) end

---`Method Public Static`
---@overload fun(value1:Microsoft.Xna.Framework.Rectangle, value2:Microsoft.Xna.Framework.Rectangle):(Microsoft.Xna.Framework.Rectangle)
---@param value1 Microsoft.Xna.Framework.Rectangle-ref
---@param value2 Microsoft.Xna.Framework.Rectangle-ref
---@param result Microsoft.Xna.Framework.Rectangle-ref
_G['Rectangle'].Intersect = function(value1, value2, result) end

---`Method Public Instance`
---@overload fun(offsetX:System.Int32, offsetY:System.Int32)
---@overload fun(offsetX:System.Single, offsetY:System.Single)
---@overload fun(amount:Microsoft.Xna.Framework.Point)
---@param amount Microsoft.Xna.Framework.Vector2
_G['Rectangle'].Offset = function(amount) end

---`Method Public Instance Virtual`
---@return System.String
_G['Rectangle'].ToString = function() end

---`Method Public Static`
---@overload fun(value1:Microsoft.Xna.Framework.Rectangle, value2:Microsoft.Xna.Framework.Rectangle):(Microsoft.Xna.Framework.Rectangle)
---@param value1 Microsoft.Xna.Framework.Rectangle-ref
---@param value2 Microsoft.Xna.Framework.Rectangle-ref
---@param result Microsoft.Xna.Framework.Rectangle-ref
_G['Rectangle'].Union = function(value1, value2, result) end

---`Method Public Instance`
---@param point Microsoft.Xna.Framework.Point
_G['Rectangle'].AddPoint = function(point) end

---`Constructor Public Instance`
---@overload fun(x:System.Int32, y:System.Int32, width:System.Int32, height:System.Int32):Microsoft.Xna.Framework.Rectangle
---@overload fun(location:Microsoft.Xna.Framework.Point, size:Microsoft.Xna.Framework.Point):Microsoft.Xna.Framework.Rectangle
---@return Microsoft.Xna.Framework.Rectangle
_G['Rectangle'] = function() end

---`Constructor Public Instance`
---@overload fun(x:System.Int32, y:System.Int32, width:System.Int32, height:System.Int32):Microsoft.Xna.Framework.Rectangle
---@overload fun(location:Microsoft.Xna.Framework.Point, size:Microsoft.Xna.Framework.Point):Microsoft.Xna.Framework.Rectangle
---@return Microsoft.Xna.Framework.Rectangle
_G['Rectangle'].__new = function() end

---`Constructor Private Static`
---@overload fun(x:System.Int32, y:System.Int32, width:System.Int32, height:System.Int32):Microsoft.Xna.Framework.Rectangle
---@overload fun(location:Microsoft.Xna.Framework.Point, size:Microsoft.Xna.Framework.Point):Microsoft.Xna.Framework.Rectangle
---@return Microsoft.Xna.Framework.Rectangle
_G['Rectangle'] = function() end

---`Constructor Private Static`
---@overload fun(x:System.Int32, y:System.Int32, width:System.Int32, height:System.Int32):Microsoft.Xna.Framework.Rectangle
---@overload fun(location:Microsoft.Xna.Framework.Point, size:Microsoft.Xna.Framework.Point):Microsoft.Xna.Framework.Rectangle
---@return Microsoft.Xna.Framework.Rectangle
_G['Rectangle'].__new = function() end

