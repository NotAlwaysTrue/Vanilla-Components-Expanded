---@meta
---@class Barotrauma.UISprite : System.Object
---`Field Private Instance`
---@field minBorderScale System.Single
---`Field Private Instance`
---@field maxBorderScale System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field Sprite Barotrauma.Sprite
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field Tile System.Boolean
---`Getter Public Instance`
---@field Slice System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Slices (Microsoft.Xna.Framework.Rectangle-arr)|(Microsoft.Xna.Framework.Rectangle[])
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field NonSliceSize Microsoft.Xna.Framework.Point
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field MaintainAspectRatio System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field MaintainBorderAspectRatio System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field CrossFadeIn System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field CrossFadeOut System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field TransitionMode Barotrauma.TransitionMode
_G['UISprite'] = {}

---`Method Public Instance`
---@param drawSize Microsoft.Xna.Framework.Point
---@return System.Single
_G['UISprite'].GetSliceBorderScale = function(drawSize) end

---`Method Public Instance`
---@overload fun(spriteBatch:Microsoft.Xna.Framework.Graphics.SpriteBatch, rect:Microsoft.Xna.Framework.RectangleF, color:Microsoft.Xna.Framework.Color, spriteEffects?:Microsoft.Xna.Framework.Graphics.SpriteEffects, uvOffset?:System.Nullable*1Microsoft*Xna*Framework*Vector2)
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
---@param rect Microsoft.Xna.Framework.Rectangle
---@param color Microsoft.Xna.Framework.Color
---@param spriteEffects? Microsoft.Xna.Framework.Graphics.SpriteEffects
---@param uvOffset? System.Nullable*1Microsoft*Xna*Framework*Vector2
_G['UISprite'].Draw = function(spriteBatch, rect, color, spriteEffects, uvOffset) end

---`Constructor Public Instance`
---@param element Barotrauma.ContentXElement
---@return Barotrauma.UISprite
_G['UISprite'] = function(element) end

---`Constructor Public Instance`
---@param element Barotrauma.ContentXElement
---@return Barotrauma.UISprite
_G['UISprite'].__new = function(element) end

