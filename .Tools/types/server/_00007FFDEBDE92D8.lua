---@meta
---@class Barotrauma.ContentPath : System.Object
---`Field Public Instance`
---@field RawValue System.String
---`Field Public Instance`
---@field ContentPackage Barotrauma.ContentPackage
---`Field Private Instance`
---@field cachedValue System.String
---`Field Private Instance`
---@field cachedFullPath System.String
---`Field Public Static`
---@field Empty Barotrauma.ContentPath
---`Field Private Static`
---@field OtherModDirRegex System.Text.RegularExpressions.Regex
---`Field Private Static`
---@field prevCreatedRaw Barotrauma.ContentPath
---`Field Public Static`
---@field ModDirStr System.String
---`Field Public Static`
---@field OtherModDirFmt System.String
---`Getter Public Instance`
---@field Value System.String
---`Getter Public Instance`
---@field FullPath System.String
_G['ContentPath'] = {}

---`Method Public Static`
---@overload fun(rawValue:System.String):(Barotrauma.ContentPath)
---@param contentPackage Barotrauma.ContentPackage
---@param rawValue System.String
---@return Barotrauma.ContentPath
_G['ContentPath'].FromRaw = function(contentPackage, rawValue) end

---`Method Private Static`
---@param a System.String
---@param b System.String
---@return System.Boolean
_G['ContentPath'].StringEquality = function(a, b) end

---`Method NonPublic Instance`
---@param other Barotrauma.ContentPath
---@return System.Boolean
_G['ContentPath'].Equals = function(other) end

---`Method Public Instance Virtual`
---@param obj System.Object
---@return System.Boolean
_G['ContentPath'].Equals = function(obj) end

---`Method Public Instance Virtual`
---@return System.Int32
_G['ContentPath'].GetHashCode = function() end

---`Method Public Instance`
---@return System.Boolean
_G['ContentPath'].IsPathNullOrEmpty = function() end

---`Method Public Instance`
---@return System.Boolean
_G['ContentPath'].IsPathNullOrWhiteSpace = function() end

---`Method Public Instance`
---@param suffix System.String
---@return System.Boolean
_G['ContentPath'].EndsWith = function(suffix) end

---`Method Public Instance Virtual`
---@return System.String
_G['ContentPath'].ToString = function() end

---`Constructor Private Instance`
---@overload fun(contentPackage:Barotrauma.ContentPackage, rawValue:System.String):Barotrauma.ContentPath
---@return Barotrauma.ContentPath
_G['ContentPath'] = function() end

---`Constructor Private Instance`
---@overload fun(contentPackage:Barotrauma.ContentPackage, rawValue:System.String):Barotrauma.ContentPath
---@return Barotrauma.ContentPath
_G['ContentPath'].__new = function() end

---`Constructor Private Static`
---@overload fun(contentPackage:Barotrauma.ContentPackage, rawValue:System.String):Barotrauma.ContentPath
---@return Barotrauma.ContentPath
_G['ContentPath'] = function() end

---`Constructor Private Static`
---@overload fun(contentPackage:Barotrauma.ContentPackage, rawValue:System.String):Barotrauma.ContentPath
---@return Barotrauma.ContentPath
_G['ContentPath'].__new = function() end

