---@meta
---@class Barotrauma.OrdersFile : Barotrauma.ContentFile
_G['OrdersFile'] = {}

---`Method Public Instance`
---@param parentElement Barotrauma.ContentXElement
---@param overriding System.Boolean
_G['OrdersFile'].LoadFromXElement = function(parentElement, overriding) end

---`Method Public Instance Virtual`
_G['OrdersFile'].LoadFile = function() end

---`Method Public Instance Virtual`
_G['OrdersFile'].UnloadFile = function() end

---`Method Public Instance Virtual`
_G['OrdersFile'].Sort = function() end

---`Constructor Public Instance`
---@param contentPackage Barotrauma.ContentPackage
---@param path Barotrauma.ContentPath
---@return Barotrauma.OrdersFile
_G['OrdersFile'] = function(contentPackage, path) end

---`Constructor Public Instance`
---@param contentPackage Barotrauma.ContentPackage
---@param path Barotrauma.ContentPath
---@return Barotrauma.OrdersFile
_G['OrdersFile'].__new = function(contentPackage, path) end

