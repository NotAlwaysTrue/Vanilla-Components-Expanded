---@meta
---@class Barotrauma.CharacterParams.AIParams : Barotrauma.CharacterParams.SubParam
---`Field Public Instance`
---@field IsPet System.Boolean
---`Field Private Instance`
---@field targets (System.Collections.Generic.List*1Barotrauma*CharacterParams*TargetParams)|(Barotrauma.CharacterParams.TargetParams[])
---`Getter Public Instance Virtual`
---@field Name System.String
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field CombatStrength System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field Sight System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field Hearing System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field MaxPerceptionDistance System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field AggressionHurt System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field AggressionGreed System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field FleeHealthThreshold System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field AttackWhenProvoked System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field AvoidGunfire System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field DamageThreshold System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field AvoidTime System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field MinFleeTime System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field AggressiveBoarding System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field EnforceAggressiveBehaviorForMissions System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field TargetOuterWalls System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field RandomAttack System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field CanOpenDoors System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field UsePathFindingToGetInside System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field KeepDoorsClosed System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field AvoidAbyss System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field StayInAbyss System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field PatrolFlooded System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field PatrolDry System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field StartAggression System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field MaxAggression System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field AggressionCumulation System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field WallTargetingMethod Barotrauma.WallTargetingMethod
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field PlayDeadProbability System.Single
---`Getter Public Instance`
---@field Targets (System.Collections.Generic.IEnumerable*1Barotrauma*CharacterParams*TargetParams)|(fun():(Barotrauma.CharacterParams.TargetParams))
_G['CharacterParams']['AIParams'] = {}

---`Method Private Instance`
---@param targetElement Barotrauma.ContentXElement
---@param target Barotrauma.TargetParams-ref
---@return System.Boolean
_G['CharacterParams']['AIParams'].TryAddTarget = function(targetElement, target) end

---`Method Private Instance`
---@param targetElement Barotrauma.ContentXElement
---@return Barotrauma.CharacterParams.TargetParams
_G['CharacterParams']['AIParams'].AddTarget = function(targetElement) end

---`Method Public Instance`
---@param targetParams Barotrauma.TargetParams-ref
---@return System.Boolean
_G['CharacterParams']['AIParams'].TryAddEmptyTarget = function(targetParams) end

---`Method Public Instance`
---@overload fun(tag:System.String, state:Barotrauma.AIState, priority:System.Single, targetParams:Barotrauma.TargetParams-ref):(System.Boolean)
---@param tag Barotrauma.Identifier
---@param state Barotrauma.AIState
---@param priority System.Single
---@param targetParams Barotrauma.TargetParams-ref
---@return System.Boolean
_G['CharacterParams']['AIParams'].TryAddNewTarget = function(tag, state, priority, targetParams) end

---`Method Public Instance`
---@overload fun(tag:System.String):(System.Boolean)
---@param tag Barotrauma.Identifier
---@return System.Boolean
_G['CharacterParams']['AIParams'].HasTag = function(tag) end

---`Method Public Instance`
---@param target Barotrauma.CharacterParams.TargetParams
---@return System.Boolean
_G['CharacterParams']['AIParams'].RemoveTarget = function(target) end

---`Method Public Instance`
---@param predicate (System.Func*1Barotrauma*CharacterParams*TargetParams*1System*Boolean)|(fun(arg:Barotrauma.CharacterParams.TargetParams):(System.Boolean))
---@return (System.Collections.Generic.IEnumerable*1Barotrauma*CharacterParams*TargetParams)|(fun():(Barotrauma.CharacterParams.TargetParams))
_G['CharacterParams']['AIParams'].GetMatchingTargets = function(predicate) end

---`Method Public Instance`
---@overload fun(target:Barotrauma.Identifier):((System.Collections.Generic.IEnumerable*1Barotrauma*CharacterParams*TargetParams)|(fun():(Barotrauma.CharacterParams.TargetParams)))
---@param target Barotrauma.Character
---@return (System.Collections.Generic.IEnumerable*1Barotrauma*CharacterParams*TargetParams)|(fun():(Barotrauma.CharacterParams.TargetParams))
_G['CharacterParams']['AIParams'].GetTargets = function(target) end

---`Method Public Instance`
---@overload fun(target:Barotrauma.Identifier):(Barotrauma.CharacterParams.TargetParams)
---@param target Barotrauma.Character
---@return Barotrauma.CharacterParams.TargetParams
_G['CharacterParams']['AIParams'].GetHighestPriorityTarget = function(target) end

---`Method Private Static`
---@param targetParams (System.Collections.Generic.IEnumerable*1Barotrauma*CharacterParams*TargetParams)|(fun():(Barotrauma.CharacterParams.TargetParams))
---@return Barotrauma.CharacterParams.TargetParams
_G['CharacterParams']['AIParams'].GetHighestPriorityTarget = function(targetParams) end

---`Method Public Instance`
---@overload fun(target:Barotrauma.Identifier, targetParams:System.Collections.Generic.IEnumerable):(System.Boolean)
---@param target Barotrauma.Character
---@param targetParams System.Collections.Generic.IEnumerable
---@return System.Boolean
_G['CharacterParams']['AIParams'].TryGetTargets = function(target, targetParams) end

---`Method Public Instance`
---@overload fun(target:Barotrauma.Identifier, targetParams:Barotrauma.TargetParams-ref):(System.Boolean)
---@overload fun(target:Barotrauma.Character, targetParams:Barotrauma.TargetParams-ref):(System.Boolean)
---@param tags (System.Collections.Generic.IEnumerable*1Barotrauma*Identifier)|(fun():(Barotrauma.Identifier))
---@param target Barotrauma.TargetParams-ref
---@return System.Boolean
_G['CharacterParams']['AIParams'].TryGetHighestPriorityTarget = function(tags, target) end

---`Constructor Public Instance`
---@param element Barotrauma.ContentXElement
---@param character Barotrauma.CharacterParams
---@return Barotrauma.CharacterParams.AIParams
_G['CharacterParams']['AIParams'] = function(element, character) end

---`Constructor Public Instance`
---@param element Barotrauma.ContentXElement
---@param character Barotrauma.CharacterParams
---@return Barotrauma.CharacterParams.AIParams
_G['CharacterParams']['AIParams'].__new = function(element, character) end

