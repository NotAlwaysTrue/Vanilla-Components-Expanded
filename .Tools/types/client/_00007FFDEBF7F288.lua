---@meta
---@class Barotrauma.TalentTree : Barotrauma.Prefab
---`Field Public Instance`
---@field TalentSubTrees (System.Collections.Immutable.ImmutableArray*1Barotrauma*TalentSubTree)|(Barotrauma.TalentSubTree[])
---`Field Public Instance`
---@field AllTalentIdentifiers (System.Collections.Immutable.ImmutableHashSet*1Barotrauma*Identifier)|(Barotrauma.Identifier[])
---`Field Public Static`
---@field JobTalentTrees (Barotrauma.PrefabCollection*1Barotrauma*TalentTree)|(fun():(Barotrauma.TalentTree))
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field ConfigElement Barotrauma.ContentXElement
_G['TalentTree'] = {}

---`Method Public Instance`
---@param talentIdentifier Barotrauma.Identifier
---@return System.Boolean
_G['TalentTree'].TalentIsInTree = function(talentIdentifier) end

---`Method Public Static`
---@overload fun(character:Barotrauma.Character, talentIdentifier:Barotrauma.Identifier):(System.Boolean)
---@param character Barotrauma.Character
---@param talentIdentifier Barotrauma.Identifier
---@param selectedTalents (System.Collections.Generic.IReadOnlyCollection*1Barotrauma*Identifier)|(fun():(Barotrauma.Identifier))
---@return System.Boolean
_G['TalentTree'].IsViableTalentForCharacter = function(character, talentIdentifier, selectedTalents) end

---`Method Public Static`
---@param tree Barotrauma.TalentTree
---@param targetTree Barotrauma.TalentSubTree
---@param selectedTalents (System.Collections.Generic.IReadOnlyCollection*1Barotrauma*Identifier)|(fun():(Barotrauma.Identifier))
---@return System.Boolean
_G['TalentTree'].TalentTreeMeetsRequirements = function(tree, targetTree, selectedTalents) end

---`Method Public Static`
---@param character Barotrauma.Character
---@param subTreeIdentifier Barotrauma.Identifier
---@param index System.Int32
---@param selectedTalents (System.Collections.Generic.IReadOnlyCollection*1Barotrauma*Identifier)|(fun():(Barotrauma.Identifier))
---@return Barotrauma.TalentTree.TalentStages
_G['TalentTree'].GetTalentOptionStageState = function(character, subTreeIdentifier, index, selectedTalents) end

---`Method Public Static`
---@param talentIdentifier Barotrauma.Identifier
---@param characterList (System.Collections.Generic.IEnumerable*1Barotrauma*Character)|(fun():(Barotrauma.Character))
---@return System.Boolean
_G['TalentTree'].IsTalentLocked = function(talentIdentifier, characterList) end

---`Method Public Static`
---@param controlledCharacter Barotrauma.Character
---@param selectedTalents (System.Collections.Generic.IEnumerable*1Barotrauma*Identifier)|(fun():(Barotrauma.Identifier))
---@return (System.Collections.Generic.List*1Barotrauma*Identifier)|(Barotrauma.Identifier[])
_G['TalentTree'].CheckTalentSelection = function(controlledCharacter, selectedTalents) end

---`Method Public Instance Virtual`
_G['TalentTree'].Dispose = function() end

---`Constructor Public Instance`
---@overload fun(element:Barotrauma.ContentXElement, file:Barotrauma.TalentTreesFile):Barotrauma.TalentTree
---@return Barotrauma.TalentTree
_G['TalentTree'] = function() end

---`Constructor Public Instance`
---@overload fun(element:Barotrauma.ContentXElement, file:Barotrauma.TalentTreesFile):Barotrauma.TalentTree
---@return Barotrauma.TalentTree
_G['TalentTree'].__new = function() end

---`Constructor Private Static`
---@overload fun(element:Barotrauma.ContentXElement, file:Barotrauma.TalentTreesFile):Barotrauma.TalentTree
---@return Barotrauma.TalentTree
_G['TalentTree'] = function() end

---`Constructor Private Static`
---@overload fun(element:Barotrauma.ContentXElement, file:Barotrauma.TalentTreesFile):Barotrauma.TalentTree
---@return Barotrauma.TalentTree
_G['TalentTree'].__new = function() end

