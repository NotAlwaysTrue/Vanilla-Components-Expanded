---@meta
---@class Barotrauma.Sprite : System.Object
---`Field Private Instance`
---@field sourceRect Microsoft.Xna.Framework.Rectangle
---`Field NonPublic Instance`
---@field offset Microsoft.Xna.Framework.Vector2
---`Field NonPublic Instance`
---@field origin Microsoft.Xna.Framework.Vector2
---`Field Public Instance`
---@field size Microsoft.Xna.Framework.Vector2
---`Field Public Instance`
---@field rotation System.Single
---`Field NonPublic Instance`
---@field depth System.Single
---`Field Private Instance`
---@field _relativeOrigin Microsoft.Xna.Framework.Vector2
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field SourceElement Barotrauma.ContentXElement
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field LazyLoad System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field SourceRect Microsoft.Xna.Framework.Rectangle
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Depth System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Origin Microsoft.Xna.Framework.Vector2
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field RelativeOrigin Microsoft.Xna.Framework.Vector2
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field RelativeSize Microsoft.Xna.Framework.Vector2
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field FilePath Barotrauma.ContentPath
---`Getter Public Instance`
---@field FullPath System.String
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field Compress System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field EntityIdentifier Barotrauma.Identifier
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Name System.String
_G['Sprite'] = {}

---`Method Public Instance Virtual`
---@return System.String
_G['Sprite'].ToString = function() end

---`Method NonPublic Instance`
---@param spriteParams Barotrauma.RagdollParams.SpriteParams
---@param isFlipped System.Boolean
_G['Sprite'].LoadParams = function(spriteParams, isFlipped) end

---`Method Private Instance`
---@param newFile System.String
---@param sourceRectangle? System.Nullable*1Microsoft*Xna*Framework*Rectangle
---@param newOrigin? System.Nullable*1Microsoft*Xna*Framework*Vector2
---@param newOffset? System.Nullable*1Microsoft*Xna*Framework*Vector2
---@param newRotation? System.Single
_G['Sprite'].Init = function(newFile, sourceRectangle, newOrigin, newOffset, newRotation) end

---`Method Public Static`
---@param sourceElement System.Xml.Linq.XElement
---@return Barotrauma.Identifier
_G['Sprite'].GetIdentifier = function(sourceElement) end

---`Method Public Instance`
_G['Sprite'].Remove = function() end

---`Method NonPublic Instance Virtual`
_G['Sprite'].Finalize = function() end

---`Method Public Instance`
_G['Sprite'].ReloadXML = function() end

---`Method Public Instance`
---@param path? System.String
---@param file? System.String
---@return System.Boolean
_G['Sprite'].ParseTexturePath = function(path, file) end

---`Method Private Instance`
---@return System.Xml.Linq.XElement
_G['Sprite'].GetLocalizationOverrideElement = function() end

---`Constructor Public Instance`
---@overload fun(element:Barotrauma.ContentXElement, path?:System.String, file?:System.String, lazyLoad?:System.Boolean, sourceRectScale?:System.Single):Barotrauma.Sprite
---@overload fun(newFile:System.String, newOrigin:Microsoft.Xna.Framework.Vector2):Barotrauma.Sprite
---@param newFile System.String
---@param sourceRectangle System.Nullable*1Microsoft*Xna*Framework*Rectangle
---@param origin? System.Nullable*1Microsoft*Xna*Framework*Vector2
---@param rotation? System.Single
---@return Barotrauma.Sprite
_G['Sprite'] = function(newFile, sourceRectangle, origin, rotation) end

---`Constructor Public Instance`
---@overload fun(element:Barotrauma.ContentXElement, path?:System.String, file?:System.String, lazyLoad?:System.Boolean, sourceRectScale?:System.Single):Barotrauma.Sprite
---@overload fun(newFile:System.String, newOrigin:Microsoft.Xna.Framework.Vector2):Barotrauma.Sprite
---@param newFile System.String
---@param sourceRectangle System.Nullable*1Microsoft*Xna*Framework*Rectangle
---@param origin? System.Nullable*1Microsoft*Xna*Framework*Vector2
---@param rotation? System.Single
---@return Barotrauma.Sprite
_G['Sprite'].__new = function(newFile, sourceRectangle, origin, rotation) end

