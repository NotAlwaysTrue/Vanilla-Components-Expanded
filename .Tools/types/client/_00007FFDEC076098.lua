---@meta
---@class Barotrauma.PrefabCollection*1Barotrauma*EventPrefab : System.Object, {[Barotrauma.Identifier]:Barotrauma.EventPrefab}, {[System.String]:Barotrauma.EventPrefab}
---`Field Private Instance`
---@field OnAdd (System.Action*1Barotrauma*EventPrefab*1System*Boolean)|(fun(arg1:Barotrauma.EventPrefab, arg2:System.Boolean))
---`Field Private Instance`
---@field OnRemove (System.Action*1Barotrauma*EventPrefab)|(fun(obj:Barotrauma.EventPrefab))
---`Field Private Instance`
---@field OnSort (System.Action)|(fun())
---`Field Private Instance`
---@field OnAddOverrideFile (System.Action*1Barotrauma*ContentFile)|(fun(obj:Barotrauma.ContentFile))
---`Field Private Instance`
---@field OnRemoveOverrideFile (System.Action*1Barotrauma*ContentFile)|(fun(obj:Barotrauma.ContentFile))
---`Field Private Instance`
---@field prefabs (System.Collections.Concurrent.ConcurrentDictionary*1Barotrauma*Identifier*1Barotrauma*PrefabSelector*2Barotrauma*EventPrefab)|(fun():(System.Collections.Generic.KeyValuePair*1Barotrauma*Identifier*1Barotrauma*PrefabSelector*2Barotrauma*EventPrefab))
---`Field Private Instance`
---@field overrideFiles (System.Collections.Generic.HashSet*1Barotrauma*ContentFile)|(Barotrauma.ContentFile[])
---`Field Private Instance`
---@field topMostOverrideFile Barotrauma.ContentFile
---`Field Private Instance`
---@field implementsVariants System.Boolean
---`Getter Public Instance`
---@field AllPrefabs (System.Collections.Generic.IEnumerable*1System*Collections*Generic*KeyValuePair*2Barotrauma*Identifier*2Barotrauma*PrefabSelector*3Barotrauma*EventPrefab)|(fun():(System.Collections.Generic.KeyValuePair*1Barotrauma*Identifier*1Barotrauma*PrefabSelector*2Barotrauma*EventPrefab))
---`Getter Public Instance`
---@field Keys (System.Collections.Generic.IEnumerable*1Barotrauma*Identifier)|(fun():(Barotrauma.Identifier))
_G['PrefabCollection*1Barotrauma*EventPrefab'] = {}

---`Method Public Instance`
---@return (System.Linq.IOrderedEnumerable*1Barotrauma*EventPrefab)|(fun():(Barotrauma.EventPrefab))
_G['PrefabCollection*1Barotrauma*EventPrefab'].GetOrdered = function() end

---`Method Private Instance`
---@param prefab Barotrauma.EventPrefab
---@return System.Boolean
_G['PrefabCollection*1Barotrauma*EventPrefab'].IsPrefabOverriddenByFile = function(prefab) end

---`Method Private Static`
---@param prefab Barotrauma.EventPrefab
---@return System.Boolean
_G['PrefabCollection*1Barotrauma*EventPrefab'].IsInheritanceValid = function(prefab) end

---`Method Private Instance`
---@overload fun(prefabIdentifier:Barotrauma.Identifier)
---@param identifiers (System.Collections.Generic.IEnumerable*1Barotrauma*Identifier)|(fun():(Barotrauma.Identifier))
_G['PrefabCollection*1Barotrauma*EventPrefab'].HandleInheritance = function(identifiers) end

---`Method Public Instance`
---@overload fun(identifier:Barotrauma.Identifier, result:Barotrauma.EventPrefab-ref):(System.Boolean)
---@param identifier System.String
---@param result Barotrauma.EventPrefab-ref
---@return System.Boolean
_G['PrefabCollection*1Barotrauma*EventPrefab'].TryGet = function(identifier, result) end

---`Method Private Instance`
---@param identifier Barotrauma.Identifier
---@param result Barotrauma.EventPrefab-ref
---@param requireInheritanceValid System.Boolean
---@return System.Boolean
_G['PrefabCollection*1Barotrauma*EventPrefab'].TryGet = function(identifier, result, requireInheritanceValid) end

---`Method Public Instance`
---@param predicate (System.Predicate*1Barotrauma*EventPrefab)|(fun(obj:Barotrauma.EventPrefab):(System.Boolean))
---@return Barotrauma.EventPrefab
_G['PrefabCollection*1Barotrauma*EventPrefab'].Find = function(predicate) end

---`Method Public Instance`
---@overload fun(identifier:Barotrauma.Identifier):(System.Boolean)
---@param k System.String
---@return System.Boolean
_G['PrefabCollection*1Barotrauma*EventPrefab'].ContainsKey = function(k) end

---`Method Public Instance`
---@param prefab Barotrauma.EventPrefab
---@return System.Boolean
_G['PrefabCollection*1Barotrauma*EventPrefab'].IsOverride = function(prefab) end

---`Method Public Instance`
---@param prefab Barotrauma.EventPrefab
---@param isOverride System.Boolean
_G['PrefabCollection*1Barotrauma*EventPrefab'].Add = function(prefab, isOverride) end

---`Method Public Instance`
---@param prefab Barotrauma.EventPrefab
_G['PrefabCollection*1Barotrauma*EventPrefab'].Remove = function(prefab) end

---`Method Public Instance`
---@param file Barotrauma.ContentFile
_G['PrefabCollection*1Barotrauma*EventPrefab'].RemoveByFile = function(file) end

---`Method Public Instance`
---@param file Barotrauma.ContentFile
_G['PrefabCollection*1Barotrauma*EventPrefab'].AddOverrideFile = function(file) end

---`Method Public Instance`
---@param file Barotrauma.ContentFile
_G['PrefabCollection*1Barotrauma*EventPrefab'].RemoveOverrideFile = function(file) end

---`Method Public Instance`
_G['PrefabCollection*1Barotrauma*EventPrefab'].SortAll = function() end

---`Method Public Instance Virtual`
---@return System.Collections.Generic.IEnumerator*1Barotrauma*EventPrefab
_G['PrefabCollection*1Barotrauma*EventPrefab'].GetEnumerator = function() end

---`Method Private Instance`
---@param requireInheritanceValid System.Boolean
---@return System.Collections.Generic.IEnumerator*1Barotrauma*EventPrefab
_G['PrefabCollection*1Barotrauma*EventPrefab'].GetEnumerator = function(requireInheritanceValid) end

---`Constructor Public Instance`
---@overload fun():Barotrauma.PrefabCollection*1Barotrauma*EventPrefab
---@overload fun(onAdd:(System.Action*1Barotrauma*EventPrefab*1System*Boolean)|(fun(arg1:Barotrauma.EventPrefab, arg2:System.Boolean)), onRemove:(System.Action*1Barotrauma*EventPrefab)|(fun(obj:Barotrauma.EventPrefab)), onSort:(System.Action)|(fun()), onAddOverrideFile:(System.Action*1Barotrauma*ContentFile)|(fun(obj:Barotrauma.ContentFile)), onRemoveOverrideFile:(System.Action*1Barotrauma*ContentFile)|(fun(obj:Barotrauma.ContentFile))):Barotrauma.PrefabCollection*1Barotrauma*EventPrefab
---@param onSort (System.Action)|(fun())
---@return Barotrauma.PrefabCollection*1Barotrauma*EventPrefab
_G['PrefabCollection*1Barotrauma*EventPrefab'] = function(onSort) end

---`Constructor Public Instance`
---@overload fun():Barotrauma.PrefabCollection*1Barotrauma*EventPrefab
---@overload fun(onAdd:(System.Action*1Barotrauma*EventPrefab*1System*Boolean)|(fun(arg1:Barotrauma.EventPrefab, arg2:System.Boolean)), onRemove:(System.Action*1Barotrauma*EventPrefab)|(fun(obj:Barotrauma.EventPrefab)), onSort:(System.Action)|(fun()), onAddOverrideFile:(System.Action*1Barotrauma*ContentFile)|(fun(obj:Barotrauma.ContentFile)), onRemoveOverrideFile:(System.Action*1Barotrauma*ContentFile)|(fun(obj:Barotrauma.ContentFile))):Barotrauma.PrefabCollection*1Barotrauma*EventPrefab
---@param onSort (System.Action)|(fun())
---@return Barotrauma.PrefabCollection*1Barotrauma*EventPrefab
_G['PrefabCollection*1Barotrauma*EventPrefab'].__new = function(onSort) end

