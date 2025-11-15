---@meta
---@class Barotrauma.GUITickBox : Barotrauma.GUIComponent
---`Field Private Instance`
---@field layoutGroup Barotrauma.GUILayoutGroup
---`Field Private Instance`
---@field box Barotrauma.GUIFrame
---`Field Private Instance`
---@field text Barotrauma.GUITextBlock
---`Field Public Instance`
---@field OnSelected (Barotrauma.GUITickBox.OnSelectedHandler)|(fun(obj:Barotrauma.GUITickBox):(System.Boolean))
---`Field Private Instance`
---@field radioButtonGroup Barotrauma.GUIRadioButtonGroup
---`Getter Public Instance Virtual`
---<br/>`Setter Public Instance Virtual`
---@field Selected System.Boolean
---`Getter Public Instance Virtual`
---<br/>`Setter Public Instance Virtual`
---@field State Barotrauma.GUIComponent.ComponentState
---`Getter Public Instance Virtual`
---<br/>`Setter Public Instance Virtual`
---@field Enabled System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field TextColor Microsoft.Xna.Framework.Color
---`Getter Public Instance Virtual`
---<br/>`Setter Public Instance Virtual`
---@field Font Barotrauma.GUIFont
---`Getter Public Instance`
---@field Box Barotrauma.GUIFrame
---`Getter Public Instance`
---@field TextBlock Barotrauma.GUITextBlock
---`Getter Public Instance Virtual`
---<br/>`Setter Public Instance Virtual`
---@field ToolTip Barotrauma.RichString
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Text Barotrauma.LocalizedString
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field ContentWidth System.Single
---`Getter Private Instance`
---<br/>`Setter Public Instance`
---@field SoundType Barotrauma.GUISoundType
---`Getter Public Instance Virtual`
---<br/>`Setter Public Instance Virtual`
---@field PlaySoundOnSelect System.Boolean
_G['GUI']['TickBox'] = {}

---`Method Public Instance`
---@param rbg Barotrauma.GUIRadioButtonGroup
_G['GUI']['TickBox'].SetRadioButtonGroup = function(rbg) end

---`Method Public Instance`
_G['GUI']['TickBox'].ResizeBox = function() end

---`Method Public Instance`
---@param selected System.Boolean
---@param callOnSelected? System.Boolean
_G['GUI']['TickBox'].SetSelected = function(selected, callOnSelected) end

---`Method NonPublic Instance Virtual`
---@param deltaTime System.Single
_G['GUI']['TickBox'].Update = function(deltaTime) end

---`Constructor Public Instance`
---@param rectT Barotrauma.RectTransform
---@param label Barotrauma.LocalizedString
---@param font? Barotrauma.GUIFont
---@param style? System.String
---@return Barotrauma.GUITickBox
_G['GUI']['TickBox'] = function(rectT, label, font, style) end

---`Constructor Public Instance`
---@param rectT Barotrauma.RectTransform
---@param label Barotrauma.LocalizedString
---@param font? Barotrauma.GUIFont
---@param style? System.String
---@return Barotrauma.GUITickBox
_G['GUI']['TickBox'].__new = function(rectT, label, font, style) end

