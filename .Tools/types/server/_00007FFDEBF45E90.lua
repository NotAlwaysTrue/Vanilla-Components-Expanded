---@meta
---@class Barotrauma.AIObjectiveFindDivingGear : Barotrauma.AIObjective
---`Field Private Instance`
---@field gearTag Barotrauma.Identifier
---`Field Private Instance`
---@field getDivingGear Barotrauma.AIObjectiveGetItem
---`Field Private Instance`
---@field getOxygen Barotrauma.AIObjectiveContainItem
---`Field Private Instance`
---@field targetItem Barotrauma.Item
---`Field Private Instance`
---@field oxygenSourceSlotIndex System.Nullable*1System*Int32
---`Field Private Static`
---@field MinOxygen System.Single
---`Getter Public Instance Virtual`
---<br/>`Setter Public Instance Virtual`
---@field Identifier Barotrauma.Identifier
---`Getter Public Instance Virtual`
---@field DebugTag System.String
---`Getter Public Instance Virtual`
---@field ForceRun System.Boolean
---`Getter Public Instance Virtual`
---@field KeepDivingGearOn System.Boolean
---`Getter Public Instance Virtual`
---@field AbandonWhenCannotCompleteSubObjectives System.Boolean
---`Getter NonPublic Instance Virtual`
---@field AllowWhileHandcuffed System.Boolean
_G['AIObjectiveFindDivingGear'] = {}

---`Method NonPublic Instance Virtual`
---@return System.Boolean
_G['AIObjectiveFindDivingGear'].CheckObjectiveState = function() end

---`Method NonPublic Instance Virtual`
---@param deltaTime System.Single
_G['AIObjectiveFindDivingGear'].Act = function(deltaTime) end

---`Method Public Static`
---@param item Barotrauma.Item
---@param tag Barotrauma.Identifier
---@param character Barotrauma.Character
---@return System.Boolean
_G['AIObjectiveFindDivingGear'].IsSuitablePressureProtection = function(item, tag, character) end

---`Method Private Instance`
---@param item Barotrauma.Item
---@return System.Boolean
_G['AIObjectiveFindDivingGear'].IsSuitableContainedOxygenSource = function(item) end

---`Method Private Instance`
---@param item Barotrauma.Item
_G['AIObjectiveFindDivingGear'].TrySetTargetItem = function(item) end

---`Method Public Instance Virtual`
_G['AIObjectiveFindDivingGear'].Reset = function() end

---`Method Public Static`
---@param character Barotrauma.Character
---@return System.Single
_G['AIObjectiveFindDivingGear'].GetMinOxygen = function(character) end

---`Constructor Public Instance`
---@param character Barotrauma.Character
---@param needsDivingSuit System.Boolean
---@param objectiveManager Barotrauma.AIObjectiveManager
---@param priorityModifier? System.Single
---@return Barotrauma.AIObjectiveFindDivingGear
_G['AIObjectiveFindDivingGear'] = function(character, needsDivingSuit, objectiveManager, priorityModifier) end

---`Constructor Public Instance`
---@param character Barotrauma.Character
---@param needsDivingSuit System.Boolean
---@param objectiveManager Barotrauma.AIObjectiveManager
---@param priorityModifier? System.Single
---@return Barotrauma.AIObjectiveFindDivingGear
_G['AIObjectiveFindDivingGear'].__new = function(character, needsDivingSuit, objectiveManager, priorityModifier) end

