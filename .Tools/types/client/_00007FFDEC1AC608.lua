---@meta
---@class Barotrauma.GUILayoutGroup : Barotrauma.GUIComponent
---`Field Private Instance`
---@field isHorizontal System.Boolean
---`Field Private Instance`
---@field stretch System.Boolean
---`Field Private Instance`
---@field absoluteSpacing System.Int32
---`Field Private Instance`
---@field relativeSpacing System.Single
---`Field Private Instance`
---@field childAnchor Barotrauma.Anchor
---`Field Private Instance`
---@field needsToRecalculate System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field IsHorizontal System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Stretch System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field AbsoluteSpacing System.Int32
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field RelativeSpacing System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field ChildAnchor Barotrauma.Anchor
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field NeedsToRecalculate System.Boolean
_G['GUI']['LayoutGroup'] = {}

---`Method Public Instance`
_G['GUI']['LayoutGroup'].Recalculate = function() end

---`Method NonPublic Instance Virtual`
---@param deltaTime System.Single
_G['GUI']['LayoutGroup'].Update = function(deltaTime) end

---`Method Public Instance Virtual`
_G['GUI']['LayoutGroup'].ForceLayoutRecalculation = function() end

---`Constructor Public Instance`
---@param rectT Barotrauma.RectTransform
---@param isHorizontal? System.Boolean
---@param childAnchor? Barotrauma.Anchor
---@return Barotrauma.GUILayoutGroup
_G['GUI']['LayoutGroup'] = function(rectT, isHorizontal, childAnchor) end

---`Constructor Public Instance`
---@param rectT Barotrauma.RectTransform
---@param isHorizontal? System.Boolean
---@param childAnchor? Barotrauma.Anchor
---@return Barotrauma.GUILayoutGroup
_G['GUI']['LayoutGroup'].__new = function(rectT, isHorizontal, childAnchor) end

