---@meta
---@class Barotrauma.RandomEventsFile : Barotrauma.ContentFile
_G['RandomEventsFile'] = {}

---`Method Public Instance`
---@param parentElement Barotrauma.ContentXElement
---@param overriding System.Boolean
_G['RandomEventsFile'].LoadFromXElement = function(parentElement, overriding) end

---`Method Public Instance Virtual`
_G['RandomEventsFile'].LoadFile = function() end

---`Method Public Instance Virtual`
_G['RandomEventsFile'].UnloadFile = function() end

---`Method Public Instance Virtual`
_G['RandomEventsFile'].Sort = function() end

---`Constructor Public Instance`
---@param contentPackage Barotrauma.ContentPackage
---@param path Barotrauma.ContentPath
---@return Barotrauma.RandomEventsFile
_G['RandomEventsFile'] = function(contentPackage, path) end

---`Constructor Public Instance`
---@param contentPackage Barotrauma.ContentPackage
---@param path Barotrauma.ContentPath
---@return Barotrauma.RandomEventsFile
_G['RandomEventsFile'].__new = function(contentPackage, path) end

