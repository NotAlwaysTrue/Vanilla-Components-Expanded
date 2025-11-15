---@meta
---@class Barotrauma.GUIMessageBox : Barotrauma.GUIFrame
---`Field Private Instance`
---@field inGameCloseTimer System.Single
---`Field Public Instance`
---@field DisplayInLoadingScreens System.Boolean
---`Field Public Instance`
---@field DraggingPosition Microsoft.Xna.Framework.Vector2
---`Field Private Instance`
---@field newBackgroundIcon Barotrauma.GUIImage
---`Field Public Instance`
---@field AutoClose System.Boolean
---`Field Private Instance`
---@field openState System.Single
---`Field Private Instance`
---@field iconState System.Single
---`Field Private Instance`
---@field iconSwitching System.Boolean
---`Field Private Instance`
---@field closing System.Boolean
---`Field Private Instance`
---@field type Barotrauma.GUIMessageBox.Type
---`Field Private Instance`
---@field autoCloseCondition (System.Func*1System*Boolean)|(fun():(System.Boolean))
---`Field Public Instance`
---@field DrawOnTop System.Boolean
---`Field Public Static`
---@field MessageBoxes (System.Collections.Generic.List*1Barotrauma*GUIComponent)|(Barotrauma.GUIComponent[])
---`Field Private Static`
---@field messageBoxTypes (Barotrauma.Type-arr)|(Barotrauma.GUIMessageBox.Type[])
---`Field Private Static`
---@field inGameCloseTime System.Single
---`Getter Private Static`
---@field DefaultWidth System.Int32
---`Getter Private Instance`
---@field IsAnimated System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field Buttons (System.Collections.Generic.List*1Barotrauma*GUIButton)|(Barotrauma.GUIButton[])
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field Content Barotrauma.GUILayoutGroup
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field InnerFrame Barotrauma.GUIFrame
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field Header Barotrauma.GUITextBlock
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field Text Barotrauma.GUITextBlock
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field Tag Barotrauma.Identifier
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field Closed System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field Icon Barotrauma.GUIImage
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field IconColor Microsoft.Xna.Framework.Color
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Draggable System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field BackgroundIcon Barotrauma.GUIImage
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field FlashOnAutoCloseCondition System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field OnEnterPressed (System.Action)|(fun())
---`Getter Public Instance`
---@field MessageBoxType Barotrauma.GUIMessageBox.Type
---`Getter Public Static`
---@field VisibleBox Barotrauma.GUIComponent
_G['GUI']['MessageBox'] = {}

---`Method Public Static`
_G['GUI']['MessageBox'].AddActiveToGUIUpdateList = function() end

---`Method Public Instance`
---@param icon Barotrauma.Sprite
_G['GUI']['MessageBox'].SetBackgroundIcon = function(icon) end

---`Method NonPublic Instance Virtual`
---@param deltaTime System.Single
_G['GUI']['MessageBox'].Update = function(deltaTime) end

---`Method Public Instance`
---@overload fun()
---@param button Barotrauma.GUIButton
---@param obj System.Object
---@return System.Boolean
_G['GUI']['MessageBox'].Close = function(button, obj) end

---`Method Public Static`
---@overload fun(tag:Barotrauma.Identifier)
---@param tag System.String
_G['GUI']['MessageBox'].Close = function(tag) end

---`Method Public Static`
_G['GUI']['MessageBox'].CloseAll = function() end

---`Method Public Instance`
---@param rectT Barotrauma.RectTransform
---@param text System.String
---@param onClick (Barotrauma.GUIButton.OnClickedHandler)|(fun(button:Barotrauma.GUIButton, obj:System.Object):(System.Boolean))
_G['GUI']['MessageBox'].AddButton = function(rectT, text, onClick) end

---`Method Public Static`
---@param text Barotrauma.LocalizedString
---@param buttons? (System.ValueTuple)|(System.ValueTuple*1Barotrauma*LocalizedString*1System*Action*2Barotrauma*GUIMessageBox[])
---@param relativeSize? System.Nullable*1Microsoft*Xna*Framework*Vector2
---@return Barotrauma.GUIMessageBox
_G['GUI']['MessageBox'].CreateLoadingBox = function(text, buttons, relativeSize) end

---`Constructor Public Instance`
---@overload fun(headerText:Barotrauma.LocalizedString, text:Barotrauma.LocalizedString, relativeSize?:System.Nullable*1Microsoft*Xna*Framework*Vector2, minSize?:System.Nullable*1Microsoft*Xna*Framework*Point, type?:Barotrauma.GUIMessageBox.Type):Barotrauma.GUIMessageBox
---@overload fun(headerText:Barotrauma.RichString, text:Barotrauma.RichString, buttons:(Barotrauma.LocalizedString-arr)|(Barotrauma.LocalizedString[]), relativeSize?:System.Nullable*1Microsoft*Xna*Framework*Vector2, minSize?:System.Nullable*1Microsoft*Xna*Framework*Point, textAlignment?:Barotrauma.Alignment, type?:Barotrauma.GUIMessageBox.Type, tag?:System.String, icon?:Barotrauma.Sprite, iconStyle?:System.String, backgroundIcon?:Barotrauma.Sprite, autoCloseCondition?:(System.Func*1System*Boolean)|(fun():(System.Boolean)), hideCloseButton?:System.Boolean):Barotrauma.GUIMessageBox
---@overload fun(hintIdentifier:Barotrauma.Identifier, text:Barotrauma.LocalizedString, icon:Barotrauma.Sprite):Barotrauma.GUIMessageBox
---@return Barotrauma.GUIMessageBox
_G['GUI']['MessageBox'] = function() end

---`Constructor Public Instance`
---@overload fun(headerText:Barotrauma.LocalizedString, text:Barotrauma.LocalizedString, relativeSize?:System.Nullable*1Microsoft*Xna*Framework*Vector2, minSize?:System.Nullable*1Microsoft*Xna*Framework*Point, type?:Barotrauma.GUIMessageBox.Type):Barotrauma.GUIMessageBox
---@overload fun(headerText:Barotrauma.RichString, text:Barotrauma.RichString, buttons:(Barotrauma.LocalizedString-arr)|(Barotrauma.LocalizedString[]), relativeSize?:System.Nullable*1Microsoft*Xna*Framework*Vector2, minSize?:System.Nullable*1Microsoft*Xna*Framework*Point, textAlignment?:Barotrauma.Alignment, type?:Barotrauma.GUIMessageBox.Type, tag?:System.String, icon?:Barotrauma.Sprite, iconStyle?:System.String, backgroundIcon?:Barotrauma.Sprite, autoCloseCondition?:(System.Func*1System*Boolean)|(fun():(System.Boolean)), hideCloseButton?:System.Boolean):Barotrauma.GUIMessageBox
---@overload fun(hintIdentifier:Barotrauma.Identifier, text:Barotrauma.LocalizedString, icon:Barotrauma.Sprite):Barotrauma.GUIMessageBox
---@return Barotrauma.GUIMessageBox
_G['GUI']['MessageBox'].__new = function() end

---`Constructor Private Static`
---@overload fun(headerText:Barotrauma.LocalizedString, text:Barotrauma.LocalizedString, relativeSize?:System.Nullable*1Microsoft*Xna*Framework*Vector2, minSize?:System.Nullable*1Microsoft*Xna*Framework*Point, type?:Barotrauma.GUIMessageBox.Type):Barotrauma.GUIMessageBox
---@overload fun(headerText:Barotrauma.RichString, text:Barotrauma.RichString, buttons:(Barotrauma.LocalizedString-arr)|(Barotrauma.LocalizedString[]), relativeSize?:System.Nullable*1Microsoft*Xna*Framework*Vector2, minSize?:System.Nullable*1Microsoft*Xna*Framework*Point, textAlignment?:Barotrauma.Alignment, type?:Barotrauma.GUIMessageBox.Type, tag?:System.String, icon?:Barotrauma.Sprite, iconStyle?:System.String, backgroundIcon?:Barotrauma.Sprite, autoCloseCondition?:(System.Func*1System*Boolean)|(fun():(System.Boolean)), hideCloseButton?:System.Boolean):Barotrauma.GUIMessageBox
---@overload fun(hintIdentifier:Barotrauma.Identifier, text:Barotrauma.LocalizedString, icon:Barotrauma.Sprite):Barotrauma.GUIMessageBox
---@return Barotrauma.GUIMessageBox
_G['GUI']['MessageBox'] = function() end

---`Constructor Private Static`
---@overload fun(headerText:Barotrauma.LocalizedString, text:Barotrauma.LocalizedString, relativeSize?:System.Nullable*1Microsoft*Xna*Framework*Vector2, minSize?:System.Nullable*1Microsoft*Xna*Framework*Point, type?:Barotrauma.GUIMessageBox.Type):Barotrauma.GUIMessageBox
---@overload fun(headerText:Barotrauma.RichString, text:Barotrauma.RichString, buttons:(Barotrauma.LocalizedString-arr)|(Barotrauma.LocalizedString[]), relativeSize?:System.Nullable*1Microsoft*Xna*Framework*Vector2, minSize?:System.Nullable*1Microsoft*Xna*Framework*Point, textAlignment?:Barotrauma.Alignment, type?:Barotrauma.GUIMessageBox.Type, tag?:System.String, icon?:Barotrauma.Sprite, iconStyle?:System.String, backgroundIcon?:Barotrauma.Sprite, autoCloseCondition?:(System.Func*1System*Boolean)|(fun():(System.Boolean)), hideCloseButton?:System.Boolean):Barotrauma.GUIMessageBox
---@overload fun(hintIdentifier:Barotrauma.Identifier, text:Barotrauma.LocalizedString, icon:Barotrauma.Sprite):Barotrauma.GUIMessageBox
---@return Barotrauma.GUIMessageBox
_G['GUI']['MessageBox'].__new = function() end

