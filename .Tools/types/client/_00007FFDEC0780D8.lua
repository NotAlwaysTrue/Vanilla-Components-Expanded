---@meta
---@class Barotrauma.PrefabCollection*1Barotrauma*Particles*ParticlePrefab : System.Object, {[Barotrauma.Identifier]:Barotrauma.Particles.ParticlePrefab}, {[System.String]:Barotrauma.Particles.ParticlePrefab}
---`Field Private Instance`
---@field OnAdd (System.Action*1Barotrauma*Particles*ParticlePrefab*1System*Boolean)|(fun(arg1:Barotrauma.Particles.ParticlePrefab, arg2:System.Boolean))
---`Field Private Instance`
---@field OnRemove (System.Action*1Barotrauma*Particles*ParticlePrefab)|(fun(obj:Barotrauma.Particles.ParticlePrefab))
---`Field Private Instance`
---@field OnSort (System.Action)|(fun())
---`Field Private Instance`
---@field OnAddOverrideFile (System.Action*1Barotrauma*ContentFile)|(fun(obj:Barotrauma.ContentFile))
---`Field Private Instance`
---@field OnRemoveOverrideFile (System.Action*1Barotrauma*ContentFile)|(fun(obj:Barotrauma.ContentFile))
---`Field Private Instance`
---@field prefabs (System.Collections.Concurrent.ConcurrentDictionary*1Barotrauma*Identifier*1Barotrauma*PrefabSelector*2Barotrauma*Particles*ParticlePrefab)|(fun():(System.Collections.Generic.KeyValuePair*1Barotrauma*Identifier*1Barotrauma*PrefabSelector*2Barotrauma*Particles*ParticlePrefab))
---`Field Private Instance`
---@field overrideFiles (System.Collections.Generic.HashSet*1Barotrauma*ContentFile)|(Barotrauma.ContentFile[])
---`Field Private Instance`
---@field topMostOverrideFile Barotrauma.ContentFile
---`Field Private Instance`
---@field implementsVariants System.Boolean
---`Getter Public Instance`
---@field AllPrefabs (System.Collections.Generic.IEnumerable*1System*Collections*Generic*KeyValuePair*2Barotrauma*Identifier*2Barotrauma*PrefabSelector*3Barotrauma*Particles*ParticlePrefab)|(fun():(System.Collections.Generic.KeyValuePair*1Barotrauma*Identifier*1Barotrauma*PrefabSelector*2Barotrauma*Particles*ParticlePrefab))
---`Getter Public Instance`
---@field Keys (System.Collections.Generic.IEnumerable*1Barotrauma*Identifier)|(fun():(Barotrauma.Identifier))
_G['PrefabCollection*1Barotrauma*Particles*ParticlePrefab'] = {}

---`Method Public Instance`
---@return (System.Linq.IOrderedEnumerable*1Barotrauma*Particles*ParticlePrefab)|(fun():(Barotrauma.Particles.ParticlePrefab))
_G['PrefabCollection*1Barotrauma*Particles*ParticlePrefab'].GetOrdered = function() end

---`Method Private Instance`
---@param prefab Barotrauma.Particles.ParticlePrefab
---@return System.Boolean
_G['PrefabCollection*1Barotrauma*Particles*ParticlePrefab'].IsPrefabOverriddenByFile = function(prefab) end

---`Method Private Static`
---@param prefab Barotrauma.Particles.ParticlePrefab
---@return System.Boolean
_G['PrefabCollection*1Barotrauma*Particles*ParticlePrefab'].IsInheritanceValid = function(prefab) end

---`Method Private Instance`
---@overload fun(prefabIdentifier:Barotrauma.Identifier)
---@param identifiers (System.Collections.Generic.IEnumerable*1Barotrauma*Identifier)|(fun():(Barotrauma.Identifier))
_G['PrefabCollection*1Barotrauma*Particles*ParticlePrefab'].HandleInheritance = function(identifiers) end

---`Method Public Instance`
---@overload fun(identifier:Barotrauma.Identifier, result:Barotrauma.Particles.ParticlePrefab-ref):(System.Boolean)
---@param identifier System.String
---@param result Barotrauma.Particles.ParticlePrefab-ref
---@return System.Boolean
_G['PrefabCollection*1Barotrauma*Particles*ParticlePrefab'].TryGet = function(identifier, result) end

---`Method Private Instance`
---@param identifier Barotrauma.Identifier
---@param result Barotrauma.Particles.ParticlePrefab-ref
---@param requireInheritanceValid System.Boolean
---@return System.Boolean
_G['PrefabCollection*1Barotrauma*Particles*ParticlePrefab'].TryGet = function(identifier, result, requireInheritanceValid) end

---`Method Public Instance`
---@param predicate (System.Predicate*1Barotrauma*Particles*ParticlePrefab)|(fun(obj:Barotrauma.Particles.ParticlePrefab):(System.Boolean))
---@return Barotrauma.Particles.ParticlePrefab
_G['PrefabCollection*1Barotrauma*Particles*ParticlePrefab'].Find = function(predicate) end

---`Method Public Instance`
---@overload fun(identifier:Barotrauma.Identifier):(System.Boolean)
---@param k System.String
---@return System.Boolean
_G['PrefabCollection*1Barotrauma*Particles*ParticlePrefab'].ContainsKey = function(k) end

---`Method Public Instance`
---@param prefab Barotrauma.Particles.ParticlePrefab
---@return System.Boolean
_G['PrefabCollection*1Barotrauma*Particles*ParticlePrefab'].IsOverride = function(prefab) end

---`Method Public Instance`
---@param prefab Barotrauma.Particles.ParticlePrefab
---@param isOverride System.Boolean
_G['PrefabCollection*1Barotrauma*Particles*ParticlePrefab'].Add = function(prefab, isOverride) end

---`Method Public Instance`
---@param prefab Barotrauma.Particles.ParticlePrefab
_G['PrefabCollection*1Barotrauma*Particles*ParticlePrefab'].Remove = function(prefab) end

---`Method Public Instance`
---@param file Barotrauma.ContentFile
_G['PrefabCollection*1Barotrauma*Particles*ParticlePrefab'].RemoveByFile = function(file) end

---`Method Public Instance`
---@param file Barotrauma.ContentFile
_G['PrefabCollection*1Barotrauma*Particles*ParticlePrefab'].AddOverrideFile = function(file) end

---`Method Public Instance`
---@param file Barotrauma.ContentFile
_G['PrefabCollection*1Barotrauma*Particles*ParticlePrefab'].RemoveOverrideFile = function(file) end

---`Method Public Instance`
_G['PrefabCollection*1Barotrauma*Particles*ParticlePrefab'].SortAll = function() end

---`Method Public Instance Virtual`
---@return System.Collections.Generic.IEnumerator*1Barotrauma*Particles*ParticlePrefab
_G['PrefabCollection*1Barotrauma*Particles*ParticlePrefab'].GetEnumerator = function() end

---`Method Private Instance`
---@param requireInheritanceValid System.Boolean
---@return System.Collections.Generic.IEnumerator*1Barotrauma*Particles*ParticlePrefab
_G['PrefabCollection*1Barotrauma*Particles*ParticlePrefab'].GetEnumerator = function(requireInheritanceValid) end

---`Constructor Public Instance`
---@overload fun():Barotrauma.PrefabCollection*1Barotrauma*Particles*ParticlePrefab
---@overload fun(onAdd:(System.Action*1Barotrauma*Particles*ParticlePrefab*1System*Boolean)|(fun(arg1:Barotrauma.Particles.ParticlePrefab, arg2:System.Boolean)), onRemove:(System.Action*1Barotrauma*Particles*ParticlePrefab)|(fun(obj:Barotrauma.Particles.ParticlePrefab)), onSort:(System.Action)|(fun()), onAddOverrideFile:(System.Action*1Barotrauma*ContentFile)|(fun(obj:Barotrauma.ContentFile)), onRemoveOverrideFile:(System.Action*1Barotrauma*ContentFile)|(fun(obj:Barotrauma.ContentFile))):Barotrauma.PrefabCollection*1Barotrauma*Particles*ParticlePrefab
---@param onSort (System.Action)|(fun())
---@return Barotrauma.PrefabCollection*1Barotrauma*Particles*ParticlePrefab
_G['PrefabCollection*1Barotrauma*Particles*ParticlePrefab'] = function(onSort) end

---`Constructor Public Instance`
---@overload fun():Barotrauma.PrefabCollection*1Barotrauma*Particles*ParticlePrefab
---@overload fun(onAdd:(System.Action*1Barotrauma*Particles*ParticlePrefab*1System*Boolean)|(fun(arg1:Barotrauma.Particles.ParticlePrefab, arg2:System.Boolean)), onRemove:(System.Action*1Barotrauma*Particles*ParticlePrefab)|(fun(obj:Barotrauma.Particles.ParticlePrefab)), onSort:(System.Action)|(fun()), onAddOverrideFile:(System.Action*1Barotrauma*ContentFile)|(fun(obj:Barotrauma.ContentFile)), onRemoveOverrideFile:(System.Action*1Barotrauma*ContentFile)|(fun(obj:Barotrauma.ContentFile))):Barotrauma.PrefabCollection*1Barotrauma*Particles*ParticlePrefab
---@param onSort (System.Action)|(fun())
---@return Barotrauma.PrefabCollection*1Barotrauma*Particles*ParticlePrefab
_G['PrefabCollection*1Barotrauma*Particles*ParticlePrefab'].__new = function(onSort) end

