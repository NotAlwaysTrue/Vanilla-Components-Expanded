---@meta
---@class Barotrauma.ScanMission : Barotrauma.Mission
---`Field Private Instance`
---@field itemConfig Barotrauma.ContentXElement
---`Field Private Instance`
---@field startingItems (System.Collections.Generic.List*1Barotrauma*Item)|(Barotrauma.Item[])
---`Field Private Instance`
---@field scanners (System.Collections.Generic.List*1Barotrauma*Items*Components*Scanner)|(Barotrauma.Items.Components.Scanner[])
---`Field Private Instance`
---@field parentInventoryIDs (System.Collections.Generic.Dictionary*1Barotrauma*Item*1System*UInt16)|({[Barotrauma.Item]:(System.UInt16)})
---`Field Private Instance`
---@field inventorySlotIndices (System.Collections.Generic.Dictionary*1Barotrauma*Item*1System*Int32)|({[Barotrauma.Item]:(System.Int32)})
---`Field Private Instance`
---@field parentItemContainerIndices (System.Collections.Generic.Dictionary*1Barotrauma*Item*1System*Byte)|({[Barotrauma.Item]:(System.Byte)})
---`Field Private Instance`
---@field targetsToScan System.Int32
---`Field Private Instance`
---@field scanTargets (System.Collections.Generic.Dictionary*1Barotrauma*WayPoint*1System*Boolean)|({[Barotrauma.WayPoint]:(System.Boolean)})
---`Field Private Instance`
---@field newTargetsScanned (System.Collections.Generic.HashSet*1Barotrauma*WayPoint)|(Barotrauma.WayPoint[])
---`Field Private Instance`
---@field minTargetDistance System.Single
---`Getter Private Instance`
---<br/>`Setter Private Instance`
---@field TargetRuin Barotrauma.RuinGeneration.Ruin
---`Getter Public Instance Virtual`
---@field SonarLabels (System.Collections.Generic.IEnumerable*1System*ValueTuple*2Barotrauma*LocalizedString*2Microsoft*Xna*Framework*Vector2)|(fun():(System.ValueTuple*1Barotrauma*LocalizedString*1Microsoft*Xna*Framework*Vector2))
_G['ScanMission'] = {}

---`Method Public Instance Virtual`
---@param msg Barotrauma.Networking.IWriteMessage
---@param c Barotrauma.Networking.Client
_G['ScanMission'].ServerWriteInitial = function(msg, c) end

---`Method Public Instance Virtual`
---@param msg Barotrauma.Networking.IWriteMessage
_G['ScanMission'].ServerWrite = function(msg) end

---`Method Private Instance`
---@param msg Barotrauma.Networking.IWriteMessage
_G['ScanMission'].ServerWriteScanTargetStatus = function(msg) end

---`Method NonPublic Instance Virtual`
---@param level Barotrauma.Level
_G['ScanMission'].StartMissionSpecific = function(level) end

---`Method Private Instance`
_G['ScanMission'].Reset = function() end

---`Method Private Instance`
---@param element System.Xml.Linq.XElement
---@param parent Barotrauma.Item
_G['ScanMission'].LoadItem = function(element, parent) end

---`Method NonPublic Instance Virtual`
---@param previousState System.Int32
_G['ScanMission'].MissionStateChanged = function(previousState) end

---`Method Private Instance`
_G['ScanMission'].GetScanners = function() end

---`Method Private Instance`
---@param scanner Barotrauma.Items.Components.Scanner
_G['ScanMission'].OnScanStarted = function(scanner) end

---`Method Private Instance`
---@param scanner Barotrauma.Items.Components.Scanner
_G['ScanMission'].OnScanCompleted = function(scanner) end

---`Method Private Static`
---@param scanner Barotrauma.Items.Components.Scanner
---@param scanStatus System.Collections.Generic.KeyValuePair*1Barotrauma*WayPoint*1System*Boolean
---@param scanRadiusSquared System.Single
---@return System.Boolean
_G['ScanMission'].IsValidScanPosition = function(scanner, scanStatus, scanRadiusSquared) end

---`Method NonPublic Instance Virtual`
---@param deltaTime System.Single
_G['ScanMission'].UpdateMissionSpecific = function(deltaTime) end

---`Method Private Instance`
---@return System.Boolean
_G['ScanMission'].AllTargetsScanned = function() end

---`Method NonPublic Instance Virtual`
---@return System.Boolean
_G['ScanMission'].DetermineCompleted = function() end

---`Method NonPublic Instance Virtual`
---@param completed System.Boolean
_G['ScanMission'].EndMissionSpecific = function(completed) end

---`Constructor Public Instance`
---@param prefab Barotrauma.MissionPrefab
---@param locations (Barotrauma.Location-arr)|(Barotrauma.Location[])
---@param sub Barotrauma.Submarine
---@return Barotrauma.ScanMission
_G['ScanMission'] = function(prefab, locations, sub) end

---`Constructor Public Instance`
---@param prefab Barotrauma.MissionPrefab
---@param locations (Barotrauma.Location-arr)|(Barotrauma.Location[])
---@param sub Barotrauma.Submarine
---@return Barotrauma.ScanMission
_G['ScanMission'].__new = function(prefab, locations, sub) end

