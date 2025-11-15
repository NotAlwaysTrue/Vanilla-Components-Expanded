---@meta
---@class Barotrauma.GUIDragHandle : Barotrauma.GUIComponent
---`Field Private Instance`
---@field elementToMove Barotrauma.RectTransform
---`Field Private Instance`
---@field originalOffset Microsoft.Xna.Framework.Point
---`Field Private Instance`
---@field dragStart Microsoft.Xna.Framework.Vector2
---`Field Private Instance`
---@field dragStarted System.Boolean
---`Field Public Instance`
---@field DragArea Microsoft.Xna.Framework.Rectangle
---`Field Public Instance`
---@field ValidatePosition (System.Func*1Barotrauma*RectTransform*1System*Boolean)|(fun(arg:Barotrauma.RectTransform):(System.Boolean))
---`Getter Public Instance`
---@field Dragging System.Boolean
_G['GUI']['DragHandle'] = {}

---`Method NonPublic Instance Virtual`
---@param deltaTime System.Single
_G['GUI']['DragHandle'].Update = function(deltaTime) end

---`Constructor Public Instance`
---@param rectT Barotrauma.RectTransform
---@param elementToMove Barotrauma.RectTransform
---@param style? System.String
---@return Barotrauma.GUIDragHandle
_G['GUI']['DragHandle'] = function(rectT, elementToMove, style) end

---`Constructor Public Instance`
---@param rectT Barotrauma.RectTransform
---@param elementToMove Barotrauma.RectTransform
---@param style? System.String
---@return Barotrauma.GUIDragHandle
_G['GUI']['DragHandle'].__new = function(rectT, elementToMove, style) end

