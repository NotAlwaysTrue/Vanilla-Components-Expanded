---@meta
---@class Barotrauma.HUDProgressBar : System.Object
---`Field Private Instance`
---@field progress System.Single
---`Field Public Instance`
---@field FadeTimer System.Single
---`Field Private Instance`
---@field fullColor Microsoft.Xna.Framework.Color
---`Field Private Instance`
---@field emptyColor Microsoft.Xna.Framework.Color
---`Field Private Instance`
---@field worldPosition Microsoft.Xna.Framework.Vector2
---`Field Public Instance`
---@field Size Microsoft.Xna.Framework.Vector2
---`Field Private Instance`
---@field parentSub Barotrauma.Submarine
---`Field Private Instance`
---@field textTag System.String
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Progress System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field WorldPosition Microsoft.Xna.Framework.Vector2
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field Text Barotrauma.LocalizedString
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field TextTag System.String
_G['HUDProgressBar'] = {}

---`Method Public Instance`
---@param deltatime System.Single
_G['HUDProgressBar'].Update = function(deltatime) end

---`Method Public Instance`
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
---@param cam Barotrauma.Camera
_G['HUDProgressBar'].Draw = function(spriteBatch, cam) end

---`Constructor Public Instance`
---@overload fun(worldPosition:Microsoft.Xna.Framework.Vector2, textTag:System.String, parentSubmarine?:Barotrauma.Submarine):Barotrauma.HUDProgressBar
---@param worldPosition Microsoft.Xna.Framework.Vector2
---@param parentSubmarine Barotrauma.Submarine
---@param emptyColor Microsoft.Xna.Framework.Color
---@param fullColor Microsoft.Xna.Framework.Color
---@param textTag System.String
---@return Barotrauma.HUDProgressBar
_G['HUDProgressBar'] = function(worldPosition, parentSubmarine, emptyColor, fullColor, textTag) end

---`Constructor Public Instance`
---@overload fun(worldPosition:Microsoft.Xna.Framework.Vector2, textTag:System.String, parentSubmarine?:Barotrauma.Submarine):Barotrauma.HUDProgressBar
---@param worldPosition Microsoft.Xna.Framework.Vector2
---@param parentSubmarine Barotrauma.Submarine
---@param emptyColor Microsoft.Xna.Framework.Color
---@param fullColor Microsoft.Xna.Framework.Color
---@param textTag System.String
---@return Barotrauma.HUDProgressBar
_G['HUDProgressBar'].__new = function(worldPosition, parentSubmarine, emptyColor, fullColor, textTag) end

