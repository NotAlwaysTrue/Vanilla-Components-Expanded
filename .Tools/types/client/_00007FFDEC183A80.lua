---@meta
---@class Barotrauma.Networking.NetConfig : System.Object
---`Field Public Static`
---@field MaxPlayers System.Int32
---`Field Public Static`
---@field ServerNameMaxLength System.Int32
---`Field Public Static`
---@field ServerMessageMaxLength System.Int32
---`Field Public Static`
---@field MaxHealthUpdateInterval System.Single
---`Field Public Static`
---@field MaxHealthUpdateIntervalDead System.Single
---`Field Public Static`
---@field HighPrioCharacterPositionUpdateDistance System.Single
---`Field Public Static`
---@field LowPrioCharacterPositionUpdateDistance System.Single
---`Field Public Static`
---@field HighPrioCharacterPositionUpdateInterval System.Single
---`Field Public Static`
---@field LowPrioCharacterPositionUpdateInterval System.Single
---`Field Public Static`
---@field FreezeCharacterIfPositionDataMissingDelay System.Single
---`Field Public Static`
---@field DisableCharacterIfPositionDataMissingDelay System.Single
---`Field Public Static`
---@field DeleteDisconnectedTime System.Single
---`Field Public Static`
---@field ItemConditionUpdateInterval System.Single
---`Field Public Static`
---@field LevelObjectUpdateInterval System.Single
---`Field Public Static`
---@field HullUpdateInterval System.Single
---`Field Public Static`
---@field SparseHullUpdateInterval System.Single
---`Field Public Static`
---@field HullUpdateDistance System.Single
---`Field Public Static`
---@field MaxEventPacketsPerUpdate System.Int32
---`Field Public Static`
---@field RoundStartSyncDuration System.Single
---`Field Public Static`
---@field EventRemovalTime System.Single
---`Field Public Static`
---@field OldReceivedEventKickTime System.Single
---`Field Public Static`
---@field OldEventKickTime System.Single
---`Field Public Static`
---@field DefaultPort System.Int32
---`Field Public Static`
---@field DefaultQueryPort System.Int32
---`Field Public Static`
---@field MaxPhysicsBodyVelocity System.Single
---`Field Public Static`
---@field MaxPhysicsBodyAngularVelocity System.Single
_G['NetConfig'] = {}

---`Method Public Static`
---@param simPositionError Microsoft.Xna.Framework.Vector2
---@param smoothingFactor? System.Nullable*1System*Single
---@return Microsoft.Xna.Framework.Vector2
_G['NetConfig'].InterpolateSimPositionError = function(simPositionError, smoothingFactor) end

---`Method Public Static`
---@param rotationError System.Single
---@return System.Single
_G['NetConfig'].InterpolateRotationError = function(rotationError) end

---`Method Public Static`
---@param cursorPositionError Microsoft.Xna.Framework.Vector2
---@return Microsoft.Xna.Framework.Vector2
_G['NetConfig'].InterpolateCursorPositionError = function(cursorPositionError) end

---`Method Public Static`
---@overload fun(value:Microsoft.Xna.Framework.Vector2, min:System.Single, max:System.Single, numberOfBits:System.Int32):(Microsoft.Xna.Framework.Vector2)
---@param value System.Single
---@param min System.Single
---@param max System.Single
---@param numberOfBits System.Int32
---@return System.Single
_G['NetConfig'].Quantize = function(value, min, max, numberOfBits) end

---`Constructor Private Static`
---@return Barotrauma.Networking.NetConfig
_G['NetConfig'] = function() end

---`Constructor Private Static`
---@return Barotrauma.Networking.NetConfig
_G['NetConfig'].__new = function() end

