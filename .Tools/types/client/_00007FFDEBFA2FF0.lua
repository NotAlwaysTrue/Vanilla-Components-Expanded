---@meta
---@class Barotrauma.WreckAIConfigFile : Barotrauma.GenericPrefabFile*1Barotrauma*WreckAIConfig
---`Getter NonPublic Instance Virtual`
---@field Prefabs (Barotrauma.PrefabCollection*1Barotrauma*WreckAIConfig)|(fun():(Barotrauma.WreckAIConfig))
_G['WreckAIConfigFile'] = {}

---`Method NonPublic Instance Virtual`
---@param identifier Barotrauma.Identifier
---@return System.Boolean
_G['WreckAIConfigFile'].MatchesSingular = function(identifier) end

---`Method NonPublic Instance Virtual`
---@param identifier Barotrauma.Identifier
---@return System.Boolean
_G['WreckAIConfigFile'].MatchesPlural = function(identifier) end

---`Method NonPublic Instance Virtual`
---@param element Barotrauma.ContentXElement
---@return Barotrauma.WreckAIConfig
_G['WreckAIConfigFile'].CreatePrefab = function(element) end

---`Constructor Public Instance`
---@param contentPackage Barotrauma.ContentPackage
---@param path Barotrauma.ContentPath
---@return Barotrauma.WreckAIConfigFile
_G['WreckAIConfigFile'] = function(contentPackage, path) end

---`Constructor Public Instance`
---@param contentPackage Barotrauma.ContentPackage
---@param path Barotrauma.ContentPath
---@return Barotrauma.WreckAIConfigFile
_G['WreckAIConfigFile'].__new = function(contentPackage, path) end

