---@meta
---@class Barotrauma.ScalableFont : System.Object
---`Field Private Instance`
---@field rwl System.Threading.ReaderWriterLockSlim
---`Field Private Instance`
---@field filename System.String
---`Field Private Instance`
---@field face SharpFont.Face
---`Field Private Instance`
---@field size System.UInt32
---`Field Private Instance`
---@field baseHeight System.Int32
---`Field Private Instance`
---@field texCoords (System.Collections.Generic.Dictionary*1System*UInt32*1Barotrauma*ScalableFont*GlyphData)|({[System.UInt32]:(Barotrauma.ScalableFont.GlyphData)})
---`Field Private Instance`
---@field textures (System.Collections.Generic.List*1Microsoft*Xna*Framework*Graphics*Texture2D)|(Microsoft.Xna.Framework.Graphics.Texture2D[])
---`Field Private Instance`
---@field graphicsDevice Microsoft.Xna.Framework.Graphics.GraphicsDevice
---`Field Private Instance`
---@field currentDynamicAtlasCoords Microsoft.Xna.Framework.Vector2
---`Field Private Instance`
---@field currentDynamicAtlasNextY System.Int32
---`Field Private Instance`
---@field currentDynamicPixelBuffer (System.UInt32-arr)|(System.UInt32[])
---`Field Public Instance`
---@field ForceUpperCase System.Boolean
---`Field Private Instance`
---@field charRanges (System.UInt32-arr)|(System.UInt32[])
---`Field Private Instance`
---@field texDims System.Int32
---`Field Private Instance`
---@field baseChar System.UInt32
---`Field Private Static`
---@field FontList (System.Collections.Generic.List*1Barotrauma*ScalableFont)|(Barotrauma.ScalableFont[])
---`Field Private Static`
---@field Lib SharpFont.Library
---`Field Private Static`
---@field globalMutex System.Object
---`Field Private Static`
---@field quadVertices (Microsoft.Xna.Framework.Graphics.VertexPositionColorTexture-arr)|(Microsoft.Xna.Framework.Graphics.VertexPositionColorTexture[])
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field DynamicLoading System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field SpeciallyHandledCharCategory Barotrauma.TextManager.SpeciallyHandledCharCategory
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Size System.UInt32
---`Getter Public Instance`
---@field LineHeight System.Single
_G['ScalableFont'] = {}

---`Method Public Static`
---@param element System.Xml.Linq.XElement
---@return Barotrauma.TextManager.SpeciallyHandledCharCategory
_G['ScalableFont'].ExtractShccFromXElement = function(element) end

---`Method Private Instance`
---@param gd Microsoft.Xna.Framework.Graphics.GraphicsDevice
---@param charRanges? (System.UInt32-arr)|(System.UInt32[])
---@param texDims? System.Int32
---@param baseChar? System.UInt32
_G['ScalableFont'].RenderAtlas = function(gd, charRanges, texDims, baseChar) end

---`Method Private Instance`
---@overload fun(gd:Microsoft.Xna.Framework.Graphics.GraphicsDevice, character:System.UInt32, texDims?:System.Int32, baseChar?:System.UInt32)
---@overload fun(gd:Microsoft.Xna.Framework.Graphics.GraphicsDevice, str:System.String, texDims?:System.Int32, baseChar?:System.UInt32)
---@param gd Microsoft.Xna.Framework.Graphics.GraphicsDevice
---@param characters (System.Collections.Generic.IEnumerable*1System*UInt32)|(fun():(System.UInt32))
---@param texDims? System.Int32
---@param baseChar? System.UInt32
_G['ScalableFont'].DynamicRenderAtlas = function(gd, characters, texDims, baseChar) end

---`Method Private Instance`
---@param text System.String
---@param advanceUnit Microsoft.Xna.Framework.Vector2-ref
---@param position Microsoft.Xna.Framework.Vector2-ref
---@param scale Microsoft.Xna.Framework.Vector2-ref
---@param alignment Barotrauma.Alignment
---@param i System.Int32
---@param lineWidth System.Single-ref
---@param currentLineOffset Microsoft.Xna.Framework.Vector2-ref
---@param lineNum System.Int32-ref
---@param currentPos Microsoft.Xna.Framework.Vector2-ref
---@param charIndex System.UInt32-ref
---@param shouldContinue System.Boolean-ref
_G['ScalableFont'].HandleNewLineAndAlignment = function(text, advanceUnit, position, scale, alignment, i, lineWidth, currentLineOffset, lineNum, currentPos, charIndex, shouldContinue) end

---`Method Private Instance`
---@param charIndex System.UInt32
---@return Barotrauma.ScalableFont.GlyphData
_G['ScalableFont'].GetGlyphData = function(charIndex) end

---`Method Public Instance`
---@overload fun(sb:Microsoft.Xna.Framework.Graphics.SpriteBatch, text:System.String, position:Microsoft.Xna.Framework.Vector2, color:Microsoft.Xna.Framework.Color, rotation:System.Single, origin:Microsoft.Xna.Framework.Vector2, scale:Microsoft.Xna.Framework.Vector2, se:Microsoft.Xna.Framework.Graphics.SpriteEffects, layerDepth:System.Single, alignment?:Barotrauma.Alignment, forceUpperCase?:Barotrauma.ForceUpperCase)
---@overload fun(sb:Microsoft.Xna.Framework.Graphics.SpriteBatch, text:System.String, position:Microsoft.Xna.Framework.Vector2, color:Microsoft.Xna.Framework.Color, rotation:System.Single, origin:Microsoft.Xna.Framework.Vector2, scale:System.Single, se:Microsoft.Xna.Framework.Graphics.SpriteEffects, layerDepth:System.Single, alignment?:Barotrauma.Alignment, forceUpperCase?:Barotrauma.ForceUpperCase)
---@param sb Microsoft.Xna.Framework.Graphics.SpriteBatch
---@param text System.String
---@param position Microsoft.Xna.Framework.Vector2
---@param color Microsoft.Xna.Framework.Color
---@param forceUpperCase? Barotrauma.ForceUpperCase
---@param italics? System.Boolean
_G['ScalableFont'].DrawString = function(sb, text, position, color, forceUpperCase, italics) end

---`Method Private Instance`
---@param text System.String
---@param forceUpperCase Barotrauma.ForceUpperCase
---@return System.String
_G['ScalableFont'].ApplyUpperCase = function(text, forceUpperCase) end

---`Method Public Instance`
---@overload fun(sb:Microsoft.Xna.Framework.Graphics.SpriteBatch, text:System.String, position:Microsoft.Xna.Framework.Vector2, color:Microsoft.Xna.Framework.Color, rotation:System.Single, origin:Microsoft.Xna.Framework.Vector2, scale:System.Single, se:Microsoft.Xna.Framework.Graphics.SpriteEffects, layerDepth:System.Single, richTextData:System.Nullable, rtdOffset?:System.Int32, alignment?:Barotrauma.Alignment, forceUpperCase?:Barotrauma.ForceUpperCase)
---@param sb Microsoft.Xna.Framework.Graphics.SpriteBatch
---@param text System.String
---@param position Microsoft.Xna.Framework.Vector2
---@param color Microsoft.Xna.Framework.Color
---@param rotation System.Single
---@param origin Microsoft.Xna.Framework.Vector2
---@param scale Microsoft.Xna.Framework.Vector2
---@param se Microsoft.Xna.Framework.Graphics.SpriteEffects
---@param layerDepth System.Single
---@param richTextData System.Nullable
---@param rtdOffset? System.Int32
---@param alignment? Barotrauma.Alignment
---@param forceUpperCase? Barotrauma.ForceUpperCase
_G['ScalableFont'].DrawStringWithColors = function(sb, text, position, color, rotation, origin, scale, se, layerDepth, richTextData, rtdOffset, alignment, forceUpperCase) end

---`Method Public Instance`
---@overload fun(text:System.String, width:System.Single):(System.String)
---@overload fun(text:System.String, width:System.Single, requestCharPos:System.Int32, requestedCharPos:Microsoft.Xna.Framework.Vector2-ref):(System.String)
---@param text System.String
---@param width System.Single
---@param allCharPositions Microsoft.Xna.Framework.Vector2-arr-ref
---@return System.String
_G['ScalableFont'].WrapText = function(text, width, allCharPositions) end

---`Method Private Instance`
---@param text System.String
---@param width System.Single
---@param requestCharPos System.Int32
---@param requestedCharPos Microsoft.Xna.Framework.Vector2-ref
---@param returnAllCharPositions System.Boolean
---@param allCharPositions Microsoft.Xna.Framework.Vector2-arr-ref
---@return System.String
_G['ScalableFont'].WrapText = function(text, width, requestCharPos, requestedCharPos, returnAllCharPositions, allCharPositions) end

---`Method Public Instance`
---@overload fun(str:Barotrauma.LocalizedString, removeExtraSpacing?:System.Boolean):(Microsoft.Xna.Framework.Vector2)
---@param text System.String
---@param removeExtraSpacing? System.Boolean
---@return Microsoft.Xna.Framework.Vector2
_G['ScalableFont'].MeasureString = function(text, removeExtraSpacing) end

---`Method Public Instance`
---@param c System.Char
---@return Microsoft.Xna.Framework.Vector2
_G['ScalableFont'].MeasureChar = function(c) end

---`Method Public Instance`
---@param c System.Char
---@return System.ValueTuple*1Barotrauma*ScalableFont*GlyphData*1Microsoft*Xna*Framework*Graphics*Texture2D
_G['ScalableFont'].GetGlyphDataAndTextureForChar = function(c) end

---`Method Public Instance Virtual`
_G['ScalableFont'].Dispose = function() end

---`Constructor Public Instance`
---@overload fun(element:Barotrauma.ContentXElement, defaultSize?:System.UInt32, gd?:Microsoft.Xna.Framework.Graphics.GraphicsDevice):Barotrauma.ScalableFont
---@overload fun(filename:System.String, size:System.UInt32, gd?:Microsoft.Xna.Framework.Graphics.GraphicsDevice, dynamicLoading?:System.Boolean, speciallyHandledCharCategory?:Barotrauma.TextManager.SpeciallyHandledCharCategory):Barotrauma.ScalableFont
---@return Barotrauma.ScalableFont
_G['ScalableFont'] = function() end

---`Constructor Public Instance`
---@overload fun(element:Barotrauma.ContentXElement, defaultSize?:System.UInt32, gd?:Microsoft.Xna.Framework.Graphics.GraphicsDevice):Barotrauma.ScalableFont
---@overload fun(filename:System.String, size:System.UInt32, gd?:Microsoft.Xna.Framework.Graphics.GraphicsDevice, dynamicLoading?:System.Boolean, speciallyHandledCharCategory?:Barotrauma.TextManager.SpeciallyHandledCharCategory):Barotrauma.ScalableFont
---@return Barotrauma.ScalableFont
_G['ScalableFont'].__new = function() end

---`Constructor Private Static`
---@overload fun(element:Barotrauma.ContentXElement, defaultSize?:System.UInt32, gd?:Microsoft.Xna.Framework.Graphics.GraphicsDevice):Barotrauma.ScalableFont
---@overload fun(filename:System.String, size:System.UInt32, gd?:Microsoft.Xna.Framework.Graphics.GraphicsDevice, dynamicLoading?:System.Boolean, speciallyHandledCharCategory?:Barotrauma.TextManager.SpeciallyHandledCharCategory):Barotrauma.ScalableFont
---@return Barotrauma.ScalableFont
_G['ScalableFont'] = function() end

---`Constructor Private Static`
---@overload fun(element:Barotrauma.ContentXElement, defaultSize?:System.UInt32, gd?:Microsoft.Xna.Framework.Graphics.GraphicsDevice):Barotrauma.ScalableFont
---@overload fun(filename:System.String, size:System.UInt32, gd?:Microsoft.Xna.Framework.Graphics.GraphicsDevice, dynamicLoading?:System.Boolean, speciallyHandledCharCategory?:Barotrauma.TextManager.SpeciallyHandledCharCategory):Barotrauma.ScalableFont
---@return Barotrauma.ScalableFont
_G['ScalableFont'].__new = function() end

