---@meta
---@class Barotrauma.SwappableItem : System.Object
---`Field Public Instance`
---@field CanBeBought System.Boolean
---`Field Public Instance`
---@field ReplacementOnUninstall Barotrauma.Identifier
---`Field Public Instance`
---@field SpawnWithId System.String
---`Field Public Instance`
---@field SwapIdentifier System.String
---`Field Public Instance`
---@field SwapOrigin Microsoft.Xna.Framework.Vector2
---`Field Public Instance`
---@field ConnectedItemsToSwap (System.Collections.Generic.List*1System*ValueTuple*2Barotrauma*Identifier*2Barotrauma*Identifier)|(System.ValueTuple*1Barotrauma*Identifier*1Barotrauma*Identifier[])
---`Field Public Instance`
---@field SchematicSprite Barotrauma.Sprite
---`Getter Public Instance`
---@field BasePrice System.Int32
_G['SwappableItem'] = {}

---`Method Public Instance`
---@param location? Barotrauma.Location
---@return System.Int32
_G['SwappableItem'].GetPrice = function(location) end

---`Constructor Public Instance`
---@param element Barotrauma.ContentXElement
---@return Barotrauma.SwappableItem
_G['SwappableItem'] = function(element) end

---`Constructor Public Instance`
---@param element Barotrauma.ContentXElement
---@return Barotrauma.SwappableItem
_G['SwappableItem'].__new = function(element) end

