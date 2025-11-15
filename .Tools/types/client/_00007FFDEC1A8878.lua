---@meta
---@class Barotrauma.GUIFontPrefab : Barotrauma.GUIPrefab
---`Field Private Instance`
---@field element Barotrauma.ContentXElement
---`Field Private Instance`
---@field font Barotrauma.ScalableFont
---`Field Private Instance`
---@field specialHandlingFonts (System.Collections.Immutable.ImmutableDictionary*1Barotrauma*TextManager*SpeciallyHandledCharCategory*1Barotrauma*ScalableFont)|({[Barotrauma.TextManager.SpeciallyHandledCharCategory]:(Barotrauma.ScalableFont)})
---`Getter Public Instance`
---@field Font Barotrauma.ScalableFont
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field Language Barotrauma.LanguageIdentifier
_G['GUIFontPrefab'] = {}

---`Method Public Instance`
---@param category Barotrauma.TextManager.SpeciallyHandledCharCategory
---@return Barotrauma.ScalableFont
_G['GUIFontPrefab'].GetFontForCategory = function(category) end

---`Method Public Instance`
_G['GUIFontPrefab'].LoadFont = function() end

---`Method Public Instance Virtual`
_G['GUIFontPrefab'].Dispose = function() end

---`Method Private Instance`
---@param flag Barotrauma.TextManager.SpeciallyHandledCharCategory
---@param element Barotrauma.ContentXElement
---@return Barotrauma.ScalableFont
_G['GUIFontPrefab'].ExtractFont = function(flag, element) end

---`Method Private Instance`
---@param element Barotrauma.ContentXElement
---@return System.String
_G['GUIFontPrefab'].GetFontFilePath = function(element) end

---`Method Private Instance`
---@param element System.Xml.Linq.XElement
---@param defaultSize? System.UInt32
---@return System.UInt32
_G['GUIFontPrefab'].GetFontSize = function(element, defaultSize) end

---`Method Private Instance`
---@param element System.Xml.Linq.XElement
---@return System.Boolean
_G['GUIFontPrefab'].GetFontDynamicLoading = function(element) end

---`Method Private Instance`
---@param element System.Xml.Linq.XElement
---@return Barotrauma.TextManager.SpeciallyHandledCharCategory
_G['GUIFontPrefab'].GetShcc = function(element) end

---`Method Private Instance`
---@param element System.Xml.Linq.XElement
---@return System.Boolean
_G['GUIFontPrefab'].IsValidOverride = function(element) end

---`Constructor Public Instance`
---@param element Barotrauma.ContentXElement
---@param file Barotrauma.UIStyleFile
---@return Barotrauma.GUIFontPrefab
_G['GUIFontPrefab'] = function(element, file) end

---`Constructor Public Instance`
---@param element Barotrauma.ContentXElement
---@param file Barotrauma.UIStyleFile
---@return Barotrauma.GUIFontPrefab
_G['GUIFontPrefab'].__new = function(element, file) end

