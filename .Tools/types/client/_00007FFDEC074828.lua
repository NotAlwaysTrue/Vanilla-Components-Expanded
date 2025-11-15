---@meta
---@class Barotrauma.AfflictionPrefab : Barotrauma.PrefabWithUintIdentifier
---`Field Private Instance`
---@field configElement Barotrauma.ContentXElement
---`Field Public Instance`
---@field Name Barotrauma.LocalizedString
---`Field Public Instance`
---@field CauseOfDeathDescription Barotrauma.LocalizedString
---`Field Public Instance`
---@field SelfCauseOfDeathDescription Barotrauma.LocalizedString
---`Field Private Instance`
---@field defaultDescription Barotrauma.LocalizedString
---`Field Public Instance`
---@field Descriptions (System.Collections.Immutable.ImmutableList*1Barotrauma*AfflictionPrefab*Description)|(Barotrauma.AfflictionPrefab.Description[])
---`Field Public Instance`
---@field ShowDescriptionInTooltip System.Boolean
---`Field Public Instance`
---@field AfflictionType Barotrauma.Identifier
---`Field Public Instance`
---@field LimbSpecific System.Boolean
---`Field Public Instance`
---@field IndicatorLimb Barotrauma.LimbType
---`Field Public Instance`
---@field TranslationIdentifier Barotrauma.Identifier
---`Field Public Instance`
---@field IsBuff System.Boolean
---`Field Public Instance`
---@field AffectMachines System.Boolean
---`Field Public Instance`
---@field HealableInMedicalClinic System.Boolean
---`Field Public Instance`
---@field HealCostMultiplier System.Single
---`Field Public Instance`
---@field BaseHealCost System.Int32
---`Field Public Instance`
---@field ShowBarInHealthMenu System.Boolean
---`Field Public Instance`
---@field HideIconAfterDelay System.Boolean
---`Field Public Instance`
---@field ActivationThreshold System.Single
---`Field Public Instance`
---@field ShowIconThreshold System.Single
---`Field Public Instance`
---@field ShowIconToOthersThreshold System.Single
---`Field Public Instance`
---@field MaxStrength System.Single
---`Field Public Instance`
---@field GrainBurst System.Single
---`Field Public Instance`
---@field ShowInHealthScannerThreshold System.Single
---`Field Public Instance`
---@field TreatmentThreshold System.Single
---`Field Public Instance`
---@field TreatmentSuggestionThreshold System.Single
---`Field Public Instance`
---@field IgnoreTreatmentIfAfflictedBy (System.Collections.Immutable.ImmutableHashSet*1Barotrauma*Identifier)|(Barotrauma.Identifier[])
---`Field Public Instance`
---@field Duration System.Single
---`Field Public Instance`
---@field KarmaChangeOnApplied System.Single
---`Field Public Instance`
---@field BurnOverlayAlpha System.Single
---`Field Public Instance`
---@field DamageOverlayAlpha System.Single
---`Field Public Instance`
---@field AchievementOnReceived Barotrauma.Identifier
---`Field Public Instance`
---@field AchievementOnRemoved Barotrauma.Identifier
---`Field Public Instance`
---@field IconColors (Microsoft.Xna.Framework.Color-arr)|(Microsoft.Xna.Framework.Color[])
---`Field Public Instance`
---@field AfflictionOverlayAlphaIsLinear System.Boolean
---`Field Public Instance`
---@field ResetBetweenRounds System.Boolean
---`Field Public Instance`
---@field DamageParticles System.Boolean
---`Field Public Instance`
---@field MedicalSkillGain System.Single
---`Field Public Instance`
---@field WeaponsSkillGain System.Single
---`Field Private Instance`
---@field effects (System.Collections.Generic.List*1Barotrauma*AfflictionPrefab*Effect)|(Barotrauma.AfflictionPrefab.Effect[])
---`Field Private Instance`
---@field periodicEffects (System.Collections.Generic.List*1Barotrauma*AfflictionPrefab*PeriodicEffect)|(Barotrauma.AfflictionPrefab.PeriodicEffect[])
---`Field Private Instance`
---@field constructor System.Reflection.ConstructorInfo
---`Field Public Instance`
---@field Icon Barotrauma.Sprite
---`Field Public Instance`
---@field AfflictionOverlay Barotrauma.Sprite
---`Field Public Static`
---@field DamageType Barotrauma.Identifier
---`Field Public Static`
---@field BurnType Barotrauma.Identifier
---`Field Public Static`
---@field BleedingType Barotrauma.Identifier
---`Field Public Static`
---@field ParalysisType Barotrauma.Identifier
---`Field Public Static`
---@field PoisonType Barotrauma.Identifier
---`Field Public Static`
---@field StunType Barotrauma.Identifier
---`Field Public Static`
---@field EMPType Barotrauma.Identifier
---`Field Public Static`
---@field SpaceHerpesType Barotrauma.Identifier
---`Field Public Static`
---@field AlienInfectedType Barotrauma.Identifier
---`Field Public Static`
---@field InvertControlsType Barotrauma.Identifier
---`Field Public Static`
---@field DisguisedAsHuskType Barotrauma.Identifier
---`Field Public Static`
---@field Prefabs (Barotrauma.PrefabCollection*1Barotrauma*AfflictionPrefab)|(fun():(Barotrauma.AfflictionPrefab))
---`Getter Public Static`
---@field InternalDamage Barotrauma.AfflictionPrefab
---`Getter Public Static`
---@field BiteWounds Barotrauma.AfflictionPrefab
---`Getter Public Static`
---@field ImpactDamage Barotrauma.AfflictionPrefab
---`Getter Public Static`
---@field Bleeding Barotrauma.AfflictionPrefab
---`Getter Public Static`
---@field Burn Barotrauma.AfflictionPrefab
---`Getter Public Static`
---@field OxygenLow Barotrauma.AfflictionPrefab
---`Getter Public Static`
---@field Bloodloss Barotrauma.AfflictionPrefab
---`Getter Public Static`
---@field Pressure Barotrauma.AfflictionPrefab
---`Getter Public Static`
---@field OrganDamage Barotrauma.AfflictionPrefab
---`Getter Public Static`
---@field Stun Barotrauma.AfflictionPrefab
---`Getter Public Static`
---@field RadiationSickness Barotrauma.AfflictionPrefab
---`Getter Public Static`
---@field HuskInfection Barotrauma.AfflictionPrefab
---`Getter Public Static`
---@field JovianRadiation Barotrauma.AfflictionPrefab
---`Getter Public Static`
---@field List (System.Collections.Generic.IEnumerable*1Barotrauma*AfflictionPrefab)|(fun():(Barotrauma.AfflictionPrefab))
---`Getter Public Instance`
---<br/>`Setter NonPublic Instance`
---@field TargetSpecies (Barotrauma.Identifier-arr)|(Barotrauma.Identifier[])
---`Getter Public Instance`
---@field Effects (System.Collections.Generic.IEnumerable*1Barotrauma*AfflictionPrefab*Effect)|(fun():(Barotrauma.AfflictionPrefab.Effect))
---`Getter Public Instance`
---@field PeriodicEffects (System.Collections.Generic.IList*1Barotrauma*AfflictionPrefab*PeriodicEffect)|(Barotrauma.AfflictionPrefab.PeriodicEffect[])
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field AfflictionOverlayAnimSpeed System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field TreatmentSuitabilities (System.Collections.Immutable.ImmutableDictionary*1Barotrauma*Identifier*1System*Single)|({[Barotrauma.Identifier]:(System.Single)})
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field HasTreatments System.Boolean
_G['AfflictionPrefab'] = {}

---`Method Public Instance Virtual`
_G['AfflictionPrefab'].Dispose = function() end

---`Method Private Instance`
_G['AfflictionPrefab'].RefreshTreatmentSuitabilities = function() end

---`Method Public Instance`
---@param strength System.Single
---@param targetType Barotrauma.AfflictionPrefab.Description.TargetType
---@return Barotrauma.LocalizedString
_G['AfflictionPrefab'].GetDescription = function(strength, targetType) end

---`Method Public Static`
_G['AfflictionPrefab'].LoadAllEffectsAndTreatmentSuitabilities = function() end

---`Method Public Static`
_G['AfflictionPrefab'].ClearAllEffects = function() end

---`Method Private Instance`
_G['AfflictionPrefab'].LoadEffects = function() end

---`Method Private Instance`
_G['AfflictionPrefab'].ClearEffects = function() end

---`Method Public Instance`
_G['AfflictionPrefab'].ReloadSoundsIfNeeded = function() end

---`Method Public Instance Virtual`
---@return System.String
_G['AfflictionPrefab'].ToString = function() end

---`Method Public Instance`
---@param strength System.Single
---@param source? Barotrauma.Character
---@return Barotrauma.Affliction
_G['AfflictionPrefab'].Instantiate = function(strength, source) end

---`Method Public Instance`
---@param currentStrength System.Single
---@return Barotrauma.AfflictionPrefab.Effect
_G['AfflictionPrefab'].GetActiveEffect = function(currentStrength) end

---`Method Public Instance`
---@param item Barotrauma.Item
---@return System.Single
_G['AfflictionPrefab'].GetTreatmentSuitability = function(item) end

---`Constructor Public Instance`
---@overload fun(element:Barotrauma.ContentXElement, file:Barotrauma.AfflictionsFile, type:System.Type):Barotrauma.AfflictionPrefab
---@return Barotrauma.AfflictionPrefab
_G['AfflictionPrefab'] = function() end

---`Constructor Public Instance`
---@overload fun(element:Barotrauma.ContentXElement, file:Barotrauma.AfflictionsFile, type:System.Type):Barotrauma.AfflictionPrefab
---@return Barotrauma.AfflictionPrefab
_G['AfflictionPrefab'].__new = function() end

---`Constructor Private Static`
---@overload fun(element:Barotrauma.ContentXElement, file:Barotrauma.AfflictionsFile, type:System.Type):Barotrauma.AfflictionPrefab
---@return Barotrauma.AfflictionPrefab
_G['AfflictionPrefab'] = function() end

---`Constructor Private Static`
---@overload fun(element:Barotrauma.ContentXElement, file:Barotrauma.AfflictionsFile, type:System.Type):Barotrauma.AfflictionPrefab
---@return Barotrauma.AfflictionPrefab
_G['AfflictionPrefab'].__new = function() end

