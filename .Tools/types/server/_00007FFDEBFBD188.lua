---@meta
---@class Barotrauma.Attack : System.Object
---`Field Private Instance`
---@field _range System.Single
---`Field Private Instance`
---@field _damageRange System.Single
---`Field Private Instance`
---@field _structureDamage System.Single
---`Field Private Instance`
---@field _itemDamage System.Single
---`Field Private Instance`
---@field _damageMultiplier System.Nullable*1System*Single
---`Field Private Instance`
---@field initialDamageMultiplier System.Single
---`Field Private Instance`
---@field _levelWallDamage System.Single
---`Field Public Instance`
---@field ForceOnLimbIndices (System.Collections.Generic.List*1System*Int32)|(System.Int32[])
---`Field Public Instance`
---@field Afflictions (System.Collections.Generic.Dictionary*1Barotrauma*Affliction*1System*Xml*Linq*XElement)|({[Barotrauma.Affliction]:(System.Xml.Linq.XElement)})
---`Field Private Instance`
---@field statusEffects (System.Collections.Generic.List*1Barotrauma*StatusEffect)|(Barotrauma.StatusEffect[])
---`Field Private Instance`
---@field targets (System.Collections.Generic.List*1Barotrauma*ISerializableEntity)|(Barotrauma.ISerializableEntity[])
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field Context Barotrauma.AttackContext
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field TargetType Barotrauma.AttackTarget
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field TargetLimbType Barotrauma.LimbType
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field HitDetectionType Barotrauma.HitDetection
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field AfterAttack Barotrauma.AIBehaviorAfterAttack
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field AfterAttackDelay System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field AfterAttackSecondary Barotrauma.AIBehaviorAfterAttack
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field AfterAttackSecondaryDelay System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field Reverse System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field SnapRopeOnNewAttack System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field Retreat System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Range System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field DamageRange System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field MinRange System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field Duration System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field CoolDown System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field SecondaryCoolDown System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field CoolDownRandomFactor System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field FullSpeedAfterAttack System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field StructureDamage System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field CreateWallDamageProjectiles System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field EmitStructureDamageParticles System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field ItemDamage System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field Penetration System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field DamageMultiplier System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field RangeMultiplier System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field ImpactMultiplier System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field LevelWallDamage System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Ranged System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field AvoidFriendlyFire System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field RequiredAngle System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field RequiredAngleToShoot System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field AimRotationTorque System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field RotationLimbIndex System.Int32
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field SwayAmount System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field SwayFrequency System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Stun System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field OnlyHumans System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field ApplyForceOnLimbs System.String
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field Force System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field RootForceWorldStart Microsoft.Xna.Framework.Vector2
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field RootForceWorldMiddle Microsoft.Xna.Framework.Vector2
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field RootForceWorldEnd Microsoft.Xna.Framework.Vector2
---`Getter Public Instance`
---@field HasRootForce System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field RootTransitionEasing Barotrauma.TransitionMode
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field Torque System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field ApplyForcesOnlyOnce System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field TargetImpulse System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field TargetImpulseWorld Microsoft.Xna.Framework.Vector2
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field TargetForce System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field TargetForceWorld Microsoft.Xna.Framework.Vector2
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field SubmarineImpactMultiplier System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field SeverLimbsProbability System.Single
---`Getter Public Instance`
---@field StickChance System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field Priority System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field Blink System.Boolean
---`Getter Public Instance`
---@field StatusEffects (System.Collections.Generic.IEnumerable*1Barotrauma*StatusEffect)|(fun():(Barotrauma.StatusEffect))
---`Getter Public Instance Virtual`
---@field Name System.String
---`Getter Public Instance Virtual`
---<br/>`Setter Private Instance`
---@field SerializableProperties (System.Collections.Generic.Dictionary*1Barotrauma*Identifier*1Barotrauma*SerializableProperty)|({[Barotrauma.Identifier]:(Barotrauma.SerializableProperty)})
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field Conditionals (System.Collections.Generic.List*1Barotrauma*PropertyConditional)|(Barotrauma.PropertyConditional[])
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field SourceItem Barotrauma.Item
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field AttackTimer System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field CoolDownTimer System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field CurrentRandomCoolDown System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field SecondaryCoolDownTimer System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field IsRunning System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field AfterAttackTimer System.Single
_G['Attack'] = {}

---`Method Public Instance`
_G['Attack'].ResetDamageMultiplier = function() end

---`Method Public Instance`
---@param value System.Single
_G['Attack'].SetInitialDamageMultiplier = function(value) end

---`Method Public Instance`
---@param user Barotrauma.Character
_G['Attack'].SetUser = function(user) end

---`Method Public Instance`
---@param multiplier System.Single
---@return (System.Collections.Generic.List*1Barotrauma*Affliction)|(Barotrauma.Affliction[])
_G['Attack'].GetMultipliedAfflictions = function(multiplier) end

---`Method Public Instance`
---@param deltaTime System.Single
---@return System.Single
_G['Attack'].GetStructureDamage = function(deltaTime) end

---`Method Public Instance`
---@param deltaTime System.Single
---@return System.Single
_G['Attack'].GetLevelWallDamage = function(deltaTime) end

---`Method Public Instance`
---@param deltaTime System.Single
---@param multiplier? System.Single
---@return System.Single
_G['Attack'].GetItemDamage = function(deltaTime, multiplier) end

---`Method Public Instance`
---@param includeStructureDamage? System.Boolean
---@return System.Single
_G['Attack'].GetTotalDamage = function(includeStructureDamage) end

---`Method Public Instance`
---@param element Barotrauma.ContentXElement
---@param parentDebugName System.String
_G['Attack'].ReloadAfflictions = function(element, parentDebugName) end

---`Method Public Instance`
---@param element Barotrauma.ContentXElement
_G['Attack'].Serialize = function(element) end

---`Method Public Instance`
---@param element Barotrauma.ContentXElement
---@param parentDebugName System.String
_G['Attack'].Deserialize = function(element, parentDebugName) end

---`Method Public Instance`
---@param attacker Barotrauma.Character
---@param target Barotrauma.IDamageable
---@param worldPosition Microsoft.Xna.Framework.Vector2
---@param deltaTime System.Single
---@param playSound? System.Boolean
---@param sourceBody? Barotrauma.PhysicsBody
---@param sourceLimb? Barotrauma.Limb
---@return Barotrauma.AttackResult
_G['Attack'].DoDamage = function(attacker, target, worldPosition, deltaTime, playSound, sourceBody, sourceLimb) end

---`Method Public Instance`
---@param attacker Barotrauma.Character
---@param targetLimb Barotrauma.Limb
---@param worldPosition Microsoft.Xna.Framework.Vector2
---@param deltaTime System.Single
---@param playSound? System.Boolean
---@param sourceBody? Barotrauma.PhysicsBody
---@param sourceLimb? Barotrauma.Limb
---@return Barotrauma.AttackResult
_G['Attack'].DoDamageToLimb = function(attacker, targetLimb, worldPosition, deltaTime, playSound, sourceBody, sourceLimb) end

---`Method Private Instance`
---@param target Barotrauma.ISpatialEntity
---@param sourceWorldPosition Microsoft.Xna.Framework.Vector2
---@param sourceItem Barotrauma.Item
---@return Microsoft.Xna.Framework.Vector2
_G['Attack'].GetImpulseDirection = function(target, sourceWorldPosition, sourceItem) end

---`Method Public Instance`
---@param deltaTime System.Single
_G['Attack'].UpdateCoolDown = function(deltaTime) end

---`Method Public Instance`
---@param deltaTime System.Single
---@param character Barotrauma.Character
_G['Attack'].UpdateAttackTimer = function(deltaTime, character) end

---`Method Public Instance`
_G['Attack'].ResetAttackTimer = function() end

---`Method Public Instance`
---@param applyRandom System.Boolean
_G['Attack'].SetCoolDown = function(applyRandom) end

---`Method Public Instance`
_G['Attack'].ResetCoolDown = function() end

---`Method Public Instance`
---@overload fun(context:Barotrauma.AttackContext):(System.Boolean)
---@param contexts (System.Collections.Generic.IEnumerable*1Barotrauma*AttackContext)|(fun():(Barotrauma.AttackContext))
---@return System.Boolean
_G['Attack'].IsValidContext = function(contexts) end

---`Method Public Instance`
---@overload fun(targetType:Barotrauma.AttackTarget):(System.Boolean)
---@param target Barotrauma.Entity
---@return System.Boolean
_G['Attack'].IsValidTarget = function(target) end

---`Method Private Static`
---@param entity Barotrauma.Entity
---@return Barotrauma.AttackTarget
_G['Attack'].GetAttackTargetTypeFromEntity = function(entity) end

---`Method Public Instance`
---@param easing? Barotrauma.TransitionMode
---@return Microsoft.Xna.Framework.Vector2
_G['Attack'].CalculateAttackPhase = function(easing) end

---`Constructor Public Instance`
---@overload fun(damage:System.Single, bleedingDamage:System.Single, burnDamage:System.Single, structureDamage:System.Single, itemDamage:System.Single, range?:System.Single):Barotrauma.Attack
---@overload fun(element:Barotrauma.ContentXElement, parentDebugName:System.String, sourceItem:Barotrauma.Item):Barotrauma.Attack
---@param element Barotrauma.ContentXElement
---@param parentDebugName System.String
---@return Barotrauma.Attack
_G['Attack'] = function(element, parentDebugName) end

---`Constructor Public Instance`
---@overload fun(damage:System.Single, bleedingDamage:System.Single, burnDamage:System.Single, structureDamage:System.Single, itemDamage:System.Single, range?:System.Single):Barotrauma.Attack
---@overload fun(element:Barotrauma.ContentXElement, parentDebugName:System.String, sourceItem:Barotrauma.Item):Barotrauma.Attack
---@param element Barotrauma.ContentXElement
---@param parentDebugName System.String
---@return Barotrauma.Attack
_G['Attack'].__new = function(element, parentDebugName) end

