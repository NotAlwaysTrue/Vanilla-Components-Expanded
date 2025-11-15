---@meta
---@class Barotrauma.CircuitBoxWireRenderer : System.Object
---`Field Private Instance`
---@field texture Microsoft.Xna.Framework.Graphics.Texture2D
---`Field Private Instance`
---@field verts (Microsoft.Xna.Framework.Graphics.VertexPositionColorTexture-arr)|(Microsoft.Xna.Framework.Graphics.VertexPositionColorTexture[])
---`Field Private Instance`
---@field colliders (Microsoft.Xna.Framework.Vector2-arr-arr)|((Microsoft.Xna.Framework.Vector2-arr)|(Microsoft.Xna.Framework.Vector2[])[])
---`Field Private Instance`
---@field skeleton Barotrauma.SquareLine
---`Field Private Instance`
---@field lastStart Microsoft.Xna.Framework.Vector2
---`Field Private Instance`
---@field lastEnd Microsoft.Xna.Framework.Vector2
---`Field Private Instance`
---@field lastColor Microsoft.Xna.Framework.Color
---`Field Private Instance`
---@field wire Barotrauma.Option*1Barotrauma*CircuitBoxWire
---`Field Private Static`
---@field VertsPerQuad System.Int32
---`Field Private Static`
---@field QuadsPerLine System.Int32
---`Field Private Static`
---@field VertsPerLine System.Int32
---`Field Private Static`
---@field TotalVertsPerWire System.Int32
_G['CircuitBoxWireRenderer'] = {}

---`Method Private Instance`
---@param color Microsoft.Xna.Framework.Color
_G['CircuitBoxWireRenderer'].UpdateColor = function(color) end

---`Method Public Instance`
---@param start Microsoft.Xna.Framework.Vector2
---@param luaKey__end Microsoft.Xna.Framework.Vector2
---@param color Microsoft.Xna.Framework.Color
_G['CircuitBoxWireRenderer'].Recompute = function(start, luaKey__end, color) end

---`Method Public Instance`
---@param pos Microsoft.Xna.Framework.Vector2
---@return System.Boolean
_G['CircuitBoxWireRenderer'].Contains = function(pos) end

---`Method Public Instance`
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
---@param selectionColor Microsoft.Xna.Framework.Color
_G['CircuitBoxWireRenderer'].Draw = function(spriteBatch, selectionColor) end

---`Constructor Public Instance`
---@param wire Barotrauma.Option*1Barotrauma*CircuitBoxWire
---@param start Microsoft.Xna.Framework.Vector2
---@param luaKey__end Microsoft.Xna.Framework.Vector2
---@param color Microsoft.Xna.Framework.Color
---@param wireSprite Barotrauma.Sprite
---@return Barotrauma.CircuitBoxWireRenderer
_G['CircuitBoxWireRenderer'] = function(wire, start, luaKey__end, color, wireSprite) end

---`Constructor Public Instance`
---@param wire Barotrauma.Option*1Barotrauma*CircuitBoxWire
---@param start Microsoft.Xna.Framework.Vector2
---@param luaKey__end Microsoft.Xna.Framework.Vector2
---@param color Microsoft.Xna.Framework.Color
---@param wireSprite Barotrauma.Sprite
---@return Barotrauma.CircuitBoxWireRenderer
_G['CircuitBoxWireRenderer'].__new = function(wire, start, luaKey__end, color, wireSprite) end

