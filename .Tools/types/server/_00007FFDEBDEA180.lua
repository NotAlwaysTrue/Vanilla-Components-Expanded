---@meta
---@class Barotrauma.OtherFile : Barotrauma.HashlessFile
_G['OtherFile'] = {}

---`Method Public Instance Virtual`
_G['OtherFile'].LoadFile = function() end

---`Method Public Instance Virtual`
_G['OtherFile'].UnloadFile = function() end

---`Method Public Instance Virtual`
_G['OtherFile'].Sort = function() end

---`Constructor Public Instance`
---@param contentPackage Barotrauma.ContentPackage
---@param path Barotrauma.ContentPath
---@return Barotrauma.OtherFile
_G['OtherFile'] = function(contentPackage, path) end

---`Constructor Public Instance`
---@param contentPackage Barotrauma.ContentPackage
---@param path Barotrauma.ContentPath
---@return Barotrauma.OtherFile
_G['OtherFile'].__new = function(contentPackage, path) end

