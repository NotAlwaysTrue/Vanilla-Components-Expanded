---@meta
---@class Barotrauma.TutorialMode : Barotrauma.GameMode
---`Field Public Instance`
---@field Tutorial Barotrauma.Tutorials.Tutorial
---`Getter Public Instance Virtual`
---@field Paused System.Boolean
_G['TutorialMode'] = {}

---`Method Public Instance Virtual`
_G['TutorialMode'].Start = function() end

---`Method Public Instance Virtual`
---@param deltaTime System.Single
_G['TutorialMode'].Update = function(deltaTime) end

---`Constructor Public Instance`
---@param preset Barotrauma.GameModePreset
---@return Barotrauma.TutorialMode
_G['TutorialMode'] = function(preset) end

---`Constructor Public Instance`
---@param preset Barotrauma.GameModePreset
---@return Barotrauma.TutorialMode
_G['TutorialMode'].__new = function(preset) end

