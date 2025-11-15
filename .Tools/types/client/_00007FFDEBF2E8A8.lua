---@meta
---@class Barotrauma.BackgroundCreaturePrefabsFile : Barotrauma.GenericPrefabFile*1Barotrauma*BackgroundCreaturePrefab
---`Getter NonPublic Instance Virtual`
---@field Prefabs (Barotrauma.PrefabCollection*1Barotrauma*BackgroundCreaturePrefab)|(fun():(Barotrauma.BackgroundCreaturePrefab))
_G['BackgroundCreaturePrefabsFile'] = {}

---`Method NonPublic Instance Virtual`
---@param identifier Barotrauma.Identifier
---@return System.Boolean
_G['BackgroundCreaturePrefabsFile'].MatchesSingular = function(identifier) end

---`Method NonPublic Instance Virtual`
---@param identifier Barotrauma.Identifier
---@return System.Boolean
_G['BackgroundCreaturePrefabsFile'].MatchesPlural = function(identifier) end

---`Method NonPublic Instance Virtual`
---@param element Barotrauma.ContentXElement
---@return Barotrauma.BackgroundCreaturePrefab
_G['BackgroundCreaturePrefabsFile'].CreatePrefab = function(element) end

---`Method Public Instance Virtual`
---@return Barotrauma.Md5Hash
_G['BackgroundCreaturePrefabsFile'].CalculateHash = function() end

---`Constructor Public Instance`
---@param contentPackage Barotrauma.ContentPackage
---@param path Barotrauma.ContentPath
---@return Barotrauma.BackgroundCreaturePrefabsFile
_G['BackgroundCreaturePrefabsFile'] = function(contentPackage, path) end

---`Constructor Public Instance`
---@param contentPackage Barotrauma.ContentPackage
---@param path Barotrauma.ContentPath
---@return Barotrauma.BackgroundCreaturePrefabsFile
_G['BackgroundCreaturePrefabsFile'].__new = function(contentPackage, path) end

