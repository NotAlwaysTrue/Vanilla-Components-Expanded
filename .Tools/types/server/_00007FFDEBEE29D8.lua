---@meta
---@class Barotrauma.NestMission : Barotrauma.Mission
---`Field Private Instance`
---@field itemConfig Barotrauma.ContentXElement
---`Field Private Instance`
---@field items (System.Collections.Generic.List*1Barotrauma*Item)|(Barotrauma.Item[])
---`Field Private Instance`
---@field statusEffectOnApproach (System.Collections.Generic.Dictionary*1Barotrauma*Item*1Barotrauma*StatusEffect)|({[Barotrauma.Item]:(Barotrauma.StatusEffect)})
---`Field Private Instance`
---@field monsterPrefabs (System.Collections.Generic.HashSet*1System*Tuple*2Barotrauma*CharacterPrefab*2Microsoft*Xna*Framework*Point)|(System.Tuple*1Barotrauma*CharacterPrefab*1Microsoft*Xna*Framework*Point[])
---`Field Private Instance`
---@field itemSpawnRadius System.Single
---`Field Private Instance`
---@field approachItemsRadius System.Single
---`Field Private Instance`
---@field nestObjectRadius System.Single
---`Field Private Instance`
---@field monsterSpawnRadius System.Single
---`Field Private Instance`
---@field nestObjectAmount System.Int32
---`Field Private Instance`
---@field requireDelivery System.Boolean
---`Field Private Instance`
---@field spawnPositionType Barotrauma.Level.PositionType
---`Field Private Instance`
---@field nestPosition Microsoft.Xna.Framework.Vector2
---`Field Private Instance`
---@field selectedCave Barotrauma.Level.Cave
---`Getter Public Instance Virtual`
---@field SonarLabels (System.Collections.Generic.IEnumerable*1System*ValueTuple*2Barotrauma*LocalizedString*2Microsoft*Xna*Framework*Vector2)|(fun():(System.ValueTuple*1Barotrauma*LocalizedString*1Microsoft*Xna*Framework*Vector2))
_G['NestMission'] = {}

---`Method Public Instance Virtual`
---@param msg Barotrauma.Networking.IWriteMessage
---@param c Barotrauma.Networking.Client
_G['NestMission'].ServerWriteInitial = function(msg, c) end

---`Method NonPublic Instance Virtual`
---@param level Barotrauma.Level
_G['NestMission'].StartMissionSpecific = function(level) end

---`Method Private Instance`
---@param level Barotrauma.Level
---@param cave Barotrauma.Level.Cave
_G['NestMission'].SpawnNestObjects = function(level, cave) end

---`Method NonPublic Instance Virtual`
---@param deltaTime System.Single
_G['NestMission'].UpdateMissionSpecific = function(deltaTime) end

---`Method Private Instance`
---@return System.Boolean
_G['NestMission'].AllItemsDestroyedOrRetrieved = function() end

---`Method NonPublic Instance Virtual`
---@return System.Boolean
_G['NestMission'].DetermineCompleted = function() end

---`Method NonPublic Instance Virtual`
---@param completed System.Boolean
_G['NestMission'].EndMissionSpecific = function(completed) end

---`Constructor Public Instance`
---@param prefab Barotrauma.MissionPrefab
---@param locations (Barotrauma.Location-arr)|(Barotrauma.Location[])
---@param sub Barotrauma.Submarine
---@return Barotrauma.NestMission
_G['NestMission'] = function(prefab, locations, sub) end

---`Constructor Public Instance`
---@param prefab Barotrauma.MissionPrefab
---@param locations (Barotrauma.Location-arr)|(Barotrauma.Location[])
---@param sub Barotrauma.Submarine
---@return Barotrauma.NestMission
_G['NestMission'].__new = function(prefab, locations, sub) end

