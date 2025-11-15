---@meta
---@class Barotrauma.Items.Components.Scanner : Barotrauma.Items.Components.ItemComponent
---`Field Private Instance`
---@field scanTimer System.Single
---`Field Public Instance`
---@field OnScanStarted (System.Action*1Barotrauma*Items*Components*Scanner)|(fun(obj:Barotrauma.Items.Components.Scanner))
---`Field Public Instance`
---@field OnScanCompleted (System.Action*1Barotrauma*Items*Components*Scanner)|(fun(obj:Barotrauma.Items.Components.Scanner))
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field ScanDuration System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field ScanTimer System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field ScanRadius System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field AlwaysDisplayProgressBar System.Boolean
---`Getter Private Instance`
---<br/>`Setter Private Instance`
---@field Holdable Barotrauma.Items.Components.Holdable
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field DisplayProgressBar System.Boolean
---`Getter Private Instance`
---@field IsScanCompleted System.Boolean
_G['Components']['Scanner'] = {}

---`Method Public Instance Virtual`
---@param msg Barotrauma.Networking.IReadMessage
---@param sendingTime System.Single
_G['Components']['Scanner'].ClientEventRead = function(msg, sendingTime) end

---`Method Public Instance Virtual`
---@param deltaTime System.Single
---@param cam Barotrauma.Camera
_G['Components']['Scanner'].Update = function(deltaTime, cam) end

---`Method Private Instance`
_G['Components']['Scanner'].UpdateProjSpecific = function() end

---`Method Public Instance Virtual`
_G['Components']['Scanner'].OnItemLoaded = function() end

---`Constructor Public Instance`
---@param item Barotrauma.Item
---@param element Barotrauma.ContentXElement
---@return Barotrauma.Items.Components.Scanner
_G['Components']['Scanner'] = function(item, element) end

---`Constructor Public Instance`
---@param item Barotrauma.Item
---@param element Barotrauma.ContentXElement
---@return Barotrauma.Items.Components.Scanner
_G['Components']['Scanner'].__new = function(item, element) end

