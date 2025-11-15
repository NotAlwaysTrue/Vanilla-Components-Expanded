---@meta
---@class Barotrauma.RichTextData : System.Object
---`Field Public Instance`
---@field StartIndex System.Int32
---`Field Public Instance`
---@field EndIndex System.Int32
---`Field Public Instance`
---@field Color System.Nullable*1Microsoft*Xna*Framework*Color
---`Field Public Instance`
---@field Metadata System.String
---`Field Public Instance`
---@field Alpha System.Single
---`Field Private Static`
---@field definitionIndicator System.Char
---`Field Private Static`
---@field attributeSeparator System.Char
---`Field Private Static`
---@field keyValueSeparator System.Char
---`Field Private Static`
---@field colorDefinition System.String
---`Field Private Static`
---@field metadataDefinition System.String
---`Field Private Static`
---@field endDefinition System.String
_G['RichTextData'] = {}

---`Method Public Static`
---@param text System.String
---@param sanitizedText System.String-ref
---@return System.Nullable*1System*Collections*Immutable*ImmutableArray*2Barotrauma*RichTextData
_G['RichTextData'].GetRichTextData = function(text, sanitizedText) end

---`Constructor Public Instance`
---@return Barotrauma.RichTextData
_G['RichTextData'] = function() end

---`Constructor Public Instance`
---@return Barotrauma.RichTextData
_G['RichTextData'].__new = function() end

