---@meta
---@class Barotrauma.Items.Components.Throwable : Barotrauma.Items.Components.Holdable
---`Field Private Instance`
---@field throwAngle System.Single
---`Field Private Instance`
---@field midAir System.Boolean
---`Field Private Instance`
---@field throwState Barotrauma.Items.Components.Throwable.ThrowState
---`Field Private Static`
---@field ThrowAngleStart System.Single
---`Field Private Static`
---@field ThrowAngleEnd System.Single
---`Field Private Static`
---@field ContinuousCollisionThreshold System.Single
---`Field Public Static`
---@field WaterDragCoefficient System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field CurrentThrower Barotrauma.Character
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field ThrowForce System.Single
_G['Components']['Throwable'] = {}

---`Method Public Instance Virtual`
---@param deltaTime System.Single
---@param character? Barotrauma.Character
---@return System.Boolean
_G['Components']['Throwable'].Use = function(deltaTime, character) end

---`Method Public Instance Virtual`
---@param deltaTime System.Single
---@param character? Barotrauma.Character
---@return System.Boolean
_G['Components']['Throwable'].SecondaryUse = function(deltaTime, character) end

---`Method Public Instance Virtual`
---@param dropper Barotrauma.Character
---@param setTransform? System.Boolean
_G['Components']['Throwable'].Drop = function(dropper, setTransform) end

---`Method Public Instance Virtual`
---@param deltaTime System.Single
---@param cam Barotrauma.Camera
_G['Components']['Throwable'].UpdateBroken = function(deltaTime, cam) end

---`Method Public Instance Virtual`
---@param deltaTime System.Single
---@param cam Barotrauma.Camera
_G['Components']['Throwable'].Update = function(deltaTime, cam) end

---`Constructor Public Instance`
---@param item Barotrauma.Item
---@param element Barotrauma.ContentXElement
---@return Barotrauma.Items.Components.Throwable
_G['Components']['Throwable'] = function(item, element) end

---`Constructor Public Instance`
---@param item Barotrauma.Item
---@param element Barotrauma.ContentXElement
---@return Barotrauma.Items.Components.Throwable
_G['Components']['Throwable'].__new = function(item, element) end

