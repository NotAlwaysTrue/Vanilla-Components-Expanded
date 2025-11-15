---@meta
---@class Barotrauma.CircuitBoxUI : System.Object
---`Field Private Instance`
---@field camera Barotrauma.Camera
---`Field Public Instance`
---@field CircuitBox Barotrauma.Items.Components.CircuitBox
---`Field Private Instance`
---@field componentMenuOpen System.Boolean
---`Field Private Instance`
---@field componentMenuOpenState System.Single
---`Field Private Instance`
---@field circuitComponent Barotrauma.GUICustomComponent
---`Field Private Instance`
---@field componentMenu Barotrauma.GUIFrame
---`Field Private Instance`
---@field toggleMenuButton Barotrauma.GUIButton
---`Field Private Instance`
---@field selectedWireFrame Barotrauma.GUIFrame
---`Field Private Instance`
---@field componentList Barotrauma.GUIListBox
---`Field Private Instance`
---@field inventoryIndicatorText Barotrauma.GUITextBlock
---`Field Private Instance`
---@field cursorSprite Barotrauma.Sprite
---`Field Private Instance`
---@field selection Barotrauma.Option*1Microsoft*Xna*Framework*RectangleF
---`Field Private Instance`
---@field searchTerm System.String
---`Field Public Instance`
---@field MouseSnapshotHandler Barotrauma.CircuitBoxMouseDragSnapshotHandler
---`Field Public Instance`
---@field VirtualWires (System.Collections.Generic.List*1Barotrauma*CircuitBoxWireRenderer)|(Barotrauma.CircuitBoxWireRenderer[])
---`Field Private Instance`
---@field cursorPos Microsoft.Xna.Framework.Vector2
---`Field Private Static`
---@field gridSize Microsoft.Xna.Framework.Vector2
---`Field Public Static`
---@field DraggedWire Barotrauma.Option*1Barotrauma*CircuitBoxWireRenderer
---`Field Private Static`
---@field lineWidth System.Single
---`Field Private Static`
---@field lineBaseWidth System.Single
---`Getter Public Instance`
---@field Locked System.Boolean
_G['CircuitBoxUI'] = {}

---`Method Public Instance`
---@param parent Barotrauma.GUIFrame
_G['CircuitBoxUI'].CreateGUI = function(parent) end

---`Method Private Instance`
---@return System.String
_G['CircuitBoxUI'].GetInventoryText = function() end

---`Method Public Instance`
_G['CircuitBoxUI'].UpdateComponentList = function() end

---`Method Private Static`
---@param component Barotrauma.GUIComponent
---@param obj System.Object
---@return System.Boolean
_G['CircuitBoxUI'].SelectWire = function(component, obj) end

---`Method Private Static`
---@param prefab Barotrauma.ItemPrefab
---@param parent Barotrauma.RectTransform
_G['CircuitBoxUI'].CreateComponentElement = function(prefab, parent) end

---`Method Private Instance`
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
---@param screenRect Microsoft.Xna.Framework.Rectangle
_G['CircuitBoxUI'].DrawHUD = function(spriteBatch, screenRect) end

---`Method Private Instance`
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
---@param pos1 Microsoft.Xna.Framework.Vector2
---@param pos2 Microsoft.Xna.Framework.Vector2
---@param color Microsoft.Xna.Framework.Color
_G['CircuitBoxUI'].DrawSelection = function(spriteBatch, pos1, pos2, color) end

---`Method Public Static`
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
---@param rect Microsoft.Xna.Framework.RectangleF
---@param fillColor Microsoft.Xna.Framework.Color
---@param borderColor Microsoft.Xna.Framework.Color
_G['CircuitBoxUI'].DrawRectangleWithBorder = function(spriteBatch, rect, fillColor, borderColor) end

---`Method Private Static`
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
---@param rect Microsoft.Xna.Framework.RectangleF
---@param borderColor Microsoft.Xna.Framework.Color
_G['CircuitBoxUI'].DrawRectangleOnlyBorder = function(spriteBatch, rect, borderColor) end

---`Method Private Instance`
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
_G['CircuitBoxUI'].DrawCircuits = function(spriteBatch) end

---`Method Private Instance`
---@overload fun(node:Barotrauma.CircuitBoxNode):(Microsoft.Xna.Framework.Color)
---@overload fun(wire:Barotrauma.CircuitBoxWire):(Microsoft.Xna.Framework.Color)
---@param selectedBy System.UInt16
---@param isSelectedByMe System.Boolean
---@return Microsoft.Xna.Framework.Color
_G['CircuitBoxUI'].GetSelectionColor = function(selectedBy, isSelectedByMe) end

---`Method Public Instance`
---@return Microsoft.Xna.Framework.Vector2
_G['CircuitBoxUI'].GetCursorPosition = function() end

---`Method Public Instance`
---@return Barotrauma.Option*1Microsoft*Xna*Framework*Vector2
_G['CircuitBoxUI'].GetDragStart = function() end

---`Method Public Instance`
---@param deltaTime System.Single
_G['CircuitBoxUI'].Update = function(deltaTime) end

---`Method Public Instance`
---@param state System.Boolean
_G['CircuitBoxUI'].SetMenuVisibility = function(state) end

---`Method Private Instance`
_G['CircuitBoxUI'].UpdateSelection = function() end

---`Method Private Instance`
---@return System.Boolean
_G['CircuitBoxUI'].TrySelectComponentsUnderCursor = function() end

---`Method Private Instance`
_G['CircuitBoxUI'].OpenContextMenu = function() end

---`Method Public Instance`
---@param nodes (System.Collections.Immutable.ImmutableHashSet*1Barotrauma*CircuitBoxNode)|(Barotrauma.CircuitBoxNode[])
---@return Barotrauma.CircuitBoxNode
_G['CircuitBoxUI'].GetTopmostNode = function(nodes) end

---`Method Public Instance`
_G['CircuitBoxUI'].AddToGUIUpdateList = function() end

---`Constructor Public Instance`
---@overload fun(box:Barotrauma.Items.Components.CircuitBox):Barotrauma.CircuitBoxUI
---@return Barotrauma.CircuitBoxUI
_G['CircuitBoxUI'] = function() end

---`Constructor Public Instance`
---@overload fun(box:Barotrauma.Items.Components.CircuitBox):Barotrauma.CircuitBoxUI
---@return Barotrauma.CircuitBoxUI
_G['CircuitBoxUI'].__new = function() end

---`Constructor Private Static`
---@overload fun(box:Barotrauma.Items.Components.CircuitBox):Barotrauma.CircuitBoxUI
---@return Barotrauma.CircuitBoxUI
_G['CircuitBoxUI'] = function() end

---`Constructor Private Static`
---@overload fun(box:Barotrauma.Items.Components.CircuitBox):Barotrauma.CircuitBoxUI
---@return Barotrauma.CircuitBoxUI
_G['CircuitBoxUI'].__new = function() end

