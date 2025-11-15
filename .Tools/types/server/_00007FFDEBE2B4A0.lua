---@meta
---@class Barotrauma.XMLExtensions : System.Object
---`Field Private Static`
---@field Converters (System.Collections.Immutable.ImmutableDictionary*1System*Type*1System*Func*2System*String*2System*Object*2System*Object)|({[System.Type]:((System.Func*1System*String*1System*Object*1System*Object)|(fun(arg1:System.String, arg2:System.Object):(System.Object)))})
---`Field Public Static`
---@field ReaderSettings System.Xml.XmlReaderSettings
---`Field Private Static`
---@field monoGameColors (System.Collections.Immutable.ImmutableDictionary*1Barotrauma*Identifier*1Microsoft*Xna*Framework*Color)|({[Barotrauma.Identifier]:(Microsoft.Xna.Framework.Color)})
_G['XMLExtensions'] = {}

---`Method Public Static`
---@param element System.Xml.Linq.XObject
---@return System.String
_G['XMLExtensions'].ParseContentPathFromUri = function(element) end

---`Method Public Static`
---@param stream System.IO.Stream
---@param baseUri? System.String
---@return System.Xml.XmlReader
_G['XMLExtensions'].CreateReader = function(stream, baseUri) end

---`Method Public Static`
---@overload fun(stream:System.IO.Stream):(System.Xml.Linq.XDocument)
---@overload fun(path:Barotrauma.ContentPath):(System.Xml.Linq.XDocument)
---@overload fun(filePath:System.String):(System.Xml.Linq.XDocument)
---@param filePath System.String
---@param exception System.Exception-ref
---@return System.Xml.Linq.XDocument
_G['XMLExtensions'].TryLoadXml = function(filePath, exception) end

---`Method Public Static`
---@param attribute System.Xml.Linq.XAttribute
---@return System.Object
_G['XMLExtensions'].GetAttributeObject = function(attribute) end

---`Method Public Static`
---@param value System.String
---@return System.Object
_G['XMLExtensions'].ParseToObject = function(value) end

---`Method Public Static`
---@param element System.Xml.Linq.XElement
---@param name System.String
---@param defaultValue System.String
---@return System.String
_G['XMLExtensions'].GetAttributeString = function(element, name, defaultValue) end

---`Method Private Static`
---@param attribute System.Xml.Linq.XAttribute
---@param defaultValue System.String
---@return System.String
_G['XMLExtensions'].GetAttributeString = function(attribute, defaultValue) end

---`Method Public Static`
---@param element System.Xml.Linq.XElement
---@param name System.String
---@param defaultValue System.String
---@return System.String
_G['XMLExtensions'].GetAttributeStringUnrestricted = function(element, name, defaultValue) end

---`Method Public Static`
---@param element System.Xml.Linq.XElement
---@param name System.String
---@return System.Boolean
_G['XMLExtensions'].DoesAttributeReferenceFileNameAlone = function(element, name) end

---`Method Public Static`
---@param element System.Xml.Linq.XElement
---@param name System.String
---@param contentPackage Barotrauma.ContentPackage
---@return Barotrauma.ContentPath
_G['XMLExtensions'].GetAttributeContentPath = function(element, name, contentPackage) end

---`Method Public Static`
---@overload fun(element:System.Xml.Linq.XElement, name:System.String, defaultValue:System.String):(Barotrauma.Identifier)
---@param element System.Xml.Linq.XElement
---@param name System.String
---@param defaultValue Barotrauma.Identifier
---@return Barotrauma.Identifier
_G['XMLExtensions'].GetAttributeIdentifier = function(element, name, defaultValue) end

---`Method Public Static`
---@param element System.Xml.Linq.XElement
---@param name System.String
---@param defaultValue (System.String-arr)|(System.String[])
---@param trim? System.Boolean
---@param convertToLowerInvariant? System.Boolean
---@return (System.String-arr)|(System.String[])
_G['XMLExtensions'].GetAttributeStringArray = function(element, name, defaultValue, trim, convertToLowerInvariant) end

---`Method Public Static`
---@overload fun(element:System.Xml.Linq.XElement, defaultValue:(Barotrauma.Identifier-arr)|(Barotrauma.Identifier[]), ...:System.String):((Barotrauma.Identifier-arr)|(Barotrauma.Identifier[]))
---@param element System.Xml.Linq.XElement
---@param name System.String
---@param defaultValue (Barotrauma.Identifier-arr)|(Barotrauma.Identifier[])
---@param trim? System.Boolean
---@return (Barotrauma.Identifier-arr)|(Barotrauma.Identifier[])
_G['XMLExtensions'].GetAttributeIdentifierArray = function(element, name, defaultValue, trim) end

---`Method Public Static`
---@param element System.Xml.Linq.XElement
---@param key System.String
---@param defaultValue (System.Collections.Immutable.ImmutableHashSet*1Barotrauma*Identifier)|(Barotrauma.Identifier[])
---@param trim? System.Boolean
---@return (System.Collections.Immutable.ImmutableHashSet*1Barotrauma*Identifier)|(Barotrauma.Identifier[])
_G['XMLExtensions'].GetAttributeIdentifierImmutableHashSet = function(element, key, defaultValue, trim) end

---`Method Public Static`
---@param element System.Xml.Linq.XElement
---@param attributeName System.String
---@return System.Nullable*1System*Single
_G['XMLExtensions'].GetAttributeNullableFloat = function(element, attributeName) end

---`Method Public Static`
---@overload fun(element:System.Xml.Linq.XElement, defaultValue:System.Single, ...:System.String):(System.Single)
---@overload fun(element:System.Xml.Linq.XElement, name:System.String, defaultValue:System.Single):(System.Single)
---@param attribute System.Xml.Linq.XAttribute
---@param defaultValue System.Single
---@return System.Single
_G['XMLExtensions'].GetAttributeFloat = function(attribute, defaultValue) end

---`Method Public Static`
---@overload fun(element:System.Xml.Linq.XElement, name:System.String, defaultValue:System.Double):(System.Double)
---@param attribute System.Xml.Linq.XAttribute
---@param defaultValue System.Double
---@return System.Double
_G['XMLExtensions'].GetAttributeDouble = function(attribute, defaultValue) end

---`Method Public Static`
---@param element System.Xml.Linq.XElement
---@param name System.String
---@param defaultValue (System.Single-arr)|(System.Single[])
---@return (System.Single-arr)|(System.Single[])
_G['XMLExtensions'].GetAttributeFloatArray = function(element, name, defaultValue) end

---`Method Public Static`
---@param element System.Xml.Linq.XElement
---@param name System.String
---@param result System.Int32-ref
---@return System.Boolean
_G['XMLExtensions'].TryGetAttributeInt = function(element, name, result) end

---`Method Public Static`
---@param element System.Xml.Linq.XElement
---@param attributeName System.String
---@return System.Nullable*1System*Int32
_G['XMLExtensions'].GetAttributeNullableInt = function(element, attributeName) end

---`Method Public Static`
---@overload fun(element:System.Xml.Linq.XElement, name:System.String, defaultValue:System.Int32):(System.Int32)
---@param attribute System.Xml.Linq.XAttribute
---@param defaultValue System.Int32
---@return System.Int32
_G['XMLExtensions'].GetAttributeInt = function(attribute, defaultValue) end

---`Method Public Static`
---@param element System.Xml.Linq.XElement
---@param name System.String
---@param defaultValue System.UInt32
---@return System.UInt32
_G['XMLExtensions'].GetAttributeUInt = function(element, name, defaultValue) end

---`Method Public Static`
---@param element System.Xml.Linq.XElement
---@param name System.String
---@param defaultValue System.UInt16
---@return System.UInt16
_G['XMLExtensions'].GetAttributeUInt16 = function(element, name, defaultValue) end

---`Method Public Static`
---@param element System.Xml.Linq.XElement
---@param name System.String
---@param defaultValue System.UInt64
---@return System.UInt64
_G['XMLExtensions'].GetAttributeUInt64 = function(element, name, defaultValue) end

---`Method Public Static`
---@param element System.Xml.Linq.XElement
---@param name System.String
---@return Barotrauma.Option*1Barotrauma*SerializableDateTime
_G['XMLExtensions'].GetAttributeDateTime = function(element, name) end

---`Method Public Static`
---@param element System.Xml.Linq.XElement
---@param name System.String
---@param defaultValue System.Version
---@return System.Version
_G['XMLExtensions'].GetAttributeVersion = function(element, name, defaultValue) end

---`Method Public Static`
---@param element System.Xml.Linq.XElement
---@param name System.String
---@param defaultValue (System.Int32-arr)|(System.Int32[])
---@return (System.Int32-arr)|(System.Int32[])
_G['XMLExtensions'].GetAttributeIntArray = function(element, name, defaultValue) end

---`Method Public Static`
---@param element System.Xml.Linq.XElement
---@param name System.String
---@param defaultValue (System.UInt16-arr)|(System.UInt16[])
---@return (System.UInt16-arr)|(System.UInt16[])
_G['XMLExtensions'].GetAttributeUshortArray = function(element, name, defaultValue) end

---`Method Public Static`
---@param value System.String
---@param defaultValue Barotrauma.XMLExtensions.T
---@param attribute System.Xml.Linq.XAttribute
---@return Barotrauma.XMLExtensions.T
_G['XMLExtensions'].ParseEnumValue = function(value, defaultValue, attribute) end

---`Method Public Static`
---@param element System.Xml.Linq.XElement
---@param name System.String
---@param defaultValue Barotrauma.XMLExtensions.T
---@return Barotrauma.XMLExtensions.T
_G['XMLExtensions'].GetAttributeEnum = function(element, name, defaultValue) end

---`Method Public Static`
---@param element System.Xml.Linq.XElement
---@param name System.String
---@param defaultValue (Barotrauma.T-arr)|(Barotrauma.XMLExtensions.T[])
---@return (Barotrauma.T-arr)|(Barotrauma.XMLExtensions.T[])
_G['XMLExtensions'].GetAttributeEnumArray = function(element, name, defaultValue) end

---`Method Public Static`
---@overload fun(element:System.Xml.Linq.XElement, name:System.String, defaultValue:System.Boolean):(System.Boolean)
---@param attribute System.Xml.Linq.XAttribute
---@param defaultValue System.Boolean
---@return System.Boolean
_G['XMLExtensions'].GetAttributeBool = function(attribute, defaultValue) end

---`Method Public Static`
---@param element System.Xml.Linq.XElement
---@param name System.String
---@param defaultValue Microsoft.Xna.Framework.Point
---@return Microsoft.Xna.Framework.Point
_G['XMLExtensions'].GetAttributePoint = function(element, name, defaultValue) end

---`Method Public Static`
---@param element System.Xml.Linq.XElement
---@param name System.String
---@param defaultValue Microsoft.Xna.Framework.Vector2
---@return Microsoft.Xna.Framework.Vector2
_G['XMLExtensions'].GetAttributeVector2 = function(element, name, defaultValue) end

---`Method Public Static`
---@param element System.Xml.Linq.XElement
---@param name System.String
---@param defaultValue Microsoft.Xna.Framework.Vector3
---@return Microsoft.Xna.Framework.Vector3
_G['XMLExtensions'].GetAttributeVector3 = function(element, name, defaultValue) end

---`Method Public Static`
---@param element System.Xml.Linq.XElement
---@param name System.String
---@param defaultValue Microsoft.Xna.Framework.Vector4
---@return Microsoft.Xna.Framework.Vector4
_G['XMLExtensions'].GetAttributeVector4 = function(element, name, defaultValue) end

---`Method Public Static`
---@overload fun(element:System.Xml.Linq.XElement, name:System.String, defaultValue:Microsoft.Xna.Framework.Color):(Microsoft.Xna.Framework.Color)
---@param element System.Xml.Linq.XElement
---@param name System.String
---@return System.Nullable*1Microsoft*Xna*Framework*Color
_G['XMLExtensions'].GetAttributeColor = function(element, name) end

---`Method Public Static`
---@param element System.Xml.Linq.XElement
---@param name System.String
---@param defaultValue (Microsoft.Xna.Framework.Color-arr)|(Microsoft.Xna.Framework.Color[])
---@return (Microsoft.Xna.Framework.Color-arr)|(Microsoft.Xna.Framework.Color[])
_G['XMLExtensions'].GetAttributeColorArray = function(element, name, defaultValue) end

---`Method Private Static`
---@param attribute System.Xml.Linq.XAttribute
---@param element System.Xml.Linq.XElement
---@param e System.Exception
_G['XMLExtensions'].LogAttributeError = function(attribute, element, e) end

---`Method Public Static`
---@param element System.Xml.Linq.XElement
---@param name System.String
---@param defaultValue Microsoft.Xna.Framework.Rectangle
---@return Microsoft.Xna.Framework.Rectangle
_G['XMLExtensions'].GetAttributeRect = function(element, name, defaultValue) end

---`Method Public Static`
---@param element System.Xml.Linq.XElement
---@param name System.String
---@param defaultValue System.ValueTuple*1Barotrauma*XMLExtensions*T1*1Barotrauma*XMLExtensions*T2
---@return System.ValueTuple*1Barotrauma*XMLExtensions*T1*1Barotrauma*XMLExtensions*T2
_G['XMLExtensions'].GetAttributeTuple = function(element, name, defaultValue) end

---`Method Public Static`
---@param element System.Xml.Linq.XElement
---@param name System.String
---@param defaultValue (System.ValueTuple)|(System.ValueTuple*1Barotrauma*XMLExtensions*T1*1Barotrauma*XMLExtensions*T2[])
---@return (System.ValueTuple)|(System.ValueTuple*1Barotrauma*XMLExtensions*T1*1Barotrauma*XMLExtensions*T2[])
_G['XMLExtensions'].GetAttributeTupleArray = function(element, name, defaultValue) end

---`Method Public Static`
---@param element System.Xml.Linq.XElement
---@param name System.String
---@param defaultValue Barotrauma.Range*1System*Int32
---@return Barotrauma.Range*1System*Int32
_G['XMLExtensions'].GetAttributeRange = function(element, name, defaultValue) end

---`Method Public Static`
---@param el System.Xml.Linq.XElement
---@return System.String
_G['XMLExtensions'].ElementInnerText = function(el) end

---`Method Public Static`
---@param point Microsoft.Xna.Framework.Point
---@return System.String
_G['XMLExtensions'].PointToString = function(point) end

---`Method Public Static`
---@param vector Microsoft.Xna.Framework.Vector2
---@return System.String
_G['XMLExtensions'].Vector2ToString = function(vector) end

---`Method Public Static`
---@param vector Microsoft.Xna.Framework.Vector3
---@param format? System.String
---@return System.String
_G['XMLExtensions'].Vector3ToString = function(vector, format) end

---`Method Public Static`
---@param vector Microsoft.Xna.Framework.Vector4
---@param format? System.String
---@return System.String
_G['XMLExtensions'].Vector4ToString = function(vector, format) end

---`Method Public Static`
---@param color Microsoft.Xna.Framework.Color
---@return System.String
_G['XMLExtensions'].ColorToString = function(color) end

---`Method Public Static`
---@param color Microsoft.Xna.Framework.Color
---@return System.String
_G['XMLExtensions'].ToStringHex = function(color) end

---`Method Public Static`
---@param rect Microsoft.Xna.Framework.Rectangle
---@return System.String
_G['XMLExtensions'].RectToString = function(rect) end

---`Method Public Static`
---@param strValue System.String
---@param defaultValue System.ValueTuple*1Barotrauma*XMLExtensions*T1*1Barotrauma*XMLExtensions*T2
---@return System.ValueTuple*1Barotrauma*XMLExtensions*T1*1Barotrauma*XMLExtensions*T2
_G['XMLExtensions'].ParseTuple = function(strValue, defaultValue) end

---`Method Public Static`
---@param stringPoint System.String
---@param errorMessages? System.Boolean
---@return Microsoft.Xna.Framework.Point
_G['XMLExtensions'].ParsePoint = function(stringPoint, errorMessages) end

---`Method Public Static`
---@param stringVector2 System.String
---@param errorMessages? System.Boolean
---@return Microsoft.Xna.Framework.Vector2
_G['XMLExtensions'].ParseVector2 = function(stringVector2, errorMessages) end

---`Method Public Static`
---@param stringVector3 System.String
---@param errorMessages? System.Boolean
---@return Microsoft.Xna.Framework.Vector3
_G['XMLExtensions'].ParseVector3 = function(stringVector3, errorMessages) end

---`Method Public Static`
---@param stringVector4 System.String
---@param errorMessages? System.Boolean
---@return Microsoft.Xna.Framework.Vector4
_G['XMLExtensions'].ParseVector4 = function(stringVector4, errorMessages) end

---`Method Public Static`
---@param stringColor System.String
---@param errorMessages? System.Boolean
---@return Microsoft.Xna.Framework.Color
_G['XMLExtensions'].ParseColor = function(stringColor, errorMessages) end

---`Method Public Static`
---@param stringRect System.String
---@param requireSize System.Boolean
---@param errorMessages? System.Boolean
---@return Microsoft.Xna.Framework.Rectangle
_G['XMLExtensions'].ParseRect = function(stringRect, requireSize, errorMessages) end

---`Method Public Static`
---@param stringArray (System.String-arr)|(System.String[])
---@return (System.Single-arr)|(System.Single[])
_G['XMLExtensions'].ParseFloatArray = function(stringArray) end

---`Method Public Static`
---@param rangeString System.String
---@return Barotrauma.Range*1System*Int32
_G['XMLExtensions'].ParseRange = function(rangeString) end

---`Method Public Static`
---@param element System.Xml.Linq.XElement
---@return Barotrauma.Identifier
_G['XMLExtensions'].VariantOf = function(element) end

---`Method Public Static`
---@param element System.Xml.Linq.XElement
---@return System.Boolean
_G['XMLExtensions'].IsOverride = function(element) end

---`Method Public Static`
---@param doc System.Xml.Linq.XDocument
---@return System.Xml.Linq.XElement
_G['XMLExtensions'].GetRootExcludingOverride = function(doc) end

---`Method Public Static`
---@param element System.Xml.Linq.XElement
---@return System.Xml.Linq.XElement
_G['XMLExtensions'].FirstElement = function(element) end

---`Method Public Static`
---@overload fun(element:System.Xml.Linq.XElement, name:System.String, comparisonMethod?:System.StringComparison):(System.Xml.Linq.XAttribute)
---@overload fun(element:System.Xml.Linq.XElement, name:Barotrauma.Identifier):(System.Xml.Linq.XAttribute)
---@param element System.Xml.Linq.XElement
---@param predicate (System.Func*1System*Xml*Linq*XAttribute*1System*Boolean)|(fun(arg:System.Xml.Linq.XAttribute):(System.Boolean))
---@return System.Xml.Linq.XAttribute
_G['XMLExtensions'].GetAttribute = function(element, predicate) end

---`Method Public Static`
---@param element System.Xml.Linq.XElement
---@param name System.String
---@param value System.Object
---@param comparisonMethod? System.StringComparison
---@return System.Boolean
_G['XMLExtensions'].TrySetAttributeValue = function(element, name, value, comparisonMethod) end

---`Method Public Static`
---@param element System.Xml.Linq.XElement
---@param name System.String
---@param value System.Object
_G['XMLExtensions'].SetAttribute = function(element, name, value) end

---`Method Public Static`
---@param container System.Xml.Linq.XContainer
---@param name System.String
---@param comparisonMethod? System.StringComparison
---@return System.Xml.Linq.XElement
_G['XMLExtensions'].GetChildElement = function(container, name, comparisonMethod) end

---`Method Public Static`
---@overload fun(container:System.Xml.Linq.XContainer, name:System.String, comparisonMethod?:System.StringComparison):((System.Collections.Generic.IEnumerable*1System*Xml*Linq*XElement)|(fun():(System.Xml.Linq.XElement)))
---@param container System.Xml.Linq.XContainer
---@param ... System.String
---@return (System.Collections.Generic.IEnumerable*1System*Xml*Linq*XElement)|(fun():(System.Xml.Linq.XElement))
_G['XMLExtensions'].GetChildElements = function(container, ...) end

---`Method Public Static`
---@param element System.Xml.Linq.XElement
---@param other System.Xml.Linq.XElement
---@return System.Boolean
_G['XMLExtensions'].ComesAfter = function(element, other) end

---`Method Public Static`
---@overload fun(elem:System.Xml.Linq.XElement):(Barotrauma.Identifier)
---@param attr System.Xml.Linq.XAttribute
---@return Barotrauma.Identifier
_G['XMLExtensions'].NameAsIdentifier = function(attr) end

---`Constructor Private Static`
---@return Barotrauma.XMLExtensions
_G['XMLExtensions'] = function() end

---`Constructor Private Static`
---@return Barotrauma.XMLExtensions
_G['XMLExtensions'].__new = function() end

