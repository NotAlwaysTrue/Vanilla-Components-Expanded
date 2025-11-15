---@meta
---@class Barotrauma.LevelObjectPrefabsFile : Barotrauma.GenericPrefabFile*1Barotrauma*LevelObjectPrefab
---`Getter NonPublic Instance Virtual`
---@field Prefabs (Barotrauma.PrefabCollection*1Barotrauma*LevelObjectPrefab)|(fun():(Barotrauma.LevelObjectPrefab))
_G['LevelObjectPrefabsFile'] = {}

---`Method NonPublic Instance Virtual`
---@param identifier Barotrauma.Identifier
---@return System.Boolean
_G['LevelObjectPrefabsFile'].MatchesSingular = function(identifier) end

---`Method NonPublic Instance Virtual`
---@param identifier Barotrauma.Identifier
---@return System.Boolean
_G['LevelObjectPrefabsFile'].MatchesPlural = function(identifier) end

---`Method NonPublic Instance Virtual`
---@param element Barotrauma.ContentXElement
---@return Barotrauma.LevelObjectPrefab
_G['LevelObjectPrefabsFile'].CreatePrefab = function(element) end

---`Constructor Public Instance`
---@param contentPackage Barotrauma.ContentPackage
---@param path Barotrauma.ContentPath
---@return Barotrauma.LevelObjectPrefabsFile
_G['LevelObjectPrefabsFile'] = function(contentPackage, path) end

---`Constructor Public Instance`
---@param contentPackage Barotrauma.ContentPackage
---@param path Barotrauma.ContentPath
---@return Barotrauma.LevelObjectPrefabsFile
_G['LevelObjectPrefabsFile'].__new = function(contentPackage, path) end

