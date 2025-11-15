---@meta
---@class Barotrauma.WearableSprite : System.Object
---`Field Private Instance`
---@field _sprite Barotrauma.Sprite
---`Field Private Instance`
---@field _wearableComponent Barotrauma.Items.Components.Wearable
---`Field Private Instance`
---@field _lightComponents (System.Collections.Generic.List*1Barotrauma*Items*Components*LightComponent)|(Barotrauma.Items.Components.LightComponent[])
---`Field Private Instance`
---@field _picker Barotrauma.Character
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field UnassignedSpritePath Barotrauma.ContentPath
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field SpritePath System.String
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field SourceElement Barotrauma.ContentXElement
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field Type Barotrauma.WearableType
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field Sprite Barotrauma.Sprite
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field Limb Barotrauma.LimbType
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field HideLimb System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field ObscureOtherWearables Barotrauma.WearableSprite.ObscuringMode
---`Getter Public Instance`
---@field HideOtherWearables System.Boolean
---`Getter Public Instance`
---@field AlphaClipOtherWearables System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field CanBeHiddenByOtherWearables System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field CanBeHiddenByItem (System.Collections.Immutable.ImmutableHashSet*1Barotrauma*Identifier)|(Barotrauma.Identifier[])
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field HideWearablesOfType (System.Collections.Generic.List*1Barotrauma*WearableType)|(Barotrauma.WearableType[])
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field InheritLimbDepth System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field InheritScale System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field IgnoreRagdollScale System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field IgnoreLimbScale System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field IgnoreTextureScale System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field InheritOrigin System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field InheritSourceRect System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field Scale System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field Rotation System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field DepthLimb Barotrauma.LimbType
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field WearableComponent Barotrauma.Items.Components.Wearable
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field Sound System.String
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field SheetIndex System.Nullable*1Microsoft*Xna*Framework*Point
---`Getter Public Instance`
---@field LightComponent Barotrauma.Items.Components.LightComponent
---`Getter Public Instance`
---@field LightComponents (System.Collections.Generic.List*1Barotrauma*Items*Components*LightComponent)|(Barotrauma.Items.Components.LightComponent[])
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Variant System.Int32
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Picker Barotrauma.Character
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field IsInitialized System.Boolean
_G['WearableSprite'] = {}

---`Method Private Instance`
---@param element Barotrauma.ContentXElement
---@return Barotrauma.ContentPath
_G['WearableSprite'].ParseSpritePath = function(element) end

---`Method Public Instance`
---@param parseSpritePath System.Boolean
_G['WearableSprite'].ParsePath = function(parseSpritePath) end

---`Method Public Instance`
---@param picker? Barotrauma.Character
_G['WearableSprite'].Init = function(picker) end

---`Method Public Instance`
_G['WearableSprite'].Remove = function() end

---`Constructor Public Instance`
---@overload fun(subElement:Barotrauma.ContentXElement, type:Barotrauma.WearableType):Barotrauma.WearableSprite
---@param subElement Barotrauma.ContentXElement
---@param wearable Barotrauma.Items.Components.Wearable
---@param variant? System.Int32
---@return Barotrauma.WearableSprite
_G['WearableSprite'] = function(subElement, wearable, variant) end

---`Constructor Public Instance`
---@overload fun(subElement:Barotrauma.ContentXElement, type:Barotrauma.WearableType):Barotrauma.WearableSprite
---@param subElement Barotrauma.ContentXElement
---@param wearable Barotrauma.Items.Components.Wearable
---@param variant? System.Int32
---@return Barotrauma.WearableSprite
_G['WearableSprite'].__new = function(subElement, wearable, variant) end

