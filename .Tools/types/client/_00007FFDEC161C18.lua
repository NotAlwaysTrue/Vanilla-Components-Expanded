---@meta
---@class Barotrauma.TraitorEventPrefab : Barotrauma.EventPrefab
---`Field Public Instance`
---@field Icon Barotrauma.Sprite
---`Field Public Instance`
---@field IconColor Microsoft.Xna.Framework.Color
---`Field Private Instance`
---@field reputationRequirements (System.Collections.Immutable.ImmutableArray*1Barotrauma*TraitorEventPrefab*ReputationRequirement)|(Barotrauma.TraitorEventPrefab.ReputationRequirement[])
---`Field Private Instance`
---@field missionRequirements (System.Collections.Immutable.ImmutableArray*1Barotrauma*TraitorEventPrefab*MissionRequirement)|(Barotrauma.TraitorEventPrefab.MissionRequirement[])
---`Field Private Instance`
---@field levelRequirements (System.Collections.Immutable.ImmutableArray*1Barotrauma*TraitorEventPrefab*LevelRequirement)|(Barotrauma.TraitorEventPrefab.LevelRequirement[])
---`Field Public Instance`
---@field RequiredCompletedTags (System.Collections.Immutable.ImmutableHashSet*1Barotrauma*Identifier)|(Barotrauma.Identifier[])
---`Field Public Instance`
---@field DangerLevel System.Int32
---`Field Public Instance`
---@field RequiredPreviousDangerLevel System.Int32
---`Field Public Instance`
---@field RequirePreviousDangerLevelCompleted System.Boolean
---`Field Public Instance`
---@field MinPlayerCount System.Int32
---`Field Public Instance`
---@field SecondaryTraitorAmount System.Int32
---`Field Public Instance`
---@field SecondaryTraitorPercentage System.Single
---`Field Public Instance`
---@field AllowAccusingSecondaryTraitor System.Boolean
---`Field Public Instance`
---@field MoneyPenaltyForUnfoundedTraitorAccusation System.Int32
---`Field Public Instance`
---@field IsChainable System.Boolean
---`Field Public Instance`
---@field StealPercentageOfExperience System.Single
---`Field Public Static`
---@field MinDangerLevel System.Int32
---`Field Public Static`
---@field MaxDangerLevel System.Int32
---`Getter Public Instance`
---@field HasReputationRequirements System.Boolean
---`Getter Public Instance`
---@field HasMissionRequirements System.Boolean
---`Getter Public Instance`
---@field HasLevelRequirements System.Boolean
_G['TraitorEventPrefab'] = {}

---`Method Public Instance`
---@param campaign Barotrauma.CampaignMode
---@return System.Boolean
_G['TraitorEventPrefab'].ReputationRequirementsMet = function(campaign) end

---`Method Public Instance`
---@param gameSession Barotrauma.GameSession
---@return System.Boolean
_G['TraitorEventPrefab'].MissionRequirementsMet = function(gameSession) end

---`Method Public Instance`
---@param level Barotrauma.Level
---@return System.Boolean
_G['TraitorEventPrefab'].LevelRequirementsMet = function(level) end

---`Method Public Instance Virtual`
_G['TraitorEventPrefab'].Dispose = function() end

---`Method Public Instance Virtual`
---@return System.String
_G['TraitorEventPrefab'].ToString = function() end

---`Constructor Public Instance`
---@param element Barotrauma.ContentXElement
---@param file Barotrauma.RandomEventsFile
---@param fallbackIdentifier? Barotrauma.Identifier
---@return Barotrauma.TraitorEventPrefab
_G['TraitorEventPrefab'] = function(element, file, fallbackIdentifier) end

---`Constructor Public Instance`
---@param element Barotrauma.ContentXElement
---@param file Barotrauma.RandomEventsFile
---@param fallbackIdentifier? Barotrauma.Identifier
---@return Barotrauma.TraitorEventPrefab
_G['TraitorEventPrefab'].__new = function(element, file, fallbackIdentifier) end

