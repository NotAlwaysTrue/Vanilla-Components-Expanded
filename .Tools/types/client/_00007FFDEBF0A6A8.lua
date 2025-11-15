---@meta
---@class Barotrauma.GUIComponent : System.Object
---`Field Public Instance`
---@field HoverCursor Barotrauma.CursorState
---`Field Public Instance`
---@field AlwaysOverrideCursor System.Boolean
---`Field Public Instance`
---@field OnSecondaryClicked (Barotrauma.GUIComponent.SecondaryButtonDownHandler)|(fun(component:Barotrauma.GUIComponent, userData:System.Object):(System.Boolean))
---`Field Private Instance`
---@field bounceTimer System.Single
---`Field Private Instance`
---@field bounceJump System.Single
---`Field Private Instance`
---@field bounceDown System.Boolean
---`Field Public Instance`
---@field OnAddedToGUIUpdateList (System.Action*1Barotrauma*GUIComponent)|(fun(obj:Barotrauma.GUIComponent))
---`Field Public Instance`
---@field OnDrawToolTip (System.Action*1Barotrauma*GUIComponent)|(fun(obj:Barotrauma.GUIComponent))
---`Field NonPublic Instance`
---@field alignment Barotrauma.Alignment
---`Field NonPublic Instance`
---@field styleHierarchy (Barotrauma.Identifier-arr)|(Barotrauma.Identifier[])
---`Field Public Instance`
---@field CanBeFocused System.Boolean
---`Field NonPublic Instance`
---@field color Microsoft.Xna.Framework.Color
---`Field NonPublic Instance`
---@field hoverColor Microsoft.Xna.Framework.Color
---`Field NonPublic Instance`
---@field selectedColor Microsoft.Xna.Framework.Color
---`Field NonPublic Instance`
---@field disabledColor Microsoft.Xna.Framework.Color
---`Field NonPublic Instance`
---@field pressedColor Microsoft.Xna.Framework.Color
---`Field Private Instance`
---@field pulsateCoroutine Barotrauma.CoroutineHandle
---`Field NonPublic Instance`
---@field flashColor Microsoft.Xna.Framework.Color
---`Field NonPublic Instance`
---@field flashDuration System.Single
---`Field Private Instance`
---@field useRectangleFlash System.Boolean
---`Field Private Instance`
---@field useCircularFlash System.Boolean
---`Field NonPublic Instance`
---@field flashTimer System.Single
---`Field Private Instance`
---@field flashRectInflate Microsoft.Xna.Framework.Vector2
---`Field Private Instance`
---@field ignoreLayoutGroups System.Boolean
---`Field Private Instance`
---@field toolTip Barotrauma.RichString
---`Field NonPublic Instance`
---@field enabled System.Boolean
---`Field Public Instance`
---@field sprites (System.Collections.Generic.Dictionary*1Barotrauma*GUIComponent*ComponentState*1System*Collections*Generic*List*2Barotrauma*UISprite)|({[Barotrauma.GUIComponent.ComponentState]:((System.Collections.Generic.List*1Barotrauma*UISprite)|(Barotrauma.UISprite[]))})
---`Field Public Instance`
---@field SpriteEffects Microsoft.Xna.Framework.Graphics.SpriteEffects
---`Field NonPublic Instance`
---@field _state Barotrauma.GUIComponent.ComponentState
---`Field NonPublic Instance`
---@field _previousState Barotrauma.GUIComponent.ComponentState
---`Field NonPublic Instance`
---@field isSelected System.Boolean
---`Field Public Instance`
---@field UserData System.Object
---`Field Private Instance`
---@field spriteFadeTimer System.Single
---`Field Private Instance`
---@field colorFadeTimer System.Single
---`Field Public Instance`
---@field ExternalHighlight System.Boolean
---`Field Private Instance`
---@field rectTransform Barotrauma.RectTransform
---`Field NonPublic Instance`
---@field _currentColor Microsoft.Xna.Framework.Color
---`Field Private Static`
---@field toolTipBlock Barotrauma.GUITextBlock
---`Field Public Static`
---@field OpenAccordionPopups (System.Collections.Generic.List*1Barotrauma*GUIComponent)|(Barotrauma.GUIComponent[])
---`Getter Public Instance`
---@field Parent Barotrauma.GUIComponent
---`Getter Public Instance`
---@field Children (System.Collections.Generic.IEnumerable*1Barotrauma*GUIComponent)|(fun():(Barotrauma.GUIComponent))
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field AutoUpdate System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field AutoDraw System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field UpdateOrder System.Int32
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Bounce System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field GlowOnSelect System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field UVOffset Microsoft.Xna.Framework.Vector2
---`Getter Public Instance Virtual`
---@field FlashTimer System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field IgnoreLayoutGroups System.Boolean
---`Getter Public Instance Virtual`
---<br/>`Setter Public Instance Virtual`
---@field Font Barotrauma.GUIFont
---`Getter Public Instance Virtual`
---<br/>`Setter Public Instance Virtual`
---@field ToolTip Barotrauma.RichString
---`Getter Public Instance`
---@field Style Barotrauma.GUIComponentStyle
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Visible System.Boolean
---`Getter Public Instance Virtual`
---<br/>`Setter Public Instance Virtual`
---@field Enabled System.Boolean
---`Getter Public Instance`
---@field Center Microsoft.Xna.Framework.Vector2
---`Getter Public Instance Virtual`
---@field Rect Microsoft.Xna.Framework.Rectangle
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field ClampMouseRectToParent System.Boolean
---`Getter Public Instance Virtual`
---@field MouseRect Microsoft.Xna.Framework.Rectangle
---`Getter Public Instance Virtual`
---<br/>`Setter Public Instance Virtual`
---@field OutlineColor Microsoft.Xna.Framework.Color
---`Getter Public Instance Virtual`
---<br/>`Setter Public Instance Virtual`
---@field Selected System.Boolean
---`Getter Public Instance Virtual`
---<br/>`Setter Public Instance Virtual`
---@field State Barotrauma.GUIComponent.ComponentState
---`Getter Public Instance`
---@field CountChildren System.Int32
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field DefaultColor Microsoft.Xna.Framework.Color
---`Getter Public Instance Virtual`
---<br/>`Setter Public Instance Virtual`
---@field Color Microsoft.Xna.Framework.Color
---`Getter Public Instance Virtual`
---<br/>`Setter Public Instance Virtual`
---@field HoverColor Microsoft.Xna.Framework.Color
---`Getter Public Instance Virtual`
---<br/>`Setter Public Instance Virtual`
---@field SelectedColor Microsoft.Xna.Framework.Color
---`Getter Public Instance Virtual`
---<br/>`Setter Public Instance Virtual`
---@field DisabledColor Microsoft.Xna.Framework.Color
---`Getter Public Instance Virtual`
---<br/>`Setter Public Instance Virtual`
---@field PressedColor Microsoft.Xna.Framework.Color
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field ColorTransition Barotrauma.TransitionMode
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field FallBackState Barotrauma.SpriteFallBackState
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field SpriteCrossFadeTime System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field ColorCrossFadeTime System.Single
---`Getter Public Instance Virtual`
---<br/>`Setter Public Instance Virtual`
---@field PlaySoundOnSelect System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field RectTransform Barotrauma.RectTransform
_G['GUI']['Component'] = {}

---`Method Public Instance`
---@overload fun():(Barotrauma.GUIComponent.T)
---@param index System.Int32
---@return Barotrauma.GUIComponent
_G['GUI']['Component'].GetChild = function(index) end

---`Method Public Instance`
---@return Barotrauma.GUIComponent.T
_G['GUI']['Component'].GetAnyChild = function() end

---`Method Public Instance`
---@overload fun():((System.Collections.Generic.IEnumerable*1Barotrauma*GUIComponent*T)|(fun():(Barotrauma.GUIComponent.T)))
---@return (System.Collections.Generic.IEnumerable*1Barotrauma*GUIComponent)|(fun():(Barotrauma.GUIComponent))
_G['GUI']['Component'].GetAllChildren = function() end

---`Method Public Instance`
---@param child Barotrauma.GUIComponent
---@return System.Int32
_G['GUI']['Component'].GetChildIndex = function(child) end

---`Method Public Instance`
---@param obj System.Object
---@return Barotrauma.GUIComponent
_G['GUI']['Component'].GetChildByUserData = function(obj) end

---`Method Public Instance`
---@param component Barotrauma.GUIComponent
---@param recursive? System.Boolean
---@return System.Boolean
_G['GUI']['Component'].IsParentOf = function(component, recursive) end

---`Method Public Instance`
---@param component Barotrauma.GUIComponent
---@param recursive? System.Boolean
---@return System.Boolean
_G['GUI']['Component'].IsChildOf = function(component, recursive) end

---`Method Public Instance Virtual`
---@param child Barotrauma.GUIComponent
_G['GUI']['Component'].RemoveChild = function(child) end

---`Method Public Instance`
---@overload fun(predicate:(System.Func*1Barotrauma*GUIComponent*1System*Boolean)|(fun(arg:Barotrauma.GUIComponent):(System.Boolean)), recursive?:System.Boolean):(Barotrauma.GUIComponent)
---@param userData System.Object
---@param recursive? System.Boolean
---@return Barotrauma.GUIComponent
_G['GUI']['Component'].FindChild = function(userData, recursive) end

---`Method Public Instance`
---@overload fun(userData:System.Object):((System.Collections.Generic.IEnumerable*1Barotrauma*GUIComponent)|(fun():(Barotrauma.GUIComponent)))
---@param predicate (System.Func*1Barotrauma*GUIComponent*1System*Boolean)|(fun(arg:Barotrauma.GUIComponent):(System.Boolean))
---@return (System.Collections.Generic.IEnumerable*1Barotrauma*GUIComponent)|(fun():(Barotrauma.GUIComponent))
_G['GUI']['Component'].FindChildren = function(predicate) end

---`Method Public Instance Virtual`
_G['GUI']['Component'].ClearChildren = function() end

---`Method Public Instance`
_G['GUI']['Component'].SetAsFirstChild = function() end

---`Method Public Instance`
_G['GUI']['Component'].SetAsLastChild = function() end

---`Method Public Instance`
---@param clampArea Microsoft.Xna.Framework.Rectangle
_G['GUI']['Component'].ClampToArea = function(clampArea) end

---`Method NonPublic Instance`
---@param r Microsoft.Xna.Framework.Rectangle
---@return Microsoft.Xna.Framework.Rectangle
_G['GUI']['Component'].ClampRect = function(r) end

---`Method Public Instance Virtual`
---@param ignoreChildren? System.Boolean
---@param order? System.Int32
_G['GUI']['Component'].AddToGUIUpdateList = function(ignoreChildren, order) end

---`Method Public Instance`
---@param alsoChildren? System.Boolean
_G['GUI']['Component'].RemoveFromGUIUpdateList = function(alsoChildren) end

---`Method Public Instance`
---@param deltaTime System.Single
_G['GUI']['Component'].UpdateAuto = function(deltaTime) end

---`Method Public Instance`
---@param deltaTime System.Single
---@param alsoChildren? System.Boolean
---@param recursive? System.Boolean
_G['GUI']['Component'].UpdateManually = function(deltaTime, alsoChildren, recursive) end

---`Method NonPublic Instance Virtual`
---@param deltaTime System.Single
_G['GUI']['Component'].Update = function(deltaTime) end

---`Method Public Instance Virtual`
_G['GUI']['Component'].ForceLayoutRecalculation = function() end

---`Method Public Instance`
_G['GUI']['Component'].ForceUpdate = function() end

---`Method Public Instance`
---@param deltaTime System.Single
---@param recursive System.Boolean
_G['GUI']['Component'].UpdateChildren = function(deltaTime, recursive) end

---`Method Public Instance`
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
_G['GUI']['Component'].DrawAuto = function(spriteBatch) end

---`Method Public Instance Virtual`
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
---@param alsoChildren? System.Boolean
---@param recursive? System.Boolean
_G['GUI']['Component'].DrawManually = function(spriteBatch, alsoChildren, recursive) end

---`Method Public Instance Virtual`
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
---@param recursive System.Boolean
_G['GUI']['Component'].DrawChildren = function(spriteBatch, recursive) end

---`Method NonPublic Instance Virtual`
---@param state Barotrauma.GUIComponent.ComponentState
---@return Microsoft.Xna.Framework.Color
_G['GUI']['Component'].GetColor = function(state) end

---`Method NonPublic Instance`
---@param targetColor Microsoft.Xna.Framework.Color
---@param blendedColor Microsoft.Xna.Framework.Color-ref
---@return Microsoft.Xna.Framework.Color
_G['GUI']['Component'].GetBlendedColor = function(targetColor, blendedColor) end

---`Method NonPublic Instance Virtual`
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
_G['GUI']['Component'].Draw = function(spriteBatch) end

---`Method Public Instance`
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
_G['GUI']['Component'].DrawToolTip = function(spriteBatch) end

---`Method Public Static`
---@overload fun(spriteBatch:Microsoft.Xna.Framework.Graphics.SpriteBatch, toolTip:Barotrauma.RichString, pos:Microsoft.Xna.Framework.Vector2, textColor?:System.Nullable*1Microsoft*Xna*Framework*Color, backgroundColor?:System.Nullable*1Microsoft*Xna*Framework*Color)
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
---@param toolTip Barotrauma.RichString
---@param targetElement Microsoft.Xna.Framework.Rectangle
---@param anchor? Barotrauma.Anchor
---@param pivot? Barotrauma.Pivot
_G['GUI']['Component'].DrawToolTip = function(spriteBatch, toolTip, targetElement, anchor, pivot) end

---`Method NonPublic Instance Virtual`
---@param a System.Single
_G['GUI']['Component'].SetAlpha = function(a) end

---`Method Public Instance Virtual`
---@param color? System.Nullable*1Microsoft*Xna*Framework*Color
---@param flashDuration? System.Single
---@param useRectangleFlash? System.Boolean
---@param useCircularFlash? System.Boolean
---@param flashRectInflate? System.Nullable*1Microsoft*Xna*Framework*Vector2
_G['GUI']['Component'].Flash = function(color, flashDuration, useRectangleFlash, useCircularFlash, flashRectInflate) end

---`Method Public Instance`
---@param color? System.Nullable*1Microsoft*Xna*Framework*Color
_G['GUI']['Component'].ImmediateFlash = function(color) end

---`Method Public Instance`
---@param duration System.Single
---@param removeAfter System.Boolean
---@param wait? System.Single
---@param onRemove? (System.Action)|(fun())
---@param alsoChildren? System.Boolean
_G['GUI']['Component'].FadeOut = function(duration, removeAfter, wait, onRemove, alsoChildren) end

---`Method Public Instance`
---@param wait System.Single
---@param duration System.Single
---@param alsoChildren? System.Boolean
_G['GUI']['Component'].FadeIn = function(wait, duration, alsoChildren) end

---`Method Public Instance`
---@param wait System.Single
---@param duration System.Single
---@param amount System.Int32
---@param direction Barotrauma.SlideDirection
_G['GUI']['Component'].SlideIn = function(wait, duration, amount, direction) end

---`Method Public Instance`
---@param duration System.Single
---@param amount System.Int32
---@param direction Barotrauma.SlideDirection
_G['GUI']['Component'].SlideOut = function(duration, amount, direction) end

---`Method Private Instance`
---@param duration System.Single
---@param wait System.Single
---@param target Microsoft.Xna.Framework.Vector2
---@return (System.Collections.Generic.IEnumerable*1Barotrauma*CoroutineStatus)|(fun():(Barotrauma.CoroutineStatus))
_G['GUI']['Component'].SlideToPosition = function(duration, wait, target) end

---`Method Private Instance`
---@param to System.Single
---@param duration System.Single
---@param removeAfter System.Boolean
---@param wait? System.Single
---@param onRemove? (System.Action)|(fun())
---@return (System.Collections.Generic.IEnumerable*1Barotrauma*CoroutineStatus)|(fun():(Barotrauma.CoroutineStatus))
_G['GUI']['Component'].LerpAlpha = function(to, duration, removeAfter, wait, onRemove) end

---`Method Public Instance`
---@param startScale Microsoft.Xna.Framework.Vector2
---@param endScale Microsoft.Xna.Framework.Vector2
---@param duration System.Single
_G['GUI']['Component'].Pulsate = function(startScale, endScale, duration) end

---`Method Private Instance`
---@param startScale Microsoft.Xna.Framework.Vector2
---@param endScale Microsoft.Xna.Framework.Vector2
---@param duration System.Single
---@return (System.Collections.Generic.IEnumerable*1Barotrauma*CoroutineStatus)|(fun():(Barotrauma.CoroutineStatus))
_G['GUI']['Component'].DoPulsate = function(startScale, endScale, duration) end

---`Method Public Instance Virtual`
---@param style Barotrauma.GUIComponentStyle
_G['GUI']['Component'].ApplyStyle = function(style) end

---`Method Public Instance`
---@param style Barotrauma.GUIComponentStyle
_G['GUI']['Component'].ApplySizeRestrictions = function(style) end

---`Method Public Instance`
_G['GUI']['Component'].InheritTotalChildrenMinHeight = function() end

---`Method Public Instance`
_G['GUI']['Component'].InheritTotalChildrenHeight = function() end

---`Method Public Static`
---@param element Barotrauma.ContentXElement
---@param parent Barotrauma.RectTransform
---@return Barotrauma.GUIComponent
_G['GUI']['Component'].FromXML = function(element, parent) end

---`Method Private Static`
---@param element System.Xml.Linq.XElement
---@return System.Boolean
_G['GUI']['Component'].CheckConditional = function(element) end

---`Method Private Static`
---@param element System.Xml.Linq.XElement
---@param parent Barotrauma.RectTransform
---@param overrideText? System.String
---@param anchor? System.Nullable*1Barotrauma*Anchor
---@return Barotrauma.GUITextBlock
_G['GUI']['Component'].LoadGUITextBlock = function(element, parent, overrideText, anchor) end

---`Method Private Static`
---@param element System.Xml.Linq.XElement
---@param parent Barotrauma.RectTransform
---@return Barotrauma.GUIButton
_G['GUI']['Component'].LoadLink = function(element, parent) end

---`Method Private Static`
---@param element System.Xml.Linq.XElement
---@param parent Barotrauma.RectTransform
_G['GUI']['Component'].LoadGridText = function(element, parent) end

---`Method Private Static`
---@param element System.Xml.Linq.XElement
---@param parent Barotrauma.RectTransform
---@return Barotrauma.GUIFrame
_G['GUI']['Component'].LoadGUIFrame = function(element, parent) end

---`Method Private Static`
---@param element System.Xml.Linq.XElement
---@param parent Barotrauma.RectTransform
---@return Barotrauma.GUIButton
_G['GUI']['Component'].LoadGUIButton = function(element, parent) end

---`Method Private Static`
---@param element System.Xml.Linq.XElement
---@param parent Barotrauma.RectTransform
---@return Barotrauma.GUIListBox
_G['GUI']['Component'].LoadGUIListBox = function(element, parent) end

---`Method Private Static`
---@param element System.Xml.Linq.XElement
---@param parent Barotrauma.RectTransform
---@return Barotrauma.GUILayoutGroup
_G['GUI']['Component'].LoadGUILayoutGroup = function(element, parent) end

---`Method Private Static`
---@param element Barotrauma.ContentXElement
---@param parent Barotrauma.RectTransform
---@return Barotrauma.GUIImage
_G['GUI']['Component'].LoadGUIImage = function(element, parent) end

---`Method Private Static`
---@param element Barotrauma.ContentXElement
---@param parent Barotrauma.RectTransform
---@param openOnTop System.Boolean
---@return Barotrauma.GUIButton
_G['GUI']['Component'].LoadAccordion = function(element, parent, openOnTop) end

---`Constructor NonPublic Instance`
---@overload fun(style:System.String, rectT:Barotrauma.RectTransform):Barotrauma.GUIComponent
---@overload fun(style:System.String):Barotrauma.GUIComponent
---@return Barotrauma.GUIComponent
_G['GUI']['Component'] = function() end

---`Constructor NonPublic Instance`
---@overload fun(style:System.String, rectT:Barotrauma.RectTransform):Barotrauma.GUIComponent
---@overload fun(style:System.String):Barotrauma.GUIComponent
---@return Barotrauma.GUIComponent
_G['GUI']['Component'].__new = function() end

---`Constructor Private Static`
---@overload fun(style:System.String, rectT:Barotrauma.RectTransform):Barotrauma.GUIComponent
---@overload fun(style:System.String):Barotrauma.GUIComponent
---@return Barotrauma.GUIComponent
_G['GUI']['Component'] = function() end

---`Constructor Private Static`
---@overload fun(style:System.String, rectT:Barotrauma.RectTransform):Barotrauma.GUIComponent
---@overload fun(style:System.String):Barotrauma.GUIComponent
---@return Barotrauma.GUIComponent
_G['GUI']['Component'].__new = function() end

