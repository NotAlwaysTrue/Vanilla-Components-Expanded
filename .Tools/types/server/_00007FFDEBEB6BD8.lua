---@meta
---@class Barotrauma.MultiPlayerCampaign : Barotrauma.CampaignMode
---`Field Private Instance`
---@field characterData (System.Collections.Generic.List*1Barotrauma*CharacterCampaignData)|(Barotrauma.CharacterCampaignData[])
---`Field Private Instance`
---@field walletsToCheck (System.Collections.Generic.Dictionary*1System*UInt16*1Barotrauma*Wallet)|({[System.UInt16]:(Barotrauma.Wallet)})
---`Field Private Instance`
---@field transactions (System.Collections.Generic.HashSet*1Barotrauma*NetWalletTransaction)|(Barotrauma.NetWalletTransaction[])
---`Field Private Instance`
---@field clientCheckTimer System.Single
---`Field Public Instance`
---@field replacedCharacterDataBackup (System.Collections.Generic.List*1Barotrauma*CharacterCampaignData)|(Barotrauma.CharacterCampaignData[])
---`Field Private Instance`
---@field forceMapUI System.Boolean
---`Field Private Instance`
---@field savedExperiencePoints (System.Collections.Generic.List*1Barotrauma*MultiPlayerCampaign*SavedExperiencePoints)|(Barotrauma.MultiPlayerCampaign.SavedExperiencePoints[])
---`Field Private Instance`
---@field purchasedHullRepairs System.Boolean
---`Field Private Instance`
---@field purchasedLostShuttles System.Boolean
---`Field Private Instance`
---@field purchasedItemRepairs System.Boolean
---`Field Private Instance`
---@field discardedCharacters (System.Collections.Generic.List*1Barotrauma*CharacterCampaignData)|(Barotrauma.CharacterCampaignData[])
---`Field Private Instance`
---@field lastUpdateID (System.Collections.Generic.Dictionary*1Barotrauma*MultiPlayerCampaign*NetFlags*1System*UInt16)|({[Barotrauma.MultiPlayerCampaign.NetFlags]:(System.UInt16)})
---`Field Private Instance`
---@field lastSaveID System.UInt16
---`Field Private Static`
---@field currentCampaignID System.Byte
---`Field Private Static`
---@field clientCheckInterval System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field ForceMapUI System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field GameOver System.Boolean
---`Getter Public Instance Virtual`
---@field Paused System.Boolean
---`Getter Public Instance Virtual`
---<br/>`Setter Public Instance Virtual`
---@field PurchasedHullRepairs System.Boolean
---`Getter Public Instance Virtual`
---<br/>`Setter Public Instance Virtual`
---@field PurchasedLostShuttles System.Boolean
---`Getter Public Instance Virtual`
---<br/>`Setter Public Instance Virtual`
---@field PurchasedItemRepairs System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field LastSaveID System.UInt16
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field CampaignID System.Byte
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field RoundID System.Byte
_G['MultiPlayerCampaign'] = {}

---`Method Public Instance Virtual`
---@param client? Barotrauma.Networking.Client
---@return Barotrauma.Wallet
_G['MultiPlayerCampaign'].GetWallet = function(client) end

---`Method Public Static`
---@param savePath System.String
---@param subPath System.String
---@param seed System.String
---@param startingSettings Barotrauma.CampaignSettings
_G['MultiPlayerCampaign'].StartNewCampaign = function(savePath, subPath, seed, startingSettings) end

---`Method Public Static`
---@param path Barotrauma.CampaignDataPath
---@param client Barotrauma.Networking.Client
_G['MultiPlayerCampaign'].LoadCampaign = function(path, client) end

---`Method NonPublic Instance Virtual`
_G['MultiPlayerCampaign'].LoadInitialLevel = function() end

---`Method Public Static`
_G['MultiPlayerCampaign'].StartCampaignSetup = function() end

---`Method Public Instance Virtual`
_G['MultiPlayerCampaign'].Start = function() end

---`Method Private Static`
---@param client Barotrauma.Networking.Client
---@return System.Boolean
_G['MultiPlayerCampaign'].IsOwner = function(client) end

---`Method Public Instance`
---@param client Barotrauma.Networking.Client
_G['MultiPlayerCampaign'].SaveExperiencePoints = function(client) end

---`Method Public Instance`
---@param client Barotrauma.Networking.Client
---@return System.Int32
_G['MultiPlayerCampaign'].GetSavedExperiencePoints = function(client) end

---`Method Public Instance`
---@param client Barotrauma.Networking.Client
_G['MultiPlayerCampaign'].ClearSavedExperiencePoints = function(client) end

---`Method Public Instance`
---@param character Barotrauma.Character
---@param refreshHealthData System.Boolean
_G['MultiPlayerCampaign'].RefreshCharacterCampaignData = function(character, refreshHealthData) end

---`Method Public Instance`
_G['MultiPlayerCampaign'].SavePlayers = function() end

---`Method Public Instance`
_G['MultiPlayerCampaign'].MoveDiscardedCharacterBalancesToBank = function() end

---`Method NonPublic Instance Virtual`
---@param transitionType Barotrauma.CampaignMode.TransitionType
---@param newLevel Barotrauma.LevelData
---@param leavingSub Barotrauma.Submarine
---@param mirror System.Boolean
---@return (System.Collections.Generic.IEnumerable*1Barotrauma*CoroutineStatus)|(fun():(Barotrauma.CoroutineStatus))
_G['MultiPlayerCampaign'].DoLevelTransition = function(transitionType, newLevel, leavingSub, mirror) end

---`Method Public Instance`
---@param info Barotrauma.SubmarineInfo
---@param client Barotrauma.Networking.Client
---@return System.Boolean
_G['MultiPlayerCampaign'].CanPurchaseSub = function(info, client) end

---`Method Public Instance`
---@param client Barotrauma.Networking.Client
_G['MultiPlayerCampaign'].DiscardClientCharacterData = function(client) end

---`Method Public Instance`
---@param client Barotrauma.Networking.Client
---@return Barotrauma.CharacterCampaignData
_G['MultiPlayerCampaign'].GetClientCharacterData = function(client) end

---`Method Public Instance`
---@param characterInfo Barotrauma.CharacterInfo
---@return Barotrauma.CharacterCampaignData
_G['MultiPlayerCampaign'].GetCharacterData = function(characterInfo) end

---`Method Public Instance`
---@param client Barotrauma.Networking.Client
---@return Barotrauma.CharacterCampaignData
_G['MultiPlayerCampaign'].SetClientCharacterData = function(client) end

---`Method Public Instance`
---@param connectedClients (System.Collections.Generic.IEnumerable*1Barotrauma*Networking*Client)|(fun():(Barotrauma.Networking.Client))
_G['MultiPlayerCampaign'].AssignClientCharacterInfos = function(connectedClients) end

---`Method Public Instance`
---@param connectedClients (System.Collections.Generic.IEnumerable*1Barotrauma*Networking*Client)|(fun():(Barotrauma.Networking.Client))
---@return (System.Collections.Generic.Dictionary*1Barotrauma*Networking*Client*1Barotrauma*Job)|({[Barotrauma.Networking.Client]:(Barotrauma.Job)})
_G['MultiPlayerCampaign'].GetAssignedJobs = function(connectedClients) end

---`Method Public Instance Virtual`
---@param deltaTime System.Single
_G['MultiPlayerCampaign'].Update = function(deltaTime) end

---`Method Private Instance`
---@param deltaTime System.Single
_G['MultiPlayerCampaign'].UpdateClientsToCheck = function(deltaTime) end

---`Method Private Instance`
_G['MultiPlayerCampaign'].UpdateWallets = function() end

---`Method Public Instance Virtual`
---@param transitionType? Barotrauma.CampaignMode.TransitionType
_G['MultiPlayerCampaign'].End = function(transitionType) end

---`Method Private Instance`
---@param c Barotrauma.Networking.Client
---@param flag Barotrauma.MultiPlayerCampaign.NetFlags
---@return System.Boolean
_G['MultiPlayerCampaign'].IsFlagRequired = function(c, flag) end

---`Method Public Instance`
---@param msg Barotrauma.Networking.IWriteMessage
---@param c Barotrauma.Networking.Client
_G['MultiPlayerCampaign'].ServerWrite = function(msg, c) end

---`Method Public Instance`
---@param msg Barotrauma.Networking.IReadMessage
---@param sender Barotrauma.Networking.Client
_G['MultiPlayerCampaign'].ServerRead = function(msg, sender) end

---`Method Public Instance`
---@param msg Barotrauma.Networking.IReadMessage
---@param sender Barotrauma.Networking.Client
_G['MultiPlayerCampaign'].ServerReadMoney = function(msg, sender) end

---`Method Public Instance`
---@param msg Barotrauma.Networking.IReadMessage
---@param sender Barotrauma.Networking.Client
_G['MultiPlayerCampaign'].ServerReadRewardDistribution = function(msg, sender) end

---`Method Public Instance`
---@param sender Barotrauma.Networking.Client
_G['MultiPlayerCampaign'].ResetSalaries = function(sender) end

---`Method Public Instance`
---@param msg Barotrauma.Networking.IReadMessage
---@param sender Barotrauma.Networking.Client
_G['MultiPlayerCampaign'].ServerReadCrew = function(msg, sender) end

---`Method Public Instance`
---@param renamedCrewMember? System.ValueTuple*1System*UInt16*1System*String
---@param firedCharacter? Barotrauma.CharacterInfo
---@param createNotification? System.Boolean
_G['MultiPlayerCampaign'].SendCrewState = function(renamedCrewMember, firedCharacter, createNotification) end

---`Method Public Instance Virtual`
---@param client Barotrauma.Networking.Client
---@param price System.Int32
---@return System.Boolean
_G['MultiPlayerCampaign'].TryPurchase = function(client, price) end

---`Method Public Instance Virtual`
---@param client? Barotrauma.Networking.Client
---@return System.Int32
_G['MultiPlayerCampaign'].GetBalance = function(client) end

---`Method Public Instance Virtual`
---@param element System.Xml.Linq.XElement
---@param isSavingOnLoading System.Boolean
_G['MultiPlayerCampaign'].Save = function(element, isSavingOnLoading) end

---`Method Public Instance`
---@param newData Barotrauma.CharacterCampaignData
---@param skipBackup? System.Boolean
_G['MultiPlayerCampaign'].SaveSingleCharacter = function(newData, skipBackup) end

---`Method Public Instance`
---@param client Barotrauma.Networking.Client
---@return Barotrauma.CharacterCampaignData
_G['MultiPlayerCampaign'].RestoreSingleCharacterFromBackup = function(client) end

---`Method Public Instance`
---@param flag Barotrauma.MultiPlayerCampaign.NetFlags
---@return System.UInt16
_G['MultiPlayerCampaign'].GetLastUpdateIdForFlag = function(flag) end

---`Method Public Instance`
---@param flag Barotrauma.MultiPlayerCampaign.NetFlags
---@param id System.UInt16
_G['MultiPlayerCampaign'].SetLastUpdateIdForFlag = function(flag, id) end

---`Method Public Instance`
---@param flag Barotrauma.MultiPlayerCampaign.NetFlags
_G['MultiPlayerCampaign'].IncrementLastUpdateIdForFlag = function(flag) end

---`Method Public Instance`
_G['MultiPlayerCampaign'].IncrementAllLastUpdateIds = function() end

---`Method Private Static`
---@param flag Barotrauma.MultiPlayerCampaign.NetFlags
---@return System.Boolean
_G['MultiPlayerCampaign'].ValidateFlag = function(flag) end

---`Method Public Static`
---@param mapSeed System.String
---@param settings Barotrauma.CampaignSettings
---@return Barotrauma.MultiPlayerCampaign
_G['MultiPlayerCampaign'].StartNew = function(mapSeed, settings) end

---`Method Public Static`
---@param element System.Xml.Linq.XElement
---@return Barotrauma.MultiPlayerCampaign
_G['MultiPlayerCampaign'].LoadNew = function(element) end

---`Method Private Instance`
_G['MultiPlayerCampaign'].InitProjSpecific = function() end

---`Method Public Static`
---@param loadPath System.String
---@return System.String
_G['MultiPlayerCampaign'].GetCharacterDataSavePath = function(loadPath) end

---`Method Public Static`
---@return System.String
_G['MultiPlayerCampaign'].GetCharacterDataPathForLoading = function() end

---`Method Public Static`
---@return System.String
_G['MultiPlayerCampaign'].GetCharacterDataPathForSaving = function() end

---`Method Private Instance`
---@param element System.Xml.Linq.XElement
_G['MultiPlayerCampaign'].Load = function(element) end

---`Method Public Static`
---@return (System.Collections.Generic.List*1Barotrauma*SubmarineInfo)|(Barotrauma.SubmarineInfo[])
_G['MultiPlayerCampaign'].GetCampaignSubs = function() end

---`Method Private Static`
---@overload fun(msg:Barotrauma.Networking.IWriteMessage, purchasedItems:(System.Collections.Generic.Dictionary*1Barotrauma*Identifier*1System*Collections*Generic*List*2Barotrauma*PurchasedItem)|({[Barotrauma.Identifier]:((System.Collections.Generic.List*1Barotrauma*PurchasedItem)|(Barotrauma.PurchasedItem[]))}))
---@param msg Barotrauma.Networking.IWriteMessage
---@param soldItems (System.Collections.Generic.Dictionary*1Barotrauma*Identifier*1System*Collections*Generic*List*2Barotrauma*SoldItem)|({[Barotrauma.Identifier]:((System.Collections.Generic.List*1Barotrauma*SoldItem)|(Barotrauma.SoldItem[]))})
_G['MultiPlayerCampaign'].WriteItems = function(msg, soldItems) end

---`Method Private Static`
---@param msg Barotrauma.Networking.IReadMessage
---@param sender Barotrauma.Networking.Client
---@return (System.Collections.Generic.Dictionary*1Barotrauma*Identifier*1System*Collections*Generic*List*2Barotrauma*PurchasedItem)|({[Barotrauma.Identifier]:((System.Collections.Generic.List*1Barotrauma*PurchasedItem)|(Barotrauma.PurchasedItem[]))})
_G['MultiPlayerCampaign'].ReadPurchasedItems = function(msg, sender) end

---`Method Private Static`
---@param msg Barotrauma.Networking.IReadMessage
---@return (System.Collections.Generic.Dictionary*1Barotrauma*Identifier*1System*Collections*Generic*List*2Barotrauma*SoldItem)|({[Barotrauma.Identifier]:((System.Collections.Generic.List*1Barotrauma*SoldItem)|(Barotrauma.SoldItem[]))})
_G['MultiPlayerCampaign'].ReadSoldItems = function(msg) end

---`Constructor Private Instance`
---@param settings Barotrauma.CampaignSettings
---@return Barotrauma.MultiPlayerCampaign
_G['MultiPlayerCampaign'] = function(settings) end

---`Constructor Private Instance`
---@param settings Barotrauma.CampaignSettings
---@return Barotrauma.MultiPlayerCampaign
_G['MultiPlayerCampaign'].__new = function(settings) end

