---@meta
---@class Barotrauma.ContextMenuOption : System.ValueType
---`Field Public Instance`
---@field Label Barotrauma.LocalizedString
---`Field Public Instance`
---@field OnSelected (System.Action)|(fun())
---`Field Public Instance`
---@field SubOptions (Barotrauma.ContextMenuOption-arr)|(Barotrauma.ContextMenuOption[])
---`Field Public Instance`
---@field IsEnabled System.Boolean
---`Field Public Instance`
---@field Tooltip Barotrauma.LocalizedString
_G['GUI']['ContextMenuOption'] = {}

---`Constructor Public Instance`
---@overload fun(label:System.String, isEnabled:System.Boolean, onSelected:(System.Action)|(fun())):Barotrauma.ContextMenuOption
---@overload fun(labelTag:Barotrauma.Identifier, isEnabled:System.Boolean, onSelected:(System.Action)|(fun())):Barotrauma.ContextMenuOption
---@overload fun(label:Barotrauma.LocalizedString, isEnabled:System.Boolean, onSelected:(System.Action)|(fun())):Barotrauma.ContextMenuOption
---@param label System.String
---@param isEnabled System.Boolean
---@param ... Barotrauma.ContextMenuOption
---@return Barotrauma.ContextMenuOption
_G['GUI']['ContextMenuOption'] = function(label, isEnabled, ...) end

---`Constructor Public Instance`
---@overload fun(label:System.String, isEnabled:System.Boolean, onSelected:(System.Action)|(fun())):Barotrauma.ContextMenuOption
---@overload fun(labelTag:Barotrauma.Identifier, isEnabled:System.Boolean, onSelected:(System.Action)|(fun())):Barotrauma.ContextMenuOption
---@overload fun(label:Barotrauma.LocalizedString, isEnabled:System.Boolean, onSelected:(System.Action)|(fun())):Barotrauma.ContextMenuOption
---@param label System.String
---@param isEnabled System.Boolean
---@param ... Barotrauma.ContextMenuOption
---@return Barotrauma.ContextMenuOption
_G['GUI']['ContextMenuOption'].__new = function(label, isEnabled, ...) end

