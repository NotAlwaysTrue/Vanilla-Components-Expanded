---@meta
---@class Barotrauma.UpgradeModulesFile : Barotrauma.GenericPrefabFile*1Barotrauma*UpgradeContentPrefab
---`Getter NonPublic Instance Virtual`
---@field Prefabs (Barotrauma.PrefabCollection*1Barotrauma*UpgradeContentPrefab)|(fun():(Barotrauma.UpgradeContentPrefab))
_G['UpgradeModulesFile'] = {}

---`Method NonPublic Instance Virtual`
---@param identifier Barotrauma.Identifier
---@return System.Boolean
_G['UpgradeModulesFile'].MatchesSingular = function(identifier) end

---`Method NonPublic Instance Virtual`
---@param identifier Barotrauma.Identifier
---@return System.Boolean
_G['UpgradeModulesFile'].MatchesPlural = function(identifier) end

---`Method NonPublic Instance Virtual`
---@param element Barotrauma.ContentXElement
---@return Barotrauma.UpgradeContentPrefab
_G['UpgradeModulesFile'].CreatePrefab = function(element) end

---`Constructor Public Instance`
---@param contentPackage Barotrauma.ContentPackage
---@param path Barotrauma.ContentPath
---@return Barotrauma.UpgradeModulesFile
_G['UpgradeModulesFile'] = function(contentPackage, path) end

---`Constructor Public Instance`
---@param contentPackage Barotrauma.ContentPackage
---@param path Barotrauma.ContentPath
---@return Barotrauma.UpgradeModulesFile
_G['UpgradeModulesFile'].__new = function(contentPackage, path) end

