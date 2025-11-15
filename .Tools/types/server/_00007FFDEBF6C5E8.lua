---@meta
---@class Barotrauma.Items.Components.MiniMap : Barotrauma.Items.Components.Powered
---`Field Private Instance`
---@field hasPower System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field RequireWaterDetectors System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field RequireOxygenDetectors System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field ShowHullIntegrity System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field EnableHullStatus System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field EnableElectricalView System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field EnableItemFinder System.Boolean
_G['Components']['MiniMap'] = {}

---`Method Public Instance Virtual`
---@param deltaTime System.Single
---@param cam Barotrauma.Camera
_G['Components']['MiniMap'].Update = function(deltaTime, cam) end

---`Method Public Instance Virtual`
---@param connection? Barotrauma.Items.Components.Connection
---@return System.Single
_G['Components']['MiniMap'].GetCurrentPowerConsumption = function(connection) end

---`Method Public Instance Virtual`
---@param picker Barotrauma.Character
---@return System.Boolean
_G['Components']['MiniMap'].Pick = function(picker) end

---`Constructor Public Instance`
---@param item Barotrauma.Item
---@param element Barotrauma.ContentXElement
---@return Barotrauma.Items.Components.MiniMap
_G['Components']['MiniMap'] = function(item, element) end

---`Constructor Public Instance`
---@param item Barotrauma.Item
---@param element Barotrauma.ContentXElement
---@return Barotrauma.Items.Components.MiniMap
_G['Components']['MiniMap'].__new = function(item, element) end

