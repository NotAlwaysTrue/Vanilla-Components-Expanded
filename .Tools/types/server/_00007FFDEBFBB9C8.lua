---@meta
---@class Barotrauma.AfflictionSpaceHerpes : Barotrauma.Affliction
---`Field Private Instance`
---@field invertControlsCooldown System.Single
---`Field Private Instance`
---@field stunCoolDown System.Single
---`Field Private Instance`
---@field invertControlsTimer System.Single
---`Field Private Instance`
---@field invertControlsToggleTimer System.Single
_G['AfflictionSpaceHerpes'] = {}

---`Method Public Instance Virtual`
---@param characterHealth Barotrauma.CharacterHealth
---@param targetLimb Barotrauma.Limb
---@param deltaTime System.Single
_G['AfflictionSpaceHerpes'].Update = function(characterHealth, targetLimb, deltaTime) end

---`Constructor Public Instance`
---@param prefab Barotrauma.AfflictionPrefab
---@param strength System.Single
---@return Barotrauma.AfflictionSpaceHerpes
_G['AfflictionSpaceHerpes'] = function(prefab, strength) end

---`Constructor Public Instance`
---@param prefab Barotrauma.AfflictionPrefab
---@param strength System.Single
---@return Barotrauma.AfflictionSpaceHerpes
_G['AfflictionSpaceHerpes'].__new = function(prefab, strength) end

