---@meta
---@class Barotrauma.TraitorManager : System.Object
---`Field Private Instance`
---@field startTimer System.Single
---`Field Private Instance`
---@field started System.Boolean
---`Field Private Instance`
---@field results System.Nullable*1Barotrauma*TraitorManager*TraitorResults
---`Field Private Instance`
---@field previousTraitorEvents (System.Collections.Generic.List*1Barotrauma*TraitorManager*PreviousTraitorEvent)|(Barotrauma.TraitorManager.PreviousTraitorEvent[])
---`Field Private Instance`
---@field activeEvents (System.Collections.Generic.List*1Barotrauma*TraitorManager*ActiveTraitorEvent)|(Barotrauma.TraitorManager.ActiveTraitorEvent[])
---`Field Private Instance`
---@field server Barotrauma.Networking.GameServer
---`Field Private Instance`
---@field eventManager Barotrauma.EventManager
---`Field Private Instance`
---@field level Barotrauma.Level
---`Field Public Instance`
---@field Enabled System.Boolean
---`Field Private Static`
---@field MaxPreviousEventHistory System.Int32
---`Field Private Static`
---@field StartDelayMin System.Int32
---`Field Private Static`
---@field StartDelayMax System.Int32
---`Getter Public Instance`
---@field ActiveEvents (System.Collections.Generic.IEnumerable*1Barotrauma*TraitorManager*ActiveTraitorEvent)|(fun():(Barotrauma.TraitorManager.ActiveTraitorEvent))
_G['TraitorManager'] = {}

---`Method Public Instance`
---@param character Barotrauma.Character
---@return System.Boolean
_G['TraitorManager'].IsTraitor = function(character) end

---`Method Public Instance`
---@param eventManager Barotrauma.EventManager
---@param level Barotrauma.Level
_G['TraitorManager'].Initialize = function(eventManager, level) end

---`Method Private Instance`
---@param eventManager Barotrauma.EventManager
---@param level Barotrauma.Level
---@return System.Boolean
_G['TraitorManager'].TryCreateTraitorEvents = function(eventManager, level) end

---`Method Private Instance`
---@return Barotrauma.Networking.Client
_G['TraitorManager'].SelectRandomTraitor = function() end

---`Method Private Instance`
---@param traitorEvent Barotrauma.TraitorEvent
---@param mainTraitor Barotrauma.Networking.Client
---@return (System.Collections.Generic.IEnumerable*1Barotrauma*Networking*Client)|(fun():(Barotrauma.Networking.Client))
_G['TraitorManager'].SelectSecondaryTraitors = function(traitorEvent, mainTraitor) end

---`Method Private Instance`
---@param client Barotrauma.Networking.Client
---@return System.Boolean
_G['TraitorManager'].IsClientViableTraitor = function(client) end

---`Method Private Instance`
---@param prefab Barotrauma.TraitorEventPrefab
---@return System.Single
_G['TraitorManager'].GetTraitorEventPrefabCommonness = function(prefab) end

---`Method Private Instance`
---@param client Barotrauma.Networking.Client
---@return System.Single
_G['TraitorManager'].GetTraitorProbability = function(client) end

---`Method Private Instance`
---@param condition (System.Func*1Barotrauma*TraitorManager*PreviousTraitorEvent*1System*Boolean)|(fun(arg:Barotrauma.TraitorManager.PreviousTraitorEvent):(System.Boolean))
---@return System.Nullable*1System*Int32
_G['TraitorManager'].GetRoundsSinceLastSelected = function(condition) end

---`Method Private Instance`
---@param eventManager Barotrauma.EventManager
---@param selectedPrefab Barotrauma.TraitorEventPrefab
---@param traitor Barotrauma.Networking.Client
_G['TraitorManager'].CreateTraitorEvent = function(eventManager, selectedPrefab, traitor) end

---`Method Public Instance`
---@param traitorEventPrefab Barotrauma.TraitorEventPrefab
_G['TraitorManager'].ForceTraitorEvent = function(traitorEventPrefab) end

---`Method Public Instance`
_G['TraitorManager'].SkipStartDelay = function() end

---`Method Public Instance`
---@param deltaTime System.Single
_G['TraitorManager'].Update = function(deltaTime) end

---`Method Public Instance`
_G['TraitorManager'].EndRound = function() end

---`Method Public Instance`
---@return Barotrauma.Networking.Client
_G['TraitorManager'].GetClientAccusedAsTraitor = function() end

---`Method Public Instance`
---@return System.Nullable*1Barotrauma*TraitorManager*TraitorResults
_G['TraitorManager'].GetEndResults = function() end

---`Method Public Instance`
---@return System.Xml.Linq.XElement
_G['TraitorManager'].Save = function() end

---`Method Public Instance`
---@param traitorManagerElement System.Xml.Linq.XElement
_G['TraitorManager'].Load = function(traitorManagerElement) end

---`Method Public Instance`
---@param ev Barotrauma.TraitorEvent
_G['TraitorManager'].SendCurrentState = function(ev) end

---`Constructor Public Instance`
---@param server Barotrauma.Networking.GameServer
---@return Barotrauma.TraitorManager
_G['TraitorManager'] = function(server) end

---`Constructor Public Instance`
---@param server Barotrauma.Networking.GameServer
---@return Barotrauma.TraitorManager
_G['TraitorManager'].__new = function(server) end

