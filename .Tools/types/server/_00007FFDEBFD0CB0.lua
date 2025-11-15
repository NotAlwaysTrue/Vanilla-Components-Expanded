---@meta
---@class Barotrauma.TraitorManager.ActiveTraitorEvent : System.ValueType
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Traitor Barotrauma.Networking.Client
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field TraitorEvent Barotrauma.TraitorEvent
_G['TraitorManager']['ActiveTraitorEvent'] = {}

---`Method Public Instance Virtual`
---@return System.String
_G['TraitorManager']['ActiveTraitorEvent'].ToString = function() end

---`Method Private Instance`
---@param builder System.Text.StringBuilder
---@return System.Boolean
_G['TraitorManager']['ActiveTraitorEvent'].PrintMembers = function(builder) end

---`Method Public Instance Virtual`
---@return System.Int32
_G['TraitorManager']['ActiveTraitorEvent'].GetHashCode = function() end

---`Method Public Instance Virtual`
---@overload fun(obj:System.Object):(System.Boolean)
---@param other Barotrauma.TraitorManager.ActiveTraitorEvent
---@return System.Boolean
_G['TraitorManager']['ActiveTraitorEvent'].Equals = function(other) end

---`Method Public Instance`
---@param Traitor Barotrauma.Networking.Client-ref
---@param TraitorEvent Barotrauma.TraitorEvent-ref
_G['TraitorManager']['ActiveTraitorEvent'].Deconstruct = function(Traitor, TraitorEvent) end

---`Constructor Public Instance`
---@param Traitor Barotrauma.Networking.Client
---@param TraitorEvent Barotrauma.TraitorEvent
---@return Barotrauma.TraitorManager.ActiveTraitorEvent
_G['TraitorManager']['ActiveTraitorEvent'] = function(Traitor, TraitorEvent) end

---`Constructor Public Instance`
---@param Traitor Barotrauma.Networking.Client
---@param TraitorEvent Barotrauma.TraitorEvent
---@return Barotrauma.TraitorManager.ActiveTraitorEvent
_G['TraitorManager']['ActiveTraitorEvent'].__new = function(Traitor, TraitorEvent) end

