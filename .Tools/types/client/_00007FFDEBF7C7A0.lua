---@meta
---@class Barotrauma.StartItemsFile : Barotrauma.GenericPrefabFile*1Barotrauma*StartItemSet
---`Getter NonPublic Instance Virtual`
---@field Prefabs (Barotrauma.PrefabCollection*1Barotrauma*StartItemSet)|(fun():(Barotrauma.StartItemSet))
_G['StartItemsFile'] = {}

---`Method NonPublic Instance Virtual`
---@param identifier Barotrauma.Identifier
---@return System.Boolean
_G['StartItemsFile'].MatchesSingular = function(identifier) end

---`Method NonPublic Instance Virtual`
---@param identifier Barotrauma.Identifier
---@return System.Boolean
_G['StartItemsFile'].MatchesPlural = function(identifier) end

---`Method NonPublic Instance Virtual`
---@param element Barotrauma.ContentXElement
---@return Barotrauma.StartItemSet
_G['StartItemsFile'].CreatePrefab = function(element) end

---`Constructor Public Instance`
---@param contentPackage Barotrauma.ContentPackage
---@param path Barotrauma.ContentPath
---@return Barotrauma.StartItemsFile
_G['StartItemsFile'] = function(contentPackage, path) end

---`Constructor Public Instance`
---@param contentPackage Barotrauma.ContentPackage
---@param path Barotrauma.ContentPath
---@return Barotrauma.StartItemsFile
_G['StartItemsFile'].__new = function(contentPackage, path) end

