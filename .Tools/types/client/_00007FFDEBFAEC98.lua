---@meta
---@class System.Xml.Linq.XName : System.Object
---`Field Private Instance`
---@field _ns System.Xml.Linq.XNamespace
---`Field Private Instance`
---@field _localName System.String
---`Field Private Instance`
---@field _hashCode System.Int32
---`Getter Public Instance`
---@field LocalName System.String
---`Getter Public Instance`
---@field Namespace System.Xml.Linq.XNamespace
---`Getter Public Instance`
---@field NamespaceName System.String
_G['XName'] = {}

---`Method Public Instance Virtual`
---@return System.String
_G['XName'].ToString = function() end

---`Method Public Static`
---@overload fun(expandedName:System.String):(System.Xml.Linq.XName)
---@param localName System.String
---@param namespaceName System.String
---@return System.Xml.Linq.XName
_G['XName'].Get = function(localName, namespaceName) end

---`Method Public Instance Virtual`
---@param obj System.Object
---@return System.Boolean
_G['XName'].Equals = function(obj) end

---`Method Public Instance Virtual`
---@return System.Int32
_G['XName'].GetHashCode = function() end

---`Constructor NonPublic Instance`
---@param ns System.Xml.Linq.XNamespace
---@param localName System.String
---@return System.Xml.Linq.XName
_G['XName'] = function(ns, localName) end

---`Constructor NonPublic Instance`
---@param ns System.Xml.Linq.XNamespace
---@param localName System.String
---@return System.Xml.Linq.XName
_G['XName'].__new = function(ns, localName) end

