---@meta
---@class Barotrauma.CircuitBoxNode : Barotrauma.CircuitBoxSelectable
---`Field Public Instance`
---@field DrawRect Microsoft.Xna.Framework.RectangleF
---`Field Private Instance`
---@field TopDrawRect Microsoft.Xna.Framework.RectangleF
---`Field Public Instance`
---@field Size Microsoft.Xna.Framework.Vector2
---`Field Public Instance`
---@field Rect Microsoft.Xna.Framework.RectangleF
---`Field Private Instance`
---@field position Microsoft.Xna.Framework.Vector2
---`Field Public Instance`
---@field Connectors (System.Collections.Immutable.ImmutableArray*1Barotrauma*CircuitBoxConnection)|(Barotrauma.CircuitBoxConnection[])
---`Field Public Instance`
---@field CircuitBox Barotrauma.Items.Components.CircuitBox
---`Field Public Static`
---@field Opacity System.Single
---`Getter Public Instance Virtual`
---@field IsResizable System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Position Microsoft.Xna.Framework.Vector2
_G['CircuitBoxNode'] = {}

---`Method NonPublic Instance`
_G['CircuitBoxNode'].UpdateDrawRects = function() end

---`Method Public Instance`
_G['CircuitBoxNode'].OnUICreated = function() end

---`Method Public Instance Virtual`
---@param drawRect Microsoft.Xna.Framework.RectangleF
_G['CircuitBoxNode'].OnResized = function(drawRect) end

---`Method Public Instance`
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
---@param drawRect Microsoft.Xna.Framework.RectangleF
---@param topDrawRect Microsoft.Xna.Framework.RectangleF
---@param color Microsoft.Xna.Framework.Color
_G['CircuitBoxNode'].DrawBackground = function(spriteBatch, drawRect, topDrawRect, color) end

---`Method Public Instance`
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
---@param drawPos Microsoft.Xna.Framework.Vector2
---@param color Microsoft.Xna.Framework.Color
_G['CircuitBoxNode'].Draw = function(spriteBatch, drawPos, color) end

---`Method Public Instance`
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
---@param camera Barotrauma.Camera
_G['CircuitBoxNode'].DrawHUD = function(spriteBatch, camera) end

---`Method Public Instance Virtual`
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
---@param rect Microsoft.Xna.Framework.RectangleF
---@param color Microsoft.Xna.Framework.Color
_G['CircuitBoxNode'].DrawHeader = function(spriteBatch, rect, color) end

---`Method Public Instance Virtual`
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
---@param rect Microsoft.Xna.Framework.RectangleF
---@param color Microsoft.Xna.Framework.Color
_G['CircuitBoxNode'].DrawBody = function(spriteBatch, rect, color) end

---`Method Public Instance`
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
---@param drawPos Microsoft.Xna.Framework.Vector2
_G['CircuitBoxNode'].DrawConnectors = function(spriteBatch, drawPos) end

---`Method Public Instance`
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
---@param color Microsoft.Xna.Framework.Color
_G['CircuitBoxNode'].DrawSelection = function(spriteBatch, color) end

---`Method Public Static`
---@param rect Microsoft.Xna.Framework.RectangleF
---@param overridePos Microsoft.Xna.Framework.Vector2
---@param originalPos Microsoft.Xna.Framework.Vector2
---@return Microsoft.Xna.Framework.RectangleF
_G['CircuitBoxNode'].OverrideRectLocation = function(rect, overridePos, originalPos) end

---`Method Public Instance`
---@param directions Barotrauma.CircuitBoxResizeDirection
---@param amount Microsoft.Xna.Framework.Vector2
---@return System.ValueTuple*1Microsoft*Xna*Framework*Vector2*1Microsoft*Xna*Framework*Vector2
_G['CircuitBoxNode'].ResizeBy = function(directions, amount) end

---`Method Public Instance`
---@param newSize Microsoft.Xna.Framework.Vector2
---@param newPos Microsoft.Xna.Framework.Vector2
_G['CircuitBoxNode'].ApplyResize = function(newSize, newPos) end

---`Method Public Static`
---@param conns (System.Collections.Generic.IReadOnlyList*1Barotrauma*CircuitBoxConnection)|(Barotrauma.CircuitBoxConnection[])
---@return Microsoft.Xna.Framework.Vector2
_G['CircuitBoxNode'].CalculateSize = function(conns) end

---`Method NonPublic Instance`
_G['CircuitBoxNode'].UpdatePositions = function() end

---`Constructor Public Instance`
---@overload fun(circuitBox:Barotrauma.Items.Components.CircuitBox):Barotrauma.CircuitBoxNode
---@return Barotrauma.CircuitBoxNode
_G['CircuitBoxNode'] = function() end

---`Constructor Public Instance`
---@overload fun(circuitBox:Barotrauma.Items.Components.CircuitBox):Barotrauma.CircuitBoxNode
---@return Barotrauma.CircuitBoxNode
_G['CircuitBoxNode'].__new = function() end

---`Constructor Private Static`
---@overload fun(circuitBox:Barotrauma.Items.Components.CircuitBox):Barotrauma.CircuitBoxNode
---@return Barotrauma.CircuitBoxNode
_G['CircuitBoxNode'] = function() end

---`Constructor Private Static`
---@overload fun(circuitBox:Barotrauma.Items.Components.CircuitBox):Barotrauma.CircuitBoxNode
---@return Barotrauma.CircuitBoxNode
_G['CircuitBoxNode'].__new = function() end

