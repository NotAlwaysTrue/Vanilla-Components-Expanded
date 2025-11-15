---@meta
---@class Barotrauma.ContentPackageId : System.Object
---`Getter Public Instance Abstract Virtual`
---@field StringRepresentation System.String
_G['ContentPackageId'] = {}

---`Method Public Instance Virtual`
---@return System.String
_G['ContentPackageId'].ToString = function() end

---`Method Public Instance Abstract Virtual`
---@param obj System.Object
---@return System.Boolean
_G['ContentPackageId'].Equals = function(obj) end

---`Method Public Instance Abstract Virtual`
---@return System.Int32
_G['ContentPackageId'].GetHashCode = function() end

---`Method Public Static`
---@param s System.String
---@return Barotrauma.Option*1Barotrauma*ContentPackageId
_G['ContentPackageId'].Parse = function(s) end

---`Constructor NonPublic Instance`
---@return Barotrauma.ContentPackageId
_G['ContentPackageId'] = function() end

---`Constructor NonPublic Instance`
---@return Barotrauma.ContentPackageId
_G['ContentPackageId'].__new = function() end

