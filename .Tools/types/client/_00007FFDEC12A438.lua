---@meta
---@class Barotrauma.Items.Components.ItemLabel : Barotrauma.Items.Components.ItemComponent
---`Field Private Instance`
---@field textBlock Barotrauma.GUITextBlock
---`Field Private Instance`
---@field textColor Microsoft.Xna.Framework.Color
---`Field Private Instance`
---@field scrollAmount System.Single
---`Field Private Instance`
---@field scrollingText System.String
---`Field Private Instance`
---@field scrollPadding System.Single
---`Field Private Instance`
---@field scrollIndex System.Int32
---`Field Private Instance`
---@field needsScrolling System.Boolean
---`Field Private Instance`
---@field charWidths (System.Single-arr)|(System.Single[])
---`Field Private Instance`
---@field prevScale System.Single
---`Field Private Instance`
---@field prevRect Microsoft.Xna.Framework.Rectangle
---`Field Private Instance`
---@field sb System.Text.StringBuilder
---`Field Private Instance`
---@field padding Microsoft.Xna.Framework.Vector4
---`Field Private Instance`
---@field text System.String
---`Field Private Instance`
---@field ignoreLocalization System.Boolean
---`Field Private Instance`
---@field scrollable System.Boolean
---`Field Private Instance`
---@field parseSpecialTextTagOnStart System.Boolean
---`Field Private Instance`
---@field prevColorSignal System.String
---`Field Private Static`
---@field SpecialTextTags (System.String-arr)|(System.String[])
---`Field Private Static`
---@field BaseTextSize System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Padding Microsoft.Xna.Framework.Vector4
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Text System.String
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field IgnoreLocalization System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field DisplayText Barotrauma.LocalizedString
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field TextColor Microsoft.Xna.Framework.Color
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field TextScale System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Scrollable System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field ScrollSpeed System.Single
---`Getter Private Instance`
---@field TextBlock Barotrauma.GUITextBlock
---`Getter Private Instance`
---@field BaseToRealTextScaleFactor System.Single
---`Getter Public Instance Virtual`
---@field DrawSize Microsoft.Xna.Framework.Vector2
_G['Components']['ItemLabel'] = {}

---`Method Public Instance Virtual`
---@return (System.Collections.Generic.IEnumerable*1System*String)|(fun():(System.String))
_G['Components']['ItemLabel'].GetExtraTextPickerEntries = function() end

---`Method Private Instance`
_G['Components']['ItemLabel'].SetScrollingText = function() end

---`Method Private Instance`
---@param value System.String
_G['Components']['ItemLabel'].SetDisplayText = function(value) end

---`Method Private Instance`
_G['Components']['ItemLabel'].RecreateTextBlock = function() end

---`Method Private Instance`
_G['Components']['ItemLabel'].ParseSpecialTextTag = function() end

---`Method Public Instance Virtual`
---@param deltaTime System.Single
---@param cam Barotrauma.Camera
_G['Components']['ItemLabel'].Update = function(deltaTime, cam) end

---`Method Private Instance`
_G['Components']['ItemLabel'].UpdateScrollingText = function() end

---`Method Public Instance Virtual`
_G['Components']['ItemLabel'].OnScaleChanged = function() end

---`Method Public Instance Virtual`
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
---@param editing? System.Boolean
---@param itemDepth? System.Single
---@param overrideColor? System.Nullable*1Microsoft*Xna*Framework*Color
_G['Components']['ItemLabel'].Draw = function(spriteBatch, editing, itemDepth, overrideColor) end

---`Method Public Instance Virtual`
---@param msg Barotrauma.Networking.IReadMessage
---@param sendingTime System.Single
_G['Components']['ItemLabel'].ClientEventRead = function(msg, sendingTime) end

---`Method Public Instance Virtual`
---@param signal Barotrauma.Items.Components.Signal
---@param connection Barotrauma.Items.Components.Connection
_G['Components']['ItemLabel'].ReceiveSignal = function(signal, connection) end

---`Constructor Public Instance`
---@overload fun(item:Barotrauma.Item, element:Barotrauma.ContentXElement):Barotrauma.Items.Components.ItemLabel
---@return Barotrauma.Items.Components.ItemLabel
_G['Components']['ItemLabel'] = function() end

---`Constructor Public Instance`
---@overload fun(item:Barotrauma.Item, element:Barotrauma.ContentXElement):Barotrauma.Items.Components.ItemLabel
---@return Barotrauma.Items.Components.ItemLabel
_G['Components']['ItemLabel'].__new = function() end

---`Constructor Private Static`
---@overload fun(item:Barotrauma.Item, element:Barotrauma.ContentXElement):Barotrauma.Items.Components.ItemLabel
---@return Barotrauma.Items.Components.ItemLabel
_G['Components']['ItemLabel'] = function() end

---`Constructor Private Static`
---@overload fun(item:Barotrauma.Item, element:Barotrauma.ContentXElement):Barotrauma.Items.Components.ItemLabel
---@return Barotrauma.Items.Components.ItemLabel
_G['Components']['ItemLabel'].__new = function() end

