---@meta
---@class Barotrauma.Networking.RespawnManager.TeamSpecificState : System.Object
---`Field Public Instance`
---@field TeamID Barotrauma.CharacterTeamType
---`Field Public Instance`
---@field State Barotrauma.Networking.RespawnManager.State
---`Field Public Instance`
---@field RespawnedCharacters (System.Collections.Generic.List*1Barotrauma*Character)|(Barotrauma.Character[])
---`Field Public Instance`
---@field RespawnTime System.DateTime
---`Field Public Instance`
---@field ReturnTime System.DateTime
---`Field Public Instance`
---@field DespawnTime System.DateTime
---`Field Public Instance`
---@field RespawnCountdownStarted System.Boolean
---`Field Public Instance`
---@field ReturnCountdownStarted System.Boolean
---`Field Public Instance`
---@field PendingRespawnCount System.Int32
---`Field Public Instance`
---@field RequiredRespawnCount System.Int32
---`Field Public Instance`
---@field PrevPendingRespawnCount System.Int32
---`Field Public Instance`
---@field PrevRequiredRespawnCount System.Int32
---`Field Public Instance`
---@field CurrentState Barotrauma.Networking.RespawnManager.State
---`Field Public Instance`
---@field RespawnItems (System.Collections.Generic.List*1Barotrauma*Item)|(Barotrauma.Item[])
_G['RespawnManager']['TeamSpecificState'] = {}

---`Constructor Public Instance`
---@param teamID Barotrauma.CharacterTeamType
---@return Barotrauma.Networking.RespawnManager.TeamSpecificState
_G['RespawnManager']['TeamSpecificState'] = function(teamID) end

---`Constructor Public Instance`
---@param teamID Barotrauma.CharacterTeamType
---@return Barotrauma.Networking.RespawnManager.TeamSpecificState
_G['RespawnManager']['TeamSpecificState'].__new = function(teamID) end

