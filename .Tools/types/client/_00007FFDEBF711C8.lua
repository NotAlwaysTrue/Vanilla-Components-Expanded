---@meta
---@class Barotrauma.JobsFile : Barotrauma.ContentFile
_G['JobsFile'] = {}

---`Method Public Instance Virtual`
_G['JobsFile'].LoadFile = function() end

---`Method Private Instance`
---@param mainElement Barotrauma.ContentXElement
---@param isOverride System.Boolean
_G['JobsFile'].LoadElements = function(mainElement, isOverride) end

---`Method Public Instance Virtual`
_G['JobsFile'].UnloadFile = function() end

---`Method Public Instance Virtual`
_G['JobsFile'].Sort = function() end

---`Constructor Public Instance`
---@param contentPackage Barotrauma.ContentPackage
---@param path Barotrauma.ContentPath
---@return Barotrauma.JobsFile
_G['JobsFile'] = function(contentPackage, path) end

---`Constructor Public Instance`
---@param contentPackage Barotrauma.ContentPackage
---@param path Barotrauma.ContentPath
---@return Barotrauma.JobsFile
_G['JobsFile'].__new = function(contentPackage, path) end

