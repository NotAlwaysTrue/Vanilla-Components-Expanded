---@meta
---@class Barotrauma.CorpsesFile : Barotrauma.GenericPrefabFile*1Barotrauma*CorpsePrefab
---`Getter NonPublic Instance Virtual`
---@field Prefabs (Barotrauma.PrefabCollection*1Barotrauma*CorpsePrefab)|(fun():(Barotrauma.CorpsePrefab))
_G['CorpsesFile'] = {}

---`Method NonPublic Instance Virtual`
---@param identifier Barotrauma.Identifier
---@return System.Boolean
_G['CorpsesFile'].MatchesSingular = function(identifier) end

---`Method NonPublic Instance Virtual`
---@param identifier Barotrauma.Identifier
---@return System.Boolean
_G['CorpsesFile'].MatchesPlural = function(identifier) end

---`Method NonPublic Instance Virtual`
---@param element Barotrauma.ContentXElement
---@return Barotrauma.CorpsePrefab
_G['CorpsesFile'].CreatePrefab = function(element) end

---`Constructor Public Instance`
---@param contentPackage Barotrauma.ContentPackage
---@param path Barotrauma.ContentPath
---@return Barotrauma.CorpsesFile
_G['CorpsesFile'] = function(contentPackage, path) end

---`Constructor Public Instance`
---@param contentPackage Barotrauma.ContentPackage
---@param path Barotrauma.ContentPath
---@return Barotrauma.CorpsesFile
_G['CorpsesFile'].__new = function(contentPackage, path) end

