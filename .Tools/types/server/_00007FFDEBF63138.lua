---@meta
---@class Barotrauma.HumanRunParams : Barotrauma.HumanGroundedParams
_G['HumanRunParams'] = {}

---`Method Public Static`
---@param character Barotrauma.Character
---@return Barotrauma.HumanRunParams
_G['HumanRunParams'].GetDefaultAnimParams = function(character) end

---`Method Public Static`
---@param character Barotrauma.Character
---@param file Barotrauma.Either*1System*String*1Barotrauma*ContentPath
---@param throwErrors? System.Boolean
---@return Barotrauma.HumanRunParams
_G['HumanRunParams'].GetAnimParams = function(character, file, throwErrors) end

---`Method Public Instance Virtual`
_G['HumanRunParams'].StoreSnapshot = function() end

---`Constructor Public Instance`
---@return Barotrauma.HumanRunParams
_G['HumanRunParams'] = function() end

---`Constructor Public Instance`
---@return Barotrauma.HumanRunParams
_G['HumanRunParams'].__new = function() end

