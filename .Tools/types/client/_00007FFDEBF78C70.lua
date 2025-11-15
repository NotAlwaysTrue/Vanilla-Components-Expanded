---@meta
---@class Barotrauma.OutpostConfigFile : Barotrauma.GenericPrefabFile*1Barotrauma*OutpostGenerationParams
---`Getter NonPublic Instance Virtual`
---@field Prefabs (Barotrauma.PrefabCollection*1Barotrauma*OutpostGenerationParams)|(fun():(Barotrauma.OutpostGenerationParams))
_G['OutpostConfigFile'] = {}

---`Method NonPublic Instance Virtual`
---@param identifier Barotrauma.Identifier
---@return System.Boolean
_G['OutpostConfigFile'].MatchesSingular = function(identifier) end

---`Method NonPublic Instance Virtual`
---@param identifier Barotrauma.Identifier
---@return System.Boolean
_G['OutpostConfigFile'].MatchesPlural = function(identifier) end

---`Method NonPublic Instance Virtual`
---@param element Barotrauma.ContentXElement
---@return Barotrauma.OutpostGenerationParams
_G['OutpostConfigFile'].CreatePrefab = function(element) end

---`Constructor Public Instance`
---@param contentPackage Barotrauma.ContentPackage
---@param path Barotrauma.ContentPath
---@return Barotrauma.OutpostConfigFile
_G['OutpostConfigFile'] = function(contentPackage, path) end

---`Constructor Public Instance`
---@param contentPackage Barotrauma.ContentPackage
---@param path Barotrauma.ContentPath
---@return Barotrauma.OutpostConfigFile
_G['OutpostConfigFile'].__new = function(contentPackage, path) end

