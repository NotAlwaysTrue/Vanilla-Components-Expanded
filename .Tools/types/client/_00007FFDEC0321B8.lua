---@meta
---@class Barotrauma.CampaignMode : Barotrauma.GameMode
---`Field NonPublic Instance`
---@field overlayColor Microsoft.Xna.Framework.Color
---`Field NonPublic Instance`
---@field overlaySprite Barotrauma.Sprite
---`Field Private Instance`
---@field prevCampaignUIAutoOpenType Barotrauma.CampaignMode.TransitionType
---`Field NonPublic Instance`
---@field endRoundButton Barotrauma.GUIButton
---`Field Public Instance`
---@field ReadyCheckButton Barotrauma.GUIButton
---`Field NonPublic Instance`
---@field campaignUIContainer Barotrauma.GUIFrame
---`Field Public Instance`
---@field CampaignUI Barotrauma.CampaignUI
---`Field Private Instance`
---@field startRoundCancellationToken System.Threading.CancellationTokenSource
---`Field Private Instance`
---@field showCampaignUI System.Boolean
---`Field Private Instance`
---@field wasChatBoxOpen System.Boolean
---`Field Public Instance`
---@field TotalPlayTime System.Double
---`Field Public Instance`
---@field TotalPassedLevels System.Int32
---`Field Public Instance`
---@field CargoManager Barotrauma.CargoManager
---`Field Public Instance`
---@field UpgradeManager Barotrauma.UpgradeManager
---`Field Public Instance`
---@field MedicalClinic Barotrauma.MedicalClinic
---`Field Private Instance`
---@field factions (System.Collections.Generic.List*1Barotrauma*Faction)|(Barotrauma.Faction[])
---`Field Public Instance`
---@field CampaignMetadata Barotrauma.CampaignMetadata
---`Field NonPublic Instance`
---@field petsElement System.Xml.Linq.XElement
---`Field Public Instance`
---@field Settings Barotrauma.CampaignSettings
---`Field Private Instance`
---@field extraMissions (System.Collections.Generic.List*1Barotrauma*Mission)|(Barotrauma.Mission[])
---`Field Public Instance`
---@field OnMoneyChanged Barotrauma.NamedEvent*1Barotrauma*WalletChangedEvent
---`Field Public Instance`
---@field CheatsEnabled System.Boolean
---`Field NonPublic Instance`
---@field wasDocked System.Boolean
---`Field Private Instance`
---@field dialogLastSpoken (System.Collections.Generic.Dictionary*1System*String*1System*Double)|({[System.String]:(System.Double)})
---`Field Public Instance`
---@field PendingSubmarineSwitch Barotrauma.SubmarineInfo
---`Field NonPublic Instance`
---@field map Barotrauma.Map
---`Field Public Instance`
---@field Bank Barotrauma.Wallet
---`Field Public Instance`
---@field PurchasedLostShuttlesInLatestSave System.Boolean
---`Field Public Instance`
---@field PurchasedHullRepairsInLatestSave System.Boolean
---`Field Public Instance`
---@field PurchasedItemRepairsInLatestSave System.Boolean
---`Field Public Instance`
---@field DivingSuitWarningShown System.Boolean
---`Field Public Instance`
---@field ItemsRelocatedToMainSub System.Boolean
---`Field Private Instance`
---@field BeforeLevelLoading (System.Action)|(fun())
---`Field Private Instance`
---@field OnSaveAndQuit (System.Action)|(fun())
---`Field Private Instance`
---@field characterOutOfBoundsTimer (System.Collections.Generic.Dictionary*1Barotrauma*Character*1System*Single)|({[Barotrauma.Character]:(System.Single)})
---`Field Public Static`
---@field MaxMoney System.Int32
---`Field Public Static`
---@field InitialMoney System.Int32
---`Field NonPublic Static`
---@field EndTransitionDuration System.Single
---`Field Private Static`
---@field FirstRoundEventDelay System.Single
---`Field Public Static`
---@field HullRepairCostPerDamage System.Single
---`Field Public Static`
---@field ItemRepairCostPerRepairDuration System.Single
---`Field Public Static`
---@field ShuttleReplaceCost System.Int32
---`Field Public Static`
---@field MaxHullRepairCost System.Int32
---`Field Public Static`
---@field MaxItemRepairCost System.Int32
---`Getter Public Instance`
---<br/>`Setter NonPublic Instance`
---@field CrewDead System.Boolean
---`Getter Public Instance`
---@field EndRoundButton Barotrauma.GUIButton
---`Getter Public Instance`
---<br/>`Setter NonPublic Instance`
---@field SlideshowPlayer Barotrauma.SlideshowPlayer
---`Getter Public Instance`
---<br/>`Setter NonPublic Instance`
---@field ForceMapUI System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field ShowCampaignUI System.Boolean
---`Getter Public Instance Virtual`
---@field Wallet Barotrauma.Wallet
---`Getter Public Instance`
---@field Factions (System.Collections.Generic.IReadOnlyList*1Barotrauma*Faction)|(Barotrauma.Faction[])
---`Getter NonPublic Instance`
---<br/>`Setter NonPublic Instance`
---@field ActiveOrdersElement System.Xml.Linq.XElement
---`Getter Public Instance`
---<br/>`Setter NonPublic Instance`
---@field IsFirstRound System.Boolean
---`Getter Public Instance`
---@field DisableEvents System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field TransferItemsOnSubSwitch System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field SwitchedSubsThisRound System.Boolean
---`Getter Public Instance`
---@field Map Barotrauma.Map
---`Getter Public Instance Virtual`
---@field Missions (System.Collections.Generic.IEnumerable*1Barotrauma*Mission)|(fun():(Barotrauma.Mission))
---`Getter Public Instance`
---@field CurrentLocation Barotrauma.Location
---`Getter Public Instance`
---<br/>`Setter NonPublic Instance`
---@field NextLevel Barotrauma.LevelData
---`Getter Public Instance Virtual`
---<br/>`Setter Public Instance Virtual`
---@field PurchasedHullRepairs System.Boolean
---`Getter Public Instance Virtual`
---<br/>`Setter Public Instance Virtual`
---@field PurchasedLostShuttles System.Boolean
---`Getter Public Instance Virtual`
---<br/>`Setter Public Instance Virtual`
---@field PurchasedItemRepairs System.Boolean
_G['CampaignMode'] = {}

---`Method Public Instance Virtual`
_G['CampaignMode'].ShowStartMessage = function() end

---`Method Private Static`
---@param client Barotrauma.Networking.Client
---@return System.Boolean
_G['CampaignMode'].IsOwner = function(client) end

---`Method Public Static`
---@param permissions Barotrauma.Networking.ClientPermissions
---@return System.Boolean
_G['CampaignMode'].AllowedToManageCampaign = function(permissions) end

---`Method Public Static`
---@return System.Boolean
_G['CampaignMode'].AllowedToManageWallets = function() end

---`Method Public Static`
---@return System.Boolean
_G['CampaignMode'].AllowImmediateItemDelivery = function() end

---`Method NonPublic Instance`
---@return Barotrauma.GUIButton
_G['CampaignMode'].CreateEndRoundButton = function() end

---`Method Public Instance Virtual`
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
_G['CampaignMode'].Draw = function(spriteBatch) end

---`Method Public Instance`
---@param roundSummary Barotrauma.RoundSummary
---@param newLevel Barotrauma.LevelData
---@param mirror System.Boolean
---@param action (System.Action)|(fun())
---@return System.Threading.Tasks.Task
_G['CampaignMode'].SelectSummaryScreen = function(roundSummary, newLevel, mirror, action) end

---`Method Public Instance`
_G['CampaignMode'].CancelStartRound = function() end

---`Method Public Instance`
_G['CampaignMode'].ThrowIfStartRoundCancellationRequested = function() end

---`Method Public Instance Virtual`
_G['CampaignMode'].AddToGUIUpdateList = function() end

---`Method NonPublic Instance`
---@param onConfirm (System.Action)|(fun())
---@param onReturnToMapScreen (System.Action)|(fun())
_G['CampaignMode'].TryEndRoundWithFuelCheck = function(onConfirm, onReturnToMapScreen) end

---`Method Public Instance Virtual`
---@param deltaTime System.Single
_G['CampaignMode'].Update = function(deltaTime) end

---`Method Public Static`
---@param interactionType Barotrauma.CampaignMode.InteractionType
---@return System.Boolean
_G['CampaignMode'].HostileFactionDisablesInteraction = function(interactionType) end

---`Method Public Static`
---@param interactionType Barotrauma.CampaignMode.InteractionType
---@return System.Boolean
_G['CampaignMode'].BlocksInteraction = function(interactionType) end

---`Method Private Static`
---@param permissions Barotrauma.Networking.ClientPermissions
---@return System.Boolean
_G['CampaignMode'].AnyOneAllowedToManageCampaign = function(permissions) end

---`Method Public Instance Virtual`
---@param client? Barotrauma.Networking.Client
---@return Barotrauma.Wallet
_G['CampaignMode'].GetWallet = function(client) end

---`Method Public Instance Virtual`
---@param client Barotrauma.Networking.Client
---@param price System.Int32
---@return System.Boolean
_G['CampaignMode'].TryPurchase = function(client, price) end

---`Method Public Instance Virtual`
---@param client? Barotrauma.Networking.Client
---@return System.Int32
_G['CampaignMode'].GetBalance = function(client) end

---`Method Public Instance`
---@param cost System.Int32
---@param client? Barotrauma.Networking.Client
---@return System.Boolean
_G['CampaignMode'].CanAfford = function(cost, client) end

---`Method Public Instance`
---@return Barotrauma.Location
_G['CampaignMode'].GetCurrentDisplayLocation = function() end

---`Method Public Static`
---@param leavingSub Barotrauma.Submarine
---@return (System.Collections.Generic.List*1Barotrauma*Submarine)|(Barotrauma.Submarine[])
_G['CampaignMode'].GetSubsToLeaveBehind = function(leavingSub) end

---`Method Public Instance`
---@return Barotrauma.SubmarineInfo
_G['CampaignMode'].GetPredefinedStartOutpost = function() end

---`Method Public Instance Virtual`
_G['CampaignMode'].Start = function() end

---`Method Public Static`
---@return System.Int32
_G['CampaignMode'].GetHullRepairCost = function() end

---`Method Public Static`
---@return System.Int32
_G['CampaignMode'].GetItemRepairCost = function() end

---`Method Public Instance`
_G['CampaignMode'].InitFactions = function() end

---`Method Public Instance Virtual`
---@param levelData Barotrauma.LevelData
_G['CampaignMode'].AddExtraMissions = function(levelData) end

---`Method Public Instance`
_G['CampaignMode'].LoadNewLevel = function() end

---`Method NonPublic Instance Abstract Virtual`
_G['CampaignMode'].LoadInitialLevel = function() end

---`Method NonPublic Instance Abstract Virtual`
---@param transitionType Barotrauma.CampaignMode.TransitionType
---@param newLevel Barotrauma.LevelData
---@param leavingSub Barotrauma.Submarine
---@param mirror System.Boolean
---@return (System.Collections.Generic.IEnumerable*1Barotrauma*CoroutineStatus)|(fun():(Barotrauma.CoroutineStatus))
_G['CampaignMode'].DoLevelTransition = function(transitionType, newLevel, leavingSub, mirror) end

---`Method Public Instance`
---@overload fun(nextLevel:Barotrauma.LevelData-ref, leavingSub:Barotrauma.Submarine-ref):(Barotrauma.CampaignMode.TransitionType)
---@return Barotrauma.CampaignMode.TransitionType
_G['CampaignMode'].GetAvailableTransition = function() end

---`Method Private Static`
---@return Barotrauma.Submarine
_G['CampaignMode'].GetLeavingSub = function() end

---`Method Public Instance Virtual`
---@param transitionType? Barotrauma.CampaignMode.TransitionType
_G['CampaignMode'].End = function(transitionType) end

---`Method Public Instance`
_G['CampaignMode'].HandleSaveAndQuit = function() end

---`Method Public Instance`
_G['CampaignMode'].UpdateStoreStock = function() end

---`Method Public Instance`
_G['CampaignMode'].EndCampaign = function() end

---`Method NonPublic Instance Virtual`
_G['CampaignMode'].EndCampaignProjSpecific = function() end

---`Method Public Instance`
---@param randSync Barotrauma.Rand.RandSync
---@param allowEmpty? System.Boolean
---@return Barotrauma.Faction
_G['CampaignMode'].GetRandomFaction = function(randSync, allowEmpty) end

---`Method Public Static`
---@overload fun(factions:(System.Collections.Generic.IEnumerable*1Barotrauma*Faction)|(fun():(Barotrauma.Faction)), randSync:Barotrauma.Rand.RandSync, secondary?:System.Boolean, allowEmpty?:System.Boolean):(Barotrauma.Faction)
---@param factions (System.Collections.Generic.IEnumerable*1Barotrauma*Faction)|(fun():(Barotrauma.Faction))
---@param random System.Random
---@param secondary? System.Boolean
---@param allowEmpty? System.Boolean
---@return Barotrauma.Faction
_G['CampaignMode'].GetRandomFaction = function(factions, random, secondary, allowEmpty) end

---`Method Public Instance`
---@param randSync Barotrauma.Rand.RandSync
---@param allowEmpty? System.Boolean
---@return Barotrauma.Faction
_G['CampaignMode'].GetRandomSecondaryFaction = function(randSync, allowEmpty) end

---`Method Public Instance`
---@param location Barotrauma.Location
---@param characterInfo Barotrauma.CharacterInfo
---@param takeMoney? System.Boolean
---@param client? Barotrauma.Networking.Client
---@param buyingNewCharacter? System.Boolean
---@return System.Boolean
_G['CampaignMode'].TryHireCharacter = function(location, characterInfo, takeMoney, client, buyingNewCharacter) end

---`Method Public Instance`
---@param characterInfo Barotrauma.CharacterInfo
---@return System.Int32
_G['CampaignMode'].NewCharacterCost = function(characterInfo) end

---`Method Public Instance`
---@param characterInfo Barotrauma.CharacterInfo
---@return System.Boolean
_G['CampaignMode'].CanAffordNewCharacter = function(characterInfo) end

---`Method Private Instance`
---@param npc Barotrauma.Character
---@param interactor Barotrauma.Character
_G['CampaignMode'].NPCInteract = function(npc, interactor) end

---`Method Private Instance`
---@param npc Barotrauma.Character
---@param interactor Barotrauma.Character
---@return (System.Collections.Generic.IEnumerable*1Barotrauma*CoroutineStatus)|(fun():(Barotrauma.CoroutineStatus))
_G['CampaignMode'].DoCharacterWait = function(npc, interactor) end

---`Method Private Instance`
---@param npc Barotrauma.Character
---@param interactor Barotrauma.Character
_G['CampaignMode'].NPCInteractProjSpecific = function(npc, interactor) end

---`Method Public Instance`
---@param character Barotrauma.Character
---@param interactionType Barotrauma.CampaignMode.InteractionType
_G['CampaignMode'].AssignNPCMenuInteraction = function(character, interactionType) end

---`Method NonPublic Instance`
---@param deltaTime System.Single
_G['CampaignMode'].KeepCharactersCloseToOutpost = function(deltaTime) end

---`Method Public Instance`
---@param npc Barotrauma.Character
---@param attacker Barotrauma.Character
---@param attackResult Barotrauma.AttackResult
_G['CampaignMode'].OutpostNPCAttacked = function(npc, attacker, attackResult) end

---`Method Public Instance`
---@param identifier Barotrauma.Identifier
---@return Barotrauma.Faction
_G['CampaignMode'].GetFaction = function(identifier) end

---`Method Public Instance`
---@param factionIdentifier Barotrauma.Identifier
---@return System.Single
_G['CampaignMode'].GetReputation = function(factionIdentifier) end

---`Method Public Instance`
---@param factionIdentifier Barotrauma.Identifier
---@return Barotrauma.FactionAffiliation
_G['CampaignMode'].GetFactionAffiliation = function(factionIdentifier) end

---`Method Public Instance Abstract Virtual`
---@param element System.Xml.Linq.XElement
---@param isSavingOnLoading System.Boolean
_G['CampaignMode'].Save = function(element, isSavingOnLoading) end

---`Method NonPublic Instance`
---@param element System.Xml.Linq.XElement
_G['CampaignMode'].LoadStats = function(element) end

---`Method NonPublic Instance`
---@return System.Xml.Linq.XElement
_G['CampaignMode'].SaveStats = function() end

---`Method Public Instance`
_G['CampaignMode'].LogState = function() end

---`Method Public Instance Virtual`
_G['CampaignMode'].Remove = function() end

---`Method Public Instance`
---@param location Barotrauma.Location
---@return System.Int32
_G['CampaignMode'].NumberOfMissionsAtLocation = function(location) end

---`Method Public Instance`
---@param currentLocation Barotrauma.Location
---@param sender Barotrauma.Networking.Client
_G['CampaignMode'].CheckTooManyMissions = function(currentLocation, sender) end

---`Method NonPublic Static`
---@param leavingSub Barotrauma.Submarine
_G['CampaignMode'].LeaveUnconnectedSubs = function(leavingSub) end

---`Method Public Instance`
_G['CampaignMode'].SwitchSubs = function() end

---`Method NonPublic Instance`
_G['CampaignMode'].TransferItemsBetweenSubs = function() end

---`Method NonPublic Instance`
_G['CampaignMode'].RefreshOwnedSubmarines = function() end

---`Method Public Instance`
---@param parentElement? System.Xml.Linq.XElement
_G['CampaignMode'].SavePets = function(parentElement) end

---`Method Public Instance`
---@param element System.Xml.Linq.XElement
_G['CampaignMode'].LoadSaveSharedSingleAndMultiplayer = function(element) end

---`Method Public Instance`
_G['CampaignMode'].LoadPets = function() end

---`Method Public Instance`
---@param parentElement? System.Xml.Linq.XElement
_G['CampaignMode'].SaveActiveOrders = function(parentElement) end

---`Method Public Instance`
_G['CampaignMode'].LoadActiveOrders = function() end

---`Constructor NonPublic Instance`
---@param preset Barotrauma.GameModePreset
---@param settings Barotrauma.CampaignSettings
---@return Barotrauma.CampaignMode
_G['CampaignMode'] = function(preset, settings) end

---`Constructor NonPublic Instance`
---@param preset Barotrauma.GameModePreset
---@param settings Barotrauma.CampaignSettings
---@return Barotrauma.CampaignMode
_G['CampaignMode'].__new = function(preset, settings) end

