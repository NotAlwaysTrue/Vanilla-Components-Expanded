---@meta
---@class Barotrauma.LuaCsConfig : System.Object
_G['LuaCsConfig'] = {}

---`Method Private Static`
---@param typesElem System.Xml.Linq.XElement
---@return (System.Type-arr)|(System.Type[])
_G['LuaCsConfig'].LoadDocTypes = function(typesElem) end

---`Method Private Static`
---@param types (System.Collections.Generic.IEnumerable*1System*Type)|(fun():(System.Type))
---@return (System.Collections.Generic.IEnumerable*1System*Xml*Linq*XElement)|(fun():(System.Xml.Linq.XElement))
_G['LuaCsConfig'].SaveDocTypes = function(types) end

---`Method Private Static`
---@param types (System.Type-arr)|(System.Type[])
---@param elem System.Xml.Linq.XElement
---@return System.Type
_G['LuaCsConfig'].GetTypeAttr = function(types, elem) end

---`Method Private Static`
---@param elem System.Xml.Linq.XElement
---@return Barotrauma.LuaCsConfig.ValueType
_G['LuaCsConfig'].GetValueType = function(elem) end

---`Method Private Static`
---@param types (System.Type-arr)|(System.Type[])
---@param elem System.Xml.Linq.XElement
---@return System.Object
_G['LuaCsConfig'].ParseValue = function(types, elem) end

---`Method Private Static`
---@param types (System.Collections.Generic.List*1System*Type)|(System.Type[])
---@param type System.Type
---@param elem System.Xml.Linq.XElement
_G['LuaCsConfig'].AddTypeAttr = function(types, type, elem) end

---`Method Private Static`
---@param types (System.Collections.Generic.List*1System*Type)|(System.Type[])
---@param name System.String
---@param value System.Object
---@return System.Xml.Linq.XElement
_G['LuaCsConfig'].ParseObject = function(types, name, value) end

---`Method Public Static`
---@overload fun(file:System.IO.FileStream):(Barotrauma.LuaCsConfig.T)
---@param path System.String
---@return Barotrauma.LuaCsConfig.T
_G['LuaCsConfig'].Load = function(path) end

---`Method Public Static`
---@overload fun(file:System.IO.FileStream, obj:System.Object)
---@param path System.String
---@param obj System.Object
_G['LuaCsConfig'].Save = function(path, obj) end

---`Constructor Public Instance`
---@return Barotrauma.LuaCsConfig
_G['LuaCsConfig'] = function() end

---`Constructor Public Instance`
---@return Barotrauma.LuaCsConfig
_G['LuaCsConfig'].__new = function() end

