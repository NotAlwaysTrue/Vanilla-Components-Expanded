---@meta
---@class Barotrauma.CreditsPlayer : Barotrauma.GUIComponent
---`Field Private Instance`
---@field listBox Barotrauma.GUIListBox
---`Field Private Instance`
---@field configElement Barotrauma.ContentXElement
---`Field Private Instance`
---@field scrollSpeed System.Single
---`Field Public Instance`
---@field AutoRestart System.Boolean
---`Field Public Instance`
---@field CloseButton Barotrauma.GUIButton
---`Getter Public Instance`
---@field Finished System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field ScrollBarEnabled System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field AllowMouseWheelScroll System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Scroll System.Single
_G['GUI']['CreditsPlayer'] = {}

---`Method Private Instance`
_G['GUI']['CreditsPlayer'].Load = function() end

---`Method Public Instance`
_G['GUI']['CreditsPlayer'].Restart = function() end

---`Method NonPublic Instance Virtual`
---@param deltaTime System.Single
_G['GUI']['CreditsPlayer'].Update = function(deltaTime) end

---`Constructor Public Instance`
---@param rectT Barotrauma.RectTransform
---@param configFile System.String
---@return Barotrauma.CreditsPlayer
_G['GUI']['CreditsPlayer'] = function(rectT, configFile) end

---`Constructor Public Instance`
---@param rectT Barotrauma.RectTransform
---@param configFile System.String
---@return Barotrauma.CreditsPlayer
_G['GUI']['CreditsPlayer'].__new = function(rectT, configFile) end

