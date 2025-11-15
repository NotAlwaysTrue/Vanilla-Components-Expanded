---@meta
---@class Barotrauma.RuinConfigFile : Barotrauma.GenericPrefabFile*1Barotrauma*RuinGeneration*RuinGenerationParams
---`Getter NonPublic Instance Virtual`
---@field Prefabs (Barotrauma.PrefabCollection*1Barotrauma*RuinGeneration*RuinGenerationParams)|(fun():(Barotrauma.RuinGeneration.RuinGenerationParams))
_G['RuinConfigFile'] = {}

---`Method NonPublic Instance Virtual`
---@param identifier Barotrauma.Identifier
---@return System.Boolean
_G['RuinConfigFile'].MatchesSingular = function(identifier) end

---`Method NonPublic Instance Virtual`
---@param identifier Barotrauma.Identifier
---@return System.Boolean
_G['RuinConfigFile'].MatchesPlural = function(identifier) end

---`Method NonPublic Instance Virtual`
---@param element Barotrauma.ContentXElement
---@return Barotrauma.RuinGeneration.RuinGenerationParams
_G['RuinConfigFile'].CreatePrefab = function(element) end

---`Constructor Public Instance`
---@param contentPackage Barotrauma.ContentPackage
---@param path Barotrauma.ContentPath
---@return Barotrauma.RuinConfigFile
_G['RuinConfigFile'] = function(contentPackage, path) end

---`Constructor Public Instance`
---@param contentPackage Barotrauma.ContentPackage
---@param path Barotrauma.ContentPath
---@return Barotrauma.RuinConfigFile
_G['RuinConfigFile'].__new = function(contentPackage, path) end

