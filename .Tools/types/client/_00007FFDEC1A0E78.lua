---@meta
---@class Barotrauma.Particles.Particle : System.Object
---`Field Private Instance`
---@field prefab Barotrauma.Particles.ParticlePrefab
---`Field Private Instance`
---@field debugName System.String
---`Field Public Instance`
---@field OnChangeHull (Barotrauma.Particles.Particle.OnChangeHullHandler)|(fun(position:Microsoft.Xna.Framework.Vector2, currentHull:Barotrauma.Hull))
---`Field Public Instance`
---@field OnCollision (Barotrauma.Particles.Particle.OnChangeHullHandler)|(fun(position:Microsoft.Xna.Framework.Vector2, currentHull:Barotrauma.Hull))
---`Field Private Instance`
---@field position Microsoft.Xna.Framework.Vector2
---`Field Private Instance`
---@field prevPosition Microsoft.Xna.Framework.Vector2
---`Field Private Instance`
---@field velocity Microsoft.Xna.Framework.Vector2
---`Field Private Instance`
---@field rotation System.Single
---`Field Private Instance`
---@field prevRotation System.Single
---`Field Private Instance`
---@field angularVelocity System.Single
---`Field Private Instance`
---@field collisionIgnoreTimer System.Single
---`Field Private Instance`
---@field size Microsoft.Xna.Framework.Vector2
---`Field Private Instance`
---@field sizeChange Microsoft.Xna.Framework.Vector2
---`Field Private Instance`
---@field color Microsoft.Xna.Framework.Color
---`Field Private Instance`
---@field changeColor System.Boolean
---`Field Private Instance`
---@field UseMiddleColor System.Boolean
---`Field Private Instance`
---@field spriteIndex System.Int32
---`Field Private Instance`
---@field totalLifeTime System.Single
---`Field Private Instance`
---@field lifeTime System.Single
---`Field Private Instance`
---@field startDelay System.Single
---`Field Private Instance`
---@field velocityChange Microsoft.Xna.Framework.Vector2
---`Field Private Instance`
---@field velocityChangeWater Microsoft.Xna.Framework.Vector2
---`Field Private Instance`
---@field drawPosition Microsoft.Xna.Framework.Vector2
---`Field Private Instance`
---@field drawRotation System.Single
---`Field Private Instance`
---@field colliderRadius Microsoft.Xna.Framework.Vector2
---`Field Private Instance`
---@field currentHull Barotrauma.Hull
---`Field Private Instance`
---@field hullGaps (System.Collections.Generic.List*1Barotrauma*Gap)|(Barotrauma.Gap[])
---`Field Private Instance`
---@field hasSubEmitters System.Boolean
---`Field Private Instance`
---@field subEmitters (System.Collections.Generic.List*1Barotrauma*Particles*ParticleEmitter)|(Barotrauma.Particles.ParticleEmitter[])
---`Field Private Instance`
---@field animState System.Single
---`Field Private Instance`
---@field animFrame System.Int32
---`Field Private Instance`
---@field collisionUpdateTimer System.Single
---`Field Private Instance`
---@field changesSize System.Boolean
---`Field Public Instance`
---@field HighQualityCollisionDetection System.Boolean
---`Field Public Instance`
---@field ColorMultiplier Microsoft.Xna.Framework.Vector4
---`Field Public Instance`
---@field VelocityChangeMultiplier System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field DrawOrder Barotrauma.Particles.ParticleDrawOrder
---`Getter Public Instance`
---@field DrawTarget Barotrauma.Particles.ParticlePrefab.DrawTargetType
---`Getter Public Instance`
---@field BlendState Barotrauma.Particles.ParticleBlendState
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field StartDelay System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Size Microsoft.Xna.Framework.Vector2
---`Getter Public Instance`
---@field CurrentHull Barotrauma.Hull
---`Getter Public Instance`
---@field Prefab Barotrauma.Particles.ParticlePrefab
_G['Particle'] = {}

---`Method Public Instance Virtual`
---@return System.String
_G['Particle'].ToString = function() end

---`Method Public Instance`
---@param prefab Barotrauma.Particles.ParticlePrefab
---@param spawnPosition Microsoft.Xna.Framework.Vector2
---@param speed Microsoft.Xna.Framework.Vector2
---@param spawnRotation System.Single
---@param hullGuess? Barotrauma.Hull
---@param drawOrder? Barotrauma.Particles.ParticleDrawOrder
---@param collisionIgnoreTimer? System.Single
---@param lifeTimeMultiplier? System.Single
---@param tracerPoints? System.Tuple*1Microsoft*Xna*Framework*Vector2*1Microsoft*Xna*Framework*Vector2
_G['Particle'].Init = function(prefab, spawnPosition, speed, spawnRotation, hullGuess, drawOrder, collisionIgnoreTimer, lifeTimeMultiplier, tracerPoints) end

---`Method Public Instance`
---@param deltaTime System.Single
---@return Barotrauma.Particles.Particle.UpdateResult
_G['Particle'].Update = function(deltaTime) end

---`Method Private Instance`
---@return Barotrauma.Particles.Particle.UpdateResult
_G['Particle'].CollisionUpdate = function() end

---`Method Private Instance`
_G['Particle'].RefreshColliderSize = function() end

---`Method Private Instance`
---@param dragCoefficient System.Single
---@param deltaTime System.Single
_G['Particle'].ApplyDrag = function(dragCoefficient, deltaTime) end

---`Method Private Instance`
---@param prevHull Barotrauma.Hull
---@param collisionNormal Microsoft.Xna.Framework.Vector2
_G['Particle'].OnWallCollisionInside = function(prevHull, collisionNormal) end

---`Method Private Instance`
---@param collisionHull Barotrauma.Hull
_G['Particle'].OnWallCollisionOutside = function(collisionHull) end

---`Method Public Instance`
_G['Particle'].UpdateDrawPos = function() end

---`Method Public Instance`
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
_G['Particle'].Draw = function(spriteBatch) end

---`Constructor Public Instance`
---@return Barotrauma.Particles.Particle
_G['Particle'] = function() end

---`Constructor Public Instance`
---@return Barotrauma.Particles.Particle
_G['Particle'].__new = function() end

