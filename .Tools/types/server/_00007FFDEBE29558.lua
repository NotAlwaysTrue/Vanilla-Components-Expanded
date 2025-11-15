---@meta
---@class Barotrauma.TutorialsFile : Barotrauma.GenericPrefabFile*1Barotrauma*TutorialPrefab
---`Getter NonPublic Instance Virtual`
---@field Prefabs (Barotrauma.PrefabCollection*1Barotrauma*TutorialPrefab)|(fun():(Barotrauma.TutorialPrefab))
_G['TutorialsFile'] = {}

---`Method NonPublic Instance Virtual`
---@param identifier Barotrauma.Identifier
---@return System.Boolean
_G['TutorialsFile'].MatchesSingular = function(identifier) end

---`Method NonPublic Instance Virtual`
---@param identifier Barotrauma.Identifier
---@return System.Boolean
_G['TutorialsFile'].MatchesPlural = function(identifier) end

---`Method NonPublic Instance Virtual`
---@param element Barotrauma.ContentXElement
---@return Barotrauma.TutorialPrefab
_G['TutorialsFile'].CreatePrefab = function(element) end

---`Constructor Public Instance`
---@param contentPackage Barotrauma.ContentPackage
---@param path Barotrauma.ContentPath
---@return Barotrauma.TutorialsFile
_G['TutorialsFile'] = function(contentPackage, path) end

---`Constructor Public Instance`
---@param contentPackage Barotrauma.ContentPackage
---@param path Barotrauma.ContentPath
---@return Barotrauma.TutorialsFile
_G['TutorialsFile'].__new = function(contentPackage, path) end

