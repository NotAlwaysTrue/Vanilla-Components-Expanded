---@meta
---@class Barotrauma.HumanCrouchParams : Barotrauma.HumanGroundedParams
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field MoveDownAmountWhenStationary System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field ExtraHeadAngleWhenStationary System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field ExtraTorsoAngleWhenStationary System.Single
_G['HumanCrouchParams'] = {}

---`Method Public Static`
---@param character Barotrauma.Character
---@return Barotrauma.HumanCrouchParams
_G['HumanCrouchParams'].GetDefaultAnimParams = function(character) end

---`Method Public Static`
---@param character Barotrauma.Character
---@param file Barotrauma.Either*1System*String*1Barotrauma*ContentPath
---@param throwErrors? System.Boolean
---@return Barotrauma.HumanCrouchParams
_G['HumanCrouchParams'].GetAnimParams = function(character, file, throwErrors) end

---`Method Public Instance Virtual`
_G['HumanCrouchParams'].StoreSnapshot = function() end

---`Constructor Public Instance`
---@return Barotrauma.HumanCrouchParams
_G['HumanCrouchParams'] = function() end

---`Constructor Public Instance`
---@return Barotrauma.HumanCrouchParams
_G['HumanCrouchParams'].__new = function() end

