---@meta
---@class Barotrauma.PlayerInput : System.Object
---`Field Private Static`
---@field mouseState Microsoft.Xna.Framework.Input.MouseState
---`Field Private Static`
---@field oldMouseState Microsoft.Xna.Framework.Input.MouseState
---`Field Private Static`
---@field latestMouseState Microsoft.Xna.Framework.Input.MouseState
---`Field Private Static`
---@field keyboardState Microsoft.Xna.Framework.Input.KeyboardState
---`Field Private Static`
---@field oldKeyboardState Microsoft.Xna.Framework.Input.KeyboardState
---`Field Private Static`
---@field timeSincePrimaryClick System.Double
---`Field Private Static`
---@field lastPrimaryClickPosition Microsoft.Xna.Framework.Point
---`Field Private Static`
---@field timeSinceSecondaryClick System.Double
---`Field Private Static`
---@field lastSecondaryClickPosition Microsoft.Xna.Framework.Point
---`Field Private Static`
---@field primaryDoubleClicked System.Boolean
---`Field Private Static`
---@field secondaryDoubleClicked System.Boolean
---`Field Private Static`
---@field allowInput System.Boolean
---`Field Private Static`
---@field wasWindowActive System.Boolean
---`Field Public Static`
---@field NumberKeys (System.Collections.Generic.List*1Microsoft*Xna*Framework*Input*Keys)|(Microsoft.Xna.Framework.Input.Keys[])
---`Field Public Static`
---@field PrimaryMouseLabel Barotrauma.LocalizedString
---`Field Public Static`
---@field SecondaryMouseLabel Barotrauma.LocalizedString
---`Field Private Static`
---@field DoubleClickDelay System.Single
---`Field Private Static`
---@field SM_SWAPBUTTON System.Int32
---`Getter Public Static`
---@field MaxDoubleClickDistance System.Single
---`Getter Public Static`
---@field MousePosition Microsoft.Xna.Framework.Vector2
---`Getter Public Static`
---@field LatestMousePosition Microsoft.Xna.Framework.Vector2
---`Getter Public Static`
---@field MouseInsideWindow System.Boolean
---`Getter Public Static`
---@field MouseSpeed Microsoft.Xna.Framework.Vector2
---`Getter Private Static`
---@field AllowInput System.Boolean
---`Getter Public Static`
---<br/>`Setter Private Static`
---@field MouseSpeedPerSecond Microsoft.Xna.Framework.Vector2
---`Getter Public Static`
---@field GetKeyboardState Microsoft.Xna.Framework.Input.KeyboardState
---`Getter Public Static`
---@field GetOldKeyboardState Microsoft.Xna.Framework.Input.KeyboardState
---`Getter Public Static`
---@field ScrollWheelSpeed System.Int32
_G['PlayerInput'] = {}

---`Method Private Static`
---@param smIndex System.Int32
---@return System.Int32
_G['PlayerInput'].GetSystemMetrics = function(smIndex) end

---`Method Public Static`
---@return System.Boolean
_G['PlayerInput'].MouseButtonsSwapped = function() end

---`Method Public Static`
---@return System.Boolean
_G['PlayerInput'].PrimaryMouseButtonHeld = function() end

---`Method Public Static`
---@return System.Boolean
_G['PlayerInput'].PrimaryMouseButtonDown = function() end

---`Method Public Static`
---@return System.Boolean
_G['PlayerInput'].PrimaryMouseButtonReleased = function() end

---`Method Public Static`
---@return System.Boolean
_G['PlayerInput'].PrimaryMouseButtonClicked = function() end

---`Method Public Static`
---@return System.Boolean
_G['PlayerInput'].SecondaryMouseButtonHeld = function() end

---`Method Public Static`
---@return System.Boolean
_G['PlayerInput'].SecondaryMouseButtonDown = function() end

---`Method Public Static`
---@return System.Boolean
_G['PlayerInput'].SecondaryMouseButtonReleased = function() end

---`Method Public Static`
---@return System.Boolean
_G['PlayerInput'].SecondaryMouseButtonClicked = function() end

---`Method Public Static`
---@return System.Boolean
_G['PlayerInput'].MidButtonClicked = function() end

---`Method Public Static`
---@return System.Boolean
_G['PlayerInput'].MidButtonHeld = function() end

---`Method Public Static`
---@return System.Boolean
_G['PlayerInput'].Mouse4ButtonClicked = function() end

---`Method Public Static`
---@return System.Boolean
_G['PlayerInput'].Mouse4ButtonHeld = function() end

---`Method Public Static`
---@return System.Boolean
_G['PlayerInput'].Mouse5ButtonClicked = function() end

---`Method Public Static`
---@return System.Boolean
_G['PlayerInput'].Mouse5ButtonHeld = function() end

---`Method Public Static`
---@return System.Boolean
_G['PlayerInput'].MouseWheelUpClicked = function() end

---`Method Public Static`
---@return System.Boolean
_G['PlayerInput'].MouseWheelDownClicked = function() end

---`Method Public Static`
---@return System.Boolean
_G['PlayerInput'].DoubleClicked = function() end

---`Method Public Static`
---@return System.Boolean
_G['PlayerInput'].SecondaryDoubleClicked = function() end

---`Method Public Static`
---@overload fun(inputType:Barotrauma.InputType):(System.Boolean)
---@param button Microsoft.Xna.Framework.Input.Keys
---@return System.Boolean
_G['PlayerInput'].KeyHit = function(button) end

---`Method Public Static`
---@overload fun(inputType:Barotrauma.InputType):(System.Boolean)
---@param button Microsoft.Xna.Framework.Input.Keys
---@return System.Boolean
_G['PlayerInput'].KeyDown = function(button) end

---`Method Public Static`
---@overload fun(inputType:Barotrauma.InputType):(System.Boolean)
---@param button Microsoft.Xna.Framework.Input.Keys
---@return System.Boolean
_G['PlayerInput'].KeyUp = function(button) end

---`Method Public Static`
---@param index System.Int32
---@return System.Boolean
_G['PlayerInput'].InventoryKeyHit = function(index) end

---`Method Public Static`
---@return System.Boolean
_G['PlayerInput'].IsShiftDown = function() end

---`Method Public Static`
---@return System.Boolean
_G['PlayerInput'].IsCtrlDown = function() end

---`Method Public Static`
---@return System.Boolean
_G['PlayerInput'].IsAltDown = function() end

---`Method Public Static`
---@param deltaTime System.Double
_G['PlayerInput'].Update = function(deltaTime) end

---`Method Public Static`
_G['PlayerInput'].UpdateVariable = function() end

---`Constructor Public Instance`
---@overload fun():Barotrauma.PlayerInput
---@return Barotrauma.PlayerInput
_G['PlayerInput'] = function() end

---`Constructor Public Instance`
---@overload fun():Barotrauma.PlayerInput
---@return Barotrauma.PlayerInput
_G['PlayerInput'].__new = function() end

---`Constructor Private Static`
---@overload fun():Barotrauma.PlayerInput
---@return Barotrauma.PlayerInput
_G['PlayerInput'] = function() end

---`Constructor Private Static`
---@overload fun():Barotrauma.PlayerInput
---@return Barotrauma.PlayerInput
_G['PlayerInput'].__new = function() end

