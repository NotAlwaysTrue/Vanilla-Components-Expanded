---@meta
---@class Barotrauma.HumanAIController : Barotrauma.AIController
---`Field Private Instance`
---@field objectiveManager Barotrauma.AIObjectiveManager
---`Field Private Instance`
---@field crouchRaycastTimer System.Single
---`Field Private Instance`
---@field reactTimer System.Single
---`Field Private Instance`
---@field unreachableClearTimer System.Single
---`Field Private Instance`
---@field shouldCrouch System.Boolean
---`Field Public Instance`
---@field AutoFaceMovement System.Boolean
---`Field Private Instance`
---@field flipTimer System.Single
---`Field Public Instance`
---@field UnreachableHulls (System.Collections.Generic.HashSet*1Barotrauma*Hull)|(Barotrauma.Hull[])
---`Field Public Instance`
---@field UnsafeHulls (System.Collections.Generic.HashSet*1Barotrauma*Hull)|(Barotrauma.Hull[])
---`Field Public Instance`
---@field IgnoredItems (System.Collections.Generic.List*1Barotrauma*Item)|(Barotrauma.Item[])
---`Field Private Instance`
---@field dirtyHullSafetyCalculations (System.Collections.Generic.HashSet*1Barotrauma*Hull)|(Barotrauma.Hull[])
---`Field Private Instance`
---@field respondToAttackTimer System.Single
---`Field Private Instance`
---@field wasConscious System.Boolean
---`Field Private Instance`
---@field freezeAI System.Boolean
---`Field Private Instance`
---@field maxSteeringBuffer System.Single
---`Field Private Instance`
---@field minSteeringBuffer System.Single
---`Field Private Instance`
---@field steeringBufferIncreaseSpeed System.Single
---`Field Private Instance`
---@field steeringBuffer System.Single
---`Field Private Instance`
---@field obstacleRaycastIntervalShort System.Single
---`Field Private Instance`
---@field obstacleRaycastIntervalLong System.Single
---`Field Private Instance`
---@field obstacleRaycastTimer System.Single
---`Field Private Instance`
---@field isBlocked System.Boolean
---`Field Private Instance`
---@field enemyCheckInterval System.Single
---`Field Private Instance`
---@field enemySpotDistanceOutside System.Single
---`Field Private Instance`
---@field enemySpotDistanceInside System.Single
---`Field Private Instance`
---@field enemyCheckTimer System.Single
---`Field Private Instance`
---@field reportProblemsInterval System.Single
---`Field Private Instance`
---@field reportProblemsTimer System.Single
---`Field Private Instance`
---@field _aimSpeed System.Single
---`Field Private Instance`
---@field _aimAccuracy System.Single
---`Field Private Instance`
---@field previousAttackResults (System.Collections.Generic.Dictionary*1Barotrauma*Character*1Barotrauma*AttackResult)|({[Barotrauma.Character]:(Barotrauma.AttackResult)})
---`Field Private Instance`
---@field previousHealAmounts (System.Collections.Generic.Dictionary*1Barotrauma*Character*1System*Single)|({[Barotrauma.Character]:(System.Single)})
---`Field Private Instance`
---@field outsideSteering Barotrauma.SteeringManager
---`Field Private Instance`
---@field insideSteering Barotrauma.SteeringManager
---`Field Private Instance`
---@field structureDamageAccumulator (System.Collections.Generic.Dictionary*1Barotrauma*Character*1System*Single)|({[Barotrauma.Character]:(System.Single)})
---`Field Private Instance`
---@field knownHulls (System.Collections.Generic.Dictionary*1Barotrauma*Hull*1Barotrauma*HumanAIController*HullSafety)|({[Barotrauma.Hull]:(Barotrauma.HumanAIController.HullSafety)})
---`Field Private Instance`
---@field itemsToRelocate (System.Collections.Generic.HashSet*1Barotrauma*Item)|(Barotrauma.Item[])
---`Field Private Instance`
---@field findItemState Barotrauma.HumanAIController.FindItemState
---`Field Private Instance`
---@field itemIndex System.Int32
---`Field Private Instance`
---@field draggedTimer System.Single
---`Field Private Instance`
---@field refuseDraggingTimer System.Single
---`Field Public Static`
---@field DebugAI System.Boolean
---`Field Public Static`
---@field DisableCrewAI System.Boolean
---`Field Private Static`
---@field characterWaitOnSwitch System.Single
---`Field Private Static`
---@field matchingItems (System.Collections.Generic.List*1Barotrauma*Item)|(Barotrauma.Item[])
---`Field Private Static`
---@field reactionTime System.Single
---`Field Private Static`
---@field crouchRaycastInterval System.Single
---`Field Private Static`
---@field sortObjectiveInterval System.Single
---`Field Private Static`
---@field clearUnreachableInterval System.Single
---`Field Private Static`
---@field FlipInterval System.Single
---`Field Public Static`
---@field HULL_SAFETY_THRESHOLD System.Single
---`Field Public Static`
---@field HULL_LOW_OXYGEN_PERCENTAGE System.Single
---`Field Private Static`
---@field RespondToAttackInterval System.Single
---`Field Private Static`
---@field RefuseDraggingThresholdHigh System.Single
---`Field Private Static`
---@field RefuseDraggingThresholdLow System.Single
---`Field Private Static`
---@field RefuseDraggingDuration System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field SortTimer System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Hearing System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field ReportRange System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field FindWeaponsRange System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field AimSpeed System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field AimAccuracy System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field UseOutsideWaypoints System.Boolean
---`Getter Public Instance`
---@field PathSteering Barotrauma.IndoorsSteeringManager
---`Getter Public Instance`
---@field AnimController Barotrauma.HumanoidAnimController
---`Getter Public Instance`
---@field ObjectiveManager Barotrauma.AIObjectiveManager
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field CurrentHullSafety System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field MentalStateManager Barotrauma.MentalStateManager
---`Getter Public Instance Virtual`
---@field IsMentallyUnstable System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field ShipCommandManager Barotrauma.ShipCommandManager
_G['HumanAIController'] = {}

---`Method Public Instance Virtual`
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
_G['HumanAIController'].DebugDraw = function(spriteBatch) end

---`Method Public Instance`
_G['HumanAIController'].InitMentalStateManager = function() end

---`Method Public Instance`
_G['HumanAIController'].InitShipCommandManager = function() end

---`Method Public Instance Virtual`
---@param deltaTime System.Single
_G['HumanAIController'].Update = function(deltaTime) end

---`Method Private Instance`
_G['HumanAIController'].SpotEnemies = function() end

---`Method Private Instance`
_G['HumanAIController'].UnequipUnnecessaryItems = function() end

---`Method Public Instance`
---@param item Barotrauma.Item
_G['HumanAIController'].HandleRelocation = function(item) end

---`Method Public Instance`
---@param containableItem Barotrauma.Item
---@param suitableContainer Barotrauma.Item-ref
---@return System.Boolean
_G['HumanAIController'].FindSuitableContainer = function(containableItem, suitableContainer) end

---`Method Public Static`
---@param character Barotrauma.Character
---@param containableItem Barotrauma.Item
---@param ignoredItems (System.Collections.Generic.List*1Barotrauma*Item)|(Barotrauma.Item[])
---@param itemIndex System.Int32-ref
---@param suitableContainer Barotrauma.Item-ref
---@return System.Boolean
_G['HumanAIController'].FindSuitableContainer = function(character, containableItem, ignoredItems, itemIndex, suitableContainer) end

---`Method Private Instance`
---@param deltaTime System.Single
_G['HumanAIController'].UpdateDragged = function(deltaTime) end

---`Method NonPublic Instance`
_G['HumanAIController'].ReportProblems = function() end

---`Method Public Static`
---@param character Barotrauma.Character
---@param hull Barotrauma.Hull
---@return System.Boolean
_G['HumanAIController'].IsBallastFloraNoticeable = function(character, hull) end

---`Method Public Static`
---@param reporter Barotrauma.Character
---@param order Barotrauma.Order
---@param targetHull? Barotrauma.Hull
_G['HumanAIController'].ReportProblem = function(reporter, order, targetHull) end

---`Method Private Instance`
_G['HumanAIController'].SpeakAboutIssues = function() end

---`Method Private Instance`
_G['HumanAIController'].CheckForDraggedCorpses = function() end

---`Method Public Instance Virtual`
---@param healer Barotrauma.Character
---@param healAmount System.Single
_G['HumanAIController'].OnHealed = function(healer, healAmount) end

---`Method Public Instance Virtual`
---@param attacker Barotrauma.Character
---@param attackResult Barotrauma.AttackResult
_G['HumanAIController'].OnAttacked = function(attacker, attackResult) end

---`Method Private Instance`
---@param attacker Barotrauma.Character
---@param attackResult Barotrauma.AttackResult
_G['HumanAIController'].RespondToAttack = function(attacker, attackResult) end

---`Method Public Instance`
---@param mode Barotrauma.AIObjectiveCombat.CombatMode
---@param target Barotrauma.Character
---@param delay? System.Single
---@param abortCondition? (System.Func*1Barotrauma*AIObjective*1System*Boolean)|(fun(arg:Barotrauma.AIObjective):(System.Boolean))
---@param onAbort? (System.Action)|(fun())
---@param onCompleted? (System.Action)|(fun())
---@param allowHoldFire? System.Boolean
---@param speakWarnings? System.Boolean
_G['HumanAIController'].AddCombatObjective = function(mode, target, delay, abortCondition, onAbort, onCompleted, allowHoldFire, speakWarnings) end

---`Method Public Instance`
---@param order Barotrauma.Order
---@param speak? System.Boolean
_G['HumanAIController'].SetOrder = function(order, speak) end

---`Method Public Instance`
---@param order Barotrauma.Order
---@return Barotrauma.AIObjective
_G['HumanAIController'].SetForcedOrder = function(order) end

---`Method Public Instance`
_G['HumanAIController'].ClearForcedOrder = function() end

---`Method Public Instance Virtual`
---@param target Barotrauma.AITarget
_G['HumanAIController'].SelectTarget = function(target) end

---`Method Public Instance Virtual`
_G['HumanAIController'].Reset = function() end

---`Method Public Instance Virtual`
---@param deltaTime System.Single
---@return System.Boolean
_G['HumanAIController'].Escape = function(deltaTime) end

---`Method Private Instance`
---@param deltaTime System.Single
_G['HumanAIController'].CheckCrouching = function(deltaTime) end

---`Method Public Instance`
---@return System.Boolean
_G['HumanAIController'].AllowCampaignInteraction = function() end

---`Method Public Instance`
---@param hull Barotrauma.Hull
---@param needsSuit System.Boolean-ref
---@param objectiveManager? Barotrauma.AIObjectiveManager
---@return System.Boolean
_G['HumanAIController'].NeedsDivingGear = function(hull, needsSuit, objectiveManager) end

---`Method Public Static`
---@param character Barotrauma.Character
---@param conditionPercentage? System.Single
---@param requireOxygenTank? System.Boolean
---@return System.Boolean
_G['HumanAIController'].HasDivingGear = function(character, conditionPercentage, requireOxygenTank) end

---`Method Public Static`
---@param character Barotrauma.Character
---@param conditionPercentage? System.Single
---@param requireOxygenTank? System.Boolean
---@param requireSuitablePressureProtection? System.Boolean
---@return System.Boolean
_G['HumanAIController'].HasDivingSuit = function(character, conditionPercentage, requireOxygenTank, requireSuitablePressureProtection) end

---`Method Public Static`
---@param character Barotrauma.Character
---@param conditionPercentage? System.Single
---@param requireOxygenTank? System.Boolean
---@return System.Boolean
_G['HumanAIController'].HasDivingMask = function(character, conditionPercentage, requireOxygenTank) end

---`Method Public Static`
---@param character Barotrauma.Character
---@param tagOrIdentifier Barotrauma.Identifier
---@param items System.Collections.Generic.IEnumerable
---@param containedTag? Barotrauma.Identifier
---@param conditionPercentage? System.Single
---@param requireEquipped? System.Boolean
---@param recursive? System.Boolean
---@param predicate? (System.Func*1Barotrauma*Item*1System*Boolean)|(fun(arg:Barotrauma.Item):(System.Boolean))
---@return System.Boolean
_G['HumanAIController'].HasItem = function(character, tagOrIdentifier, items, containedTag, conditionPercentage, requireEquipped, recursive, predicate) end

---`Method Public Static`
---@param structure Barotrauma.Structure
---@param damageAmount System.Single
---@param character Barotrauma.Character
_G['HumanAIController'].StructureDamaged = function(structure, damageAmount, character) end

---`Method Public Static`
---@param item Barotrauma.Item
---@param thief Barotrauma.Character
_G['HumanAIController'].ItemTaken = function(item, thief) end

---`Method Public Static`
---@param item Barotrauma.Item
_G['HumanAIController'].ApplyStealingReputationLoss = function(item) end

---`Method Private Static`
---@return System.Single
_G['HumanAIController'].GetReactionTime = function() end

---`Method Private Static`
---@param character Barotrauma.Character
---@param hull Barotrauma.Hull
_G['HumanAIController'].PropagateHullSafety = function(character, hull) end

---`Method Public Instance`
---@param hull Barotrauma.Hull
_G['HumanAIController'].AskToRecalculateHullSafety = function(hull) end

---`Method Private Instance`
---@param hull Barotrauma.Hull
_G['HumanAIController'].RefreshHullSafety = function(hull) end

---`Method Private Static`
---@param character Barotrauma.Character
---@param order Barotrauma.Order
---@param hull Barotrauma.Hull
_G['HumanAIController'].RefreshTargets = function(character, order, hull) end

---`Method Private Static`
---@param caller Barotrauma.Character
---@param target Barotrauma.HumanAIController.T2
---@return System.Boolean
_G['HumanAIController'].AddTargets = function(caller, target) end

---`Method Public Static`
---@param caller Barotrauma.Character
---@param target Barotrauma.HumanAIController.T2
_G['HumanAIController'].RemoveTargets = function(caller, target) end

---`Method Private Instance`
---@param hull Barotrauma.Hull
---@param safety Barotrauma.HumanAIController.HullSafety
_G['HumanAIController'].StoreHullSafety = function(hull, safety) end

---`Method Private Instance`
---@param hull Barotrauma.Hull
---@param character Barotrauma.Character
---@param visibleHulls? (System.Collections.Generic.IEnumerable*1Barotrauma*Hull)|(fun():(Barotrauma.Hull))
---@return System.Single
_G['HumanAIController'].CalculateHullSafety = function(hull, character, visibleHulls) end

---`Method Private Static`
---@param hull Barotrauma.Hull
---@param visibleHulls (System.Collections.Generic.IEnumerable*1Barotrauma*Hull)|(fun():(Barotrauma.Hull))
---@param character Barotrauma.Character
---@param ignoreWater? System.Boolean
---@param ignoreOxygen? System.Boolean
---@param ignoreFire? System.Boolean
---@param ignoreEnemies? System.Boolean
---@param ignorePressureProtection? System.Boolean
---@return System.Single
_G['HumanAIController'].CalculateHullSafety = function(hull, visibleHulls, character, ignoreWater, ignoreOxygen, ignoreFire, ignoreEnemies, ignorePressureProtection) end

---`Method Public Static`
---@param character Barotrauma.Character
---@return System.Single
_G['HumanAIController'].CalculateObjectiveHullSafety = function(character) end

---`Method Public Instance`
---@param hull Barotrauma.Hull
---@param character Barotrauma.Character
---@param visibleHulls? (System.Collections.Generic.IEnumerable*1Barotrauma*Hull)|(fun():(Barotrauma.Hull))
---@return System.Single
_G['HumanAIController'].GetHullSafety = function(hull, character, visibleHulls) end

---`Method Public Static`
---@param hull Barotrauma.Hull
---@param visibleHulls (System.Collections.Generic.IEnumerable*1Barotrauma*Hull)|(fun():(Barotrauma.Hull))
---@param character Barotrauma.Character
---@param ignoreWater? System.Boolean
---@param ignoreOxygen? System.Boolean
---@param ignoreFire? System.Boolean
---@param ignoreEnemies? System.Boolean
---@return System.Single
_G['HumanAIController'].GetHullSafety = function(hull, visibleHulls, character, ignoreWater, ignoreOxygen, ignoreFire, ignoreEnemies) end

---`Method Public Static`
---@param me Barotrauma.Character
---@param other Barotrauma.Character
---@param onlySameTeam? System.Boolean
---@param ignoreHuskDisguising? System.Boolean
---@return System.Boolean
_G['HumanAIController'].IsFriendly = function(me, other, onlySameTeam, ignoreHuskDisguising) end

---`Method Public Instance`
---@param other Barotrauma.Character
---@param onlySameTeam? System.Boolean
---@return System.Boolean
_G['HumanAIController'].IsFriendly = function(other, onlySameTeam) end

---`Method Public Instance`
---@return System.Boolean
_G['HumanAIController'].IsInHostileFaction = function() end

---`Method Public Static`
---@param c Barotrauma.Character
---@return System.Boolean
_G['HumanAIController'].IsActive = function(c) end

---`Method Public Static`
---@param character Barotrauma.Character
---@param predicate (System.Func*1Barotrauma*HumanAIController*1System*Boolean)|(fun(arg:Barotrauma.HumanAIController):(System.Boolean))
---@return System.Boolean
_G['HumanAIController'].IsTrueForAllBotsInTheCrew = function(character, predicate) end

---`Method Public Instance`
---@param predicate (System.Func*1Barotrauma*HumanAIController*1System*Boolean)|(fun(arg:Barotrauma.HumanAIController):(System.Boolean))
---@return System.Boolean
_G['HumanAIController'].IsTrueForAllBotsInTheCrew = function(predicate) end

---`Method Public Static`
---@param character Barotrauma.Character
---@param predicate (System.Func*1Barotrauma*HumanAIController*1System*Boolean)|(fun(arg:Barotrauma.HumanAIController):(System.Boolean))
---@return System.Boolean
_G['HumanAIController'].IsTrueForAnyBotInTheCrew = function(character, predicate) end

---`Method Public Instance`
---@param predicate (System.Func*1Barotrauma*HumanAIController*1System*Boolean)|(fun(arg:Barotrauma.HumanAIController):(System.Boolean))
---@return System.Boolean
_G['HumanAIController'].IsTrueForAnyBotInTheCrew = function(predicate) end

---`Method Public Static`
---@param character Barotrauma.Character
---@param predicate? (System.Func*1Barotrauma*HumanAIController*1System*Boolean)|(fun(arg:Barotrauma.HumanAIController):(System.Boolean))
---@return System.Int32
_G['HumanAIController'].CountBotsInTheCrew = function(character, predicate) end

---`Method Public Instance`
---@param predicate? (System.Func*1Barotrauma*HumanAIController*1System*Boolean)|(fun(arg:Barotrauma.HumanAIController):(System.Boolean))
---@return System.Int32
_G['HumanAIController'].CountBotsInTheCrew = function(predicate) end

---`Method Public Instance`
---@param predicate (System.Func*1Barotrauma*Character*1System*Boolean)|(fun(arg:Barotrauma.Character):(System.Boolean))
---@param onlyActive? System.Boolean
---@param onlyConnectedSubs? System.Boolean
---@return System.Boolean
_G['HumanAIController'].IsTrueForAnyCrewMember = function(predicate, onlyActive, onlyConnectedSubs) end

---`Method Private Static`
---@param character Barotrauma.Character
---@param action (System.Action*1Barotrauma*HumanAIController)|(fun(obj:Barotrauma.HumanAIController))
---@param range? System.Single
_G['HumanAIController'].DoForEachBot = function(character, action, range) end

---`Method Private Static`
---@param character Barotrauma.Character
---@param target Barotrauma.Character
---@param range System.Single
---@return System.Boolean
_G['HumanAIController'].CheckReportRange = function(character, target, range) end

---`Method Private Static`
---@param self Barotrauma.Character
---@param other Barotrauma.Character
---@return System.Boolean
_G['HumanAIController'].IsBotInTheCrew = function(self, other) end

---`Method Public Static`
---@param target Barotrauma.Items.Components.ItemComponent
---@param team Barotrauma.CharacterTeamType
---@param operatingCharacter Barotrauma.Character-ref
---@return System.Boolean
_G['HumanAIController'].IsItemTargetedBySomeone = function(target, team, operatingCharacter) end

---`Constructor Public Instance`
---@overload fun(c:Barotrauma.Character):Barotrauma.HumanAIController
---@return Barotrauma.HumanAIController
_G['HumanAIController'] = function() end

---`Constructor Public Instance`
---@overload fun(c:Barotrauma.Character):Barotrauma.HumanAIController
---@return Barotrauma.HumanAIController
_G['HumanAIController'].__new = function() end

---`Constructor Private Static`
---@overload fun(c:Barotrauma.Character):Barotrauma.HumanAIController
---@return Barotrauma.HumanAIController
_G['HumanAIController'] = function() end

---`Constructor Private Static`
---@overload fun(c:Barotrauma.Character):Barotrauma.HumanAIController
---@return Barotrauma.HumanAIController
_G['HumanAIController'].__new = function() end

