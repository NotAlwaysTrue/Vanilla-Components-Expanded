---@meta
---@class Barotrauma.CaveGenerationParametersFile : Barotrauma.GenericPrefabFile*1Barotrauma*CaveGenerationParams
---`Getter NonPublic Instance Virtual`
---@field Prefabs (Barotrauma.PrefabCollection*1Barotrauma*CaveGenerationParams)|(fun():(Barotrauma.CaveGenerationParams))
_G['CaveGenerationParametersFile'] = {}

---`Method NonPublic Instance Virtual`
---@param identifier Barotrauma.Identifier
---@return System.Boolean
_G['CaveGenerationParametersFile'].MatchesSingular = function(identifier) end

---`Method NonPublic Instance Virtual`
---@param identifier Barotrauma.Identifier
---@return System.Boolean
_G['CaveGenerationParametersFile'].MatchesPlural = function(identifier) end

---`Method NonPublic Instance Virtual`
---@param element Barotrauma.ContentXElement
---@return Barotrauma.CaveGenerationParams
_G['CaveGenerationParametersFile'].CreatePrefab = function(element) end

---`Constructor Public Instance`
---@param contentPackage Barotrauma.ContentPackage
---@param path Barotrauma.ContentPath
---@return Barotrauma.CaveGenerationParametersFile
_G['CaveGenerationParametersFile'] = function(contentPackage, path) end

---`Constructor Public Instance`
---@param contentPackage Barotrauma.ContentPackage
---@param path Barotrauma.ContentPath
---@return Barotrauma.CaveGenerationParametersFile
_G['CaveGenerationParametersFile'].__new = function(contentPackage, path) end

