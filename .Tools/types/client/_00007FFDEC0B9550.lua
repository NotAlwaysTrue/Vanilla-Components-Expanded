---@meta
---@class Barotrauma.AIObjectiveDeconstructItem : Barotrauma.AIObjective
---`Field Public Instance`
---@field Item Barotrauma.Item
---`Field Private Instance`
---@field deconstructor Barotrauma.Items.Components.Deconstructor
---`Field Private Instance`
---@field moveItemObjective Barotrauma.AIObjectiveMoveItem
---`Field Private Instance`
---@field gotoObjective Barotrauma.AIObjectiveGoTo
---`Getter Public Instance Virtual`
---<br/>`Setter Public Instance Virtual`
---@field Identifier Barotrauma.Identifier
---`Getter NonPublic Instance Virtual`
---@field AllowWhileHandcuffed System.Boolean
---`Getter NonPublic Instance Virtual`
---@field AllowInFriendlySubs System.Boolean
_G['AIObjectiveDeconstructItem'] = {}

---`Method NonPublic Instance Virtual`
---@param deltaTime System.Single
_G['AIObjectiveDeconstructItem'].Act = function(deltaTime) end

---`Method Private Instance`
_G['AIObjectiveDeconstructItem'].StartDeconstruction = function() end

---`Method Private Instance`
---@return Barotrauma.Items.Components.Deconstructor
_G['AIObjectiveDeconstructItem'].FindDeconstructor = function() end

---`Method Private Instance`
_G['AIObjectiveDeconstructItem'].StartDeconstructor = function() end

---`Method NonPublic Instance Virtual`
---@return System.Boolean
_G['AIObjectiveDeconstructItem'].CheckObjectiveState = function() end

---`Method Public Instance Virtual`
_G['AIObjectiveDeconstructItem'].Reset = function() end

---`Method Public Instance`
_G['AIObjectiveDeconstructItem'].DropTarget = function() end

---`Constructor Public Instance`
---@param item Barotrauma.Item
---@param character Barotrauma.Character
---@param objectiveManager Barotrauma.AIObjectiveManager
---@param priorityModifier? System.Single
---@return Barotrauma.AIObjectiveDeconstructItem
_G['AIObjectiveDeconstructItem'] = function(item, character, objectiveManager, priorityModifier) end

---`Constructor Public Instance`
---@param item Barotrauma.Item
---@param character Barotrauma.Character
---@param objectiveManager Barotrauma.AIObjectiveManager
---@param priorityModifier? System.Single
---@return Barotrauma.AIObjectiveDeconstructItem
_G['AIObjectiveDeconstructItem'].__new = function(item, character, objectiveManager, priorityModifier) end

