---@meta
---@class Barotrauma.PrefabCollection*1Barotrauma*HumanPrefab : System.Object, {[Barotrauma.Identifier]:Barotrauma.HumanPrefab}, {[System.String]:Barotrauma.HumanPrefab}
---`Field Private Instance`
---@field OnAdd (System.Action*1Barotrauma*HumanPrefab*1System*Boolean)|(fun(arg1:Barotrauma.HumanPrefab, arg2:System.Boolean))
---`Field Private Instance`
---@field OnRemove (System.Action*1Barotrauma*HumanPrefab)|(fun(obj:Barotrauma.HumanPrefab))
---`Field Private Instance`
---@field OnSort (System.Action)|(fun())
---`Field Private Instance`
---@field OnAddOverrideFile (System.Action*1Barotrauma*ContentFile)|(fun(obj:Barotrauma.ContentFile))
---`Field Private Instance`
---@field OnRemoveOverrideFile (System.Action*1Barotrauma*ContentFile)|(fun(obj:Barotrauma.ContentFile))
---`Field Private Instance`
---@field prefabs (System.Collections.Concurrent.ConcurrentDictionary*1Barotrauma*Identifier*1Barotrauma*PrefabSelector*2Barotrauma*HumanPrefab)|(fun():(System.Collections.Generic.KeyValuePair*1Barotrauma*Identifier*1Barotrauma*PrefabSelector*2Barotrauma*HumanPrefab))
---`Field Private Instance`
---@field overrideFiles (System.Collections.Generic.HashSet*1Barotrauma*ContentFile)|(Barotrauma.ContentFile[])
---`Field Private Instance`
---@field topMostOverrideFile Barotrauma.ContentFile
---`Field Private Instance`
---@field implementsVariants System.Boolean
---`Getter Public Instance`
---@field AllPrefabs (System.Collections.Generic.IEnumerable*1System*Collections*Generic*KeyValuePair*2Barotrauma*Identifier*2Barotrauma*PrefabSelector*3Barotrauma*HumanPrefab)|(fun():(System.Collections.Generic.KeyValuePair*1Barotrauma*Identifier*1Barotrauma*PrefabSelector*2Barotrauma*HumanPrefab))
---`Getter Public Instance`
---@field Keys (System.Collections.Generic.IEnumerable*1Barotrauma*Identifier)|(fun():(Barotrauma.Identifier))
_G['PrefabCollection*1Barotrauma*HumanPrefab'] = {}

---`Method Public Instance`
---@return (System.Linq.IOrderedEnumerable*1Barotrauma*HumanPrefab)|(fun():(Barotrauma.HumanPrefab))
_G['PrefabCollection*1Barotrauma*HumanPrefab'].GetOrdered = function() end

---`Method Private Instance`
---@param prefab Barotrauma.HumanPrefab
---@return System.Boolean
_G['PrefabCollection*1Barotrauma*HumanPrefab'].IsPrefabOverriddenByFile = function(prefab) end

---`Method Private Static`
---@param prefab Barotrauma.HumanPrefab
---@return System.Boolean
_G['PrefabCollection*1Barotrauma*HumanPrefab'].IsInheritanceValid = function(prefab) end

---`Method Private Instance`
---@overload fun(prefabIdentifier:Barotrauma.Identifier)
---@param identifiers (System.Collections.Generic.IEnumerable*1Barotrauma*Identifier)|(fun():(Barotrauma.Identifier))
_G['PrefabCollection*1Barotrauma*HumanPrefab'].HandleInheritance = function(identifiers) end

---`Method Public Instance`
---@overload fun(identifier:Barotrauma.Identifier, result:Barotrauma.HumanPrefab-ref):(System.Boolean)
---@param identifier System.String
---@param result Barotrauma.HumanPrefab-ref
---@return System.Boolean
_G['PrefabCollection*1Barotrauma*HumanPrefab'].TryGet = function(identifier, result) end

---`Method Private Instance`
---@param identifier Barotrauma.Identifier
---@param result Barotrauma.HumanPrefab-ref
---@param requireInheritanceValid System.Boolean
---@return System.Boolean
_G['PrefabCollection*1Barotrauma*HumanPrefab'].TryGet = function(identifier, result, requireInheritanceValid) end

---`Method Public Instance`
---@param predicate (System.Predicate*1Barotrauma*HumanPrefab)|(fun(obj:Barotrauma.HumanPrefab):(System.Boolean))
---@return Barotrauma.HumanPrefab
_G['PrefabCollection*1Barotrauma*HumanPrefab'].Find = function(predicate) end

---`Method Public Instance`
---@overload fun(identifier:Barotrauma.Identifier):(System.Boolean)
---@param k System.String
---@return System.Boolean
_G['PrefabCollection*1Barotrauma*HumanPrefab'].ContainsKey = function(k) end

---`Method Public Instance`
---@param prefab Barotrauma.HumanPrefab
---@return System.Boolean
_G['PrefabCollection*1Barotrauma*HumanPrefab'].IsOverride = function(prefab) end

---`Method Public Instance`
---@param prefab Barotrauma.HumanPrefab
---@param isOverride System.Boolean
_G['PrefabCollection*1Barotrauma*HumanPrefab'].Add = function(prefab, isOverride) end

---`Method Public Instance`
---@param prefab Barotrauma.HumanPrefab
_G['PrefabCollection*1Barotrauma*HumanPrefab'].Remove = function(prefab) end

---`Method Public Instance`
---@param file Barotrauma.ContentFile
_G['PrefabCollection*1Barotrauma*HumanPrefab'].RemoveByFile = function(file) end

---`Method Public Instance`
---@param file Barotrauma.ContentFile
_G['PrefabCollection*1Barotrauma*HumanPrefab'].AddOverrideFile = function(file) end

---`Method Public Instance`
---@param file Barotrauma.ContentFile
_G['PrefabCollection*1Barotrauma*HumanPrefab'].RemoveOverrideFile = function(file) end

---`Method Public Instance`
_G['PrefabCollection*1Barotrauma*HumanPrefab'].SortAll = function() end

---`Method Public Instance Virtual`
---@return System.Collections.Generic.IEnumerator*1Barotrauma*HumanPrefab
_G['PrefabCollection*1Barotrauma*HumanPrefab'].GetEnumerator = function() end

---`Method Private Instance`
---@param requireInheritanceValid System.Boolean
---@return System.Collections.Generic.IEnumerator*1Barotrauma*HumanPrefab
_G['PrefabCollection*1Barotrauma*HumanPrefab'].GetEnumerator = function(requireInheritanceValid) end

---`Constructor Public Instance`
---@overload fun():Barotrauma.PrefabCollection*1Barotrauma*HumanPrefab
---@overload fun(onAdd:(System.Action*1Barotrauma*HumanPrefab*1System*Boolean)|(fun(arg1:Barotrauma.HumanPrefab, arg2:System.Boolean)), onRemove:(System.Action*1Barotrauma*HumanPrefab)|(fun(obj:Barotrauma.HumanPrefab)), onSort:(System.Action)|(fun()), onAddOverrideFile:(System.Action*1Barotrauma*ContentFile)|(fun(obj:Barotrauma.ContentFile)), onRemoveOverrideFile:(System.Action*1Barotrauma*ContentFile)|(fun(obj:Barotrauma.ContentFile))):Barotrauma.PrefabCollection*1Barotrauma*HumanPrefab
---@param onSort (System.Action)|(fun())
---@return Barotrauma.PrefabCollection*1Barotrauma*HumanPrefab
_G['PrefabCollection*1Barotrauma*HumanPrefab'] = function(onSort) end

---`Constructor Public Instance`
---@overload fun():Barotrauma.PrefabCollection*1Barotrauma*HumanPrefab
---@overload fun(onAdd:(System.Action*1Barotrauma*HumanPrefab*1System*Boolean)|(fun(arg1:Barotrauma.HumanPrefab, arg2:System.Boolean)), onRemove:(System.Action*1Barotrauma*HumanPrefab)|(fun(obj:Barotrauma.HumanPrefab)), onSort:(System.Action)|(fun()), onAddOverrideFile:(System.Action*1Barotrauma*ContentFile)|(fun(obj:Barotrauma.ContentFile)), onRemoveOverrideFile:(System.Action*1Barotrauma*ContentFile)|(fun(obj:Barotrauma.ContentFile))):Barotrauma.PrefabCollection*1Barotrauma*HumanPrefab
---@param onSort (System.Action)|(fun())
---@return Barotrauma.PrefabCollection*1Barotrauma*HumanPrefab
_G['PrefabCollection*1Barotrauma*HumanPrefab'].__new = function(onSort) end

