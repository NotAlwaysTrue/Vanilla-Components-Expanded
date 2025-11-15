---@meta
---@class Barotrauma.Items.Components.Rope : Barotrauma.Items.Components.ItemComponent
---`Field Private Instance`
---@field sprite Barotrauma.Sprite
---`Field Private Instance`
---@field startSprite Barotrauma.Sprite
---`Field Private Instance`
---@field endSprite Barotrauma.Sprite
---`Field Private Instance`
---@field snapSound Barotrauma.RoundSound
---`Field Private Instance`
---@field reelSound Barotrauma.RoundSound
---`Field Private Instance`
---@field reelSoundChannel Barotrauma.Sounds.SoundChannel
---`Field Private Instance`
---@field _reelSoundPitchSlide Microsoft.Xna.Framework.Vector2
---`Field Private Instance`
---@field source Barotrauma.ISpatialEntity
---`Field Private Instance`
---@field target Barotrauma.Item
---`Field Private Instance`
---@field launchDir System.Nullable*1Microsoft*Xna*Framework*Vector2
---`Field Private Instance`
---@field currentRopeLength System.Single
---`Field Private Instance`
---@field snapTimer System.Single
---`Field Private Instance`
---@field raycastTimer System.Single
---`Field Private Instance`
---@field isReelingIn System.Boolean
---`Field Private Instance`
---@field snapped System.Boolean
---`Field Private Static`
---@field RayCastInterval System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field SpriteWidth System.Int32
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field SpriteColor Microsoft.Xna.Framework.Color
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Tile System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Origin Microsoft.Xna.Framework.Vector2
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field BreakFromMiddle System.Boolean
---`Getter Public Instance Virtual`
---@field DrawSize Microsoft.Xna.Framework.Vector2
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field ReelSoundPitchSlide Microsoft.Xna.Framework.Vector2
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field SnapAnimDuration System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field ProjectilePullForce System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field TargetPullForce System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field SourcePullForce System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field MaxLength System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field MinPullDistance System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field MaxAngle System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field SnapOnCollision System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field SnapWhenNotAimed System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field SnapWhenWeaponFiredAgain System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field BarrelLengthMultiplier System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field TargetMinMass System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field LerpForces System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field IncreaseForceForEscapingTargets System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Snapped System.Boolean
_G['Components']['Rope'] = {}

---`Method Public Instance Virtual`
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
---@param editing System.Boolean
---@param itemDepth? System.Single
---@param overrideColor? System.Nullable*1Microsoft*Xna*Framework*Color
_G['Components']['Rope'].Draw = function(spriteBatch, editing, itemDepth, overrideColor) end

---`Method Private Instance`
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
---@param startPos Microsoft.Xna.Framework.Vector2
---@param endPos Microsoft.Xna.Framework.Vector2
---@param width System.Int32
---@param overrideColor? System.Nullable*1Microsoft*Xna*Framework*Color
_G['Components']['Rope'].DrawRope = function(spriteBatch, startPos, endPos, width, overrideColor) end

---`Method Private Instance`
---@param sound Barotrauma.RoundSound
---@param position Microsoft.Xna.Framework.Vector2
_G['Components']['Rope'].PlaySound = function(sound, position) end

---`Method Public Instance Virtual`
---@param msg Barotrauma.Networking.IReadMessage
---@param sendingTime System.Single
_G['Components']['Rope'].ClientEventRead = function(msg, sendingTime) end

---`Method NonPublic Instance Virtual`
_G['Components']['Rope'].RemoveComponentSpecific = function() end

---`Method Private Instance`
---@param source Barotrauma.ISpatialEntity
_G['Components']['Rope'].SetSource = function(source) end

---`Method Private Instance`
_G['Components']['Rope'].ResetSource = function() end

---`Method Private Instance`
---@param element Barotrauma.ContentXElement
_G['Components']['Rope'].InitProjSpecific = function(element) end

---`Method Public Instance`
_G['Components']['Rope'].Snap = function() end

---`Method Public Instance`
---@param source Barotrauma.ISpatialEntity
---@param target Barotrauma.Item
_G['Components']['Rope'].Attach = function(source, target) end

---`Method Public Instance Virtual`
---@param deltaTime System.Single
---@param cam Barotrauma.Camera
_G['Components']['Rope'].Update = function(deltaTime, cam) end

---`Method Private Instance`
_G['Components']['Rope'].UpdateProjSpecific = function() end

---`Method Public Instance Virtual`
---@param deltaTime System.Single
---@param cam Barotrauma.Camera
_G['Components']['Rope'].UpdateBroken = function(deltaTime, cam) end

---`Method Private Instance`
---@param useDrawPosition? System.Boolean
---@return Microsoft.Xna.Framework.Vector2
_G['Components']['Rope'].GetSourcePos = function(useDrawPosition) end

---`Method Private Static`
---@param target Barotrauma.ISpatialEntity
---@return Barotrauma.PhysicsBody
_G['Components']['Rope'].GetBodyToPull = function(target) end

---`Constructor Public Instance`
---@param item Barotrauma.Item
---@param element Barotrauma.ContentXElement
---@return Barotrauma.Items.Components.Rope
_G['Components']['Rope'] = function(item, element) end

---`Constructor Public Instance`
---@param item Barotrauma.Item
---@param element Barotrauma.ContentXElement
---@return Barotrauma.Items.Components.Rope
_G['Components']['Rope'].__new = function(item, element) end

