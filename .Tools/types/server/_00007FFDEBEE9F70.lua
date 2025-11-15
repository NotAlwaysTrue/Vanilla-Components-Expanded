---@meta
---@class Barotrauma.LocationTypeChange : System.Object
---`Field Public Instance`
---@field CurrentType Barotrauma.Identifier
---`Field Public Instance`
---@field ChangeToType Barotrauma.Identifier
---`Field Public Instance`
---@field Probability System.Single
---`Field Public Instance`
---@field RequireDiscovered System.Boolean
---`Field Public Instance`
---@field Requirements (System.Collections.Generic.List*1Barotrauma*LocationTypeChange*Requirement)|(Barotrauma.LocationTypeChange.Requirement[])
---`Field Private Instance`
---@field requireChangeMessages System.Boolean
---`Field Private Instance`
---@field messageTag System.String
---`Field Public Instance`
---@field DisallowedAdjacentLocations (System.Collections.Immutable.ImmutableArray*1Barotrauma*Identifier)|(Barotrauma.Identifier[])
---`Field Public Instance`
---@field DisallowedProximity System.Int32
---`Field Public Instance`
---@field CooldownAfterChange System.Int32
---`Field Public Instance`
---@field RequiredDurationRange Microsoft.Xna.Framework.Point
_G['LocationTypeChange'] = {}

---`Method Public Instance`
---@param faction Barotrauma.Faction
---@return (System.Collections.Generic.IReadOnlyList*1System*String)|(System.String[])
_G['LocationTypeChange'].GetMessages = function(faction) end

---`Method Public Instance`
---@param location Barotrauma.Location
---@return System.Single
_G['LocationTypeChange'].DetermineProbability = function(location) end

---`Constructor Public Instance`
---@param currentType Barotrauma.Identifier
---@param element Barotrauma.ContentXElement
---@param requireChangeMessages System.Boolean
---@param defaultProbability? System.Single
---@return Barotrauma.LocationTypeChange
_G['LocationTypeChange'] = function(currentType, element, requireChangeMessages, defaultProbability) end

---`Constructor Public Instance`
---@param currentType Barotrauma.Identifier
---@param element Barotrauma.ContentXElement
---@param requireChangeMessages System.Boolean
---@param defaultProbability? System.Single
---@return Barotrauma.LocationTypeChange
_G['LocationTypeChange'].__new = function(currentType, element, requireChangeMessages, defaultProbability) end

