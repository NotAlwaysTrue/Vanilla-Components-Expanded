---@meta
---@class Barotrauma.NPCPersonalityTraitsFile : Barotrauma.GenericPrefabFile*1Barotrauma*NPCPersonalityTrait
---`Getter NonPublic Instance Virtual`
---@field Prefabs (Barotrauma.PrefabCollection*1Barotrauma*NPCPersonalityTrait)|(fun():(Barotrauma.NPCPersonalityTrait))
_G['NPCPersonalityTraitsFile'] = {}

---`Method NonPublic Instance Virtual`
---@param identifier Barotrauma.Identifier
---@return System.Boolean
_G['NPCPersonalityTraitsFile'].MatchesSingular = function(identifier) end

---`Method NonPublic Instance Virtual`
---@param identifier Barotrauma.Identifier
---@return System.Boolean
_G['NPCPersonalityTraitsFile'].MatchesPlural = function(identifier) end

---`Method NonPublic Instance Virtual`
---@param element Barotrauma.ContentXElement
---@return Barotrauma.NPCPersonalityTrait
_G['NPCPersonalityTraitsFile'].CreatePrefab = function(element) end

---`Constructor Public Instance`
---@param contentPackage Barotrauma.ContentPackage
---@param path Barotrauma.ContentPath
---@return Barotrauma.NPCPersonalityTraitsFile
_G['NPCPersonalityTraitsFile'] = function(contentPackage, path) end

---`Constructor Public Instance`
---@param contentPackage Barotrauma.ContentPackage
---@param path Barotrauma.ContentPath
---@return Barotrauma.NPCPersonalityTraitsFile
_G['NPCPersonalityTraitsFile'].__new = function(contentPackage, path) end

