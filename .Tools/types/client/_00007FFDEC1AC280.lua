---@meta
---@class Barotrauma.GUIImage : Barotrauma.GUIComponent
---`Field Public Instance`
---@field Rotation System.Single
---`Field Private Instance`
---@field sprite Barotrauma.Sprite
---`Field Private Instance`
---@field sourceRect Microsoft.Xna.Framework.Rectangle
---`Field Private Instance`
---@field crop System.Boolean
---`Field Private Instance`
---@field scaleToFit Barotrauma.GUIImage.ScalingMode
---`Field Private Instance`
---@field lazyLoaded System.Boolean
---`Field Private Instance`
---@field loading System.Boolean
---`Field Public Instance`
---@field LoadAsynchronously System.Boolean
---`Field Private Instance`
---@field origin Microsoft.Xna.Framework.Vector2
---`Field Public Instance`
---@field BlendState Microsoft.Xna.Framework.Graphics.BlendState
---`Field Public Instance`
---@field OverrideState System.Nullable*1Barotrauma*GUIComponent*ComponentState
---`Field Private Static`
---@field activeTextureLoads (System.Collections.Generic.List*1System*String)|(System.String[])
---`Field Private Static`
---@field loadingTextures System.Boolean
---`Getter Public Static`
---@field LoadingTextures System.Boolean
---`Getter Public Instance`
---@field Crop System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Scale System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field SourceRect Microsoft.Xna.Framework.Rectangle
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Sprite Barotrauma.Sprite
_G['GUI']['Image'] = {}

---`Method Public Instance`
---@param state System.Boolean
---@param center? System.Boolean
_G['GUI']['Image'].SetCrop = function(state, center) end

---`Method NonPublic Instance Virtual`
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
_G['GUI']['Image'].Draw = function(spriteBatch) end

---`Method Private Instance`
_G['GUI']['Image'].RecalculateScale = function() end

---`Method Private Instance`
---@return System.Threading.Tasks.Task*1System*Boolean
_G['GUI']['Image'].LoadTextureAsync = function() end

---`Constructor Public Instance`
---@overload fun(rectT:Barotrauma.RectTransform, style:System.String, scaleToFit:System.Boolean):Barotrauma.GUIImage
---@overload fun(rectT:Barotrauma.RectTransform, style:System.String, scaleToFit?:Barotrauma.GUIImage.ScalingMode):Barotrauma.GUIImage
---@overload fun(rectT:Barotrauma.RectTransform, sprite:Barotrauma.Sprite, scaleToFit:System.Boolean, sourceRect?:System.Nullable*1Microsoft*Xna*Framework*Rectangle):Barotrauma.GUIImage
---@overload fun(rectT:Barotrauma.RectTransform, sprite:Barotrauma.Sprite, sourceRect?:System.Nullable*1Microsoft*Xna*Framework*Rectangle, scaleToFit?:Barotrauma.GUIImage.ScalingMode):Barotrauma.GUIImage
---@overload fun(rectT:Barotrauma.RectTransform, sprite:Barotrauma.Sprite, sourceRect:System.Nullable*1Microsoft*Xna*Framework*Rectangle, scaleToFit:Barotrauma.GUIImage.ScalingMode, style:System.String):Barotrauma.GUIImage
---@return Barotrauma.GUIImage
_G['GUI']['Image'] = function() end

---`Constructor Public Instance`
---@overload fun(rectT:Barotrauma.RectTransform, style:System.String, scaleToFit:System.Boolean):Barotrauma.GUIImage
---@overload fun(rectT:Barotrauma.RectTransform, style:System.String, scaleToFit?:Barotrauma.GUIImage.ScalingMode):Barotrauma.GUIImage
---@overload fun(rectT:Barotrauma.RectTransform, sprite:Barotrauma.Sprite, scaleToFit:System.Boolean, sourceRect?:System.Nullable*1Microsoft*Xna*Framework*Rectangle):Barotrauma.GUIImage
---@overload fun(rectT:Barotrauma.RectTransform, sprite:Barotrauma.Sprite, sourceRect?:System.Nullable*1Microsoft*Xna*Framework*Rectangle, scaleToFit?:Barotrauma.GUIImage.ScalingMode):Barotrauma.GUIImage
---@overload fun(rectT:Barotrauma.RectTransform, sprite:Barotrauma.Sprite, sourceRect:System.Nullable*1Microsoft*Xna*Framework*Rectangle, scaleToFit:Barotrauma.GUIImage.ScalingMode, style:System.String):Barotrauma.GUIImage
---@return Barotrauma.GUIImage
_G['GUI']['Image'].__new = function() end

---`Constructor Private Instance`
---@overload fun(rectT:Barotrauma.RectTransform, style:System.String, scaleToFit:System.Boolean):Barotrauma.GUIImage
---@overload fun(rectT:Barotrauma.RectTransform, style:System.String, scaleToFit?:Barotrauma.GUIImage.ScalingMode):Barotrauma.GUIImage
---@overload fun(rectT:Barotrauma.RectTransform, sprite:Barotrauma.Sprite, scaleToFit:System.Boolean, sourceRect?:System.Nullable*1Microsoft*Xna*Framework*Rectangle):Barotrauma.GUIImage
---@overload fun(rectT:Barotrauma.RectTransform, sprite:Barotrauma.Sprite, sourceRect?:System.Nullable*1Microsoft*Xna*Framework*Rectangle, scaleToFit?:Barotrauma.GUIImage.ScalingMode):Barotrauma.GUIImage
---@overload fun(rectT:Barotrauma.RectTransform, sprite:Barotrauma.Sprite, sourceRect:System.Nullable*1Microsoft*Xna*Framework*Rectangle, scaleToFit:Barotrauma.GUIImage.ScalingMode, style:System.String):Barotrauma.GUIImage
---@return Barotrauma.GUIImage
_G['GUI']['Image'] = function() end

---`Constructor Private Instance`
---@overload fun(rectT:Barotrauma.RectTransform, style:System.String, scaleToFit:System.Boolean):Barotrauma.GUIImage
---@overload fun(rectT:Barotrauma.RectTransform, style:System.String, scaleToFit?:Barotrauma.GUIImage.ScalingMode):Barotrauma.GUIImage
---@overload fun(rectT:Barotrauma.RectTransform, sprite:Barotrauma.Sprite, scaleToFit:System.Boolean, sourceRect?:System.Nullable*1Microsoft*Xna*Framework*Rectangle):Barotrauma.GUIImage
---@overload fun(rectT:Barotrauma.RectTransform, sprite:Barotrauma.Sprite, sourceRect?:System.Nullable*1Microsoft*Xna*Framework*Rectangle, scaleToFit?:Barotrauma.GUIImage.ScalingMode):Barotrauma.GUIImage
---@overload fun(rectT:Barotrauma.RectTransform, sprite:Barotrauma.Sprite, sourceRect:System.Nullable*1Microsoft*Xna*Framework*Rectangle, scaleToFit:Barotrauma.GUIImage.ScalingMode, style:System.String):Barotrauma.GUIImage
---@return Barotrauma.GUIImage
_G['GUI']['Image'].__new = function() end

---`Constructor Private Static`
---@overload fun(rectT:Barotrauma.RectTransform, style:System.String, scaleToFit:System.Boolean):Barotrauma.GUIImage
---@overload fun(rectT:Barotrauma.RectTransform, style:System.String, scaleToFit?:Barotrauma.GUIImage.ScalingMode):Barotrauma.GUIImage
---@overload fun(rectT:Barotrauma.RectTransform, sprite:Barotrauma.Sprite, scaleToFit:System.Boolean, sourceRect?:System.Nullable*1Microsoft*Xna*Framework*Rectangle):Barotrauma.GUIImage
---@overload fun(rectT:Barotrauma.RectTransform, sprite:Barotrauma.Sprite, sourceRect?:System.Nullable*1Microsoft*Xna*Framework*Rectangle, scaleToFit?:Barotrauma.GUIImage.ScalingMode):Barotrauma.GUIImage
---@overload fun(rectT:Barotrauma.RectTransform, sprite:Barotrauma.Sprite, sourceRect:System.Nullable*1Microsoft*Xna*Framework*Rectangle, scaleToFit:Barotrauma.GUIImage.ScalingMode, style:System.String):Barotrauma.GUIImage
---@return Barotrauma.GUIImage
_G['GUI']['Image'] = function() end

---`Constructor Private Static`
---@overload fun(rectT:Barotrauma.RectTransform, style:System.String, scaleToFit:System.Boolean):Barotrauma.GUIImage
---@overload fun(rectT:Barotrauma.RectTransform, style:System.String, scaleToFit?:Barotrauma.GUIImage.ScalingMode):Barotrauma.GUIImage
---@overload fun(rectT:Barotrauma.RectTransform, sprite:Barotrauma.Sprite, scaleToFit:System.Boolean, sourceRect?:System.Nullable*1Microsoft*Xna*Framework*Rectangle):Barotrauma.GUIImage
---@overload fun(rectT:Barotrauma.RectTransform, sprite:Barotrauma.Sprite, sourceRect?:System.Nullable*1Microsoft*Xna*Framework*Rectangle, scaleToFit?:Barotrauma.GUIImage.ScalingMode):Barotrauma.GUIImage
---@overload fun(rectT:Barotrauma.RectTransform, sprite:Barotrauma.Sprite, sourceRect:System.Nullable*1Microsoft*Xna*Framework*Rectangle, scaleToFit:Barotrauma.GUIImage.ScalingMode, style:System.String):Barotrauma.GUIImage
---@return Barotrauma.GUIImage
_G['GUI']['Image'].__new = function() end

