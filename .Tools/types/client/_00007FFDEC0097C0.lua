---@meta
---@class Barotrauma.Explosion : System.Object
---`Field Public Instance`
---@field Attack Barotrauma.Attack
---`Field Private Instance`
---@field force System.Single
---`Field Private Instance`
---@field screenColor Microsoft.Xna.Framework.Color
---`Field Private Instance`
---@field screenColorRange System.Single
---`Field Private Instance`
---@field screenColorDuration System.Single
---`Field Private Instance`
---@field sparks System.Boolean
---`Field Private Instance`
---@field shockwave System.Boolean
---`Field Private Instance`
---@field flames System.Boolean
---`Field Private Instance`
---@field smoke System.Boolean
---`Field Private Instance`
---@field flash System.Boolean
---`Field Private Instance`
---@field debris System.Boolean
---`Field Private Instance`
---@field underwaterBubble System.Boolean
---`Field Private Instance`
---@field flashColor Microsoft.Xna.Framework.Color
---`Field Private Instance`
---@field playTinnitus System.Boolean
---`Field Private Instance`
---@field applyFireEffects System.Boolean
---`Field Private Instance`
---@field ignoreFireEffectsForTags (Barotrauma.Identifier-arr)|(Barotrauma.Identifier[])
---`Field Public Instance`
---@field IgnoredCover (System.Collections.Generic.IEnumerable*1Barotrauma*Structure)|(fun():(Barotrauma.Structure))
---`Field Private Instance`
---@field flashDuration System.Single
---`Field Private Instance`
---@field flashRange System.Nullable*1System*Single
---`Field Private Instance`
---@field decal System.String
---`Field Private Instance`
---@field decalSize System.Single
---`Field Public Instance`
---@field OnlyInside System.Boolean
---`Field Public Instance`
---@field OnlyOutside System.Boolean
---`Field Public Instance`
---@field PlayDamageSounds System.Boolean
---`Field Private Instance`
---@field itemRepairStrength System.Single
---`Field Public Instance`
---@field IgnoredSubmarines (System.Collections.Generic.HashSet*1Barotrauma*Submarine)|(Barotrauma.Submarine[])
---`Field Public Instance`
---@field IgnoredCharacters (System.Collections.Generic.HashSet*1Barotrauma*Character)|(Barotrauma.Character[])
---`Field Private Static`
---@field damagedStructures (System.Collections.Generic.Dictionary*1Barotrauma*Structure*1System*Single)|({[Barotrauma.Structure]:(System.Single)})
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field CameraShake System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field CameraShakeRange System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field IgnoreCover System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field DistanceFalloff System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field EmpStrength System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field BallastFloraDamage System.Single
_G['Explosion'] = {}

---`Method Private Static`
---@param particlePos Microsoft.Xna.Framework.Vector2
---@param hull Barotrauma.Hull
---@param particlePrefab Barotrauma.Particles.ParticlePrefab
---@return Microsoft.Xna.Framework.Vector2
_G['Explosion'].ClampParticlePos = function(particlePos, hull, particlePrefab) end

---`Method Private Instance`
---@param light Barotrauma.Lights.LightSource
---@return (System.Collections.Generic.IEnumerable*1Barotrauma*CoroutineStatus)|(fun():(Barotrauma.CoroutineStatus))
_G['Explosion'].DimLight = function(light) end

---`Method Public Instance`
_G['Explosion'].DisableParticles = function() end

---`Method Public Instance`
---@param worldPosition Microsoft.Xna.Framework.Vector2
---@param damageSource Barotrauma.Entity
---@param attacker? Barotrauma.Character
_G['Explosion'].Explode = function(worldPosition, damageSource, attacker) end

---`Method Private Instance`
---@param worldPosition Microsoft.Xna.Framework.Vector2
---@param hull Barotrauma.Hull
_G['Explosion'].ExplodeProjSpecific = function(worldPosition, hull) end

---`Method Private Instance`
---@param worldPosition Microsoft.Xna.Framework.Vector2
---@param attack Barotrauma.Attack
---@param force System.Single
---@param damageSource Barotrauma.Entity
---@param attacker Barotrauma.Character
_G['Explosion'].DamageCharacters = function(worldPosition, attack, force, damageSource, attacker) end

---`Method Public Static`
---@param worldPosition Microsoft.Xna.Framework.Vector2
---@param worldRange System.Single
---@param damage System.Single
---@param levelWallDamage System.Single
---@param attacker? Barotrauma.Character
---@param ignoredSubmarines? (System.Collections.Generic.IEnumerable*1Barotrauma*Submarine)|(fun():(Barotrauma.Submarine))
---@param emitWallDamageParticles? System.Boolean
---@param createWallDamageProjectiles? System.Boolean
---@param distanceFalloff? System.Boolean
---@return (System.Collections.Generic.Dictionary*1Barotrauma*Structure*1System*Single)|({[Barotrauma.Structure]:(System.Single)})
_G['Explosion'].RangedStructureDamage = function(worldPosition, worldRange, damage, levelWallDamage, attacker, ignoredSubmarines, emitWallDamageParticles, createWallDamageProjectiles, distanceFalloff) end

---`Method Public Static`
---@param worldPosition Microsoft.Xna.Framework.Vector2
---@param worldRange System.Single
---@param damage System.Single
---@param attacker? Barotrauma.Character
---@param distanceFalloff? System.Boolean
_G['Explosion'].RangedBallastFloraDamage = function(worldPosition, worldRange, damage, attacker, distanceFalloff) end

---`Method Private Static`
---@param explosionSimPos Microsoft.Xna.Framework.Vector2
---@param explosionWorldPos Microsoft.Xna.Framework.Vector2
---@param targetSimPos Microsoft.Xna.Framework.Vector2
---@param ignoredCover? (System.Collections.Generic.IEnumerable*1Barotrauma*Structure)|(fun():(Barotrauma.Structure))
---@return System.Single
_G['Explosion'].GetObstacleDamageMultiplier = function(explosionSimPos, explosionWorldPos, targetSimPos, ignoredCover) end

---`Method Private Static`
---@param volume System.Single
_G['Explosion'].PlayTinnitusProjSpecific = function(volume) end

---`Constructor Public Instance`
---@overload fun(range:System.Single, force:System.Single, damage:System.Single, structureDamage:System.Single, itemDamage:System.Single, empStrength?:System.Single, ballastFloraStrength?:System.Single):Barotrauma.Explosion
---@overload fun(element:Barotrauma.ContentXElement, parentDebugName:System.String):Barotrauma.Explosion
---@return Barotrauma.Explosion
_G['Explosion'] = function() end

---`Constructor Public Instance`
---@overload fun(range:System.Single, force:System.Single, damage:System.Single, structureDamage:System.Single, itemDamage:System.Single, empStrength?:System.Single, ballastFloraStrength?:System.Single):Barotrauma.Explosion
---@overload fun(element:Barotrauma.ContentXElement, parentDebugName:System.String):Barotrauma.Explosion
---@return Barotrauma.Explosion
_G['Explosion'].__new = function() end

---`Constructor Private Static`
---@overload fun(range:System.Single, force:System.Single, damage:System.Single, structureDamage:System.Single, itemDamage:System.Single, empStrength?:System.Single, ballastFloraStrength?:System.Single):Barotrauma.Explosion
---@overload fun(element:Barotrauma.ContentXElement, parentDebugName:System.String):Barotrauma.Explosion
---@return Barotrauma.Explosion
_G['Explosion'] = function() end

---`Constructor Private Static`
---@overload fun(range:System.Single, force:System.Single, damage:System.Single, structureDamage:System.Single, itemDamage:System.Single, empStrength?:System.Single, ballastFloraStrength?:System.Single):Barotrauma.Explosion
---@overload fun(element:Barotrauma.ContentXElement, parentDebugName:System.String):Barotrauma.Explosion
---@return Barotrauma.Explosion
_G['Explosion'].__new = function() end

