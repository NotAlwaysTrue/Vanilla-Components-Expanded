---@meta
---@class Barotrauma.StatusEffect : System.Object
---`Field Private Instance`
---@field targetTypes Barotrauma.StatusEffect.TargetType
---`Field Public Instance`
---@field TargetSlot System.Int32
---`Field Private Instance`
---@field requiredItems (System.Collections.Generic.List*1Barotrauma*RelatedItem)|(Barotrauma.RelatedItem[])
---`Field Public Instance`
---@field PropertyEffects (System.Collections.Immutable.ImmutableArray*1System*ValueTuple*2Barotrauma*Identifier*2System*Object)|(System.ValueTuple*1Barotrauma*Identifier*1System*Object[])
---`Field Private Instance`
---@field conditionalLogicalOperator Barotrauma.PropertyConditional.LogicalOperatorType
---`Field Private Instance`
---@field propertyConditionals (System.Collections.Generic.List*1Barotrauma*PropertyConditional)|(Barotrauma.PropertyConditional[])
---`Field Private Instance`
---@field setValue System.Boolean
---`Field Private Instance`
---@field disableDeltaTime System.Boolean
---`Field Private Instance`
---@field statusEffectTags (System.Collections.Generic.HashSet*1Barotrauma*Identifier)|(Barotrauma.Identifier[])
---`Field Private Instance`
---@field lifeTime System.Single
---`Field Private Instance`
---@field lifeTimer System.Single
---`Field Private Instance`
---@field intervalTimers (System.Collections.Generic.Dictionary*1Barotrauma*Entity*1System*Single)|({[Barotrauma.Entity]:(System.Single)})
---`Field Private Instance`
---@field oneShot System.Boolean
---`Field Public Instance`
---@field CheckConditionalAlways System.Boolean
---`Field Public Instance`
---@field Stackable System.Boolean
---`Field Public Instance`
---@field ResetDurationWhenReapplied System.Boolean
---`Field Public Instance`
---@field Interval System.Single
---`Field Private Instance`
---@field useItemCount System.Int32
---`Field Private Instance`
---@field removeItem System.Boolean
---`Field Private Instance`
---@field dropContainedItems System.Boolean
---`Field Private Instance`
---@field dropItem System.Boolean
---`Field Private Instance`
---@field removeCharacter System.Boolean
---`Field Private Instance`
---@field breakLimb System.Boolean
---`Field Private Instance`
---@field hideLimb System.Boolean
---`Field Private Instance`
---@field hideLimbTimer System.Single
---`Field Private Instance`
---@field containerForItemsOnCharacterRemoval Barotrauma.Identifier
---`Field Public Instance`
---@field type Barotrauma.ActionType
---`Field Private Instance`
---@field explosions (System.Collections.Generic.List*1Barotrauma*Explosion)|(Barotrauma.Explosion[])
---`Field Private Instance`
---@field spawnItems (System.Collections.Generic.List*1Barotrauma*StatusEffect*ItemSpawnInfo)|(Barotrauma.StatusEffect.ItemSpawnInfo[])
---`Field Private Instance`
---@field forceSayIdentifier Barotrauma.Identifier
---`Field Private Instance`
---@field forceSayInRadio System.Boolean
---`Field Private Instance`
---@field spawnItemRandomly System.Boolean
---`Field Private Instance`
---@field spawnCharacters (System.Collections.Generic.List*1Barotrauma*StatusEffect*CharacterSpawnInfo)|(Barotrauma.StatusEffect.CharacterSpawnInfo[])
---`Field Public Instance`
---@field refundTalents System.Boolean
---`Field Public Instance`
---@field giveTalentInfos (System.Collections.Generic.List*1Barotrauma*StatusEffect*GiveTalentInfo)|(Barotrauma.StatusEffect.GiveTalentInfo[])
---`Field Private Instance`
---@field aiTriggers (System.Collections.Generic.List*1Barotrauma*StatusEffect*AITrigger)|(Barotrauma.StatusEffect.AITrigger[])
---`Field Private Instance`
---@field triggeredEvents (System.Collections.Generic.List*1Barotrauma*EventPrefab)|(Barotrauma.EventPrefab[])
---`Field Private Instance`
---@field triggeredEventTargetTag Barotrauma.Identifier
---`Field Private Instance`
---@field triggeredEventEntityTag Barotrauma.Identifier
---`Field Private Instance`
---@field triggeredEventUserTag Barotrauma.Identifier
---`Field Private Instance`
---@field eventTargetTags (System.Collections.Generic.List*1System*ValueTuple*2Barotrauma*Identifier*2Barotrauma*Identifier)|(System.ValueTuple*1Barotrauma*Identifier*1Barotrauma*Identifier[])
---`Field Public Instance`
---@field UnlockRecipes (System.Collections.Immutable.ImmutableHashSet*1Barotrauma*Identifier)|(Barotrauma.Identifier[])
---`Field Private Instance`
---@field user Barotrauma.Character
---`Field Public Instance`
---@field FireSize System.Single
---`Field Public Instance`
---@field targetLimbs (Barotrauma.LimbType-arr)|(Barotrauma.LimbType[])
---`Field Public Instance`
---@field SeverLimbsProbability System.Single
---`Field Private Instance`
---@field randomCondition Microsoft.Xna.Framework.Vector2
---`Field Public Instance`
---@field sourceBody Barotrauma.PhysicsBody
---`Field Public Instance`
---@field OnlyInside System.Boolean
---`Field Public Instance`
---@field OnlyOutside System.Boolean
---`Field Public Instance`
---@field OnlyWhenDamagedByPlayer System.Boolean
---`Field Public Instance`
---@field AllowWhenBroken System.Boolean
---`Field Public Instance`
---@field TargetIdentifiers (System.Collections.Immutable.ImmutableHashSet*1Barotrauma*Identifier)|(Barotrauma.Identifier[])
---`Field Public Instance`
---@field TargetItemComponent System.String
---`Field Private Instance`
---@field requiredAfflictions (System.Collections.Generic.HashSet*1System*ValueTuple*2Barotrauma*Identifier*2System*Single)|(System.ValueTuple*1Barotrauma*Identifier*1System*Single[])
---`Field Public Instance`
---@field AfflictionMultiplier System.Single
---`Field Private Instance`
---@field multiplyAfflictionsByMaxVitality System.Boolean
---`Field Public Instance`
---@field ReduceAffliction (System.Collections.Generic.List*1System*ValueTuple*2Barotrauma*Identifier*2System*Single)|(System.ValueTuple*1Barotrauma*Identifier*1System*Single[])
---`Field Private Instance`
---@field talentTriggers (System.Collections.Generic.List*1Barotrauma*Identifier)|(Barotrauma.Identifier[])
---`Field Private Instance`
---@field giveExperiences (System.Collections.Generic.List*1System*Int32)|(System.Int32[])
---`Field Private Instance`
---@field giveSkills (System.Collections.Generic.List*1Barotrauma*StatusEffect*GiveSkill)|(Barotrauma.StatusEffect.GiveSkill[])
---`Field Private Instance`
---@field luaHook (System.Collections.Generic.List*1System*ValueTuple*2System*String*2Barotrauma*ContentXElement)|(System.ValueTuple*1System*String*1Barotrauma*ContentXElement[])
---`Field Private Instance`
---@field failedAnimations (System.Collections.Generic.HashSet*1System*ValueTuple*2Barotrauma*Character*2Barotrauma*StatusEffect*AnimLoadInfo)|(System.ValueTuple*1Barotrauma*Character*1Barotrauma*StatusEffect*AnimLoadInfo[])
---`Field Private Instance`
---@field animationsToTrigger (System.Collections.Generic.List*1Barotrauma*StatusEffect*AnimLoadInfo)|(Barotrauma.StatusEffect.AnimLoadInfo[])
---`Field Public Instance`
---@field Duration System.Single
---`Field NonPublic Instance`
---@field currentTargets (System.Collections.Generic.List*1Barotrauma*ISerializableEntity)|(Barotrauma.ISerializableEntity[])
---`Field Private Static`
---@field FieldNames (System.Collections.Immutable.ImmutableHashSet*1Barotrauma*Identifier)|(Barotrauma.Identifier[])
---`Field Public Static`
---@field DurationList (System.Collections.Generic.List*1Barotrauma*DurationListElement)|(Barotrauma.DurationListElement[])
---`Field Private Static`
---@field intervalsToRemove (System.Collections.Generic.List*1Barotrauma*Entity)|(Barotrauma.Entity[])
---`Getter Public Instance`
---@field HasConditions System.Boolean
---`Getter Public Instance`
---@field Explosions (System.Collections.Generic.IEnumerable*1Barotrauma*Explosion)|(fun():(Barotrauma.Explosion))
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field Afflictions (System.Collections.Generic.List*1Barotrauma*Affliction)|(Barotrauma.Affliction[])
---`Getter Public Instance`
---@field SpawnCharacters (System.Collections.Generic.IEnumerable*1Barotrauma*StatusEffect*CharacterSpawnInfo)|(fun():(Barotrauma.StatusEffect.CharacterSpawnInfo))
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field Range System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field Offset Microsoft.Xna.Framework.Vector2
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field RandomOffset System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Tags System.String
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field Disabled System.Boolean
_G['StatusEffect'] = {}

---`Method Public Static`
---@param element Barotrauma.ContentXElement
---@param parentDebugName System.String
---@return Barotrauma.StatusEffect
_G['StatusEffect'].Load = function(element, parentDebugName) end

---`Method Public Instance`
---@param targetType Barotrauma.StatusEffect.TargetType
---@return System.Boolean
_G['StatusEffect'].HasTargetType = function(targetType) end

---`Method Public Instance`
---@return System.Boolean
_G['StatusEffect'].ReducesItemCondition = function() end

---`Method Public Instance`
---@return System.Boolean
_G['StatusEffect'].IncreasesItemCondition = function() end

---`Method Private Instance`
---@param propertyName Barotrauma.Identifier
---@param value System.Object
---@param conditionValue System.Single-ref
---@return System.Boolean
_G['StatusEffect'].ChangesItemCondition = function(propertyName, value, conditionValue) end

---`Method Public Instance`
---@param itemPrefab Barotrauma.ItemPrefab
---@return System.Boolean
_G['StatusEffect'].MatchesTagConditionals = function(itemPrefab) end

---`Method Public Instance`
---@param attackResult Barotrauma.AttackResult
---@return System.Boolean
_G['StatusEffect'].HasRequiredAfflictions = function(attackResult) end

---`Method Public Instance Virtual`
---@param entity Barotrauma.Entity
---@return System.Boolean
_G['StatusEffect'].HasRequiredItems = function(entity) end

---`Method Public Instance`
---@param worldPosition Microsoft.Xna.Framework.Vector2
---@param targets (System.Collections.Generic.List*1Barotrauma*ISerializableEntity)|(Barotrauma.ISerializableEntity[])
_G['StatusEffect'].AddNearbyTargets = function(worldPosition, targets) end

---`Method Public Instance`
---@param targets (System.Collections.Generic.IReadOnlyList*1Barotrauma*ISerializableEntity)|(Barotrauma.ISerializableEntity[])
---@return System.Boolean
_G['StatusEffect'].HasRequiredConditions = function(targets) end

---`Method Private Instance`
---@param targets (System.Collections.Generic.IReadOnlyList*1Barotrauma*ISerializableEntity)|(Barotrauma.ISerializableEntity[])
---@param conditionals (System.Collections.Generic.IReadOnlyList*1Barotrauma*PropertyConditional)|(Barotrauma.PropertyConditional[])
---@param targetingContainer? System.Boolean
---@return System.Boolean
_G['StatusEffect'].HasRequiredConditions = function(targets, conditionals, targetingContainer) end

---`Method Private Static`
---@param condition System.Boolean
---@param valueToReturn System.Boolean-ref
---@return System.Boolean
_G['StatusEffect'].ShouldShortCircuitLogicalOrOperator = function(condition, valueToReturn) end

---`Method Private Static`
---@param condition System.Boolean
---@param valueToReturn System.Boolean-ref
---@return System.Boolean
_G['StatusEffect'].ShouldShortCircuitLogicalAndOperator = function(condition, valueToReturn) end

---`Method NonPublic Instance`
---@overload fun(entity:Barotrauma.ISerializableEntity):(System.Boolean)
---@overload fun(itemComponent:Barotrauma.Items.Components.ItemComponent):(System.Boolean)
---@overload fun(item:Barotrauma.Item):(System.Boolean)
---@param character Barotrauma.Character
---@return System.Boolean
_G['StatusEffect'].IsValidTarget = function(character) end

---`Method Public Instance`
---@param user Barotrauma.Character
_G['StatusEffect'].SetUser = function(user) end

---`Method Public Instance`
---@param entity Barotrauma.Entity
---@param deltaTime System.Single
---@return System.Boolean
_G['StatusEffect'].ShouldWaitForInterval = function(entity, deltaTime) end

---`Method Public Instance Virtual`
---@overload fun(type:Barotrauma.ActionType, deltaTime:System.Single, entity:Barotrauma.Entity, target:Barotrauma.ISerializableEntity, worldPosition?:System.Nullable*1Microsoft*Xna*Framework*Vector2)
---@param type Barotrauma.ActionType
---@param deltaTime System.Single
---@param entity Barotrauma.Entity
---@param targets (System.Collections.Generic.IReadOnlyList*1Barotrauma*ISerializableEntity)|(Barotrauma.ISerializableEntity[])
---@param worldPosition? System.Nullable*1Microsoft*Xna*Framework*Vector2
_G['StatusEffect'].Apply = function(type, deltaTime, entity, targets, worldPosition) end

---`Method NonPublic Instance`
---@param deltaTime System.Single
---@param entity Barotrauma.Entity
---@param targets (System.Collections.Generic.IReadOnlyList*1Barotrauma*ISerializableEntity)|(Barotrauma.ISerializableEntity[])
---@param worldPosition? System.Nullable*1Microsoft*Xna*Framework*Vector2
_G['StatusEffect'].Apply = function(deltaTime, entity, targets, worldPosition) end

---`Method Private Instance`
---@param entity Barotrauma.Entity
---@return Barotrauma.Hull
_G['StatusEffect'].GetHull = function(entity) end

---`Method NonPublic Instance`
---@param entity Barotrauma.Entity
---@param targets (System.Collections.Generic.IReadOnlyList*1Barotrauma*ISerializableEntity)|(Barotrauma.ISerializableEntity[])
---@param worldPosition? System.Nullable*1Microsoft*Xna*Framework*Vector2
---@return Microsoft.Xna.Framework.Vector2
_G['StatusEffect'].GetPosition = function(entity, targets, worldPosition) end

---`Method Private Instance`
---@param limb Barotrauma.Limb
---@return System.Boolean
_G['StatusEffect'].IsValidTargetLimb = function(limb) end

---`Method Private Static`
---@param target Barotrauma.ISerializableEntity
---@return Barotrauma.Character
_G['StatusEffect'].GetCharacterFromTarget = function(target) end

---`Method Private Instance`
---@param character Barotrauma.Character
_G['StatusEffect'].RemoveCharacter = function(character) end

---`Method Private Instance`
---@param chosenItemSpawnInfo Barotrauma.StatusEffect.ItemSpawnInfo
---@param entity Barotrauma.Entity
---@param sourceBody Barotrauma.PhysicsBody
---@param position Microsoft.Xna.Framework.Vector2
---@param targetEntity Barotrauma.Entity
_G['StatusEffect'].SpawnItem = function(chosenItemSpawnInfo, entity, sourceBody, position, targetEntity) end

---`Method Private Instance`
---@param target Barotrauma.ISerializableEntity
---@param entity Barotrauma.Entity
_G['StatusEffect'].TryTriggerAnimation = function(target, entity) end

---`Method Private Instance`
---@param target Barotrauma.ISerializableEntity
---@param property Barotrauma.SerializableProperty
---@param value System.Object
---@param deltaTime System.Single
_G['StatusEffect'].ApplyToProperty = function(target, property, value, deltaTime) end

---`Method Private Instance`
---@param currValue System.Single
---@param newValue System.Single
---@param deltaTime System.Single
---@return System.Single
_G['StatusEffect'].GetModifiedValue = function(currValue, newValue, deltaTime) end

---`Method Public Static`
---@param deltaTime System.Single
_G['StatusEffect'].UpdateAll = function(deltaTime) end

---`Method Private Instance`
---@param entity Barotrauma.Entity
---@param targetCharacter Barotrauma.Character
---@param deltaTime System.Single
---@return System.Single
_G['StatusEffect'].GetAfflictionMultiplier = function(entity, targetCharacter, deltaTime) end

---`Method Private Instance`
---@param affliction Barotrauma.Affliction
---@param entity Barotrauma.Entity
---@param targetCharacter Barotrauma.Character
---@param deltaTime System.Single
---@param multiplyByMaxVitality System.Boolean
---@return Barotrauma.Affliction
_G['StatusEffect'].GetMultipliedAffliction = function(affliction, entity, targetCharacter, deltaTime, multiplyByMaxVitality) end

---`Method Private Instance`
---@param user Barotrauma.Character
---@param item Barotrauma.Item
---@param limb Barotrauma.Limb
---@param affliction Barotrauma.Affliction
---@param result Barotrauma.AttackResult
_G['StatusEffect'].RegisterTreatmentResults = function(user, item, limb, affliction, result) end

---`Method Public Static`
_G['StatusEffect'].StopAll = function() end

---`Method Public Instance`
---@param tag Barotrauma.Identifier
_G['StatusEffect'].AddTag = function(tag) end

---`Method Public Instance`
---@param tag Barotrauma.Identifier
---@return System.Boolean
_G['StatusEffect'].HasTag = function(tag) end

---`Constructor Private Static`
---@overload fun():Barotrauma.StatusEffect
---@param element Barotrauma.ContentXElement
---@param parentDebugName System.String
---@return Barotrauma.StatusEffect
_G['StatusEffect'] = function(element, parentDebugName) end

---`Constructor Private Static`
---@overload fun():Barotrauma.StatusEffect
---@param element Barotrauma.ContentXElement
---@param parentDebugName System.String
---@return Barotrauma.StatusEffect
_G['StatusEffect'].__new = function(element, parentDebugName) end

---`Constructor NonPublic Instance`
---@overload fun():Barotrauma.StatusEffect
---@param element Barotrauma.ContentXElement
---@param parentDebugName System.String
---@return Barotrauma.StatusEffect
_G['StatusEffect'] = function(element, parentDebugName) end

---`Constructor NonPublic Instance`
---@overload fun():Barotrauma.StatusEffect
---@param element Barotrauma.ContentXElement
---@param parentDebugName System.String
---@return Barotrauma.StatusEffect
_G['StatusEffect'].__new = function(element, parentDebugName) end

