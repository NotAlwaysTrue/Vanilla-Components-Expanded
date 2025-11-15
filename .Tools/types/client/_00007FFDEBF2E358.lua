---@meta
---@class Barotrauma.AfflictionsFile : Barotrauma.ContentFile
---`Field Private Static`
---@field afflictionTypes (System.Collections.Immutable.ImmutableHashSet*1System*Type)|(System.Type[])
_G['AfflictionsFile'] = {}

---`Method Private Instance`
---@param element Barotrauma.ContentXElement
---@param overriding System.Boolean
_G['AfflictionsFile'].ParseElement = function(element, overriding) end

---`Method Public Instance Virtual`
_G['AfflictionsFile'].LoadFile = function() end

---`Method Private Instance`
---@param element Barotrauma.ContentXElement
---@param type System.Type
---@return Barotrauma.AfflictionPrefab
_G['AfflictionsFile'].CreatePrefab = function(element, type) end

---`Method Public Instance Virtual`
_G['AfflictionsFile'].UnloadFile = function() end

---`Method Public Instance Virtual`
_G['AfflictionsFile'].Sort = function() end

---`Constructor Private Static`
---@overload fun():Barotrauma.AfflictionsFile
---@param contentPackage Barotrauma.ContentPackage
---@param path Barotrauma.ContentPath
---@return Barotrauma.AfflictionsFile
_G['AfflictionsFile'] = function(contentPackage, path) end

---`Constructor Private Static`
---@overload fun():Barotrauma.AfflictionsFile
---@param contentPackage Barotrauma.ContentPackage
---@param path Barotrauma.ContentPath
---@return Barotrauma.AfflictionsFile
_G['AfflictionsFile'].__new = function(contentPackage, path) end

---`Constructor Public Instance`
---@overload fun():Barotrauma.AfflictionsFile
---@param contentPackage Barotrauma.ContentPackage
---@param path Barotrauma.ContentPath
---@return Barotrauma.AfflictionsFile
_G['AfflictionsFile'] = function(contentPackage, path) end

---`Constructor Public Instance`
---@overload fun():Barotrauma.AfflictionsFile
---@param contentPackage Barotrauma.ContentPackage
---@param path Barotrauma.ContentPath
---@return Barotrauma.AfflictionsFile
_G['AfflictionsFile'].__new = function(contentPackage, path) end

