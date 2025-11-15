---@meta
---@class Barotrauma.Items.Components.StringComponent : Barotrauma.Items.Components.ItemComponent
---`Field NonPublic Instance`
---@field timeSinceReceived (System.Single-arr)|(System.Single[])
---`Field NonPublic Instance`
---@field receivedSignal (System.String-arr)|(System.String[])
---`Field NonPublic Instance`
---@field timeFrame System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field TimeFrame System.Single
_G['Components']['StringComponent'] = {}

---`Method Public Instance Virtual`
---@param deltaTime System.Single
---@param cam Barotrauma.Camera
_G['Components']['StringComponent'].Update = function(deltaTime, cam) end

---`Method NonPublic Instance Abstract Virtual`
---@param signal1 System.String
---@param signal2 System.String
---@return System.String
_G['Components']['StringComponent'].Calculate = function(signal1, signal2) end

---`Method Public Instance Virtual`
---@param signal Barotrauma.Items.Components.Signal
---@param connection Barotrauma.Items.Components.Connection
_G['Components']['StringComponent'].ReceiveSignal = function(signal, connection) end

---`Constructor Public Instance`
---@param item Barotrauma.Item
---@param element Barotrauma.ContentXElement
---@return Barotrauma.Items.Components.StringComponent
_G['Components']['StringComponent'] = function(item, element) end

---`Constructor Public Instance`
---@param item Barotrauma.Item
---@param element Barotrauma.ContentXElement
---@return Barotrauma.Items.Components.StringComponent
_G['Components']['StringComponent'].__new = function(item, element) end

