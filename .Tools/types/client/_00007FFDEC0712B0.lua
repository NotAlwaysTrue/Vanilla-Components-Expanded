---@meta
---@class Barotrauma.ScriptedEvent : Barotrauma.Event
---`Field Private Instance`
---@field targetPredicates (System.Collections.Generic.Dictionary*1Barotrauma*Identifier*1System*Collections*Generic*List*2Barotrauma*ScriptedEvent*TargetPredicate)|({[Barotrauma.Identifier]:((System.Collections.Generic.List*1Barotrauma*ScriptedEvent*TargetPredicate)|(Barotrauma.ScriptedEvent.TargetPredicate[]))})
---`Field Private Instance`
---@field cachedTargets (System.Collections.Generic.Dictionary*1Barotrauma*Identifier*1System*Collections*Generic*List*2Barotrauma*Entity)|({[Barotrauma.Identifier]:((System.Collections.Generic.List*1Barotrauma*Entity)|(Barotrauma.Entity[]))})
---`Field Private Instance`
---@field initialAmounts (System.Collections.Generic.Dictionary*1Barotrauma*Identifier*1System*Int32)|({[Barotrauma.Identifier]:(System.Int32)})
---`Field Private Instance`
---@field newEntitySpawned System.Boolean
---`Field Private Instance`
---@field prevPlayerCount System.Int32
---`Field Private Instance`
---@field prevBotCount System.Int32
---`Field Private Instance`
---@field prevControlled Barotrauma.Character
---`Field Public Instance`
---@field OnRoundEndAction Barotrauma.OnRoundEndAction
---`Field Private Instance`
---@field requiredDestinationTypes (Barotrauma.Identifier-arr)|(Barotrauma.Identifier[])
---`Field Public Instance`
---@field RequireBeaconStation System.Boolean
---`Field Public Instance`
---@field RequiredDestinationFaction Barotrauma.Identifier
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field CurrentActionIndex System.Int32
---`Getter Public Instance`
---@field Actions (System.Collections.Generic.List*1Barotrauma*EventAction)|(Barotrauma.EventAction[])
---`Getter Public Instance`
---@field Targets (System.Collections.Generic.Dictionary*1Barotrauma*Identifier*1System*Collections*Generic*List*2Barotrauma*Entity)|({[Barotrauma.Identifier]:((System.Collections.Generic.List*1Barotrauma*Entity)|(Barotrauma.Entity[]))})
---`Getter NonPublic Instance Virtual`
---@field NonActionChildElementNames (System.Collections.Generic.IEnumerable*1Barotrauma*Identifier)|(fun():(Barotrauma.Identifier))
_G['ScriptedEvent'] = {}

---`Method Public Instance Virtual`
---@return System.String
_G['ScriptedEvent'].ToString = function() end

---`Method Public Instance Virtual`
---@return System.String
_G['ScriptedEvent'].GetDebugInfo = function() end

---`Method Public Instance Virtual`
---@param tag System.String
---@return System.String
_G['ScriptedEvent'].GetTextForReplacementElement = function(tag) end

---`Method Public Instance Virtual`
---@param str Barotrauma.LocalizedString
---@return Barotrauma.LocalizedString
_G['ScriptedEvent'].ReplaceVariablesInEventText = function(str) end

---`Method Public Instance`
---@return (System.Collections.Generic.List*1System*ValueTuple*2System*Int32*2Barotrauma*EventAction)|(System.ValueTuple*1System*Int32*1Barotrauma*EventAction[])
_G['ScriptedEvent'].GetAllActions = function() end

---`Method Public Instance`
---@param tag Barotrauma.Identifier
---@param target Barotrauma.Entity
_G['ScriptedEvent'].AddTarget = function(tag, target) end

---`Method Public Instance`
---@param tag Barotrauma.Identifier
---@param entityType Barotrauma.ScriptedEvent.TargetPredicate.EntityType
---@param predicate (System.Predicate*1Barotrauma*Entity)|(fun(obj:Barotrauma.Entity):(System.Boolean))
_G['ScriptedEvent'].AddTargetPredicate = function(tag, entityType, predicate) end

---`Method Public Instance`
---@param tag Barotrauma.Identifier
---@return System.Int32
_G['ScriptedEvent'].GetInitialTargetCount = function(tag) end

---`Method Public Instance`
---@param tag Barotrauma.Identifier
---@return (System.Collections.Generic.IEnumerable*1Barotrauma*Entity)|(fun():(Barotrauma.Entity))
_G['ScriptedEvent'].GetTargets = function(tag) end

---`Method Public Instance`
---@param originalEntity Barotrauma.Entity
---@param newEntity Barotrauma.Entity
_G['ScriptedEvent'].InheritTags = function(originalEntity, newEntity) end

---`Method Public Instance`
---@param tag Barotrauma.Identifier
_G['ScriptedEvent'].RemoveTag = function(tag) end

---`Method Public Instance Virtual`
---@param deltaTime System.Single
_G['ScriptedEvent'].Update = function(deltaTime) end

---`Method Private Instance`
---@return System.Boolean
_G['ScriptedEvent'].NeedsToRefreshCachedTargets = function() end

---`Method Public Instance`
---@param entity Barotrauma.Entity
_G['ScriptedEvent'].EntitySpawned = function(entity) end

---`Method Public Instance Virtual`
---@return System.Boolean
_G['ScriptedEvent'].LevelMeetsRequirements = function() end

---`Method Public Instance Virtual`
_G['ScriptedEvent'].Finish = function() end

---`Constructor Public Instance`
---@param prefab Barotrauma.EventPrefab
---@param seed System.Int32
---@return Barotrauma.ScriptedEvent
_G['ScriptedEvent'] = function(prefab, seed) end

---`Constructor Public Instance`
---@param prefab Barotrauma.EventPrefab
---@param seed System.Int32
---@return Barotrauma.ScriptedEvent
_G['ScriptedEvent'].__new = function(prefab, seed) end

