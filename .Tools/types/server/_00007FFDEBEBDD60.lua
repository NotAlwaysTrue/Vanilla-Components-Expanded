---@meta
---@class Barotrauma.CargoMission : Barotrauma.Mission
---`Field Private Instance`
---@field itemConfig Barotrauma.ContentXElement
---`Field Private Instance`
---@field items (System.Collections.Generic.List*1Barotrauma*Item)|(Barotrauma.Item[])
---`Field Private Instance`
---@field parentInventoryIDs (System.Collections.Generic.Dictionary*1Barotrauma*Item*1System*UInt16)|({[Barotrauma.Item]:(System.UInt16)})
---`Field Private Instance`
---@field inventorySlotIndices (System.Collections.Generic.Dictionary*1Barotrauma*Item*1System*Int32)|({[Barotrauma.Item]:(System.Int32)})
---`Field Private Instance`
---@field parentItemContainerIndices (System.Collections.Generic.Dictionary*1Barotrauma*Item*1System*Byte)|({[Barotrauma.Item]:(System.Byte)})
---`Field Private Instance`
---@field requiredDeliveryAmount System.Single
---`Field Private Instance`
---@field itemsToSpawn (System.Collections.Generic.List*1System*ValueTuple*2Barotrauma*ContentXElement*2Barotrauma*Items*Components*ItemContainer)|(System.ValueTuple*1Barotrauma*ContentXElement*1Barotrauma*Items*Components*ItemContainer[])
---`Field Private Instance`
---@field rewardPerCrate System.Nullable*1System*Int32
---`Field Private Instance`
---@field calculatedReward System.Int32
---`Field Private Instance`
---@field maxItemCount System.Int32
---`Field Private Instance`
---@field currentSub Barotrauma.Submarine
---`Field Private Instance`
---@field nextRoundSubInfo Barotrauma.SubmarineInfo
---`Field Private Instance`
---@field previouslySelectedMissions (System.Collections.Generic.List*1Barotrauma*CargoMission)|(Barotrauma.CargoMission[])
---`Getter Public Instance Virtual`
---@field Description Barotrauma.LocalizedString
_G['CargoMission'] = {}

---`Method Public Instance Virtual`
---@param msg Barotrauma.Networking.IWriteMessage
---@param c Barotrauma.Networking.Client
_G['CargoMission'].ServerWriteInitial = function(msg, c) end

---`Method Private Instance`
_G['CargoMission'].DetermineCargo = function() end

---`Method Public Instance Virtual`
---@param sub Barotrauma.Submarine
---@return System.Single
_G['CargoMission'].GetBaseReward = function(sub) end

---`Method Private Instance`
_G['CargoMission'].InitItems = function() end

---`Method Private Instance`
---@param element Barotrauma.ContentXElement
---@param parent Barotrauma.Item
_G['CargoMission'].LoadItemAsChild = function(element, parent) end

---`Method NonPublic Instance Virtual`
---@param level Barotrauma.Level
_G['CargoMission'].StartMissionSpecific = function(level) end

---`Method NonPublic Instance Virtual`
---@return System.Boolean
_G['CargoMission'].DetermineCompleted = function() end

---`Method NonPublic Instance Virtual`
---@param completed System.Boolean
_G['CargoMission'].EndMissionSpecific = function(completed) end

---`Method Private Static`
---@param item Barotrauma.Item
---@return System.Boolean
_G['CargoMission'].IsItemDelivered = function(item) end

---`Constructor Public Instance`
---@param prefab Barotrauma.MissionPrefab
---@param locations (Barotrauma.Location-arr)|(Barotrauma.Location[])
---@param sub Barotrauma.Submarine
---@return Barotrauma.CargoMission
_G['CargoMission'] = function(prefab, locations, sub) end

---`Constructor Public Instance`
---@param prefab Barotrauma.MissionPrefab
---@param locations (Barotrauma.Location-arr)|(Barotrauma.Location[])
---@param sub Barotrauma.Submarine
---@return Barotrauma.CargoMission
_G['CargoMission'].__new = function(prefab, locations, sub) end

