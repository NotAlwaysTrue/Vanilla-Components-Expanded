---@meta
---@class EventInput.KeyEventArgs : System.ValueType
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field KeyCode Microsoft.Xna.Framework.Input.Keys
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Character System.Char
_G['EventInput']['KeyEventArgs'] = {}

---`Method Public Instance Virtual`
---@return System.String
_G['EventInput']['KeyEventArgs'].ToString = function() end

---`Method Private Instance`
---@param builder System.Text.StringBuilder
---@return System.Boolean
_G['EventInput']['KeyEventArgs'].PrintMembers = function(builder) end

---`Method Public Instance Virtual`
---@return System.Int32
_G['EventInput']['KeyEventArgs'].GetHashCode = function() end

---`Method Public Instance Virtual`
---@overload fun(obj:System.Object):(System.Boolean)
---@param other EventInput.KeyEventArgs
---@return System.Boolean
_G['EventInput']['KeyEventArgs'].Equals = function(other) end

---`Method Public Instance`
---@param KeyCode Microsoft.Xna.Framework.Input.Keys-ref
---@param Character System.Char-ref
_G['EventInput']['KeyEventArgs'].Deconstruct = function(KeyCode, Character) end

---`Constructor Public Instance`
---@param KeyCode Microsoft.Xna.Framework.Input.Keys
---@param Character System.Char
---@return EventInput.KeyEventArgs
_G['EventInput']['KeyEventArgs'] = function(KeyCode, Character) end

---`Constructor Public Instance`
---@param KeyCode Microsoft.Xna.Framework.Input.Keys
---@param Character System.Char
---@return EventInput.KeyEventArgs
_G['EventInput']['KeyEventArgs'].__new = function(KeyCode, Character) end

