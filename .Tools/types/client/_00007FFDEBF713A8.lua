---@meta
---@class Barotrauma.LevelGenerationParametersFile : Barotrauma.ContentFile
_G['LevelGenerationParametersFile'] = {}

---`Method Private Instance`
---@param element Barotrauma.ContentXElement
---@param isOverride System.Boolean
_G['LevelGenerationParametersFile'].LoadBiomes = function(element, isOverride) end

---`Method Private Instance`
---@param element Barotrauma.ContentXElement
---@param isOverride System.Boolean
_G['LevelGenerationParametersFile'].LoadLevelGenerationParams = function(element, isOverride) end

---`Method Private Instance`
---@param element Barotrauma.ContentXElement
---@param overridePropagation System.Boolean
_G['LevelGenerationParametersFile'].LoadSubElements = function(element, overridePropagation) end

---`Method Public Instance Virtual`
_G['LevelGenerationParametersFile'].LoadFile = function() end

---`Method Public Instance Virtual`
_G['LevelGenerationParametersFile'].UnloadFile = function() end

---`Method Public Instance Virtual`
_G['LevelGenerationParametersFile'].Sort = function() end

---`Constructor Public Instance`
---@param contentPackage Barotrauma.ContentPackage
---@param path Barotrauma.ContentPath
---@return Barotrauma.LevelGenerationParametersFile
_G['LevelGenerationParametersFile'] = function(contentPackage, path) end

---`Constructor Public Instance`
---@param contentPackage Barotrauma.ContentPackage
---@param path Barotrauma.ContentPath
---@return Barotrauma.LevelGenerationParametersFile
_G['LevelGenerationParametersFile'].__new = function(contentPackage, path) end

