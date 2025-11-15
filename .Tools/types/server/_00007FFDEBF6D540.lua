---@meta
---@class Barotrauma.Items.Components.Reactor : Barotrauma.Items.Components.Powered
---`Field Private Instance`
---@field blameOnBroken Barotrauma.Networking.Client
---`Field Private Instance`
---@field nextServerLogWriteTime System.Nullable*1System*Single
---`Field Private Instance`
---@field lastServerLogWriteTime System.Single
---`Field Private Instance`
---@field fissionRate System.Single
---`Field Private Instance`
---@field turbineOutput System.Single
---`Field Private Instance`
---@field temperature System.Single
---`Field Private Instance`
---@field autoTemp System.Boolean
---`Field Private Instance`
---@field fuelConsumptionRate System.Single
---`Field Private Instance`
---@field meltDownTimer System.Single
---`Field Private Instance`
---@field meltDownDelay System.Single
---`Field Private Instance`
---@field fireTimer System.Single
---`Field Private Instance`
---@field fireDelay System.Single
---`Field Private Instance`
---@field maxPowerOutput System.Single
---`Field Private Instance`
---@field minUpdatePowerOut System.Single
---`Field Private Instance`
---@field maxUpdatePowerOut System.Single
---`Field Private Instance`
---@field unsentChanges System.Boolean
---`Field Private Instance`
---@field sendUpdateTimer System.Single
---`Field Private Instance`
---@field degreeOfSuccess System.Single
---`Field Private Instance`
---@field optimalTemperature Microsoft.Xna.Framework.Vector2
---`Field Private Instance`
---@field allowedTemperature Microsoft.Xna.Framework.Vector2
---`Field Private Instance`
---@field optimalFissionRate Microsoft.Xna.Framework.Vector2
---`Field Private Instance`
---@field allowedFissionRate Microsoft.Xna.Framework.Vector2
---`Field Private Instance`
---@field optimalTurbineOutput Microsoft.Xna.Framework.Vector2
---`Field Private Instance`
---@field allowedTurbineOutput Microsoft.Xna.Framework.Vector2
---`Field Private Instance`
---@field signalControlledTargetFissionRate System.Nullable*1System*Single
---`Field Private Instance`
---@field signalControlledTargetTurbineOutput System.Nullable*1System*Single
---`Field Private Instance`
---@field lastReceivedFissionRateSignalTime System.Double
---`Field Private Instance`
---@field lastReceivedTurbineOutputSignalTime System.Double
---`Field Private Instance`
---@field temperatureBoost System.Single
---`Field Private Instance`
---@field _powerOn System.Boolean
---`Field Private Instance`
---@field lastUser Barotrauma.Character
---`Field Private Instance`
---@field prevAvailableFuel System.Single
---`Field Private Static`
---@field NetworkUpdateIntervalLow System.Single
---`Field Private Static`
---@field NetworkUpdateIntervalHigh System.Single
---`Field Private Static`
---@field TemperatureBoostAmount System.Single
---`Getter Public Instance`
---@field AllowTemperatureBoost System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field PowerOn System.Boolean
---`Getter NonPublic Instance Virtual`
---@field Priority Barotrauma.Items.Components.PowerPriority
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field LastAIUser Barotrauma.Character
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field LastUserWasPlayer System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field LastUser Barotrauma.Character
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field MaxPowerOutput System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field MeltdownDelay System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field FireDelay System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Temperature System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field FissionRate System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field TurbineOutput System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field FuelConsumptionRate System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field TemperatureCritical System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field AutoTemp System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field AvailableFuel System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field Load System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field TargetFissionRate System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field TargetTurbineOutput System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field CorrectTurbineOutput System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field ExplosionDamagesOtherSubs System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field MeltedDownThisRound System.Boolean
_G['Components']['Reactor'] = {}

---`Method Public Instance Virtual`
---@param msg Barotrauma.Networking.IReadMessage
---@param c Barotrauma.Networking.Client
_G['Components']['Reactor'].ServerEventRead = function(msg, c) end

---`Method Public Instance Virtual`
---@param msg Barotrauma.Networking.IWriteMessage
---@param c Barotrauma.Networking.Client
---@param extraData? Barotrauma.Networking.NetEntityEvent.IData
_G['Components']['Reactor'].ServerEventWrite = function(msg, c, extraData) end

---`Method Public Instance Virtual`
---@param deltaTime System.Single
---@param cam Barotrauma.Camera
_G['Components']['Reactor'].Update = function(deltaTime, cam) end

---`Method Public Instance Virtual`
---@param connection? Barotrauma.Items.Components.Connection
---@return System.Single
_G['Components']['Reactor'].GetCurrentPowerConsumption = function(connection) end

---`Method Public Instance Virtual`
---@param conn Barotrauma.Items.Components.Connection
---@param load System.Single
---@return Barotrauma.Items.Components.PowerRange
_G['Components']['Reactor'].MinMaxPowerOut = function(conn, load) end

---`Method Public Instance Virtual`
---@param conn Barotrauma.Items.Components.Connection
---@param power System.Single
---@param minMaxPower Barotrauma.Items.Components.PowerRange
---@param load System.Single
---@return System.Single
_G['Components']['Reactor'].GetConnectionPowerOut = function(conn, power, minMaxPower, load) end

---`Method Private Instance`
---@param fissionRate System.Single
---@return System.Single
_G['Components']['Reactor'].GetGeneratedHeat = function(fissionRate) end

---`Method Private Instance`
---@param minimumOutputRatio System.Single
---@param minCondition? System.Single
---@return System.Boolean
_G['Components']['Reactor'].NeedMoreFuel = function(minimumOutputRatio, minCondition) end

---`Method Private Instance`
---@return System.Boolean
_G['Components']['Reactor'].TooMuchFuel = function() end

---`Method Private Instance`
---@param deltaTime System.Single
_G['Components']['Reactor'].UpdateFailures = function(deltaTime) end

---`Method Public Instance`
---@param speed System.Single
---@param deltaTime System.Single
_G['Components']['Reactor'].UpdateAutoTemp = function(speed, deltaTime) end

---`Method Public Instance`
_G['Components']['Reactor'].PowerUpImmediately = function() end

---`Method Public Instance Virtual`
---@param deltaTime System.Single
---@param cam Barotrauma.Camera
_G['Components']['Reactor'].UpdateBroken = function(deltaTime, cam) end

---`Method Private Instance`
_G['Components']['Reactor'].MeltDown = function() end

---`Method Public Instance Virtual`
---@param picker Barotrauma.Character
---@return System.Boolean
_G['Components']['Reactor'].Pick = function(picker) end

---`Method Public Instance Virtual`
---@param deltaTime System.Single
---@param character Barotrauma.Character
---@param objective Barotrauma.AIObjectiveOperateItem
---@return System.Boolean
_G['Components']['Reactor'].CrewAIOperate = function(deltaTime, character, objective) end

---`Method Public Instance Virtual`
_G['Components']['Reactor'].OnMapLoaded = function() end

---`Method Public Instance Virtual`
---@param signal Barotrauma.Items.Components.Signal
---@param connection Barotrauma.Items.Components.Connection
_G['Components']['Reactor'].ReceiveSignal = function(signal, connection) end

---`Method Private Instance`
---@return System.Single
_G['Components']['Reactor'].GetMaxOutput = function() end

---`Method Private Instance`
---@return System.Single
_G['Components']['Reactor'].GetFuelConsumption = function() end

---`Constructor Public Instance`
---@param item Barotrauma.Item
---@param element Barotrauma.ContentXElement
---@return Barotrauma.Items.Components.Reactor
_G['Components']['Reactor'] = function(item, element) end

---`Constructor Public Instance`
---@param item Barotrauma.Item
---@param element Barotrauma.ContentXElement
---@return Barotrauma.Items.Components.Reactor
_G['Components']['Reactor'].__new = function(item, element) end

