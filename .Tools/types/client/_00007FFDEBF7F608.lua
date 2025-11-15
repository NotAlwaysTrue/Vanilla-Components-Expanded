---@meta
---@class Barotrauma.TalentOption : System.ValueType
---`Field Private Instance`
---@field talentIdentifiers (System.Collections.Immutable.ImmutableHashSet*1Barotrauma*Identifier)|(Barotrauma.Identifier[])
---`Field Public Instance`
---@field RequiredTalents System.Int32
---`Field Public Instance`
---@field MaxChosenTalents System.Int32
---`Field Public Instance`
---@field ShowCaseTalents (System.Collections.Generic.Dictionary*1Barotrauma*Identifier*1System*Collections*Immutable*ImmutableHashSet*2Barotrauma*Identifier)|({[Barotrauma.Identifier]:((System.Collections.Immutable.ImmutableHashSet*1Barotrauma*Identifier)|(Barotrauma.Identifier[]))})
---`Getter Public Instance`
---@field TalentIdentifiers (System.Collections.Generic.IEnumerable*1Barotrauma*Identifier)|(fun():(Barotrauma.Identifier))
_G['TalentOption'] = {}

---`Method Public Instance`
---@overload fun(character:Barotrauma.CharacterInfo):(System.Boolean)
---@param selectedTalents (System.Collections.Generic.IReadOnlyCollection*1Barotrauma*Identifier)|(fun():(Barotrauma.Identifier))
---@return System.Boolean
_G['TalentOption'].HasEnoughTalents = function(selectedTalents) end

---`Method Public Instance`
---@param selectedTalents (System.Collections.Generic.IReadOnlyCollection*1Barotrauma*Identifier)|(fun():(Barotrauma.Identifier))
---@return System.Boolean
_G['TalentOption'].HasMaxTalents = function(selectedTalents) end

---`Method Public Instance`
---@param selectedTalents (System.Collections.Generic.IReadOnlyCollection*1Barotrauma*Identifier)|(fun():(Barotrauma.Identifier))
---@return System.Boolean
_G['TalentOption'].HasSelectedTalent = function(selectedTalents) end

---`Method Public Instance`
---@param talents (System.Collections.Generic.IReadOnlyCollection*1Barotrauma*Identifier)|(fun():(Barotrauma.Identifier))
---@return System.Int32
_G['TalentOption'].CountMatchingTalents = function(talents) end

---`Constructor Public Instance`
---@param talentOptionsElement Barotrauma.ContentXElement
---@param debugIdentifier Barotrauma.Identifier
---@return Barotrauma.TalentOption
_G['TalentOption'] = function(talentOptionsElement, debugIdentifier) end

---`Constructor Public Instance`
---@param talentOptionsElement Barotrauma.ContentXElement
---@param debugIdentifier Barotrauma.Identifier
---@return Barotrauma.TalentOption
_G['TalentOption'].__new = function(talentOptionsElement, debugIdentifier) end

