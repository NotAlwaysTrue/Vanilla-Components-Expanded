---@meta
---@class Barotrauma.CircuitBoxComponent : Barotrauma.CircuitBoxNode
---`Field Public Instance`
---@field Item Barotrauma.Item
---`Field Public Instance`
---@field UsedResource Barotrauma.ItemPrefab
---`Getter Public Instance Virtual`
---@field ID System.UInt16
_G['CircuitBoxComponent'] = {}

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
---@param id System.UInt16
---@param item Barotrauma.Item
---@param position Microsoft.Xna.Framework.Vector2
---@param circuitBox Barotrauma.Items.Components.CircuitBox
---@param usedResource Barotrauma.ItemPrefab
---@return Barotrauma.CircuitBoxComponent
_G['CircuitBoxComponent'] = function(id, item, position, circuitBox, usedResource) end

---`Constructor Public Instance`
---@param id System.UInt16
---@param item Barotrauma.Item
---@param position Microsoft.Xna.Framework.Vector2
---@param circuitBox Barotrauma.Items.Components.CircuitBox
---@param usedResource Barotrauma.ItemPrefab
---@return Barotrauma.CircuitBoxComponent
_G['CircuitBoxComponent'].__new = function(id, item, position, circuitBox, usedResource) end

