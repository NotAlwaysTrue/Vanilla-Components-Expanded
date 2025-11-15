---@meta
---@class Barotrauma.Items.Components.SmokeDetector : Barotrauma.Items.Components.ItemComponent
---`Field Private Instance`
---@field fireCheckTimer System.Single
---`Field Private Instance`
---@field maxOutputLength System.Int32
---`Field Private Instance`
---@field output System.String
---`Field Private Instance`
---@field falseOutput System.String
---`Field Private Static`
---@field FireCheckInterval System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field FireInRange System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field MaxOutputLength System.Int32
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Output System.String
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field FalseOutput System.String
_G['Components']['SmokeDetector'] = {}

---`Method Private Instance`
---@return System.Boolean
_G['Components']['SmokeDetector'].IsFireInRange = function() end

---`Method Public Instance Virtual`
---@param deltaTime System.Single
---@param cam Barotrauma.Camera
_G['Components']['SmokeDetector'].Update = function(deltaTime, cam) end

---`Constructor Public Instance`
---@param item Barotrauma.Item
---@param element Barotrauma.ContentXElement
---@return Barotrauma.Items.Components.SmokeDetector
_G['Components']['SmokeDetector'] = function(item, element) end

---`Constructor Public Instance`
---@param item Barotrauma.Item
---@param element Barotrauma.ContentXElement
---@return Barotrauma.Items.Components.SmokeDetector
_G['Components']['SmokeDetector'].__new = function(item, element) end

