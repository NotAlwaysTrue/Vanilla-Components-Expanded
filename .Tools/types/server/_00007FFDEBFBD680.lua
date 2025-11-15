---@meta
---@class Barotrauma.DamageModifier : System.Object
---`Field Private Instance`
---@field rawAfflictionIdentifierString System.String
---`Field Private Instance`
---@field rawAfflictionTypeString System.String
---`Field Private Instance`
---@field parsedAfflictionIdentifiers (System.Collections.Immutable.ImmutableArray*1Barotrauma*Identifier)|(Barotrauma.Identifier[])
---`Field Private Instance`
---@field parsedAfflictionTypes (System.Collections.Immutable.ImmutableArray*1Barotrauma*Identifier)|(Barotrauma.Identifier[])
---`Getter Public Instance Virtual`
---@field Name System.String
---`Getter Public Instance Virtual`
---<br/>`Setter Private Instance`
---@field SerializableProperties (System.Collections.Generic.Dictionary*1Barotrauma*Identifier*1Barotrauma*SerializableProperty)|({[Barotrauma.Identifier]:(Barotrauma.SerializableProperty)})
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field DamageMultiplier System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field ProbabilityMultiplier System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field ArmorSector Microsoft.Xna.Framework.Vector2
---`Getter Public Instance`
---@field ArmorSectorInRadians Microsoft.Xna.Framework.Vector2
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field DeflectProjectiles System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field AfflictionIdentifiers System.String
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field AfflictionTypes System.String
---`Getter Public Instance`
---@field ParsedAfflictionIdentifiers System.Collections.Immutable.ImmutableArray
---`Getter Public Instance`
---@field ParsedAfflictionTypes System.Collections.Immutable.ImmutableArray
_G['DamageModifier'] = {}

---`Method Public Instance`
---@overload fun(identifier:System.String):(System.Boolean)
---@param identifier Barotrauma.Identifier
---@return System.Boolean
_G['DamageModifier'].MatchesAfflictionIdentifier = function(identifier) end

---`Method Public Instance`
---@overload fun(type:System.String):(System.Boolean)
---@param type Barotrauma.Identifier
---@return System.Boolean
_G['DamageModifier'].MatchesAfflictionType = function(type) end

---`Method Public Instance`
---@overload fun(identifier:System.String, type:System.String):(System.Boolean)
---@overload fun(identifier:Barotrauma.Identifier, type:Barotrauma.Identifier):(System.Boolean)
---@param affliction Barotrauma.Affliction
---@return System.Boolean
_G['DamageModifier'].MatchesAffliction = function(affliction) end

---`Method Public Instance`
---@param element System.Xml.Linq.XElement
_G['DamageModifier'].Serialize = function(element) end

---`Method Public Instance`
---@param element System.Xml.Linq.XElement
_G['DamageModifier'].Deserialize = function(element) end

---`Constructor Public Instance`
---@param element Barotrauma.ContentXElement
---@param parentDebugName System.String
---@param checkErrors? System.Boolean
---@return Barotrauma.DamageModifier
_G['DamageModifier'] = function(element, parentDebugName, checkErrors) end

---`Constructor Public Instance`
---@param element Barotrauma.ContentXElement
---@param parentDebugName System.String
---@param checkErrors? System.Boolean
---@return Barotrauma.DamageModifier
_G['DamageModifier'].__new = function(element, parentDebugName, checkErrors) end

