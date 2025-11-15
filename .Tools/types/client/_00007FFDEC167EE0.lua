---@meta
---@class Barotrauma.SpriteSheet : Barotrauma.Sprite
---`Field Private Instance`
---@field sourceRects (Microsoft.Xna.Framework.Rectangle-arr)|(Microsoft.Xna.Framework.Rectangle[])
---`Field Private Instance`
---@field emptyFrames System.Int32
---`Getter Public Instance`
---@field FrameCount System.Int32
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field FrameSize Microsoft.Xna.Framework.Point
_G['SpriteSheet'] = {}

---`Method Public Instance Virtual`
---@param spriteBatch Microsoft.Xna.Framework.Graphics.ISpriteBatch
---@param pos Microsoft.Xna.Framework.Vector2
---@param color Microsoft.Xna.Framework.Color
---@param origin Microsoft.Xna.Framework.Vector2
---@param rotate System.Single
---@param scale Microsoft.Xna.Framework.Vector2
---@param spriteEffect? Microsoft.Xna.Framework.Graphics.SpriteEffects
---@param depth? System.Nullable*1System*Single
_G['SpriteSheet'].Draw = function(spriteBatch, pos, color, origin, rotate, scale, spriteEffect, depth) end

---`Method Public Instance`
---@param spriteBatch Microsoft.Xna.Framework.Graphics.ISpriteBatch
---@param spriteIndex System.Int32
---@param pos Microsoft.Xna.Framework.Vector2
---@param color Microsoft.Xna.Framework.Color
---@param origin Microsoft.Xna.Framework.Vector2
---@param rotate System.Single
---@param scale Microsoft.Xna.Framework.Vector2
---@param spriteEffect? Microsoft.Xna.Framework.Graphics.SpriteEffects
---@param depth? System.Nullable*1System*Single
_G['SpriteSheet'].Draw = function(spriteBatch, spriteIndex, pos, color, origin, rotate, scale, spriteEffect, depth) end

---`Method Public Instance`
---@param animationSpeed System.Single
---@param animatePaused? System.Boolean
---@return System.Int32
_G['SpriteSheet'].GetAnimatedSpriteIndex = function(animationSpeed, animatePaused) end

---`Method Private Instance`
---@param columnCount System.Int32
---@param rowCount System.Int32
_G['SpriteSheet'].Init = function(columnCount, rowCount) end

---`Constructor Public Instance`
---@overload fun(element:Barotrauma.ContentXElement, path?:System.String, file?:System.String):Barotrauma.SpriteSheet
---@param filePath System.String
---@param columnCount System.Int32
---@param rowCount System.Int32
---@param origin Microsoft.Xna.Framework.Vector2
---@param sourceRect? System.Nullable*1Microsoft*Xna*Framework*Rectangle
---@return Barotrauma.SpriteSheet
_G['SpriteSheet'] = function(filePath, columnCount, rowCount, origin, sourceRect) end

---`Constructor Public Instance`
---@overload fun(element:Barotrauma.ContentXElement, path?:System.String, file?:System.String):Barotrauma.SpriteSheet
---@param filePath System.String
---@param columnCount System.Int32
---@param rowCount System.Int32
---@param origin Microsoft.Xna.Framework.Vector2
---@param sourceRect? System.Nullable*1Microsoft*Xna*Framework*Rectangle
---@return Barotrauma.SpriteSheet
_G['SpriteSheet'].__new = function(filePath, columnCount, rowCount, origin, sourceRect) end

