---@meta
---@class Barotrauma.TestScreen : Barotrauma.EditorScreen
---`Field Private Instance`
---@field miniMapItem Barotrauma.Item
---`Field Public Instance`
---@field TabMenu Barotrauma.TabMenu
---`Field Public Static`
---@field dummyCharacter Barotrauma.Character
---`Field Public Static`
---@field BlueprintEffect Microsoft.Xna.Framework.Graphics.Effect
---`Getter Public Instance Virtual`
---@field Cam Barotrauma.Camera
_G['TestScreen'] = {}

---`Method Public Instance Virtual`
_G['TestScreen'].Select = function() end

---`Method Public Instance Virtual`
_G['TestScreen'].AddToGUIUpdateList = function() end

---`Method Public Instance Virtual`
---@param deltaTime System.Double
_G['TestScreen'].Update = function(deltaTime) end

---`Method Public Instance Virtual`
---@param deltaTime System.Double
---@param graphics Microsoft.Xna.Framework.Graphics.GraphicsDevice
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
_G['TestScreen'].Draw = function(deltaTime, graphics, spriteBatch) end

---`Constructor Public Instance`
---@return Barotrauma.TestScreen
_G['TestScreen'] = function() end

---`Constructor Public Instance`
---@return Barotrauma.TestScreen
_G['TestScreen'].__new = function() end

