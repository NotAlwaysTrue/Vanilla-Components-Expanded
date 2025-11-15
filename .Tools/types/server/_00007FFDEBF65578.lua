---@meta
---@class Barotrauma.Skill : System.Object
---`Field Public Instance`
---@field Identifier Barotrauma.Identifier
---`Field Private Instance`
---@field level System.Single
---`Field Private Instance`
---@field iconJobId Barotrauma.Identifier
---`Field Public Instance`
---@field PriceMultiplier System.Single
---`Field Public Static`
---@field DefaultMaximumSkill System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field HighestLevelDuringRound System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Level System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field DisplayName Barotrauma.LocalizedString
---`Getter Public Instance`
---@field Icon Barotrauma.Sprite
_G['Skill'] = {}

---`Method Public Instance`
---@param value System.Single
---@param canIncreasePastDefaultMaximumSkill System.Boolean
_G['Skill'].IncreaseSkill = function(value, canIncreasePastDefaultMaximumSkill) end

---`Method Private Instance`
---@return Barotrauma.Identifier
_G['Skill'].GetIconJobId = function() end

---`Constructor Public Instance`
---@overload fun(prefab:Barotrauma.SkillPrefab, isPvP:System.Boolean, randSync:Barotrauma.Rand.RandSync):Barotrauma.Skill
---@param identifier Barotrauma.Identifier
---@param level System.Single
---@return Barotrauma.Skill
_G['Skill'] = function(identifier, level) end

---`Constructor Public Instance`
---@overload fun(prefab:Barotrauma.SkillPrefab, isPvP:System.Boolean, randSync:Barotrauma.Rand.RandSync):Barotrauma.Skill
---@param identifier Barotrauma.Identifier
---@param level System.Single
---@return Barotrauma.Skill
_G['Skill'].__new = function(identifier, level) end

