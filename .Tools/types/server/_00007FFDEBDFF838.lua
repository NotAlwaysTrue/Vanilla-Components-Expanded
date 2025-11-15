---@meta
---@class Barotrauma.MapGenerationParametersFile : Barotrauma.ContentFile
_G['MapGenerationParametersFile'] = {}

---`Method Public Instance Virtual`
_G['MapGenerationParametersFile'].LoadFile = function() end

---`Method Public Instance Virtual`
_G['MapGenerationParametersFile'].UnloadFile = function() end

---`Method Public Instance Virtual`
_G['MapGenerationParametersFile'].Sort = function() end

---`Constructor Public Instance`
---@param contentPackage Barotrauma.ContentPackage
---@param path Barotrauma.ContentPath
---@return Barotrauma.MapGenerationParametersFile
_G['MapGenerationParametersFile'] = function(contentPackage, path) end

---`Constructor Public Instance`
---@param contentPackage Barotrauma.ContentPackage
---@param path Barotrauma.ContentPath
---@return Barotrauma.MapGenerationParametersFile
_G['MapGenerationParametersFile'].__new = function(contentPackage, path) end

