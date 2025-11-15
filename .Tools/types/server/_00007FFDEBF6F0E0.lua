---@meta
---@class Barotrauma.Items.Components.PowerTransfer : Barotrauma.Items.Components.Powered
---`Field Private Instance`
---@field signalConnections (System.Collections.Generic.HashSet*1Barotrauma*Items*Components*Connection)|(Barotrauma.Items.Components.Connection[])
---`Field Private Instance`
---@field connectionDirty (System.Collections.Generic.Dictionary*1Barotrauma*Items*Components*Connection*1System*Boolean)|({[Barotrauma.Items.Components.Connection]:(System.Boolean)})
---`Field Private Instance`
---@field connectedRecipients (System.Collections.Generic.Dictionary*1Barotrauma*Items*Components*Connection*1System*Collections*Generic*HashSet*2Barotrauma*Items*Components*Connection)|({[Barotrauma.Items.Components.Connection]:((System.Collections.Generic.HashSet*1Barotrauma*Items*Components*Connection)|(Barotrauma.Items.Components.Connection[]))})
---`Field Private Instance`
---@field overloadCooldownTimer System.Single
---`Field NonPublic Instance`
---@field powerLoad System.Single
---`Field NonPublic Instance`
---@field isBroken System.Boolean
---`Field Private Instance`
---@field extraLoad System.Single
---`Field Private Instance`
---@field extraLoadSetTime System.Single
---`Field Private Instance`
---@field canTransfer System.Boolean
---`Field Private Instance`
---@field prevSentPowerValue System.Int32
---`Field Private Instance`
---@field powerSignal System.String
---`Field Private Instance`
---@field prevSentLoadValue System.Int32
---`Field Private Instance`
---@field loadSignal System.String
---`Field Private Static`
---@field recipientsToRefresh (System.Collections.Generic.HashSet*1Barotrauma*Items*Components*PowerTransfer)|(Barotrauma.Items.Components.PowerTransfer[])
---`Field Private Static`
---@field OverloadCooldown System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field PowerConnections (System.Collections.Generic.List*1Barotrauma*Items*Components*Connection)|(Barotrauma.Items.Components.Connection[])
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field PowerLoad System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field CanBeOverloaded System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field OverloadVoltage System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field FireProbability System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Overload System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field ExtraLoad System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field CanTransfer System.Boolean
---`Getter Public Instance Virtual`
---<br/>`Setter Public Instance Virtual`
---@field IsActive System.Boolean
_G['Components']['PowerTransfer'] = {}

---`Method Public Instance Virtual`
---@param deltaTime System.Single
---@param cam Barotrauma.Camera
_G['Components']['PowerTransfer'].UpdateBroken = function(deltaTime, cam) end

---`Method Public Instance Virtual`
---@param deltaTime System.Single
---@param cam Barotrauma.Camera
_G['Components']['PowerTransfer'].Update = function(deltaTime, cam) end

---`Method NonPublic Instance Virtual`
---@param deltaTime System.Single
_G['Components']['PowerTransfer'].UpdateExtraLoad = function(deltaTime) end

---`Method NonPublic Instance Virtual`
_G['Components']['PowerTransfer'].SendSignals = function() end

---`Method NonPublic Instance Virtual`
---@param deltaTime System.Single
_G['Components']['PowerTransfer'].UpdateOvervoltage = function(deltaTime) end

---`Method Public Instance Virtual`
---@param conn Barotrauma.Items.Components.Connection
---@param power System.Single
---@param minMaxPower Barotrauma.Items.Components.PowerRange
---@param load System.Single
---@return System.Single
_G['Components']['PowerTransfer'].GetConnectionPowerOut = function(conn, power, minMaxPower, load) end

---`Method Public Instance Virtual`
---@param picker Barotrauma.Character
---@return System.Boolean
_G['Components']['PowerTransfer'].Pick = function(picker) end

---`Method NonPublic Instance`
_G['Components']['PowerTransfer'].RefreshConnections = function() end

---`Method Private Instance`
---@param c Barotrauma.Items.Components.Connection
---@param connected (System.Collections.Generic.HashSet*1Barotrauma*Items*Components*Connection)|(Barotrauma.Items.Components.Connection[])
_G['Components']['PowerTransfer'].GetConnected = function(c, connected) end

---`Method Public Instance`
_G['Components']['PowerTransfer'].SetAllConnectionsDirty = function() end

---`Method Public Instance`
---@param connection Barotrauma.Items.Components.Connection
_G['Components']['PowerTransfer'].SetConnectionDirty = function(connection) end

---`Method Public Instance Virtual`
_G['Components']['PowerTransfer'].OnItemLoaded = function() end

---`Method Public Instance Virtual`
---@param signal Barotrauma.Items.Components.Signal
---@param connection Barotrauma.Items.Components.Connection
_G['Components']['PowerTransfer'].ReceiveSignal = function(signal, connection) end

---`Method NonPublic Instance Virtual`
_G['Components']['PowerTransfer'].RemoveComponentSpecific = function() end

---`Constructor Public Instance`
---@overload fun(item:Barotrauma.Item, element:Barotrauma.ContentXElement):Barotrauma.Items.Components.PowerTransfer
---@return Barotrauma.Items.Components.PowerTransfer
_G['Components']['PowerTransfer'] = function() end

---`Constructor Public Instance`
---@overload fun(item:Barotrauma.Item, element:Barotrauma.ContentXElement):Barotrauma.Items.Components.PowerTransfer
---@return Barotrauma.Items.Components.PowerTransfer
_G['Components']['PowerTransfer'].__new = function() end

---`Constructor Private Static`
---@overload fun(item:Barotrauma.Item, element:Barotrauma.ContentXElement):Barotrauma.Items.Components.PowerTransfer
---@return Barotrauma.Items.Components.PowerTransfer
_G['Components']['PowerTransfer'] = function() end

---`Constructor Private Static`
---@overload fun(item:Barotrauma.Item, element:Barotrauma.ContentXElement):Barotrauma.Items.Components.PowerTransfer
---@return Barotrauma.Items.Components.PowerTransfer
_G['Components']['PowerTransfer'].__new = function() end

