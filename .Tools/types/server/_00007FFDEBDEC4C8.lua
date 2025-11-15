---@meta
---@class Barotrauma.DecalsFile : Barotrauma.ContentFile
_G['DecalsFile'] = {}

---`Method Public Instance Virtual`
_G['DecalsFile'].LoadFile = function() end

---`Method Public Instance Virtual`
_G['DecalsFile'].UnloadFile = function() end

---`Method Public Instance Virtual`
_G['DecalsFile'].Sort = function() end

---`Constructor Public Instance`
---@param contentPackage Barotrauma.ContentPackage
---@param path Barotrauma.ContentPath
---@return Barotrauma.DecalsFile
_G['DecalsFile'] = function(contentPackage, path) end

---`Constructor Public Instance`
---@param contentPackage Barotrauma.ContentPackage
---@param path Barotrauma.ContentPath
---@return Barotrauma.DecalsFile
_G['DecalsFile'].__new = function(contentPackage, path) end

