---@meta
---@class Barotrauma.FishSwimFastParams : Barotrauma.FishSwimParams
_G['FishSwimFastParams'] = {}

---`Method Public Static`
---@param character Barotrauma.Character
---@return Barotrauma.FishSwimFastParams
_G['FishSwimFastParams'].GetDefaultAnimParams = function(character) end

---`Method Public Static`
---@param character Barotrauma.Character
---@param file Barotrauma.Either*1System*String*1Barotrauma*ContentPath
---@param throwErrors? System.Boolean
---@return Barotrauma.FishSwimFastParams
_G['FishSwimFastParams'].GetAnimParams = function(character, file, throwErrors) end

---`Method Public Instance Virtual`
_G['FishSwimFastParams'].StoreSnapshot = function() end

---`Constructor Public Instance`
---@return Barotrauma.FishSwimFastParams
_G['FishSwimFastParams'] = function() end

---`Constructor Public Instance`
---@return Barotrauma.FishSwimFastParams
_G['FishSwimFastParams'].__new = function() end

