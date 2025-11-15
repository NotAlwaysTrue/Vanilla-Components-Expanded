---@meta
---@class Barotrauma.FishSwimSlowParams : Barotrauma.FishSwimParams
_G['FishSwimSlowParams'] = {}

---`Method Public Static`
---@param character Barotrauma.Character
---@return Barotrauma.FishSwimSlowParams
_G['FishSwimSlowParams'].GetDefaultAnimParams = function(character) end

---`Method Public Static`
---@param character Barotrauma.Character
---@param file Barotrauma.Either*1System*String*1Barotrauma*ContentPath
---@param throwErrors? System.Boolean
---@return Barotrauma.FishSwimSlowParams
_G['FishSwimSlowParams'].GetAnimParams = function(character, file, throwErrors) end

---`Method Public Instance Virtual`
_G['FishSwimSlowParams'].StoreSnapshot = function() end

---`Constructor Public Instance`
---@return Barotrauma.FishSwimSlowParams
_G['FishSwimSlowParams'] = function() end

---`Constructor Public Instance`
---@return Barotrauma.FishSwimSlowParams
_G['FishSwimSlowParams'].__new = function() end

