---@meta
---@class Barotrauma.TalentSubTree : System.Object
---`Field Public Instance`
---@field TalentOptionStages (System.Collections.Immutable.ImmutableArray*1Barotrauma*TalentOption)|(Barotrauma.TalentOption[])
---`Field Public Instance`
---@field AllTalentIdentifiers (System.Collections.Immutable.ImmutableHashSet*1Barotrauma*Identifier)|(Barotrauma.Identifier[])
---`Field Public Instance`
---@field Type Barotrauma.TalentTreeType
---`Field Public Instance`
---@field RequiredTrees (System.Collections.Immutable.ImmutableHashSet*1Barotrauma*Identifier)|(Barotrauma.Identifier[])
---`Field Public Instance`
---@field BlockedTrees (System.Collections.Immutable.ImmutableHashSet*1Barotrauma*Identifier)|(Barotrauma.Identifier[])
---`Getter Public Instance`
---@field Identifier Barotrauma.Identifier
---`Getter Public Instance`
---@field DisplayName Barotrauma.LocalizedString
_G['TalentSubTree'] = {}

---`Method Public Instance`
---@param talents (System.Collections.Generic.IReadOnlyCollection*1Barotrauma*Identifier)|(fun():(Barotrauma.Identifier))
---@return System.Boolean
_G['TalentSubTree'].HasEnoughTalents = function(talents) end

---`Method Public Instance`
---@param talents (System.Collections.Generic.IReadOnlyCollection*1Barotrauma*Identifier)|(fun():(Barotrauma.Identifier))
---@return System.Boolean
_G['TalentSubTree'].HasMaxTalents = function(talents) end

---`Method Public Instance`
---@param talents (System.Collections.Generic.IReadOnlyCollection*1Barotrauma*Identifier)|(fun():(Barotrauma.Identifier))
---@return System.Boolean
_G['TalentSubTree'].HasAnyTalent = function(talents) end

---`Constructor Public Instance`
---@param subTreeElement Barotrauma.ContentXElement
---@return Barotrauma.TalentSubTree
_G['TalentSubTree'] = function(subTreeElement) end

---`Constructor Public Instance`
---@param subTreeElement Barotrauma.ContentXElement
---@return Barotrauma.TalentSubTree
_G['TalentSubTree'].__new = function(subTreeElement) end

