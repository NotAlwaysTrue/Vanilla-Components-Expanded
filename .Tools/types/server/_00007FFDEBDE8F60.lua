---@meta
---@class Barotrauma.ContentXElement : System.Object
---`Field Public Instance`
---@field Element System.Xml.Linq.XElement
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field ContentPackage Barotrauma.ContentPackage
---`Getter Public Instance`
---@field Name System.Xml.Linq.XName
---`Getter Public Instance`
---@field BaseUri System.String
---`Getter Public Instance`
---@field Document System.Xml.Linq.XDocument
---`Getter Public Instance`
---@field Parent Barotrauma.ContentXElement
---`Getter Public Instance`
---@field HasElements System.Boolean
_G['ContentXElement'] = {}

---`Method Public Instance`
---@return Barotrauma.Identifier
_G['ContentXElement'].NameAsIdentifier = function() end

---`Method Public Instance`
---@return Barotrauma.ContentXElement
_G['ContentXElement'].FirstElement = function() end

---`Method Public Instance`
---@return System.Boolean
_G['ContentXElement'].IsOverride = function() end

---`Method Public Instance`
---@param other Barotrauma.ContentXElement
---@return System.Boolean
_G['ContentXElement'].ComesAfter = function(other) end

---`Method Public Instance`
---@param name System.String
---@return Barotrauma.ContentXElement
_G['ContentXElement'].GetChildElement = function(name) end

---`Method Public Instance`
---@return (System.Collections.Generic.IEnumerable*1Barotrauma*ContentXElement)|(fun():(Barotrauma.ContentXElement))
_G['ContentXElement'].Elements = function() end

---`Method Public Instance`
---@return (System.Collections.Generic.IEnumerable*1Barotrauma*ContentXElement)|(fun():(Barotrauma.ContentXElement))
_G['ContentXElement'].ElementsBeforeSelf = function() end

---`Method Public Instance`
---@return (System.Collections.Generic.IEnumerable*1Barotrauma*ContentXElement)|(fun():(Barotrauma.ContentXElement))
_G['ContentXElement'].Descendants = function() end

---`Method Public Instance`
---@param name System.String
---@return (System.Collections.Generic.IEnumerable*1Barotrauma*ContentXElement)|(fun():(Barotrauma.ContentXElement))
_G['ContentXElement'].GetChildElements = function(name) end

---`Method Public Instance`
---@param name System.String
---@return System.Xml.Linq.XAttribute
_G['ContentXElement'].GetAttribute = function(name) end

---`Method Public Instance`
---@overload fun():((System.Collections.Generic.IEnumerable*1System*Xml*Linq*XAttribute)|(fun():(System.Xml.Linq.XAttribute)))
---@param name System.String
---@return (System.Collections.Generic.IEnumerable*1System*Xml*Linq*XAttribute)|(fun():(System.Xml.Linq.XAttribute))
_G['ContentXElement'].Attributes = function(name) end

---`Method Public Instance`
---@return System.String
_G['ContentXElement'].ElementInnerText = function() end

---`Method Public Instance`
---@overload fun(key:System.String, def:System.String):(Barotrauma.Identifier)
---@param key System.String
---@param def Barotrauma.Identifier
---@return Barotrauma.Identifier
_G['ContentXElement'].GetAttributeIdentifier = function(key, def) end

---`Method Public Instance`
---@overload fun(def:(Barotrauma.Identifier-arr)|(Barotrauma.Identifier[]), ...:System.String):((Barotrauma.Identifier-arr)|(Barotrauma.Identifier[]))
---@param key System.String
---@param def (Barotrauma.Identifier-arr)|(Barotrauma.Identifier[])
---@param trim? System.Boolean
---@return (Barotrauma.Identifier-arr)|(Barotrauma.Identifier[])
_G['ContentXElement'].GetAttributeIdentifierArray = function(key, def, trim) end

---`Method Public Instance`
---@param key System.String
---@param def (System.Collections.Immutable.ImmutableHashSet*1Barotrauma*Identifier)|(Barotrauma.Identifier[])
---@param trim? System.Boolean
---@return (System.Collections.Immutable.ImmutableHashSet*1Barotrauma*Identifier)|(Barotrauma.Identifier[])
_G['ContentXElement'].GetAttributeIdentifierImmutableHashSet = function(key, def, trim) end

---`Method Public Instance`
---@param key System.String
---@param def System.String
---@return System.String
_G['ContentXElement'].GetAttributeString = function(key, def) end

---`Method Public Instance`
---@param key System.String
---@param def System.String
---@return System.String
_G['ContentXElement'].GetAttributeStringUnrestricted = function(key, def) end

---`Method Public Instance`
---@param key System.String
---@param def (System.String-arr)|(System.String[])
---@param convertToLowerInvariant? System.Boolean
---@return (System.String-arr)|(System.String[])
_G['ContentXElement'].GetAttributeStringArray = function(key, def, convertToLowerInvariant) end

---`Method Public Instance`
---@param key System.String
---@return Barotrauma.ContentPath
_G['ContentXElement'].GetAttributeContentPath = function(key) end

---`Method Public Instance`
---@param key System.String
---@return System.Nullable*1System*Int32
_G['ContentXElement'].GetAttributeNullableInt = function(key) end

---`Method Public Instance`
---@param key System.String
---@param def System.Int32
---@return System.Int32
_G['ContentXElement'].GetAttributeInt = function(key, def) end

---`Method Public Instance`
---@param key System.String
---@param def System.UInt16
---@return System.UInt16
_G['ContentXElement'].GetAttributeUInt16 = function(key, def) end

---`Method Public Instance`
---@param key System.String
---@param def (System.Int32-arr)|(System.Int32[])
---@return (System.Int32-arr)|(System.Int32[])
_G['ContentXElement'].GetAttributeIntArray = function(key, def) end

---`Method Public Instance`
---@param key System.String
---@param def (System.UInt16-arr)|(System.UInt16[])
---@return (System.UInt16-arr)|(System.UInt16[])
_G['ContentXElement'].GetAttributeUshortArray = function(key, def) end

---`Method Public Instance`
---@param key System.String
---@return System.Nullable*1System*Single
_G['ContentXElement'].GetAttributeNullableFloat = function(key) end

---`Method Public Instance`
---@overload fun(key:System.String, def:System.Single):(System.Single)
---@param def System.Single
---@param ... System.String
---@return System.Single
_G['ContentXElement'].GetAttributeFloat = function(def, ...) end

---`Method Public Instance`
---@param key System.String
---@param def (System.Single-arr)|(System.Single[])
---@return (System.Single-arr)|(System.Single[])
_G['ContentXElement'].GetAttributeFloatArray = function(key, def) end

---`Method Public Instance`
---@param key System.String
---@param def System.Boolean
---@return System.Boolean
_G['ContentXElement'].GetAttributeBool = function(key, def) end

---`Method Public Instance`
---@param key System.String
---@param def Microsoft.Xna.Framework.Point-ref
---@return Microsoft.Xna.Framework.Point
_G['ContentXElement'].GetAttributePoint = function(key, def) end

---`Method Public Instance`
---@param key System.String
---@param def Microsoft.Xna.Framework.Vector2-ref
---@return Microsoft.Xna.Framework.Vector2
_G['ContentXElement'].GetAttributeVector2 = function(key, def) end

---`Method Public Instance`
---@param key System.String
---@param def Microsoft.Xna.Framework.Vector4-ref
---@return Microsoft.Xna.Framework.Vector4
_G['ContentXElement'].GetAttributeVector4 = function(key, def) end

---`Method Public Instance`
---@overload fun(key:System.String, def:Microsoft.Xna.Framework.Color-ref):(Microsoft.Xna.Framework.Color)
---@param key System.String
---@return System.Nullable*1Microsoft*Xna*Framework*Color
_G['ContentXElement'].GetAttributeColor = function(key) end

---`Method Public Instance`
---@param key System.String
---@param def (Microsoft.Xna.Framework.Color-arr)|(Microsoft.Xna.Framework.Color[])
---@return (Microsoft.Xna.Framework.Color-arr)|(Microsoft.Xna.Framework.Color[])
_G['ContentXElement'].GetAttributeColorArray = function(key, def) end

---`Method Public Instance`
---@param key System.String
---@param def Microsoft.Xna.Framework.Rectangle-ref
---@return Microsoft.Xna.Framework.Rectangle
_G['ContentXElement'].GetAttributeRect = function(key, def) end

---`Method Public Instance`
---@param key System.String
---@param def System.Version
---@return System.Version
_G['ContentXElement'].GetAttributeVersion = function(key, def) end

---`Method Public Instance`
---@param key System.String
---@param def Barotrauma.T-ref
---@return Barotrauma.ContentXElement.T
_G['ContentXElement'].GetAttributeEnum = function(key, def) end

---`Method Public Instance`
---@param key System.String
---@param def (Barotrauma.T-arr)|(Barotrauma.ContentXElement.T[])
---@return (Barotrauma.T-arr)|(Barotrauma.ContentXElement.T[])
_G['ContentXElement'].GetAttributeEnumArray = function(key, def) end

---`Method Public Instance`
---@param key System.String
---@param def System.ValueTuple
---@return System.ValueTuple*1Barotrauma*ContentXElement*T1*1Barotrauma*ContentXElement*T2
_G['ContentXElement'].GetAttributeTuple = function(key, def) end

---`Method Public Instance`
---@param key System.String
---@param def System.ValueTuple
---@return (System.ValueTuple)|(System.ValueTuple*1Barotrauma*ContentXElement*T1*1Barotrauma*ContentXElement*T2[])
_G['ContentXElement'].GetAttributeTupleArray = function(key, def) end

---`Method Public Instance`
---@param key System.String
---@param def Barotrauma.Range
---@return Barotrauma.Range*1System*Int32
_G['ContentXElement'].GetAttributeRange = function(key, def) end

---`Method Public Instance`
---@return Barotrauma.Identifier
_G['ContentXElement'].VariantOf = function() end

---`Method Public Instance`
---@param key System.String
---@return System.Boolean
_G['ContentXElement'].DoesAttributeReferenceFileNameAlone = function(key) end

---`Method Public Instance`
---@return System.String
_G['ContentXElement'].ParseContentPathFromUri = function() end

---`Method Public Instance`
---@param key System.String
---@param val System.String
_G['ContentXElement'].SetAttributeValue = function(key, val) end

---`Method Public Instance`
---@param elem Barotrauma.ContentXElement
_G['ContentXElement'].Add = function(elem) end

---`Method Public Instance`
---@param elem Barotrauma.ContentXElement
_G['ContentXElement'].AddFirst = function(elem) end

---`Method Public Instance`
---@param elem Barotrauma.ContentXElement
_G['ContentXElement'].AddAfterSelf = function(elem) end

---`Method Public Instance`
_G['ContentXElement'].Remove = function() end

---`Method Public Instance Virtual`
---@param obj System.Object
---@return System.Boolean
_G['ContentXElement'].Equals = function(obj) end

---`Method Public Instance Virtual`
---@return System.Int32
_G['ContentXElement'].GetHashCode = function() end

---`Constructor Public Instance`
---@param contentPackage Barotrauma.ContentPackage
---@param element System.Xml.Linq.XElement
---@return Barotrauma.ContentXElement
_G['ContentXElement'] = function(contentPackage, element) end

---`Constructor Public Instance`
---@param contentPackage Barotrauma.ContentPackage
---@param element System.Xml.Linq.XElement
---@return Barotrauma.ContentXElement
_G['ContentXElement'].__new = function(contentPackage, element) end

