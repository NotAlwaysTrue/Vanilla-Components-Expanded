---@meta
---@class Barotrauma.GUIRadioButtonGroup : Barotrauma.GUIComponent
---`Field Private Instance`
---@field radioButtons (System.Collections.Generic.Dictionary*1System*Int32*1Barotrauma*GUITickBox)|({[System.Int32]:(Barotrauma.GUITickBox)})
---`Field Public Instance`
---@field OnSelect (Barotrauma.GUIRadioButtonGroup.RadioButtonGroupDelegate)|(fun(rbg:Barotrauma.GUIRadioButtonGroup, val:System.Nullable*1System*Int32))
---`Field Private Instance`
---@field selected System.Nullable*1System*Int32
---`Getter Public Instance Virtual`
---<br/>`Setter Public Instance Virtual`
---@field Enabled System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Selected System.Nullable*1System*Int32
---`Getter Public Instance`
---@field SelectedRadioButton Barotrauma.GUITickBox
_G['GUI']['RadioButtonGroup'] = {}

---`Method Public Instance`
---@param key System.Int32
---@param radioButton Barotrauma.GUITickBox
_G['GUI']['RadioButtonGroup'].AddRadioButton = function(key, radioButton) end

---`Method Public Instance`
---@param radioButton Barotrauma.GUITickBox
_G['GUI']['RadioButtonGroup'].SelectRadioButton = function(radioButton) end

---`Constructor Public Instance`
---@return Barotrauma.GUIRadioButtonGroup
_G['GUI']['RadioButtonGroup'] = function() end

---`Constructor Public Instance`
---@return Barotrauma.GUIRadioButtonGroup
_G['GUI']['RadioButtonGroup'].__new = function() end

