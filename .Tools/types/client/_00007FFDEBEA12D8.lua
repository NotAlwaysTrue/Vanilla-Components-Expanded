---@meta
---@class Barotrauma.ToolBox : System.Object
---`Field Private Static`
---@field cachedFileNames (System.Collections.Generic.Dictionary*1System*String*1System*String)|({[System.String]:(System.String)})
---`Field Private Static`
---@field removeBBCodeRegex System.Text.RegularExpressions.Regex
---`Field Private Static`
---@field cachedLines (System.Collections.Generic.Dictionary*1System*String*1System*Collections*Generic*List*2System*String)|({[System.String]:((System.Collections.Generic.List*1System*String)|(System.String[]))})
---`Field Private Static`
---@field affectedCharacters (System.Collections.Immutable.ImmutableHashSet*1System*Char)|(System.Char[])
---`Getter Public Static`
---@field BarotraumaAssembly System.Reflection.Assembly
_G['ToolBox'] = {}

---`Method Public Static`
---@param point Microsoft.Xna.Framework.Vector2
---@param verts (Microsoft.Xna.Framework.Vector2-arr)|(Microsoft.Xna.Framework.Vector2[])
---@param checkBoundingBox? System.Boolean
---@return System.Boolean
_G['ToolBox'].PointIntersectsWithPolygon = function(point, verts, checkBoundingBox) end

---`Method Public Static`
---@param verticess (System.Collections.Generic.List*1Microsoft*Xna*Framework*Vector2)|(Microsoft.Xna.Framework.Vector2[])
---@return Microsoft.Xna.Framework.Vector2
_G['ToolBox'].GetPolygonBoundingBoxSize = function(verticess) end

---`Method Public Static`
---@param vertices (System.Collections.Generic.List*1Microsoft*Xna*Framework*Vector2)|(Microsoft.Xna.Framework.Vector2[])
---@param scale Microsoft.Xna.Framework.Vector2
---@return (System.Collections.Generic.List*1Microsoft*Xna*Framework*Vector2)|(Microsoft.Xna.Framework.Vector2[])
_G['ToolBox'].ScalePolygon = function(vertices, scale) end

---`Method Public Static`
---@param poly (System.Collections.Generic.List*1Microsoft*Xna*Framework*Vector2)|(Microsoft.Xna.Framework.Vector2[])
---@return Microsoft.Xna.Framework.Vector2
_G['ToolBox'].GetPolygonCentroid = function(poly) end

---`Method Public Static`
---@param points (System.Collections.Generic.List*1Microsoft*Xna*Framework*Vector2)|(Microsoft.Xna.Framework.Vector2[])
---@param treshold? System.Int32
---@return (System.Collections.Generic.List*1Microsoft*Xna*Framework*Vector2)|(Microsoft.Xna.Framework.Vector2[])
_G['ToolBox'].SnapVertices = function(points, treshold) end

---`Method Public Static`
---@param rects (System.Collections.Generic.IEnumerable*1Microsoft*Xna*Framework*RectangleF)|(fun():(Microsoft.Xna.Framework.RectangleF))
---@param treshold? System.Int32
---@return (System.Collections.Immutable.ImmutableArray*1Microsoft*Xna*Framework*RectangleF)|(Microsoft.Xna.Framework.RectangleF[])
_G['ToolBox'].SnapRectangles = function(rects, treshold) end

---`Method Public Static`
---@param rectangles (System.Collections.Generic.IEnumerable*1Microsoft*Xna*Framework*RectangleF)|(fun():(Microsoft.Xna.Framework.RectangleF))
---@return (System.Collections.Generic.List*1System*Collections*Generic*List*2Microsoft*Xna*Framework*Vector2)|((System.Collections.Generic.List*1Microsoft*Xna*Framework*Vector2)|(Microsoft.Xna.Framework.Vector2[])[])
_G['ToolBox'].CombineRectanglesIntoShape = function(rectangles) end

---`Method Public Static`
---@overload fun(color:Microsoft.Xna.Framework.Color):(Microsoft.Xna.Framework.Vector3)
---@param color Microsoft.Xna.Framework.Vector3
---@return Microsoft.Xna.Framework.Vector3
_G['ToolBox'].RgbToHLS = function(color) end

---`Method Public Static`
---@param hls Microsoft.Xna.Framework.Vector3
---@return Microsoft.Xna.Framework.Color
_G['ToolBox'].HLSToRGB = function(hls) end

---`Method Private Static`
---@param q1 System.Double
---@param q2 System.Double
---@param hue System.Double
---@return System.Double
_G['ToolBox'].QqhToRgb = function(q1, q2, hue) end

---`Method Public Static`
---@param color Microsoft.Xna.Framework.Color
---@return Microsoft.Xna.Framework.Vector3
_G['ToolBox'].RGBToHSV = function(color) end

---`Method Public Static`
---@param sourceColor Microsoft.Xna.Framework.Color
---@param color Microsoft.Xna.Framework.Color
---@return Microsoft.Xna.Framework.Color
_G['ToolBox'].Add = function(sourceColor, color) end

---`Method Public Static`
---@param sourceColor Microsoft.Xna.Framework.Color
---@param color Microsoft.Xna.Framework.Color
---@return Microsoft.Xna.Framework.Color
_G['ToolBox'].Subtract = function(sourceColor, color) end

---`Method Public Static`
---@overload fun(str:Barotrauma.LocalizedString, font:Barotrauma.GUIFont, maxWidth:System.Int32):(Barotrauma.LocalizedString)
---@overload fun(str:System.String, font:Barotrauma.GUIFont, maxWidth:System.Int32):(Barotrauma.LocalizedString)
---@param str System.String
---@param font Barotrauma.ScalableFont
---@param maxWidth System.Int32
---@return System.String
_G['ToolBox'].LimitString = function(str, font, maxWidth) end

---`Method Public Static`
---@param str System.String
---@param font Barotrauma.ScalableFont
---@param maxHeight System.Int32
---@return System.String
_G['ToolBox'].LimitStringHeight = function(str, font, maxHeight) end

---`Method Public Static`
---@param t System.Single
---@param ... Microsoft.Xna.Framework.Color
---@return Microsoft.Xna.Framework.Color
_G['ToolBox'].GradientLerp = function(t, ...) end

---`Method Public Static`
---@overload fun(text:Barotrauma.LocalizedString, lineLength:System.Single, font:Barotrauma.GUIFont, textScale?:System.Single):(Barotrauma.LocalizedString)
---@param text System.String
---@param lineLength System.Single
---@param font Barotrauma.ScalableFont
---@param textScale? System.Single
---@return System.String
_G['ToolBox'].WrapText = function(text, lineLength, font, textScale) end

---`Method Public Static`
---@param a System.Version
---@param b System.Version
---@return System.Boolean
_G['ToolBox'].VersionNewerIgnoreRevision = function(a, b) end

---`Method Public Static`
---@param filename System.String
_G['ToolBox'].OpenFileWithShell = function(filename) end

---`Method Public Static`
---@param parent Barotrauma.RectTransform
---@param padding System.Single
---@return Microsoft.Xna.Framework.Vector2
_G['ToolBox'].PaddingSizeParentRelative = function(parent, padding) end

---`Method Public Static`
---@param text System.String
---@param start System.Int32
---@param length System.Int32
---@param color Microsoft.Xna.Framework.Color
---@return System.String
_G['ToolBox'].ColorSectionOfString = function(text, start, length, color) end

---`Method Public Static`
---@param raw System.String
---@return (System.Byte-arr)|(System.Byte[])
_G['ToolBox'].HexStringToBytes = function(raw) end

---`Method Public Static`
---@param filename System.String
---@return System.Boolean
_G['ToolBox'].IsProperFilenameCase = function(filename) end

---`Method Public Static`
---@param filename System.String
---@param corrected System.Boolean-ref
---@param directory? System.String
---@return System.String
_G['ToolBox'].CorrectFilenameCase = function(filename, corrected, directory) end

---`Method Public Static`
---@param fileName System.String
---@return System.String
_G['ToolBox'].RemoveInvalidFileNameChars = function(fileName) end

---`Method Public Static`
---@param str System.String
---@return System.String
_G['ToolBox'].RemoveBBCodeTags = function(str) end

---`Method Public Static`
---@param length System.Int32
---@return System.String
_G['ToolBox'].RandomSeed = function(length) end

---`Method Public Static`
---@param id Barotrauma.Identifier
---@return System.Int32
_G['ToolBox'].IdentifierToInt = function(id) end

---`Method Public Static`
---@param str System.String
---@return System.Int32
_G['ToolBox'].StringToInt = function(str) end

---`Method Public Static`
---@param inputType System.String
---@return System.String
_G['ToolBox'].ConvertInputType = function(inputType) end

---`Method Public Static`
---@param isFinished System.Boolean
---@param isRunning? System.Boolean
---@return System.String
_G['ToolBox'].GetDebugSymbol = function(isFinished, isRunning) end

---`Method Public Static`
---@param obj System.Object
---@return System.String
_G['ToolBox'].ColorizeObject = function(obj) end

---`Method Public Static`
---@param s System.String
---@param t System.String
---@return System.Int32
_G['ToolBox'].LevenshteinDistance = function(s, t) end

---`Method Public Static`
---@param seconds System.Single
---@return Barotrauma.LocalizedString
_G['ToolBox'].SecondsToReadableTime = function(seconds) end

---`Method Public Static`
---@param filePath System.String
---@param randSync? Barotrauma.Rand.RandSync
---@return System.String
_G['ToolBox'].GetRandomLine = function(filePath, randSync) end

---`Method Public Static`
---@param originalBuffer Barotrauma.Networking.IReadMessage
---@param numberOfBits System.Int32
---@return Barotrauma.Networking.IReadMessage
_G['ToolBox'].ExtractBits = function(originalBuffer, numberOfBits) end

---`Method Public Static`
---@overload fun(objects:(System.Collections.Generic.IEnumerable*1Barotrauma*ToolBox*T)|(fun():(Barotrauma.ToolBox.T)), weightMethod:(System.Func*1Barotrauma*ToolBox*T*1System*Single)|(fun(arg:Barotrauma.ToolBox.T):(System.Single)), randSync:Barotrauma.Rand.RandSync):(Barotrauma.ToolBox.T)
---@overload fun(objects:(System.Collections.Generic.IEnumerable*1Barotrauma*ToolBox*T)|(fun():(Barotrauma.ToolBox.T)), weightMethod:(System.Func*1Barotrauma*ToolBox*T*1System*Single)|(fun(arg:Barotrauma.ToolBox.T):(System.Single)), random:System.Random):(Barotrauma.ToolBox.T)
---@overload fun(objects:(System.Collections.Generic.IList*1Barotrauma*ToolBox*T)|(Barotrauma.ToolBox.T[]), weights:(System.Collections.Generic.IList*1System*Single)|(System.Single[]), randSync:Barotrauma.Rand.RandSync):(Barotrauma.ToolBox.T)
---@param objects (System.Collections.Generic.IList*1Barotrauma*ToolBox*T)|(Barotrauma.ToolBox.T[])
---@param weights (System.Collections.Generic.IList*1System*Single)|(System.Single[])
---@param random System.Random
---@return Barotrauma.ToolBox.T
_G['ToolBox'].SelectWeightedRandom = function(objects, weights, random) end

---`Method Public Static`
---@param source Barotrauma.ToolBox.T
---@param flags? System.Reflection.BindingFlags
---@return Barotrauma.ToolBox.T
_G['ToolBox'].CreateCopy = function(source, flags) end

---`Method Public Static`
---@param source Barotrauma.ToolBox.T
---@param target Barotrauma.ToolBox.T
---@param flags? System.Reflection.BindingFlags
---@return Barotrauma.ToolBox.T
_G['ToolBox'].CopyValuesTo = function(source, target, flags) end

---`Method Public Static`
---@param source Barotrauma.ToolBox.T
---@param destination Barotrauma.ToolBox.T
---@param flags? System.Reflection.BindingFlags
---@return Barotrauma.ToolBox.T
_G['ToolBox'].CopyValues = function(source, destination, flags) end

---`Method Public Static`
---@param list (System.Collections.Generic.List*1Barotrauma*ToolBox*T)|(Barotrauma.ToolBox.T[])
---@param from System.Int32
---@param to System.Int32
_G['ToolBox'].SiftElement = function(list, from, to) end

---`Method Public Static`
---@param str System.String
---@return System.String
_G['ToolBox'].EscapeCharacters = function(str) end

---`Method Public Static`
---@param str System.String
---@return System.String
_G['ToolBox'].UnescapeCharacters = function(str) end

---`Method Public Static`
---@param command System.String
---@return (System.String-arr)|(System.String[])
_G['ToolBox'].SplitCommand = function(command) end

---`Method Public Static`
---@param path System.String
---@param correctFilenameCase? System.Boolean
---@param directory? System.String
---@return System.String
_G['ToolBox'].CleanUpPathCrossPlatform = function(path, correctFilenameCase, directory) end

---`Method Public Static`
---@param path System.String
---@return System.String
_G['ToolBox'].CleanUpPath = function(path) end

---`Method Public Static`
---@param easing Barotrauma.TransitionMode
---@param t System.Single
---@return System.Single
_G['ToolBox'].GetEasing = function(easing, t) end

---`Method Public Static`
---@param center Microsoft.Xna.Framework.Point
---@param size Microsoft.Xna.Framework.Point
---@return Microsoft.Xna.Framework.Rectangle
_G['ToolBox'].GetWorldBounds = function(center, size) end

---`Method Public Static`
---@param o Barotrauma.ToolBox.T
_G['ToolBox'].ThrowIfNull = function(o) end

---`Method Public Static`
---@param v System.Single
---@return System.String
_G['ToolBox'].GetFormattedPercentage = function(v) end

---`Method Public Static`
---@param original System.String
---@return System.String
_G['ToolBox'].ExtendColorToPercentageSigns = function(original) end

---`Method Public Static`
---@param original Barotrauma.Identifier
---@param match Barotrauma.Identifier
---@return System.Boolean
_G['ToolBox'].StatIdentifierMatches = function(original, match) end

---`Method Public Static`
---@overload fun(self:System.Net.IPEndPoint, other:System.Net.IPEndPoint):(System.Boolean)
---@param self System.Net.IPAddress
---@param other System.Net.IPAddress
---@return System.Boolean
_G['ToolBox'].EquivalentTo = function(self, other) end

---`Method Public Static`
---@param value System.Int16
---@return System.Single
_G['ToolBox'].ShortAudioSampleToFloat = function(value) end

---`Method Public Static`
---@param value System.Single
---@return System.Int16
_G['ToolBox'].FloatToShortAudioSample = function(value) end

---`Method Public Static`
---@param start Microsoft.Xna.Framework.Vector2
---@param luaKey__end Microsoft.Xna.Framework.Vector2
---@param knobLength? System.Single
---@return Barotrauma.SquareLine
_G['ToolBox'].GetSquareLineBetweenPoints = function(start, luaKey__end, knobLength) end

---`Method Public Static`
---@param bytes (System.Byte-arr)|(System.Byte[])
---@return System.String
_G['ToolBox'].BytesToHexString = function(bytes) end

---`Method Public Static`
---@param rect Microsoft.Xna.Framework.RectangleF
---@param point Microsoft.Xna.Framework.Vector2
---@return Microsoft.Xna.Framework.Vector2
_G['ToolBox'].GetClosestPointOnRectangle = function(rect, point) end

---`Method Public Static`
---@param prefabs (System.Collections.Generic.IEnumerable*1Barotrauma*PrefabWithUintIdentifier)|(fun():(Barotrauma.PrefabWithUintIdentifier))
---@return (System.Collections.Immutable.ImmutableArray*1System*UInt32)|(System.UInt32[])
_G['ToolBox'].PrefabCollectionToUintIdentifierArray = function(prefabs) end

---`Method Public Static`
---@param Prefabs (Barotrauma.PrefabCollection*1Barotrauma*ToolBox*T)|(fun():(Barotrauma.ToolBox.T))
---@param uintIdentifiers (System.Collections.Generic.IEnumerable*1System*UInt32)|(fun():(System.UInt32))
---@return (System.Collections.Immutable.ImmutableArray*1Barotrauma*ToolBox*T)|(Barotrauma.ToolBox.T[])
_G['ToolBox'].UintIdentifierArrayToPrefabCollection = function(Prefabs, uintIdentifiers) end

---`Constructor Private Static`
---@return Barotrauma.ToolBox
_G['ToolBox'] = function() end

---`Constructor Private Static`
---@return Barotrauma.ToolBox
_G['ToolBox'].__new = function() end

