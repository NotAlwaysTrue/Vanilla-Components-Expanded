---@meta
---@class Barotrauma.TraitorManager.TraitorResults : System.ValueType
---`Field Public Instance`
---@field VotedAsTraitorClientSessionId System.Byte
---`Field Public Instance`
---@field VotedCorrectTraitor System.Boolean
---`Field Public Instance`
---@field ObjectiveSuccessful System.Boolean
---`Field Public Instance`
---@field MoneyPenalty System.Int32
---`Field Public Instance`
---@field TraitorEventIdentifier Barotrauma.Identifier
_G['TraitorManager']['TraitorResults'] = {}

---`Method Public Instance`
---@return Barotrauma.Networking.Client
_G['TraitorManager']['TraitorResults'].GetTraitorClient = function() end

---`Constructor Public Instance`
---@param votedAsTraitor Barotrauma.Networking.Client
---@param traitorEvent Barotrauma.TraitorEvent
---@return Barotrauma.TraitorManager.TraitorResults
_G['TraitorManager']['TraitorResults'] = function(votedAsTraitor, traitorEvent) end

---`Constructor Public Instance`
---@param votedAsTraitor Barotrauma.Networking.Client
---@param traitorEvent Barotrauma.TraitorEvent
---@return Barotrauma.TraitorManager.TraitorResults
_G['TraitorManager']['TraitorResults'].__new = function(votedAsTraitor, traitorEvent) end

