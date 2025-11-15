---@meta
---@class Barotrauma.CrewManager : System.Object
---`Field Private Instance`
---@field conversationTimer System.Single
---`Field Private Instance`
---@field conversationLineTimer System.Single
---`Field Private Instance`
---@field pendingConversationLines (System.Collections.Generic.List*1System*ValueTuple*2Barotrauma*Character*2System*String)|(System.ValueTuple*1Barotrauma*Character*1System*String[])
---`Field Private Instance`
---@field characterInfos (System.Collections.Generic.List*1Barotrauma*CharacterInfo)|(Barotrauma.CharacterInfo[])
---`Field Private Instance`
---@field characters (System.Collections.Generic.List*1Barotrauma*Character)|(Barotrauma.Character[])
---`Field Private Instance`
---@field reserveBench (System.Collections.Generic.List*1Barotrauma*CharacterInfo)|(Barotrauma.CharacterInfo[])
---`Field Private Instance`
---@field welcomeMessageNPC Barotrauma.Character
---`Field Public Instance`
---@field ActiveReadyCheck Barotrauma.ReadyCheck
---`Field Private Static`
---@field ConversationIntervalMin System.Single
---`Field Private Static`
---@field ConversationIntervalMax System.Single
---`Field Private Static`
---@field ConversationIntervalMultiplierMultiplayer System.Single
---`Field Public Static`
---@field MaxCrewSize System.Int32
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field HasBots System.Boolean
---`Getter Public Instance`
---@field ActiveOrders (System.Collections.Generic.List*1Barotrauma*CrewManager*ActiveOrder)|(Barotrauma.CrewManager.ActiveOrder[])
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field IsSinglePlayer System.Boolean
_G['CrewManager'] = {}

---`Method Public Instance`
---@param parentElement System.Xml.Linq.XElement
---@return System.Xml.Linq.XElement
_G['CrewManager'].SaveMultiplayer = function(parentElement) end

---`Method Public Instance`
---@param msg Barotrauma.Networking.IWriteMessage
_G['CrewManager'].ServerWriteActiveOrders = function(msg) end

---`Method Public Instance`
---@param inc Barotrauma.Networking.IReadMessage
---@param sender Barotrauma.Networking.Client
_G['CrewManager'].ReadToggleReserveBenchMessage = function(inc, sender) end

---`Method Public Instance`
---@param characterInfo Barotrauma.CharacterInfo
---@param client Barotrauma.Networking.Client
---@param pendingHire? System.Boolean
---@param confirmPendingHire? System.Boolean
---@param sendUpdate? System.Boolean
_G['CrewManager'].ToggleReserveBenchStatus = function(characterInfo, client, pendingHire, confirmPendingHire, sendUpdate) end

---`Method Public Instance`
---@param includeReserveBench? System.Boolean
---@return (System.Collections.Generic.IEnumerable*1Barotrauma*CharacterInfo)|(fun():(Barotrauma.CharacterInfo))
_G['CrewManager'].GetCharacterInfos = function(includeReserveBench) end

---`Method Public Instance`
---@return (System.Collections.Generic.IEnumerable*1Barotrauma*CharacterInfo)|(fun():(Barotrauma.CharacterInfo))
_G['CrewManager'].GetReserveBenchInfos = function() end

---`Method Public Instance`
---@param order Barotrauma.Order
---@param fadeOutTime System.Nullable*1System*Single
---@return System.Boolean
_G['CrewManager'].AddOrder = function(order, fadeOutTime) end

---`Method Public Instance`
---@param element System.Xml.Linq.XElement
_G['CrewManager'].AddCharacterElements = function(element) end

---`Method Public Instance`
---@param characterInfo Barotrauma.CharacterInfo
_G['CrewManager'].RemoveCharacterInfo = function(characterInfo) end

---`Method Public Instance`
---@param character Barotrauma.Character
_G['CrewManager'].AddCharacter = function(character) end

---`Method Public Instance`
---@param character Barotrauma.Character
---@return System.Boolean
_G['CrewManager'].IsFired = function(character) end

---`Method Public Instance`
---@param character Barotrauma.Character
---@param removeInfo? System.Boolean
---@param resetCrewListIndex? System.Boolean
_G['CrewManager'].RemoveCharacter = function(character, removeInfo, resetCrewListIndex) end

---`Method Public Instance`
---@param characterInfo Barotrauma.CharacterInfo
_G['CrewManager'].AddCharacterInfo = function(characterInfo) end

---`Method Public Instance`
_G['CrewManager'].ClearCharacterInfos = function() end

---`Method Public Instance`
_G['CrewManager'].InitRound = function() end

---`Method Public Instance`
---@return (System.Collections.Generic.List*1Barotrauma*WayPoint)|(Barotrauma.WayPoint[])
_G['CrewManager'].GetOutpostSpawnpoints = function() end

---`Method Public Instance`
---@param character Barotrauma.Character
---@param mainSubWaypoint Barotrauma.WayPoint
---@param spawnWaypoint Barotrauma.WayPoint
_G['CrewManager'].InitializeCharacter = function(character, mainSubWaypoint, spawnWaypoint) end

---`Method Public Instance`
---@param characterInfo Barotrauma.CharacterInfo
---@param newName System.String
_G['CrewManager'].RenameCharacter = function(characterInfo, newName) end

---`Method Public Instance`
---@param characterInfo Barotrauma.CharacterInfo
_G['CrewManager'].FireCharacter = function(characterInfo) end

---`Method Public Instance`
_G['CrewManager'].ClearCurrentOrders = function() end

---`Method Public Instance`
---@param deltaTime System.Single
_G['CrewManager'].Update = function(deltaTime) end

---`Method Public Instance`
---@param conversationLines (System.Collections.Generic.List*1System*ValueTuple*2Barotrauma*Character*2System*String)|(System.ValueTuple*1Barotrauma*Character*1System*String[])
_G['CrewManager'].AddConversation = function(conversationLines) end

---`Method Private Instance`
_G['CrewManager'].CreateRandomConversation = function() end

---`Method Private Instance`
---@param deltaTime System.Single
_G['CrewManager'].UpdateConversations = function(deltaTime) end

---`Method Public Static`
---@param order Barotrauma.Order
---@param controlledCharacter Barotrauma.Character
---@param characters (System.Collections.Generic.IEnumerable*1Barotrauma*Character)|(fun():(Barotrauma.Character))
---@param includeSelf? System.Boolean
---@return Barotrauma.Character
_G['CrewManager'].GetCharacterForQuickAssignment = function(order, controlledCharacter, characters, includeSelf) end

---`Method Public Static`
---@param order Barotrauma.Order
---@param characters (System.Collections.Generic.IEnumerable*1Barotrauma*Character)|(fun():(Barotrauma.Character))
---@param controlledCharacter Barotrauma.Character
---@param includeSelf System.Boolean
---@param extraCharacters? (System.Collections.Generic.IEnumerable*1Barotrauma*Character)|(fun():(Barotrauma.Character))
---@return (System.Collections.Generic.IEnumerable*1Barotrauma*Character)|(fun():(Barotrauma.Character))
_G['CrewManager'].GetCharactersSortedForOrder = function(order, characters, controlledCharacter, includeSelf, extraCharacters) end

---`Method Public Instance`
---@param element System.Xml.Linq.XElement
_G['CrewManager'].SaveActiveOrders = function(element) end

---`Method Public Instance`
---@param element System.Xml.Linq.XElement
_G['CrewManager'].LoadActiveOrders = function(element) end

---`Constructor Public Instance`
---@param isSinglePlayer System.Boolean
---@return Barotrauma.CrewManager
_G['CrewManager'] = function(isSinglePlayer) end

---`Constructor Public Instance`
---@param isSinglePlayer System.Boolean
---@return Barotrauma.CrewManager
_G['CrewManager'].__new = function(isSinglePlayer) end

