---@meta
---@class Barotrauma.EliminateTargetsMission : Barotrauma.Mission
---`Field Private Instance`
---@field targetItemIdentifiers (Barotrauma.Identifier-arr)|(Barotrauma.Identifier[])
---`Field Private Instance`
---@field targetEnemyIdentifiers (Barotrauma.Identifier-arr)|(Barotrauma.Identifier[])
---`Field Private Instance`
---@field minEnemyCount System.Int32
---`Field Private Instance`
---@field existingTargets (System.Collections.Generic.HashSet*1Barotrauma*Entity)|(Barotrauma.Entity[])
---`Field Private Instance`
---@field spawnedTargets (System.Collections.Generic.HashSet*1Barotrauma*Character)|(Barotrauma.Character[])
---`Field Private Instance`
---@field allTargets (System.Collections.Generic.HashSet*1Barotrauma*Entity)|(Barotrauma.Entity[])
---`Field Public Instance`
---@field TargetSubType Barotrauma.SubmarineType
---`Field Public Instance`
---@field PrioritizeThalamus System.Boolean
---`Getter Public Instance Virtual`
---@field DisplayAsCompleted System.Boolean
---`Getter Public Instance Virtual`
---@field DisplayAsFailed System.Boolean
---`Getter Private Instance`
---<br/>`Setter Private Instance`
---@field TargetSub Barotrauma.Submarine
---`Getter Public Instance Virtual`
---@field SonarLabels (System.Collections.Generic.IEnumerable*1System*ValueTuple*2Barotrauma*LocalizedString*2Microsoft*Xna*Framework*Vector2)|(fun():(System.ValueTuple*1Barotrauma*LocalizedString*1Microsoft*Xna*Framework*Vector2))
_G['EliminateTargetsMission'] = {}

---`Method Public Instance Virtual`
---@param msg Barotrauma.Networking.IReadMessage
_G['EliminateTargetsMission'].ClientReadInitial = function(msg) end

---`Method NonPublic Instance Virtual`
---@param level Barotrauma.Level
_G['EliminateTargetsMission'].StartMissionSpecific = function(level) end

---`Method NonPublic Instance Virtual`
---@param deltaTime System.Single
_G['EliminateTargetsMission'].UpdateMissionSpecific = function(deltaTime) end

---`Method Private Instance`
---@return System.Boolean
_G['EliminateTargetsMission'].AllTargetsEliminated = function() end

---`Method Private Static`
---@param item Barotrauma.Item
---@return System.Boolean
_G['EliminateTargetsMission'].IsItemDestroyed = function(item) end

---`Method Private Static`
---@param enemy Barotrauma.Character
---@return System.Boolean
_G['EliminateTargetsMission'].IsEnemyDefeated = function(enemy) end

---`Method NonPublic Instance Virtual`
---@return System.Boolean
_G['EliminateTargetsMission'].DetermineCompleted = function() end

---`Method NonPublic Instance Virtual`
---@param completed System.Boolean
_G['EliminateTargetsMission'].EndMissionSpecific = function(completed) end

---`Constructor Public Instance`
---@param prefab Barotrauma.MissionPrefab
---@param locations (Barotrauma.Location-arr)|(Barotrauma.Location[])
---@param sub Barotrauma.Submarine
---@return Barotrauma.EliminateTargetsMission
_G['EliminateTargetsMission'] = function(prefab, locations, sub) end

---`Constructor Public Instance`
---@param prefab Barotrauma.MissionPrefab
---@param locations (Barotrauma.Location-arr)|(Barotrauma.Location[])
---@param sub Barotrauma.Submarine
---@return Barotrauma.EliminateTargetsMission
_G['EliminateTargetsMission'].__new = function(prefab, locations, sub) end

