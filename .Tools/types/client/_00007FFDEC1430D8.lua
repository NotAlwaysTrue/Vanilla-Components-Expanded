---@meta
---@class Barotrauma.Items.Components.Turret : Barotrauma.Items.Components.Powered
---`Field Private Instance`
---@field crosshairSprite Barotrauma.Sprite
---`Field Private Instance`
---@field crosshairPointerSprite Barotrauma.Sprite
---`Field Public Instance`
---@field WeaponIndicatorSprite Barotrauma.Sprite
---`Field Private Instance`
---@field powerIndicator Barotrauma.GUIProgressBar
---`Field Private Instance`
---@field debugDrawTargetPos System.Nullable*1Microsoft*Xna*Framework*Vector2
---`Field Private Instance`
---@field recoilTimer System.Single
---`Field Private Instance`
---@field startMoveSound Barotrauma.RoundSound
---`Field Private Instance`
---@field endMoveSound Barotrauma.RoundSound
---`Field Private Instance`
---@field moveSound Barotrauma.RoundSound
---`Field Private Instance`
---@field chargeSound Barotrauma.RoundSound
---`Field Private Instance`
---@field moveSoundChannel Barotrauma.Sounds.SoundChannel
---`Field Private Instance`
---@field chargeSoundChannel Barotrauma.Sounds.SoundChannel
---`Field Private Instance`
---@field oldRotation Microsoft.Xna.Framework.Vector2
---`Field Private Instance`
---@field crosshairPos Microsoft.Xna.Framework.Vector2
---`Field Private Instance`
---@field crosshairPointerPos Microsoft.Xna.Framework.Vector2
---`Field Private Instance`
---@field widgets (System.Collections.Generic.Dictionary*1System*String*1Barotrauma*Widget)|({[System.String]:(Barotrauma.Widget)})
---`Field Private Instance`
---@field prevAngle System.Single
---`Field Private Instance`
---@field currentBarrelSpin System.Single
---`Field Private Instance`
---@field flashLowPower System.Boolean
---`Field Private Instance`
---@field flashNoAmmo System.Boolean
---`Field Private Instance`
---@field flashLoaderBroken System.Boolean
---`Field Private Instance`
---@field flashTimer System.Single
---`Field Private Instance`
---@field flashLength System.Single
---`Field Private Instance`
---@field particleEmitters (System.Collections.Generic.List*1Barotrauma*Particles*ParticleEmitter)|(Barotrauma.Particles.ParticleEmitter[])
---`Field Private Instance`
---@field particleEmitterCharges (System.Collections.Generic.List*1Barotrauma*Particles*ParticleEmitter)|(Barotrauma.Particles.ParticleEmitter[])
---`Field Private Instance`
---@field _chargeSoundWindupPitchSlide Microsoft.Xna.Framework.Vector2
---`Field Private Instance`
---@field barrelSprite Barotrauma.Sprite
---`Field Private Instance`
---@field railSprite Barotrauma.Sprite
---`Field Private Instance`
---@field barrelSpriteBroken Barotrauma.Sprite
---`Field Private Instance`
---@field railSpriteBroken Barotrauma.Sprite
---`Field Private Instance`
---@field chargeSprites (System.Collections.Generic.List*1System*ValueTuple*2Barotrauma*Sprite*2Microsoft*Xna*Framework*Vector2)|(System.ValueTuple*1Barotrauma*Sprite*1Microsoft*Xna*Framework*Vector2[])
---`Field Private Instance`
---@field spinningBarrelSprites (System.Collections.Generic.List*1Barotrauma*Sprite)|(Barotrauma.Sprite[])
---`Field Private Instance`
---@field barrelPos Microsoft.Xna.Framework.Vector2
---`Field Private Instance`
---@field transformedBarrelPos Microsoft.Xna.Framework.Vector2
---`Field Private Instance`
---@field targetRotation System.Single
---`Field Private Instance`
---@field reload System.Single
---`Field Private Instance`
---@field shotCounter System.Int32
---`Field Private Instance`
---@field minRotation System.Single
---`Field Private Instance`
---@field maxRotation System.Single
---`Field Private Instance`
---@field cam Barotrauma.Camera
---`Field Private Instance`
---@field angularVelocity System.Single
---`Field Private Instance`
---@field failedLaunchAttempts System.Int32
---`Field Private Instance`
---@field currentChargeTime System.Single
---`Field Private Instance`
---@field tryingToCharge System.Boolean
---`Field Private Instance`
---@field currentChargingState Barotrauma.Items.Components.Turret.ChargingState
---`Field Private Instance`
---@field activeProjectiles (System.Collections.Generic.List*1Barotrauma*Item)|(Barotrauma.Item[])
---`Field Private Instance`
---@field user Barotrauma.Character
---`Field Private Instance`
---@field resetUserTimer System.Single
---`Field Private Instance`
---@field aiFindTargetTimer System.Single
---`Field Private Instance`
---@field currentTarget Barotrauma.ISpatialEntity
---`Field Private Instance`
---@field projectileSpeed System.Single
---`Field Private Instance`
---@field previousAmmo Barotrauma.Item
---`Field Private Instance`
---@field currentLoaderIndex System.Int32
---`Field Public Instance`
---@field ActiveUser Barotrauma.Character
---`Field Private Instance`
---@field resetActiveUserTimer System.Single
---`Field Private Instance`
---@field lightComponents (System.Collections.Generic.List*1Barotrauma*Items*Components*LightComponent)|(Barotrauma.Items.Components.LightComponent[])
---`Field Private Instance`
---@field lastProjectile Barotrauma.Items.Components.Projectile
---`Field Private Instance`
---@field isSlowTurret System.Boolean
---`Field Private Instance`
---@field flipFiringOffset System.Boolean
---`Field Private Instance`
---@field prevScale System.Single
---`Field Private Instance`
---@field prevBaseRotation System.Single
---`Field Private Instance`
---@field _maxAngleOffset System.Single
---`Field Private Instance`
---@field isUseBeingCalled System.Boolean
---`Field Private Instance`
---@field waitTimer System.Single
---`Field Private Instance`
---@field randomAimTimer System.Single
---`Field Private Instance`
---@field prevTargetRotation System.Single
---`Field Private Instance`
---@field updateTimer System.Single
---`Field Private Instance`
---@field updatePending System.Boolean
---`Field Private Instance`
---@field loadedRotationLimits System.Nullable*1Microsoft*Xna*Framework*Vector2
---`Field Private Instance`
---@field loadedBaseRotation System.Nullable*1System*Single
---`Field Private Instance`
---@field loadedFriendlyTeamType System.Nullable*1Barotrauma*Items*Components*Turret*TeamType
---`Field Private Static`
---@field MaxCircle System.Single
---`Field Private Static`
---@field HalfCircle System.Single
---`Field Private Static`
---@field QuarterCircle System.Single
---`Field Private Static`
---@field LaunchWithoutProjectileId System.UInt16
---`Field Private Static`
---@field CrewAiFindTargetMaxInterval System.Single
---`Field Private Static`
---@field CrewAIFindTargetMinInverval System.Single
---`Field Private Static`
---@field MinimumProjectileVelocityForAimAhead System.Single
---`Field Private Static`
---@field MaximumAimAhead System.Single
---`Field Private Static`
---@field TinkeringPowerCostReduction System.Single
---`Field Private Static`
---@field TinkeringDamageIncrease System.Single
---`Field Private Static`
---@field TinkeringReloadDecrease System.Single
---`Field Private Static`
---@field SetAutoOperateConnection System.String
---`Field Private Static`
---@field ToggleAutoOperateConnection System.String
---`Getter Public Instance`
---@field UIElementHeight System.Int32
---`Getter Private Instance`
---@field RetractionTime System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field ShowChargeIndicator System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field ShowProjectileIndicator System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field RecoilDistance System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field SpinningBarrelDistance System.Single
---`Getter Public Instance Virtual`
---@field DrawSize Microsoft.Xna.Framework.Vector2
---`Getter Public Instance`
---@field BarrelSprite Barotrauma.Sprite
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field HideBarrelWhenBroken System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field ChargeSoundWindupPitchSlide Microsoft.Xna.Framework.Vector2
---`Getter Public Instance`
---@field ActiveProjectiles (System.Collections.Generic.IEnumerable*1Barotrauma*Item)|(fun():(Barotrauma.Item))
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field Rotation System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field BarrelPos Microsoft.Xna.Framework.Vector2
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field FiringOffset Microsoft.Xna.Framework.Vector2
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field AlternatingFiringOffset System.Boolean
---`Getter Public Instance`
---@field TransformedBarrelPos Microsoft.Xna.Framework.Vector2
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field LaunchImpulse System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field DamageMultiplier System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field ProjectileCount System.Int32
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field LaunchWithoutProjectile System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Spread System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field FiringRotationSpeedModifier System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field SingleChargedShot System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field BaseRotation System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field AIRange System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field MaxAngleOffset System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field AICurrentTargetPriorityMultiplier System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field MaxActiveProjectiles System.Int32
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field MaxChargeTime System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Reload System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field ShotsPerBurst System.Int32
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field DelayBetweenBursts System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field RetractionDurationMultiplier System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field RecoilTime System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field RetractionDelay System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field RotationLimits Microsoft.Xna.Framework.Vector2
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field SpringStiffnessLowSkill System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field SpringStiffnessHighSkill System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field SpringDampingLowSkill System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field SpringDampingHighSkill System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field RotationSpeedLowSkill System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field RotationSpeedHighSkill System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field HudTint Microsoft.Xna.Framework.Color
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field AutoOperate System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field AllowAutoOperateWithWiring System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field RandomAimAmount System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field RandomAimMinTime System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field RandomAimMaxTime System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field RandomMovement System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field AimDelay System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field TargetCharacters System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field TargetMonsters System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field TargetHumans System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field TargetSubmarines System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field TargetItems System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field FriendlyTag Barotrauma.Identifier
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field FriendlyTeamType Barotrauma.Items.Components.Turret.TeamType
_G['Components']['Turret'] = {}

---`Method Public Instance Virtual`
---@param amount Microsoft.Xna.Framework.Vector2
---@param ignoreContacts? System.Boolean
_G['Components']['Turret'].Move = function(amount, ignoreContacts) end

---`Method Public Instance Virtual`
---@param deltaTime System.Single
---@param cam Barotrauma.Camera
_G['Components']['Turret'].UpdateBroken = function(deltaTime, cam) end

---`Method Public Instance Virtual`
---@param deltaTime System.Single
_G['Components']['Turret'].UpdateEditing = function(deltaTime) end

---`Method Public Instance Virtual`
---@param character Barotrauma.Character
---@param deltaTime System.Single
---@param cam Barotrauma.Camera
_G['Components']['Turret'].UpdateHUDComponentSpecific = function(character, deltaTime, cam) end

---`Method Public Instance`
---@return Microsoft.Xna.Framework.Vector2
_G['Components']['Turret'].GetRecoilOffset = function() end

---`Method Public Instance Virtual`
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
---@param editing? System.Boolean
---@param itemDepth? System.Single
---@param overrideColor? System.Nullable*1Microsoft*Xna*Framework*Color
_G['Components']['Turret'].Draw = function(spriteBatch, editing, itemDepth, overrideColor) end

---`Method Private Static`
---@param currentRotation System.Single
---@param newRotation System.Single
---@param rangeLockedRotation System.Single-ref
_G['Components']['Turret'].AngleWrapAdjustment = function(currentRotation, newRotation, rangeLockedRotation) end

---`Method Private Static`
---@param rotation System.Single
---@param newRotation System.Single
---@return System.Boolean
_G['Components']['Turret'].DetectAngleWrapAround = function(rotation, newRotation) end

---`Method Public Instance`
---@return Microsoft.Xna.Framework.Vector2
_G['Components']['Turret'].GetDrawPos = function() end

---`Method Private Instance`
---@param id System.String
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
---@param size? System.Int32
---@param thickness? System.Single
---@param initMethod? (System.Action*1Barotrauma*Widget)|(fun(obj:Barotrauma.Widget))
---@return Barotrauma.Widget
_G['Components']['Turret'].GetWidget = function(id, spriteBatch, size, thickness, initMethod) end

---`Method Private Instance`
---@param availableCharge System.Single-ref
---@param availableCapacity System.Single-ref
_G['Components']['Turret'].GetAvailablePower = function(availableCharge, availableCapacity) end

---`Method Private Instance`
---@param drawPosition Microsoft.Xna.Framework.Vector2
---@return System.Single
_G['Components']['Turret'].GetRotationAngle = function(drawPosition) end

---`Method Public Instance Virtual`
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
---@param character Barotrauma.Character
_G['Components']['Turret'].DrawHUD = function(spriteBatch, character) end

---`Method Public Instance Virtual`
---@param msg Barotrauma.Networking.IReadMessage
---@param sendingTime System.Single
_G['Components']['Turret'].ClientEventRead = function(msg, sendingTime) end

---`Method Private Instance`
---@param element Barotrauma.ContentXElement
_G['Components']['Turret'].InitProjSpecific = function(element) end

---`Method Private Instance`
_G['Components']['Turret'].UpdateTransformedBarrelPos = function() end

---`Method Public Instance Virtual`
_G['Components']['Turret'].OnMapLoaded = function() end

---`Method Private Instance`
_G['Components']['Turret'].FindLightComponents = function() end

---`Method Public Instance Virtual`
---@param deltaTime System.Single
---@param cam Barotrauma.Camera
_G['Components']['Turret'].Update = function(deltaTime, cam) end

---`Method Public Instance`
_G['Components']['Turret'].UpdateLightComponents = function() end

---`Method Private Instance`
---@param deltaTime System.Single
_G['Components']['Turret'].UpdateProjSpecific = function(deltaTime) end

---`Method Public Instance Virtual`
---@param deltaTime System.Single
---@param character? Barotrauma.Character
---@return System.Boolean
_G['Components']['Turret'].Use = function(deltaTime, character) end

---`Method Public Instance`
---@return System.Single
_G['Components']['Turret'].GetPowerRequiredToShoot = function() end

---`Method Public Instance`
---@return System.Boolean
_G['Components']['Turret'].HasPowerToShoot = function() end

---`Method Private Instance`
---@return Microsoft.Xna.Framework.Vector2
_G['Components']['Turret'].GetBarrelDir = function() end

---`Method Private Instance`
---@param deltaTime System.Single
---@param character? Barotrauma.Character
---@param ignorePower? System.Boolean
---@return System.Boolean
_G['Components']['Turret'].TryLaunch = function(deltaTime, character, ignorePower) end

---`Method Private Instance`
---@param projectile Barotrauma.Item
---@param user? Barotrauma.Character
---@param launchRotation? System.Nullable*1System*Single
---@param tinkeringStrength? System.Single
_G['Components']['Turret'].Launch = function(projectile, user, launchRotation, tinkeringStrength) end

---`Method Private Instance`
---@param projectile Barotrauma.Items.Components.Projectile
_G['Components']['Turret'].TryDetermineProjectileSpeed = function(projectile) end

---`Method Private Instance`
_G['Components']['Turret'].LaunchProjSpecific = function() end

---`Method Private Static`
---@param container Barotrauma.Items.Components.ItemContainer
_G['Components']['Turret'].ShiftItemsInProjectileContainer = function(container) end

---`Method Private Instance`
---@return System.Single
_G['Components']['Turret'].GetTargetPriorityModifier = function() end

---`Method Public Instance`
---@param deltaTime System.Single
---@param ignorePower System.Boolean
---@param friendlyTag? Barotrauma.Identifier
_G['Components']['Turret'].UpdateAutoOperate = function(deltaTime, ignorePower, friendlyTag) end

---`Method Public Instance Virtual`
---@param deltaTime System.Single
---@param character Barotrauma.Character
---@param objective Barotrauma.AIObjectiveOperateItem
---@return System.Boolean
_G['Components']['Turret'].CrewAIOperate = function(deltaTime, character, objective) end

---`Method Private Instance`
---@param targetPos Microsoft.Xna.Framework.Vector2
---@return System.Boolean
_G['Components']['Turret'].IsPointingTowards = function(targetPos) end

---`Method Private Instance`
---@param target Barotrauma.Item
---@param sqrDist System.Single
---@return System.Boolean
_G['Components']['Turret'].IsTargetItemCloseEnough = function(target, sqrDist) end

---`Method Public Instance Virtual`
---@param conn? Barotrauma.Items.Components.Connection
---@return System.Single
_G['Components']['Turret'].GetCurrentPowerConsumption = function(conn) end

---`Method Private Static`
---@param target Barotrauma.ISpatialEntity
---@return System.Boolean
_G['Components']['Turret'].IsValidTarget = function(target) end

---`Method Private Instance`
---@return Barotrauma.CharacterTeamType
_G['Components']['Turret'].GetFriendlyTeam = function() end

---`Method Private Instance`
---@param target Barotrauma.Character
---@param friendlyTag Barotrauma.Identifier
---@return System.Boolean
_G['Components']['Turret'].IsValidTargetForAutoOperate = function(target, friendlyTag) end

---`Method Private Instance`
---@param targetBody FarseerPhysics.Dynamics.Body
---@param user? Barotrauma.Character
---@param friendlyTag? Barotrauma.Identifier
---@param targetSubmarines? System.Boolean
---@param allowShootingIfNothingInWay? System.Boolean
---@return System.Boolean
_G['Components']['Turret'].CanShoot = function(targetBody, user, friendlyTag, targetSubmarines, allowShootingIfNothingInWay) end

---`Method Private Instance`
---@param start Microsoft.Xna.Framework.Vector2
---@param luaKey__end Microsoft.Xna.Framework.Vector2
---@return FarseerPhysics.Dynamics.Body
_G['Components']['Turret'].CheckLineOfSight = function(start, luaKey__end) end

---`Method Private Instance`
---@param useOffset? System.Boolean
---@return Microsoft.Xna.Framework.Vector2
_G['Components']['Turret'].GetRelativeFiringPosition = function(useOffset) end

---`Method Private Instance`
---@param angle System.Single
---@return System.Boolean
_G['Components']['Turret'].IsWithinAimingRadius = function(angle) end

---`Method Public Instance`
---@param target Microsoft.Xna.Framework.Vector2
---@return System.Boolean
_G['Components']['Turret'].IsWithinAimingRadius = function(target) end

---`Method NonPublic Instance Virtual`
_G['Components']['Turret'].RemoveComponentSpecific = function() end

---`Method Private Instance`
---@return (System.Collections.Generic.List*1Barotrauma*Items*Components*Projectile)|(Barotrauma.Items.Components.Projectile[])
_G['Components']['Turret'].GetLoadedProjectiles = function() end

---`Method Private Static`
---@param projectileContainer Barotrauma.Item
---@param projectiles (System.Collections.Generic.List*1Barotrauma*Items*Components*Projectile)|(Barotrauma.Items.Components.Projectile[])
---@param stopSearching System.Boolean-ref
_G['Components']['Turret'].CheckProjectileContainer = function(projectileContainer, projectiles, stopSearching) end

---`Method Public Instance Virtual`
---@param relativeToSub System.Boolean
_G['Components']['Turret'].FlipX = function(relativeToSub) end

---`Method Public Instance Virtual`
---@param relativeToSub System.Boolean
_G['Components']['Turret'].FlipY = function(relativeToSub) end

---`Method Public Instance Virtual`
---@param signal Barotrauma.Items.Components.Signal
---@param connection Barotrauma.Items.Components.Connection
_G['Components']['Turret'].ReceiveSignal = function(signal, connection) end

---`Method Public Instance Virtual`
---@param componentElement Barotrauma.ContentXElement
---@param usePrefabValues System.Boolean
---@param idRemap Barotrauma.IdRemap
---@param isItemSwap System.Boolean
_G['Components']['Turret'].Load = function(componentElement, usePrefabValues, idRemap, isItemSwap) end

---`Method Public Instance Virtual`
_G['Components']['Turret'].OnItemLoaded = function() end

---`Method Public Instance`
---@param msg Barotrauma.Networking.IWriteMessage
---@param c Barotrauma.Networking.Client
---@param extraData? Barotrauma.Networking.NetEntityEvent.IData
_G['Components']['Turret'].ServerEventWrite = function(msg, c, extraData) end

---`Constructor Public Instance`
---@param item Barotrauma.Item
---@param element Barotrauma.ContentXElement
---@return Barotrauma.Items.Components.Turret
_G['Components']['Turret'] = function(item, element) end

---`Constructor Public Instance`
---@param item Barotrauma.Item
---@param element Barotrauma.ContentXElement
---@return Barotrauma.Items.Components.Turret
_G['Components']['Turret'].__new = function(item, element) end

