---@meta
---@class Barotrauma.ShapeExtensions : System.Object
---`Field Private Static`
---@field _whitePixelTexture Microsoft.Xna.Framework.Graphics.Texture2D
_G['ShapeExtensions'] = {}

---`Method Private Static`
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
---@return Microsoft.Xna.Framework.Graphics.Texture2D
_G['ShapeExtensions'].GetTexture = function(spriteBatch) end

---`Method Public Static`
---@overload fun(spriteBatch:Microsoft.Xna.Framework.Graphics.SpriteBatch, position:Microsoft.Xna.Framework.Vector2, polygon:Barotrauma.Polygon, color:Microsoft.Xna.Framework.Color, thickness?:System.Single)
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
---@param offset Microsoft.Xna.Framework.Vector2
---@param points (System.Collections.Generic.IReadOnlyList*1Microsoft*Xna*Framework*Vector2)|(Microsoft.Xna.Framework.Vector2[])
---@param color Microsoft.Xna.Framework.Color
---@param thickness? System.Single
_G['ShapeExtensions'].DrawPolygon = function(spriteBatch, offset, points, color, thickness) end

---`Method Public Static`
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
---@param offset Microsoft.Xna.Framework.Vector2
---@param points (System.Collections.Generic.IReadOnlyList*1Microsoft*Xna*Framework*Vector2)|(Microsoft.Xna.Framework.Vector2[])
---@param color Microsoft.Xna.Framework.Color
---@param thickness? System.Single
_G['ShapeExtensions'].DrawPolygonInner = function(spriteBatch, offset, points, color, thickness) end

---`Method Private Static`
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
---@param point1 Microsoft.Xna.Framework.Vector2
---@param point2 Microsoft.Xna.Framework.Vector2
---@param color Microsoft.Xna.Framework.Color
---@param thickness System.Single
_G['ShapeExtensions'].DrawPolygonEdgeInner = function(spriteBatch, point1, point2, color, thickness) end

---`Method Private Static`
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
---@param point1 Microsoft.Xna.Framework.Vector2
---@param point2 Microsoft.Xna.Framework.Vector2
---@param color Microsoft.Xna.Framework.Color
---@param thickness System.Single
_G['ShapeExtensions'].DrawPolygonEdge = function(spriteBatch, point1, point2, color, thickness) end

---`Method Public Static`
---@overload fun(spriteBatch:Microsoft.Xna.Framework.Graphics.SpriteBatch, x1:System.Single, y1:System.Single, x2:System.Single, y2:System.Single, color:Microsoft.Xna.Framework.Color, thickness?:System.Single)
---@overload fun(spriteBatch:Microsoft.Xna.Framework.Graphics.SpriteBatch, point1:Microsoft.Xna.Framework.Vector2, point2:Microsoft.Xna.Framework.Vector2, color:Microsoft.Xna.Framework.Color, thickness?:System.Single)
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
---@param tex Microsoft.Xna.Framework.Graphics.Texture2D
---@param point Microsoft.Xna.Framework.Vector2
---@param length System.Single
---@param angle System.Single
---@param color Microsoft.Xna.Framework.Color
---@param thickness? System.Single
_G['ShapeExtensions'].DrawLine = function(spriteBatch, tex, point, length, angle, color, thickness) end

---`Method Public Static`
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
---@param tex Microsoft.Xna.Framework.Graphics.Texture2D
---@param point1 Microsoft.Xna.Framework.Vector2
---@param point2 Microsoft.Xna.Framework.Vector2
---@param color Microsoft.Xna.Framework.Color
---@param thickness? System.Single
_G['ShapeExtensions'].DrawLineWithTexture = function(spriteBatch, tex, point1, point2, color, thickness) end

---`Method Public Static`
---@overload fun(spriteBatch:Microsoft.Xna.Framework.Graphics.SpriteBatch, x:System.Single, y:System.Single, color:Microsoft.Xna.Framework.Color, size?:System.Single)
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
---@param position Microsoft.Xna.Framework.Vector2
---@param color Microsoft.Xna.Framework.Color
---@param size? System.Single
_G['ShapeExtensions'].DrawPoint = function(spriteBatch, position, color, size) end

---`Method Public Static`
---@overload fun(spriteBatch:Microsoft.Xna.Framework.Graphics.SpriteBatch, center:Microsoft.Xna.Framework.Vector2, radius:System.Single, sides:System.Int32, color:Microsoft.Xna.Framework.Color, thickness?:System.Single)
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
---@param x System.Single
---@param y System.Single
---@param radius System.Single
---@param sides System.Int32
---@param color Microsoft.Xna.Framework.Color
---@param thickness? System.Single
_G['ShapeExtensions'].DrawCircle = function(spriteBatch, x, y, radius, sides, color, thickness) end

---`Method Public Static`
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
---@param center Microsoft.Xna.Framework.Vector2
---@param radius System.Single
---@param radians System.Single
---@param sides System.Int32
---@param color Microsoft.Xna.Framework.Color
---@param offset? System.Single
---@param thickness? System.Single
_G['ShapeExtensions'].DrawSector = function(spriteBatch, center, radius, radians, sides, color, offset, thickness) end

---`Method Private Static`
---@param radius System.Double
---@param sides System.Int32
---@param radians System.Single
---@param offset? System.Single
---@return (Microsoft.Xna.Framework.Vector2-arr)|(Microsoft.Xna.Framework.Vector2[])
_G['ShapeExtensions'].CreateSector = function(radius, sides, radians, offset) end

---`Method Private Static`
---@param radius System.Double
---@param sides System.Int32
---@return (Microsoft.Xna.Framework.Vector2-arr)|(Microsoft.Xna.Framework.Vector2[])
_G['ShapeExtensions'].CreateCircle = function(radius, sides) end

