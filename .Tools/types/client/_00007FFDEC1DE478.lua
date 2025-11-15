---@meta
---@class Barotrauma.Items.Components.ItemSound : System.Object
---`Field Public Instance`
---@field RoundSound Barotrauma.RoundSound
---`Field Public Instance`
---@field Type Barotrauma.ActionType
---`Field Public Instance`
---@field VolumeProperty Barotrauma.Identifier
---`Field Public Instance`
---@field Loop System.Boolean
---`Field Public Instance`
---@field OnlyPlayInSameSub System.Boolean
---`Getter Public Instance`
---@field VolumeMultiplier System.Single
---`Getter Public Instance`
---@field Range System.Single
_G['Components']['ItemSound'] = {}

---`Constructor Public Instance`
---@param sound Barotrauma.RoundSound
---@param type Barotrauma.ActionType
---@param loop? System.Boolean
---@param onlyPlayInSameSub? System.Boolean
---@return Barotrauma.Items.Components.ItemSound
_G['Components']['ItemSound'] = function(sound, type, loop, onlyPlayInSameSub) end

---`Constructor Public Instance`
---@param sound Barotrauma.RoundSound
---@param type Barotrauma.ActionType
---@param loop? System.Boolean
---@param onlyPlayInSameSub? System.Boolean
---@return Barotrauma.Items.Components.ItemSound
_G['Components']['ItemSound'].__new = function(sound, type, loop, onlyPlayInSameSub) end

