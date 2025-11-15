---@meta
---@class Barotrauma.AIObjectiveCombat : Barotrauma.AIObjective
---`Field Private Instance`
---@field initialMode Barotrauma.AIObjectiveCombat.CombatMode
---`Field Private Instance`
---@field checkWeaponsTimer System.Single
---`Field Private Instance`
---@field ignoreWeaponTimer System.Single
---`Field Private Instance`
---@field holdFireTimer System.Single
---`Field Private Instance`
---@field hasAimed System.Boolean
---`Field Private Instance`
---@field isLethalWeapon System.Boolean
---`Field Private Instance`
---@field allowCooldown System.Boolean
---`Field Private Instance`
---@field _weapon Barotrauma.Item
---`Field Private Instance`
---@field _weaponComponent Barotrauma.Items.Components.ItemComponent
---`Field Private Instance`
---@field hasValidRangedWeapon System.Boolean
---`Field Private Instance`
---@field findSafety Barotrauma.AIObjectiveFindSafety
---`Field Private Instance`
---@field weapons (System.Collections.Generic.HashSet*1Barotrauma*Items*Components*ItemComponent)|(Barotrauma.Items.Components.ItemComponent[])
---`Field Private Instance`
---@field ignoredWeapons (System.Collections.Generic.HashSet*1Barotrauma*Items*Components*ItemComponent)|(Barotrauma.Items.Components.ItemComponent[])
---`Field Private Instance`
---@field seekAmmunitionObjective Barotrauma.AIObjectiveContainItem
---`Field Private Instance`
---@field retreatObjective Barotrauma.AIObjectiveGoTo
---`Field Private Instance`
---@field followTargetObjective Barotrauma.AIObjectiveGoTo
---`Field Private Instance`
---@field seekWeaponObjective Barotrauma.AIObjectiveGetItem
---`Field Private Instance`
---@field retreatTarget Barotrauma.Hull
---`Field Private Instance`
---@field coolDownTimer System.Single
---`Field Private Instance`
---@field pathBackTimer System.Single
---`Field Private Instance`
---@field aimTimer System.Single
---`Field Private Instance`
---@field reloadTimer System.Single
---`Field Private Instance`
---@field spreadTimer System.Single
---`Field Private Instance`
---@field canSeeTarget System.Boolean
---`Field Private Instance`
---@field visibilityCheckTimer System.Single
---`Field Private Instance`
---@field sqrDistance System.Single
---`Field Private Instance`
---@field distanceTimer System.Single
---`Field Public Instance`
---@field AllowHoldFire System.Boolean
---`Field Public Instance`
---@field SpeakWarnings System.Boolean
---`Field Private Instance`
---@field firstWarningTriggered System.Boolean
---`Field Private Instance`
---@field lastWarningTriggered System.Boolean
---`Field Private Instance`
---@field arrestingRegistered System.Boolean
---`Field Public Instance`
---@field holdFireCondition (System.Func*1System*Boolean)|(fun():(System.Boolean))
---`Field Private Instance`
---@field isMoving System.Boolean
---`Field Private Instance`
---@field findHullTimer System.Single
---`Field Private Instance`
---@field isAimBlocked System.Boolean
---`Field Private Instance`
---@field _blockedDistance System.Single
---`Field Public Instance`
---@field BlockedPositions (System.Collections.Generic.List*1Microsoft*Xna*Framework*Vector2)|(Microsoft.Xna.Framework.Vector2[])
---`Field Private Instance`
---@field allowCrouching System.Boolean
---`Field Private Instance`
---@field standUpTimer System.Single
---`Field Private Static`
---@field CheckWeaponsInterval System.Single
---`Field Private Static`
---@field IgnoredWeaponsClearTime System.Single
---`Field Private Static`
---@field GoodWeaponPriority System.Single
---`Field Private Static`
---@field DefaultCoolDown System.Single
---`Field Private Static`
---@field PathBackCheckTime System.Single
---`Field Private Static`
---@field VisibilityCheckInterval System.Single
---`Field Private Static`
---@field MaxDistance System.Single
---`Field Private Static`
---@field DistanceCheckInterval System.Single
---`Field Private Static`
---@field CloseDistance System.Single
---`Field Private Static`
---@field MeleeDistance System.Single
---`Field Private Static`
---@field TooCloseToShoot System.Single
---`Field Private Static`
---@field FloorHeightApproximate System.Single
---`Field Private Static`
---@field ArrestTargetDistance System.Single
---`Field Private Static`
---@field findHullInterval System.Single
---`Field Private Static`
---@field StandUpCooldown System.Single
---`Getter Public Instance Virtual`
---<br/>`Setter Public Instance Virtual`
---@field Identifier Barotrauma.Identifier
---`Getter Public Instance Virtual`
---@field DebugTag System.String
---`Getter Public Instance Virtual`
---@field KeepDivingGearOn System.Boolean
---`Getter Public Instance Virtual`
---@field IgnoreUnsafeHulls System.Boolean
---`Getter NonPublic Instance Virtual`
---@field AllowOutsideSubmarine System.Boolean
---`Getter NonPublic Instance Virtual`
---@field AllowInAnySub System.Boolean
---`Getter Private Instance`
---@field AllowCoolDown System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field Enemy Barotrauma.Character
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Weapon Barotrauma.Item
---`Getter Private Instance`
---@field WeaponComponent Barotrauma.Items.Components.ItemComponent
---`Getter NonPublic Instance Virtual`
---@field ConcurrentObjectives System.Boolean
---`Getter Public Instance Virtual`
---@field AbandonWhenCannotCompleteSubObjectives System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field ArrestHoldFireTime System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field Mode Barotrauma.AIObjectiveCombat.CombatMode
---`Getter Private Instance`
---@field IsOffensiveOrArrest System.Boolean
---`Getter Private Instance`
---@field TargetEliminated System.Boolean
---`Getter Private Instance`
---@field IsEnemyDisabled System.Boolean
---`Getter Private Instance`
---@field AimSpeed System.Single
---`Getter Private Instance`
---@field AimAccuracy System.Single
---`Getter Private Instance`
---@field BlockedDistance System.Single
---`Getter Private Instance`
---@field ShouldUnequipWeapon System.Boolean
_G['AIObjectiveCombat'] = {}

---`Method Private Instance`
---@param margin System.Single
---@return System.Boolean
_G['AIObjectiveCombat'].IsEnemyClose = function(margin) end

---`Method NonPublic Instance Virtual`
---@return System.Single
_G['AIObjectiveCombat'].GetPriority = function() end

---`Method Public Instance Virtual`
---@param deltaTime System.Single
_G['AIObjectiveCombat'].Update = function(deltaTime) end

---`Method NonPublic Instance Virtual`
---@return System.Boolean
_G['AIObjectiveCombat'].CheckObjectiveState = function() end

---`Method NonPublic Instance Virtual`
---@param deltaTime System.Single
_G['AIObjectiveCombat'].Act = function(deltaTime) end

---`Method Private Instance`
---@param deltaTime System.Single
_G['AIObjectiveCombat'].Move = function(deltaTime) end

---`Method Private Instance`
---@return System.Boolean
_G['AIObjectiveCombat'].TryArm = function() end

---`Method Private Instance`
---@param deltaTime System.Single
_G['AIObjectiveCombat'].OperateWeapon = function(deltaTime) end

---`Method Private Instance`
---@param weaponComponent Barotrauma.Items.Components.ItemComponent-ref
---@return Barotrauma.Item
_G['AIObjectiveCombat'].FindWeapon = function(weaponComponent) end

---`Method Private Static`
---@param item Barotrauma.Item
---@return Barotrauma.Items.Components.ItemComponent
_G['AIObjectiveCombat'].GetWeaponComponent = function(item) end

---`Method Private Instance`
---@param weapon Barotrauma.Items.Components.ItemComponent
---@param prioritizeMelee System.Boolean
---@param canSeekAmmo System.Boolean
---@param lethalDmg System.Single-ref
---@return System.Single
_G['AIObjectiveCombat'].GetWeaponPriority = function(weapon, prioritizeMelee, canSeekAmmo, lethalDmg) end

---`Method Private Instance`
---@param weapon Barotrauma.Items.Components.ItemComponent
---@param attack Barotrauma.Attack
---@return System.Single
_G['AIObjectiveCombat'].ApproximateStunDamage = function(weapon, attack) end

---`Method Private Static`
---@param weapon Barotrauma.Items.Components.ItemComponent
---@return System.Boolean
_G['AIObjectiveCombat'].CanMeleeStunnerStun = function(weapon) end

---`Method Private Instance`
---@param weaponList (System.Collections.Generic.IEnumerable*1Barotrauma*Items*Components*ItemComponent)|(fun():(Barotrauma.Items.Components.ItemComponent))
---@param weaponComponent Barotrauma.Items.Components.ItemComponent-ref
---@return Barotrauma.Item
_G['AIObjectiveCombat'].GetWeapon = function(weaponList, weaponComponent) end

---`Method Public Static`
---@param weapon Barotrauma.Items.Components.ItemComponent
---@return System.Single
_G['AIObjectiveCombat'].GetLethalDamage = function(weapon) end

---`Method Private Static`
---@param weapon Barotrauma.Items.Components.ItemComponent
---@return Barotrauma.Attack
_G['AIObjectiveCombat'].GetAttackDefinition = function(weapon) end

---`Method Private Instance`
---@return (System.Collections.Generic.HashSet*1Barotrauma*Items*Components*ItemComponent)|(Barotrauma.Items.Components.ItemComponent[])
_G['AIObjectiveCombat'].FindWeaponsFromInventory = function() end

---`Method Private Instance`
---@param item Barotrauma.Item
---@param weaponList (System.Collections.Generic.ICollection*1Barotrauma*Items*Components*ItemComponent)|(fun():(Barotrauma.Items.Components.ItemComponent))
_G['AIObjectiveCombat'].GetWeapons = function(item, weaponList) end

---`Method Private Instance`
_G['AIObjectiveCombat'].UnequipWeapon = function() end

---`Method Private Instance`
---@return System.Boolean
_G['AIObjectiveCombat'].Equip = function() end

---`Method Private Instance`
---@param deltaTime System.Single
_G['AIObjectiveCombat'].Retreat = function(deltaTime) end

---`Method Private Instance`
---@param deltaTime System.Single
_G['AIObjectiveCombat'].Engage = function(deltaTime) end

---`Method Private Instance`
_G['AIObjectiveCombat'].RemoveFollowTarget = function() end

---`Method Private Instance`
_G['AIObjectiveCombat'].OnArrestTargetReached = function() end

---`Method Private Instance`
---@param ammunitionIdentifiers (System.Collections.Immutable.ImmutableHashSet*1Barotrauma*Identifier)|(Barotrauma.Identifier[])
_G['AIObjectiveCombat'].SeekAmmunition = function(ammunitionIdentifiers) end

---`Method Private Instance`
---@param seekAmmo System.Boolean
---@return System.Boolean
_G['AIObjectiveCombat'].Reload = function(seekAmmo) end

---`Method Private Instance`
---@param deltaTime System.Single
_G['AIObjectiveCombat'].Attack = function(deltaTime) end

---`Method Private Instance`
---@param deltaTime System.Single
_G['AIObjectiveCombat'].UseWeapon = function(deltaTime) end

---`Method Private Instance`
---@param weaponComponent Barotrauma.Items.Components.ItemComponent
---@return System.Single
_G['AIObjectiveCombat'].GetReloadTime = function(weaponComponent) end

---`Method Private Instance`
---@param weaponComponent Barotrauma.Items.Components.ItemComponent
_G['AIObjectiveCombat'].SetReloadTime = function(weaponComponent) end

---`Method Private Instance`
_G['AIObjectiveCombat'].ClearInputs = function() end

---`Method NonPublic Instance Virtual`
_G['AIObjectiveCombat'].OnCompleted = function() end

---`Method NonPublic Instance Virtual`
_G['AIObjectiveCombat'].OnAbandon = function() end

---`Method Public Instance Virtual`
_G['AIObjectiveCombat'].OnDeselected = function() end

---`Method Public Instance Virtual`
_G['AIObjectiveCombat'].Reset = function() end

---`Method Private Instance`
_G['AIObjectiveCombat'].SpeakNoWeapons = function() end

---`Method Private Instance`
---@param textIdentifier Barotrauma.Identifier
---@param delay System.Single
---@param minDurationBetweenSimilar System.Single
_G['AIObjectiveCombat'].PlayerCrewSpeak = function(textIdentifier, delay, minDurationBetweenSimilar) end

---`Method Private Instance`
---@param textIdentifier Barotrauma.Identifier
---@param delay System.Single
---@param minDurationBetweenSimilar System.Single
_G['AIObjectiveCombat'].FriendlyGuardSpeak = function(textIdentifier, delay, minDurationBetweenSimilar) end

---`Method Private Instance`
---@param textIdentifier Barotrauma.Identifier
---@param delay System.Single
---@param minDurationBetweenSimilar System.Single
_G['AIObjectiveCombat'].Speak = function(textIdentifier, delay, minDurationBetweenSimilar) end

---`Method Private Instance`
---@param newTimer System.Single
_G['AIObjectiveCombat'].SetAimTimer = function(newTimer) end

---`Constructor Public Instance`
---@param character Barotrauma.Character
---@param enemy Barotrauma.Character
---@param mode Barotrauma.AIObjectiveCombat.CombatMode
---@param objectiveManager Barotrauma.AIObjectiveManager
---@param priorityModifier? System.Single
---@param coolDown? System.Single
---@return Barotrauma.AIObjectiveCombat
_G['AIObjectiveCombat'] = function(character, enemy, mode, objectiveManager, priorityModifier, coolDown) end

---`Constructor Public Instance`
---@param character Barotrauma.Character
---@param enemy Barotrauma.Character
---@param mode Barotrauma.AIObjectiveCombat.CombatMode
---@param objectiveManager Barotrauma.AIObjectiveManager
---@param priorityModifier? System.Single
---@param coolDown? System.Single
---@return Barotrauma.AIObjectiveCombat
_G['AIObjectiveCombat'].__new = function(character, enemy, mode, objectiveManager, priorityModifier, coolDown) end

