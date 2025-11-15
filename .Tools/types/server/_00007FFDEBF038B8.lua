---@meta
---@class Barotrauma.PrefabCollection*1Barotrauma*LevelGenerationParams : System.Object, {[Barotrauma.Identifier]:Barotrauma.LevelGenerationParams}, {[System.String]:Barotrauma.LevelGenerationParams}
---`Field Private Instance`
---@field OnAdd (System.Action*1Barotrauma*LevelGenerationParams*1System*Boolean)|(fun(arg1:Barotrauma.LevelGenerationParams, arg2:System.Boolean))
---`Field Private Instance`
---@field OnRemove (System.Action*1Barotrauma*LevelGenerationParams)|(fun(obj:Barotrauma.LevelGenerationParams))
---`Field Private Instance`
---@field OnSort (System.Action)|(fun())
---`Field Private Instance`
---@field OnAddOverrideFile (System.Action*1Barotrauma*ContentFile)|(fun(obj:Barotrauma.ContentFile))
---`Field Private Instance`
---@field OnRemoveOverrideFile (System.Action*1Barotrauma*ContentFile)|(fun(obj:Barotrauma.ContentFile))
---`Field Private Instance`
---@field prefabs (System.Collections.Concurrent.ConcurrentDictionary*1Barotrauma*Identifier*1Barotrauma*PrefabSelector*2Barotrauma*LevelGenerationParams)|(fun():(System.Collections.Generic.KeyValuePair*1Barotrauma*Identifier*1Barotrauma*PrefabSelector*2Barotrauma*LevelGenerationParams))
---`Field Private Instance`
---@field overrideFiles (System.Collections.Generic.HashSet*1Barotrauma*ContentFile)|(Barotrauma.ContentFile[])
---`Field Private Instance`
---@field topMostOverrideFile Barotrauma.ContentFile
---`Field Private Instance`
---@field implementsVariants System.Boolean
---`Getter Public Instance`
---@field AllPrefabs (System.Collections.Generic.IEnumerable*1System*Collections*Generic*KeyValuePair*2Barotrauma*Identifier*2Barotrauma*PrefabSelector*3Barotrauma*LevelGenerationParams)|(fun():(System.Collections.Generic.KeyValuePair*1Barotrauma*Identifier*1Barotrauma*PrefabSelector*2Barotrauma*LevelGenerationParams))
---`Getter Public Instance`
---@field Keys (System.Collections.Generic.IEnumerable*1Barotrauma*Identifier)|(fun():(Barotrauma.Identifier))
_G['PrefabCollection*1Barotrauma*LevelGenerationParams'] = {}

---`Method Public Instance`
---@return (System.Linq.IOrderedEnumerable*1Barotrauma*LevelGenerationParams)|(fun():(Barotrauma.LevelGenerationParams))
_G['PrefabCollection*1Barotrauma*LevelGenerationParams'].GetOrdered = function() end

---`Method Private Instance`
---@param prefab Barotrauma.LevelGenerationParams
---@return System.Boolean
_G['PrefabCollection*1Barotrauma*LevelGenerationParams'].IsPrefabOverriddenByFile = function(prefab) end

---`Method Private Static`
---@param prefab Barotrauma.LevelGenerationParams
---@return System.Boolean
_G['PrefabCollection*1Barotrauma*LevelGenerationParams'].IsInheritanceValid = function(prefab) end

---`Method Private Instance`
---@overload fun(prefabIdentifier:Barotrauma.Identifier)
---@param identifiers (System.Collections.Generic.IEnumerable*1Barotrauma*Identifier)|(fun():(Barotrauma.Identifier))
_G['PrefabCollection*1Barotrauma*LevelGenerationParams'].HandleInheritance = function(identifiers) end

---`Method Public Instance`
---@overload fun(identifier:Barotrauma.Identifier, result:Barotrauma.LevelGenerationParams-ref):(System.Boolean)
---@param identifier System.String
---@param result Barotrauma.LevelGenerationParams-ref
---@return System.Boolean
_G['PrefabCollection*1Barotrauma*LevelGenerationParams'].TryGet = function(identifier, result) end

---`Method Private Instance`
---@param identifier Barotrauma.Identifier
---@param result Barotrauma.LevelGenerationParams-ref
---@param requireInheritanceValid System.Boolean
---@return System.Boolean
_G['PrefabCollection*1Barotrauma*LevelGenerationParams'].TryGet = function(identifier, result, requireInheritanceValid) end

---`Method Public Instance`
---@param predicate (System.Predicate*1Barotrauma*LevelGenerationParams)|(fun(obj:Barotrauma.LevelGenerationParams):(System.Boolean))
---@return Barotrauma.LevelGenerationParams
_G['PrefabCollection*1Barotrauma*LevelGenerationParams'].Find = function(predicate) end

---`Method Public Instance`
---@overload fun(identifier:Barotrauma.Identifier):(System.Boolean)
---@param k System.String
---@return System.Boolean
_G['PrefabCollection*1Barotrauma*LevelGenerationParams'].ContainsKey = function(k) end

---`Method Public Instance`
---@param prefab Barotrauma.LevelGenerationParams
---@return System.Boolean
_G['PrefabCollection*1Barotrauma*LevelGenerationParams'].IsOverride = function(prefab) end

---`Method Public Instance`
---@param prefab Barotrauma.LevelGenerationParams
---@param isOverride System.Boolean
_G['PrefabCollection*1Barotrauma*LevelGenerationParams'].Add = function(prefab, isOverride) end

---`Method Public Instance`
---@param prefab Barotrauma.LevelGenerationParams
_G['PrefabCollection*1Barotrauma*LevelGenerationParams'].Remove = function(prefab) end

---`Method Public Instance`
---@param file Barotrauma.ContentFile
_G['PrefabCollection*1Barotrauma*LevelGenerationParams'].RemoveByFile = function(file) end

---`Method Public Instance`
---@param file Barotrauma.ContentFile
_G['PrefabCollection*1Barotrauma*LevelGenerationParams'].AddOverrideFile = function(file) end

---`Method Public Instance`
---@param file Barotrauma.ContentFile
_G['PrefabCollection*1Barotrauma*LevelGenerationParams'].RemoveOverrideFile = function(file) end

---`Method Public Instance`
_G['PrefabCollection*1Barotrauma*LevelGenerationParams'].SortAll = function() end

---`Method Public Instance Virtual`
---@return System.Collections.Generic.IEnumerator*1Barotrauma*LevelGenerationParams
_G['PrefabCollection*1Barotrauma*LevelGenerationParams'].GetEnumerator = function() end

---`Method Private Instance`
---@param requireInheritanceValid System.Boolean
---@return System.Collections.Generic.IEnumerator*1Barotrauma*LevelGenerationParams
_G['PrefabCollection*1Barotrauma*LevelGenerationParams'].GetEnumerator = function(requireInheritanceValid) end

---`Constructor Public Instance`
---@overload fun():Barotrauma.PrefabCollection*1Barotrauma*LevelGenerationParams
---@overload fun(onAdd:(System.Action*1Barotrauma*LevelGenerationParams*1System*Boolean)|(fun(arg1:Barotrauma.LevelGenerationParams, arg2:System.Boolean)), onRemove:(System.Action*1Barotrauma*LevelGenerationParams)|(fun(obj:Barotrauma.LevelGenerationParams)), onSort:(System.Action)|(fun()), onAddOverrideFile:(System.Action*1Barotrauma*ContentFile)|(fun(obj:Barotrauma.ContentFile)), onRemoveOverrideFile:(System.Action*1Barotrauma*ContentFile)|(fun(obj:Barotrauma.ContentFile))):Barotrauma.PrefabCollection*1Barotrauma*LevelGenerationParams
---@param onSort (System.Action)|(fun())
---@return Barotrauma.PrefabCollection*1Barotrauma*LevelGenerationParams
_G['PrefabCollection*1Barotrauma*LevelGenerationParams'] = function(onSort) end

---`Constructor Public Instance`
---@overload fun():Barotrauma.PrefabCollection*1Barotrauma*LevelGenerationParams
---@overload fun(onAdd:(System.Action*1Barotrauma*LevelGenerationParams*1System*Boolean)|(fun(arg1:Barotrauma.LevelGenerationParams, arg2:System.Boolean)), onRemove:(System.Action*1Barotrauma*LevelGenerationParams)|(fun(obj:Barotrauma.LevelGenerationParams)), onSort:(System.Action)|(fun()), onAddOverrideFile:(System.Action*1Barotrauma*ContentFile)|(fun(obj:Barotrauma.ContentFile)), onRemoveOverrideFile:(System.Action*1Barotrauma*ContentFile)|(fun(obj:Barotrauma.ContentFile))):Barotrauma.PrefabCollection*1Barotrauma*LevelGenerationParams
---@param onSort (System.Action)|(fun())
---@return Barotrauma.PrefabCollection*1Barotrauma*LevelGenerationParams
_G['PrefabCollection*1Barotrauma*LevelGenerationParams'].__new = function(onSort) end

