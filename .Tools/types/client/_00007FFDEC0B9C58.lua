---@meta
---@class Barotrauma.AIObjectiveEscapeHandcuffs : Barotrauma.AIObjective
---`Field Private Instance`
---@field escapeProgress System.Int32
---`Field Private Instance`
---@field isBeingWatched System.Boolean
---`Field Private Instance`
---@field shouldSwitchTeams System.Boolean
---`Field Private Instance`
---@field escapeTimer System.Single
---`Field Private Instance`
---@field updateTimer System.Single
---`Field Private Static`
---@field EscapeTeamChangeIdentifier System.String
---`Field Private Static`
---@field EscapeIntervalTimer System.Single
---`Field Private Static`
---@field UpdateIntervalTimer System.Single
---`Getter Public Instance Virtual`
---<br/>`Setter Public Instance Virtual`
---@field Identifier Barotrauma.Identifier
---`Getter Public Instance Virtual`
---@field AllowAutomaticItemUnequipping System.Boolean
---`Getter NonPublic Instance Virtual`
---@field AllowOutsideSubmarine System.Boolean
---`Getter NonPublic Instance Virtual`
---@field AllowInAnySub System.Boolean
---`Getter Public Instance Virtual`
---@field CanBeCompleted System.Boolean
_G['AIObjectiveEscapeHandcuffs'] = {}

---`Method NonPublic Instance Virtual`
---@return System.Boolean
_G['AIObjectiveEscapeHandcuffs'].CheckObjectiveState = function() end

---`Method NonPublic Instance Virtual`
---@return System.Single
_G['AIObjectiveEscapeHandcuffs'].GetPriority = function() end

---`Method Public Instance Virtual`
---@param deltaTime System.Single
_G['AIObjectiveEscapeHandcuffs'].Update = function(deltaTime) end

---`Method NonPublic Instance Virtual`
---@param deltaTime System.Single
_G['AIObjectiveEscapeHandcuffs'].Act = function(deltaTime) end

---`Method Public Instance Virtual`
_G['AIObjectiveEscapeHandcuffs'].Reset = function() end

---`Constructor Public Instance`
---@param character Barotrauma.Character
---@param objectiveManager Barotrauma.AIObjectiveManager
---@param shouldSwitchTeams? System.Boolean
---@param beginInstantly? System.Boolean
---@param priorityModifier? System.Single
---@return Barotrauma.AIObjectiveEscapeHandcuffs
_G['AIObjectiveEscapeHandcuffs'] = function(character, objectiveManager, shouldSwitchTeams, beginInstantly, priorityModifier) end

---`Constructor Public Instance`
---@param character Barotrauma.Character
---@param objectiveManager Barotrauma.AIObjectiveManager
---@param shouldSwitchTeams? System.Boolean
---@param beginInstantly? System.Boolean
---@param priorityModifier? System.Single
---@return Barotrauma.AIObjectiveEscapeHandcuffs
_G['AIObjectiveEscapeHandcuffs'].__new = function(character, objectiveManager, shouldSwitchTeams, beginInstantly, priorityModifier) end

