---@meta
---@class Barotrauma.EnemyAIController : Barotrauma.AIController
---`Field Private Instance`
---@field previousTargetingRestrictions Barotrauma.EnemyTargetingRestrictions
---`Field Private Instance`
---@field _state Barotrauma.AIState
---`Field Public Instance`
---@field TargetOutposts System.Boolean
---`Field Private Instance`
---@field updateTargetsInterval System.Single
---`Field Private Instance`
---@field updateMemoriesInverval System.Single
---`Field Private Instance`
---@field attackLimbSelectionInterval System.Single
---`Field Private Instance`
---@field outsideSteering Barotrauma.SteeringManager
---`Field Private Instance`
---@field insideSteering Barotrauma.SteeringManager
---`Field Private Instance`
---@field updateTargetsTimer System.Single
---`Field Private Instance`
---@field updateMemoriesTimer System.Single
---`Field Private Instance`
---@field attackLimbSelectionTimer System.Single
---`Field Private Instance`
---@field _attackLimb Barotrauma.Limb
---`Field Private Instance`
---@field _previousAttackLimb Barotrauma.Limb
---`Field Private Instance`
---@field lastAttackUpdateTime System.Double
---`Field Private Instance`
---@field _activeAttack Barotrauma.Attack
---`Field Private Instance`
---@field currentTargetMemory Barotrauma.AITargetMemory
---`Field Private Instance`
---@field targetValue System.Single
---`Field Private Instance`
---@field currentTargetingParams Barotrauma.CharacterParams.TargetParams
---`Field Private Instance`
---@field targetMemories (System.Collections.Generic.Dictionary*1Barotrauma*AITarget*1Barotrauma*AITargetMemory)|({[Barotrauma.AITarget]:(Barotrauma.AITargetMemory)})
---`Field Private Instance`
---@field requiredHoleCount System.Int32
---`Field Private Instance`
---@field canAttackWalls System.Boolean
---`Field Private Instance`
---@field canAttackDoors System.Boolean
---`Field Private Instance`
---@field canAttackItems System.Boolean
---`Field Private Instance`
---@field canAttackCharacters System.Boolean
---`Field Private Instance`
---@field priorityFearIncreasement System.Single
---`Field Private Instance`
---@field memoryFadeTime System.Single
---`Field Private Instance`
---@field avoidTimer System.Single
---`Field Private Instance`
---@field observeTimer System.Single
---`Field Private Instance`
---@field sweepTimer System.Single
---`Field Private Instance`
---@field circleRotation System.Single
---`Field Private Instance`
---@field circleDir System.Single
---`Field Private Instance`
---@field inverseDir System.Boolean
---`Field Private Instance`
---@field breakCircling System.Boolean
---`Field Private Instance`
---@field circleRotationSpeed System.Single
---`Field Private Instance`
---@field circleOffset Microsoft.Xna.Framework.Vector2
---`Field Private Instance`
---@field circleFallbackDistance System.Single
---`Field Private Instance`
---@field strikeTimer System.Single
---`Field Private Instance`
---@field aggressionIntensity System.Single
---`Field Private Instance`
---@field CirclePhase Barotrauma.CirclePhase
---`Field Private Instance`
---@field currentAttackIntensity System.Single
---`Field Private Instance`
---@field playDeadTimer System.Single
---`Field Private Instance`
---@field disableTailCoroutine Barotrauma.CoroutineHandle
---`Field Private Instance`
---@field myBodies (System.Collections.Generic.List*1FarseerPhysics*Dynamics*Body)|(FarseerPhysics.Dynamics.Body[])
---`Field Private Instance`
---@field reverse System.Boolean
---`Field Private Instance`
---@field maxSteeringBuffer System.Single
---`Field Private Instance`
---@field minSteeringBuffer System.Single
---`Field Private Instance`
---@field steeringBufferIncreaseSpeed System.Single
---`Field Private Instance`
---@field steeringBuffer System.Single
---`Field Private Instance`
---@field _aiParams Barotrauma.CharacterParams.AIParams
---`Field Private Instance`
---@field _targetingTags (System.Collections.Generic.List*1Barotrauma*Identifier)|(Barotrauma.Identifier[])
---`Field Private Instance`
---@field movementMargin System.Single
---`Field Private Instance`
---@field targetHulls (System.Collections.Generic.List*1Barotrauma*Hull)|(Barotrauma.Hull[])
---`Field Private Instance`
---@field hullWeights (System.Collections.Generic.List*1System*Single)|(System.Single[])
---`Field Private Instance`
---@field patrolTarget Barotrauma.Hull
---`Field Private Instance`
---@field newPatrolTargetTimer System.Single
---`Field Private Instance`
---@field patrolTimerMargin System.Single
---`Field Private Instance`
---@field newPatrolTargetIntervalMin System.Single
---`Field Private Instance`
---@field newPatrolTargetIntervalMax System.Single
---`Field Private Instance`
---@field searchingNewHull System.Boolean
---`Field Private Instance`
---@field attackWorldPos Microsoft.Xna.Framework.Vector2
---`Field Private Instance`
---@field attackSimPos Microsoft.Xna.Framework.Vector2
---`Field Private Instance`
---@field reachTimer System.Single
---`Field Private Instance`
---@field attackLimbs (System.Collections.Generic.List*1Barotrauma*Limb)|(Barotrauma.Limb[])
---`Field Private Instance`
---@field weights (System.Collections.Generic.List*1System*Single)|(System.Single[])
---`Field Private Instance`
---@field aimTimer System.Single
---`Field Private Instance`
---@field visibilityCheckTimer System.Single
---`Field Private Instance`
---@field canSeeTarget System.Boolean
---`Field Private Instance`
---@field sinTime System.Single
---`Field Private Instance`
---@field blockCheckInterval System.Single
---`Field Private Instance`
---@field blockCheckTimer System.Single
---`Field Private Instance`
---@field isBlocked System.Boolean
---`Field Private Instance`
---@field attackVector System.Nullable*1Microsoft*Xna*Framework*Vector2
---`Field Private Instance`
---@field wallTarget Barotrauma.EnemyAIController.WallTarget
---`Field Private Instance`
---@field wallHits (System.Collections.Generic.List*1System*ValueTuple*2FarseerPhysics*Dynamics*Body*2System*Int32*2Microsoft*Xna*Framework*Vector2)|(System.ValueTuple*1FarseerPhysics*Dynamics*Body*1System*Int32*1Microsoft*Xna*Framework*Vector2[])
---`Field Private Instance`
---@field removals (System.Collections.Generic.List*1Barotrauma*AITarget)|(Barotrauma.AITarget[])
---`Field Private Instance`
---@field targetIgnoreTime System.Single
---`Field Private Instance`
---@field targetIgnoreTimer System.Single
---`Field Private Instance`
---@field ignoredTargets (System.Collections.Generic.HashSet*1Barotrauma*AITarget)|(Barotrauma.AITarget[])
---`Field Private Instance`
---@field stateResetCooldown System.Single
---`Field Private Instance`
---@field stateResetTimer System.Single
---`Field Private Instance`
---@field isStateChanged System.Boolean
---`Field Private Instance`
---@field activeTriggers (System.Collections.Generic.Dictionary*1Barotrauma*StatusEffect*AITrigger*1Barotrauma*CharacterParams*TargetParams)|({[Barotrauma.StatusEffect.AITrigger]:(Barotrauma.CharacterParams.TargetParams)})
---`Field Private Instance`
---@field inactiveTriggers (System.Collections.Generic.HashSet*1Barotrauma*StatusEffect*AITrigger)|(Barotrauma.StatusEffect.AITrigger[])
---`Field Private Instance`
---@field modifiedParams (System.Collections.Generic.Dictionary*1Barotrauma*Identifier*1System*Collections*Generic*IEnumerable*2Barotrauma*CharacterParams*TargetParams)|({[Barotrauma.Identifier]:((System.Collections.Generic.IEnumerable*1Barotrauma*CharacterParams*TargetParams)|(fun():(Barotrauma.CharacterParams.TargetParams)))})
---`Field Private Instance`
---@field tempParams (System.Collections.Generic.Dictionary*1Barotrauma*Identifier*1Barotrauma*CharacterParams*TargetParams)|({[Barotrauma.Identifier]:(Barotrauma.CharacterParams.TargetParams)})
---`Field Private Instance`
---@field tempParamsList (System.Collections.Generic.List*1Barotrauma*CharacterParams*TargetParams)|(Barotrauma.CharacterParams.TargetParams[])
---`Field Private Instance`
---@field returnDir Microsoft.Xna.Framework.Vector2
---`Field Private Instance`
---@field returnTimer System.Single
---`Field Private Instance`
---@field targetLimbs (System.Collections.Generic.List*1Barotrauma*Limb)|(Barotrauma.Limb[])
---`Field Public Static`
---@field DisableEnemyAI System.Boolean
---`Field Public Static`
---@field TargetingRestrictions Barotrauma.EnemyTargetingRestrictions
---`Field Private Static`
---@field minPriority System.Single
---`Field Private Static`
---@field PlayDeadCoolDown System.Single
---`Field Private Static`
---@field reachTimeOut System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field State Barotrauma.AIState
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field PreviousState Barotrauma.AIState
---`Getter Private Instance`
---@field PathSteering Barotrauma.IndoorsSteeringManager
---`Getter Private Instance`
---@field IsAttackRunning System.Boolean
---`Getter Private Instance`
---@field IsCoolDownRunning System.Boolean
---`Getter Public Instance`
---@field CombatStrength System.Single
---`Getter Private Instance`
---@field Sight System.Single
---`Getter Private Instance`
---@field Hearing System.Single
---`Getter Private Instance`
---@field FleeHealthThreshold System.Single
---`Getter Private Instance`
---@field IsAggressiveBoarder System.Boolean
---`Getter Private Instance`
---@field FishAnimController Barotrauma.FishAnimController
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field AttackLimb Barotrauma.Limb
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field ActiveAttack Barotrauma.Attack
---`Getter Public Instance`
---@field CurrentTargetMemory Barotrauma.AITargetMemory
---`Getter Public Instance`
---@field CanAttackDoors System.Boolean
---`Getter Public Instance`
---@field PriorityFearIncrement System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field LatchOntoAI Barotrauma.LatchOntoAI
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field SwarmBehavior Barotrauma.SwarmBehavior
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field PetBehavior Barotrauma.PetBehavior
---`Getter Public Instance`
---@field CurrentTargetingParams Barotrauma.CharacterParams.TargetParams
---`Getter Public Instance`
---@field AttackHumans System.Boolean
---`Getter Public Instance`
---@field AttackRooms System.Boolean
---`Getter Public Instance Virtual`
---@field CanEnterSubmarine Barotrauma.CanEnterSubmarine
---`Getter Public Instance Virtual`
---@field CanFlip System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field UnattackableSubmarines (System.Collections.Generic.HashSet*1Barotrauma*Submarine)|(Barotrauma.Submarine[])
---`Getter Private Instance`
---@field IsBeingChased System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field Reverse System.Boolean
---`Getter Public Instance`
---@field AIParams Barotrauma.CharacterParams.AIParams
---`Getter Private Instance`
---@field IsLatchedOnSub System.Boolean
_G['EnemyAIController'] = {}

---`Method Public Instance Virtual`
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
_G['EnemyAIController'].DebugDraw = function(spriteBatch) end

---`Method Private Instance`
---@param range System.Single
---@return System.Single
_G['EnemyAIController'].GetPerceptionRange = function(range) end

---`Method Public Static`
---@param target Barotrauma.Character
---@param character Barotrauma.Character
---@return System.Boolean
_G['EnemyAIController'].IsTargetBeingChasedBy = function(target, character) end

---`Method Public Instance`
---@param c Barotrauma.Character
---@return System.Boolean
_G['EnemyAIController'].IsBeingChasedBy = function(c) end

---`Method Private Static`
---@param target Barotrauma.AITarget
---@return System.Boolean
_G['EnemyAIController'].IsTargetInPlayerTeam = function(target) end

---`Method Private Instance`
---@param other Barotrauma.Character
---@return System.Boolean
_G['EnemyAIController'].IsAttackingOwner = function(other) end

---`Method Private Instance`
---@overload fun(targetTag:Barotrauma.Identifier):((System.Collections.Generic.IEnumerable*1Barotrauma*CharacterParams*TargetParams)|(fun():(Barotrauma.CharacterParams.TargetParams)))
---@param targetingTags (System.Collections.Generic.IEnumerable*1Barotrauma*Identifier)|(fun():(Barotrauma.Identifier))
---@return (System.Collections.Generic.IEnumerable*1Barotrauma*CharacterParams*TargetParams)|(fun():(Barotrauma.CharacterParams.TargetParams))
_G['EnemyAIController'].GetTargetParams = function(targetingTags) end

---`Method Private Instance`
---@param aiTarget Barotrauma.AITarget
---@return (System.Collections.Generic.IEnumerable*1Barotrauma*Identifier)|(fun():(Barotrauma.Identifier))
_G['EnemyAIController'].GetTargetingTags = function(aiTarget) end

---`Method Public Instance Virtual`
---@param target Barotrauma.AITarget
_G['EnemyAIController'].SelectTarget = function(target) end

---`Method Public Instance`
---@param target Barotrauma.AITarget
---@param priority System.Single
_G['EnemyAIController'].SelectTarget = function(target, priority) end

---`Method Private Instance`
_G['EnemyAIController'].ReleaseDragTargets = function() end

---`Method Public Instance`
---@param probability? System.Nullable*1System*Single
_G['EnemyAIController'].EvaluatePlayDeadProbability = function(probability) end

---`Method Public Instance Virtual`
---@param deltaTime System.Single
_G['EnemyAIController'].Update = function(deltaTime) end

---`Method Private Instance`
---@param deltaTime System.Single
---@param followLastTarget? System.Boolean
_G['EnemyAIController'].UpdateIdle = function(deltaTime, followLastTarget) end

---`Method Private Instance`
---@param deltaTime System.Single
---@param followLastTarget? System.Boolean
_G['EnemyAIController'].UpdatePatrol = function(deltaTime, followLastTarget) end

---`Method Private Instance`
_G['EnemyAIController'].FindTargetHulls = function() end

---`Method Private Instance`
---@param target Barotrauma.AITarget
---@param otherTarget Barotrauma.AITarget
---@return System.Boolean
_G['EnemyAIController'].IsSameTarget = function(target, otherTarget) end

---`Method Private Instance`
---@param deltaTime System.Single
_G['EnemyAIController'].UpdateAttack = function(deltaTime) end

---`Method Public Instance`
---@param attack Barotrauma.Attack
---@param targetEntity Barotrauma.ISpatialEntity
_G['EnemyAIController'].AimRangedAttack = function(attack, targetEntity) end

---`Method Private Instance`
---@param attackingLimb Barotrauma.Limb
---@param currentContexts (System.Collections.Generic.IEnumerable*1Barotrauma*AttackContext)|(fun():(Barotrauma.AttackContext))
---@param target Barotrauma.Entity
---@return System.Boolean
_G['EnemyAIController'].IsValidAttack = function(attackingLimb, currentContexts, target) end

---`Method Private Instance`
---@param attackWorldPos Microsoft.Xna.Framework.Vector2
---@param ignoredLimb? Barotrauma.Limb
---@return Barotrauma.Limb
_G['EnemyAIController'].GetAttackLimb = function(attackWorldPos, ignoredLimb) end

---`Method Public Instance Virtual`
---@param attacker Barotrauma.Character
---@param attackResult Barotrauma.AttackResult
_G['EnemyAIController'].OnAttacked = function(attacker, attackResult) end

---`Method Private Instance`
---@param limb Barotrauma.Limb
---@return Barotrauma.Item
_G['EnemyAIController'].GetEquippedItem = function(limb) end

---`Method Private Static`
---@param dmg System.Single
---@param vitality System.Single
---@return System.Single
_G['EnemyAIController'].GetRelativeDamage = function(dmg, vitality) end

---`Method Private Instance`
---@param deltaTime System.Single
---@param attackSimPos Microsoft.Xna.Framework.Vector2
---@param damageTarget Barotrauma.IDamageable
---@param distance? System.Single
---@param targetLimb? Barotrauma.Limb
---@return System.Boolean
_G['EnemyAIController'].UpdateLimbAttack = function(deltaTime, attackSimPos, damageTarget, distance, targetLimb) end

---`Method Private Instance`
---@param deltaTime System.Single
---@param target Barotrauma.ISpatialEntity
---@param weapon Barotrauma.Item
---@return System.Boolean
_G['EnemyAIController'].Aim = function(deltaTime, target, weapon) end

---`Method Private Instance`
---@param timer? System.Single
_G['EnemyAIController'].SetAimTimer = function(timer) end

---`Method Private Instance`
---@param deltaTime System.Single
---@param steerPos Microsoft.Xna.Framework.Vector2
---@param collisionCategory? FarseerPhysics.Dynamics.Category
---@return System.Boolean
_G['EnemyAIController'].IsBlocked = function(deltaTime, steerPos, collisionCategory) end

---`Method Private Instance`
---@param attackWorldPos Microsoft.Xna.Framework.Vector2
---@param deltaTime System.Single
---@param followThrough System.Boolean
---@param checkBlocking? System.Boolean
---@param avoidObstacles? System.Boolean
---@return System.Boolean
_G['EnemyAIController'].UpdateFallBack = function(attackWorldPos, deltaTime, followThrough, checkBlocking, avoidObstacles) end

---`Method Private Instance`
---@param attack Barotrauma.Attack
---@return Barotrauma.Limb
_G['EnemyAIController'].GetLimbToRotate = function(attack) end

---`Method Private Instance`
---@param deltaTime System.Single
_G['EnemyAIController'].UpdateEating = function(deltaTime) end

---`Method Private Instance`
_G['EnemyAIController'].ReleaseEatingTarget = function() end

---`Method Private Instance`
---@param deltaTime System.Single
_G['EnemyAIController'].UpdateFollow = function(deltaTime) end

---`Method Public Static`
---@param target Barotrauma.Character
---@param character Barotrauma.Character
---@return System.Boolean
_G['EnemyAIController'].IsLatchedTo = function(target, character) end

---`Method Public Static`
---@param target Barotrauma.Character
---@param character Barotrauma.Character
---@return System.Boolean
_G['EnemyAIController'].IsLatchedToSomeoneElse = function(target, character) end

---`Method Public Instance`
_G['EnemyAIController'].UpdateTargets = function() end

---`Method Private Instance`
---@param requiredHoleCount System.Int32
_G['EnemyAIController'].UpdateWallTarget = function(requiredHoleCount) end

---`Method Private Instance`
---@param deltaTime System.Single
---@return System.Boolean
_G['EnemyAIController'].TrySteerThroughGaps = function(deltaTime) end

---`Method Private Instance`
---@param target Barotrauma.AITarget
---@param addIfNotFound? System.Boolean
---@param keepAlive? System.Boolean
---@return Barotrauma.AITargetMemory
_G['EnemyAIController'].GetTargetMemory = function(target, addIfNotFound, keepAlive) end

---`Method Private Instance`
_G['EnemyAIController'].UpdateCurrentMemoryLocation = function() end

---`Method Private Instance`
---@param deltaTime System.Single
_G['EnemyAIController'].FadeMemories = function(deltaTime) end

---`Method Public Instance`
---@param target Barotrauma.AITarget
_G['EnemyAIController'].IgnoreTarget = function(target) end

---`Method Public Instance`
---@param trigger Barotrauma.StatusEffect.AITrigger
_G['EnemyAIController'].LaunchTrigger = function(trigger) end

---`Method Private Instance`
---@param deltaTime System.Single
_G['EnemyAIController'].UpdateTriggers = function(deltaTime) end

---`Method Private Instance`
---@param tag Barotrauma.Identifier
---@return System.Boolean
_G['EnemyAIController'].TryResetOriginalState = function(tag) end

---`Method Private Instance`
---@overload fun(targetParams:Barotrauma.CharacterParams.TargetParams, state:Barotrauma.AIState, priority?:System.Nullable*1System*Single)
---@param tag Barotrauma.Identifier
---@param state Barotrauma.AIState
---@param priority? System.Nullable*1System*Single
---@param onlyExisting? System.Boolean
---@param ignoreAttacksIfNotInSameSub? System.Boolean
_G['EnemyAIController'].ChangeParams = function(tag, state, priority, onlyExisting, ignoreAttacksIfNotInSameSub) end

---`Method Private Instance`
---@param targetParams Barotrauma.CharacterParams.TargetParams
_G['EnemyAIController'].ResetParams = function(targetParams) end

---`Method Private Instance`
---@overload fun(tag:Barotrauma.Identifier, state:Barotrauma.AIState, priority?:System.Nullable*1System*Single)
---@param target Barotrauma.Character
---@param state Barotrauma.AIState
---@param priority? System.Nullable*1System*Single
_G['EnemyAIController'].ChangeTargetState = function(target, state, priority) end

---`Method Private Instance`
_G['EnemyAIController'].ResetOriginalState = function() end

---`Method NonPublic Instance Virtual`
---@param previousTarget Barotrauma.AITarget
---@param newTarget Barotrauma.AITarget
_G['EnemyAIController'].OnTargetChanged = function(previousTarget, newTarget) end

---`Method NonPublic Instance Virtual`
---@param from Barotrauma.AIState
---@param to Barotrauma.AIState
_G['EnemyAIController'].OnStateChanged = function(from, to) end

---`Method Private Instance`
_G['EnemyAIController'].SetStateResetTimer = function() end

---`Method Private Instance`
---@param target Barotrauma.AITarget
---@return System.Single
_G['EnemyAIController'].GetPerceivingRange = function(target) end

---`Method Private Instance`
---@param target Barotrauma.AITarget
---@param dist? System.Single
---@param distSquared? System.Single
---@param checkVisibility? System.Boolean
---@return System.Boolean
_G['EnemyAIController'].CanPerceive = function(target, dist, distSquared, checkVisibility) end

---`Method Public Instance`
_G['EnemyAIController'].ReevaluateAttacks = function() end

---`Method Private Instance`
---@param pos Microsoft.Xna.Framework.Vector2
---@param targetDir Microsoft.Xna.Framework.Vector2-ref
---@return System.Boolean
_G['EnemyAIController'].IsPositionInsideAllowedZone = function(pos, targetDir) end

---`Method Private Instance`
---@param deltaTime System.Single
_G['EnemyAIController'].SteerInsideLevel = function(deltaTime) end

---`Method Public Instance Virtual`
---@overload fun(wall:Barotrauma.Structure, section:Barotrauma.WallSection, targetWorldPos:Microsoft.Xna.Framework.Vector2, deltaTime:System.Single):(System.Boolean)
---@param gap Barotrauma.Gap
---@param targetWorldPos Microsoft.Xna.Framework.Vector2
---@param deltaTime System.Single
---@param maxDistance? System.Single
---@return System.Boolean
_G['EnemyAIController'].SteerThroughGap = function(gap, targetWorldPos, deltaTime, maxDistance) end

---`Method Public Instance`
---@param wall Barotrauma.Structure
---@param sectionIndex System.Int32
---@return System.Boolean
_G['EnemyAIController'].CanPassThroughHole = function(wall, sectionIndex) end

---`Method Public Instance Virtual`
---@param deltaTime System.Single
---@return System.Boolean
_G['EnemyAIController'].Escape = function(deltaTime) end

---`Method Public Instance`
---@param attackLimb Barotrauma.Limb
---@param target Barotrauma.Character
---@param targetLimbType? Barotrauma.LimbType
---@return Barotrauma.Limb
_G['EnemyAIController'].GetTargetLimb = function(attackLimb, target, targetLimbType) end

---`Method Private Static`
---@param item Barotrauma.Item
---@return Barotrauma.Character
_G['EnemyAIController'].GetOwner = function(item) end

---`Constructor Public Instance`
---@param c Barotrauma.Character
---@param seed System.String
---@return Barotrauma.EnemyAIController
_G['EnemyAIController'] = function(c, seed) end

---`Constructor Public Instance`
---@param c Barotrauma.Character
---@param seed System.String
---@return Barotrauma.EnemyAIController
_G['EnemyAIController'].__new = function(c, seed) end

