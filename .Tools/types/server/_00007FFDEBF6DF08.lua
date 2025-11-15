---@meta
---@class Barotrauma.Items.Components.SonarTransducer : Barotrauma.Items.Components.Powered
---`Field Private Instance`
---@field sendSignalTimer System.Single
---`Field Public Instance`
---@field ConnectedSonar Barotrauma.Items.Components.Sonar
---`Field Private Static`
---@field SendSignalInterval System.Single
_G['Components']['SonarTransducer'] = {}

---`Method Public Instance Virtual`
---@param deltaTime System.Single
---@param cam Barotrauma.Camera
_G['Components']['SonarTransducer'].Update = function(deltaTime, cam) end

---`Method Public Instance Virtual`
---@param connection? Barotrauma.Items.Components.Connection
---@return System.Single
_G['Components']['SonarTransducer'].GetCurrentPowerConsumption = function(connection) end

---`Constructor Public Instance`
---@param item Barotrauma.Item
---@param element Barotrauma.ContentXElement
---@return Barotrauma.Items.Components.SonarTransducer
_G['Components']['SonarTransducer'] = function(item, element) end

---`Constructor Public Instance`
---@param item Barotrauma.Item
---@param element Barotrauma.ContentXElement
---@return Barotrauma.Items.Components.SonarTransducer
_G['Components']['SonarTransducer'].__new = function(item, element) end

