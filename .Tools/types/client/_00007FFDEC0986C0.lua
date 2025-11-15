---@meta
---@class Barotrauma.CharacterTalent : System.Object
---`Field Public Instance`
---@field Prefab Barotrauma.TalentPrefab
---`Field Public Instance`
---@field AddedThisRound System.Boolean
---`Field Private Instance`
---@field characterAbilityGroupEffectDictionary (System.Collections.Generic.Dictionary*1Barotrauma*AbilityEffectType*1System*Collections*Generic*List*2Barotrauma*Abilities*CharacterAbilityGroupEffect)|({[Barotrauma.AbilityEffectType]:((System.Collections.Generic.List*1Barotrauma*Abilities*CharacterAbilityGroupEffect)|(Barotrauma.Abilities.CharacterAbilityGroupEffect[]))})
---`Field Private Instance`
---@field characterAbilityGroupIntervals (System.Collections.Generic.List*1Barotrauma*Abilities*CharacterAbilityGroupInterval)|(Barotrauma.Abilities.CharacterAbilityGroupInterval[])
---`Field Private Static`
---@field checkedNonStackableTalents (System.Collections.Generic.HashSet*1Barotrauma*Identifier)|(Barotrauma.Identifier[])
---`Getter Public Instance`
---@field Character Barotrauma.Character
---`Getter Public Instance`
---@field DebugIdentifier System.String
---`Getter Public Instance`
---@field UnlockedRecipes (System.Collections.Generic.List*1Barotrauma*Identifier)|(Barotrauma.Identifier[])
---`Getter Public Instance`
---@field UnlockedStoreItems (System.Collections.Generic.List*1Barotrauma*Identifier)|(Barotrauma.Identifier[])
_G['CharacterTalent'] = {}

---`Method Public Instance Virtual`
---@param deltaTime System.Single
_G['CharacterTalent'].UpdateTalent = function(deltaTime) end

---`Method Public Static`
---@param crew (System.Collections.Generic.IEnumerable*1Barotrauma*Character)|(fun():(Barotrauma.Character))
---@param type Barotrauma.AbilityEffectType
---@param abilityObject Barotrauma.Abilities.AbilityObject
_G['CharacterTalent'].CheckTalentsForCrew = function(crew, type, abilityObject) end

---`Method Public Instance`
---@param abilityEffectType Barotrauma.AbilityEffectType
---@param abilityObject Barotrauma.Abilities.AbilityObject
_G['CharacterTalent'].CheckTalent = function(abilityEffectType, abilityObject) end

---`Method Public Instance`
---@param addingFirstTime System.Boolean
_G['CharacterTalent'].ActivateTalent = function(addingFirstTime) end

---`Method Private Instance`
---@param abilityGroup Barotrauma.ContentXElement
_G['CharacterTalent'].LoadAbilityGroupInterval = function(abilityGroup) end

---`Method Private Instance`
---@param abilityGroup Barotrauma.ContentXElement
_G['CharacterTalent'].LoadAbilityGroupEffect = function(abilityGroup) end

---`Method Public Instance`
---@param characterAbilityGroup Barotrauma.Abilities.CharacterAbilityGroupEffect
---@param abilityEffectType? Barotrauma.AbilityEffectType
_G['CharacterTalent'].AddAbilityGroupEffect = function(characterAbilityGroup, abilityEffectType) end

---`Method Public Static`
---@param characterTalent Barotrauma.CharacterTalent
---@param abilityEffectTypeString System.String
---@return Barotrauma.AbilityEffectType
_G['CharacterTalent'].ParseAbilityEffectType = function(characterTalent, abilityEffectTypeString) end

---`Constructor Public Instance`
---@overload fun(talentPrefab:Barotrauma.TalentPrefab, character:Barotrauma.Character):Barotrauma.CharacterTalent
---@return Barotrauma.CharacterTalent
_G['CharacterTalent'] = function() end

---`Constructor Public Instance`
---@overload fun(talentPrefab:Barotrauma.TalentPrefab, character:Barotrauma.Character):Barotrauma.CharacterTalent
---@return Barotrauma.CharacterTalent
_G['CharacterTalent'].__new = function() end

---`Constructor Private Static`
---@overload fun(talentPrefab:Barotrauma.TalentPrefab, character:Barotrauma.Character):Barotrauma.CharacterTalent
---@return Barotrauma.CharacterTalent
_G['CharacterTalent'] = function() end

---`Constructor Private Static`
---@overload fun(talentPrefab:Barotrauma.TalentPrefab, character:Barotrauma.Character):Barotrauma.CharacterTalent
---@return Barotrauma.CharacterTalent
_G['CharacterTalent'].__new = function() end

