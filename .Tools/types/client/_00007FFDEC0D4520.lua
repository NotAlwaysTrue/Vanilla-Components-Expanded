---@meta
---@class Barotrauma.Limb : System.Object
---`Field Public Instance`
---@field LastAttackSoundTime System.Single
---`Field Public Instance`
---@field LastImpactSoundTime System.Single
---`Field Private Instance`
---@field wetTimer System.Single
---`Field Private Instance`
---@field dripParticleTimer System.Single
---`Field Private Instance`
---@field deadTimer System.Single
---`Field Private Instance`
---@field randomColor System.Nullable*1Microsoft*Xna*Framework*Color
---`Field Private Instance`
---@field tintEffectParams Microsoft.Xna.Framework.Graphics.SpriteBatch.EffectWithParams
---`Field Private Instance`
---@field huskSpriteParams Microsoft.Xna.Framework.Graphics.SpriteBatch.EffectWithParams
---`Field NonPublic Instance`
---@field _deformSprite Barotrauma.DeformableSprite
---`Field Private Instance`
---@field spriteAnimState (System.Collections.Generic.Dictionary*1Barotrauma*DecorativeSprite*1Barotrauma*Limb*SpriteState)|({[Barotrauma.DecorativeSprite]:(Barotrauma.Limb.SpriteState)})
---`Field Private Instance`
---@field DecorativeSpriteGroups (System.Collections.Generic.Dictionary*1System*Int32*1System*Collections*Generic*List*2Barotrauma*DecorativeSprite)|({[System.Int32]:((System.Collections.Generic.List*1Barotrauma*DecorativeSprite)|(Barotrauma.DecorativeSprite[]))})
---`Field Private Instance`
---@field damageOverlayStrength System.Single
---`Field Private Instance`
---@field burnOverLayStrength System.Single
---`Field Private Instance`
---@field wearableTypeHidingSprites (System.Collections.Generic.List*1Barotrauma*WearableSprite)|(Barotrauma.WearableSprite[])
---`Field Private Instance`
---@field wearableTypesToHide (System.Collections.Generic.HashSet*1Barotrauma*WearableType)|(Barotrauma.WearableType[])
---`Field Private Instance`
---@field enableHuskSprite System.Boolean
---`Field Private Instance`
---@field _texturePath System.String
---`Field Private Instance`
---@field _damagedTexturePath System.String
---`Field Private Instance`
---@field alphaClipEffectParams (System.Collections.Generic.Dictionary*1Barotrauma*WearableSprite*1System*Collections*Generic*Dictionary*2System*String*2System*Object)|({[Barotrauma.WearableSprite]:((System.Collections.Generic.Dictionary*1System*String*1System*Object)|({[System.String]:(System.Object)}))})
---`Field Public Instance`
---@field character Barotrauma.Character
---`Field Public Instance`
---@field ragdoll Barotrauma.Ragdoll
---`Field Public Instance`
---@field Params Barotrauma.RagdollParams.LimbParams
---`Field Public Instance`
---@field body Barotrauma.PhysicsBody
---`Field Public Instance`
---@field Hull Barotrauma.Hull
---`Field Private Instance`
---@field pullJoint FarseerPhysics.Dynamics.Joints.FixedMouseJoint
---`Field Public Instance`
---@field type Barotrauma.LimbType
---`Field Private Instance`
---@field ignoreCollisions System.Boolean
---`Field Private Instance`
---@field isSevered System.Boolean
---`Field Private Instance`
---@field severedFadeOutTimer System.Single
---`Field Private Instance`
---@field mouthPos System.Nullable*1Microsoft*Xna*Framework*Vector2
---`Field Public Instance`
---@field attack Barotrauma.Attack
---`Field Private Instance`
---@field dir Barotrauma.Direction
---`Field Public Instance`
---@field DebugTargetPos Microsoft.Xna.Framework.Vector2
---`Field Public Instance`
---@field DebugRefPos Microsoft.Xna.Framework.Vector2
---`Field Private Instance`
---@field _hidden System.Boolean
---`Field Private Instance`
---@field _alpha System.Single
---`Field Public Instance`
---@field WearingItems (System.Collections.Generic.List*1Barotrauma*WearableSprite)|(Barotrauma.WearableSprite[])
---`Field Public Instance`
---@field OtherWearables (System.Collections.Generic.List*1Barotrauma*WearableSprite)|(Barotrauma.WearableSprite[])
---`Field Private Instance`
---@field statusEffects (System.Collections.Generic.Dictionary*1Barotrauma*ActionType*1System*Collections*Generic*List*2Barotrauma*StatusEffect)|({[Barotrauma.ActionType]:((System.Collections.Generic.List*1Barotrauma*StatusEffect)|(Barotrauma.StatusEffect[]))})
---`Field Private Instance`
---@field appliedDamageModifiers (System.Collections.Generic.List*1Barotrauma*DamageModifier)|(Barotrauma.DamageModifier[])
---`Field Private Instance`
---@field tempModifiers (System.Collections.Generic.List*1Barotrauma*DamageModifier)|(Barotrauma.DamageModifier[])
---`Field Private Instance`
---@field afflictionsCopy (System.Collections.Generic.List*1Barotrauma*Affliction)|(Barotrauma.Affliction[])
---`Field Private Instance`
---@field temporarilyDisabled System.Boolean
---`Field Private Instance`
---@field reEnableTimer System.Single
---`Field Private Instance`
---@field originalIgnoreCollisions System.Boolean
---`Field Private Instance`
---@field contactBodies (System.Collections.Generic.List*1FarseerPhysics*Dynamics*Body)|(FarseerPhysics.Dynamics.Body[])
---`Field Private Instance`
---@field attachJoint FarseerPhysics.Dynamics.Joints.WeldJoint
---`Field Private Instance`
---@field colliderJoint FarseerPhysics.Dynamics.Joints.WeldJoint
---`Field Private Instance`
---@field targets (System.Collections.Generic.List*1Barotrauma*ISerializableEntity)|(Barotrauma.ISerializableEntity[])
---`Field Public Instance`
---@field FreezeBlinkState System.Boolean
---`Field Private Static`
---@field alphaClipEffect Microsoft.Xna.Framework.Graphics.Effect
---`Field Public Static`
---@field SoundInterval System.Single
---`Getter Private Instance`
---<br/>`Setter Private Instance`
---@field Deformations (System.Collections.Generic.List*1Barotrauma*SpriteDeformations*SpriteDeformation)|(Barotrauma.SpriteDeformations.SpriteDeformation[])
---`Getter Private Instance`
---<br/>`Setter Private Instance`
---@field NonConditionalDeformations (System.Collections.Generic.List*1Barotrauma*SpriteDeformations*SpriteDeformation)|(Barotrauma.SpriteDeformations.SpriteDeformation[])
---`Getter Private Instance`
---<br/>`Setter Private Instance`
---@field ConditionalDeformations (System.Collections.Generic.List*1System*ValueTuple*2Barotrauma*ConditionalSprite*2System*Collections*Generic*IEnumerable*3Barotrauma*SpriteDeformations*SpriteDeformation)|(System.ValueTuple*1Barotrauma*ConditionalSprite*1System*Collections*Generic*IEnumerable*2Barotrauma*SpriteDeformations*SpriteDeformation[])
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field ActiveDeformations (System.Collections.Generic.List*1Barotrauma*SpriteDeformations*SpriteDeformation)|(Barotrauma.SpriteDeformations.SpriteDeformation[])
---`Getter Public Instance`
---<br/>`Setter NonPublic Instance`
---@field Sprite Barotrauma.Sprite
---`Getter Public Instance`
---<br/>`Setter NonPublic Instance`
---@field TintMask Barotrauma.Sprite
---`Getter Public Instance`
---<br/>`Setter NonPublic Instance`
---@field HuskMask Barotrauma.Sprite
---`Getter Public Instance`
---<br/>`Setter NonPublic Instance`
---@field TintHighlightThreshold System.Single
---`Getter Public Instance`
---<br/>`Setter NonPublic Instance`
---@field TintHighlightMultiplier System.Single
---`Getter Public Instance`
---@field DeformSprite Barotrauma.DeformableSprite
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field DecorativeSprites (System.Collections.Generic.List*1Barotrauma*DecorativeSprite)|(Barotrauma.DecorativeSprite[])
---`Getter Public Instance`
---@field ActiveSprite Barotrauma.Sprite
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field DefaultSpriteDepth System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field HairWithHatSprite Barotrauma.WearableSprite
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field HuskSprite Barotrauma.WearableSprite
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field HerpesSprite Barotrauma.WearableSprite
---`Getter Public Instance`
---@field TextureScale System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field DamagedSprite Barotrauma.Sprite
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field ConditionalSprites (System.Collections.Generic.List*1Barotrauma*ConditionalSprite)|(Barotrauma.ConditionalSprite[])
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field InitialLightSourceColor Microsoft.Xna.Framework.Color
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field InitialLightSpriteAlpha System.Nullable*1System*Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field LightSource Barotrauma.Lights.LightSource
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field DamageOverlayStrength System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field BurnOverlayStrength System.Single
---`Getter Public Instance`
---@field HitSoundTag System.String
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field EnableHuskSprite System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field SeveredFadeOutTime System.Single
---`Getter Public Instance`
---@field StepOffset Microsoft.Xna.Framework.Vector2
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field InWater System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field IgnoreCollisions System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field MouthPos Microsoft.Xna.Framework.Vector2
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field DamageModifiers (System.Collections.Generic.List*1Barotrauma*DamageModifier)|(Barotrauma.DamageModifier[])
---`Getter Public Instance`
---@field HealthIndex System.Int32
---`Getter Public Instance`
---@field Scale System.Single
---`Getter Public Instance`
---@field AttackPriority System.Single
---`Getter Public Instance`
---@field DoesFlip System.Boolean
---`Getter Public Instance`
---@field DoesMirror System.Boolean
---`Getter Public Instance`
---@field SteerForce System.Single
---`Getter Public Instance`
---@field IsLowerBody System.Boolean
---`Getter Public Instance`
---@field IsLeg System.Boolean
---`Getter Public Instance`
---@field IsArm System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field IsSevered System.Boolean
---`Getter Public Instance Virtual`
---@field Submarine Barotrauma.Submarine
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Hidden System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Hide System.Boolean
---`Getter Public Instance Virtual`
---@field WorldPosition Microsoft.Xna.Framework.Vector2
---`Getter Public Instance Virtual`
---@field Position Microsoft.Xna.Framework.Vector2
---`Getter Public Instance Virtual`
---@field SimPosition Microsoft.Xna.Framework.Vector2
---`Getter Public Instance`
---@field DrawPosition Microsoft.Xna.Framework.Vector2
---`Getter Public Instance`
---@field Rotation System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field AnimTargetPos Microsoft.Xna.Framework.Vector2
---`Getter Public Instance`
---@field Mass System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Disabled System.Boolean
---`Getter Public Instance`
---@field LinearVelocity Microsoft.Xna.Framework.Vector2
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Dir System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Alpha System.Single
---`Getter Public Instance`
---@field RefJointIndex System.Int32
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field PullJointEnabled System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field PullJointMaxForce System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field PullJointWorldAnchorA Microsoft.Xna.Framework.Vector2
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field PullJointWorldAnchorB Microsoft.Xna.Framework.Vector2
---`Getter Public Instance`
---@field PullJointLocalAnchorA Microsoft.Xna.Framework.Vector2
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field Removed System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field AttachedRope Barotrauma.Items.Components.Rope
---`Getter Public Instance Virtual`
---@field Name System.String
---`Getter Public Instance`
---@field IsDead System.Boolean
---`Getter Public Instance`
---@field Health System.Single
---`Getter Public Instance`
---@field HealthPercentage System.Single
---`Getter Public Instance`
---@field IsHuman System.Boolean
---`Getter Public Instance`
---@field AIState Barotrauma.AIState
---`Getter Public Instance`
---@field IsFlipped System.Boolean
---`Getter Public Instance`
---@field CanBeSeveredAlive System.Boolean
---`Getter Public Instance Virtual`
---<br/>`Setter Private Instance`
---@field SerializableProperties (System.Collections.Generic.Dictionary*1Barotrauma*Identifier*1Barotrauma*SerializableProperty)|({[Barotrauma.Identifier]:(Barotrauma.SerializableProperty)})
---`Getter Public Instance`
---@field StatusEffects (System.Collections.Generic.Dictionary*1Barotrauma*ActionType*1System*Collections*Generic*List*2Barotrauma*StatusEffect)|({[Barotrauma.ActionType]:((System.Collections.Generic.List*1Barotrauma*StatusEffect)|(Barotrauma.StatusEffect[]))})
---`Getter Public Instance`
---@field IsStuck System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field BlinkTimer System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field BlinkPhase System.Single
---`Getter Private Instance`
---@field TotalBlinkDurationOut System.Single
_G['Limb'] = {}

---`Method Public Instance`
---@param excludeConditionalSprites? System.Boolean
---@return Barotrauma.Sprite
_G['Limb'].GetActiveSprite = function(excludeConditionalSprites) end

---`Method Public Instance`
_G['Limb'].LoadHuskSprite = function() end

---`Method Public Instance`
_G['Limb'].LoadHerpesSprite = function() end

---`Method Private Instance`
_G['Limb'].RefreshDeformations = function() end

---`Method Public Instance`
_G['Limb'].RecreateSprites = function() end

---`Method Private Instance`
---@param sprite Barotrauma.Sprite
_G['Limb'].CalculateHeadPosition = function(sprite) end

---`Method Private Instance`
---@overload fun(element:Barotrauma.ContentXElement, spriteParams:Barotrauma.RagdollParams.SpriteParams, path:System.String-ref):(System.String)
---@param texturePath Barotrauma.ContentPath
---@return System.String
_G['Limb'].GetSpritePath = function(texturePath) end

---`Method Public Static`
---@param texturePath Barotrauma.ContentPath
---@param characterInfo Barotrauma.CharacterInfo
---@return System.String
_G['Limb'].GetSpritePath = function(texturePath, characterInfo) end

---`Method Public Instance`
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
---@param cam Barotrauma.Camera
---@param overrideColor? System.Nullable*1Microsoft*Xna*Framework*Color
---@param disableDeformations? System.Boolean
_G['Limb'].Draw = function(spriteBatch, cam, overrideColor, disableDeformations) end

---`Method Public Instance`
_G['Limb'].UpdateWearableTypesToHide = function() end

---`Method Private Instance`
---@param deltaTime System.Single
_G['Limb'].UpdateSpriteStates = function(deltaTime) end

---`Method Public Instance`
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
---@param cam Barotrauma.Camera
---@param startPos Microsoft.Xna.Framework.Vector2
---@param isScreenSpace System.Boolean
_G['Limb'].DrawDamageModifiers = function(spriteBatch, cam, startPos, isScreenSpace) end

---`Method Private Instance`
---@param wearable Barotrauma.WearableSprite
---@param depthStep System.Single
---@param color Microsoft.Xna.Framework.Color
---@param alpha System.Single
---@return System.ValueTuple*1Microsoft*Xna*Framework*Color*1Microsoft*Xna*Framework*Vector2*1System*Single*1System*Single*1System*Single
_G['Limb'].CalculateDrawParameters = function(wearable, depthStep, color, alpha) end

---`Method Private Instance`
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
---@param wearable Barotrauma.WearableSprite
---@param alphaClipper Barotrauma.WearableSprite
---@param spriteEffect Microsoft.Xna.Framework.Graphics.SpriteEffects
_G['Limb'].ApplyAlphaClip = function(spriteBatch, wearable, alphaClipper, spriteEffect) end

---`Method Private Instance`
---@param wearable Barotrauma.WearableSprite
---@param depthStep System.Single
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
---@param color Microsoft.Xna.Framework.Color
---@param alpha System.Single
---@param spriteEffect Microsoft.Xna.Framework.Graphics.SpriteEffects
_G['Limb'].DrawWearable = function(wearable, depthStep, spriteBatch, color, alpha, spriteEffect) end

---`Method Private Instance`
---@param type Barotrauma.WearableType
---@return Barotrauma.WearableSprite
_G['Limb'].GetWearableSprite = function(type) end

---`Method Private Instance`
---@param element Barotrauma.ContentXElement
_G['Limb'].InitProjSpecific = function(element) end

---`Method Public Instance`
---@param pos Microsoft.Xna.Framework.Vector2
---@param force System.Single
---@param pullFromCenter? System.Boolean
_G['Limb'].MoveToPos = function(pos, force, pullFromCenter) end

---`Method Public Instance`
_G['Limb'].MirrorPullJoint = function() end

---`Method Public Instance`
---@overload fun(simPosition:Microsoft.Xna.Framework.Vector2, damage:System.Single, bleedingDamage:System.Single, burnDamage:System.Single, playSound:System.Boolean):(Barotrauma.AttackResult)
---@param simPosition Microsoft.Xna.Framework.Vector2
---@param afflictions (System.Collections.Generic.IEnumerable*1Barotrauma*Affliction)|(fun():(Barotrauma.Affliction))
---@param playSound System.Boolean
---@param damageMultiplier? System.Single
---@param penetration? System.Single
---@param attacker? Barotrauma.Character
---@return Barotrauma.AttackResult
_G['Limb'].AddDamage = function(simPosition, afflictions, playSound, damageMultiplier, penetration, attacker) end

---`Method Private Instance`
---@param playSound System.Boolean
---@param result Barotrauma.AttackResult
_G['Limb'].AddDamageProjSpecific = function(playSound, result) end

---`Method Public Instance`
---@param armorSector Microsoft.Xna.Framework.Vector2
---@param simPosition Microsoft.Xna.Framework.Vector2
---@return System.Boolean
_G['Limb'].SectorHit = function(armorSector, simPosition) end

---`Method NonPublic Instance`
---@param armorSector Microsoft.Xna.Framework.Vector2
---@return System.Single
_G['Limb'].GetArmorSectorSize = function(armorSector) end

---`Method Public Instance`
---@param deltaTime System.Single
_G['Limb'].Update = function(deltaTime) end

---`Method Public Instance`
---@param duration? System.Single
---@param ignoreCollisions? System.Boolean
_G['Limb'].HideAndDisable = function(duration, ignoreCollisions) end

---`Method Public Instance`
_G['Limb'].ReEnable = function() end

---`Method Private Instance`
---@param deltaTime System.Single
_G['Limb'].UpdateProjSpecific = function(deltaTime) end

---`Method Public Instance`
---@param deltaTime System.Single
---@param attackSimPos Microsoft.Xna.Framework.Vector2
---@param damageTarget Barotrauma.IDamageable
---@param attackResult Barotrauma.AttackResult-ref
---@param distance? System.Single
---@param targetLimb? Barotrauma.Limb
---@return System.Boolean
_G['Limb'].UpdateAttack = function(deltaTime, attackSimPos, damageTarget, attackResult, distance, targetLimb) end

---`Method Public Instance`
---@param damageTarget Barotrauma.IDamageable
---@param targetLimb Barotrauma.Limb
---@param attackResult Barotrauma.AttackResult-ref
_G['Limb'].ExecuteAttack = function(damageTarget, targetLimb, attackResult) end

---`Method Private Instance`
---@param target FarseerPhysics.Dynamics.Body
---@param from Microsoft.Xna.Framework.Vector2
---@param to Microsoft.Xna.Framework.Vector2
_G['Limb'].StickTo = function(target, from, to) end

---`Method Public Instance`
_G['Limb'].Release = function() end

---`Method Public Instance`
---@param actionType Barotrauma.ActionType
---@param deltaTime System.Single
_G['Limb'].ApplyStatusEffects = function(actionType, deltaTime) end

---`Method Public Instance`
_G['Limb'].Blink = function() end

---`Method Public Instance`
---@param deltaTime System.Single
---@param referenceRotation System.Single
_G['Limb'].UpdateBlink = function(deltaTime, referenceRotation) end

---`Method Public Instance`
---@return (System.Collections.Generic.IEnumerable*1Barotrauma*LimbJoint)|(fun():(Barotrauma.LimbJoint))
_G['Limb'].GetConnectedJoints = function() end

---`Method Public Instance`
---@return (System.Collections.Generic.IEnumerable*1Barotrauma*Limb)|(fun():(Barotrauma.Limb))
_G['Limb'].GetConnectedLimbs = function() end

---`Method Public Instance`
_G['Limb'].Remove = function() end

---`Method Private Instance`
_G['Limb'].RemoveProjSpecific = function() end

---`Method Public Instance`
_G['Limb'].LoadParams = function() end

---`Method Private Instance`
_G['Limb'].LoadParamsProjSpecific = function() end

---`Constructor Public Instance`
---@param ragdoll Barotrauma.Ragdoll
---@param character Barotrauma.Character
---@param limbParams Barotrauma.RagdollParams.LimbParams
---@return Barotrauma.Limb
_G['Limb'] = function(ragdoll, character, limbParams) end

---`Constructor Public Instance`
---@param ragdoll Barotrauma.Ragdoll
---@param character Barotrauma.Character
---@param limbParams Barotrauma.RagdollParams.LimbParams
---@return Barotrauma.Limb
_G['Limb'].__new = function(ragdoll, character, limbParams) end

