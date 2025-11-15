---@meta
---@class Barotrauma.AfflictionHusk : Barotrauma.Affliction
---`Field Private Instance`
---@field subscribedToDeathEvent System.Boolean
---`Field Private Instance`
---@field state Barotrauma.AfflictionHusk.InfectionState
---`Field Private Instance`
---@field huskAppendage (System.Collections.Generic.List*1Barotrauma*Limb)|(Barotrauma.Limb[])
---`Field Private Instance`
---@field character Barotrauma.Character
---`Field Private Instance`
---@field stun System.Boolean
---`Field Private Instance`
---@field highestStrength System.Single
---`Field Public Instance`
---@field HuskPrefab Barotrauma.AfflictionPrefabHusk
---`Field Private Instance`
---@field prevDisplayedMessage System.Nullable*1Barotrauma*AfflictionHusk*InfectionState
---`Field Private Instance`
---@field damageCooldownTimer System.Single
---`Field Private Static`
---@field DamageCooldown System.Single
---`Getter Public Instance Virtual`
---<br/>`Setter Public Instance Virtual`
---@field Strength System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field State Barotrauma.AfflictionHusk.InfectionState
---`Getter Private Instance`
---@field DormantThreshold System.Single
---`Getter Private Instance`
---@field ActiveThreshold System.Single
---`Getter Private Instance`
---@field TransitionThreshold System.Single
---`Getter Private Instance`
---@field TransformThresholdOnDeath System.Single
_G['AfflictionHusk'] = {}

---`Method Public Instance Virtual`
---@param characterHealth Barotrauma.CharacterHealth
---@param targetLimb Barotrauma.Limb
---@param deltaTime System.Single
_G['AfflictionHusk'].Update = function(characterHealth, targetLimb, deltaTime) end

---`Method Private Instance`
_G['AfflictionHusk'].UpdateMessages = function() end

---`Method Private Instance`
---@param deltaTime System.Single
_G['AfflictionHusk'].ApplyDamage = function(deltaTime) end

---`Method Public Instance`
_G['AfflictionHusk'].ActivateHusk = function() end

---`Method Private Instance`
_G['AfflictionHusk'].DeactivateHusk = function() end

---`Method Public Instance`
_G['AfflictionHusk'].UnsubscribeFromDeathEvent = function() end

---`Method Private Instance`
---@param character Barotrauma.Character
---@param causeOfDeath Barotrauma.CauseOfDeath
_G['AfflictionHusk'].CharacterDead = function(character, causeOfDeath) end

---`Method Private Instance`
---@return (System.Collections.Generic.IEnumerable*1Barotrauma*CoroutineStatus)|(fun():(Barotrauma.CoroutineStatus))
_G['AfflictionHusk'].CreateAIHusk = function() end

---`Method Public Static`
---@param character Barotrauma.Character
---@param matchingAffliction Barotrauma.AfflictionPrefabHusk
---@param huskedSpeciesName Barotrauma.Identifier
---@param appendageDefinition? Barotrauma.ContentXElement
---@param ragdoll? Barotrauma.Ragdoll
---@return (System.Collections.Generic.List*1Barotrauma*Limb)|(Barotrauma.Limb[])
_G['AfflictionHusk'].AttachHuskAppendage = function(character, matchingAffliction, huskedSpeciesName, appendageDefinition, ragdoll) end

---`Method Public Static`
---@param character Barotrauma.CharacterParams
---@param prefab Barotrauma.AfflictionPrefabHusk
---@return Barotrauma.Identifier
_G['AfflictionHusk'].GetHuskedSpeciesName = function(character, prefab) end

---`Method Public Static`
---@param character Barotrauma.CharacterParams
---@param prefab Barotrauma.AfflictionPrefabHusk
---@return Barotrauma.Identifier
_G['AfflictionHusk'].GetNonHuskedSpeciesName = function(character, prefab) end

---`Constructor Public Instance`
---@param prefab Barotrauma.AfflictionPrefab
---@param strength System.Single
---@return Barotrauma.AfflictionHusk
_G['AfflictionHusk'] = function(prefab, strength) end

---`Constructor Public Instance`
---@param prefab Barotrauma.AfflictionPrefab
---@param strength System.Single
---@return Barotrauma.AfflictionHusk
_G['AfflictionHusk'].__new = function(prefab, strength) end

