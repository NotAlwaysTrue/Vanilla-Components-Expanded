---@meta
---@class Barotrauma.TraitorEvent : Barotrauma.ScriptedEvent
---`Field Public Instance`
---@field OnStateChanged (System.Action)|(fun())
---`Field Private Instance`
---@field prefab Barotrauma.TraitorEventPrefab
---`Field Private Instance`
---@field codeWord Barotrauma.LocalizedString
---`Field Private Instance`
---@field currentState Barotrauma.TraitorEvent.State
---`Field Private Instance`
---@field traitor Barotrauma.Networking.Client
---`Field Private Instance`
---@field secondaryTraitors (System.Collections.Generic.HashSet*1Barotrauma*Networking*Client)|(Barotrauma.Networking.Client[])
---`Field Private Static`
---@field nonActionChildElementNames (System.Collections.Generic.HashSet*1Barotrauma*Identifier)|(Barotrauma.Identifier[])
---`Getter Public Instance`
---@field Prefab Barotrauma.TraitorEventPrefab
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field CurrentState Barotrauma.TraitorEvent.State
---`Getter Public Instance`
---@field Traitor Barotrauma.Networking.Client
---`Getter Public Instance`
---@field SecondaryTraitors (System.Collections.Generic.IEnumerable*1Barotrauma*Networking*Client)|(fun():(Barotrauma.Networking.Client))
---`Getter NonPublic Instance Virtual`
---@field NonActionChildElementNames (System.Collections.Generic.IEnumerable*1Barotrauma*Identifier)|(fun():(Barotrauma.Identifier))
_G['TraitorEvent'] = {}

---`Method Public Instance Virtual`
---@return System.String
_G['TraitorEvent'].ToString = function() end

---`Method NonPublic Instance Virtual`
---@param parentSet? Barotrauma.EventSet
_G['TraitorEvent'].InitEventSpecific = function(parentSet) end

---`Method Public Instance Virtual`
---@param str Barotrauma.LocalizedString
---@return Barotrauma.LocalizedString
_G['TraitorEvent'].ReplaceVariablesInEventText = function(str) end

---`Method Public Instance`
---@param traitor Barotrauma.Networking.Client
_G['TraitorEvent'].SetTraitor = function(traitor) end

---`Method Public Instance`
---@param traitors (System.Collections.Generic.IEnumerable*1Barotrauma*Networking*Client)|(fun():(Barotrauma.Networking.Client))
_G['TraitorEvent'].SetSecondaryTraitors = function(traitors) end

---`Constructor Public Instance`
---@overload fun(prefab:Barotrauma.TraitorEventPrefab, seed:System.Int32):Barotrauma.TraitorEvent
---@return Barotrauma.TraitorEvent
_G['TraitorEvent'] = function() end

---`Constructor Public Instance`
---@overload fun(prefab:Barotrauma.TraitorEventPrefab, seed:System.Int32):Barotrauma.TraitorEvent
---@return Barotrauma.TraitorEvent
_G['TraitorEvent'].__new = function() end

---`Constructor Private Static`
---@overload fun(prefab:Barotrauma.TraitorEventPrefab, seed:System.Int32):Barotrauma.TraitorEvent
---@return Barotrauma.TraitorEvent
_G['TraitorEvent'] = function() end

---`Constructor Private Static`
---@overload fun(prefab:Barotrauma.TraitorEventPrefab, seed:System.Int32):Barotrauma.TraitorEvent
---@return Barotrauma.TraitorEvent
_G['TraitorEvent'].__new = function() end

