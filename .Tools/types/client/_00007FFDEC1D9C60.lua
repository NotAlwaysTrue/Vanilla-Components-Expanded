---@meta
---@class Barotrauma.Widget : System.Object
---`Field Public Instance`
---@field Shape Barotrauma.WidgetShape
---`Field Public Instance`
---@field Tooltip Barotrauma.LocalizedString
---`Field Public Instance`
---@field ShowTooltip System.Boolean
---`Field Public Instance`
---@field Size System.Int32
---`Field Public Instance`
---@field Thickness System.Single
---`Field Public Instance`
---@field Sides System.Int32
---`Field Public Instance`
---@field IsFilled System.Boolean
---`Field Public Instance`
---@field InputAreaMargin System.Int32
---`Field Public Instance`
---@field Color Microsoft.Xna.Framework.Color
---`Field Public Instance`
---@field SecondaryColor System.Nullable*1Microsoft*Xna*Framework*Color
---`Field Public Instance`
---@field TextColor Microsoft.Xna.Framework.Color
---`Field Public Instance`
---@field TextBackgroundColor Microsoft.Xna.Framework.Color
---`Field Public Instance`
---@field Id System.String
---`Field Private Instance`
---@field Selected (System.Action)|(fun())
---`Field Private Instance`
---@field Deselected (System.Action)|(fun())
---`Field Private Instance`
---@field Hovered (System.Action)|(fun())
---`Field Private Instance`
---@field MouseUp (System.Action)|(fun())
---`Field Private Instance`
---@field MouseDown (System.Action)|(fun())
---`Field Private Instance`
---@field MouseHeld (System.Action*1System*Single)|(fun(obj:System.Single))
---`Field Private Instance`
---@field PreUpdate (System.Action*1System*Single)|(fun(obj:System.Single))
---`Field Private Instance`
---@field PostUpdate (System.Action*1System*Single)|(fun(obj:System.Single))
---`Field Private Instance`
---@field PreDraw (System.Action*1Microsoft*Xna*Framework*Graphics*SpriteBatch*1System*Single)|(fun(arg1:Microsoft.Xna.Framework.Graphics.SpriteBatch, arg2:System.Single))
---`Field Private Instance`
---@field PostDraw (System.Action*1Microsoft*Xna*Framework*Graphics*SpriteBatch*1System*Single)|(fun(arg1:Microsoft.Xna.Framework.Graphics.SpriteBatch, arg2:System.Single))
---`Field Public Instance`
---@field RequireMouseOn System.Boolean
---`Field Public Instance`
---@field Refresh (System.Action)|(fun())
---`Field Public Instance`
---@field Data System.Object
---`Field Private Instance`
---@field enabled System.Boolean
---`Field Public Instance`
---@field TooltipOffset System.Nullable*1Microsoft*Xna*Framework*Vector2
---`Field Public Instance`
---@field LinkedWidget Barotrauma.Widget
---`Field Private Static`
---@field multiselect System.Boolean
---`Field Public Static`
---@field SelectedWidgets (System.Collections.Generic.List*1Barotrauma*Widget)|(Barotrauma.Widget[])
---`Getter Public Instance`
---@field DrawRect Microsoft.Xna.Framework.Rectangle
---`Getter Public Instance`
---@field InputRect Microsoft.Xna.Framework.Rectangle
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field DrawPos Microsoft.Xna.Framework.Vector2
---`Getter Public Instance`
---@field IsSelected System.Boolean
---`Getter Public Instance`
---@field IsControlled System.Boolean
---`Getter Public Instance`
---@field IsMouseOver System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Enabled System.Boolean
---`Getter Public Static`
---<br/>`Setter Public Static`
---@field EnableMultiSelect System.Boolean
_G['Widget'] = {}

---`Method Public Instance Virtual`
---@param deltaTime System.Single
_G['Widget'].Update = function(deltaTime) end

---`Method Public Instance Virtual`
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
---@param deltaTime System.Single
_G['Widget'].Draw = function(spriteBatch, deltaTime) end

---`Constructor Public Instance`
---@overload fun(id:System.String, size:System.Int32, shape:Barotrauma.WidgetShape):Barotrauma.Widget
---@return Barotrauma.Widget
_G['Widget'] = function() end

---`Constructor Public Instance`
---@overload fun(id:System.String, size:System.Int32, shape:Barotrauma.WidgetShape):Barotrauma.Widget
---@return Barotrauma.Widget
_G['Widget'].__new = function() end

---`Constructor Private Static`
---@overload fun(id:System.String, size:System.Int32, shape:Barotrauma.WidgetShape):Barotrauma.Widget
---@return Barotrauma.Widget
_G['Widget'] = function() end

---`Constructor Private Static`
---@overload fun(id:System.String, size:System.Int32, shape:Barotrauma.WidgetShape):Barotrauma.Widget
---@return Barotrauma.Widget
_G['Widget'].__new = function() end

