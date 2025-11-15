---@meta
---@class Barotrauma.GUISprite : Barotrauma.GUISelector*1Barotrauma*GUISpritePrefab
---`Getter Public Instance`
---@field Value Barotrauma.UISprite
_G['GUISprite'] = {}

---`Method Public Instance`
---@overload fun(spriteBatch:Microsoft.Xna.Framework.Graphics.SpriteBatch, rect:Microsoft.Xna.Framework.RectangleF, color:Microsoft.Xna.Framework.Color, spriteEffects?:Microsoft.Xna.Framework.Graphics.SpriteEffects)
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
---@param rect Microsoft.Xna.Framework.Rectangle
---@param color Microsoft.Xna.Framework.Color
---@param spriteEffects? Microsoft.Xna.Framework.Graphics.SpriteEffects
_G['GUISprite'].Draw = function(spriteBatch, rect, color, spriteEffects) end

---`Constructor Public Instance`
---@param identifier System.String
---@return Barotrauma.GUISprite
_G['GUISprite'] = function(identifier) end

---`Constructor Public Instance`
---@param identifier System.String
---@return Barotrauma.GUISprite
_G['GUISprite'].__new = function(identifier) end

