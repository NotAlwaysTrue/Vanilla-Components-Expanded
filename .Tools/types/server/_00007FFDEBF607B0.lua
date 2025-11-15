---@meta
---@class Barotrauma.HumanoidAnimController : Barotrauma.AnimController
---`Field Private Instance`
---@field _ragdollParams Barotrauma.HumanRagdollParams
---`Field Private Instance`
---@field _humanWalkParams Barotrauma.HumanWalkParams
---`Field Private Instance`
---@field _humanRunParams Barotrauma.HumanRunParams
---`Field Private Instance`
---@field _humanCrouchParams Barotrauma.HumanCrouchParams
---`Field Private Instance`
---@field _humanSwimSlowParams Barotrauma.HumanSwimSlowParams
---`Field Private Instance`
---@field _humanSwimFastParams Barotrauma.HumanSwimFastParams
---`Field Private Instance`
---@field upperLegLength System.Single
---`Field Private Instance`
---@field lowerLegLength System.Single
---`Field Private Instance`
---@field movementLerp System.Single
---`Field Private Instance`
---@field cprAnimTimer System.Single
---`Field Private Instance`
---@field cprPumpTimer System.Single
---`Field Private Instance`
---@field fallingProneAnimTimer System.Single
---`Field Private Instance`
---@field swimming System.Boolean
---`Field Private Instance`
---@field swimmingStateLockTimer System.Single
---`Field Private Instance`
---@field handCyclePos System.Single
---`Field Private Instance`
---@field legCyclePos System.Single
---`Field Private Instance`
---@field lastReviveTime System.Single
---`Field Private Static`
---@field SteepestWalkableSlopeNormalX System.Single
---`Field Private Static`
---@field SlowlyWalkableSlopeNormalX System.Single
---`Field Private Static`
---@field SteepestWalkableSlopeAngleDegrees System.Single
---`Field Private Static`
---@field SlowlyWalkableSlopeAngleDegrees System.Single
---`Field Private Static`
---@field MaxSpeedOnStairs System.Single
---`Field Private Static`
---@field SteepSlopePushMagnitude System.Single
---`Field Public Static`
---@field BreakFromGrabDistance System.Single
---`Field Private Static`
---@field FallingProneAnimDuration System.Single
---`Getter Public Instance Virtual`
---<br/>`Setter NonPublic Instance Virtual`
---@field RagdollParams Barotrauma.RagdollParams
---`Getter Public Instance`
---<br/>`Setter NonPublic Instance`
---@field HumanRagdollParams Barotrauma.HumanRagdollParams
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field HumanWalkParams Barotrauma.HumanWalkParams
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field HumanRunParams Barotrauma.HumanRunParams
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field HumanCrouchParams Barotrauma.HumanCrouchParams
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field HumanSwimSlowParams Barotrauma.HumanSwimSlowParams
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field HumanSwimFastParams Barotrauma.HumanSwimFastParams
---`Getter Public Instance`
---@field CurrentGroundedParams Barotrauma.HumanGroundedParams
---`Getter Public Instance`
---@field CurrentSwimParams Barotrauma.HumanSwimParams
---`Getter Public Instance`
---@field CurrentHumanAnimParams Barotrauma.IHumanAnimation
---`Getter Public Instance Virtual`
---<br/>`Setter Public Instance Virtual`
---@field WalkParams Barotrauma.GroundedMovementParams
---`Getter Public Instance Virtual`
---<br/>`Setter Public Instance Virtual`
---@field RunParams Barotrauma.GroundedMovementParams
---`Getter Public Instance Virtual`
---<br/>`Setter Public Instance Virtual`
---@field SwimSlowParams Barotrauma.SwimParams
---`Getter Public Instance Virtual`
---<br/>`Setter Public Instance Virtual`
---@field SwimFastParams Barotrauma.SwimParams
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Crouching System.Boolean
---`Getter Public Instance`
---@field HeadLeanAmount System.Single
---`Getter Public Instance`
---@field TorsoLeanAmount System.Single
---`Getter Public Instance`
---@field FootMoveOffset Microsoft.Xna.Framework.Vector2
---`Getter Public Instance`
---@field LegBendTorque System.Single
---`Getter Public Instance`
---@field HandMoveOffset Microsoft.Xna.Framework.Vector2
---`Getter Public Instance Virtual`
---@field AimSourceSimPos Microsoft.Xna.Framework.Vector2
_G['HumanoidAnimController'] = {}

---`Method Public Instance Virtual`
---@param ragdollParams? Barotrauma.RagdollParams
_G['HumanoidAnimController'].Recreate = function(ragdollParams) end

---`Method Private Instance`
_G['HumanoidAnimController'].CalculateLegLengths = function() end

---`Method NonPublic Instance Virtual`
---@param deltaTime System.Single
_G['HumanoidAnimController'].UpdateAnim = function(deltaTime) end

---`Method Private Instance`
_G['HumanoidAnimController'].UpdateStanding = function() end

---`Method Private Instance`
_G['HumanoidAnimController'].UpdateStandingSimple = function() end

---`Method Private Instance`
_G['HumanoidAnimController'].UpdateSwimming = function() end

---`Method Private Instance`
---@param strength System.Single
---@param moveHands? System.Boolean
---@param moveTorso? System.Boolean
---@param moveLegs? System.Boolean
_G['HumanoidAnimController'].UpdateFallingProne = function(strength, moveHands, moveTorso, moveLegs) end

---`Method Private Instance`
---@param deltaTime System.Single
_G['HumanoidAnimController'].UpdateCPR = function(deltaTime) end

---`Method Public Instance Virtual`
---@param target Barotrauma.Character
---@param deltaTime System.Single
_G['HumanoidAnimController'].DragCharacter = function(target, deltaTime) end

---`Method Public Instance`
_G['HumanoidAnimController'].Crouch = function() end

---`Method Private Instance`
---@param foot Barotrauma.Limb
---@param pos Microsoft.Xna.Framework.Vector2
---@param legTorque System.Single
---@param footTorque System.Single
---@param footAngle System.Single
_G['HumanoidAnimController'].FootIK = function(foot, pos, legTorque, footTorque, footAngle) end

---`Method Public Instance Virtual`
_G['HumanoidAnimController'].Flip = function() end

---`Method Public Instance Virtual`
---@param type Barotrauma.AnimationType
---@return System.Single
_G['HumanoidAnimController'].GetSpeed = function(type) end

---`Constructor Public Instance`
---@overload fun(character:Barotrauma.Character, seed:System.String, ragdollParams?:Barotrauma.HumanRagdollParams):Barotrauma.HumanoidAnimController
---@return Barotrauma.HumanoidAnimController
_G['HumanoidAnimController'] = function() end

---`Constructor Public Instance`
---@overload fun(character:Barotrauma.Character, seed:System.String, ragdollParams?:Barotrauma.HumanRagdollParams):Barotrauma.HumanoidAnimController
---@return Barotrauma.HumanoidAnimController
_G['HumanoidAnimController'].__new = function() end

---`Constructor Private Static`
---@overload fun(character:Barotrauma.Character, seed:System.String, ragdollParams?:Barotrauma.HumanRagdollParams):Barotrauma.HumanoidAnimController
---@return Barotrauma.HumanoidAnimController
_G['HumanoidAnimController'] = function() end

---`Constructor Private Static`
---@overload fun(character:Barotrauma.Character, seed:System.String, ragdollParams?:Barotrauma.HumanRagdollParams):Barotrauma.HumanoidAnimController
---@return Barotrauma.HumanoidAnimController
_G['HumanoidAnimController'].__new = function() end

