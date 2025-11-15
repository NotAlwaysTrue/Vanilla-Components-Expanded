---@meta
---@class Barotrauma.GUIContextMenu : Barotrauma.GUIComponent
---`Field Private Instance`
---@field Options (System.Collections.Generic.Dictionary*1Barotrauma*ContextMenuOption*1Barotrauma*GUITextBlock)|({[Barotrauma.ContextMenuOption]:(Barotrauma.GUITextBlock)})
---`Field Private Instance`
---@field SubMenu Barotrauma.GUIContextMenu
---`Field Public Instance`
---@field HeaderLabel Barotrauma.GUITextBlock
---`Field Public Instance`
---@field ParentOption Barotrauma.GUITextBlock
---`Field Public Static`
---@field CurrentContextMenu Barotrauma.GUIContextMenu
_G['GUI']['ContextMenu'] = {}

---`Method Public Static`
---@overload fun(...:Barotrauma.ContextMenuOption):(Barotrauma.GUIContextMenu)
---@param pos System.Nullable*1Microsoft*Xna*Framework*Vector2
---@param header Barotrauma.LocalizedString
---@param headerColor System.Nullable*1Microsoft*Xna*Framework*Color
---@param ... Barotrauma.ContextMenuOption
---@return Barotrauma.GUIContextMenu
_G['GUI']['ContextMenu'].CreateContextMenu = function(pos, header, headerColor, ...) end

---`Method Private Instance`
---@param _ Barotrauma.GUIComponent
---@param data System.Object
---@return System.Boolean
_G['GUI']['ContextMenu'].OnSelected = function(_, data) end

---`Method Private Instance`
---@param size Microsoft.Xna.Framework.Point-ref
---@param label Barotrauma.LocalizedString
---@param font Barotrauma.ScalableFont
---@return Microsoft.Xna.Framework.Vector2
_G['GUI']['ContextMenu'].InflateSize = function(size, label, font) end

---`Method NonPublic Instance Virtual`
---@param deltaTime System.Single
_G['GUI']['ContextMenu'].Update = function(deltaTime) end

---`Method Private Instance`
---@return System.Boolean
_G['GUI']['ContextMenu'].IsMouseOver = function() end

---`Method Public Instance Virtual`
---@param ignoreChildren? System.Boolean
---@param order? System.Int32
_G['GUI']['ContextMenu'].AddToGUIUpdateList = function(ignoreChildren, order) end

---`Method Public Static`
_G['GUI']['ContextMenu'].AddActiveToGUIUpdateList = function() end

---`Constructor Public Instance`
---@param position System.Nullable*1Microsoft*Xna*Framework*Vector2
---@param header Barotrauma.LocalizedString
---@param style System.String
---@param ... Barotrauma.ContextMenuOption
---@return Barotrauma.GUIContextMenu
_G['GUI']['ContextMenu'] = function(position, header, style, ...) end

---`Constructor Public Instance`
---@param position System.Nullable*1Microsoft*Xna*Framework*Vector2
---@param header Barotrauma.LocalizedString
---@param style System.String
---@param ... Barotrauma.ContextMenuOption
---@return Barotrauma.GUIContextMenu
_G['GUI']['ContextMenu'].__new = function(position, header, style, ...) end

