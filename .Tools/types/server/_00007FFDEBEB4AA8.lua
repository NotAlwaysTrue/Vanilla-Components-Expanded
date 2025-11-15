---@meta
---@class Barotrauma.CharacterCampaignData : System.Object
---`Field Public Instance`
---@field HasSpawned System.Boolean
---`Field Public Instance`
---@field ChosenNewBotViaShuttle System.Boolean
---`Field Public Instance`
---@field CharacterInfo Barotrauma.CharacterInfo
---`Field Public Instance`
---@field Name System.String
---`Field Public Instance`
---@field ClientAddress Barotrauma.Networking.Address
---`Field Public Instance`
---@field AccountId Barotrauma.Option*1Barotrauma*Networking*AccountId
---`Field Private Instance`
---@field itemData System.Xml.Linq.XElement
---`Field Private Instance`
---@field healthData System.Xml.Linq.XElement
---`Field Public Instance`
---@field WalletData System.Xml.Linq.XElement
---`Field Public Static`
---@field RequireClientNameMatch System.Boolean
---`Getter Public Instance`
---@field HasItemData System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field OrderData System.Xml.Linq.XElement
_G['CharacterCampaignData'] = {}

---`Method Public Instance`
---@param character Barotrauma.Character
---@param refreshHealthData System.Boolean
_G['CharacterCampaignData'].Refresh = function(character, refreshHealthData) end

---`Method Public Instance`
---@param client Barotrauma.Networking.Client
---@return System.Boolean
_G['CharacterCampaignData'].MatchesClient = function(client) end

---`Method Public Instance`
---@param other Barotrauma.CharacterCampaignData
---@return System.Boolean
_G['CharacterCampaignData'].IsDuplicate = function(other) end

---`Method Public Instance`
_G['CharacterCampaignData'].Reset = function() end

---`Method Public Instance`
_G['CharacterCampaignData'].ApplyPermadeath = function() end

---`Method Public Instance`
---@param character Barotrauma.Character
---@param inventory Barotrauma.Inventory
_G['CharacterCampaignData'].SpawnInventoryItems = function(character, inventory) end

---`Method Public Instance`
---@param character Barotrauma.Character
---@param afflictionPredicate? (System.Func*1Barotrauma*AfflictionPrefab*1System*Boolean)|(fun(arg:Barotrauma.AfflictionPrefab):(System.Boolean))
_G['CharacterCampaignData'].ApplyHealthData = function(character, afflictionPredicate) end

---`Method Public Instance`
---@param character Barotrauma.Character
_G['CharacterCampaignData'].ApplyOrderData = function(character) end

---`Method Public Instance`
---@param character Barotrauma.Character
_G['CharacterCampaignData'].ApplyWalletData = function(character) end

---`Method Public Instance`
---@return System.Xml.Linq.XElement
_G['CharacterCampaignData'].Save = function() end

---`Constructor Public Instance`
---@overload fun(client:Barotrauma.Networking.Client):Barotrauma.CharacterCampaignData
---@param element System.Xml.Linq.XElement
---@return Barotrauma.CharacterCampaignData
_G['CharacterCampaignData'] = function(element) end

---`Constructor Public Instance`
---@overload fun(client:Barotrauma.Networking.Client):Barotrauma.CharacterCampaignData
---@param element System.Xml.Linq.XElement
---@return Barotrauma.CharacterCampaignData
_G['CharacterCampaignData'].__new = function(element) end

