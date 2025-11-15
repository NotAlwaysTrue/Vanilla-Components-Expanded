---@meta
---@class Barotrauma.NPCConversationsFile : Barotrauma.ContentFile
_G['NPCConversationsFile'] = {}

---`Method Public Instance Virtual`
_G['NPCConversationsFile'].LoadFile = function() end

---`Method Public Instance Virtual`
_G['NPCConversationsFile'].UnloadFile = function() end

---`Method Public Instance Virtual`
_G['NPCConversationsFile'].Sort = function() end

---`Constructor Public Instance`
---@param contentPackage Barotrauma.ContentPackage
---@param path Barotrauma.ContentPath
---@return Barotrauma.NPCConversationsFile
_G['NPCConversationsFile'] = function(contentPackage, path) end

---`Constructor Public Instance`
---@param contentPackage Barotrauma.ContentPackage
---@param path Barotrauma.ContentPath
---@return Barotrauma.NPCConversationsFile
_G['NPCConversationsFile'].__new = function(contentPackage, path) end

