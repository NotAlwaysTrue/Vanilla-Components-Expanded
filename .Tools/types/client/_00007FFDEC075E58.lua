---@meta
---@class Barotrauma.PrefabCollection*1Barotrauma*LocationType : System.Object, {[Barotrauma.Identifier]:Barotrauma.LocationType}, {[System.String]:Barotrauma.LocationType}
---`Field Private Instance`
---@field OnAdd (System.Action*1Barotrauma*LocationType*1System*Boolean)|(fun(arg1:Barotrauma.LocationType, arg2:System.Boolean))
---`Field Private Instance`
---@field OnRemove (System.Action*1Barotrauma*LocationType)|(fun(obj:Barotrauma.LocationType))
---`Field Private Instance`
---@field OnSort (System.Action)|(fun())
---`Field Private Instance`
---@field OnAddOverrideFile (System.Action*1Barotrauma*ContentFile)|(fun(obj:Barotrauma.ContentFile))
---`Field Private Instance`
---@field OnRemoveOverrideFile (System.Action*1Barotrauma*ContentFile)|(fun(obj:Barotrauma.ContentFile))
---`Field Private Instance`
---@field prefabs (System.Collections.Concurrent.ConcurrentDictionary*1Barotrauma*Identifier*1Barotrauma*PrefabSelector*2Barotrauma*LocationType)|(fun():(System.Collections.Generic.KeyValuePair*1Barotrauma*Identifier*1Barotrauma*PrefabSelector*2Barotrauma*LocationType))
---`Field Private Instance`
---@field overrideFiles (System.Collections.Generic.HashSet*1Barotrauma*ContentFile)|(Barotrauma.ContentFile[])
---`Field Private Instance`
---@field topMostOverrideFile Barotrauma.ContentFile
---`Field Private Instance`
---@field implementsVariants System.Boolean
---`Getter Public Instance`
---@field AllPrefabs (System.Collections.Generic.IEnumerable*1System*Collections*Generic*KeyValuePair*2Barotrauma*Identifier*2Barotrauma*PrefabSelector*3Barotrauma*LocationType)|(fun():(System.Collections.Generic.KeyValuePair*1Barotrauma*Identifier*1Barotrauma*PrefabSelector*2Barotrauma*LocationType))
---`Getter Public Instance`
---@field Keys (System.Collections.Generic.IEnumerable*1Barotrauma*Identifier)|(fun():(Barotrauma.Identifier))
_G['PrefabCollection*1Barotrauma*LocationType'] = {}

---`Method Public Instance`
---@return (System.Linq.IOrderedEnumerable*1Barotrauma*LocationType)|(fun():(Barotrauma.LocationType))
_G['PrefabCollection*1Barotrauma*LocationType'].GetOrdered = function() end

---`Method Private Instance`
---@param prefab Barotrauma.LocationType
---@return System.Boolean
_G['PrefabCollection*1Barotrauma*LocationType'].IsPrefabOverriddenByFile = function(prefab) end

---`Method Private Static`
---@param prefab Barotrauma.LocationType
---@return System.Boolean
_G['PrefabCollection*1Barotrauma*LocationType'].IsInheritanceValid = function(prefab) end

---`Method Private Instance`
---@overload fun(prefabIdentifier:Barotrauma.Identifier)
---@param identifiers (System.Collections.Generic.IEnumerable*1Barotrauma*Identifier)|(fun():(Barotrauma.Identifier))
_G['PrefabCollection*1Barotrauma*LocationType'].HandleInheritance = function(identifiers) end

---`Method Public Instance`
---@overload fun(identifier:Barotrauma.Identifier, result:Barotrauma.LocationType-ref):(System.Boolean)
---@param identifier System.String
---@param result Barotrauma.LocationType-ref
---@return System.Boolean
_G['PrefabCollection*1Barotrauma*LocationType'].TryGet = function(identifier, result) end

---`Method Private Instance`
---@param identifier Barotrauma.Identifier
---@param result Barotrauma.LocationType-ref
---@param requireInheritanceValid System.Boolean
---@return System.Boolean
_G['PrefabCollection*1Barotrauma*LocationType'].TryGet = function(identifier, result, requireInheritanceValid) end

---`Method Public Instance`
---@param predicate (System.Predicate*1Barotrauma*LocationType)|(fun(obj:Barotrauma.LocationType):(System.Boolean))
---@return Barotrauma.LocationType
_G['PrefabCollection*1Barotrauma*LocationType'].Find = function(predicate) end

---`Method Public Instance`
---@overload fun(identifier:Barotrauma.Identifier):(System.Boolean)
---@param k System.String
---@return System.Boolean
_G['PrefabCollection*1Barotrauma*LocationType'].ContainsKey = function(k) end

---`Method Public Instance`
---@param prefab Barotrauma.LocationType
---@return System.Boolean
_G['PrefabCollection*1Barotrauma*LocationType'].IsOverride = function(prefab) end

---`Method Public Instance`
---@param prefab Barotrauma.LocationType
---@param isOverride System.Boolean
_G['PrefabCollection*1Barotrauma*LocationType'].Add = function(prefab, isOverride) end

---`Method Public Instance`
---@param prefab Barotrauma.LocationType
_G['PrefabCollection*1Barotrauma*LocationType'].Remove = function(prefab) end

---`Method Public Instance`
---@param file Barotrauma.ContentFile
_G['PrefabCollection*1Barotrauma*LocationType'].RemoveByFile = function(file) end

---`Method Public Instance`
---@param file Barotrauma.ContentFile
_G['PrefabCollection*1Barotrauma*LocationType'].AddOverrideFile = function(file) end

---`Method Public Instance`
---@param file Barotrauma.ContentFile
_G['PrefabCollection*1Barotrauma*LocationType'].RemoveOverrideFile = function(file) end

---`Method Public Instance`
_G['PrefabCollection*1Barotrauma*LocationType'].SortAll = function() end

---`Method Public Instance Virtual`
---@return System.Collections.Generic.IEnumerator*1Barotrauma*LocationType
_G['PrefabCollection*1Barotrauma*LocationType'].GetEnumerator = function() end

---`Method Private Instance`
---@param requireInheritanceValid System.Boolean
---@return System.Collections.Generic.IEnumerator*1Barotrauma*LocationType
_G['PrefabCollection*1Barotrauma*LocationType'].GetEnumerator = function(requireInheritanceValid) end

---`Constructor Public Instance`
---@overload fun():Barotrauma.PrefabCollection*1Barotrauma*LocationType
---@overload fun(onAdd:(System.Action*1Barotrauma*LocationType*1System*Boolean)|(fun(arg1:Barotrauma.LocationType, arg2:System.Boolean)), onRemove:(System.Action*1Barotrauma*LocationType)|(fun(obj:Barotrauma.LocationType)), onSort:(System.Action)|(fun()), onAddOverrideFile:(System.Action*1Barotrauma*ContentFile)|(fun(obj:Barotrauma.ContentFile)), onRemoveOverrideFile:(System.Action*1Barotrauma*ContentFile)|(fun(obj:Barotrauma.ContentFile))):Barotrauma.PrefabCollection*1Barotrauma*LocationType
---@param onSort (System.Action)|(fun())
---@return Barotrauma.PrefabCollection*1Barotrauma*LocationType
_G['PrefabCollection*1Barotrauma*LocationType'] = function(onSort) end

---`Constructor Public Instance`
---@overload fun():Barotrauma.PrefabCollection*1Barotrauma*LocationType
---@overload fun(onAdd:(System.Action*1Barotrauma*LocationType*1System*Boolean)|(fun(arg1:Barotrauma.LocationType, arg2:System.Boolean)), onRemove:(System.Action*1Barotrauma*LocationType)|(fun(obj:Barotrauma.LocationType)), onSort:(System.Action)|(fun()), onAddOverrideFile:(System.Action*1Barotrauma*ContentFile)|(fun(obj:Barotrauma.ContentFile)), onRemoveOverrideFile:(System.Action*1Barotrauma*ContentFile)|(fun(obj:Barotrauma.ContentFile))):Barotrauma.PrefabCollection*1Barotrauma*LocationType
---@param onSort (System.Action)|(fun())
---@return Barotrauma.PrefabCollection*1Barotrauma*LocationType
_G['PrefabCollection*1Barotrauma*LocationType'].__new = function(onSort) end

