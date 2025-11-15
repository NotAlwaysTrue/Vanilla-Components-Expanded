---@meta
---@class Barotrauma.Items.Components.ConcatComponent : Barotrauma.Items.Components.StringComponent
---`Field Private Instance`
---@field maxOutputLength System.Int32
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field MaxOutputLength System.Int32
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Separator System.String
_G['Components']['ConcatComponent'] = {}

---`Method NonPublic Instance Virtual`
---@param signal1 System.String
---@param signal2 System.String
---@return System.String
_G['Components']['ConcatComponent'].Calculate = function(signal1, signal2) end

---`Constructor Public Instance`
---@param item Barotrauma.Item
---@param element Barotrauma.ContentXElement
---@return Barotrauma.Items.Components.ConcatComponent
_G['Components']['ConcatComponent'] = function(item, element) end

---`Constructor Public Instance`
---@param item Barotrauma.Item
---@param element Barotrauma.ContentXElement
---@return Barotrauma.Items.Components.ConcatComponent
_G['Components']['ConcatComponent'].__new = function(item, element) end

