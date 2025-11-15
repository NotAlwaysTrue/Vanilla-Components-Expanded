---@meta
---@class Barotrauma.Items.Components.GeneticMaterial : Barotrauma.Items.Components.ItemComponent
---`Field Private Instance`
---@field materialName Barotrauma.LocalizedString
---`Field Private Instance`
---@field targetCharacter Barotrauma.Character
---`Field Private Instance`
---@field selectedEffect Barotrauma.AfflictionPrefab
---`Field Private Instance`
---@field selectedTaintedEffect Barotrauma.AfflictionPrefab
---`Field Private Instance`
---@field tainted System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Effect System.String
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field TaintedEffect Barotrauma.Identifier
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Tainted System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field SetTaintedOnDeath System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field CanBeUntainted System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field SelectedTaintedEffect Barotrauma.Identifier
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field ConditionIncreaseOnCombineMin System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field ConditionIncreaseOnCombineMax System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field ConditionIncreaseOnLowQualityCombine System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field ConditionIncreaseOnHighQualityCombine System.Single
---`Getter Private Instance`
---@field AllMaterialTypes (System.Collections.Generic.IEnumerable*1Barotrauma*ItemPrefab)|(fun():(Barotrauma.ItemPrefab))
---`Getter Private Instance`
---@field NestedMaterial Barotrauma.Items.Components.GeneticMaterial
---`Getter Private Instance`
---@field IsCombined System.Boolean
_G['Components']['GeneticMaterial'] = {}

---`Method Public Instance Virtual`
---@param msg Barotrauma.Networking.IWriteMessage
---@param c Barotrauma.Networking.Client
---@param extraData? Barotrauma.Networking.NetEntityEvent.IData
_G['Components']['GeneticMaterial'].ServerEventWrite = function(msg, c, extraData) end

---`Method Private Instance`
---@param otherGeneticMaterial Barotrauma.Items.Components.GeneticMaterial
---@return System.Boolean
_G['Components']['GeneticMaterial'].SharesTypeWith = function(otherGeneticMaterial) end

---`Method Private Instance`
---@param otherGeneticMaterial Barotrauma.Items.Components.GeneticMaterial
---@return Barotrauma.ItemPrefab
_G['Components']['GeneticMaterial'].GetSharedTypeOrDefault = function(otherGeneticMaterial) end

---`Method Private Instance`
---@param otherGeneticMaterial Barotrauma.Items.Components.GeneticMaterial
---@return Barotrauma.Items.Components.GeneticMaterial.CombineResult
_G['Components']['GeneticMaterial'].GetCombineRefineResult = function(otherGeneticMaterial) end

---`Method Public Instance`
---@param otherGeneticMaterial Barotrauma.Items.Components.GeneticMaterial
---@return System.Boolean
_G['Components']['GeneticMaterial'].CanBeCombinedWith = function(otherGeneticMaterial) end

---`Method Public Instance Virtual`
---@param character Barotrauma.Character
_G['Components']['GeneticMaterial'].Equip = function(character) end

---`Method Public Instance Virtual`
---@param deltaTime System.Single
---@param cam Barotrauma.Camera
_G['Components']['GeneticMaterial'].Update = function(deltaTime, cam) end

---`Method Private Instance`
_G['Components']['GeneticMaterial'].Deactivate = function() end

---`Method Public Instance`
---@param otherGeneticMaterial Barotrauma.Items.Components.GeneticMaterial
---@param user Barotrauma.Character
---@param itemToDestroy Barotrauma.Item-ref
---@return Barotrauma.Items.Components.GeneticMaterial.CombineResult
_G['Components']['GeneticMaterial'].Combine = function(otherGeneticMaterial, user, itemToDestroy) end

---`Method Private Instance`
---@return System.Single
_G['Components']['GeneticMaterial'].GetCombinedEffectStrength = function() end

---`Method Private Instance`
---@return System.Single
_G['Components']['GeneticMaterial'].GetCombinedTaintedEffectStrength = function() end

---`Method Private Instance`
---@param otherGeneticMaterial Barotrauma.Items.Components.GeneticMaterial
---@param user Barotrauma.Character
---@return System.Single
_G['Components']['GeneticMaterial'].GetTaintedProbabilityOnRefine = function(otherGeneticMaterial, user) end

---`Method Private Static`
---@param user Barotrauma.Character
---@return System.Single
_G['Components']['GeneticMaterial'].GetTaintedProbabilityOnCombine = function(user) end

---`Method Public Instance`
---@param newValue System.Boolean
---@param affectsNestedGene? System.Boolean
_G['Components']['GeneticMaterial'].SetTainted = function(newValue, affectsNestedGene) end

---`Method Public Static`
---@param prefab Barotrauma.ItemPrefab
---@param element System.Xml.Linq.XElement
---@return Barotrauma.LocalizedString
_G['Components']['GeneticMaterial'].TryCreateName = function(prefab, element) end

---`Constructor Public Instance`
---@param item Barotrauma.Item
---@param element Barotrauma.ContentXElement
---@return Barotrauma.Items.Components.GeneticMaterial
_G['Components']['GeneticMaterial'] = function(item, element) end

---`Constructor Public Instance`
---@param item Barotrauma.Item
---@param element Barotrauma.ContentXElement
---@return Barotrauma.Items.Components.GeneticMaterial
_G['Components']['GeneticMaterial'].__new = function(item, element) end

