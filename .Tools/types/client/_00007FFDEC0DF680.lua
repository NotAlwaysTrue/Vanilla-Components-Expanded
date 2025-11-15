---@meta
---@class Barotrauma.Items.Components.LevelResource : Barotrauma.Items.Components.ItemComponent
---`Field Private Instance`
---@field trigger Barotrauma.PhysicsBody
---`Field Private Instance`
---@field holdable Barotrauma.Items.Components.Holdable
---`Field Private Instance`
---@field deattachTimer System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field DeattachDuration System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field DeattachTimer System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field RandomOffsetFromWall System.Single
---`Getter Public Instance`
---@field Attached System.Boolean
_G['Components']['LevelResource'] = {}

---`Method Public Instance Virtual`
---@param msg Barotrauma.Networking.IReadMessage
---@param sendingTime System.Single
_G['Components']['LevelResource'].ClientEventRead = function(msg, sendingTime) end

---`Method Public Instance Virtual`
---@param amount Microsoft.Xna.Framework.Vector2
---@param ignoreContacts? System.Boolean
_G['Components']['LevelResource'].Move = function(amount, ignoreContacts) end

---`Method Public Instance Virtual`
---@param deltaTime System.Single
---@param cam Barotrauma.Camera
_G['Components']['LevelResource'].Update = function(deltaTime, cam) end

---`Method Public Instance Virtual`
_G['Components']['LevelResource'].OnItemLoaded = function() end

---`Method Private Instance`
_G['Components']['LevelResource'].CreateTriggerBody = function() end

---`Method NonPublic Instance Virtual`
_G['Components']['LevelResource'].RemoveComponentSpecific = function() end

---`Constructor Public Instance`
---@param item Barotrauma.Item
---@param element Barotrauma.ContentXElement
---@return Barotrauma.Items.Components.LevelResource
_G['Components']['LevelResource'] = function(item, element) end

---`Constructor Public Instance`
---@param item Barotrauma.Item
---@param element Barotrauma.ContentXElement
---@return Barotrauma.Items.Components.LevelResource
_G['Components']['LevelResource'].__new = function(item, element) end

