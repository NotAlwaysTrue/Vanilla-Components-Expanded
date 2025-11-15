---@meta
---@class Barotrauma.CircuitBoxComponent : Barotrauma.CircuitBoxNode
---`Field Private Instance`
---@field label System.Nullable*1Barotrauma*CircuitBoxLabel
---`Field Public Instance`
---@field Item Barotrauma.Item
---`Field Public Instance`
---@field UsedResource Barotrauma.ItemPrefab
---`Field Public Static`
---@field EditingHUD Barotrauma.Option*1Barotrauma*GUIComponent
---`Getter Private Instance`
---@field Sprite Barotrauma.Sprite
---`Getter Private Instance`
---@field Label Barotrauma.CircuitBoxLabel
---`Getter Public Instance Virtual`
---@field ID System.UInt16
_G['CircuitBoxComponent'] = {}

---`Method Public Instance`
---@param parent Barotrauma.RectTransform
_G['CircuitBoxComponent'].UpdateEditing = function(parent) end

---`Method Public Static`
_G['CircuitBoxComponent'].RemoveEditingHUD = function() end

---`Method Public Instance`
---@param parent Barotrauma.RectTransform
---@return Barotrauma.GUIComponent
_G['CircuitBoxComponent'].CreateEditingHUD = function(parent) end

---`Method Public Instance Virtual`
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
---@param drawRect Microsoft.Xna.Framework.RectangleF
---@param color Microsoft.Xna.Framework.Color
_G['CircuitBoxComponent'].DrawHeader = function(spriteBatch, drawRect, color) end

---`Method Public Static`
---@param element Barotrauma.ContentXElement
---@param circuitBox Barotrauma.Items.Components.CircuitBox
---@return Barotrauma.Option*1Barotrauma*CircuitBoxComponent
_G['CircuitBoxComponent'].TryLoadFromXML = function(element, circuitBox) end

---`Method Public Instance`
---@return System.Xml.Linq.XElement
_G['CircuitBoxComponent'].Save = function() end

---`Method Public Instance`
_G['CircuitBoxComponent'].Remove = function() end

---`Constructor Public Instance`
---@overload fun(id:System.UInt16, item:Barotrauma.Item, position:Microsoft.Xna.Framework.Vector2, circuitBox:Barotrauma.Items.Components.CircuitBox, usedResource:Barotrauma.ItemPrefab):Barotrauma.CircuitBoxComponent
---@return Barotrauma.CircuitBoxComponent
_G['CircuitBoxComponent'] = function() end

---`Constructor Public Instance`
---@overload fun(id:System.UInt16, item:Barotrauma.Item, position:Microsoft.Xna.Framework.Vector2, circuitBox:Barotrauma.Items.Components.CircuitBox, usedResource:Barotrauma.ItemPrefab):Barotrauma.CircuitBoxComponent
---@return Barotrauma.CircuitBoxComponent
_G['CircuitBoxComponent'].__new = function() end

---`Constructor Private Static`
---@overload fun(id:System.UInt16, item:Barotrauma.Item, position:Microsoft.Xna.Framework.Vector2, circuitBox:Barotrauma.Items.Components.CircuitBox, usedResource:Barotrauma.ItemPrefab):Barotrauma.CircuitBoxComponent
---@return Barotrauma.CircuitBoxComponent
_G['CircuitBoxComponent'] = function() end

---`Constructor Private Static`
---@overload fun(id:System.UInt16, item:Barotrauma.Item, position:Microsoft.Xna.Framework.Vector2, circuitBox:Barotrauma.Items.Components.CircuitBox, usedResource:Barotrauma.ItemPrefab):Barotrauma.CircuitBoxComponent
---@return Barotrauma.CircuitBoxComponent
_G['CircuitBoxComponent'].__new = function() end

