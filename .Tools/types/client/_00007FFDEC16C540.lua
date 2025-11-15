---@meta
---@class Barotrauma.UpgradeManager : System.Object
---`Field Private Instance`
---@field loadedUpgrades (System.Collections.Generic.List*1Barotrauma*PurchasedUpgrade)|(Barotrauma.PurchasedUpgrade[])
---`Field Public Instance`
---@field PurchasedUpgrades (System.Collections.Generic.List*1Barotrauma*PurchasedUpgrade)|(Barotrauma.PurchasedUpgrade[])
---`Field Public Instance`
---@field PendingUpgrades (System.Collections.Generic.List*1Barotrauma*PurchasedUpgrade)|(Barotrauma.PurchasedUpgrade[])
---`Field Public Instance`
---@field PurchasedItemSwaps (System.Collections.Generic.List*1Barotrauma*PurchasedItemSwap)|(Barotrauma.PurchasedItemSwap[])
---`Field Private Instance`
---@field Campaign Barotrauma.CampaignMode
---`Field Public Instance`
---@field OnUpgradesChanged Barotrauma.NamedEvent*1Barotrauma*UpgradeManager
---`Field Private Instance`
---@field lastUpgradeSpeak System.DateTime
---`Field Private Instance`
---@field lastErrorSpeak System.DateTime
---`Field Private Static`
---@field upgradedSubs (System.Collections.Generic.HashSet*1Barotrauma*Submarine)|(Barotrauma.Submarine[])
---`Field Public Static`
---@field UpgradeAlsoConnectedSubs System.Boolean
---`Getter Private Instance`
---@field Metadata Barotrauma.CampaignMetadata
_G['UpgradeManager'] = {}

---`Method Public Instance`
---@param item Barotrauma.Item
---@param replacement Barotrauma.ItemPrefab
---@return System.Int32
_G['UpgradeManager'].DetermineItemSwapCost = function(item, replacement) end

---`Method Public Instance`
---@param prefab Barotrauma.UpgradePrefab
---@param category Barotrauma.UpgradeCategory
---@param force? System.Boolean
---@param client? Barotrauma.Networking.Client
---@return System.Boolean
_G['UpgradeManager'].TryPurchaseUpgrade = function(prefab, category, force, client) end

---`Method Public Instance`
---@param prefab Barotrauma.UpgradePrefab
---@param category Barotrauma.UpgradeCategory
---@param level System.Int32
_G['UpgradeManager'].AddUpgradeExternally = function(prefab, category, level) end

---`Method Public Instance`
---@param itemToRemove Barotrauma.Item
---@param itemToInstall Barotrauma.ItemPrefab
---@param isNetworkMessage? System.Boolean
---@param client? Barotrauma.Networking.Client
_G['UpgradeManager'].PurchaseItemSwap = function(itemToRemove, itemToInstall, isNetworkMessage, client) end

---`Method Public Instance`
---@param itemToRemove Barotrauma.Item
---@param force? System.Boolean
---@param client? Barotrauma.Networking.Client
_G['UpgradeManager'].CancelItemSwap = function(itemToRemove, force, client) end

---`Method Public Static`
---@param item Barotrauma.Item
---@return (System.Collections.Generic.ICollection*1Barotrauma*Item)|(fun():(Barotrauma.Item))
_G['UpgradeManager'].GetLinkedItemsToSwap = function(item) end

---`Method Public Instance`
_G['UpgradeManager'].ApplyUpgrades = function() end

---`Method Public Instance`
---@param text System.String
---@param isSinglePlayer System.Boolean
---@param character Barotrauma.Character
_G['UpgradeManager'].CreateUpgradeErrorMessage = function(text, isSinglePlayer, character) end

---`Method Private Instance`
---@param text System.String
---@param isSinglePlayer System.Boolean
---@param character? Barotrauma.Character
_G['UpgradeManager'].UpgradeNPCSpeak = function(text, isSinglePlayer, character) end

---`Method Public Instance`
_G['UpgradeManager'].SanityCheckUpgrades = function() end

---`Method Private Static`
---@param target Barotrauma.ISerializableEntity
---@param prefab Barotrauma.UpgradePrefab
---@param level System.Int32
_G['UpgradeManager'].FixUpgradeOnItem = function(target, prefab, level) end

---`Method Private Static`
---@param prefab Barotrauma.UpgradePrefab
---@param category Barotrauma.UpgradeCategory
---@param submarine Barotrauma.Submarine
---@param level? System.Int32
---@param parentSub? Barotrauma.Submarine
---@return System.Int32
_G['UpgradeManager'].BuyUpgrade = function(prefab, category, submarine, level, parentSub) end

---`Method Public Instance`
---@param prefab Barotrauma.UpgradePrefab
---@param category Barotrauma.UpgradeCategory
---@param info? Barotrauma.SubmarineInfo
---@return System.Int32
_G['UpgradeManager'].GetUpgradeLevel = function(prefab, category, info) end

---`Method Public Instance`
---@param prefab Barotrauma.UpgradePrefab
---@param category Barotrauma.UpgradeCategory
---@return System.Int32
_G['UpgradeManager'].GetRealUpgradeLevel = function(prefab, category) end

---`Method Public Instance`
---@param prefab Barotrauma.UpgradePrefab
---@param category Barotrauma.UpgradeCategory
---@param info Barotrauma.SubmarineInfo
---@return System.Int32
_G['UpgradeManager'].GetRealUpgradeLevelForSub = function(prefab, category, info) end

---`Method Private Instance`
---@param prefab Barotrauma.UpgradePrefab
---@param category Barotrauma.UpgradeCategory
---@param level System.Int32
_G['UpgradeManager'].SetUpgradeLevel = function(prefab, category, level) end

---`Method Public Instance`
---@return System.Boolean
_G['UpgradeManager'].CanUpgradeSub = function() end

---`Method Public Instance`
---@param client? Barotrauma.Networking.Client
---@return System.Boolean
_G['UpgradeManager'].HasPermissionToManageUpgrades = function(client) end

---`Method Public Instance`
---@param parent System.Xml.Linq.XElement
_G['UpgradeManager'].Save = function(parent) end

---`Method Private Static`
---@param parent System.Xml.Linq.XElement
---@param upgrades (System.Collections.Generic.List*1Barotrauma*PurchasedUpgrade)|(Barotrauma.PurchasedUpgrade[])
_G['UpgradeManager'].SavePendingUpgrades = function(parent, upgrades) end

---`Method Private Instance`
---@param element System.Xml.Linq.XElement
---@param isSingleplayer? System.Boolean
_G['UpgradeManager'].LoadPendingUpgrades = function(element, isSingleplayer) end

---`Method Public Static`
---@param text System.String
---@param data (System.Collections.Generic.Dictionary*1System*String*1System*Object)|({[System.String]:(System.Object)})
---@param e? System.Exception
_G['UpgradeManager'].LogError = function(text, data, e) end

---`Method Public Instance`
---@param upgrades (System.Collections.Generic.List*1Barotrauma*PurchasedUpgrade)|(Barotrauma.PurchasedUpgrade[])
_G['UpgradeManager'].SetPendingUpgrades = function(upgrades) end

---`Method Public Static`
---@param msg System.String
---@param color? System.Nullable*1Microsoft*Xna*Framework*Color
_G['UpgradeManager'].DebugLog = function(msg, color) end

---`Method Private Instance`
---@param prefab Barotrauma.UpgradePrefab
---@param category Barotrauma.UpgradeCategory
---@return Barotrauma.PurchasedUpgrade
_G['UpgradeManager'].FindMatchingUpgrade = function(prefab, category) end

---`Method Private Static`
---@param prefab Barotrauma.UpgradePrefab
---@param category Barotrauma.UpgradeCategory
---@return Barotrauma.Identifier
_G['UpgradeManager'].FormatIdentifier = function(prefab, category) end

---`Constructor Public Instance`
---@overload fun(campaign:Barotrauma.CampaignMode):Barotrauma.UpgradeManager
---@overload fun(campaign:Barotrauma.CampaignMode, element:System.Xml.Linq.XElement, isSingleplayer:System.Boolean):Barotrauma.UpgradeManager
---@return Barotrauma.UpgradeManager
_G['UpgradeManager'] = function() end

---`Constructor Public Instance`
---@overload fun(campaign:Barotrauma.CampaignMode):Barotrauma.UpgradeManager
---@overload fun(campaign:Barotrauma.CampaignMode, element:System.Xml.Linq.XElement, isSingleplayer:System.Boolean):Barotrauma.UpgradeManager
---@return Barotrauma.UpgradeManager
_G['UpgradeManager'].__new = function() end

---`Constructor Private Static`
---@overload fun(campaign:Barotrauma.CampaignMode):Barotrauma.UpgradeManager
---@overload fun(campaign:Barotrauma.CampaignMode, element:System.Xml.Linq.XElement, isSingleplayer:System.Boolean):Barotrauma.UpgradeManager
---@return Barotrauma.UpgradeManager
_G['UpgradeManager'] = function() end

---`Constructor Private Static`
---@overload fun(campaign:Barotrauma.CampaignMode):Barotrauma.UpgradeManager
---@overload fun(campaign:Barotrauma.CampaignMode, element:System.Xml.Linq.XElement, isSingleplayer:System.Boolean):Barotrauma.UpgradeManager
---@return Barotrauma.UpgradeManager
_G['UpgradeManager'].__new = function() end

