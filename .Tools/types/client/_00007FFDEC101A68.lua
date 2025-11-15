---@meta
---@class Barotrauma.Items.Components.Sprayer : Barotrauma.Items.Components.RangedWeapon
---`Field Private Instance`
---@field debugRayStartPos Microsoft.Xna.Framework.Vector2
---`Field Private Instance`
---@field debugRayEndPos Microsoft.Xna.Framework.Vector2
---`Field Private Instance`
---@field particleEmitters (System.Collections.Generic.List*1Barotrauma*Particles*ParticleEmitter)|(Barotrauma.Particles.ParticleEmitter[])
---`Field Private Instance`
---@field targetHull Barotrauma.Hull
---`Field Private Instance`
---@field rayStartWorldPosition Microsoft.Xna.Framework.Vector2
---`Field Private Instance`
---@field color Microsoft.Xna.Framework.Color
---`Field Private Instance`
---@field targetSections (System.Collections.Generic.List*1Barotrauma*BackgroundSection)|(Barotrauma.BackgroundSection[])
---`Field Private Instance`
---@field spraySetting System.Int32
---`Field Private Instance`
---@field sprayArray (Microsoft.Xna.Framework.Point-arr)|(Microsoft.Xna.Framework.Point[])
---`Field Private Instance`
---@field liquidColors (System.Collections.Generic.Dictionary*1Barotrauma*Identifier*1Microsoft*Xna*Framework*Color)|({[Barotrauma.Identifier]:(Microsoft.Xna.Framework.Color)})
---`Field Private Instance`
---@field liquidContainer Barotrauma.Items.Components.ItemContainer
---`Getter Public Instance Virtual`
---@field DrawSize Microsoft.Xna.Framework.Vector2
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Range System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field SprayStrength System.Single
_G['Components']['Sprayer'] = {}

---`Method Public Instance Virtual`
---@param character Barotrauma.Character
---@param deltaTime System.Single
---@param cam Barotrauma.Camera
_G['Components']['Sprayer'].UpdateHUDComponentSpecific = function(character, deltaTime, cam) end

---`Method Public Instance Virtual`
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
---@param character Barotrauma.Character
_G['Components']['Sprayer'].DrawHUD = function(spriteBatch, character) end

---`Method Public Instance Virtual`
---@param deltaTime System.Single
---@param character? Barotrauma.Character
---@return System.Boolean
_G['Components']['Sprayer'].Use = function(deltaTime, character) end

---`Method Public Instance`
---@param user Barotrauma.Character
---@param deltaTime System.Single
---@param applyColors System.Boolean
_G['Components']['Sprayer'].Spray = function(user, deltaTime, applyColors) end

---`Method Public Instance Virtual`
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
---@param editing System.Boolean
---@param itemDepth? System.Single
---@param overrideColor? System.Nullable*1Microsoft*Xna*Framework*Color
_G['Components']['Sprayer'].Draw = function(spriteBatch, editing, itemDepth, overrideColor) end

---`Method Public Instance Virtual`
_G['Components']['Sprayer'].OnItemLoaded = function() end

---`Method Private Instance`
---@param element Barotrauma.ContentXElement
_G['Components']['Sprayer'].InitProjSpecific = function(element) end

---`Constructor Public Instance`
---@param item Barotrauma.Item
---@param element Barotrauma.ContentXElement
---@return Barotrauma.Items.Components.Sprayer
_G['Components']['Sprayer'] = function(item, element) end

---`Constructor Public Instance`
---@param item Barotrauma.Item
---@param element Barotrauma.ContentXElement
---@return Barotrauma.Items.Components.Sprayer
_G['Components']['Sprayer'].__new = function(item, element) end

