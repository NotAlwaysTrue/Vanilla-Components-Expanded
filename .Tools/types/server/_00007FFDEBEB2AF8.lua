---@meta
---@class Barotrauma.GameScreen : Barotrauma.Screen
---`Field Private Instance`
---@field updateLock System.Object
---`Field Private Instance`
---@field physicsTime System.Double
---`Getter Public Instance Virtual`
---@field Cam Barotrauma.Camera
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field GameTime System.Double
_G['GameScreen'] = {}

---`Method Public Instance Virtual`
_G['GameScreen'].Select = function() end

---`Method Public Instance Virtual`
_G['GameScreen'].Deselect = function() end

---`Method Public Instance Virtual`
---@param deltaTime System.Double
_G['GameScreen'].Update = function(deltaTime) end

---`Method Private Instance`
_G['GameScreen'].ExecutePhysics = function() end

---`Constructor Public Instance`
---@return Barotrauma.GameScreen
_G['GameScreen'] = function() end

---`Constructor Public Instance`
---@return Barotrauma.GameScreen
_G['GameScreen'].__new = function() end

