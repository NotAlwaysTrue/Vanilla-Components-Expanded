---@meta
---@class Barotrauma.Items.Components.RelayComponent : Barotrauma.Items.Components.PowerTransfer
---`Field Private Instance`
---@field maxPower System.Single
---`Field Private Instance`
---@field isOn System.Boolean
---`Field Private Instance`
---@field prevVoltage System.Single
---`Field Private Instance`
---@field newVoltage System.Nullable*1System*Single
---`Field Private Instance`
---@field internalLoadBuffer System.Single
---`Field Private Instance`
---@field prevInternalLoad System.Single
---`Field Private Instance`
---@field prevExternalLoad System.Single
---`Field Private Instance`
---@field bufferDiff System.Single
---`Field Private Instance`
---@field thirdInverseMax System.Single
---`Field Private Instance`
---@field loadEqnConstant System.Single
---`Field Private Static`
---@field connectionPairs (System.Collections.Generic.Dictionary*1System*String*1System*String)|({[System.String]:(System.String)})
---`Getter NonPublic Instance Virtual`
---@field Priority Barotrauma.Items.Components.PowerPriority
---`Getter Public Instance`
---@field DisplayLoad System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field MaxPower System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field IsOn System.Boolean
_G['Components']['RelayComponent'] = {}

---`Method Private Instance`
_G['Components']['RelayComponent'].SetLoadFormulaValues = function() end

---`Method Public Instance Virtual`
_G['Components']['RelayComponent'].OnItemLoaded = function() end

---`Method Public Instance Virtual`
---@param deltaTime System.Single
---@param cam Barotrauma.Camera
_G['Components']['RelayComponent'].Update = function(deltaTime, cam) end

---`Method Public Instance Virtual`
---@param connection? Barotrauma.Items.Components.Connection
---@return System.Single
_G['Components']['RelayComponent'].GetCurrentPowerConsumption = function(connection) end

---`Method Private Instance`
---@return System.Boolean
_G['Components']['RelayComponent'].RelayCanOutput = function() end

---`Method Public Instance Virtual`
---@param connection Barotrauma.Items.Components.Connection
---@param load? System.Single
---@return Barotrauma.Items.Components.PowerRange
_G['Components']['RelayComponent'].MinMaxPowerOut = function(connection, load) end

---`Method Public Instance Virtual`
---@param connection Barotrauma.Items.Components.Connection
---@param power System.Single
---@param minMaxPower Barotrauma.Items.Components.PowerRange
---@param load System.Single
---@return System.Single
_G['Components']['RelayComponent'].GetConnectionPowerOut = function(connection, power, minMaxPower, load) end

---`Method Public Instance Virtual`
---@param conn Barotrauma.Items.Components.Connection
_G['Components']['RelayComponent'].GridResolved = function(conn) end

---`Method Private Instance`
---@param addToBuffer System.Single
---@param newVoltage System.Single
_G['Components']['RelayComponent'].UpdateBuffer = function(addToBuffer, newVoltage) end

---`Method Public Instance Virtual`
---@param signal Barotrauma.Items.Components.Signal
---@param connection Barotrauma.Items.Components.Connection
_G['Components']['RelayComponent'].ReceiveSignal = function(signal, connection) end

---`Method Public Instance`
---@param on System.Boolean
---@param isNetworkMessage System.Boolean
_G['Components']['RelayComponent'].SetState = function(on, isNetworkMessage) end

---`Method Public Instance Virtual`
---@param msg Barotrauma.Networking.IWriteMessage
---@param c Barotrauma.Networking.Client
---@param extraData? Barotrauma.Networking.NetEntityEvent.IData
_G['Components']['RelayComponent'].ServerEventWrite = function(msg, c, extraData) end

---`Method Public Instance`
---@param msg Barotrauma.Networking.IReadMessage
---@param sendingTime System.Single
_G['Components']['RelayComponent'].ClientEventRead = function(msg, sendingTime) end

---`Constructor Public Instance`
---@overload fun(item:Barotrauma.Item, element:Barotrauma.ContentXElement):Barotrauma.Items.Components.RelayComponent
---@return Barotrauma.Items.Components.RelayComponent
_G['Components']['RelayComponent'] = function() end

---`Constructor Public Instance`
---@overload fun(item:Barotrauma.Item, element:Barotrauma.ContentXElement):Barotrauma.Items.Components.RelayComponent
---@return Barotrauma.Items.Components.RelayComponent
_G['Components']['RelayComponent'].__new = function() end

---`Constructor Private Static`
---@overload fun(item:Barotrauma.Item, element:Barotrauma.ContentXElement):Barotrauma.Items.Components.RelayComponent
---@return Barotrauma.Items.Components.RelayComponent
_G['Components']['RelayComponent'] = function() end

---`Constructor Private Static`
---@overload fun(item:Barotrauma.Item, element:Barotrauma.ContentXElement):Barotrauma.Items.Components.RelayComponent
---@return Barotrauma.Items.Components.RelayComponent
_G['Components']['RelayComponent'].__new = function() end

