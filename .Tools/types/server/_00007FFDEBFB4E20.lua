---@meta
---@class Barotrauma.CircuitBoxConnection : System.Object
---`Field Public Instance`
---@field Connection Barotrauma.Items.Components.Connection
---`Field Public Instance`
---@field Rect Microsoft.Xna.Framework.RectangleF
---`Field Private Instance`
---@field position Microsoft.Xna.Framework.Vector2
---`Field Public Instance`
---@field ExternallyConnectedFrom (System.Collections.Generic.List*1Barotrauma*CircuitBoxConnection)|(Barotrauma.CircuitBoxConnection[])
---`Field Public Instance`
---@field CircuitBox Barotrauma.Items.Components.CircuitBox
---`Field Public Static`
---@field Size System.Single
---`Getter Public Instance`
---@field Name System.String
---`Getter Public Instance Abstract Virtual`
---@field IsOutput System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Position Microsoft.Xna.Framework.Vector2
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field Length System.Single
---`Getter Public Instance`
---@field AnchorPoint Microsoft.Xna.Framework.Vector2
_G['CircuitBoxConnection'] = {}

---`Method Private Instance`
---@param circuitBox Barotrauma.Items.Components.CircuitBox
_G['CircuitBoxConnection'].InitProjSpecific = function(circuitBox) end

---`Method Public Instance Abstract Virtual`
---@param signal Barotrauma.Items.Components.Signal
_G['CircuitBoxConnection'].ReceiveSignal = function(signal) end

---`Method Public Instance`
---@param pos Microsoft.Xna.Framework.Vector2
---@return System.Boolean
_G['CircuitBoxConnection'].Contains = function(pos) end

---`Constructor NonPublic Instance`
---@overload fun(position:Microsoft.Xna.Framework.Vector2, connection:Barotrauma.Items.Components.Connection, circuitBox:Barotrauma.Items.Components.CircuitBox):Barotrauma.CircuitBoxConnection
---@return Barotrauma.CircuitBoxConnection
_G['CircuitBoxConnection'] = function() end

---`Constructor NonPublic Instance`
---@overload fun(position:Microsoft.Xna.Framework.Vector2, connection:Barotrauma.Items.Components.Connection, circuitBox:Barotrauma.Items.Components.CircuitBox):Barotrauma.CircuitBoxConnection
---@return Barotrauma.CircuitBoxConnection
_G['CircuitBoxConnection'].__new = function() end

---`Constructor Private Static`
---@overload fun(position:Microsoft.Xna.Framework.Vector2, connection:Barotrauma.Items.Components.Connection, circuitBox:Barotrauma.Items.Components.CircuitBox):Barotrauma.CircuitBoxConnection
---@return Barotrauma.CircuitBoxConnection
_G['CircuitBoxConnection'] = function() end

---`Constructor Private Static`
---@overload fun(position:Microsoft.Xna.Framework.Vector2, connection:Barotrauma.Items.Components.Connection, circuitBox:Barotrauma.Items.Components.CircuitBox):Barotrauma.CircuitBoxConnection
---@return Barotrauma.CircuitBoxConnection
_G['CircuitBoxConnection'].__new = function() end

