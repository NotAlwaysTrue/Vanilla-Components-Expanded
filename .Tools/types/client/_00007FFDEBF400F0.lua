---@meta
---@class Barotrauma.CharacterFile : Barotrauma.ContentFile
_G['CharacterFile'] = {}

---`Method Public Instance Virtual`
_G['CharacterFile'].LoadFile = function() end

---`Method Public Instance Virtual`
_G['CharacterFile'].UnloadFile = function() end

---`Method Private Static`
_G['CharacterFile'].ClearCaches = function() end

---`Method Public Instance Virtual`
_G['CharacterFile'].Sort = function() end

---`Method Public Instance Virtual`
---@param addPreloadedSprite (System.Action*1Barotrauma*Sprite)|(fun(obj:Barotrauma.Sprite))
_G['CharacterFile'].Preload = function(addPreloadedSprite) end

---`Constructor Public Instance`
---@param contentPackage Barotrauma.ContentPackage
---@param path Barotrauma.ContentPath
---@return Barotrauma.CharacterFile
_G['CharacterFile'] = function(contentPackage, path) end

---`Constructor Public Instance`
---@param contentPackage Barotrauma.ContentPackage
---@param path Barotrauma.ContentPath
---@return Barotrauma.CharacterFile
_G['CharacterFile'].__new = function(contentPackage, path) end

