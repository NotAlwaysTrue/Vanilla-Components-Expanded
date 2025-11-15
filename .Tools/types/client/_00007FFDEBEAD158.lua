---@meta
---@class Barotrauma.Character : Barotrauma.Entity
---`Field NonPublic Instance`
---@field soundTimer System.Single
---`Field NonPublic Instance`
---@field hudInfoTimer System.Single
---`Field NonPublic Instance`
---@field hudInfoVisible System.Boolean
---`Field Private Instance`
---@field findFocusedTimer System.Single
---`Field NonPublic Instance`
---@field lastRecvPositionUpdateTime System.Single
---`Field Private Instance`
---@field hudInfoHeight System.Single
---`Field Private Instance`
---@field sounds (System.Collections.Generic.List*1Barotrauma*CharacterSound)|(Barotrauma.CharacterSound[])
---`Field Public Instance`
---@field ExternalHighlight System.Boolean
---`Field Private Instance`
---@field hudProgressBars (System.Collections.Generic.Dictionary*1System*Object*1Barotrauma*HUDProgressBar)|({[System.Object]:(Barotrauma.HUDProgressBar)})
---`Field Private Instance`
---@field progressBarRemovals (System.Collections.Generic.List*1System*Collections*Generic*KeyValuePair*2System*Object*2Barotrauma*HUDProgressBar)|(System.Collections.Generic.KeyValuePair*1System*Object*1Barotrauma*HUDProgressBar[])
---`Field Private Instance`
---@field blurStrength System.Single
---`Field Private Instance`
---@field distortStrength System.Single
---`Field Private Instance`
---@field radialDistortStrength System.Single
---`Field Private Instance`
---@field chromaticAberrationStrength System.Single
---`Field Private Instance`
---@field grainStrength System.Single
---`Field Private Instance`
---@field bloodEmitters (System.Collections.Generic.List*1Barotrauma*Particles*ParticleEmitter)|(Barotrauma.Particles.ParticleEmitter[])
---`Field Private Instance`
---@field damageEmitters (System.Collections.Generic.List*1Barotrauma*Particles*ParticleEmitter)|(Barotrauma.Particles.ParticleEmitter[])
---`Field Private Instance`
---@field gibEmitters (System.Collections.Generic.List*1Barotrauma*Particles*ParticleEmitter)|(Barotrauma.Particles.ParticleEmitter[])
---`Field Private Instance`
---@field guiMessages (System.Collections.Generic.List*1Barotrauma*Character*GUIMessage)|(Barotrauma.Character.GUIMessage[])
---`Field Private Instance`
---@field activeObjectiveEntities (System.Collections.Generic.List*1Barotrauma*Character*ObjectiveEntity)|(Barotrauma.Character.ObjectiveEntity[])
---`Field Private Instance`
---@field textlessSpeechBubble Barotrauma.Character.SpeechBubble
---`Field Private Instance`
---@field pressureEffectTimer System.Single
---`Field Private Instance`
---@field previousInteractablesInRange (System.Collections.Generic.List*1Barotrauma*Item)|(Barotrauma.Item[])
---`Field Private Instance`
---@field interactablesInRange (System.Collections.Generic.List*1Barotrauma*Item)|(Barotrauma.Item[])
---`Field Private Instance`
---@field wasFiring System.Boolean
---`Field Private Instance`
---@field debugInteractablesInRange (System.Collections.Generic.List*1Barotrauma*Item)|(Barotrauma.Item[])
---`Field Private Instance`
---@field debugInteractablesAtCursor (System.Collections.Generic.List*1Barotrauma*Item)|(Barotrauma.Item[])
---`Field Private Instance`
---@field debugInteractablesNearCursor (System.Collections.Generic.List*1System*ValueTuple*2Barotrauma*Item*2System*Single)|(System.ValueTuple*1Barotrauma*Item*1System*Single[])
---`Field Private Instance`
---@field matchingSounds (System.Collections.Generic.List*1Barotrauma*CharacterSound)|(Barotrauma.CharacterSound[])
---`Field Private Instance`
---@field soundChannel Barotrauma.Sounds.SoundChannel
---`Field Private Instance`
---@field enabled System.Boolean
---`Field Private Instance`
---@field disabledByEvent System.Boolean
---`Field Public Instance`
---@field PreviousHull Barotrauma.Hull
---`Field Public Instance`
---@field CurrentHull Barotrauma.Hull
---`Field Public Instance`
---@field Properties (System.Collections.Generic.Dictionary*1Barotrauma*Identifier*1Barotrauma*SerializableProperty)|({[Barotrauma.Identifier]:(Barotrauma.SerializableProperty)})
---`Field NonPublic Instance`
---@field keys (Barotrauma.Key-arr)|(Barotrauma.Key[])
---`Field Private Instance`
---@field humanPrefab Barotrauma.HumanPrefab
---`Field Private Instance`
---@field faction System.Nullable*1Barotrauma*Identifier
---`Field Private Instance`
---@field teamID Barotrauma.CharacterTeamType
---`Field Private Instance`
---@field originalTeamID System.Nullable*1Barotrauma*CharacterTeamType
---`Field Private Instance`
---@field wallet Barotrauma.Wallet
---`Field Public Instance`
---@field Latchers (System.Collections.Generic.HashSet*1Barotrauma*LatchOntoAI)|(Barotrauma.LatchOntoAI[])
---`Field Public Instance`
---@field AttachedProjectiles (System.Collections.Generic.HashSet*1Barotrauma*Items*Components*Projectile)|(Barotrauma.Items.Components.Projectile[])
---`Field NonPublic Instance`
---@field activeTeamChanges (System.Collections.Generic.Dictionary*1System*String*1Barotrauma*ActiveTeamChange)|({[System.String]:(Barotrauma.ActiveTeamChange)})
---`Field NonPublic Instance`
---@field currentTeamChange Barotrauma.ActiveTeamChange
---`Field Public Instance`
---@field IsCriminal System.Boolean
---`Field Public Instance`
---@field IsActingOffensively System.Boolean
---`Field Public Instance`
---@field IsHostileEscortee System.Boolean
---`Field Public Instance`
---@field CombatAction Barotrauma.CombatAction
---`Field Public Instance`
---@field AnimController Barotrauma.AnimController
---`Field Private Instance`
---@field cursorPosition Microsoft.Xna.Framework.Vector2
---`Field NonPublic Instance`
---@field oxygenAvailable System.Single
---`Field Public Instance`
---@field Seed System.String
---`Field NonPublic Instance`
---@field focusedItem Barotrauma.Item
---`Field Private Instance`
---@field selectedCharacter Barotrauma.Character
---`Field Private Instance`
---@field selectedBy Barotrauma.Character
---`Field Private Instance`
---@field lastAttackers (System.Collections.Generic.List*1Barotrauma*Character*Attacker)|(Barotrauma.Character.Attacker[])
---`Field Public Instance`
---@field LastDamageSource Barotrauma.Entity
---`Field Public Instance`
---@field LastDamage Barotrauma.AttackResult
---`Field Private Instance`
---@field itemSelectedDurations (System.Collections.Generic.Dictionary*1Barotrauma*ItemPrefab*1System*Double)|({[Barotrauma.ItemPrefab]:(System.Double)})
---`Field Private Instance`
---@field itemSelectedTime System.Double
---`Field Public Instance`
---@field Prefab Barotrauma.CharacterPrefab
---`Field Public Instance`
---@field Params Barotrauma.CharacterParams
---`Field Public Instance`
---@field TraitorCurrentObjective Barotrauma.LocalizedString
---`Field Private Instance`
---@field attackCoolDown System.Single
---`Field Private Instance`
---@field statusEffects (System.Collections.Generic.Dictionary*1Barotrauma*ActionType*1System*Collections*Generic*List*2Barotrauma*StatusEffect)|({[Barotrauma.ActionType]:((System.Collections.Generic.List*1Barotrauma*StatusEffect)|(Barotrauma.StatusEffect[]))})
---`Field Private Instance`
---@field info Barotrauma.CharacterInfo
---`Field Private Instance`
---@field hideFaceTimer System.Single
---`Field Private Instance`
---@field onCustomInteract (System.Action*1Barotrauma*Character*1Barotrauma*Character)|(fun(arg1:Barotrauma.Character, arg2:Barotrauma.Character))
---`Field Public Instance`
---@field ActiveConversation Barotrauma.ConversationAction
---`Field Public Instance`
---@field RequireConsciousnessForCustomInteract System.Boolean
---`Field Private Instance`
---@field lockHandsTimer System.Single
---`Field Private Instance`
---@field lowPassMultiplier System.Single
---`Field Private Instance`
---@field obstructVisionAmount System.Single
---`Field Private Instance`
---@field pressureProtectionLastSet System.Double
---`Field Private Instance`
---@field pressureProtection System.Single
---`Field Public Instance`
---@field KnockbackCooldownTimer System.Single
---`Field Private Instance`
---@field ragdollingLockTimer System.Single
---`Field Public Instance`
---@field IsRagdolled System.Boolean
---`Field Public Instance`
---@field IsForceRagdolled System.Boolean
---`Field Public Instance`
---@field FollowCursor System.Boolean
---`Field Public Instance`
---@field DisableHealthWindow System.Boolean
---`Field Private Instance`
---@field speechImpedimentSet System.Boolean
---`Field Private Instance`
---@field speechImpediment System.Single
---`Field Private Instance`
---@field textChatVolume System.Single
---`Field Private Instance`
---@field _selectedItem Barotrauma.Item
---`Field Private Instance`
---@field isDead System.Boolean
---`Field Public Instance`
---@field GodMode System.Boolean
---`Field Public Instance`
---@field CampaignInteractionType Barotrauma.CampaignMode.InteractionType
---`Field Public Instance`
---@field MerchantIdentifier Barotrauma.Identifier
---`Field Private Instance`
---@field accessRemovedCharacterErrorShown System.Boolean
---`Field Public Instance`
---@field MarkedAsLooted (System.Collections.Generic.HashSet*1Barotrauma*Identifier)|(Barotrauma.Identifier[])
---`Field Public Instance`
---@field OnDeath (Barotrauma.Character.OnDeathHandler)|(fun(character:Barotrauma.Character, causeOfDeath:Barotrauma.CauseOfDeath))
---`Field Public Instance`
---@field OnAttacked (Barotrauma.Character.OnAttackedHandler)|(fun(attacker:Barotrauma.Character, attackResult:Barotrauma.AttackResult))
---`Field Private Instance`
---@field disableRunningLastSet System.Double
---`Field Public Instance`
---@field ToggleRun System.Boolean
---`Field Private Instance`
---@field greatestNegativeSpeedMultiplier System.Single
---`Field Private Instance`
---@field greatestPositiveSpeedMultiplier System.Single
---`Field Private Instance`
---@field propulsionSpeedMultiplierLastSet System.Double
---`Field Private Instance`
---@field propulsionSpeedMultiplier System.Single
---`Field Private Instance`
---@field greatestNegativeHealthMultiplier System.Single
---`Field Private Instance`
---@field greatestPositiveHealthMultiplier System.Single
---`Field Private Instance`
---@field currentAttackTarget Barotrauma.Character.AttackTargetData
---`Field Private Instance`
---@field sw System.Diagnostics.Stopwatch
---`Field Private Instance`
---@field _selectedItemPriority System.Single
---`Field Private Instance`
---@field _foundItem Barotrauma.Item
---`Field Private Instance`
---@field despawnTimer System.Single
---`Field Private Instance`
---@field maxAIRange System.Single
---`Field Private Instance`
---@field aiTargetChangeSpeed System.Single
---`Field Private Instance`
---@field aiChatMessageQueue (System.Collections.Generic.List*1Barotrauma*AIChatMessage)|(Barotrauma.AIChatMessage[])
---`Field Private Instance`
---@field prevAiChatMessages (System.Collections.Generic.Dictionary*1Barotrauma*Identifier*1System*Single)|({[Barotrauma.Identifier]:(System.Single)})
---`Field Private Instance`
---@field targets (System.Collections.Generic.List*1Barotrauma*ISerializableEntity)|(Barotrauma.ISerializableEntity[])
---`Field Private Instance`
---@field currentContexts (System.Collections.Generic.HashSet*1Barotrauma*AttackContext)|(Barotrauma.AttackContext[])
---`Field Private Instance`
---@field visibleHulls (System.Collections.Generic.List*1Barotrauma*Hull)|(Barotrauma.Hull[])
---`Field Private Instance`
---@field tempList (System.Collections.Generic.HashSet*1Barotrauma*Hull)|(Barotrauma.Hull[])
---`Field Private Instance`
---@field characterTalents (System.Collections.Generic.List*1Barotrauma*CharacterTalent)|(Barotrauma.CharacterTalent[])
---`Field Private Instance`
---@field sameRoomHulls (System.Collections.Generic.HashSet*1Barotrauma*Hull)|(Barotrauma.Hull[])
---`Field Private Instance`
---@field statValues (System.Collections.Generic.Dictionary*1Barotrauma*StatTypes*1System*Single)|({[Barotrauma.StatTypes]:(System.Single)})
---`Field Private Instance`
---@field wearableStatValues (System.Collections.Generic.Dictionary*1Barotrauma*StatTypes*1System*Single)|({[Barotrauma.StatTypes]:(System.Single)})
---`Field Private Instance`
---@field wearableSkillModifiers (System.Collections.Generic.Dictionary*1Barotrauma*Identifier*1System*Single)|({[Barotrauma.Identifier]:(System.Single)})
---`Field Private Instance`
---@field abilityFlags Barotrauma.AbilityFlags
---`Field Private Instance`
---@field abilityResistances (System.Collections.Generic.Dictionary*1Barotrauma*TalentResistanceIdentifier*1System*Single)|({[Barotrauma.TalentResistanceIdentifier]:(System.Single)})
---`Field Private Instance`
---@field dequeuedInput Barotrauma.Character.InputNetFlags
---`Field Private Instance`
---@field prevDequeuedInput Barotrauma.Character.InputNetFlags
---`Field Public Instance`
---@field LastNetworkUpdateID System.UInt16
---`Field Public Instance`
---@field LastProcessedID System.UInt16
---`Field Private Instance`
---@field memInput (System.Collections.Generic.List*1Barotrauma*Character*NetInputMem)|(Barotrauma.Character.NetInputMem[])
---`Field Private Instance`
---@field memState (System.Collections.Generic.List*1Barotrauma*CharacterStateInfo)|(Barotrauma.CharacterStateInfo[])
---`Field Private Instance`
---@field memLocalState (System.Collections.Generic.List*1Barotrauma*CharacterStateInfo)|(Barotrauma.CharacterStateInfo[])
---`Field Public Instance`
---@field healthUpdateTimer System.Single
---`Field Private Instance`
---@field healthUpdateInterval System.Single
---`Field Public Instance`
---@field isSynced System.Boolean
---`Field Public Static`
---@field DisableControls System.Boolean
---`Field Public Static`
---@field DebugDrawInteract System.Boolean
---`Field Private Static`
---@field controlled Barotrauma.Character
---`Field Private Static`
---@field speechBubbles (System.Collections.Generic.List*1Barotrauma*Character*SpeechBubble)|(Barotrauma.Character.SpeechBubble[])
---`Field Public Static`
---@field CharacterList (System.Collections.Generic.List*1Barotrauma*Character)|(Barotrauma.Character[])
---`Field Public Static`
---@field CharacterUpdateInterval System.Int32
---`Field Private Static`
---@field characterUpdateTick System.Int32
---`Field Private Static`
---@field overrideStatTypes (System.Collections.Immutable.ImmutableDictionary*1Barotrauma*Identifier*1Barotrauma*StatTypes)|({[Barotrauma.Identifier]:(Barotrauma.StatTypes)})
---`Field Private Static`
---@field DefaultHudInfoHeight System.Single
---`Field Public Static`
---@field MaxHighlightDistance System.Single
---`Field Public Static`
---@field MaxDragDistance System.Single
---`Field Private Static`
---@field OriginalChangeTeamIdentifier System.String
---`Field Private Static`
---@field maxLastAttackerCount System.Int32
---`Field Public Static`
---@field KnockbackCooldown System.Single
---`Field Private Static`
---@field cursorFollowMargin System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field IsVisible System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field ShowInteractionLabels System.Boolean
---`Getter Public Static`
---<br/>`Setter Public Static`
---@field Controlled Barotrauma.Character
---`Getter Public Instance`
---@field HUDProgressBars (System.Collections.Generic.Dictionary*1System*Object*1Barotrauma*HUDProgressBar)|({[System.Object]:(Barotrauma.HUDProgressBar)})
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field BlurStrength System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field DistortStrength System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field RadialDistortStrength System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field ChromaticAberrationStrength System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field GrainColor Microsoft.Xna.Framework.Color
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field GrainStrength System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field CollapseEffectStrength System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field CameraShake System.Single
---`Getter Public Instance`
---@field BloodEmitters (System.Collections.Generic.IEnumerable*1Barotrauma*Particles*ParticleEmitter)|(fun():(Barotrauma.Particles.ParticleEmitter))
---`Getter Public Instance`
---@field DamageEmitters (System.Collections.Generic.IEnumerable*1Barotrauma*Particles*ParticleEmitter)|(fun():(Barotrauma.Particles.ParticleEmitter))
---`Getter Public Instance`
---@field GibEmitters (System.Collections.Generic.IEnumerable*1Barotrauma*Particles*ParticleEmitter)|(fun():(Barotrauma.Particles.ParticleEmitter))
---`Getter Public Static`
---@field IsMouseOnUI System.Boolean
---`Getter Public Instance`
---@field ActiveObjectiveEntities (System.Collections.Generic.IEnumerable*1Barotrauma*Character*ObjectiveEntity)|(fun():(Barotrauma.Character.ObjectiveEntity))
---`Getter Public Instance Virtual`
---@field ContentPackage Barotrauma.ContentPackage
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Enabled System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field DisabledByEvent System.Boolean
---`Getter Public Instance`
---@field IsRemotelyControlled System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field IsRemotePlayer System.Boolean
---`Getter Public Instance`
---@field IsLocalPlayer System.Boolean
---`Getter Public Instance`
---@field IsPlayer System.Boolean
---`Getter Public Instance`
---@field IsCommanding System.Boolean
---`Getter Public Instance`
---@field IsBot System.Boolean
---`Getter Public Instance`
---@field IsAIControlled System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field IsEscorted System.Boolean
---`Getter Public Instance`
---@field JobIdentifier Barotrauma.Identifier
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field DoesBleed System.Boolean
---`Getter Public Instance Virtual`
---@field SerializableProperties (System.Collections.Generic.Dictionary*1Barotrauma*Identifier*1Barotrauma*SerializableProperty)|({[Barotrauma.Identifier]:(Barotrauma.SerializableProperty)})
---`Getter Public Instance`
---@field Keys (Barotrauma.Key-arr)|(Barotrauma.Key[])
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field HumanPrefab Barotrauma.HumanPrefab
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Faction Barotrauma.Identifier
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field TeamID Barotrauma.CharacterTeamType
---`Getter Public Instance`
---@field OriginalTeamID Barotrauma.CharacterTeamType
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Wallet Barotrauma.Wallet
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field AllowPlayDead System.Boolean
---`Getter Public Instance`
---@field IsOnPlayerTeam System.Boolean
---`Getter Public Instance`
---@field IsOriginallyOnPlayerTeam System.Boolean
---`Getter Public Instance`
---@field IsFriendlyNPCTurnedHostile System.Boolean
---`Getter Public Instance`
---@field IsInstigator System.Boolean
---`Getter Public Instance`
---@field LastAttackers (System.Collections.Generic.IEnumerable*1Barotrauma*Character*Attacker)|(fun():(Barotrauma.Character.Attacker))
---`Getter Public Instance`
---@field LastAttacker Barotrauma.Character
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field LastOrderedCharacter Barotrauma.Character
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field SecondLastOrderedCharacter Barotrauma.Character
---`Getter Public Instance`
---@field ItemSelectedDurations (System.Collections.Generic.Dictionary*1Barotrauma*ItemPrefab*1System*Double)|({[Barotrauma.ItemPrefab]:(System.Double)})
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field InvisibleTimer System.Single
---`Getter Public Instance`
---@field SpeciesName Barotrauma.Identifier
---`Getter Public Instance`
---@field Group Barotrauma.Identifier
---`Getter Public Instance`
---@field IsHumanoid System.Boolean
---`Getter Public Instance`
---@field IsMachine System.Boolean
---`Getter Public Instance`
---@field IsHusk System.Boolean
---`Getter Public Instance`
---@field IsDisguisedAsHusk System.Boolean
---`Getter Public Instance`
---@field IsHuskInfected System.Boolean
---`Getter Public Instance`
---@field IsMale System.Boolean
---`Getter Public Instance`
---@field IsFemale System.Boolean
---`Getter Public Instance`
---@field BloodDecalName System.String
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field CanSpeak System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field NeedsAir System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field NeedsWater System.Boolean
---`Getter Public Instance`
---@field NeedsOxygen System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Noise System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Visibility System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field MaxPerceptionDistance System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field IsTraitor System.Boolean
---`Getter Public Instance`
---@field IsHuman System.Boolean
---`Getter Public Instance`
---@field CurrentOrders (System.Collections.Generic.List*1Barotrauma*Order)|(Barotrauma.Order[])
---`Getter Public Instance`
---@field IsDismissed System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field ViewTarget Barotrauma.Entity
---`Getter Public Instance`
---@field AimRefPosition Microsoft.Xna.Framework.Vector2
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Info Barotrauma.CharacterInfo
---`Getter Public Instance`
---@field VariantOf Barotrauma.Identifier
---`Getter Public Instance Virtual`
---@field Name System.String
---`Getter Public Instance`
---@field DisplayName System.String
---`Getter Public Instance`
---@field LogName System.String
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field HideFace System.Boolean
---`Getter Public Instance`
---@field ConfigPath System.String
---`Getter Public Instance`
---@field Mass System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field Inventory Barotrauma.CharacterInventory
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field DisableInteract System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field DisableFocusingOnEntities System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field CustomInteractHUDText Barotrauma.LocalizedString
---`Getter Public Instance`
---@field AllowCustomInteract System.Boolean
---`Getter Public Instance`
---@field ShouldShowCustomInteractText System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field LockHands System.Boolean
---`Getter Public Instance`
---@field AllowInput System.Boolean
---`Getter Public Instance`
---@field CanMove System.Boolean
---`Getter Public Instance`
---@field CanInteract System.Boolean
---`Getter Public Instance`
---@field CanEat System.Boolean
---`Getter Public Instance`
---@field CanClimb System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field CursorPosition Microsoft.Xna.Framework.Vector2
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field SmoothedCursorPosition Microsoft.Xna.Framework.Vector2
---`Getter Public Instance`
---@field CursorWorldPosition Microsoft.Xna.Framework.Vector2
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field FocusedCharacter Barotrauma.Character
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field SelectedCharacter Barotrauma.Character
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field SelectedBy Barotrauma.Character
---`Getter Public Instance`
---@field HeldItems (System.Collections.Generic.IEnumerable*1Barotrauma*Item)|(fun():(Barotrauma.Item))
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field LowPassMultiplier System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field ObstructVisionAmount System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field ObstructVision System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field PressureProtection System.Single
---`Getter Public Instance`
---@field InPressure System.Boolean
---`Getter Public Instance`
---@field Anim Barotrauma.AnimController.Animation
---`Getter Public Instance`
---@field IsIncapacitated System.Boolean
---`Getter Public Instance`
---@field IsUnconscious System.Boolean
---`Getter Public Instance`
---@field IsHandcuffed System.Boolean
---`Getter Public Instance`
---@field IsPet System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Oxygen System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field OxygenAvailable System.Single
---`Getter Public Instance`
---@field HullOxygenPercentage System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field UseHullOxygen System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Stun System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field CharacterHealth Barotrauma.CharacterHealth
---`Getter Public Instance`
---@field Vitality System.Single
---`Getter Public Instance Virtual`
---@field Health System.Single
---`Getter Public Instance`
---@field HealthPercentage System.Single
---`Getter Public Instance`
---@field MaxVitality System.Single
---`Getter Public Instance`
---@field MaxHealth System.Single
---`Getter Public Instance`
---@field WasFullHealth System.Boolean
---`Getter Public Instance`
---@field AIState Barotrauma.AIState
---`Getter Public Instance`
---@field IsLatched System.Boolean
---`Getter Public Instance`
---@field EmpVulnerability System.Single
---`Getter Public Instance`
---@field PoisonVulnerability System.Single
---`Getter Public Instance`
---@field IsFlipped System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Bloodloss System.Single
---`Getter Public Instance`
---@field Bleeding System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field SpeechImpediment System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field TextChatVolume System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field PressureTimer System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field DisableImpactDamageTimer System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field IgnoreMeleeWeapons System.Boolean
---`Getter Public Instance`
---@field CurrentSpeed System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field SelectedItem Barotrauma.Item
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field SelectedSecondaryItem Barotrauma.Item
---`Getter Public Instance`
---@field HasSelectedAnyItem System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field FocusedItem Barotrauma.Item
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field PickingItem Barotrauma.Item
---`Getter Public Instance Virtual`
---@field AIController Barotrauma.AIController
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field IsDead System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field EnableDespawn System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field CauseOfDeath Barotrauma.CauseOfDeath
---`Getter Public Instance`
---@field CauseOfDeathType Barotrauma.CauseOfDeathType
---`Getter Public Instance`
---@field CanBeSelected System.Boolean
---`Getter Public Instance`
---@field IsDraggable System.Boolean
---`Getter Public Instance`
---@field CanAim System.Boolean
---`Getter Public Instance`
---@field InWater System.Boolean
---`Getter Public Instance`
---@field IsLowInOxygen System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Unkillable System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field UseHealthWindow System.Boolean
---`Getter Public Instance Virtual`
---@field SimPosition Microsoft.Xna.Framework.Vector2
---`Getter Public Instance Virtual`
---@field Position Microsoft.Xna.Framework.Vector2
---`Getter Public Instance Virtual`
---@field DrawPosition Microsoft.Xna.Framework.Vector2
---`Getter Public Instance`
---@field IsInFriendlySub System.Boolean
---`Getter Public Instance`
---@field IsInPlayerSub System.Boolean
---`Getter Public Instance`
---@field InPlayerSubmarine System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field AITurretPriority System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field OverrideMovement System.Nullable*1Microsoft*Xna*Framework*Vector2
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field ForceRun System.Boolean
---`Getter Public Instance`
---@field IsClimbing System.Boolean
---`Getter Public Instance`
---@field CanRun System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field DisableRunning System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field SpeedMultiplier System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field PropulsionSpeedMultiplier System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field HealthMultiplier System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field HumanPrefabHealthMultiplier System.Single
---`Getter Private Instance`
---@field StopWatch System.Diagnostics.Stopwatch
---`Getter Public Instance`
---@field IsKnockedDownOrRagdolled System.Boolean
---`Getter Public Instance`
---@field IsKnockedDown System.Boolean
---`Getter Public Instance`
---@field IsCaptain System.Boolean
---`Getter Public Instance`
---@field IsEngineer System.Boolean
---`Getter Public Instance`
---@field IsMechanic System.Boolean
---`Getter Public Instance`
---@field IsMedic System.Boolean
---`Getter Public Instance`
---@field IsSecurity System.Boolean
---`Getter Public Instance`
---@field IsAssistant System.Boolean
---`Getter Public Instance`
---@field IsWatchman System.Boolean
---`Getter Public Instance`
---@field IsVip System.Boolean
---`Getter Public Instance`
---@field IsPrisoner System.Boolean
---`Getter Public Instance`
---@field IsKiller System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field UniqueNameColor System.Nullable*1Microsoft*Xna*Framework*Color
---`Getter Public Instance`
---@field IsProtectedFromPressure System.Boolean
---`Getter Public Instance`
---@field IsImmuneToPressure System.Boolean
---`Getter Public Instance`
---@field CharacterTalents (System.Collections.Generic.IReadOnlyCollection*1Barotrauma*CharacterTalent)|(fun():(Barotrauma.CharacterTalent))
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field HealthUpdateInterval System.Single
---`Getter Public Instance`
---@field MemState (System.Collections.Generic.List*1Barotrauma*CharacterStateInfo)|(Barotrauma.CharacterStateInfo[])
---`Getter Public Instance`
---@field MemLocalState (System.Collections.Generic.List*1Barotrauma*CharacterStateInfo)|(Barotrauma.CharacterStateInfo[])
_G['Character'] = {}

---`Method Public Instance`
---@param deltaTime System.Single
---@param cam Barotrauma.Camera
---@param moveCam? System.Boolean
_G['Character'].ControlLocalPlayer = function(deltaTime, cam, moveCam) end

---`Method Public Instance`
---@param cam Barotrauma.Camera
_G['Character'].UpdateLocalCursor = function(cam) end

---`Method Public Instance`
---@param input Barotrauma.InputType
_G['Character'].EmulateInput = function(input) end

---`Method Private Instance`
_G['Character'].UpdateInteractablesInRange = function() end

---`Method Public Instance`
---@param itemCollection (System.Collections.Generic.List*1Barotrauma*Item)|(Barotrauma.Item[])
---@param simPosition Microsoft.Xna.Framework.Vector2
---@param aimAssistModifier? System.Single
---@return Barotrauma.Item
_G['Character'].FindClosestItem = function(itemCollection, simPosition, aimAssistModifier) end

---`Method Private Instance`
---@param mouseSimPos Microsoft.Xna.Framework.Vector2
---@param maxDist? System.Single
---@return Barotrauma.Character
_G['Character'].FindCharacterAtPosition = function(mouseSimPos, maxDist) end

---`Method Public Instance`
---@return System.Boolean
_G['Character'].ShouldLockHud = function() end

---`Method Public Static`
_G['Character'].AddAllToGUIUpdateList = function() end

---`Method Public Instance Virtual`
_G['Character'].AddToGUIUpdateList = function() end

---`Method Public Instance`
---@param cam Barotrauma.Camera
_G['Character'].DoVisibilityCheck = function(cam) end

---`Method Public Instance`
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
---@param cam Barotrauma.Camera
_G['Character'].Draw = function(spriteBatch, cam) end

---`Method Public Instance`
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
---@param cam Barotrauma.Camera
---@param drawHealth? System.Boolean
_G['Character'].DrawHUD = function(spriteBatch, cam, drawHealth) end

---`Method Public Instance`
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
---@param cam Barotrauma.Camera
_G['Character'].DrawGUIMessages = function(spriteBatch, cam) end

---`Method Public Instance Virtual`
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
---@param cam Barotrauma.Camera
_G['Character'].DrawFront = function(spriteBatch, cam) end

---`Method Public Instance`
---@param color Microsoft.Xna.Framework.Color
---@param text System.String
_G['Character'].ShowSpeechBubble = function(color, text) end

---`Method Public Instance`
---@param duration System.Single
---@param color Microsoft.Xna.Framework.Color
_G['Character'].ShowTextlessSpeechBubble = function(duration, color) end

---`Method Public Static`
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
---@param cam Barotrauma.Camera
_G['Character'].DrawSpeechBubbles = function(spriteBatch, cam) end

---`Method Public Instance`
---@return Microsoft.Xna.Framework.Color
_G['Character'].GetNameColor = function() end

---`Method Public Instance`
---@param rawText System.String
---@param color Microsoft.Xna.Framework.Color
---@param playSound System.Boolean
---@param identifier? Barotrauma.Identifier
---@param value? System.Nullable*1System*Int32
---@param lifetime? System.Single
_G['Character'].AddMessage = function(rawText, color, playSound, identifier, value, lifetime) end

---`Method Public Instance`
---@param linkedObject System.Object
---@param worldPosition Microsoft.Xna.Framework.Vector2
---@param progress System.Single
---@param emptyColor Microsoft.Xna.Framework.Color
---@param fullColor Microsoft.Xna.Framework.Color
---@param textTag? System.String
---@return Barotrauma.HUDProgressBar
_G['Character'].UpdateHUDProgressBar = function(linkedObject, worldPosition, progress, emptyColor, fullColor, textTag) end

---`Method Public Instance`
---@param soundType Barotrauma.CharacterSound.SoundType
---@param soundIntervalFactor? System.Single
---@param maxInterval? System.Single
_G['Character'].PlaySound = function(soundType, soundIntervalFactor, maxInterval) end

---`Method Public Instance`
---@param entity Barotrauma.Entity
---@param sprite Barotrauma.Sprite
---@param color? System.Nullable*1Microsoft*Xna*Framework*Color
_G['Character'].AddActiveObjectiveEntity = function(entity, sprite, color) end

---`Method Public Instance`
---@param entity Barotrauma.Entity
_G['Character'].RemoveActiveObjectiveEntity = function(entity) end

---`Method Public Instance`
---@param predicate? (System.Func*1Barotrauma*CharacterSound*1System*Boolean)|(fun(arg:Barotrauma.CharacterSound):(System.Boolean))
---@param random? System.Boolean
---@return Barotrauma.CharacterSound
_G['Character'].GetSound = function(predicate, random) end

---`Method Public Instance`
---@param segmentTableWriter Barotrauma.Networking.SegmentTableWriter
---@param msg Barotrauma.Networking.IWriteMessage
_G['Character'].ClientWriteInput = function(segmentTableWriter, msg) end

---`Method Public Instance Virtual`
---@param msg Barotrauma.Networking.IWriteMessage
---@param extraData? Barotrauma.Networking.NetEntityEvent.IData
_G['Character'].ClientEventWrite = function(msg, extraData) end

---`Method Public Instance Virtual`
---@param msg Barotrauma.Networking.IReadMessage
---@param sendingTime System.Single
_G['Character'].ClientReadPosition = function(msg, sendingTime) end

---`Method Public Instance Virtual`
---@param msg Barotrauma.Networking.IReadMessage
---@param sendingTime System.Single
_G['Character'].ClientEventRead = function(msg, sendingTime) end

---`Method Public Static`
---@param inc Barotrauma.Networking.IReadMessage
---@return Barotrauma.Character
_G['Character'].ReadSpawnData = function(inc) end

---`Method Private Instance`
---@param msg Barotrauma.Networking.IReadMessage
_G['Character'].ReadStatus = function(msg) end

---`Method Private Instance`
---@param limb Barotrauma.Limb
_G['Character'].UpdateLimbLightSource = function(limb) end

---`Method Public Instance`
---@param probability? System.Nullable*1System*Single
_G['Character'].EvaluatePlayDeadProbability = function(probability) end

---`Method Private Instance`
_G['Character'].ThrowIfAccessingWalletsInSingleplayer = function() end

---`Method Public Instance`
---@param newTeam Barotrauma.CharacterTeamType
---@param processImmediately? System.Boolean
_G['Character'].SetOriginalTeamAndChangeTeam = function(newTeam, processImmediately) end

---`Method Private Instance`
---@param newTeam Barotrauma.CharacterTeamType
_G['Character'].ChangeTeam = function(newTeam) end

---`Method Public Instance`
---@param identifier System.String
---@return System.Boolean
_G['Character'].HasTeamChange = function(identifier) end

---`Method Public Instance`
---@param identifier System.String
---@param newTeamChange Barotrauma.ActiveTeamChange
---@return System.Boolean
_G['Character'].TryAddNewTeamChange = function(identifier, newTeamChange) end

---`Method Public Instance`
---@param identifier System.String
---@return System.Boolean
_G['Character'].TryRemoveTeamChange = function(identifier) end

---`Method Public Instance`
_G['Character'].UpdateTeam = function() end

---`Method Public Instance`
---@return Barotrauma.Identifier
_G['Character'].GetBaseCharacterSpeciesName = function() end

---`Method Public Instance`
---@return System.Boolean
_G['Character'].IsDualWieldingRangedWeapons = function() end

---`Method Public Instance`
_G['Character'].ReleaseSecondaryItem = function() end

---`Method Public Instance`
---@param item Barotrauma.Item
---@return System.Boolean
_G['Character'].IsAnySelectedItem = function(item) end

---`Method Public Instance`
---@param item Barotrauma.Item
---@return System.Boolean
_G['Character'].HasSelectedAnotherSecondaryItem = function(item) end

---`Method Public Static`
---@overload fun(characterInfo:Barotrauma.CharacterInfo, position:Microsoft.Xna.Framework.Vector2, seed:System.String, id?:System.UInt16, isRemotePlayer?:System.Boolean, hasAi?:System.Boolean, ragdoll?:Barotrauma.RagdollParams, spawnInitialItems?:System.Boolean):(Barotrauma.Character)
---@overload fun(speciesName:System.String, position:Microsoft.Xna.Framework.Vector2, seed:System.String, characterInfo?:Barotrauma.CharacterInfo, id?:System.UInt16, isRemotePlayer?:System.Boolean, hasAi?:System.Boolean, createNetworkEvent?:System.Boolean, ragdoll?:Barotrauma.RagdollParams, throwErrorIfNotFound?:System.Boolean, spawnInitialItems?:System.Boolean):(Barotrauma.Character)
---@overload fun(speciesName:Barotrauma.Identifier, position:Microsoft.Xna.Framework.Vector2, seed:System.String, characterInfo?:Barotrauma.CharacterInfo, id?:System.UInt16, isRemotePlayer?:System.Boolean, hasAi?:System.Boolean, createNetworkEvent?:System.Boolean, ragdoll?:Barotrauma.RagdollParams, throwErrorIfNotFound?:System.Boolean, spawnInitialItems?:System.Boolean):(Barotrauma.Character)
---@param prefab Barotrauma.CharacterPrefab
---@param position Microsoft.Xna.Framework.Vector2
---@param seed System.String
---@param characterInfo? Barotrauma.CharacterInfo
---@param id? System.UInt16
---@param isRemotePlayer? System.Boolean
---@param hasAi? System.Boolean
---@param createNetworkEvent? System.Boolean
---@param ragdoll? Barotrauma.RagdollParams
---@param spawnInitialItems? System.Boolean
---@return Barotrauma.Character
_G['Character'].Create = function(prefab, position, seed, characterInfo, id, isRemotePlayer, hasAi, createNetworkEvent, ragdoll, spawnInitialItems) end

---`Method Private Instance`
---@param mainElement Barotrauma.ContentXElement
_G['Character'].InitProjSpecific = function(mainElement) end

---`Method Public Instance`
---@param headId? System.Nullable*1System*Int32
---@param hairIndex? System.Int32
---@param beardIndex? System.Int32
---@param moustacheIndex? System.Int32
---@param faceAttachmentIndex? System.Int32
_G['Character'].ReloadHead = function(headId, hairIndex, beardIndex, moustacheIndex, faceAttachmentIndex) end

---`Method Public Instance`
_G['Character'].LoadHeadAttachments = function() end

---`Method Public Instance`
---@param inputType Barotrauma.InputType
---@return System.Boolean
_G['Character'].IsKeyHit = function(inputType) end

---`Method Public Instance`
---@param inputType Barotrauma.InputType
---@return System.Boolean
_G['Character'].IsKeyDown = function(inputType) end

---`Method Public Instance`
---@param inputType Barotrauma.InputType
---@param hit System.Boolean
---@param held System.Boolean
_G['Character'].SetInput = function(inputType, hit, held) end

---`Method Public Instance`
---@param inputType Barotrauma.InputType
_G['Character'].ClearInput = function(inputType) end

---`Method Public Instance`
_G['Character'].ClearInputs = function() end

---`Method Public Instance Virtual`
---@return System.String
_G['Character'].ToString = function() end

---`Method Public Instance`
---@param isPvPMode System.Boolean
---@param spawnPoint? Barotrauma.WayPoint
_G['Character'].GiveJobItems = function(isPvPMode, spawnPoint) end

---`Method Public Instance`
---@param spawnPoint Barotrauma.WayPoint
---@param createNetworkEvent? System.Boolean
_G['Character'].GiveIdCardTags = function(spawnPoint, createNetworkEvent) end

---`Method Public Instance`
---@param skillIdentifier Barotrauma.Identifier
---@return System.Single
_G['Character'].GetSkillLevel = function(skillIdentifier) end

---`Method Public Instance`
---@return Microsoft.Xna.Framework.Vector2
_G['Character'].GetTargetMovement = function() end

---`Method Public Instance`
---@return System.Boolean
_G['Character'].CanRunWhileDragging = function() end

---`Method Public Instance`
---@param targetMovement Microsoft.Xna.Framework.Vector2
---@param currentSpeed System.Single
---@return Microsoft.Xna.Framework.Vector2
_G['Character'].ApplyMovementLimits = function(targetMovement, currentSpeed) end

---`Method Public Instance`
---@param val System.Single
_G['Character'].StackSpeedMultiplier = function(val) end

---`Method Public Instance`
_G['Character'].ResetSpeedMultiplier = function() end

---`Method Public Instance`
---@param val System.Single
_G['Character'].StackHealthMultiplier = function(val) end

---`Method Private Instance`
_G['Character'].CalculateHealthMultiplier = function() end

---`Method Public Instance`
---@return System.Single
_G['Character'].GetTemporarySpeedReduction = function() end

---`Method Private Instance`
---@param limb Barotrauma.Limb
---@param sum System.Single
---@param max? System.Single
---@return System.Single
_G['Character'].CalculateMovementPenalty = function(limb, sum, max) end

---`Method Public Instance`
---@return System.Single
_G['Character'].GetRightHandPenalty = function() end

---`Method Public Instance`
---@return System.Single
_G['Character'].GetLeftHandPenalty = function() end

---`Method Public Instance`
---@param startSum? System.Single
---@return System.Single
_G['Character'].GetLegPenalty = function(startSum) end

---`Method Public Instance`
---@param speed System.Single
---@return System.Single
_G['Character'].ApplyTemporarySpeedLimits = function(speed) end

---`Method Public Instance`
---@param deltaTime System.Single
---@param cam Barotrauma.Camera
_G['Character'].Control = function(deltaTime, cam) end

---`Method Public Instance`
---@param attackLimb Barotrauma.Limb
---@param damageTarget Barotrauma.IDamageable
---@param attackPos Microsoft.Xna.Framework.Vector2
_G['Character'].SetAttackTarget = function(attackLimb, damageTarget, attackPos) end

---`Method Private Instance`
---@return Barotrauma.Limb
_G['Character'].GetSeeingLimb = function() end

---`Method Public Instance`
---@param target Barotrauma.ISpatialEntity
---@param seeingEntity? Barotrauma.ISpatialEntity
---@param seeThroughWindows? System.Boolean
---@param checkFacing? System.Boolean
---@return System.Boolean
_G['Character'].CanSeeTarget = function(target, seeingEntity, seeThroughWindows, checkFacing) end

---`Method Public Instance`
---@param targetWorldPos Microsoft.Xna.Framework.Vector2
---@return System.Boolean
_G['Character'].IsFacing = function(targetWorldPos) end

---`Method Public Instance`
---@param item Barotrauma.Item
---@param requireEquipped? System.Boolean
---@param slotType? System.Nullable*1Barotrauma*InvSlotType
---@return System.Boolean
_G['Character'].HasItem = function(item, requireEquipped, slotType) end

---`Method Public Instance`
---@overload fun(item:Barotrauma.Item, slotType?:System.Nullable*1Barotrauma*InvSlotType, predicate?:(System.Func*1Barotrauma*InvSlotType*1System*Boolean)|(fun(arg:Barotrauma.InvSlotType):(System.Boolean))):(System.Boolean)
---@param tagOrIdentifier Barotrauma.Identifier
---@param allowBroken? System.Boolean
---@param slotType? System.Nullable*1Barotrauma*InvSlotType
---@return System.Boolean
_G['Character'].HasEquippedItem = function(tagOrIdentifier, allowBroken, slotType) end

---`Method Public Instance`
---@param tagOrIdentifier? Barotrauma.Identifier
---@param slotType? System.Nullable*1Barotrauma*InvSlotType
---@return Barotrauma.Item
_G['Character'].GetEquippedItem = function(tagOrIdentifier, slotType) end

---`Method Public Instance`
---@param items System.ValueTuple
---@return System.Boolean
_G['Character'].HasHandsFull = function(items) end

---`Method Public Instance`
---@param item Barotrauma.Item
---@param allowedSlots (System.Collections.Generic.IEnumerable*1Barotrauma*InvSlotType)|(fun():(Barotrauma.InvSlotType))
---@return System.Boolean
_G['Character'].TryPutItem = function(item, allowedSlots) end

---`Method Public Instance`
---@param item Barotrauma.Item
---@return System.Boolean
_G['Character'].TryPutItemInBag = function(item) end

---`Method Public Instance`
---@param item Barotrauma.Item
---@return System.Boolean
_G['Character'].TryPutItemInAnySlot = function(item) end

---`Method Public Instance`
---@param item Barotrauma.Item
---@return System.Boolean
_G['Character'].Unequip = function(item) end

---`Method Public Instance`
---@param inventory Barotrauma.Inventory
---@param accessLevel? Barotrauma.CharacterInventory.AccessLevel
---@return System.Boolean
_G['Character'].CanAccessInventory = function(inventory, accessLevel) end

---`Method Public Instance`
---@param character Barotrauma.Character
---@param checkFriendlyTeam? System.Boolean
---@return System.Boolean
_G['Character'].CanBeHealedBy = function(character, checkFriendlyTeam) end

---`Method Public Instance`
---@param character Barotrauma.Character
---@return System.Boolean
_G['Character'].CanBeDraggedBy = function(character) end

---`Method Public Instance`
---@param character Barotrauma.Character
---@param accessLevel? Barotrauma.CharacterInventory.AccessLevel
---@return System.Boolean
_G['Character'].IsInventoryAccessibleTo = function(character, accessLevel) end

---`Method Public Instance`
---@param itemIndex System.Int32-ref
---@param targetItem Barotrauma.Item-ref
---@param identifiers? (System.Collections.Generic.IEnumerable*1Barotrauma*Identifier)|(fun():(Barotrauma.Identifier))
---@param ignoreBroken? System.Boolean
---@param ignoredItems? (System.Collections.Generic.IEnumerable*1Barotrauma*Item)|(fun():(Barotrauma.Item))
---@param ignoredContainerIdentifiers? (System.Collections.Generic.IEnumerable*1Barotrauma*Identifier)|(fun():(Barotrauma.Identifier))
---@param customPredicate? (System.Func*1Barotrauma*Item*1System*Boolean)|(fun(arg:Barotrauma.Item):(System.Boolean))
---@param customPriorityFunction? (System.Func*1Barotrauma*Item*1System*Single)|(fun(arg:Barotrauma.Item):(System.Single))
---@param maxItemDistance? System.Single
---@param positionalReference? Barotrauma.ISpatialEntity
---@return System.Boolean
_G['Character'].FindItem = function(itemIndex, targetItem, identifiers, ignoreBroken, ignoredItems, ignoredContainerIdentifiers, customPredicate, customPriorityFunction, maxItemDistance, positionalReference) end

---`Method Public Instance`
---@param item Barotrauma.Item
---@return System.Boolean
_G['Character'].IsItemTakenBySomeoneElse = function(item) end

---`Method Public Instance`
---@overload fun(c:Barotrauma.Character, maxDist?:System.Single, checkVisibility?:System.Boolean, skipDistanceCheck?:System.Boolean):(System.Boolean)
---@overload fun(item:Barotrauma.Item, checkLinked?:System.Boolean):(System.Boolean)
---@param item Barotrauma.Item
---@param distanceToItem System.Single-ref
---@param checkLinked System.Boolean
---@return System.Boolean
_G['Character'].CanInteractWith = function(item, distanceToItem, checkLinked) end

---`Method Public Instance`
---@param onCustomInteract (System.Action*1Barotrauma*Character*1Barotrauma*Character)|(fun(arg1:Barotrauma.Character, arg2:Barotrauma.Character))
---@param hudText Barotrauma.LocalizedString
_G['Character'].SetCustomInteract = function(onCustomInteract, hudText) end

---`Method Public Instance`
---@param character Barotrauma.Character
_G['Character'].SelectCharacter = function(character) end

---`Method Public Instance`
_G['Character'].DeselectCharacter = function() end

---`Method Public Instance`
---@param deltaTime System.Single
---@param mouseSimPos Microsoft.Xna.Framework.Vector2
_G['Character'].DoInteractionUpdate = function(deltaTime, mouseSimPos) end

---`Method Public Static`
---@param deltaTime System.Single
_G['Character'].UpdateAnimAll = function(deltaTime) end

---`Method Public Static`
---@param deltaTime System.Single
---@param cam Barotrauma.Camera
_G['Character'].UpdateAll = function(deltaTime, cam) end

---`Method Private Static`
---@param deltaTime System.Single
_G['Character'].UpdateSpeechBubbles = function(deltaTime) end

---`Method Public Instance Virtual`
---@param deltaTime System.Single
---@param cam Barotrauma.Camera
_G['Character'].Update = function(deltaTime, cam) end

---`Method Private Instance`
---@param deltaTime System.Single
---@param cam Barotrauma.Camera
_G['Character'].UpdateControlled = function(deltaTime, cam) end

---`Method Private Instance`
---@param deltaTime System.Single
---@param cam Barotrauma.Camera
_G['Character'].UpdateProjSpecific = function(deltaTime, cam) end

---`Method Private Instance`
---@param order Barotrauma.Order
_G['Character'].SetOrderProjSpecific = function(order) end

---`Method Public Instance`
---@param character Barotrauma.Character
---@param damage System.Single
_G['Character'].AddAttacker = function(character, damage) end

---`Method Public Instance`
---@param character Barotrauma.Character
_G['Character'].ForgiveAttacker = function(character) end

---`Method Public Instance`
---@param otherCharacter Barotrauma.Character
---@return System.Single
_G['Character'].GetDamageDoneByAttacker = function(otherCharacter) end

---`Method Private Instance`
---@param deltaTime System.Single
_G['Character'].UpdateAttackers = function(deltaTime) end

---`Method Private Instance`
---@param deltaTime System.Single
_G['Character'].UpdateOxygen = function(deltaTime) end

---`Method NonPublic Instance`
---@return System.Single
_G['Character'].GetDistanceToClosestPlayer = function() end

---`Method NonPublic Instance`
---@return System.Single
_G['Character'].GetDistanceSqrToClosestPlayer = function() end

---`Method Public Instance`
---@param simPos Microsoft.Xna.Framework.Vector2
---@return System.Single
_G['Character'].GetDistanceToClosestLimb = function(simPos) end

---`Method Private Instance`
---@param deltaTime System.Single
---@param createNetworkEvents? System.Boolean
_G['Character'].UpdateDespawn = function(deltaTime, createNetworkEvents) end

---`Method Private Instance`
---@param createNetworkEvents? System.Boolean
_G['Character'].Despawn = function(createNetworkEvents) end

---`Method Public Instance`
---@param createNetworkEvents? System.Boolean
_G['Character'].DespawnNow = function(createNetworkEvents) end

---`Method Public Static`
---@param prefab Barotrauma.CharacterPrefab
_G['Character'].RemoveByPrefab = function(prefab) end

---`Method Private Instance`
---@param deltaTime System.Single
_G['Character'].UpdateSightRange = function(deltaTime) end

---`Method Private Instance`
---@param deltaTime System.Single
_G['Character'].UpdateSoundRange = function(deltaTime) end

---`Method Public Instance`
---@param speaker Barotrauma.Character
---@return System.Boolean
_G['Character'].CanHearCharacter = function(speaker) end

---`Method Public Instance`
---@param order Barotrauma.Order
---@param isNewOrder System.Boolean
---@param speak? System.Boolean
---@param force? System.Boolean
_G['Character'].SetOrder = function(order, isNewOrder, speak, force) end

---`Method Private Instance`
---@param newOrder Barotrauma.Order
_G['Character'].AddCurrentOrder = function(newOrder) end

---`Method Private Instance`
---@param order Barotrauma.Order
_G['Character'].RemoveDuplicateOrders = function(order) end

---`Method Public Instance`
---@return Barotrauma.Order
_G['Character'].GetCurrentOrderWithTopPriority = function() end

---`Method Public Instance`
---@param order Barotrauma.Order
---@return Barotrauma.Order
_G['Character'].GetCurrentOrder = function(order) end

---`Method Private Instance`
---@param predicate (System.Func*1Barotrauma*Order*1System*Boolean)|(fun(arg:Barotrauma.Order):(System.Boolean))
---@return Barotrauma.Order
_G['Character'].GetCurrentOrder = function(predicate) end

---`Method Public Instance`
---@overload fun(identifier:Barotrauma.Identifier)
---@param identifier System.String
_G['Character'].DisableLine = function(identifier) end

---`Method Public Instance`
---@param message System.String
---@param messageType? System.Nullable*1Barotrauma*Networking*ChatMessageType
---@param delay? System.Single
---@param identifier? Barotrauma.Identifier
---@param minDurationBetweenSimilar? System.Single
_G['Character'].Speak = function(message, messageType, delay, identifier, minDurationBetweenSimilar) end

---`Method Public Instance`
---@param message Barotrauma.AIChatMessage
---@param canUseRadio System.Boolean
---@param radio Barotrauma.Items.Components.WifiComponent
_G['Character'].SendSinglePlayerMessage = function(message, canUseRadio, radio) end

---`Method Private Instance`
---@param deltaTime System.Single
_G['Character'].UpdateAIChatMessages = function(deltaTime) end

---`Method Public Instance`
---@param damageAmount System.Single
---@param bleedingDamageAmount System.Single
---@param burnDamageAmount System.Single
_G['Character'].SetAllDamage = function(damageAmount, bleedingDamageAmount, burnDamageAmount) end

---`Method Public Instance Virtual`
---@param attacker Barotrauma.Character
---@param worldPosition Microsoft.Xna.Framework.Vector2
---@param attack Barotrauma.Attack
---@param impulseDirection Microsoft.Xna.Framework.Vector2
---@param deltaTime System.Single
---@param playSound? System.Boolean
---@return Barotrauma.AttackResult
_G['Character'].AddDamage = function(attacker, worldPosition, attack, impulseDirection, deltaTime, playSound) end

---`Method Public Instance`
---@overload fun(worldPosition:Microsoft.Xna.Framework.Vector2, afflictions:(System.Collections.Generic.IEnumerable*1Barotrauma*Affliction)|(fun():(Barotrauma.Affliction)), stun:System.Single, playSound:System.Boolean, attackImpulse?:System.Nullable*1Microsoft*Xna*Framework*Vector2, attacker?:Barotrauma.Character, damageMultiplier?:System.Single):(Barotrauma.AttackResult)
---@param worldPosition Microsoft.Xna.Framework.Vector2
---@param afflictions (System.Collections.Generic.IEnumerable*1Barotrauma*Affliction)|(fun():(Barotrauma.Affliction))
---@param stun System.Single
---@param playSound System.Boolean
---@param attackImpulse Microsoft.Xna.Framework.Vector2
---@param hitLimb Barotrauma.Limb-ref
---@param attacker? Barotrauma.Character
---@param damageMultiplier? System.Single
---@return Barotrauma.AttackResult
_G['Character'].AddDamage = function(worldPosition, afflictions, stun, playSound, attackImpulse, hitLimb, attacker, damageMultiplier) end

---`Method Public Instance`
---@param attacker Barotrauma.Character
---@param worldPosition Microsoft.Xna.Framework.Vector2
---@param attack Barotrauma.Attack
---@param deltaTime System.Single
---@param impulseDirection Microsoft.Xna.Framework.Vector2
---@param playSound? System.Boolean
---@param targetLimb? Barotrauma.Limb
---@param penetration? System.Single
---@return Barotrauma.AttackResult
_G['Character'].ApplyAttack = function(attacker, worldPosition, attack, deltaTime, impulseDirection, playSound, targetLimb, penetration) end

---`Method Public Instance`
---@param targetLimb Barotrauma.Limb
---@param severLimbsProbability System.Single
---@param damage System.Single
---@param allowBeheading System.Boolean
---@param ignoreSeveranceProbabilityModifier? System.Boolean
---@param attacker? Barotrauma.Character
_G['Character'].TrySeverLimbJoints = function(targetLimb, severLimbsProbability, damage, allowBeheading, ignoreSeveranceProbabilityModifier, attacker) end

---`Method Public Instance`
---@param target Barotrauma.Character
_G['Character'].RecordKill = function(target) end

---`Method Public Instance`
---@param worldPosition Microsoft.Xna.Framework.Vector2
---@param hitLimb Barotrauma.Limb
---@param afflictions (System.Collections.Generic.IEnumerable*1Barotrauma*Affliction)|(fun():(Barotrauma.Affliction))
---@param stun System.Single
---@param playSound System.Boolean
---@param attackImpulse Microsoft.Xna.Framework.Vector2
---@param attacker? Barotrauma.Character
---@param damageMultiplier? System.Single
---@param allowStacking? System.Boolean
---@param penetration? System.Single
---@param shouldImplode? System.Boolean
---@param ignoreDamageOverlay? System.Boolean
---@param recalculateVitality? System.Boolean
---@return Barotrauma.AttackResult
_G['Character'].DamageLimb = function(worldPosition, hitLimb, afflictions, stun, playSound, attackImpulse, attacker, damageMultiplier, allowStacking, penetration, shouldImplode, ignoreDamageOverlay, recalculateVitality) end

---`Method Private Instance`
---@param attacker Barotrauma.Character
---@param attackResult Barotrauma.AttackResult
---@param stun System.Single
_G['Character'].OnAttackedProjSpecific = function(attacker, attackResult, stun) end

---`Method Public Instance`
---@param attacker Barotrauma.Character
---@param attackResult Barotrauma.AttackResult
_G['Character'].TryAdjustAttackerSkill = function(attacker, attackResult) end

---`Method Public Instance`
---@param healer Barotrauma.Character
---@param healthChange? System.Single
---@param affliction? Barotrauma.Affliction
_G['Character'].TryAdjustHealerSkill = function(healer, healthChange, affliction) end

---`Method Public Instance`
---@param newStun System.Single
---@param allowStunDecrease? System.Boolean
---@param isNetworkMessage? System.Boolean
_G['Character'].SetStun = function(newStun, allowStunDecrease, isNetworkMessage) end

---`Method Public Instance`
---@param actionType Barotrauma.ActionType
---@param deltaTime System.Single
_G['Character'].ApplyStatusEffects = function(actionType, deltaTime) end

---`Method Private Instance`
---@param isNetworkMessage? System.Boolean
_G['Character'].Implode = function(isNetworkMessage) end

---`Method Public Instance`
_G['Character'].BreakJoints = function() end

---`Method Private Instance`
_G['Character'].ImplodeFX = function() end

---`Method Public Instance`
---@param huskInfection? Barotrauma.AfflictionPrefabHusk
---@param playDead? System.Nullable*1System*Boolean
_G['Character'].TurnIntoHusk = function(huskInfection, playDead) end

---`Method Public Instance`
---@param causeOfDeath Barotrauma.CauseOfDeathType
---@param causeOfDeathAffliction Barotrauma.Affliction
---@param isNetworkMessage? System.Boolean
---@param log? System.Boolean
_G['Character'].Kill = function(causeOfDeath, causeOfDeathAffliction, isNetworkMessage, log) end

---`Method Private Instance`
---@param causeOfDeath Barotrauma.CauseOfDeathType
---@param causeOfDeathAffliction Barotrauma.Affliction
---@param log System.Boolean
_G['Character'].KillProjSpecific = function(causeOfDeath, causeOfDeathAffliction, log) end

---`Method Public Instance`
---@param removeAfflictions? System.Boolean
---@param createNetworkEvent? System.Boolean
_G['Character'].Revive = function(removeAfflictions, createNetworkEvent) end

---`Method Public Instance Virtual`
_G['Character'].Remove = function() end

---`Method Private Instance`
_G['Character'].DisposeProjSpecific = function() end

---`Method Public Instance`
---@param worldPos Microsoft.Xna.Framework.Vector2
_G['Character'].TeleportTo = function(worldPos) end

---`Method Public Static`
---@param inventory Barotrauma.Inventory
---@param parentElement System.Xml.Linq.XElement
_G['Character'].SaveInventory = function(inventory, parentElement) end

---`Method Public Instance`
_G['Character'].SaveInventory = function() end

---`Method Public Instance`
---@param inventory Barotrauma.Inventory
---@param itemData Barotrauma.ContentXElement
_G['Character'].SpawnInventoryItems = function(inventory, itemData) end

---`Method Private Instance`
---@param inventory Barotrauma.Inventory
---@param element Barotrauma.ContentXElement
---@param extraDuffelBags (System.Collections.Generic.List*1Barotrauma*Item)|(Barotrauma.Item[])
_G['Character'].SpawnInventoryItemsRecursive = function(inventory, element, extraDuffelBags) end

---`Method Public Instance`
---@return (System.Collections.Generic.IEnumerable*1Barotrauma*AttackContext)|(fun():(Barotrauma.AttackContext))
_G['Character'].GetAttackContexts = function() end

---`Method Public Instance`
---@return (System.Collections.Generic.List*1Barotrauma*Hull)|(Barotrauma.Hull[])
_G['Character'].GetVisibleHulls = function() end

---`Method Public Instance`
---@param target Barotrauma.ISpatialEntity
---@param worldPos? System.Nullable*1Microsoft*Xna*Framework*Vector2
---@return Microsoft.Xna.Framework.Vector2
_G['Character'].GetRelativeSimPosition = function(target, worldPos) end

---`Method Public Instance`
---@overload fun(identifier:System.String):(System.Boolean)
---@param identifier Barotrauma.Identifier
---@return System.Boolean
_G['Character'].HasJob = function(identifier) end

---`Method Public Instance`
---@param talentPointReduction System.Int32
_G['Character'].ResetTalents = function(talentPointReduction) end

---`Method Public Instance`
_G['Character'].LoadTalents = function() end

---`Method Public Instance`
---@overload fun(talentIdentifier:Barotrauma.Identifier, addingFirstTime?:System.Boolean):(System.Boolean)
---@overload fun(talentIdentifier:System.UInt32, addingFirstTime?:System.Boolean):(System.Boolean)
---@param talentPrefab Barotrauma.TalentPrefab
---@param addingFirstTime? System.Boolean
---@return System.Boolean
_G['Character'].GiveTalent = function(talentPrefab, addingFirstTime) end

---`Method Public Instance`
---@param identifier Barotrauma.Identifier
---@return System.Boolean
_G['Character'].HasTalent = function(identifier) end

---`Method Public Instance`
---@return System.Boolean
_G['Character'].HasUnlockedAllTalents = function() end

---`Method Public Instance`
---@return System.Boolean
_G['Character'].HasTalents = function() end

---`Method Public Instance`
---@overload fun(abilityEffectType:Barotrauma.AbilityEffectType, abilityObject:Barotrauma.Abilities.AbilityObject)
---@param abilityEffectType Barotrauma.AbilityEffectType
_G['Character'].CheckTalents = function(abilityEffectType) end

---`Method Private Instance`
---@param talentPrefab Barotrauma.TalentPrefab
_G['Character'].OnTalentGiven = function(talentPrefab) end

---`Method Public Instance`
---@param character Barotrauma.Character
---@return System.Boolean
_G['Character'].IsInSameRoomAs = function(character) end

---`Method Public Static`
---@param character Barotrauma.Character
---@return (System.Collections.Generic.IEnumerable*1Barotrauma*Character)|(fun():(Barotrauma.Character))
_G['Character'].GetFriendlyCrew = function(character) end

---`Method Public Instance`
---@param recipeIdentifier Barotrauma.Identifier
---@return System.Boolean
_G['Character'].HasRecipeForItem = function(recipeIdentifier) end

---`Method Public Instance`
---@param prefab Barotrauma.ItemPrefab
---@return System.Boolean
_G['Character'].HasStoreAccessForItem = function(prefab) end

---`Method Public Instance`
---@param amount System.Int32
_G['Character'].GiveMoney = function(amount) end

---`Method Public Instance`
---@param amount System.Int32
_G['Character'].SetMoney = function(amount) end

---`Method Private Instance`
---@param prevAmount System.Int32
---@param newAmount System.Int32
_G['Character'].OnMoneyChanged = function(prevAmount, newAmount) end

---`Method Public Instance`
---@param statType Barotrauma.StatTypes
---@param includeSaved? System.Boolean
---@return System.Single
_G['Character'].GetStatValue = function(statType, includeSaved) end

---`Method Public Instance`
_G['Character'].OnWearablesChanged = function() end

---`Method Public Instance`
---@param statType Barotrauma.StatTypes
---@param value System.Single
_G['Character'].ChangeStat = function(statType, value) end

---`Method Private Static`
---@param skillIdentifier Barotrauma.Identifier
---@return Barotrauma.StatTypes
_G['Character'].GetSkillStatType = function(skillIdentifier) end

---`Method Public Instance`
---@param abilityFlag Barotrauma.AbilityFlags
_G['Character'].AddAbilityFlag = function(abilityFlag) end

---`Method Public Instance`
---@param abilityFlag Barotrauma.AbilityFlags
_G['Character'].RemoveAbilityFlag = function(abilityFlag) end

---`Method Public Instance`
---@param abilityFlag Barotrauma.AbilityFlags
---@return System.Boolean
_G['Character'].HasAbilityFlag = function(abilityFlag) end

---`Method Public Instance`
---@overload fun(resistanceId:Barotrauma.Identifier):(System.Single)
---@param affliction Barotrauma.AfflictionPrefab
---@return System.Single
_G['Character'].GetAbilityResistance = function(affliction) end

---`Method Public Instance`
---@param identifier Barotrauma.TalentResistanceIdentifier
---@param value System.Single
_G['Character'].ChangeAbilityResistance = function(identifier, value) end

---`Method Public Instance`
---@param identifier Barotrauma.TalentResistanceIdentifier
_G['Character'].RemoveAbilityResistance = function(identifier) end

---`Method Public Instance`
---@param other Barotrauma.Character
---@return System.Boolean
_G['Character'].IsFriendly = function(other) end

---`Method Public Static`
---@param me Barotrauma.Character
---@param other Barotrauma.Character
---@return System.Boolean
_G['Character'].IsFriendly = function(me, other) end

---`Method Public Static`
---@overload fun(myTeam:Barotrauma.CharacterTeamType, otherTeam:Barotrauma.CharacterTeamType):(System.Boolean)
---@param me Barotrauma.Character
---@param other Barotrauma.Character
---@return System.Boolean
_G['Character'].IsOnFriendlyTeam = function(me, other) end

---`Method Public Instance`
---@overload fun(other:Barotrauma.Character):(System.Boolean)
---@param otherTeam Barotrauma.CharacterTeamType
---@return System.Boolean
_G['Character'].IsOnFriendlyTeam = function(otherTeam) end

---`Method Public Instance`
---@param other Barotrauma.Character
---@return System.Boolean
_G['Character'].IsSameSpeciesOrGroup = function(other) end

---`Method Public Static`
---@param me Barotrauma.Character
---@param other Barotrauma.Character
---@return System.Boolean
_G['Character'].IsSameSpeciesOrGroup = function(me, other) end

---`Method Public Instance`
---@param speciesNameOrGroup Barotrauma.Identifier
---@return System.Boolean
_G['Character'].MatchesSpeciesNameOrGroup = function(speciesNameOrGroup) end

---`Method Public Instance`
_G['Character'].StopClimbing = function() end

---`Method Public Instance`
_G['Character'].ResetNetState = function() end

---`Method Private Instance`
_G['Character'].UpdateNetInput = function() end

---`Constructor NonPublic Instance`
---@overload fun(prefab:Barotrauma.CharacterPrefab, position:Microsoft.Xna.Framework.Vector2, seed:System.String, characterInfo?:Barotrauma.CharacterInfo, id?:System.UInt16, isRemotePlayer?:System.Boolean, ragdollParams?:Barotrauma.RagdollParams, spawnInitialItems?:System.Boolean):Barotrauma.Character
---@return Barotrauma.Character
_G['Character'] = function() end

---`Constructor NonPublic Instance`
---@overload fun(prefab:Barotrauma.CharacterPrefab, position:Microsoft.Xna.Framework.Vector2, seed:System.String, characterInfo?:Barotrauma.CharacterInfo, id?:System.UInt16, isRemotePlayer?:System.Boolean, ragdollParams?:Barotrauma.RagdollParams, spawnInitialItems?:System.Boolean):Barotrauma.Character
---@return Barotrauma.Character
_G['Character'].__new = function() end

---`Constructor Private Static`
---@overload fun(prefab:Barotrauma.CharacterPrefab, position:Microsoft.Xna.Framework.Vector2, seed:System.String, characterInfo?:Barotrauma.CharacterInfo, id?:System.UInt16, isRemotePlayer?:System.Boolean, ragdollParams?:Barotrauma.RagdollParams, spawnInitialItems?:System.Boolean):Barotrauma.Character
---@return Barotrauma.Character
_G['Character'] = function() end

---`Constructor Private Static`
---@overload fun(prefab:Barotrauma.CharacterPrefab, position:Microsoft.Xna.Framework.Vector2, seed:System.String, characterInfo?:Barotrauma.CharacterInfo, id?:System.UInt16, isRemotePlayer?:System.Boolean, ragdollParams?:Barotrauma.RagdollParams, spawnInitialItems?:System.Boolean):Barotrauma.Character
---@return Barotrauma.Character
_G['Character'].__new = function() end

