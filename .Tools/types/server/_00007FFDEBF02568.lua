---@meta
---@class Barotrauma.PrefabCollection*1Barotrauma*AfflictionPrefab : System.Object, {[Barotrauma.Identifier]:Barotrauma.AfflictionPrefab}, {[System.String]:Barotrauma.AfflictionPrefab}
---`Field Private Instance`
---@field OnAdd (System.Action*1Barotrauma*AfflictionPrefab*1System*Boolean)|(fun(arg1:Barotrauma.AfflictionPrefab, arg2:System.Boolean))
---`Field Private Instance`
---@field OnRemove (System.Action*1Barotrauma*AfflictionPrefab)|(fun(obj:Barotrauma.AfflictionPrefab))
---`Field Private Instance`
---@field OnSort (System.Action)|(fun())
---`Field Private Instance`
---@field OnAddOverrideFile (System.Action*1Barotrauma*ContentFile)|(fun(obj:Barotrauma.ContentFile))
---`Field Private Instance`
---@field OnRemoveOverrideFile (System.Action*1Barotrauma*ContentFile)|(fun(obj:Barotrauma.ContentFile))
---`Field Private Instance`
---@field prefabs (System.Collections.Concurrent.ConcurrentDictionary*1Barotrauma*Identifier*1Barotrauma*PrefabSelector*2Barotrauma*AfflictionPrefab)|(fun():(System.Collections.Generic.KeyValuePair*1Barotrauma*Identifier*1Barotrauma*PrefabSelector*2Barotrauma*AfflictionPrefab))
---`Field Private Instance`
---@field overrideFiles (System.Collections.Generic.HashSet*1Barotrauma*ContentFile)|(Barotrauma.ContentFile[])
---`Field Private Instance`
---@field topMostOverrideFile Barotrauma.ContentFile
---`Field Private Instance`
---@field implementsVariants System.Boolean
---`Getter Public Instance`
---@field AllPrefabs (System.Collections.Generic.IEnumerable*1System*Collections*Generic*KeyValuePair*2Barotrauma*Identifier*2Barotrauma*PrefabSelector*3Barotrauma*AfflictionPrefab)|(fun():(System.Collections.Generic.KeyValuePair*1Barotrauma*Identifier*1Barotrauma*PrefabSelector*2Barotrauma*AfflictionPrefab))
---`Getter Public Instance`
---@field Keys (System.Collections.Generic.IEnumerable*1Barotrauma*Identifier)|(fun():(Barotrauma.Identifier))
_G['PrefabCollection*1Barotrauma*AfflictionPrefab'] = {}

---`Method Public Instance`
---@return (System.Linq.IOrderedEnumerable*1Barotrauma*AfflictionPrefab)|(fun():(Barotrauma.AfflictionPrefab))
_G['PrefabCollection*1Barotrauma*AfflictionPrefab'].GetOrdered = function() end

---`Method Private Instance`
---@param prefab Barotrauma.AfflictionPrefab
---@return System.Boolean
_G['PrefabCollection*1Barotrauma*AfflictionPrefab'].IsPrefabOverriddenByFile = function(prefab) end

---`Method Private Static`
---@param prefab Barotrauma.AfflictionPrefab
---@return System.Boolean
_G['PrefabCollection*1Barotrauma*AfflictionPrefab'].IsInheritanceValid = function(prefab) end

---`Method Private Instance`
---@overload fun(prefabIdentifier:Barotrauma.Identifier)
---@param identifiers (System.Collections.Generic.IEnumerable*1Barotrauma*Identifier)|(fun():(Barotrauma.Identifier))
_G['PrefabCollection*1Barotrauma*AfflictionPrefab'].HandleInheritance = function(identifiers) end

---`Method Public Instance`
---@overload fun(identifier:Barotrauma.Identifier, result:Barotrauma.AfflictionPrefab-ref):(System.Boolean)
---@param identifier System.String
---@param result Barotrauma.AfflictionPrefab-ref
---@return System.Boolean
_G['PrefabCollection*1Barotrauma*AfflictionPrefab'].TryGet = function(identifier, result) end

---`Method Private Instance`
---@param identifier Barotrauma.Identifier
---@param result Barotrauma.AfflictionPrefab-ref
---@param requireInheritanceValid System.Boolean
---@return System.Boolean
_G['PrefabCollection*1Barotrauma*AfflictionPrefab'].TryGet = function(identifier, result, requireInheritanceValid) end

---`Method Public Instance`
---@param predicate (System.Predicate*1Barotrauma*AfflictionPrefab)|(fun(obj:Barotrauma.AfflictionPrefab):(System.Boolean))
---@return Barotrauma.AfflictionPrefab
_G['PrefabCollection*1Barotrauma*AfflictionPrefab'].Find = function(predicate) end

---`Method Public Instance`
---@overload fun(identifier:Barotrauma.Identifier):(System.Boolean)
---@param k System.String
---@return System.Boolean
_G['PrefabCollection*1Barotrauma*AfflictionPrefab'].ContainsKey = function(k) end

---`Method Public Instance`
---@param prefab Barotrauma.AfflictionPrefab
---@return System.Boolean
_G['PrefabCollection*1Barotrauma*AfflictionPrefab'].IsOverride = function(prefab) end

---`Method Public Instance`
---@param prefab Barotrauma.AfflictionPrefab
---@param isOverride System.Boolean
_G['PrefabCollection*1Barotrauma*AfflictionPrefab'].Add = function(prefab, isOverride) end

---`Method Public Instance`
---@param prefab Barotrauma.AfflictionPrefab
_G['PrefabCollection*1Barotrauma*AfflictionPrefab'].Remove = function(prefab) end

---`Method Public Instance`
---@param file Barotrauma.ContentFile
_G['PrefabCollection*1Barotrauma*AfflictionPrefab'].RemoveByFile = function(file) end

---`Method Public Instance`
---@param file Barotrauma.ContentFile
_G['PrefabCollection*1Barotrauma*AfflictionPrefab'].AddOverrideFile = function(file) end

---`Method Public Instance`
---@param file Barotrauma.ContentFile
_G['PrefabCollection*1Barotrauma*AfflictionPrefab'].RemoveOverrideFile = function(file) end

---`Method Public Instance`
_G['PrefabCollection*1Barotrauma*AfflictionPrefab'].SortAll = function() end

---`Method Public Instance Virtual`
---@return System.Collections.Generic.IEnumerator*1Barotrauma*AfflictionPrefab
_G['PrefabCollection*1Barotrauma*AfflictionPrefab'].GetEnumerator = function() end

---`Method Private Instance`
---@param requireInheritanceValid System.Boolean
---@return System.Collections.Generic.IEnumerator*1Barotrauma*AfflictionPrefab
_G['PrefabCollection*1Barotrauma*AfflictionPrefab'].GetEnumerator = function(requireInheritanceValid) end

---`Constructor Public Instance`
---@overload fun():Barotrauma.PrefabCollection*1Barotrauma*AfflictionPrefab
---@overload fun(onAdd:(System.Action*1Barotrauma*AfflictionPrefab*1System*Boolean)|(fun(arg1:Barotrauma.AfflictionPrefab, arg2:System.Boolean)), onRemove:(System.Action*1Barotrauma*AfflictionPrefab)|(fun(obj:Barotrauma.AfflictionPrefab)), onSort:(System.Action)|(fun()), onAddOverrideFile:(System.Action*1Barotrauma*ContentFile)|(fun(obj:Barotrauma.ContentFile)), onRemoveOverrideFile:(System.Action*1Barotrauma*ContentFile)|(fun(obj:Barotrauma.ContentFile))):Barotrauma.PrefabCollection*1Barotrauma*AfflictionPrefab
---@param onSort (System.Action)|(fun())
---@return Barotrauma.PrefabCollection*1Barotrauma*AfflictionPrefab
_G['PrefabCollection*1Barotrauma*AfflictionPrefab'] = function(onSort) end

---`Constructor Public Instance`
---@overload fun():Barotrauma.PrefabCollection*1Barotrauma*AfflictionPrefab
---@overload fun(onAdd:(System.Action*1Barotrauma*AfflictionPrefab*1System*Boolean)|(fun(arg1:Barotrauma.AfflictionPrefab, arg2:System.Boolean)), onRemove:(System.Action*1Barotrauma*AfflictionPrefab)|(fun(obj:Barotrauma.AfflictionPrefab)), onSort:(System.Action)|(fun()), onAddOverrideFile:(System.Action*1Barotrauma*ContentFile)|(fun(obj:Barotrauma.ContentFile)), onRemoveOverrideFile:(System.Action*1Barotrauma*ContentFile)|(fun(obj:Barotrauma.ContentFile))):Barotrauma.PrefabCollection*1Barotrauma*AfflictionPrefab
---@param onSort (System.Action)|(fun())
---@return Barotrauma.PrefabCollection*1Barotrauma*AfflictionPrefab
_G['PrefabCollection*1Barotrauma*AfflictionPrefab'].__new = function(onSort) end

