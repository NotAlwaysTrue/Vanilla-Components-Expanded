---@meta
---@class Barotrauma.Faction : System.Object
---`Getter Public Instance`
---@field Reputation Barotrauma.Reputation
---`Getter Public Instance`
---@field Prefab Barotrauma.FactionPrefab
_G['Faction'] = {}

---`Method Public Static`
---@param faction Barotrauma.Faction
---@return Barotrauma.FactionAffiliation
_G['Faction'].GetPlayerAffiliationStatus = function(faction) end

---`Method Public Instance Virtual`
---@return System.String
_G['Faction'].ToString = function() end

---`Constructor Public Instance`
---@param metadata Barotrauma.CampaignMetadata
---@param prefab Barotrauma.FactionPrefab
---@return Barotrauma.Faction
_G['Faction'] = function(metadata, prefab) end

---`Constructor Public Instance`
---@param metadata Barotrauma.CampaignMetadata
---@param prefab Barotrauma.FactionPrefab
---@return Barotrauma.Faction
_G['Faction'].__new = function(metadata, prefab) end

