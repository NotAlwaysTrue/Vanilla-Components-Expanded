---@meta
---@class Barotrauma.Items.Components.MemoryComponent : Barotrauma.Items.Components.ItemComponent
---`Field Private Instance`
---@field maxValueLength System.Int32
---`Field Private Instance`
---@field value System.String
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field MaxValueLength System.Int32
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Value System.String
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Writeable System.Boolean
_G['Components']['MemoryComponent'] = {}

---`Method Public Instance Virtual`
---@param msg Barotrauma.Networking.IReadMessage
---@param sendingTime System.Single
_G['Components']['MemoryComponent'].ClientEventRead = function(msg, sendingTime) end

---`Method Public Instance Virtual`
---@param deltaTime System.Single
---@param cam Barotrauma.Camera
_G['Components']['MemoryComponent'].Update = function(deltaTime, cam) end

---`Method Public Instance Virtual`
---@param signal Barotrauma.Items.Components.Signal
---@param connection Barotrauma.Items.Components.Connection
_G['Components']['MemoryComponent'].ReceiveSignal = function(signal, connection) end

---`Constructor Public Instance`
---@param item Barotrauma.Item
---@param element Barotrauma.ContentXElement
---@return Barotrauma.Items.Components.MemoryComponent
_G['Components']['MemoryComponent'] = function(item, element) end

---`Constructor Public Instance`
---@param item Barotrauma.Item
---@param element Barotrauma.ContentXElement
---@return Barotrauma.Items.Components.MemoryComponent
_G['Components']['MemoryComponent'].__new = function(item, element) end

