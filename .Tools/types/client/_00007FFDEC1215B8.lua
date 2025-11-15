---@meta
---@class Barotrauma.Items.Components.OscillatorComponent : Barotrauma.Items.Components.ItemComponent
---`Field Private Instance`
---@field frequency System.Single
---`Field Private Instance`
---@field phase System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field OutputType Barotrauma.Items.Components.OscillatorComponent.WaveType
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Frequency System.Single
_G['Components']['OscillatorComponent'] = {}

---`Method Public Instance Virtual`
---@param deltaTime System.Single
---@param cam Barotrauma.Camera
_G['Components']['OscillatorComponent'].Update = function(deltaTime, cam) end

---`Method Public Instance Virtual`
---@param signal Barotrauma.Items.Components.Signal
---@param connection Barotrauma.Items.Components.Connection
_G['Components']['OscillatorComponent'].ReceiveSignal = function(signal, connection) end

---`Constructor Public Instance`
---@param item Barotrauma.Item
---@param element Barotrauma.ContentXElement
---@return Barotrauma.Items.Components.OscillatorComponent
_G['Components']['OscillatorComponent'] = function(item, element) end

---`Constructor Public Instance`
---@param item Barotrauma.Item
---@param element Barotrauma.ContentXElement
---@return Barotrauma.Items.Components.OscillatorComponent
_G['Components']['OscillatorComponent'].__new = function(item, element) end

