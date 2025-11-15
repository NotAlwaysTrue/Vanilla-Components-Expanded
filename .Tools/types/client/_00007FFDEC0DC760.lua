---@meta
---@class Barotrauma.SkillPrefab : System.Object
---`Field Public Instance`
---@field Identifier Barotrauma.Identifier
---`Field Private Instance`
---@field levelRange Barotrauma.Range*1System*Single
---`Field Private Instance`
---@field levelRangePvP Barotrauma.Range*1System*Single
---`Field Public Instance`
---@field PriceMultiplier System.Single
---`Getter Public Instance`
---@field IsPrimarySkill System.Boolean
_G['SkillPrefab'] = {}

---`Method Public Instance`
---@param isPvP System.Boolean
---@return Barotrauma.Range*1System*Single
_G['SkillPrefab'].GetLevelRange = function(isPvP) end

---`Constructor Public Instance`
---@param element Barotrauma.ContentXElement
---@return Barotrauma.SkillPrefab
_G['SkillPrefab'] = function(element) end

---`Constructor Public Instance`
---@param element Barotrauma.ContentXElement
---@return Barotrauma.SkillPrefab
_G['SkillPrefab'].__new = function(element) end

