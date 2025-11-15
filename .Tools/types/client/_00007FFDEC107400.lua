---@meta
---@class Barotrauma.Items.Components.OxygenGenerator : Barotrauma.Items.Components.Powered
---`Field Private Instance`
---@field generatedAmount System.Single
---`Field Private Instance`
---@field ventList (System.Collections.Generic.List*1System*ValueTuple*2Barotrauma*Items*Components*Vent*2System*Single)|(System.ValueTuple*1Barotrauma*Items*Components*Vent*1System*Single[])
---`Field Private Instance`
---@field totalHullVolume System.Single
---`Field Private Instance`
---@field ventUpdateTimer System.Single
---`Field Private Static`
---@field VentUpdateInterval System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field CurrFlow System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field GeneratedAmount System.Single
_G['Components']['OxygenGenerator'] = {}

---`Method Public Instance Virtual`
---@param deltaTime System.Single
---@param cam Barotrauma.Camera
_G['Components']['OxygenGenerator'].Update = function(deltaTime, cam) end

---`Method Public Instance Virtual`
---@param connection? Barotrauma.Items.Components.Connection
---@return System.Single
_G['Components']['OxygenGenerator'].GetCurrentPowerConsumption = function(connection) end

---`Method Public Instance Virtual`
---@param deltaTime System.Single
---@param cam Barotrauma.Camera
_G['Components']['OxygenGenerator'].UpdateBroken = function(deltaTime, cam) end

---`Method Public Instance`
_G['Components']['OxygenGenerator'].GetVents = function() end

---`Method Private Instance`
---@param deltaOxygen System.Single
---@param deltaTime System.Single
_G['Components']['OxygenGenerator'].UpdateVents = function(deltaOxygen, deltaTime) end

---`Method Public Instance`
---@param targetVent Barotrauma.Items.Components.Vent
---@return System.Single
_G['Components']['OxygenGenerator'].GetVentOxygenFlow = function(targetVent) end

---`Constructor Public Instance`
---@param item Barotrauma.Item
---@param element Barotrauma.ContentXElement
---@return Barotrauma.Items.Components.OxygenGenerator
_G['Components']['OxygenGenerator'] = function(item, element) end

---`Constructor Public Instance`
---@param item Barotrauma.Item
---@param element Barotrauma.ContentXElement
---@return Barotrauma.Items.Components.OxygenGenerator
_G['Components']['OxygenGenerator'].__new = function(item, element) end

