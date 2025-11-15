---@meta
---@class Barotrauma.CircuitBoxWire : Barotrauma.CircuitBoxSelectable
---`Field Public Instance`
---@field Renderer Barotrauma.CircuitBoxWireRenderer
---`Field Public Instance`
---@field From Barotrauma.CircuitBoxConnection
---`Field Public Instance`
---@field To Barotrauma.CircuitBoxConnection
---`Field Public Instance`
---@field BackingWire Barotrauma.Option*1Barotrauma*Item
---`Field Public Instance`
---@field Color Microsoft.Xna.Framework.Color
---`Field Public Instance`
---@field UsedItemPrefab Barotrauma.ItemPrefab
---`Field Public Static`
---@field SelectedWirePrefab Barotrauma.ItemPrefab
---`Field Public Static`
---@field DefaultWireColor Microsoft.Xna.Framework.Color
---`Getter Public Instance Virtual`
---@field ID System.UInt16
---`Getter Public Static`
---@field DefaultWirePrefab Barotrauma.ItemPrefab
_G['CircuitBoxWire'] = {}

---`Method Public Instance`
_G['CircuitBoxWire'].Update = function() end

---`Method Public Instance`
---@return System.Xml.Linq.XElement
_G['CircuitBoxWire'].Save = function() end

---`Method Public Static`
---@param element Barotrauma.ContentXElement
---@param circuitBox Barotrauma.Items.Components.CircuitBox
---@return Barotrauma.Option*1Barotrauma*CircuitBoxWire
_G['CircuitBoxWire'].TryLoadFromXML = function(element, circuitBox) end

---`Method Public Instance`
_G['CircuitBoxWire'].EnsureWireConnected = function() end

---`Method Public Instance`
_G['CircuitBoxWire'].Remove = function() end

---`Constructor Public Instance`
---@overload fun(circuitBox:Barotrauma.Items.Components.CircuitBox, Id:System.UInt16, backingItem:Barotrauma.Option*1Barotrauma*Item, from:Barotrauma.CircuitBoxConnection, to:Barotrauma.CircuitBoxConnection, prefab:Barotrauma.ItemPrefab):Barotrauma.CircuitBoxWire
---@return Barotrauma.CircuitBoxWire
_G['CircuitBoxWire'] = function() end

---`Constructor Public Instance`
---@overload fun(circuitBox:Barotrauma.Items.Components.CircuitBox, Id:System.UInt16, backingItem:Barotrauma.Option*1Barotrauma*Item, from:Barotrauma.CircuitBoxConnection, to:Barotrauma.CircuitBoxConnection, prefab:Barotrauma.ItemPrefab):Barotrauma.CircuitBoxWire
---@return Barotrauma.CircuitBoxWire
_G['CircuitBoxWire'].__new = function() end

---`Constructor Private Static`
---@overload fun(circuitBox:Barotrauma.Items.Components.CircuitBox, Id:System.UInt16, backingItem:Barotrauma.Option*1Barotrauma*Item, from:Barotrauma.CircuitBoxConnection, to:Barotrauma.CircuitBoxConnection, prefab:Barotrauma.ItemPrefab):Barotrauma.CircuitBoxWire
---@return Barotrauma.CircuitBoxWire
_G['CircuitBoxWire'] = function() end

---`Constructor Private Static`
---@overload fun(circuitBox:Barotrauma.Items.Components.CircuitBox, Id:System.UInt16, backingItem:Barotrauma.Option*1Barotrauma*Item, from:Barotrauma.CircuitBoxConnection, to:Barotrauma.CircuitBoxConnection, prefab:Barotrauma.ItemPrefab):Barotrauma.CircuitBoxWire
---@return Barotrauma.CircuitBoxWire
_G['CircuitBoxWire'].__new = function() end

