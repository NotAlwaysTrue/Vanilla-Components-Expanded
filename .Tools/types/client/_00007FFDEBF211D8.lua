---@meta
---@class Barotrauma.RichString : System.Object
---`Field NonPublic Instance`
---@field loaded System.Boolean
---`Field NonPublic Instance`
---@field language Barotrauma.LanguageIdentifier
---`Field Private Instance`
---@field languageVersion System.Int32
---`Field NonPublic Instance`
---@field cachedSanitizedValue System.String
---`Field Private Instance`
---@field postProcess (System.Func*1System*String*1System*String)|(fun(arg:System.String):(System.String))
---`Field Private Instance`
---@field shouldParseRichTextData System.Boolean
---`Field Private Instance`
---@field originalStr Barotrauma.LocalizedString
---`Field Public Instance`
---@field SanitizedString Barotrauma.LocalizedString
---`Field Private Instance`
---@field font Barotrauma.GUIFont
---`Field Private Instance`
---@field componentStyle Barotrauma.GUIComponentStyle
---`Field Private Instance`
---@field forceUpperCase System.Boolean
---`Getter Public Instance`
---@field SanitizedValue System.String
---`Getter Public Instance`
---@field Length System.Int32
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field NestedStr Barotrauma.LocalizedString
---`Getter Public Instance`
---@field Loaded System.Boolean
---`Getter Private Instance`
---@field FontOrStyleForceUpperCase System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field RichTextData System.Nullable*1System*Collections*Immutable*ImmutableArray*2Barotrauma*RichTextData
_G['RichString'] = {}

---`Method Public Static`
---@param str Barotrauma.LocalizedString
---@param postProcess? (System.Func*1System*String*1System*String)|(fun(arg:System.String):(System.String))
---@return Barotrauma.RichString
_G['RichString'].Rich = function(str, postProcess) end

---`Method Public Static`
---@param str Barotrauma.LocalizedString
---@return Barotrauma.RichString
_G['RichString'].Plain = function(str) end

---`Method NonPublic Instance Virtual`
---@return System.Boolean
_G['RichString'].MustRetrieveValue = function() end

---`Method Public Instance`
_G['RichString'].RetrieveValue = function() end

---`Method Public Instance`
---@param font Barotrauma.GUIFont
---@param componentStyle Barotrauma.GUIComponentStyle
---@return Barotrauma.RichString
_G['RichString'].CaseTiedToFontAndStyle = function(font, componentStyle) end

---`Method Public Instance`
---@return Barotrauma.RichString
_G['RichString'].ToUpper = function() end

---`Method Public Instance`
---@return Barotrauma.RichString
_G['RichString'].ToLower = function() end

---`Method Public Instance`
---@param from System.String
---@param to System.String
---@param stringComparison? System.StringComparison
---@return Barotrauma.RichString
_G['RichString'].Replace = function(from, to, stringComparison) end

---`Method Public Instance Virtual`
---@return System.String
_G['RichString'].ToString = function() end

---`Method Public Instance`
---@overload fun(str:System.String, stringComparison?:System.StringComparison):(System.Boolean)
---@param chr System.Char
---@param stringComparison? System.StringComparison
---@return System.Boolean
_G['RichString'].Contains = function(chr, stringComparison) end

---`Constructor Private Instance`
---@overload fun(nestedStr:Barotrauma.LocalizedString, shouldParseRichTextData:System.Boolean, postProcess?:(System.Func*1System*String*1System*String)|(fun(arg:System.String):(System.String)), font?:Barotrauma.GUIFont, componentStyle?:Barotrauma.GUIComponentStyle):Barotrauma.RichString
---@param nestedStr Barotrauma.LocalizedString
---@param shouldParseRichTextData System.Boolean
---@param postProcess? (System.Func*1System*String*1System*String)|(fun(arg:System.String):(System.String))
---@return Barotrauma.RichString
_G['RichString'] = function(nestedStr, shouldParseRichTextData, postProcess) end

---`Constructor Private Instance`
---@overload fun(nestedStr:Barotrauma.LocalizedString, shouldParseRichTextData:System.Boolean, postProcess?:(System.Func*1System*String*1System*String)|(fun(arg:System.String):(System.String)), font?:Barotrauma.GUIFont, componentStyle?:Barotrauma.GUIComponentStyle):Barotrauma.RichString
---@param nestedStr Barotrauma.LocalizedString
---@param shouldParseRichTextData System.Boolean
---@param postProcess? (System.Func*1System*String*1System*String)|(fun(arg:System.String):(System.String))
---@return Barotrauma.RichString
_G['RichString'].__new = function(nestedStr, shouldParseRichTextData, postProcess) end

