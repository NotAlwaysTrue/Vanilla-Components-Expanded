---@meta
---@class Barotrauma.EventPrefab : Barotrauma.Prefab
---`Field Public Instance`
---@field ConfigElement Barotrauma.ContentXElement
---`Field Public Instance`
---@field EventType System.Type
---`Field Private Instance`
---@field tags (System.Collections.Immutable.ImmutableHashSet*1Barotrauma*Identifier)|(Barotrauma.Identifier[])
---`Field Public Instance`
---@field Probability System.Single
---`Field Public Instance`
---@field TriggerEventCooldown System.Boolean
---`Field Public Instance`
---@field Commonness System.Single
---`Field Public Instance`
---@field BiomeIdentifier Barotrauma.Identifier
---`Field Public Instance`
---@field RequiredLayer Barotrauma.Identifier
---`Field Public Instance`
---@field RequiredSpawnPointTag Barotrauma.Identifier
---`Field Public Instance`
---@field Faction Barotrauma.Identifier
---`Field Public Instance`
---@field Name Barotrauma.LocalizedString
---`Field Public Instance`
---@field UnlockPathEvent System.Boolean
---`Field Public Instance`
---@field UnlockPathTooltip System.String
---`Field Public Instance`
---@field UnlockPathReputation System.Int32
---`Field Public Static`
---@field Prefabs (Barotrauma.PrefabCollection*1Barotrauma*EventPrefab)|(fun():(Barotrauma.EventPrefab))
---`Getter Public Instance`
---@field Tags (System.Collections.Immutable.ImmutableHashSet*1Barotrauma*Identifier)|(Barotrauma.Identifier[])
_G['EventPrefab'] = {}

---`Method Public Static`
---@param element Barotrauma.ContentXElement
---@param file Barotrauma.RandomEventsFile
---@param fallbackIdentifier? Barotrauma.Identifier
---@return Barotrauma.EventPrefab
_G['EventPrefab'].Create = function(element, file, fallbackIdentifier) end

---`Method Public Instance`
---@param seed System.Int32
---@param instance Barotrauma.T-ref
---@return System.Boolean
_G['EventPrefab'].TryCreateInstance = function(seed, instance) end

---`Method Public Instance`
---@param seed System.Int32
---@return Barotrauma.Event
_G['EventPrefab'].CreateInstance = function(seed) end

---`Method Public Instance Virtual`
_G['EventPrefab'].Dispose = function() end

---`Method Public Instance Virtual`
---@return System.String
_G['EventPrefab'].ToString = function() end

---`Method Public Static`
---@param biomeIdentifier Barotrauma.Identifier
---@param faction Barotrauma.Faction
---@return Barotrauma.EventPrefab
_G['EventPrefab'].GetUnlockPathEvent = function(biomeIdentifier, faction) end

---`Method Public Static`
---@param identifier Barotrauma.Identifier
---@param tag Barotrauma.Identifier
---@param source Barotrauma.ContentPackage
---@return Barotrauma.EventPrefab
_G['EventPrefab'].FindEventPrefab = function(identifier, tag, source) end

---`Constructor Public Instance`
---@overload fun(element:Barotrauma.ContentXElement, file:Barotrauma.RandomEventsFile, fallbackIdentifier?:Barotrauma.Identifier):Barotrauma.EventPrefab
---@return Barotrauma.EventPrefab
_G['EventPrefab'] = function() end

---`Constructor Public Instance`
---@overload fun(element:Barotrauma.ContentXElement, file:Barotrauma.RandomEventsFile, fallbackIdentifier?:Barotrauma.Identifier):Barotrauma.EventPrefab
---@return Barotrauma.EventPrefab
_G['EventPrefab'].__new = function() end

---`Constructor Private Static`
---@overload fun(element:Barotrauma.ContentXElement, file:Barotrauma.RandomEventsFile, fallbackIdentifier?:Barotrauma.Identifier):Barotrauma.EventPrefab
---@return Barotrauma.EventPrefab
_G['EventPrefab'] = function() end

---`Constructor Private Static`
---@overload fun(element:Barotrauma.ContentXElement, file:Barotrauma.RandomEventsFile, fallbackIdentifier?:Barotrauma.Identifier):Barotrauma.EventPrefab
---@return Barotrauma.EventPrefab
_G['EventPrefab'].__new = function() end

