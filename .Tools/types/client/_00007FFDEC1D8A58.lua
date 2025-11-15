---@meta
---@class Barotrauma.SlideshowPlayer : Barotrauma.GUIComponent
---`Field Private Instance`
---@field slideshowPrefab Barotrauma.SlideshowPrefab
---`Field Private Instance`
---@field pressAnyKeyText Barotrauma.LocalizedString
---`Field Private Instance`
---@field state System.Int32
---`Field Private Instance`
---@field overlayColor Microsoft.Xna.Framework.Color
---`Field Private Instance`
---@field textColor Microsoft.Xna.Framework.Color
---`Field Private Instance`
---@field timer System.Single
---`Field Private Instance`
---@field currentText Barotrauma.LocalizedString
---`Getter Public Instance`
---@field LastTextShown System.Boolean
---`Getter Public Instance`
---@field Finished System.Boolean
_G['GUI']['SlideshowPlayer'] = {}

---`Method Public Instance`
_G['GUI']['SlideshowPlayer'].Restart = function() end

---`Method Public Instance`
_G['GUI']['SlideshowPlayer'].Finish = function() end

---`Method NonPublic Instance Virtual`
---@param deltaTime System.Single
_G['GUI']['SlideshowPlayer'].Update = function(deltaTime) end

---`Method Private Instance`
_G['GUI']['SlideshowPlayer'].RefreshText = function() end

---`Method NonPublic Instance Virtual`
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
_G['GUI']['SlideshowPlayer'].Draw = function(spriteBatch) end

---`Constructor Public Instance`
---@param rectT Barotrauma.RectTransform
---@param prefab Barotrauma.SlideshowPrefab
---@return Barotrauma.SlideshowPlayer
_G['GUI']['SlideshowPlayer'] = function(rectT, prefab) end

---`Constructor Public Instance`
---@param rectT Barotrauma.RectTransform
---@param prefab Barotrauma.SlideshowPrefab
---@return Barotrauma.SlideshowPlayer
_G['GUI']['SlideshowPlayer'].__new = function(rectT, prefab) end

