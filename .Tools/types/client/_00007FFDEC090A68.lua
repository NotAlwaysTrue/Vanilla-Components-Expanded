---@meta
---@class Barotrauma.Affliction : System.Object
---`Field Public Instance`
---@field Prefab Barotrauma.AfflictionPrefab
---`Field Private Instance`
---@field fluctuationTimer System.Single
---`Field Private Instance`
---@field activeEffect Barotrauma.AfflictionPrefab.Effect
---`Field Private Instance`
---@field prevActiveEffectStrength System.Single
---`Field NonPublic Instance`
---@field activeEffectDirty System.Boolean
---`Field NonPublic Instance`
---@field _strength System.Single
---`Field Private Instance`
---@field _nonClampedStrength System.Single
---`Field Public Instance`
---@field DamagePerSecond System.Single
---`Field Public Instance`
---@field DamagePerSecondTimer System.Single
---`Field Public Instance`
---@field PreviousVitalityDecrease System.Single
---`Field Public Instance`
---@field StrengthDiminishMultiplier System.ValueTuple*1System*Single*1Barotrauma*Affliction
---`Field Public Instance`
---@field PeriodicEffectTimers (System.Collections.Generic.Dictionary*1Barotrauma*AfflictionPrefab*PeriodicEffect*1System*Single)|({[Barotrauma.AfflictionPrefab.PeriodicEffect]:(System.Single)})
---`Field Public Instance`
---@field AppliedAsSuccessfulTreatmentTime System.Double
---`Field Public Instance`
---@field AppliedAsFailedTreatmentTime System.Double
---`Field Public Instance`
---@field Duration System.Single
---`Field Public Instance`
---@field Source Barotrauma.Character
---`Field Private Instance`
---@field targets (System.Collections.Generic.List*1Barotrauma*ISerializableEntity)|(Barotrauma.ISerializableEntity[])
---`Field Private Static`
---@field strengthTexts (Barotrauma.LocalizedString-arr)|(Barotrauma.LocalizedString[])
---`Getter Public Instance Virtual`
---@field Name System.String
---`Getter Public Instance Virtual`
---<br/>`Setter Public Instance`
---@field SerializableProperties (System.Collections.Generic.Dictionary*1Barotrauma*Identifier*1Barotrauma*SerializableProperty)|({[Barotrauma.Identifier]:(Barotrauma.SerializableProperty)})
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field PendingGrainEffectStrength System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field GrainEffectStrength System.Single
---`Getter Public Instance Virtual`
---<br/>`Setter Public Instance Virtual`
---@field Strength System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Penetration System.Single
---`Getter Public Instance`
---@field NonClampedStrength System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field Identifier Barotrauma.Identifier
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Probability System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field DivideByLimbCount System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field MultiplyByMaxVitality System.Boolean
_G['Affliction'] = {}

---`Method Public Instance`
---@param source Barotrauma.Affliction
_G['Affliction'].CopyProperties = function(source) end

---`Method Public Instance`
---@param element System.Xml.Linq.XElement
_G['Affliction'].Serialize = function(element) end

---`Method Public Instance`
---@param element System.Xml.Linq.XElement
_G['Affliction'].Deserialize = function(element) end

---`Method Public Instance`
---@param multiplier System.Single
---@param affliction Barotrauma.Affliction
---@return Barotrauma.Affliction
_G['Affliction'].CreateMultiplied = function(multiplier, affliction) end

---`Method Public Instance Virtual`
---@return System.String
_G['Affliction'].ToString = function() end

---`Method Public Instance`
---@return Barotrauma.LocalizedString
_G['Affliction'].GetStrengthText = function() end

---`Method Public Static`
---@param strength System.Single
---@param maxStrength System.Single
---@return Barotrauma.LocalizedString
_G['Affliction'].GetStrengthText = function(strength, maxStrength) end

---`Method Public Instance`
---@return Barotrauma.AfflictionPrefab.Effect
_G['Affliction'].GetActiveEffect = function() end

---`Method Public Instance`
---@overload fun(characterHealth:Barotrauma.CharacterHealth):(System.Single)
---@param characterHealth Barotrauma.CharacterHealth
---@param strength System.Single
---@return System.Single
_G['Affliction'].GetVitalityDecrease = function(characterHealth, strength) end

---`Method Public Instance`
---@return System.Single
_G['Affliction'].GetScreenGrainStrength = function() end

---`Method Public Instance`
---@return System.Single
_G['Affliction'].GetScreenDistortStrength = function() end

---`Method Public Instance`
---@return System.Single
_G['Affliction'].GetRadialDistortStrength = function() end

---`Method Public Instance`
---@return System.Single
_G['Affliction'].GetChromaticAberrationStrength = function() end

---`Method Public Instance`
---@return System.Single
_G['Affliction'].GetAfflictionOverlayMultiplier = function() end

---`Method Public Instance`
---@return Microsoft.Xna.Framework.Color
_G['Affliction'].GetFaceTint = function() end

---`Method Public Instance`
---@return Microsoft.Xna.Framework.Color
_G['Affliction'].GetBodyTint = function() end

---`Method Public Instance`
---@return System.Single
_G['Affliction'].GetScreenBlurStrength = function() end

---`Method Private Instance`
---@param currentEffect Barotrauma.AfflictionPrefab.Effect
---@return System.Single
_G['Affliction'].GetScreenEffectFluctuation = function(currentEffect) end

---`Method Public Instance`
---@return System.Single
_G['Affliction'].GetSkillMultiplier = function() end

---`Method Public Instance`
---@param currentVitalityDecrease System.Single
_G['Affliction'].CalculateDamagePerSecond = function(currentVitalityDecrease) end

---`Method Public Instance`
---@param afflictionId Barotrauma.Identifier
---@param limbType Barotrauma.LimbType
---@return System.Single
_G['Affliction'].GetResistance = function(afflictionId, limbType) end

---`Method Public Instance`
---@return System.Single
_G['Affliction'].GetSpeedMultiplier = function() end

---`Method Public Instance`
---@param statType Barotrauma.StatTypes
---@return System.Single
_G['Affliction'].GetStatValue = function(statType) end

---`Method Public Instance`
---@param flagType Barotrauma.AbilityFlags
---@return System.Boolean
_G['Affliction'].HasFlag = function(flagType) end

---`Method Private Instance`
---@return Barotrauma.AfflictionPrefab.Effect
_G['Affliction'].GetViableEffect = function() end

---`Method Public Instance Virtual`
---@param characterHealth Barotrauma.CharacterHealth
---@param targetLimb Barotrauma.Limb
---@param deltaTime System.Single
_G['Affliction'].Update = function(characterHealth, targetLimb, deltaTime) end

---`Method Public Instance`
---@param type Barotrauma.ActionType
---@param deltaTime System.Single
---@param characterHealth Barotrauma.CharacterHealth
---@param targetLimb Barotrauma.Limb
_G['Affliction'].ApplyStatusEffects = function(type, deltaTime, characterHealth, targetLimb) end

---`Method Public Instance`
---@param type Barotrauma.ActionType
---@param statusEffect Barotrauma.StatusEffect
---@param deltaTime System.Single
---@param characterHealth Barotrauma.CharacterHealth
---@param targetLimb Barotrauma.Limb
_G['Affliction'].ApplyStatusEffect = function(type, statusEffect, deltaTime, characterHealth, targetLimb) end

---`Method Public Instance`
---@param strength System.Single
_G['Affliction'].SetStrength = function(strength) end

---`Method Public Instance`
---@param afflictedCharacter Barotrauma.Character
---@return System.Boolean
_G['Affliction'].ShouldShowIcon = function(afflictedCharacter) end

---`Constructor Public Instance`
---@overload fun(prefab:Barotrauma.AfflictionPrefab, strength:System.Single):Barotrauma.Affliction
---@return Barotrauma.Affliction
_G['Affliction'] = function() end

---`Constructor Public Instance`
---@overload fun(prefab:Barotrauma.AfflictionPrefab, strength:System.Single):Barotrauma.Affliction
---@return Barotrauma.Affliction
_G['Affliction'].__new = function() end

---`Constructor Private Static`
---@overload fun(prefab:Barotrauma.AfflictionPrefab, strength:System.Single):Barotrauma.Affliction
---@return Barotrauma.Affliction
_G['Affliction'] = function() end

---`Constructor Private Static`
---@overload fun(prefab:Barotrauma.AfflictionPrefab, strength:System.Single):Barotrauma.Affliction
---@return Barotrauma.Affliction
_G['Affliction'].__new = function() end

