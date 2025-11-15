---@meta
---@class Barotrauma.GUIDropDown : Barotrauma.GUIComponent
---`Field Public Instance`
---@field OnSelected (Barotrauma.GUIDropDown.OnSelectedHandler)|(fun(selected:Barotrauma.GUIComponent, obj?:System.Object):(System.Boolean))
---`Field Public Instance`
---@field AfterSelected (Barotrauma.GUIDropDown.OnSelectedHandler)|(fun(selected:Barotrauma.GUIComponent, obj?:System.Object):(System.Boolean))
---`Field Public Instance`
---@field OnDropped (Barotrauma.GUIDropDown.OnSelectedHandler)|(fun(selected:Barotrauma.GUIComponent, obj?:System.Object):(System.Boolean))
---`Field Private Instance`
---@field button Barotrauma.GUIButton
---`Field Private Instance`
---@field icon Barotrauma.GUIImage
---`Field Private Instance`
---@field listBox Barotrauma.GUIListBox
---`Field Private Instance`
---@field currentHighestParent Barotrauma.RectTransform
---`Field Private Instance`
---@field parentHierarchy (System.Collections.Generic.List*1Barotrauma*RectTransform)|(Barotrauma.RectTransform[])
---`Field Private Instance`
---@field selectMultiple System.Boolean
---`Field Private Instance`
---@field selectedDataMultiple (System.Collections.Generic.List*1System*Object)|(System.Object[])
---`Field Private Instance`
---@field selectedIndexMultiple (System.Collections.Generic.List*1System*Int32)|(System.Int32[])
---`Field Public Instance`
---@field MustSelectAtLeastOne System.Boolean
---`Field Private Instance`
---@field wasOpened System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Dropped System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field AllowNonText System.Boolean
---`Getter Public Instance`
---@field SelectedItemData System.Object
---`Getter Public Instance Virtual`
---<br/>`Setter Public Instance Virtual`
---@field Enabled System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field ButtonEnabled System.Boolean
---`Getter Public Instance`
---@field SelectedComponent Barotrauma.GUIComponent
---`Getter Public Instance Virtual`
---<br/>`Setter Public Instance Virtual`
---@field Selected System.Boolean
---`Getter Public Instance`
---@field ListBox Barotrauma.GUIListBox
---`Getter Public Instance`
---@field SelectedData System.Object
---`Getter Public Instance`
---@field SelectedIndex System.Int32
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field ButtonTextColor Microsoft.Xna.Framework.Color
---`Getter Public Instance Virtual`
---<br/>`Setter Public Instance Virtual`
---@field Font Barotrauma.GUIFont
---`Getter Public Instance`
---@field SelectedDataMultiple (System.Collections.Generic.IEnumerable*1System*Object)|(fun():(System.Object))
---`Getter Public Instance`
---@field SelectedIndexMultiple (System.Collections.Generic.IEnumerable*1System*Int32)|(fun():(System.Int32))
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Text Barotrauma.LocalizedString
---`Getter Public Instance Virtual`
---<br/>`Setter Public Instance Virtual`
---@field ToolTip Barotrauma.RichString
---`Getter Public Instance`
---@field DropDownIcon Barotrauma.GUIImage
---`Getter Public Instance`
---@field Padding Microsoft.Xna.Framework.Vector4
_G['GUI']['DropDown'] = {}

---`Method Public Instance Virtual`
---@overload fun(inputChar:System.Char)
---@param text System.String
_G['GUI']['DropDown'].ReceiveTextInput = function(text) end

---`Method Public Instance Virtual`
---@param command System.Char
_G['GUI']['DropDown'].ReceiveCommandInput = function(command) end

---`Method Public Instance Virtual`
---@param text System.String
---@param start System.Int32
---@param length System.Int32
_G['GUI']['DropDown'].ReceiveEditingInput = function(text, start, length) end

---`Method Public Instance Virtual`
---@param key Microsoft.Xna.Framework.Input.Keys
_G['GUI']['DropDown'].ReceiveSpecialInput = function(key) end

---`Method Private Instance`
---@return Barotrauma.RectTransform
_G['GUI']['DropDown'].FindHighestParent = function() end

---`Method Public Instance`
---@param text Barotrauma.LocalizedString
---@param userData? System.Object
---@param toolTip? Barotrauma.LocalizedString
---@param color? System.Nullable*1Microsoft*Xna*Framework*Color
---@param textColor? System.Nullable*1Microsoft*Xna*Framework*Color
---@return Barotrauma.GUIComponent
_G['GUI']['DropDown'].AddItem = function(text, userData, toolTip, color, textColor) end

---`Method Public Instance Virtual`
_G['GUI']['DropDown'].ClearChildren = function() end

---`Method Public Instance`
---@return (System.Collections.Generic.IEnumerable*1Barotrauma*GUIComponent)|(fun():(Barotrauma.GUIComponent))
_G['GUI']['DropDown'].GetChildren = function() end

---`Method Private Instance`
---@param component Barotrauma.GUIComponent
---@param obj System.Object
---@return System.Boolean
_G['GUI']['DropDown'].SelectItem = function(component, obj) end

---`Method Public Instance`
---@param userData System.Object
_G['GUI']['DropDown'].SelectItem = function(userData) end

---`Method Public Instance`
---@param index System.Int32
_G['GUI']['DropDown'].Select = function(index) end

---`Method Private Instance`
---@param component Barotrauma.GUIComponent
---@param obj System.Object
---@return System.Boolean
_G['GUI']['DropDown'].OnClicked = function(component, obj) end

---`Method Public Instance`
_G['GUI']['DropDown'].RefreshListBoxParent = function() end

---`Method Private Instance`
---@param parent Barotrauma.GUIComponent
_G['GUI']['DropDown'].AddListBoxToGUIUpdateList = function(parent) end

---`Method Public Instance Virtual`
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
---@param alsoChildren? System.Boolean
---@param recursive? System.Boolean
_G['GUI']['DropDown'].DrawManually = function(spriteBatch, alsoChildren, recursive) end

---`Method Public Instance Virtual`
---@param ignoreChildren? System.Boolean
---@param order? System.Int32
_G['GUI']['DropDown'].AddToGUIUpdateList = function(ignoreChildren, order) end

---`Method NonPublic Instance Virtual`
---@param deltaTime System.Single
_G['GUI']['DropDown'].Update = function(deltaTime) end

---`Constructor Public Instance`
---@param rectT Barotrauma.RectTransform
---@param text? Barotrauma.LocalizedString
---@param elementCount? System.Int32
---@param style? System.String
---@param selectMultiple? System.Boolean
---@param dropAbove? System.Boolean
---@param textAlignment? Barotrauma.Alignment
---@param listBoxScale? System.Single
---@return Barotrauma.GUIDropDown
_G['GUI']['DropDown'] = function(rectT, text, elementCount, style, selectMultiple, dropAbove, textAlignment, listBoxScale) end

---`Constructor Public Instance`
---@param rectT Barotrauma.RectTransform
---@param text? Barotrauma.LocalizedString
---@param elementCount? System.Int32
---@param style? System.String
---@param selectMultiple? System.Boolean
---@param dropAbove? System.Boolean
---@param textAlignment? Barotrauma.Alignment
---@param listBoxScale? System.Single
---@return Barotrauma.GUIDropDown
_G['GUI']['DropDown'].__new = function(rectT, text, elementCount, style, selectMultiple, dropAbove, textAlignment, listBoxScale) end

