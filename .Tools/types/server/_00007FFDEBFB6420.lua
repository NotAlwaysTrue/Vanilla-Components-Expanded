---@meta
---@class Barotrauma.CircuitBoxNode : Barotrauma.CircuitBoxSelectable
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

