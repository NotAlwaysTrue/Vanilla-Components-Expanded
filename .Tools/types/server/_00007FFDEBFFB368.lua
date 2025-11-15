---@meta
---@class Barotrauma.KarmaManager : System.Object
---`Field Public Instance`
---@field TestMode System.Boolean
---`Field Private Instance`
---@field clientMemories (System.Collections.Generic.Dictionary*1Barotrauma*Networking*Client*1Barotrauma*KarmaManager*ClientMemory)|({[Barotrauma.Networking.Client]:(Barotrauma.KarmaManager.ClientMemory)})
---`Field Private Instance`
---@field bannedClients (System.Collections.Generic.List*1Barotrauma*Networking*Client)|(Barotrauma.Networking.Client[])
---`Field Private Instance`
---@field perSecondUpdate System.DateTime
---`Field Private Instance`
---@field allowedWireDisconnectionsPerMinute System.Int32
---`Field Private Instance`
---@field herpesAffliction Barotrauma.AfflictionPrefab
---`Field Public Instance`
---@field Presets (System.Collections.Generic.Dictionary*1System*String*1System*Xml*Linq*XElement)|({[System.String]:(System.Xml.Linq.XElement)})
---`Field Public Static`
---@field ConfigFile System.String
---`Getter Public Instance Virtual`
---@field Name System.String
---`Getter Public Instance Virtual`
---<br/>`Setter Private Instance`
---@field SerializableProperties (System.Collections.Generic.Dictionary*1Barotrauma*Identifier*1Barotrauma*SerializableProperty)|({[Barotrauma.Identifier]:(Barotrauma.SerializableProperty)})
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field ResetKarmaBetweenRounds System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field KarmaDecay System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field KarmaDecayThreshold System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field KarmaIncrease System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field KarmaIncreaseThreshold System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field StructureRepairKarmaIncrease System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field StructureDamageKarmaDecrease System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field MaxStructureDamageKarmaDecreasePerSecond System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field ItemRepairKarmaIncrease System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field ReactorOverheatKarmaDecrease System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field ReactorMeltdownKarmaDecrease System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field DamageEnemyKarmaIncrease System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field HealFriendlyKarmaIncrease System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field DamageFriendlyKarmaDecrease System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field StunFriendlyKarmaDecrease System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field StunFriendlyKarmaDecreaseThreshold System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field ExtinguishFireKarmaIncrease System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field DangerousItemStealKarmaDecrease System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field DangerousItemStealBots System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field BallastFloraKarmaIncrease System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field AllowedWireDisconnectionsPerMinute System.Int32
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field WireDisconnectionKarmaDecrease System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field SteerSubKarmaIncrease System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field SpamFilterKarmaDecrease System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field HerpesThreshold System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field KickBanThreshold System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field KicksBeforeBan System.Int32
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field KarmaNotificationInterval System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field AllowedRetaliationTime System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field DangerousItemContainKarmaDecrease System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field IsDangerousItemContainKarmaDecreaseIncremental System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field MaxDangerousItemContainKarmaDecrease System.Single
_G['KarmaManager'] = {}

---`Method Public Instance`
---@param clients (System.Collections.Generic.IEnumerable*1Barotrauma*Networking*Client)|(fun():(Barotrauma.Networking.Client))
---@param deltaTime System.Single
_G['KarmaManager'].UpdateClients = function(clients, deltaTime) end

---`Method Private Instance`
---@param client Barotrauma.Networking.Client
---@param debugKarmaChangeReason? System.String
_G['KarmaManager'].SendKarmaNotifications = function(client, debugKarmaChangeReason) end

---`Method Private Instance`
---@param client Barotrauma.Networking.Client
---@param deltaTime System.Single
_G['KarmaManager'].UpdateClient = function(client, deltaTime) end

---`Method Public Instance`
_G['KarmaManager'].OnRoundEnded = function() end

---`Method Public Instance`
---@param client Barotrauma.Networking.Client
_G['KarmaManager'].OnClientDisconnected = function(client) end

---`Method Public Instance`
---@param character Barotrauma.Character
---@param damage System.Single
_G['KarmaManager'].OnBallastFloraDamaged = function(character, damage) end

---`Method Public Instance`
---@param inventory Barotrauma.CharacterInventory
---@param yoinker Barotrauma.Networking.Client
---@param item Barotrauma.Item
_G['KarmaManager'].OnItemTakenFromPlayer = function(inventory, yoinker, item) end

---`Method Public Instance`
---@param target Barotrauma.Character
---@param attacker Barotrauma.Character
---@param damage System.Single
---@param stun System.Single
---@param appliedAfflictions? (System.Collections.Generic.IEnumerable*1Barotrauma*Affliction)|(fun():(Barotrauma.Affliction))
_G['KarmaManager'].OnCharacterHealthChanged = function(target, attacker, damage, stun, appliedAfflictions) end

---`Method Public Instance`
---@param structure Barotrauma.Structure
---@param attacker Barotrauma.Character
---@param damageAmount System.Single
_G['KarmaManager'].OnStructureHealthChanged = function(structure, attacker, damageAmount) end

---`Method Public Instance`
---@param character Barotrauma.Character
---@param repairable Barotrauma.Items.Components.Repairable
---@param repairAmount System.Single
_G['KarmaManager'].OnItemRepaired = function(character, repairable, repairAmount) end

---`Method Public Instance`
---@param reactor Barotrauma.Item
---@param character Barotrauma.Character
---@param deltaTime System.Single
_G['KarmaManager'].OnReactorOverHeating = function(reactor, character, deltaTime) end

---`Method Public Instance`
---@param reactor Barotrauma.Item
---@param character Barotrauma.Character
_G['KarmaManager'].OnReactorMeltdown = function(reactor, character) end

---`Method Public Instance`
---@param character Barotrauma.Character
---@param deltaTime System.Single
_G['KarmaManager'].OnExtinguishingFire = function(character, deltaTime) end

---`Method Public Instance`
---@param character Barotrauma.Character
---@param wire Barotrauma.Items.Components.Wire
_G['KarmaManager'].OnWireDisconnected = function(character, wire) end

---`Method Private Instance`
---@param client Barotrauma.Networking.Client
---@return Barotrauma.KarmaManager.ClientMemory
_G['KarmaManager'].GetClientMemory = function(client) end

---`Method Public Instance`
---@param client Barotrauma.Networking.Client
_G['KarmaManager'].OnSpamFilterTriggered = function(client) end

---`Method Public Instance`
---@param containedItem Barotrauma.Item
---@param container Barotrauma.Item
---@param character Barotrauma.Character
_G['KarmaManager'].OnItemContained = function(containedItem, container, character) end

---`Method Private Instance`
---@param target Barotrauma.Character
---@param amount System.Single
---@param debugKarmaChangeReason? System.String
_G['KarmaManager'].AdjustKarma = function(target, amount, debugKarmaChangeReason) end

---`Method Public Instance`
---@param presetName System.String
_G['KarmaManager'].SelectPreset = function(presetName) end

---`Method Public Instance`
_G['KarmaManager'].SaveCustomPreset = function() end

---`Method Public Instance`
_G['KarmaManager'].Save = function() end

---`Constructor Public Instance`
---@overload fun():Barotrauma.KarmaManager
---@return Barotrauma.KarmaManager
_G['KarmaManager'] = function() end

---`Constructor Public Instance`
---@overload fun():Barotrauma.KarmaManager
---@return Barotrauma.KarmaManager
_G['KarmaManager'].__new = function() end

---`Constructor Private Static`
---@overload fun():Barotrauma.KarmaManager
---@return Barotrauma.KarmaManager
_G['KarmaManager'] = function() end

---`Constructor Private Static`
---@overload fun():Barotrauma.KarmaManager
---@return Barotrauma.KarmaManager
_G['KarmaManager'].__new = function() end

