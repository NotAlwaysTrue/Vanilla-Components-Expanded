---@meta
---@class Barotrauma.GUIPrefab : Barotrauma.Prefab
_G['GUIPrefab'] = {}

---`Method NonPublic Instance Virtual`
---@param element System.Xml.Linq.XElement
---@return Barotrauma.Identifier
_G['GUIPrefab'].DetermineIdentifier = function(element) end

---`Method NonPublic Instance`
---@param element System.Xml.Linq.XElement
---@param attributeName System.String
---@return System.Int32
_G['GUIPrefab'].ParseSize = function(element, attributeName) end

---`Constructor Public Instance`
---@param element Barotrauma.ContentXElement
---@param file Barotrauma.UIStyleFile
---@return Barotrauma.GUIPrefab
_G['GUIPrefab'] = function(element, file) end

---`Constructor Public Instance`
---@param element Barotrauma.ContentXElement
---@param file Barotrauma.UIStyleFile
---@return Barotrauma.GUIPrefab
_G['GUIPrefab'].__new = function(element, file) end

