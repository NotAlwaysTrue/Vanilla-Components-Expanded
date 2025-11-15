---@meta
---@class Barotrauma.GUIScissorComponent : Barotrauma.GUIComponent
---`Field Public Instance`
---@field Content Barotrauma.GUIComponent
_G['GUI']['ScissorComponent'] = {}

---`Method Private Instance`
---@param rectT Barotrauma.RectTransform
_G['GUI']['ScissorComponent'].CheckForChildren = function(rectT) end

---`Method Public Instance Virtual`
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
---@param recursive System.Boolean
_G['GUI']['ScissorComponent'].DrawChildren = function(spriteBatch, recursive) end

---`Method NonPublic Instance Virtual`
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
_G['GUI']['ScissorComponent'].Draw = function(spriteBatch) end

---`Method NonPublic Instance Virtual`
---@param deltaTime System.Single
_G['GUI']['ScissorComponent'].Update = function(deltaTime) end

---`Method Private Static`
---@param child Barotrauma.GUIComponent
_G['GUI']['ScissorComponent'].ClampChildMouseRects = function(child) end

---`Method Public Instance Virtual`
---@param ignoreChildren? System.Boolean
---@param order? System.Int32
_G['GUI']['ScissorComponent'].AddToGUIUpdateList = function(ignoreChildren, order) end

---`Constructor Public Instance`
---@param rectT Barotrauma.RectTransform
---@return Barotrauma.GUIScissorComponent
_G['GUI']['ScissorComponent'] = function(rectT) end

---`Constructor Public Instance`
---@param rectT Barotrauma.RectTransform
---@return Barotrauma.GUIScissorComponent
_G['GUI']['ScissorComponent'].__new = function(rectT) end

