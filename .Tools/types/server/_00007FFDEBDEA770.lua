---@meta
---@class Barotrauma.BallastFloraFile : Barotrauma.GenericPrefabFile*1Barotrauma*BallastFloraPrefab
---`Getter NonPublic Instance Virtual`
---@field Prefabs (Barotrauma.PrefabCollection*1Barotrauma*BallastFloraPrefab)|(fun():(Barotrauma.BallastFloraPrefab))
_G['BallastFloraFile'] = {}

---`Method NonPublic Instance Virtual`
---@param identifier Barotrauma.Identifier
---@return System.Boolean
_G['BallastFloraFile'].MatchesSingular = function(identifier) end

---`Method NonPublic Instance Virtual`
---@param identifier Barotrauma.Identifier
---@return System.Boolean
_G['BallastFloraFile'].MatchesPlural = function(identifier) end

---`Method NonPublic Instance Virtual`
---@param element Barotrauma.ContentXElement
---@return Barotrauma.BallastFloraPrefab
_G['BallastFloraFile'].CreatePrefab = function(element) end

---`Constructor Public Instance`
---@param contentPackage Barotrauma.ContentPackage
---@param path Barotrauma.ContentPath
---@return Barotrauma.BallastFloraFile
_G['BallastFloraFile'] = function(contentPackage, path) end

---`Constructor Public Instance`
---@param contentPackage Barotrauma.ContentPackage
---@param path Barotrauma.ContentPath
---@return Barotrauma.BallastFloraFile
_G['BallastFloraFile'].__new = function(contentPackage, path) end

