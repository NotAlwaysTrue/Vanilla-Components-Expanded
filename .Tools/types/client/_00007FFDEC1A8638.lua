---@meta
---@class Barotrauma.GUIFont : Barotrauma.GUISelector*1Barotrauma*GUIFontPrefab
---`Getter Public Instance`
---@field HasValue System.Boolean
---`Getter Public Instance`
---@field Value Barotrauma.ScalableFont
---`Getter Public Instance`
---@field ForceUpperCase System.Boolean
---`Getter Public Instance`
---@field Size System.UInt32
---`Getter Public Instance`
---@field LineHeight System.Single
_G['GUIFont'] = {}

---`Method Private Instance`
---@param str Barotrauma.LocalizedString
---@return Barotrauma.ScalableFont
_G['GUIFont'].GetFontForStr = function(str) end

---`Method Public Instance`
---@param str System.String
---@return Barotrauma.ScalableFont
_G['GUIFont'].GetFontForStr = function(str) end

---`Method Public Instance`
---@overload fun(sb:Microsoft.Xna.Framework.Graphics.SpriteBatch, text:Barotrauma.LocalizedString, position:Microsoft.Xna.Framework.Vector2, color:Microsoft.Xna.Framework.Color, rotation:System.Single, origin:Microsoft.Xna.Framework.Vector2, scale:Microsoft.Xna.Framework.Vector2, spriteEffects:Microsoft.Xna.Framework.Graphics.SpriteEffects, layerDepth:System.Single)
---@overload fun(sb:Microsoft.Xna.Framework.Graphics.SpriteBatch, text:System.String, position:Microsoft.Xna.Framework.Vector2, color:Microsoft.Xna.Framework.Color, rotation:System.Single, origin:Microsoft.Xna.Framework.Vector2, scale:Microsoft.Xna.Framework.Vector2, spriteEffects:Microsoft.Xna.Framework.Graphics.SpriteEffects, layerDepth:System.Single)
---@overload fun(sb:Microsoft.Xna.Framework.Graphics.SpriteBatch, text:Barotrauma.LocalizedString, position:Microsoft.Xna.Framework.Vector2, color:Microsoft.Xna.Framework.Color, rotation:System.Single, origin:Microsoft.Xna.Framework.Vector2, scale:System.Single, spriteEffects:Microsoft.Xna.Framework.Graphics.SpriteEffects, layerDepth:System.Single, alignment?:Barotrauma.Alignment)
---@overload fun(sb:Microsoft.Xna.Framework.Graphics.SpriteBatch, text:System.String, position:Microsoft.Xna.Framework.Vector2, color:Microsoft.Xna.Framework.Color, rotation:System.Single, origin:Microsoft.Xna.Framework.Vector2, scale:System.Single, spriteEffects:Microsoft.Xna.Framework.Graphics.SpriteEffects, layerDepth:System.Single, alignment?:Barotrauma.Alignment, forceUpperCase?:Barotrauma.ForceUpperCase)
---@overload fun(sb:Microsoft.Xna.Framework.Graphics.SpriteBatch, text:Barotrauma.LocalizedString, position:Microsoft.Xna.Framework.Vector2, color:Microsoft.Xna.Framework.Color, forceUpperCase?:Barotrauma.ForceUpperCase, italics?:System.Boolean)
---@param sb Microsoft.Xna.Framework.Graphics.SpriteBatch
---@param text System.String
---@param position Microsoft.Xna.Framework.Vector2
---@param color Microsoft.Xna.Framework.Color
---@param forceUpperCase? Barotrauma.ForceUpperCase
---@param italics? System.Boolean
_G['GUIFont'].DrawString = function(sb, text, position, color, forceUpperCase, italics) end

---`Method Public Instance`
---@param sb Microsoft.Xna.Framework.Graphics.SpriteBatch
---@param text System.String
---@param position Microsoft.Xna.Framework.Vector2
---@param color Microsoft.Xna.Framework.Color
---@param rotation System.Single
---@param origin Microsoft.Xna.Framework.Vector2
---@param scale System.Single
---@param spriteEffects Microsoft.Xna.Framework.Graphics.SpriteEffects
---@param layerDepth System.Single
---@param richTextData System.Nullable
---@param rtdOffset? System.Int32
---@param alignment? Barotrauma.Alignment
---@param forceUpperCase? Barotrauma.ForceUpperCase
_G['GUIFont'].DrawStringWithColors = function(sb, text, position, color, rotation, origin, scale, spriteEffects, layerDepth, richTextData, rtdOffset, alignment, forceUpperCase) end

---`Method Public Instance`
---@param str Barotrauma.LocalizedString
---@param removeExtraSpacing? System.Boolean
---@return Microsoft.Xna.Framework.Vector2
_G['GUIFont'].MeasureString = function(str, removeExtraSpacing) end

---`Method Public Instance`
---@param c System.Char
---@return Microsoft.Xna.Framework.Vector2
_G['GUIFont'].MeasureChar = function(c) end

---`Method Public Instance`
---@overload fun(text:System.String, width:System.Single):(System.String)
---@overload fun(text:System.String, width:System.Single, requestCharPos:System.Int32, requestedCharPos:Microsoft.Xna.Framework.Vector2-ref):(System.String)
---@param text System.String
---@param width System.Single
---@param allCharPositions Microsoft.Xna.Framework.Vector2-arr-ref
---@return System.String
_G['GUIFont'].WrapText = function(text, width, allCharPositions) end

---`Constructor Public Instance`
---@param identifier System.String
---@return Barotrauma.GUIFont
_G['GUIFont'] = function(identifier) end

---`Constructor Public Instance`
---@param identifier System.String
---@return Barotrauma.GUIFont
_G['GUIFont'].__new = function(identifier) end

