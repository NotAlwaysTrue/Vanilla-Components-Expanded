---@meta
---@class Barotrauma.TextFile : Barotrauma.ContentFile
_G['TextFile'] = {}

---`Method Public Instance Virtual`
_G['TextFile'].LoadFile = function() end

---`Method Public Instance Virtual`
_G['TextFile'].UnloadFile = function() end

---`Method Public Instance Virtual`
_G['TextFile'].Sort = function() end

---`Constructor Public Instance`
---@param contentPackage Barotrauma.ContentPackage
---@param path Barotrauma.ContentPath
---@return Barotrauma.TextFile
_G['TextFile'] = function(contentPackage, path) end

---`Constructor Public Instance`
---@param contentPackage Barotrauma.ContentPackage
---@param path Barotrauma.ContentPath
---@return Barotrauma.TextFile
_G['TextFile'].__new = function(contentPackage, path) end

