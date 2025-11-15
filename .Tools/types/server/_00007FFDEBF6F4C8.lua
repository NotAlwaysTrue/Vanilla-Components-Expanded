---@meta
---@class Barotrauma.Items.Components.ArithmeticComponent : Barotrauma.Items.Components.ItemComponent
---`Field NonPublic Instance`
---@field timeSinceReceived (System.Single-arr)|(System.Single[])
---`Field NonPublic Instance`
---@field receivedSignal (System.Single-arr)|(System.Single[])
---`Field NonPublic Instance`
---@field timeFrame System.Single
---`Field NonPublic Instance`
---@field signalSender (Barotrauma.Character-arr)|(Barotrauma.Character[])
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field ClampMax System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field ClampMin System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field TimeFrame System.Single
_G['Components']['ArithmeticComponent'] = {}

---`Method Public Instance Virtual`
---@param deltaTime System.Single
---@param cam Barotrauma.Camera
_G['Components']['ArithmeticComponent'].Update = function(deltaTime, cam) end

---`Method NonPublic Instance Abstract Virtual`
---@param signal1 System.Single
---@param signal2 System.Single
---@return System.Single
_G['Components']['ArithmeticComponent'].Calculate = function(signal1, signal2) end

---`Method Public Instance Virtual`
---@param signal Barotrauma.Items.Components.Signal
---@param connection Barotrauma.Items.Components.Connection
_G['Components']['ArithmeticComponent'].ReceiveSignal = function(signal, connection) end

---`Constructor Public Instance`
---@param item Barotrauma.Item
---@param element Barotrauma.ContentXElement
---@return Barotrauma.Items.Components.ArithmeticComponent
_G['Components']['ArithmeticComponent'] = function(item, element) end

---`Constructor Public Instance`
---@param item Barotrauma.Item
---@param element Barotrauma.ContentXElement
---@return Barotrauma.Items.Components.ArithmeticComponent
_G['Components']['ArithmeticComponent'].__new = function(item, element) end

