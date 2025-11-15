---@meta
---@class Barotrauma.GUIListBox : Barotrauma.GUIComponent
---`Field NonPublic Instance`
---@field selected (System.Collections.Generic.List*1Barotrauma*GUIComponent)|(Barotrauma.GUIComponent[])
---`Field Public Instance`
---@field OnSelected (Barotrauma.GUIListBox.OnSelectedHandler)|(fun(component:Barotrauma.GUIComponent, obj:System.Object):(System.Boolean))
---`Field Public Instance`
---@field AfterSelected (Barotrauma.GUIListBox.OnSelectedHandler)|(fun(component:Barotrauma.GUIComponent, obj:System.Object):(System.Boolean))
---`Field Public Instance`
---@field CheckSelected (Barotrauma.GUIListBox.CheckSelectedHandler)|(fun():(System.Object))
---`Field Public Instance`
---@field OnRearranged (Barotrauma.GUIListBox.OnRearrangedHandler)|(fun(listBox:Barotrauma.GUIListBox, obj:System.Object))
---`Field Private Instance`
---@field childVisible (System.Collections.Generic.Dictionary*1Barotrauma*GUIComponent*1System*Boolean)|({[Barotrauma.GUIComponent]:(System.Boolean)})
---`Field Private Instance`
---@field totalSize System.Int32
---`Field Private Instance`
---@field childrenNeedsRecalculation System.Boolean
---`Field Private Instance`
---@field scrollBarNeedsRecalculation System.Boolean
---`Field Private Instance`
---@field dimensionsNeedsRecalculation System.Boolean
---`Field Public Instance`
---@field CurrentSelectMode Barotrauma.GUIListBox.SelectMode
---`Field Public Instance`
---@field HideChildrenOutsideFrame System.Boolean
---`Field Public Instance`
---@field ResizeContentToMakeSpaceForScrollBar System.Boolean
---`Field Private Instance`
---@field useGridLayout System.Boolean
---`Field Private Instance`
---@field scrollToElement Barotrauma.GUIComponent
---`Field Private Instance`
---@field useMouseDownToSelect System.Boolean
---`Field Private Instance`
---@field overridePadding System.Nullable*1Microsoft*Xna*Framework*Vector4
---`Field Private Instance`
---@field currentDragMode Barotrauma.GUIListBox.DragMode
---`Field Private Instance`
---@field draggedElement Barotrauma.GUIComponent
---`Field Private Instance`
---@field dragMousePosRelativeToTopLeftCorner Microsoft.Xna.Framework.Point
---`Field Public Instance`
---@field HideDraggedElement System.Boolean
---`Field Private Instance`
---@field isHorizontal System.Boolean
---`Field Private Instance`
---@field lastDragStartTime System.Double
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field ContentBackground Barotrauma.GUIFrame
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field Content Barotrauma.GUIFrame
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field ScrollBar Barotrauma.GUIScrollBar
---`Getter Private Instance`
---@field ScrollBarSize System.Int32
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field SelectMultiple System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field AllowMouseWheelScroll System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field AllowArrowKeyScroll System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field SmoothScroll System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field ClampScrollToElements System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field FadeElements System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field PadBottom System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field SelectTop System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field UseGridLayout System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Padding Microsoft.Xna.Framework.Vector4
---`Getter Public Instance`
---@field SelectedComponent Barotrauma.GUIComponent
---`Getter Public Instance Virtual`
---<br/>`Setter Public Instance Virtual`
---@field Selected System.Boolean
---`Getter Public Instance`
---@field AllSelected (System.Collections.Generic.IReadOnlyList*1Barotrauma*GUIComponent)|(Barotrauma.GUIComponent[])
---`Getter Public Instance`
---@field SelectedData System.Object
---`Getter Public Instance`
---@field SelectedIndex System.Int32
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field BarScroll System.Single
---`Getter Public Instance`
---@field BarSize System.Single
---`Getter Public Instance`
---@field TotalSize System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Spacing System.Int32
---`Getter Public Instance Virtual`
---<br/>`Setter Public Instance Virtual`
---@field Color Microsoft.Xna.Framework.Color
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field ScrollBarEnabled System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field KeepSpaceForScrollBar System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field CanTakeKeyBoardFocus System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field ScrollBarVisible System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field AutoHideScrollBar System.Boolean
---`Getter Private Instance`
---<br/>`Setter Private Instance`
---@field IsScrollBarOnDefaultSide System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field CurrentDragMode Barotrauma.GUIListBox.DragMode
---`Getter Private Instance`
---@field isDraggingElement System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field HasDraggedElementIndexChanged System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field DraggedElement Barotrauma.GUIComponent
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field CanInteractWhenUnfocusable System.Boolean
---`Getter Public Instance Virtual`
---@field MouseRect Microsoft.Xna.Framework.Rectangle
---`Getter Public Instance Virtual`
---<br/>`Setter Public Instance Virtual`
---@field PlaySoundOnSelect System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field PlaySoundOnDragStop System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field SoundOnDragStart System.Nullable*1Barotrauma*GUISoundType
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field SoundOnDragStop System.Nullable*1Barotrauma*GUISoundType
_G['GUI']['ListBox'] = {}

---`Method Private Instance`
---@param b System.Boolean
---@return Barotrauma.GUIListBox.AutoScroll
_G['GUI']['ListBox'].GetAutoScroll = function(b) end

---`Method Private Instance`
---@param rectT Barotrauma.RectTransform
_G['GUI']['ListBox'].CheckForChildren = function(rectT) end

---`Method Public Instance`
_G['GUI']['ListBox'].UpdateDimensions = function() end

---`Method Public Instance`
---@overload fun(userData:System.Object, force?:Barotrauma.GUIListBox.Force, autoScroll?:Barotrauma.GUIListBox.AutoScroll):(System.Boolean)
---@overload fun(childIndex:System.Int32, force?:Barotrauma.GUIListBox.Force, autoScroll?:Barotrauma.GUIListBox.AutoScroll, takeKeyBoardFocus?:Barotrauma.GUIListBox.TakeKeyBoardFocus, playSelectSound?:Barotrauma.GUIListBox.PlaySelectSound)
---@param children (System.Collections.Generic.IEnumerable*1Barotrauma*GUIComponent)|(fun():(Barotrauma.GUIComponent))
_G['GUI']['ListBox'].Select = function(children) end

---`Method Private Instance`
---@param isHorizontal System.Boolean
---@param scrollBarSize System.Int32
---@return Microsoft.Xna.Framework.Point
_G['GUI']['ListBox'].CalculateFrameSize = function(isHorizontal, scrollBarSize) end

---`Method Public Instance`
---@return Microsoft.Xna.Framework.Vector2
_G['GUI']['ListBox'].CalculateTopOffset = function() end

---`Method Private Instance`
---@param callback (System.Action*1System*Int32*1Microsoft*Xna*Framework*Point)|(fun(arg1:System.Int32, arg2:Microsoft.Xna.Framework.Point))
_G['GUI']['ListBox'].CalculateChildrenOffsets = function(callback) end

---`Method Private Instance`
_G['GUI']['ListBox'].RepositionChildren = function() end

---`Method Public Instance`
---@param component Barotrauma.GUIComponent
---@param playSelectSound? Barotrauma.GUIListBox.PlaySelectSound
_G['GUI']['ListBox'].ScrollToElement = function(component, playSelectSound) end

---`Method Public Instance`
---@param duration System.Single
_G['GUI']['ListBox'].ScrollToEnd = function(duration) end

---`Method Private Instance`
---@param child Barotrauma.GUIComponent
_G['GUI']['ListBox'].StartDraggingElement = function(child) end

---`Method Private Instance`
---@return System.Boolean
_G['GUI']['ListBox'].UpdateDragging = function() end

---`Method Private Instance`
_G['GUI']['ListBox'].UpdateChildrenRect = function() end

---`Method Public Instance Virtual`
---@param ignoreChildren? System.Boolean
---@param order? System.Int32
_G['GUI']['ListBox'].AddToGUIUpdateList = function(ignoreChildren, order) end

---`Method Public Instance Virtual`
_G['GUI']['ListBox'].ForceLayoutRecalculation = function() end

---`Method Public Instance`
_G['GUI']['ListBox'].RecalculateChildren = function() end

---`Method Private Instance`
---@param child Barotrauma.GUIComponent
_G['GUI']['ListBox'].ClampChildMouseRects = function(child) end

---`Method NonPublic Instance Virtual`
---@param deltaTime System.Single
_G['GUI']['ListBox'].Update = function(deltaTime) end

---`Method Private Static`
---@param target Barotrauma.GUIComponent
---@return Barotrauma.GUIListBox
_G['GUI']['ListBox'].FindScrollableParentListBox = function(target) end

---`Method Public Instance`
---@param force? Barotrauma.GUIListBox.Force
---@param autoScroll? Barotrauma.GUIListBox.AutoScroll
---@param takeKeyBoardFocus? Barotrauma.GUIListBox.TakeKeyBoardFocus
---@param playSelectSound? Barotrauma.GUIListBox.PlaySelectSound
_G['GUI']['ListBox'].SelectNext = function(force, autoScroll, takeKeyBoardFocus, playSelectSound) end

---`Method Public Instance`
---@param force? Barotrauma.GUIListBox.Force
---@param autoScroll? Barotrauma.GUIListBox.AutoScroll
---@param takeKeyBoardFocus? Barotrauma.GUIListBox.TakeKeyBoardFocus
---@param playSelectSound? Barotrauma.GUIListBox.PlaySelectSound
_G['GUI']['ListBox'].SelectPrevious = function(force, autoScroll, takeKeyBoardFocus, playSelectSound) end

---`Method Public Instance`
_G['GUI']['ListBox'].Deselect = function() end

---`Method Public Instance`
---@param child Barotrauma.GUIComponent
_G['GUI']['ListBox'].DeselectElement = function(child) end

---`Method Public Instance`
_G['GUI']['ListBox'].UpdateScrollBarSize = function() end

---`Method Public Instance Virtual`
_G['GUI']['ListBox'].ClearChildren = function() end

---`Method Public Instance Virtual`
---@param child Barotrauma.GUIComponent
_G['GUI']['ListBox'].RemoveChild = function(child) end

---`Method Public Instance Virtual`
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
---@param recursive System.Boolean
_G['GUI']['ListBox'].DrawChildren = function(spriteBatch, recursive) end

---`Method NonPublic Instance Virtual`
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
_G['GUI']['ListBox'].Draw = function(spriteBatch) end

---`Method Private Instance`
---@param child Barotrauma.GUIComponent
---@return System.Boolean
_G['GUI']['ListBox'].IsChildInsideFrame = function(child) end

---`Method Public Instance Virtual`
---@overload fun(inputChar:System.Char)
---@param text System.String
_G['GUI']['ListBox'].ReceiveTextInput = function(text) end

---`Method Public Instance Virtual`
---@param command System.Char
_G['GUI']['ListBox'].ReceiveCommandInput = function(command) end

---`Method Public Instance Virtual`
---@param text System.String
---@param start System.Int32
---@param length System.Int32
_G['GUI']['ListBox'].ReceiveEditingInput = function(text, start, length) end

---`Method Public Instance Virtual`
---@param key Microsoft.Xna.Framework.Input.Keys
_G['GUI']['ListBox'].ReceiveSpecialInput = function(key) end

---`Constructor Public Instance`
---@param rectT Barotrauma.RectTransform
---@param isHorizontal? System.Boolean
---@param color? System.Nullable*1Microsoft*Xna*Framework*Color
---@param style? System.String
---@param isScrollBarOnDefaultSide? System.Boolean
---@param useMouseDownToSelect? System.Boolean
---@return Barotrauma.GUIListBox
_G['GUI']['ListBox'] = function(rectT, isHorizontal, color, style, isScrollBarOnDefaultSide, useMouseDownToSelect) end

---`Constructor Public Instance`
---@param rectT Barotrauma.RectTransform
---@param isHorizontal? System.Boolean
---@param color? System.Nullable*1Microsoft*Xna*Framework*Color
---@param style? System.String
---@param isScrollBarOnDefaultSide? System.Boolean
---@param useMouseDownToSelect? System.Boolean
---@return Barotrauma.GUIListBox
_G['GUI']['ListBox'].__new = function(rectT, isHorizontal, color, style, isScrollBarOnDefaultSide, useMouseDownToSelect) end

