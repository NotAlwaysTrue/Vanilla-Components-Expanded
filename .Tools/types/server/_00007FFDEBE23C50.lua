---@meta
---@class Barotrauma.SkillSettingsFile : Barotrauma.ContentFile
_G['SkillSettingsFile'] = {}

---`Method Public Instance Virtual`
_G['SkillSettingsFile'].LoadFile = function() end

---`Method Public Instance Virtual`
_G['SkillSettingsFile'].UnloadFile = function() end

---`Method Public Instance Virtual`
_G['SkillSettingsFile'].Sort = function() end

---`Constructor Public Instance`
---@param contentPackage Barotrauma.ContentPackage
---@param path Barotrauma.ContentPath
---@return Barotrauma.SkillSettingsFile
_G['SkillSettingsFile'] = function(contentPackage, path) end

---`Constructor Public Instance`
---@param contentPackage Barotrauma.ContentPackage
---@param path Barotrauma.ContentPath
---@return Barotrauma.SkillSettingsFile
_G['SkillSettingsFile'].__new = function(contentPackage, path) end

