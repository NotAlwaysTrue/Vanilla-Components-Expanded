---@meta
---@class Barotrauma.EventManagerSettingsFile : Barotrauma.GenericPrefabFile*1Barotrauma*EventManagerSettings
---`Getter NonPublic Instance Virtual`
---@field Prefabs (Barotrauma.PrefabCollection*1Barotrauma*EventManagerSettings)|(fun():(Barotrauma.EventManagerSettings))
_G['EventManagerSettingsFile'] = {}

---`Method NonPublic Instance Virtual`
---@param identifier Barotrauma.Identifier
---@return System.Boolean
_G['EventManagerSettingsFile'].MatchesSingular = function(identifier) end

---`Method NonPublic Instance Virtual`
---@param identifier Barotrauma.Identifier
---@return System.Boolean
_G['EventManagerSettingsFile'].MatchesPlural = function(identifier) end

---`Method NonPublic Instance Virtual`
---@param element Barotrauma.ContentXElement
---@return Barotrauma.EventManagerSettings
_G['EventManagerSettingsFile'].CreatePrefab = function(element) end

---`Constructor Public Instance`
---@param contentPackage Barotrauma.ContentPackage
---@param path Barotrauma.ContentPath
---@return Barotrauma.EventManagerSettingsFile
_G['EventManagerSettingsFile'] = function(contentPackage, path) end

---`Constructor Public Instance`
---@param contentPackage Barotrauma.ContentPackage
---@param path Barotrauma.ContentPath
---@return Barotrauma.EventManagerSettingsFile
_G['EventManagerSettingsFile'].__new = function(contentPackage, path) end

