---@meta
---@class Barotrauma.MapEntityPrefab : Barotrauma.PrefabWithUintIdentifier
---`Field Private Instance`
---@field cachedAllowedUpgrades System.String
---`Field Private Instance`
---@field allowedUpgradeSet (System.Collections.Immutable.ImmutableHashSet*1Barotrauma*Identifier)|(Barotrauma.Identifier[])
---`Field NonPublic Static`
---@field placePosition Microsoft.Xna.Framework.Vector2
---`Getter Public Instance`
---@field IsModded System.Boolean
---`Getter Public Static`
---@field List (System.Collections.Generic.IEnumerable*1Barotrauma*MapEntityPrefab)|(fun():(Barotrauma.MapEntityPrefab))
---`Getter Public Static`
---<br/>`Setter Public Static`
---@field Selected Barotrauma.MapEntityPrefab
---`Getter Public Instance Abstract Virtual`
---@field Sprite Barotrauma.Sprite
---`Getter Public Instance Virtual`
---@field CanSpriteFlipX System.Boolean
---`Getter Public Instance Virtual`
---@field CanSpriteFlipY System.Boolean
---`Getter Public Instance Abstract Virtual`
---@field OriginalName System.String
---`Getter Public Instance Abstract Virtual`
---@field Name Barotrauma.LocalizedString
---`Getter Public Instance Abstract Virtual`
---@field Tags (System.Collections.Immutable.ImmutableHashSet*1Barotrauma*Identifier)|(Barotrauma.Identifier[])
---`Getter Public Instance Abstract Virtual`
---@field AllowedLinks (System.Collections.Immutable.ImmutableHashSet*1Barotrauma*Identifier)|(Barotrauma.Identifier[])
---`Getter Public Instance Abstract Virtual`
---@field Category Barotrauma.MapEntityCategory
---`Getter Public Instance Abstract Virtual`
---@field Aliases (System.Collections.Immutable.ImmutableHashSet*1System*String)|(System.String[])
---`Getter Public Instance`
---<br/>`Setter NonPublic Instance`
---@field ResizeHorizontal System.Boolean
---`Getter Public Instance`
---<br/>`Setter NonPublic Instance`
---@field ResizeVertical System.Boolean
---`Getter Public Instance`
---<br/>`Setter NonPublic Instance`
---@field Description Barotrauma.LocalizedString
---`Getter Public Instance`
---<br/>`Setter NonPublic Instance`
---@field AllowedUpgrades System.String
---`Getter Public Instance`
---<br/>`Setter NonPublic Instance`
---@field HideInMenus System.Boolean
---`Getter Public Instance`
---<br/>`Setter NonPublic Instance`
---@field HideInEditors System.Boolean
---`Getter Public Instance`
---<br/>`Setter NonPublic Instance`
---@field Subcategory System.String
---`Getter Public Instance`
---<br/>`Setter NonPublic Instance`
---@field Linkable System.Boolean
---`Getter Public Instance`
---<br/>`Setter NonPublic Instance`
---@field SpriteColor Microsoft.Xna.Framework.Color
---`Getter Public Instance`
---<br/>`Setter NonPublic Instance`
---@field Scale System.Single
_G['MapEntityPrefab'] = {}

---`Method Public Instance`
---@return Barotrauma.RichString
_G['MapEntityPrefab'].CreateTooltipText = function() end

---`Method Public Instance Virtual`
---@param cam Barotrauma.Camera
_G['MapEntityPrefab'].UpdatePlacing = function(cam) end

---`Method Public Instance Virtual`
---@overload fun(spriteBatch:Microsoft.Xna.Framework.Graphics.SpriteBatch, cam:Barotrauma.Camera)
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
---@param drawRect Microsoft.Xna.Framework.Rectangle
---@param scale? System.Single
---@param rotation? System.Single
---@param spriteEffects? Microsoft.Xna.Framework.Graphics.SpriteEffects
_G['MapEntityPrefab'].DrawPlacing = function(spriteBatch, drawRect, scale, rotation, spriteEffects) end

---`Method Public Instance`
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
---@param pos Microsoft.Xna.Framework.Vector2
---@param color Microsoft.Xna.Framework.Color
_G['MapEntityPrefab'].DrawListLine = function(spriteBatch, pos, color) end

---`Method Public Static`
---@param selection System.Object
---@return System.Boolean
_G['MapEntityPrefab'].SelectPrefab = function(selection) end

---`Method Public Static`
---@return System.Object
_G['MapEntityPrefab'].GetSelected = function() end

---`Method Public Static`
---@overload fun(name:System.String, identifier?:System.String, showErrorMessages?:System.Boolean):(Barotrauma.MapEntityPrefab)
---@overload fun(name:System.String, identifier:Barotrauma.Identifier, showErrorMessages?:System.Boolean):(Barotrauma.MapEntityPrefab)
---@param predicate (System.Predicate*1Barotrauma*MapEntityPrefab)|(fun(obj:Barotrauma.MapEntityPrefab):(System.Boolean))
---@return Barotrauma.MapEntityPrefab
_G['MapEntityPrefab'].Find = function(predicate) end

---`Method Public Static`
---@param predicate (System.Predicate*1Barotrauma*MapEntityPrefab)|(fun(obj:Barotrauma.MapEntityPrefab):(System.Boolean))
---@param sync Barotrauma.Rand.RandSync
---@return Barotrauma.MapEntityPrefab
_G['MapEntityPrefab'].GetRandom = function(predicate, sync) end

---`Method Public Static`
---@param name System.String
---@return Barotrauma.MapEntityPrefab
_G['MapEntityPrefab'].FindByName = function(name) end

---`Method Public Static`
---@param identifier Barotrauma.Identifier
---@return Barotrauma.MapEntityPrefab
_G['MapEntityPrefab'].FindByIdentifier = function(identifier) end

---`Method Public Instance`
---@return System.String
_G['MapEntityPrefab'].GetItemNameTextId = function() end

---`Method Public Instance`
---@return System.String
_G['MapEntityPrefab'].GetHullNameTextId = function() end

---`Method Public Instance`
---@return (System.Collections.Generic.IEnumerable*1Barotrauma*Identifier)|(fun():(Barotrauma.Identifier))
_G['MapEntityPrefab'].GetAllowedUpgrades = function() end

---`Method Public Instance`
---@param subcategory System.String
---@return System.Boolean
_G['MapEntityPrefab'].HasSubCategory = function(subcategory) end

---`Method NonPublic Instance Abstract Virtual`
---@param rect Microsoft.Xna.Framework.Rectangle
_G['MapEntityPrefab'].CreateInstance = function(rect) end

---`Method Public Instance`
_G['MapEntityPrefab'].DebugCreateInstance = function() end

---`Method Public Instance`
---@overload fun(name:System.String, comparisonType:System.StringComparison):(System.Boolean)
---@param allowedNames (System.Collections.Generic.IEnumerable*1System*String)|(fun():(System.String))
---@param comparisonType System.StringComparison
---@return System.Boolean
_G['MapEntityPrefab'].NameMatches = function(allowedNames, comparisonType) end

---`Method Public Instance`
---@param target Barotrauma.MapEntityPrefab
---@return System.Boolean
_G['MapEntityPrefab'].IsLinkAllowed = function(target) end

---`Method NonPublic Instance`
---@param element Barotrauma.ContentXElement
_G['MapEntityPrefab'].LoadDescription = function(element) end

---`Constructor NonPublic Instance`
---@overload fun(identifier:Barotrauma.Identifier):Barotrauma.MapEntityPrefab
---@param element Barotrauma.ContentXElement
---@param file Barotrauma.ContentFile
---@return Barotrauma.MapEntityPrefab
_G['MapEntityPrefab'] = function(element, file) end

---`Constructor NonPublic Instance`
---@overload fun(identifier:Barotrauma.Identifier):Barotrauma.MapEntityPrefab
---@param element Barotrauma.ContentXElement
---@param file Barotrauma.ContentFile
---@return Barotrauma.MapEntityPrefab
_G['MapEntityPrefab'].__new = function(element, file) end

---`Constructor Public Instance`
---@overload fun(identifier:Barotrauma.Identifier):Barotrauma.MapEntityPrefab
---@param element Barotrauma.ContentXElement
---@param file Barotrauma.ContentFile
---@return Barotrauma.MapEntityPrefab
_G['MapEntityPrefab'] = function(element, file) end

---`Constructor Public Instance`
---@overload fun(identifier:Barotrauma.Identifier):Barotrauma.MapEntityPrefab
---@param element Barotrauma.ContentXElement
---@param file Barotrauma.ContentFile
---@return Barotrauma.MapEntityPrefab
_G['MapEntityPrefab'].__new = function(element, file) end

