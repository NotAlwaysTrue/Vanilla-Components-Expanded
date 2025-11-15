---@meta
---@class Barotrauma.Items.Components.WaterDetector : Barotrauma.Items.Components.ItemComponent
---`Field Private Instance`
---@field prevSentWaterPercentageValue System.Int32
---`Field Private Instance`
---@field waterPercentageSignal System.String
---`Field Private Instance`
---@field isInWater System.Boolean
---`Field Private Instance`
---@field stateSwitchDelay System.Single
---`Field Private Instance`
---@field maxOutputLength System.Int32
---`Field Private Instance`
---@field output System.String
---`Field Private Instance`
---@field falseOutput System.String
---`Field Private Static`
---@field StateSwitchInterval System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field MaxOutputLength System.Int32
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Output System.String
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field FalseOutput System.String
---`Getter Public Instance`
---@field WaterDetected System.Boolean
---`Getter Public Instance`
---@field WaterPercentage System.Int32
_G['Components']['WaterDetector'] = {}

---`Method Public Static`
---@param hull Barotrauma.Hull
---@return System.Int32
_G['Components']['WaterDetector'].GetWaterPercentage = function(hull) end

---`Method Public Instance Virtual`
---@param deltaTime System.Single
---@param cam Barotrauma.Camera
_G['Components']['WaterDetector'].Update = function(deltaTime, cam) end

---`Constructor Public Instance`
---@param item Barotrauma.Item
---@param element Barotrauma.ContentXElement
---@return Barotrauma.Items.Components.WaterDetector
_G['Components']['WaterDetector'] = function(item, element) end

---`Constructor Public Instance`
---@param item Barotrauma.Item
---@param element Barotrauma.ContentXElement
---@return Barotrauma.Items.Components.WaterDetector
_G['Components']['WaterDetector'].__new = function(item, element) end

