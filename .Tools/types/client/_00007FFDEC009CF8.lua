---@meta
---@class Barotrauma.Screen : System.Object
---`Field Public Instance`
---@field Frame Barotrauma.GUIFrame
---`Getter Public Static`
---<br/>`Setter Private Static`
---@field Selected Barotrauma.Screen
---`Getter Public Instance Virtual`
---@field Cam Barotrauma.Camera
---`Getter Public Instance Virtual`
---@field IsEditor System.Boolean
_G['GUI']['Screen'] = {}

---`Method Public Instance Virtual`
_G['GUI']['Screen'].AddToGUIUpdateList = function() end

---`Method Public Instance Virtual`
---@param deltaTime System.Double
---@param graphics Microsoft.Xna.Framework.Graphics.GraphicsDevice
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
_G['GUI']['Screen'].Draw = function(deltaTime, graphics, spriteBatch) end

---`Method Public Instance`
---@param from Microsoft.Xna.Framework.Color
---@param to Microsoft.Xna.Framework.Color
---@param duration System.Single
_G['GUI']['Screen'].ColorFade = function(from, to, duration) end

---`Method Private Instance`
---@param from Microsoft.Xna.Framework.Color
---@param to Microsoft.Xna.Framework.Color
---@param duration System.Single
---@return (System.Collections.Generic.IEnumerable*1Barotrauma*CoroutineStatus)|(fun():(Barotrauma.CoroutineStatus))
_G['GUI']['Screen'].UpdateColorFade = function(from, to, duration) end

---`Method Public Instance Virtual`
---@param filePath System.String
---@param extension System.String
_G['GUI']['Screen'].OnFileDropped = function(filePath, extension) end

---`Method Public Instance Virtual`
_G['GUI']['Screen'].Release = function() end

---`Method Public Static`
_G['GUI']['Screen'].SelectNull = function() end

---`Method Public Instance Virtual`
_G['GUI']['Screen'].Deselect = function() end

---`Method Public Instance Virtual`
_G['GUI']['Screen'].Select = function() end

---`Method Public Instance Virtual`
---@param deltaTime System.Double
_G['GUI']['Screen'].Update = function(deltaTime) end

---`Constructor NonPublic Instance`
---@return Barotrauma.Screen
_G['GUI']['Screen'] = function() end

---`Constructor NonPublic Instance`
---@return Barotrauma.Screen
_G['GUI']['Screen'].__new = function() end

