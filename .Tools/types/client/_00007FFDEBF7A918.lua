---@meta
---@class Barotrauma.ParticlesFile : Barotrauma.GenericPrefabFile*1Barotrauma*Particles*ParticlePrefab
---`Getter NonPublic Instance Virtual`
---@field Prefabs (Barotrauma.PrefabCollection*1Barotrauma*Particles*ParticlePrefab)|(fun():(Barotrauma.Particles.ParticlePrefab))
_G['ParticlesFile'] = {}

---`Method NonPublic Instance Virtual`
---@param identifier Barotrauma.Identifier
---@return System.Boolean
_G['ParticlesFile'].MatchesSingular = function(identifier) end

---`Method NonPublic Instance Virtual`
---@param identifier Barotrauma.Identifier
---@return System.Boolean
_G['ParticlesFile'].MatchesPlural = function(identifier) end

---`Method NonPublic Instance Virtual`
---@param element Barotrauma.ContentXElement
---@return Barotrauma.Particles.ParticlePrefab
_G['ParticlesFile'].CreatePrefab = function(element) end

---`Method Public Instance Virtual`
---@return Barotrauma.Md5Hash
_G['ParticlesFile'].CalculateHash = function() end

---`Constructor Public Instance`
---@param contentPackage Barotrauma.ContentPackage
---@param path Barotrauma.ContentPath
---@return Barotrauma.ParticlesFile
_G['ParticlesFile'] = function(contentPackage, path) end

---`Constructor Public Instance`
---@param contentPackage Barotrauma.ContentPackage
---@param path Barotrauma.ContentPath
---@return Barotrauma.ParticlesFile
_G['ParticlesFile'].__new = function(contentPackage, path) end

