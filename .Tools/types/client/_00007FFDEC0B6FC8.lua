---@meta
---@class Barotrauma.Items.Components.PowerContainer : Barotrauma.Items.Components.Powered
---`Field Private Instance`
---@field chargeIndicator Barotrauma.GUIProgressBar
---`Field Private Instance`
---@field rechargeSpeedSlider Barotrauma.GUIScrollBar
---`Field Private Instance`
---@field capacity System.Single
---`Field Private Instance`
---@field adjustedCapacity System.Single
---`Field Private Instance`
---@field charge System.Single
---`Field Private Instance`
---@field prevCharge System.Single
---`Field Private Instance`
---@field maxRechargeSpeed System.Single
---`Field Private Instance`
---@field rechargeSpeed System.Single
---`Field Private Instance`
---@field lastSentCharge System.Single
---`Field NonPublic Instance`
---@field indicatorPosition Microsoft.Xna.Framework.Vector2
---`Field NonPublic Instance`
---@field indicatorSize Microsoft.Xna.Framework.Vector2
---`Field NonPublic Instance`
---@field isHorizontal System.Boolean
---`Field Private Instance`
---@field currPowerOutput System.Single
---`Field Private Instance`
---@field efficiency System.Single
---`Field Private Instance`
---@field flipIndicator System.Boolean
---`Field Private Instance`
---@field isRunning System.Boolean
---`Field Public Static`
---@field aiRechargeTargetRatio System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field RechargeWarningIndicatorLow System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field RechargeWarningIndicatorHigh System.Single
---`Getter Public Instance Virtual`
---@field DrawSize Microsoft.Xna.Framework.Vector2
---`Getter NonPublic Instance Virtual`
---@field Priority Barotrauma.Items.Components.PowerPriority
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field CurrPowerOutput System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field IndicatorPosition Microsoft.Xna.Framework.Vector2
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field IndicatorSize Microsoft.Xna.Framework.Vector2
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field IsHorizontal System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field MaxOutPut System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Capacity System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Charge System.Single
---`Getter Public Instance`
---@field ChargePercentage System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field MaxRechargeSpeed System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field RechargeSpeed System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field ExponentialRechargeSpeed System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Efficiency System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field FlipIndicator System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field OutputDisabled System.Boolean
---`Getter Public Instance`
---@field RechargeRatio System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field HasBeenTuned System.Boolean
_G['Components']['PowerContainer'] = {}

---`Method Public Instance Virtual`
_G['Components']['PowerContainer'].OnItemLoaded = function() end

---`Method Public Instance Virtual`
---@param character Barotrauma.Character
---@param deltaTime System.Single
---@param cam Barotrauma.Camera
_G['Components']['PowerContainer'].UpdateHUDComponentSpecific = function(character, deltaTime, cam) end

---`Method Public Instance Virtual`
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
---@param editing? System.Boolean
---@param itemDepth? System.Single
---@param overrideColor? System.Nullable*1Microsoft*Xna*Framework*Color
_G['Components']['PowerContainer'].Draw = function(spriteBatch, editing, itemDepth, overrideColor) end

---`Method Public Instance Virtual`
---@param msg Barotrauma.Networking.IWriteMessage
---@param extraData Barotrauma.Networking.NetEntityEvent.IData
_G['Components']['PowerContainer'].ClientEventWrite = function(msg, extraData) end

---`Method Public Instance Virtual`
---@param msg Barotrauma.Networking.IReadMessage
---@param sendingTime System.Single
_G['Components']['PowerContainer'].ClientEventRead = function(msg, sendingTime) end

---`Method Private Instance`
_G['Components']['PowerContainer'].InitProjSpecific = function() end

---`Method Public Instance Virtual`
---@param picker Barotrauma.Character
---@return System.Boolean
_G['Components']['PowerContainer'].Pick = function(picker) end

---`Method Public Instance Virtual`
---@param deltaTime System.Single
---@param cam Barotrauma.Camera
_G['Components']['PowerContainer'].Update = function(deltaTime, cam) end

---`Method Public Instance Virtual`
---@param connection? Barotrauma.Items.Components.Connection
---@return System.Single
_G['Components']['PowerContainer'].GetCurrentPowerConsumption = function(connection) end

---`Method Public Instance Virtual`
---@param connection Barotrauma.Items.Components.Connection
---@param load? System.Single
---@return Barotrauma.Items.Components.PowerRange
_G['Components']['PowerContainer'].MinMaxPowerOut = function(connection, load) end

---`Method Public Instance Virtual`
---@param connection Barotrauma.Items.Components.Connection
---@param power System.Single
---@param minMaxPower Barotrauma.Items.Components.PowerRange
---@param load System.Single
---@return System.Single
_G['Components']['PowerContainer'].GetConnectionPowerOut = function(connection, power, minMaxPower, load) end

---`Method Public Instance Virtual`
---@param conn Barotrauma.Items.Components.Connection
_G['Components']['PowerContainer'].GridResolved = function(conn) end

---`Method Public Instance Virtual`
---@param deltaTime System.Single
---@param character Barotrauma.Character
---@param objective Barotrauma.AIObjectiveOperateItem
---@return System.Boolean
_G['Components']['PowerContainer'].CrewAIOperate = function(deltaTime, character, objective) end

---`Method Public Instance Virtual`
---@param signal Barotrauma.Items.Components.Signal
---@param connection Barotrauma.Items.Components.Connection
_G['Components']['PowerContainer'].ReceiveSignal = function(signal, connection) end

---`Method Public Instance`
---@return System.Single
_G['Components']['PowerContainer'].GetCapacity = function() end

---`Constructor Public Instance`
---@param item Barotrauma.Item
---@param element Barotrauma.ContentXElement
---@return Barotrauma.Items.Components.PowerContainer
_G['Components']['PowerContainer'] = function(item, element) end

---`Constructor Public Instance`
---@param item Barotrauma.Item
---@param element Barotrauma.ContentXElement
---@return Barotrauma.Items.Components.PowerContainer
_G['Components']['PowerContainer'].__new = function(item, element) end

