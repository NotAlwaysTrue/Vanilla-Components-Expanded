---@meta
---@class Barotrauma.AITarget : System.Object
---`Field Private Instance`
---@field entity Barotrauma.Entity
---`Field Private Instance`
---@field soundRange System.Single
---`Field Private Instance`
---@field sightRange System.Single
---`Field Private Instance`
---@field sectorRad System.Single
---`Field Private Instance`
---@field sectorDir Microsoft.Xna.Framework.Vector2
---`Field Public Instance`
---@field SonarLabel Barotrauma.LocalizedString
---`Field Public Instance`
---@field SonarIconIdentifier Barotrauma.Identifier
---`Field Private Instance`
---@field inDetectable System.Boolean
---`Field Public Instance`
---@field InDetectableSetTime System.Double
---`Field Public Instance`
---@field MinSoundRange System.Single
---`Field Public Instance`
---@field MinSightRange System.Single
---`Field Public Instance`
---@field MaxSoundRange System.Single
---`Field Public Instance`
---@field MaxSightRange System.Single
---`Field Public Static`
---@field List (System.Collections.Generic.List*1Barotrauma*AITarget)|(Barotrauma.AITarget[])
---`Getter Public Instance`
---@field Entity Barotrauma.Entity
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field FadeOutTime System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field Static System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field StaticSound System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field StaticSight System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field SoundRange System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field SightRange System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field SectorDegrees System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field SectorDir Microsoft.Xna.Framework.Vector2
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field SonarDisruption System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field InDetectable System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field NeedsUpdate System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field Type Barotrauma.AITarget.TargetType
---`Getter Public Instance`
---@field WorldPosition Microsoft.Xna.Framework.Vector2
---`Getter Public Instance`
---@field SimPosition Microsoft.Xna.Framework.Vector2
_G['AITarget'] = {}

---`Method Public Instance`
---@return System.Boolean
_G['AITarget'].ShouldBeIgnored = function() end

---`Method Public Instance`
---@param deltaTime System.Single
_G['AITarget'].Update = function(deltaTime) end

---`Method Public Instance`
---@param deltaTime System.Single
---@param speed? System.Single
_G['AITarget'].IncreaseSoundRange = function(deltaTime, speed) end

---`Method Public Instance`
---@param deltaTime System.Single
---@param speed? System.Single
_G['AITarget'].IncreaseSightRange = function(deltaTime, speed) end

---`Method Public Instance`
---@param deltaTime System.Single
---@param speed? System.Single
_G['AITarget'].DecreaseSoundRange = function(deltaTime, speed) end

---`Method Public Instance`
---@param deltaTime System.Single
---@param speed? System.Single
_G['AITarget'].DecreaseSightRange = function(deltaTime, speed) end

---`Method Public Instance`
---@return System.Boolean
_G['AITarget'].HasSector = function() end

---`Method Public Instance`
---@param worldPosition Microsoft.Xna.Framework.Vector2
---@return System.Boolean
_G['AITarget'].IsWithinSector = function(worldPosition) end

---`Method Public Instance`
_G['AITarget'].Remove = function() end

---`Method Public Instance`
_G['AITarget'].Reset = function() end

---`Constructor Public Instance`
---@overload fun(e:Barotrauma.Entity, element:System.Xml.Linq.XElement):Barotrauma.AITarget
---@overload fun(e:Barotrauma.Entity):Barotrauma.AITarget
---@return Barotrauma.AITarget
_G['AITarget'] = function() end

---`Constructor Public Instance`
---@overload fun(e:Barotrauma.Entity, element:System.Xml.Linq.XElement):Barotrauma.AITarget
---@overload fun(e:Barotrauma.Entity):Barotrauma.AITarget
---@return Barotrauma.AITarget
_G['AITarget'].__new = function() end

---`Constructor Private Static`
---@overload fun(e:Barotrauma.Entity, element:System.Xml.Linq.XElement):Barotrauma.AITarget
---@overload fun(e:Barotrauma.Entity):Barotrauma.AITarget
---@return Barotrauma.AITarget
_G['AITarget'] = function() end

---`Constructor Private Static`
---@overload fun(e:Barotrauma.Entity, element:System.Xml.Linq.XElement):Barotrauma.AITarget
---@overload fun(e:Barotrauma.Entity):Barotrauma.AITarget
---@return Barotrauma.AITarget
_G['AITarget'].__new = function() end

