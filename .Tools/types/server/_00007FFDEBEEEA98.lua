---@meta
---@class Barotrauma.MonsterEvent : Barotrauma.Event
---`Field Public Instance`
---@field SpeciesName Barotrauma.Identifier
---`Field Public Instance`
---@field MinAmount System.Int32
---`Field Public Instance`
---@field MaxAmount System.Int32
---`Field Private Instance`
---@field monsters (System.Collections.Generic.List*1Barotrauma*Character)|(Barotrauma.Character[])
---`Field Public Instance`
---@field SpawnDistance System.Single
---`Field Private Instance`
---@field scatter System.Single
---`Field Private Instance`
---@field offset System.Single
---`Field Private Instance`
---@field delayBetweenSpawns System.Single
---`Field Private Instance`
---@field resetTime System.Single
---`Field Private Instance`
---@field resetTimer System.Single
---`Field Private Instance`
---@field spawnPos System.Nullable*1Microsoft*Xna*Framework*Vector2
---`Field Private Instance`
---@field disallowed System.Boolean
---`Field Public Instance`
---@field SpawnPosType Barotrauma.Level.PositionType
---`Field Private Instance`
---@field spawnPointTag System.String
---`Field Private Instance`
---@field spawnPending System.Boolean
---`Field Private Instance`
---@field spawnReady System.Boolean
---`Field Public Instance`
---@field MaxAmountPerLevel System.Int32
---`Field Private Instance`
---@field overridePlayDeadProbability System.Nullable*1System*Single
---`Field Private Instance`
---@field chosenPosition Barotrauma.Level.InterestingPosition
---`Getter Public Instance`
---@field Monsters (System.Collections.Generic.IReadOnlyList*1Barotrauma*Character)|(Barotrauma.Character[])
---`Getter Public Instance`
---@field SpawnPos System.Nullable*1Microsoft*Xna*Framework*Vector2
---`Getter Public Instance`
---@field SpawnPending System.Boolean
---`Getter Public Instance Virtual`
---@field DebugDrawPos Microsoft.Xna.Framework.Vector2
_G['MonsterEvent'] = {}

---`Method Public Instance Virtual`
---@return System.String
_G['MonsterEvent'].ToString = function() end

---`Method Private Static`
---@param acceptRemoteControlledSubs System.Boolean
---@return Barotrauma.Submarine
_G['MonsterEvent'].GetReferenceSub = function(acceptRemoteControlledSubs) end

---`Method Public Instance Virtual`
---@return (System.Collections.Generic.IEnumerable*1Barotrauma*ContentFile)|(fun():(Barotrauma.ContentFile))
_G['MonsterEvent'].GetFilesToPreload = function() end

---`Method NonPublic Instance Virtual`
---@param parentSet Barotrauma.EventSet
_G['MonsterEvent'].InitEventSpecific = function(parentSet) end

---`Method Public Instance Virtual`
---@return System.String
_G['MonsterEvent'].GetDebugInfo = function() end

---`Method Private Instance`
---@return (System.Collections.Generic.List*1Barotrauma*Level*InterestingPosition)|(Barotrauma.Level.InterestingPosition[])
_G['MonsterEvent'].GetAvailableSpawnPositions = function() end

---`Method Private Instance`
---@param affectSubImmediately System.Boolean
_G['MonsterEvent'].FindSpawnPosition = function(affectSubImmediately) end

---`Method Private Instance`
---@param submarine Barotrauma.Submarine
---@return System.Single
_G['MonsterEvent'].GetMinDistanceToSub = function(submarine) end

---`Method Public Instance Virtual`
---@param deltaTime System.Single
_G['MonsterEvent'].Update = function(deltaTime) end

---`Constructor Public Instance`
---@param prefab Barotrauma.EventPrefab
---@param seed System.Int32
---@return Barotrauma.MonsterEvent
_G['MonsterEvent'] = function(prefab, seed) end

---`Constructor Public Instance`
---@param prefab Barotrauma.EventPrefab
---@param seed System.Int32
---@return Barotrauma.MonsterEvent
_G['MonsterEvent'].__new = function(prefab, seed) end

