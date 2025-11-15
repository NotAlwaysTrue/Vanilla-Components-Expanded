---@meta
---@class Barotrauma.PrefabCollection*1Barotrauma*EventManagerSettings : System.Object, {[Barotrauma.Identifier]:Barotrauma.EventManagerSettings}, {[System.String]:Barotrauma.EventManagerSettings}
---`Field Private Instance`
---@field OnAdd (System.Action*1Barotrauma*EventManagerSettings*1System*Boolean)|(fun(arg1:Barotrauma.EventManagerSettings, arg2:System.Boolean))
---`Field Private Instance`
---@field OnRemove (System.Action*1Barotrauma*EventManagerSettings)|(fun(obj:Barotrauma.EventManagerSettings))
---`Field Private Instance`
---@field OnSort (System.Action)|(fun())
---`Field Private Instance`
---@field OnAddOverrideFile (System.Action*1Barotrauma*ContentFile)|(fun(obj:Barotrauma.ContentFile))
---`Field Private Instance`
---@field OnRemoveOverrideFile (System.Action*1Barotrauma*ContentFile)|(fun(obj:Barotrauma.ContentFile))
---`Field Private Instance`
---@field prefabs (System.Collections.Concurrent.ConcurrentDictionary*1Barotrauma*Identifier*1Barotrauma*PrefabSelector*2Barotrauma*EventManagerSettings)|(fun():(System.Collections.Generic.KeyValuePair*1Barotrauma*Identifier*1Barotrauma*PrefabSelector*2Barotrauma*EventManagerSettings))
---`Field Private Instance`
---@field overrideFiles (System.Collections.Generic.HashSet*1Barotrauma*ContentFile)|(Barotrauma.ContentFile[])
---`Field Private Instance`
---@field topMostOverrideFile Barotrauma.ContentFile
---`Field Private Instance`
---@field implementsVariants System.Boolean
---`Getter Public Instance`
---@field AllPrefabs (System.Collections.Generic.IEnumerable*1System*Collections*Generic*KeyValuePair*2Barotrauma*Identifier*2Barotrauma*PrefabSelector*3Barotrauma*EventManagerSettings)|(fun():(System.Collections.Generic.KeyValuePair*1Barotrauma*Identifier*1Barotrauma*PrefabSelector*2Barotrauma*EventManagerSettings))
---`Getter Public Instance`
---@field Keys (System.Collections.Generic.IEnumerable*1Barotrauma*Identifier)|(fun():(Barotrauma.Identifier))
_G['PrefabCollection*1Barotrauma*EventManagerSettings'] = {}

---`Method Public Instance`
---@return (System.Linq.IOrderedEnumerable*1Barotrauma*EventManagerSettings)|(fun():(Barotrauma.EventManagerSettings))
_G['PrefabCollection*1Barotrauma*EventManagerSettings'].GetOrdered = function() end

---`Method Private Instance`
---@param prefab Barotrauma.EventManagerSettings
---@return System.Boolean
_G['PrefabCollection*1Barotrauma*EventManagerSettings'].IsPrefabOverriddenByFile = function(prefab) end

---`Method Private Static`
---@param prefab Barotrauma.EventManagerSettings
---@return System.Boolean
_G['PrefabCollection*1Barotrauma*EventManagerSettings'].IsInheritanceValid = function(prefab) end

---`Method Private Instance`
---@overload fun(prefabIdentifier:Barotrauma.Identifier)
---@param identifiers (System.Collections.Generic.IEnumerable*1Barotrauma*Identifier)|(fun():(Barotrauma.Identifier))
_G['PrefabCollection*1Barotrauma*EventManagerSettings'].HandleInheritance = function(identifiers) end

---`Method Public Instance`
---@overload fun(identifier:Barotrauma.Identifier, result:Barotrauma.EventManagerSettings-ref):(System.Boolean)
---@param identifier System.String
---@param result Barotrauma.EventManagerSettings-ref
---@return System.Boolean
_G['PrefabCollection*1Barotrauma*EventManagerSettings'].TryGet = function(identifier, result) end

---`Method Private Instance`
---@param identifier Barotrauma.Identifier
---@param result Barotrauma.EventManagerSettings-ref
---@param requireInheritanceValid System.Boolean
---@return System.Boolean
_G['PrefabCollection*1Barotrauma*EventManagerSettings'].TryGet = function(identifier, result, requireInheritanceValid) end

---`Method Public Instance`
---@param predicate (System.Predicate*1Barotrauma*EventManagerSettings)|(fun(obj:Barotrauma.EventManagerSettings):(System.Boolean))
---@return Barotrauma.EventManagerSettings
_G['PrefabCollection*1Barotrauma*EventManagerSettings'].Find = function(predicate) end

---`Method Public Instance`
---@overload fun(identifier:Barotrauma.Identifier):(System.Boolean)
---@param k System.String
---@return System.Boolean
_G['PrefabCollection*1Barotrauma*EventManagerSettings'].ContainsKey = function(k) end

---`Method Public Instance`
---@param prefab Barotrauma.EventManagerSettings
---@return System.Boolean
_G['PrefabCollection*1Barotrauma*EventManagerSettings'].IsOverride = function(prefab) end

---`Method Public Instance`
---@param prefab Barotrauma.EventManagerSettings
---@param isOverride System.Boolean
_G['PrefabCollection*1Barotrauma*EventManagerSettings'].Add = function(prefab, isOverride) end

---`Method Public Instance`
---@param prefab Barotrauma.EventManagerSettings
_G['PrefabCollection*1Barotrauma*EventManagerSettings'].Remove = function(prefab) end

---`Method Public Instance`
---@param file Barotrauma.ContentFile
_G['PrefabCollection*1Barotrauma*EventManagerSettings'].RemoveByFile = function(file) end

---`Method Public Instance`
---@param file Barotrauma.ContentFile
_G['PrefabCollection*1Barotrauma*EventManagerSettings'].AddOverrideFile = function(file) end

---`Method Public Instance`
---@param file Barotrauma.ContentFile
_G['PrefabCollection*1Barotrauma*EventManagerSettings'].RemoveOverrideFile = function(file) end

---`Method Public Instance`
_G['PrefabCollection*1Barotrauma*EventManagerSettings'].SortAll = function() end

---`Method Public Instance Virtual`
---@return System.Collections.Generic.IEnumerator*1Barotrauma*EventManagerSettings
_G['PrefabCollection*1Barotrauma*EventManagerSettings'].GetEnumerator = function() end

---`Method Private Instance`
---@param requireInheritanceValid System.Boolean
---@return System.Collections.Generic.IEnumerator*1Barotrauma*EventManagerSettings
_G['PrefabCollection*1Barotrauma*EventManagerSettings'].GetEnumerator = function(requireInheritanceValid) end

---`Constructor Public Instance`
---@overload fun():Barotrauma.PrefabCollection*1Barotrauma*EventManagerSettings
---@overload fun(onAdd:(System.Action*1Barotrauma*EventManagerSettings*1System*Boolean)|(fun(arg1:Barotrauma.EventManagerSettings, arg2:System.Boolean)), onRemove:(System.Action*1Barotrauma*EventManagerSettings)|(fun(obj:Barotrauma.EventManagerSettings)), onSort:(System.Action)|(fun()), onAddOverrideFile:(System.Action*1Barotrauma*ContentFile)|(fun(obj:Barotrauma.ContentFile)), onRemoveOverrideFile:(System.Action*1Barotrauma*ContentFile)|(fun(obj:Barotrauma.ContentFile))):Barotrauma.PrefabCollection*1Barotrauma*EventManagerSettings
---@param onSort (System.Action)|(fun())
---@return Barotrauma.PrefabCollection*1Barotrauma*EventManagerSettings
_G['PrefabCollection*1Barotrauma*EventManagerSettings'] = function(onSort) end

---`Constructor Public Instance`
---@overload fun():Barotrauma.PrefabCollection*1Barotrauma*EventManagerSettings
---@overload fun(onAdd:(System.Action*1Barotrauma*EventManagerSettings*1System*Boolean)|(fun(arg1:Barotrauma.EventManagerSettings, arg2:System.Boolean)), onRemove:(System.Action*1Barotrauma*EventManagerSettings)|(fun(obj:Barotrauma.EventManagerSettings)), onSort:(System.Action)|(fun()), onAddOverrideFile:(System.Action*1Barotrauma*ContentFile)|(fun(obj:Barotrauma.ContentFile)), onRemoveOverrideFile:(System.Action*1Barotrauma*ContentFile)|(fun(obj:Barotrauma.ContentFile))):Barotrauma.PrefabCollection*1Barotrauma*EventManagerSettings
---@param onSort (System.Action)|(fun())
---@return Barotrauma.PrefabCollection*1Barotrauma*EventManagerSettings
_G['PrefabCollection*1Barotrauma*EventManagerSettings'].__new = function(onSort) end

