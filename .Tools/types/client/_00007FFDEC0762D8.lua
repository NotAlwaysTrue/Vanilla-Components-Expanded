---@meta
---@class Barotrauma.PrefabCollection*1Barotrauma*EventSet : System.Object, {[Barotrauma.Identifier]:Barotrauma.EventSet}, {[System.String]:Barotrauma.EventSet}
---`Field Private Instance`
---@field OnAdd (System.Action*1Barotrauma*EventSet*1System*Boolean)|(fun(arg1:Barotrauma.EventSet, arg2:System.Boolean))
---`Field Private Instance`
---@field OnRemove (System.Action*1Barotrauma*EventSet)|(fun(obj:Barotrauma.EventSet))
---`Field Private Instance`
---@field OnSort (System.Action)|(fun())
---`Field Private Instance`
---@field OnAddOverrideFile (System.Action*1Barotrauma*ContentFile)|(fun(obj:Barotrauma.ContentFile))
---`Field Private Instance`
---@field OnRemoveOverrideFile (System.Action*1Barotrauma*ContentFile)|(fun(obj:Barotrauma.ContentFile))
---`Field Private Instance`
---@field prefabs (System.Collections.Concurrent.ConcurrentDictionary*1Barotrauma*Identifier*1Barotrauma*PrefabSelector*2Barotrauma*EventSet)|(fun():(System.Collections.Generic.KeyValuePair*1Barotrauma*Identifier*1Barotrauma*PrefabSelector*2Barotrauma*EventSet))
---`Field Private Instance`
---@field overrideFiles (System.Collections.Generic.HashSet*1Barotrauma*ContentFile)|(Barotrauma.ContentFile[])
---`Field Private Instance`
---@field topMostOverrideFile Barotrauma.ContentFile
---`Field Private Instance`
---@field implementsVariants System.Boolean
---`Getter Public Instance`
---@field AllPrefabs (System.Collections.Generic.IEnumerable*1System*Collections*Generic*KeyValuePair*2Barotrauma*Identifier*2Barotrauma*PrefabSelector*3Barotrauma*EventSet)|(fun():(System.Collections.Generic.KeyValuePair*1Barotrauma*Identifier*1Barotrauma*PrefabSelector*2Barotrauma*EventSet))
---`Getter Public Instance`
---@field Keys (System.Collections.Generic.IEnumerable*1Barotrauma*Identifier)|(fun():(Barotrauma.Identifier))
_G['PrefabCollection*1Barotrauma*EventSet'] = {}

---`Method Public Instance`
---@return (System.Linq.IOrderedEnumerable*1Barotrauma*EventSet)|(fun():(Barotrauma.EventSet))
_G['PrefabCollection*1Barotrauma*EventSet'].GetOrdered = function() end

---`Method Private Instance`
---@param prefab Barotrauma.EventSet
---@return System.Boolean
_G['PrefabCollection*1Barotrauma*EventSet'].IsPrefabOverriddenByFile = function(prefab) end

---`Method Private Static`
---@param prefab Barotrauma.EventSet
---@return System.Boolean
_G['PrefabCollection*1Barotrauma*EventSet'].IsInheritanceValid = function(prefab) end

---`Method Private Instance`
---@overload fun(prefabIdentifier:Barotrauma.Identifier)
---@param identifiers (System.Collections.Generic.IEnumerable*1Barotrauma*Identifier)|(fun():(Barotrauma.Identifier))
_G['PrefabCollection*1Barotrauma*EventSet'].HandleInheritance = function(identifiers) end

---`Method Public Instance`
---@overload fun(identifier:Barotrauma.Identifier, result:Barotrauma.EventSet-ref):(System.Boolean)
---@param identifier System.String
---@param result Barotrauma.EventSet-ref
---@return System.Boolean
_G['PrefabCollection*1Barotrauma*EventSet'].TryGet = function(identifier, result) end

---`Method Private Instance`
---@param identifier Barotrauma.Identifier
---@param result Barotrauma.EventSet-ref
---@param requireInheritanceValid System.Boolean
---@return System.Boolean
_G['PrefabCollection*1Barotrauma*EventSet'].TryGet = function(identifier, result, requireInheritanceValid) end

---`Method Public Instance`
---@param predicate (System.Predicate*1Barotrauma*EventSet)|(fun(obj:Barotrauma.EventSet):(System.Boolean))
---@return Barotrauma.EventSet
_G['PrefabCollection*1Barotrauma*EventSet'].Find = function(predicate) end

---`Method Public Instance`
---@overload fun(identifier:Barotrauma.Identifier):(System.Boolean)
---@param k System.String
---@return System.Boolean
_G['PrefabCollection*1Barotrauma*EventSet'].ContainsKey = function(k) end

---`Method Public Instance`
---@param prefab Barotrauma.EventSet
---@return System.Boolean
_G['PrefabCollection*1Barotrauma*EventSet'].IsOverride = function(prefab) end

---`Method Public Instance`
---@param prefab Barotrauma.EventSet
---@param isOverride System.Boolean
_G['PrefabCollection*1Barotrauma*EventSet'].Add = function(prefab, isOverride) end

---`Method Public Instance`
---@param prefab Barotrauma.EventSet
_G['PrefabCollection*1Barotrauma*EventSet'].Remove = function(prefab) end

---`Method Public Instance`
---@param file Barotrauma.ContentFile
_G['PrefabCollection*1Barotrauma*EventSet'].RemoveByFile = function(file) end

---`Method Public Instance`
---@param file Barotrauma.ContentFile
_G['PrefabCollection*1Barotrauma*EventSet'].AddOverrideFile = function(file) end

---`Method Public Instance`
---@param file Barotrauma.ContentFile
_G['PrefabCollection*1Barotrauma*EventSet'].RemoveOverrideFile = function(file) end

---`Method Public Instance`
_G['PrefabCollection*1Barotrauma*EventSet'].SortAll = function() end

---`Method Public Instance Virtual`
---@return System.Collections.Generic.IEnumerator*1Barotrauma*EventSet
_G['PrefabCollection*1Barotrauma*EventSet'].GetEnumerator = function() end

---`Method Private Instance`
---@param requireInheritanceValid System.Boolean
---@return System.Collections.Generic.IEnumerator*1Barotrauma*EventSet
_G['PrefabCollection*1Barotrauma*EventSet'].GetEnumerator = function(requireInheritanceValid) end

---`Constructor Public Instance`
---@overload fun():Barotrauma.PrefabCollection*1Barotrauma*EventSet
---@overload fun(onAdd:(System.Action*1Barotrauma*EventSet*1System*Boolean)|(fun(arg1:Barotrauma.EventSet, arg2:System.Boolean)), onRemove:(System.Action*1Barotrauma*EventSet)|(fun(obj:Barotrauma.EventSet)), onSort:(System.Action)|(fun()), onAddOverrideFile:(System.Action*1Barotrauma*ContentFile)|(fun(obj:Barotrauma.ContentFile)), onRemoveOverrideFile:(System.Action*1Barotrauma*ContentFile)|(fun(obj:Barotrauma.ContentFile))):Barotrauma.PrefabCollection*1Barotrauma*EventSet
---@param onSort (System.Action)|(fun())
---@return Barotrauma.PrefabCollection*1Barotrauma*EventSet
_G['PrefabCollection*1Barotrauma*EventSet'] = function(onSort) end

---`Constructor Public Instance`
---@overload fun():Barotrauma.PrefabCollection*1Barotrauma*EventSet
---@overload fun(onAdd:(System.Action*1Barotrauma*EventSet*1System*Boolean)|(fun(arg1:Barotrauma.EventSet, arg2:System.Boolean)), onRemove:(System.Action*1Barotrauma*EventSet)|(fun(obj:Barotrauma.EventSet)), onSort:(System.Action)|(fun()), onAddOverrideFile:(System.Action*1Barotrauma*ContentFile)|(fun(obj:Barotrauma.ContentFile)), onRemoveOverrideFile:(System.Action*1Barotrauma*ContentFile)|(fun(obj:Barotrauma.ContentFile))):Barotrauma.PrefabCollection*1Barotrauma*EventSet
---@param onSort (System.Action)|(fun())
---@return Barotrauma.PrefabCollection*1Barotrauma*EventSet
_G['PrefabCollection*1Barotrauma*EventSet'].__new = function(onSort) end

