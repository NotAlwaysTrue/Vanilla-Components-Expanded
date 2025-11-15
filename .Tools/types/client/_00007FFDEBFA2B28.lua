---@meta
---@class Barotrauma.UIStyleFile : Barotrauma.HashlessFile
_G['UIStyleFile'] = {}

---`Method Public Instance`
---@param parentElement Barotrauma.ContentXElement
---@param overriding System.Boolean
_G['UIStyleFile'].LoadFromXElement = function(parentElement, overriding) end

---`Method Public Instance Virtual`
_G['UIStyleFile'].LoadFile = function() end

---`Method Public Instance Virtual`
_G['UIStyleFile'].UnloadFile = function() end

---`Method Public Instance Virtual`
_G['UIStyleFile'].Sort = function() end

---`Constructor Public Instance`
---@param contentPackage Barotrauma.ContentPackage
---@param path Barotrauma.ContentPath
---@return Barotrauma.UIStyleFile
_G['UIStyleFile'] = function(contentPackage, path) end

---`Constructor Public Instance`
---@param contentPackage Barotrauma.ContentPackage
---@param path Barotrauma.ContentPath
---@return Barotrauma.UIStyleFile
_G['UIStyleFile'].__new = function(contentPackage, path) end

