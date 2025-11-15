---@meta
---@class Barotrauma.TextPack : System.Object
---`Field Public Instance`
---@field ContentFile Barotrauma.TextFile
---`Field Public Instance`
---@field Language Barotrauma.LanguageIdentifier
---`Field Private Instance`
---@field texts (System.Collections.Immutable.ImmutableDictionary*1Barotrauma*Identifier*1System*Collections*Immutable*ImmutableArray*2Barotrauma*TextPack*Text)|({[Barotrauma.Identifier]:((System.Collections.Immutable.ImmutableArray*1Barotrauma*TextPack*Text)|(Barotrauma.TextPack.Text[]))})
---`Field Public Instance`
---@field TranslatedName System.String
---`Field Public Instance`
---@field NoWhitespace System.Boolean
---`Getter Public Instance`
---@field Texts (System.Collections.Immutable.ImmutableDictionary*1Barotrauma*Identifier*1System*Collections*Immutable*ImmutableArray*2Barotrauma*TextPack*Text)|({[Barotrauma.Identifier]:((System.Collections.Immutable.ImmutableArray*1Barotrauma*TextPack*Text)|(Barotrauma.TextPack.Text[]))})
_G['TextPack'] = {}

---`Method Public Instance`
_G['TextPack'].VerifyLoaded = function() end

---`Method Public Instance`
_G['TextPack'].Unload = function() end

---`Method Public Instance`
---@param index System.Int32
_G['TextPack'].CheckForDuplicates = function(index) end

---`Method Public Instance`
---@param index System.Int32
_G['TextPack'].WriteToCSV = function(index) end

---`Constructor Public Instance`
---@param file Barotrauma.TextFile
---@param mainElement Barotrauma.ContentXElement
---@param language Barotrauma.LanguageIdentifier
---@param load? System.Boolean
---@return Barotrauma.TextPack
_G['TextPack'] = function(file, mainElement, language, load) end

---`Constructor Public Instance`
---@param file Barotrauma.TextFile
---@param mainElement Barotrauma.ContentXElement
---@param language Barotrauma.LanguageIdentifier
---@param load? System.Boolean
---@return Barotrauma.TextPack
_G['TextPack'].__new = function(file, mainElement, language, load) end

