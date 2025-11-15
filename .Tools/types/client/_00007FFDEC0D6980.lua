---@meta
---@class Barotrauma.AnimController : Barotrauma.Ragdoll
---`Field NonPublic Instance`
---@field rightShoulder Barotrauma.LimbJoint
---`Field NonPublic Instance`
---@field leftShoulder Barotrauma.LimbJoint
---`Field NonPublic Instance`
---@field upperArmLength System.Single
---`Field NonPublic Instance`
---@field forearmLength System.Single
---`Field NonPublic Instance`
---@field useItemTimer System.Single
---`Field NonPublic Instance`
---@field aiming System.Boolean
---`Field NonPublic Instance`
---@field wasAiming System.Boolean
---`Field NonPublic Instance`
---@field aimingMelee System.Boolean
---`Field NonPublic Instance`
---@field wasAimingMelee System.Boolean
---`Field NonPublic Instance`
---@field tempAnimations (System.Collections.Generic.Dictionary*1Barotrauma*AnimationType*1Barotrauma*AnimController*AnimSwap)|({[Barotrauma.AnimationType]:(Barotrauma.AnimController.AnimSwap)})
---`Field NonPublic Instance`
---@field expiredAnimations (System.Collections.Generic.HashSet*1Barotrauma*AnimationType)|(Barotrauma.AnimationType[])
---`Field NonPublic Instance`
---@field deathAnimTimer System.Single
---`Field NonPublic Instance`
---@field deathAnimDuration System.Single
---`Field Public Instance`
---@field Anim Barotrauma.AnimController.Animation
---`Field Private Instance`
---@field previousDirection Barotrauma.Direction
---`Field Private Instance`
---@field transformedHandlePos (Microsoft.Xna.Framework.Vector2-arr)|(Microsoft.Xna.Framework.Vector2[])
---`Field Private Instance`
---@field prevFootPos System.Single
---`Field Private Instance`
---@field defaultAnimations (System.Collections.Generic.Dictionary*1Barotrauma*AnimationType*1Barotrauma*AnimationParams)|({[Barotrauma.AnimationType]:(Barotrauma.AnimationParams)})
---`Getter Public Instance Virtual`
---<br/>`Setter Private Instance`
---@field SerializableProperties (System.Collections.Generic.Dictionary*1Barotrauma*Identifier*1Barotrauma*SerializableProperty)|({[Barotrauma.Identifier]:(Barotrauma.SerializableProperty)})
---`Getter Public Instance Virtual`
---@field Name System.String
---`Getter Public Instance`
---<br/>`Setter NonPublic Instance`
---@field RightHandIKPos Microsoft.Xna.Framework.Vector2
---`Getter Public Instance`
---<br/>`Setter NonPublic Instance`
---@field LeftHandIKPos Microsoft.Xna.Framework.Vector2
---`Getter Public Instance`
---@field IsAiming System.Boolean
---`Getter Public Instance`
---@field IsAimingMelee System.Boolean
---`Getter NonPublic Instance`
---@field Aiming System.Boolean
---`Getter Public Instance`
---@field ArmLength System.Single
---`Getter Public Instance Abstract Virtual`
---<br/>`Setter Public Instance Abstract Virtual`
---@field WalkParams Barotrauma.GroundedMovementParams
---`Getter Public Instance Abstract Virtual`
---<br/>`Setter Public Instance Abstract Virtual`
---@field RunParams Barotrauma.GroundedMovementParams
---`Getter Public Instance Abstract Virtual`
---<br/>`Setter Public Instance Abstract Virtual`
---@field SwimSlowParams Barotrauma.SwimParams
---`Getter Public Instance Abstract Virtual`
---<br/>`Setter Public Instance Abstract Virtual`
---@field SwimFastParams Barotrauma.SwimParams
---`Getter Public Instance`
---@field CurrentAnimationParams Barotrauma.AnimationParams
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field ForceSelectAnimationType Barotrauma.AnimationType
---`Getter Public Instance`
---@field CurrentGroundedParams Barotrauma.GroundedMovementParams
---`Getter Public Instance`
---@field CurrentSwimParams Barotrauma.SwimParams
---`Getter Public Instance`
---@field CanWalk System.Boolean
---`Getter Public Instance`
---@field IsMovingBackwards System.Boolean
---`Getter Public Instance`
---@field IsMovingFast System.Boolean
---`Getter Public Instance`
---@field AllAnimParams (System.Collections.Generic.List*1Barotrauma*AnimationParams)|(Barotrauma.AnimationParams[])
---`Getter Public Instance`
---@field IsUsingItem System.Boolean
---`Getter Public Instance`
---@field IsClimbing System.Boolean
---`Getter Public Instance`
---@field AimSourceWorldPos Microsoft.Xna.Framework.Vector2
---`Getter Public Instance`
---@field AimSourcePos Microsoft.Xna.Framework.Vector2
---`Getter Public Instance Virtual`
---@field AimSourceSimPos Microsoft.Xna.Framework.Vector2
---`Getter Public Instance Virtual`
---@field HeadPosition System.Nullable*1System*Single
---`Getter Public Instance Virtual`
---@field TorsoPosition System.Nullable*1System*Single
---`Getter Public Instance Virtual`
---@field HeadAngle System.Nullable*1System*Single
---`Getter Public Instance Virtual`
---@field TorsoAngle System.Nullable*1System*Single
---`Getter Public Instance Virtual`
---@field StepSize System.Nullable*1Microsoft*Xna*Framework*Vector2
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field AnimationTestPose System.Boolean
---`Getter Public Instance`
---<br/>`Setter NonPublic Instance`
---@field WalkPos System.Single
---`Getter Public Instance`
---@field IsAboveFloor System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field FlipLockTime System.Single
_G['AnimController'] = {}

---`Method NonPublic Instance`
---@overload fun(p:Barotrauma.AnimationParams, v:System.Nullable*1System*Single):(System.Nullable*1System*Single)
---@param p Barotrauma.AnimationParams
---@param v Microsoft.Xna.Framework.Vector2
---@return System.Nullable*1Microsoft*Xna*Framework*Vector2
_G['AnimController'].GetValidOrNull = function(p, v) end

---`Method Public Instance`
---@param deltaTime System.Single
_G['AnimController'].UpdateAnimations = function(deltaTime) end

---`Method NonPublic Instance Abstract Virtual`
---@param deltaTime System.Single
_G['AnimController'].UpdateAnim = function(deltaTime) end

---`Method Public Instance Abstract Virtual`
---@param target Barotrauma.Character
---@param deltaTime System.Single
_G['AnimController'].DragCharacter = function(target, deltaTime) end

---`Method Public Instance Virtual`
---@param type Barotrauma.AnimationType
---@return System.Single
_G['AnimController'].GetSpeed = function(type) end

---`Method Public Instance`
---@param useMaxSpeed System.Boolean
---@return System.Single
_G['AnimController'].GetCurrentSpeed = function(useMaxSpeed) end

---`Method Public Instance`
---@param type Barotrauma.AnimationType
---@return Barotrauma.AnimationParams
_G['AnimController'].GetAnimationParamsFromType = function(type) end

---`Method Public Instance`
---@return System.Single
_G['AnimController'].GetHeightFromFloor = function() end

---`Method Public Instance`
---@param time? System.Single
_G['AnimController'].LockFlipping = function(time) end

---`Method NonPublic Instance`
---@param deltaTime System.Single
_G['AnimController'].UpdateConstantTorque = function(deltaTime) end

---`Method NonPublic Instance`
---@param deltaTime System.Single
_G['AnimController'].UpdateBlink = function(deltaTime) end

---`Method Public Instance`
---@param allowMovement System.Boolean
---@param handWorldPos Microsoft.Xna.Framework.Vector2
_G['AnimController'].UpdateUseItem = function(allowMovement, handWorldPos) end

---`Method Public Instance`
---@param rightHandPos Microsoft.Xna.Framework.Vector2
---@param leftHandPos Microsoft.Xna.Framework.Vector2
_G['AnimController'].Grab = function(rightHandPos, leftHandPos) end

---`Method Public Instance`
---@param deltaTime System.Single
---@param item Barotrauma.Item
---@param handlePos (Microsoft.Xna.Framework.Vector2-arr)|(Microsoft.Xna.Framework.Vector2[])
---@param itemPos Microsoft.Xna.Framework.Vector2
---@param aim System.Boolean
---@param holdAngle System.Single
---@param itemAngleRelativeToHoldAngle? System.Single
---@param aimMelee? System.Boolean
---@param targetPos? System.Nullable*1Microsoft*Xna*Framework*Vector2
_G['AnimController'].HoldItem = function(deltaTime, item, handlePos, itemPos, aim, holdAngle, itemAngleRelativeToHoldAngle, aimMelee, targetPos) end

---`Method Private Instance`
---@param rightHand Barotrauma.Limb
---@param leftHand Barotrauma.Limb
---@param heldItem Barotrauma.Item
---@return System.Single
_G['AnimController'].GetAimWobble = function(rightHand, leftHand, heldItem) end

---`Method Public Instance`
---@param hand Barotrauma.Limb
---@param pos Microsoft.Xna.Framework.Vector2
---@param armTorque? System.Single
---@param handTorque? System.Single
---@param maxAngularVelocity? System.Single
_G['AnimController'].HandIK = function(hand, pos, armTorque, handTorque, maxAngularVelocity) end

---`Method NonPublic Instance`
_G['AnimController'].UpdateClimbing = function() end

---`Method NonPublic Instance`
---@param head Barotrauma.Limb
_G['AnimController'].RotateHead = function(head) end

---`Method Public Instance`
---@param leftHandPos Microsoft.Xna.Framework.Vector2
---@param rightHandPos Microsoft.Xna.Framework.Vector2
---@param leftFootPos Microsoft.Xna.Framework.Vector2
---@param rightFootPos Microsoft.Xna.Framework.Vector2
---@param footMoveForce? System.Single
_G['AnimController'].ApplyPose = function(leftHandPos, rightHandPos, leftFootPos, rightFootPos, footMoveForce) end

---`Method Public Instance`
_G['AnimController'].ApplyTestPose = function() end

---`Method NonPublic Instance`
_G['AnimController'].CalculateArmLengths = function() end

---`Method NonPublic Instance`
---@param limbTypeA Barotrauma.LimbType
---@param limbTypeB Barotrauma.LimbType
---@return Barotrauma.LimbJoint
_G['AnimController'].GetJointBetweenLimbs = function(limbTypeA, limbTypeB) end

---`Method NonPublic Instance`
---@param matchingType Barotrauma.LimbType
---@param ignoredTypes (System.Collections.Generic.IEnumerable*1Barotrauma*LimbType)|(fun():(Barotrauma.LimbType))
---@return Barotrauma.LimbJoint
_G['AnimController'].GetJoint = function(matchingType, ignoredTypes) end

---`Method Public Instance Virtual`
---@param ragdollParams? Barotrauma.RagdollParams
_G['AnimController'].Recreate = function(ragdollParams) end

---`Method Public Instance`
---@param ragdollParams? Barotrauma.RagdollParams
_G['AnimController'].RecreateAndRespawn = function(ragdollParams) end

---`Method Private Instance`
---@param animation Barotrauma.AnimController.Animation
_G['AnimController'].StartAnimation = function(animation) end

---`Method Private Instance`
---@param animation Barotrauma.AnimController.Animation
_G['AnimController'].StopAnimation = function(animation) end

---`Method Public Instance`
_G['AnimController'].StartUsingItem = function() end

---`Method Public Instance`
_G['AnimController'].StartClimbing = function() end

---`Method Public Instance`
_G['AnimController'].StopUsingItem = function() end

---`Method Public Instance`
_G['AnimController'].StopClimbing = function() end

---`Method Public Instance`
---@param animLoadInfo Barotrauma.StatusEffect.AnimLoadInfo
---@param throwErrors System.Boolean
---@return System.Boolean
_G['AnimController'].TryLoadTemporaryAnimation = function(animLoadInfo, throwErrors) end

---`Method Private Instance`
_G['AnimController'].UpdateTemporaryAnimations = function() end

---`Method Public Instance`
---@param animationType Barotrauma.AnimationType
---@param file Barotrauma.Either*1System*String*1Barotrauma*ContentPath
---@param animParams Barotrauma.AnimationParams-ref
---@param throwErrors System.Boolean
---@return System.Boolean
_G['AnimController'].TryLoadAnimation = function(animationType, file, animParams, throwErrors) end

---`Method NonPublic Instance`
---@param newParams Barotrauma.AnimationParams
---@return System.Boolean
_G['AnimController'].TrySwapAnimParams = function(newParams) end

---`Constructor Public Instance`
---@param character Barotrauma.Character
---@param seed System.String
---@param ragdollParams? Barotrauma.RagdollParams
---@return Barotrauma.AnimController
_G['AnimController'] = function(character, seed, ragdollParams) end

---`Constructor Public Instance`
---@param character Barotrauma.Character
---@param seed System.String
---@param ragdollParams? Barotrauma.RagdollParams
---@return Barotrauma.AnimController
_G['AnimController'].__new = function(character, seed, ragdollParams) end

