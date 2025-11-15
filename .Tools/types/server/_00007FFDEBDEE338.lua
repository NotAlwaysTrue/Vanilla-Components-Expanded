---@meta
---@class Barotrauma.ItemAssemblyFile : Barotrauma.GenericPrefabFile*1Barotrauma*ItemAssemblyPrefab
---`Getter NonPublic Instance Virtual`
---@field Prefabs (Barotrauma.PrefabCollection*1Barotrauma*ItemAssemblyPrefab)|(fun():(Barotrauma.ItemAssemblyPrefab))
_G['ItemAssemblyFile'] = {}

---`Method NonPublic Instance Virtual`
---@param identifier Barotrauma.Identifier
---@return System.Boolean
_G['ItemAssemblyFile'].MatchesSingular = function(identifier) end

---`Method NonPublic Instance Virtual`
---@param identifier Barotrauma.Identifier
---@return System.Boolean
_G['ItemAssemblyFile'].MatchesPlural = function(identifier) end

---`Method NonPublic Instance Virtual`
---@param element Barotrauma.ContentXElement
---@return Barotrauma.ItemAssemblyPrefab
_G['ItemAssemblyFile'].CreatePrefab = function(element) end

---`Constructor Public Instance`
---@param contentPackage Barotrauma.ContentPackage
---@param path Barotrauma.ContentPath
---@return Barotrauma.ItemAssemblyFile
_G['ItemAssemblyFile'] = function(contentPackage, path) end

---`Constructor Public Instance`
---@param contentPackage Barotrauma.ContentPackage
---@param path Barotrauma.ContentPath
---@return Barotrauma.ItemAssemblyFile
_G['ItemAssemblyFile'].__new = function(contentPackage, path) end

