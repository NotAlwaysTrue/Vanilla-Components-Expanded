---@meta
---@class Barotrauma.Items.Components.Pump : Barotrauma.Items.Components.Powered
---`Field Private Instance`
---@field networkUpdateTimer System.Single
---`Field Private Instance`
---@field flowPercentage System.Single
---`Field Private Instance`
---@field maxFlow System.Single
---`Field Public Instance`
---@field TargetLevel System.Nullable*1System*Single
---`Field Private Instance`
---@field hijacked System.Boolean
---`Field Private Instance`
---@field pumpSpeedLockTimer System.Single
---`Field Private Instance`
---@field isActiveLockTimer System.Single
---`Field Private Instance`
---@field disabled System.Boolean
---`Field Private Instance`
---@field currFlow System.Single
---`Field Private Instance`
---@field linkedHulls (System.Collections.Generic.List*1Barotrauma*Hull)|(Barotrauma.Hull[])
---`Field Private Static`
---@field NetworkUpdateInterval System.Single
---`Field Private Static`
---@field TinkeringSpeedIncrease System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Hijacked System.Boolean
---`Getter Public Instance`
---@field CurrentBrokenVolume System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field FlowPercentage System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field MaxFlow System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Disabled System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field IsOn System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field CanCauseLethalPressure System.Boolean
---`Getter Public Instance`
---@field CurrFlow System.Single
---`Getter Public Instance`
---@field IsHullFull System.Boolean
---`Getter Public Instance Virtual`
---@field HasPower System.Boolean
---`Getter Public Instance`
---@field IsAutoControlled System.Boolean
---`Getter Public Instance Virtual`
---@field UpdateWhenInactive System.Boolean
---`Getter Public Instance Virtual`
---@field CurrentStress System.Single
_G['Components']['Pump'] = {}

---`Method Public Instance Virtual`
---@param msg Barotrauma.Networking.IReadMessage
---@param c Barotrauma.Networking.Client
_G['Components']['Pump'].ServerEventRead = function(msg, c) end

---`Method Public Instance Virtual`
---@param msg Barotrauma.Networking.IWriteMessage
---@param c Barotrauma.Networking.Client
---@param extraData? Barotrauma.Networking.NetEntityEvent.IData
_G['Components']['Pump'].ServerEventWrite = function(msg, c, extraData) end

---`Method Public Instance Virtual`
---@param deltaTime System.Single
---@param cam Barotrauma.Camera
_G['Components']['Pump'].Update = function(deltaTime, cam) end

---`Method Public Instance`
---@param identifier Barotrauma.Identifier
---@param allowMultiplePerShip? System.Boolean
_G['Components']['Pump'].InfectBallast = function(identifier, allowMultiplePerShip) end

---`Method Public Instance Virtual`
---@param connection? Barotrauma.Items.Components.Connection
---@return System.Single
_G['Components']['Pump'].GetCurrentPowerConsumption = function(connection) end

---`Method Private Instance`
---@param deltaTime System.Single
_G['Components']['Pump'].UpdateNetworking = function(deltaTime) end

---`Method Public Instance Virtual`
---@param signal Barotrauma.Items.Components.Signal
---@param connection Barotrauma.Items.Components.Connection
_G['Components']['Pump'].ReceiveSignal = function(signal, connection) end

---`Method Public Instance Virtual`
---@param deltaTime System.Single
---@param character Barotrauma.Character
---@param objective Barotrauma.AIObjectiveOperateItem
---@return System.Boolean
_G['Components']['Pump'].CrewAIOperate = function(deltaTime, character, objective) end

---`Method NonPublic Instance Virtual`
_G['Components']['Pump'].RemoveComponentSpecific = function() end

---`Constructor Public Instance`
---@param item Barotrauma.Item
---@param element Barotrauma.ContentXElement
---@return Barotrauma.Items.Components.Pump
_G['Components']['Pump'] = function(item, element) end

---`Constructor Public Instance`
---@param item Barotrauma.Item
---@param element Barotrauma.ContentXElement
---@return Barotrauma.Items.Components.Pump
_G['Components']['Pump'].__new = function(item, element) end

