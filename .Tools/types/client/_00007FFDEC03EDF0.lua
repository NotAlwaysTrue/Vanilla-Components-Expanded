---@meta
---@class Barotrauma.MineralMission : Barotrauma.Mission
---`Field Private Instance`
---@field resourceAmounts (System.Collections.Generic.Dictionary*1Barotrauma*Identifier*1System*Int32)|({[Barotrauma.Identifier]:(System.Int32)})
---`Field Private Instance`
---@field spawnedResources (System.Collections.Generic.Dictionary*1Barotrauma*Identifier*1System*Collections*Generic*List*2Barotrauma*Item)|({[Barotrauma.Identifier]:((System.Collections.Generic.List*1Barotrauma*Item)|(Barotrauma.Item[]))})
---`Field Private Instance`
---@field relevantLevelResources (System.Collections.Generic.Dictionary*1Barotrauma*Identifier*1Barotrauma*Item-arr)|({[Barotrauma.Identifier]:((Barotrauma.Item-arr)|(Barotrauma.Item[]))})
---`Field Private Instance`
---@field missionClusterPositions (System.Collections.Generic.List*1System*ValueTuple*2Barotrauma*Identifier*2Microsoft*Xna*Framework*Vector2)|(System.ValueTuple*1Barotrauma*Identifier*1Microsoft*Xna*Framework*Vector2[])
---`Field Private Instance`
---@field caves (System.Collections.Generic.HashSet*1Barotrauma*Level*Cave)|(Barotrauma.Level.Cave[])
---`Field Private Instance`
---@field positionType Barotrauma.Level.PositionType
---`Field Private Instance`
---@field resourceHandoverAmount System.Single
---`Field Public Static`
---@field ValidPositionTypes (System.Collections.Immutable.ImmutableArray*1Barotrauma*Level*PositionType)|(Barotrauma.Level.PositionType[])
---`Getter Public Instance Virtual`
---@field DisplayAsCompleted System.Boolean
---`Getter Public Instance Virtual`
---@field DisplayAsFailed System.Boolean
---`Getter Public Instance Virtual`
---<br/>`Setter Public Instance Virtual`
---@field State System.Int32
---`Getter Public Instance Virtual`
---@field SonarLabels (System.Collections.Generic.IEnumerable*1System*ValueTuple*2Barotrauma*LocalizedString*2Microsoft*Xna*Framework*Vector2)|(fun():(System.ValueTuple*1Barotrauma*LocalizedString*1Microsoft*Xna*Framework*Vector2))
---`Getter Public Instance Virtual`
---@field SuccessMessage Barotrauma.LocalizedString
---`Getter Public Instance Virtual`
---@field FailureMessage Barotrauma.LocalizedString
---`Getter Public Instance Virtual`
---@field Description Barotrauma.LocalizedString
---`Getter Public Instance Virtual`
---@field Name Barotrauma.LocalizedString
_G['MineralMission'] = {}

---`Method Public Instance Virtual`
---@param msg Barotrauma.Networking.IReadMessage
_G['MineralMission'].ClientReadInitial = function(msg) end

---`Method NonPublic Instance Virtual`
---@param level Barotrauma.Level
_G['MineralMission'].StartMissionSpecific = function(level) end

---`Method NonPublic Instance Virtual`
---@param deltaTime System.Single
_G['MineralMission'].UpdateMissionSpecific = function(deltaTime) end

---`Method NonPublic Instance Virtual`
---@return System.Boolean
_G['MineralMission'].DetermineCompleted = function() end

---`Method NonPublic Instance Virtual`
---@param completed System.Boolean
_G['MineralMission'].EndMissionSpecific = function(completed) end

---`Method Private Instance`
_G['MineralMission'].FindRelevantLevelResources = function() end

---`Method Private Instance`
---@return System.Boolean
_G['MineralMission'].EnoughHaveBeenCollected = function() end

---`Method Private Instance`
---@param item Barotrauma.Item
---@return System.Boolean
_G['MineralMission'].HasBeenCollected = function(item) end

---`Method Private Instance`
---@param items (System.Collections.Generic.IEnumerable*1Barotrauma*Item)|(fun():(Barotrauma.Item))
---@return System.Boolean
_G['MineralMission'].AnyAreUncollected = function(items) end

---`Method Private Instance`
_G['MineralMission'].CalculateMissionClusterPositions = function() end

---`Method NonPublic Instance Virtual`
---@param message Barotrauma.LocalizedString
---@param color? System.Boolean
---@return Barotrauma.LocalizedString
_G['MineralMission'].ModifyMessage = function(message, color) end

---`Constructor Public Instance`
---@overload fun(prefab:Barotrauma.MissionPrefab, locations:(Barotrauma.Location-arr)|(Barotrauma.Location[]), sub:Barotrauma.Submarine):Barotrauma.MineralMission
---@return Barotrauma.MineralMission
_G['MineralMission'] = function() end

---`Constructor Public Instance`
---@overload fun(prefab:Barotrauma.MissionPrefab, locations:(Barotrauma.Location-arr)|(Barotrauma.Location[]), sub:Barotrauma.Submarine):Barotrauma.MineralMission
---@return Barotrauma.MineralMission
_G['MineralMission'].__new = function() end

---`Constructor Private Static`
---@overload fun(prefab:Barotrauma.MissionPrefab, locations:(Barotrauma.Location-arr)|(Barotrauma.Location[]), sub:Barotrauma.Submarine):Barotrauma.MineralMission
---@return Barotrauma.MineralMission
_G['MineralMission'] = function() end

---`Constructor Private Static`
---@overload fun(prefab:Barotrauma.MissionPrefab, locations:(Barotrauma.Location-arr)|(Barotrauma.Location[]), sub:Barotrauma.Submarine):Barotrauma.MineralMission
---@return Barotrauma.MineralMission
_G['MineralMission'].__new = function() end

