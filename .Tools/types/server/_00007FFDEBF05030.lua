---@meta
---@class Barotrauma.PrefabSelector*1Barotrauma*SkillSettings : System.Object
---`Field Private Instance`
---@field rwl System.Threading.ReaderWriterLockSlim
---`Field Private Instance`
---@field basePrefabInternal Barotrauma.SkillSettings
---`Field Private Instance`
---@field overrides (System.Collections.Generic.List*1Barotrauma*SkillSettings)|(Barotrauma.SkillSettings[])
---`Getter Public Instance`
---@field BasePrefab Barotrauma.SkillSettings
---`Getter Public Instance`
---@field ActivePrefab Barotrauma.SkillSettings
---`Getter Public Instance`
---@field IsEmpty System.Boolean
---`Getter Private Instance`
---@field activePrefabInternal Barotrauma.SkillSettings
---`Getter Private Instance`
---@field isEmptyInternal System.Boolean
_G['PrefabSelector*1Barotrauma*SkillSettings'] = {}

---`Method Public Instance`
---@param prefab Barotrauma.SkillSettings
---@param isOverride System.Boolean
_G['PrefabSelector*1Barotrauma*SkillSettings'].Add = function(prefab, isOverride) end

---`Method Public Instance`
---@param prefab Barotrauma.SkillSettings
_G['PrefabSelector*1Barotrauma*SkillSettings'].RemoveIfContains = function(prefab) end

---`Method Public Instance`
---@param prefab Barotrauma.SkillSettings
_G['PrefabSelector*1Barotrauma*SkillSettings'].Remove = function(prefab) end

---`Method Public Instance`
---@param file Barotrauma.ContentFile
---@param callback? (System.Action*1Barotrauma*SkillSettings)|(fun(obj:Barotrauma.SkillSettings))
_G['PrefabSelector*1Barotrauma*SkillSettings'].RemoveByFile = function(file, callback) end

---`Method Public Instance`
_G['PrefabSelector*1Barotrauma*SkillSettings'].Sort = function() end

---`Method Public Instance`
---@param prefab Barotrauma.SkillSettings
---@return System.Boolean
_G['PrefabSelector*1Barotrauma*SkillSettings'].Contains = function(prefab) end

---`Method Public Instance`
---@param prefab Barotrauma.SkillSettings
---@return System.Boolean
_G['PrefabSelector*1Barotrauma*SkillSettings'].IsOverride = function(prefab) end

---`Method Private Instance`
---@param prefab Barotrauma.SkillSettings
---@param isOverride System.Boolean
_G['PrefabSelector*1Barotrauma*SkillSettings'].AddInternal = function(prefab, isOverride) end

---`Method Private Instance`
---@param prefab Barotrauma.SkillSettings
_G['PrefabSelector*1Barotrauma*SkillSettings'].RemoveIfContainsInternal = function(prefab) end

---`Method Private Instance`
---@param prefab Barotrauma.SkillSettings
_G['PrefabSelector*1Barotrauma*SkillSettings'].RemoveInternal = function(prefab) end

---`Method Private Instance`
_G['PrefabSelector*1Barotrauma*SkillSettings'].SortInternal = function() end

---`Method Private Instance`
---@param prefab Barotrauma.SkillSettings
---@return System.Boolean
_G['PrefabSelector*1Barotrauma*SkillSettings'].ContainsInternal = function(prefab) end

---`Method Private Instance`
---@param prefab Barotrauma.SkillSettings
---@return System.Int32
_G['PrefabSelector*1Barotrauma*SkillSettings'].IndexOfInternal = function(prefab) end

---`Method Private Instance`
---@param prefab Barotrauma.SkillSettings
---@return System.Boolean
_G['PrefabSelector*1Barotrauma*SkillSettings'].IsOverrideInternal = function(prefab) end

---`Method Public Instance Virtual`
---@return System.Collections.Generic.IEnumerator*1Barotrauma*SkillSettings
_G['PrefabSelector*1Barotrauma*SkillSettings'].GetEnumerator = function() end

---`Constructor Public Instance`
---@return Barotrauma.PrefabSelector*1Barotrauma*SkillSettings
_G['PrefabSelector*1Barotrauma*SkillSettings'] = function() end

---`Constructor Public Instance`
---@return Barotrauma.PrefabSelector*1Barotrauma*SkillSettings
_G['PrefabSelector*1Barotrauma*SkillSettings'].__new = function() end

