---@meta
---@class Barotrauma.MathUtils : System.Object
_G['MathUtils'] = {}

---`Method Public Static`
---@param vector Microsoft.Xna.Framework.Vector3
---@return Microsoft.Xna.Framework.Vector2
_G['MathUtils'].DiscardZ = function(vector) end

---`Method Public Static`
---@param portion System.Single
---@param total System.Single
---@return System.Single
_G['MathUtils'].Percentage = function(portion, total) end

---`Method Public Static`
---@overload fun(i:System.Int32, n:System.Int32):(System.Int32)
---@param i System.Single
---@param n System.Single
---@return System.Single
_G['MathUtils'].PositiveModulo = function(i, n) end

---`Method Public Static`
---@param x1 System.Double
---@param y1 System.Double
---@param x2 System.Double
---@param y2 System.Double
---@return System.Double
_G['MathUtils'].Distance = function(x1, y1, x2, y2) end

---`Method Public Static`
---@overload fun(x1:System.Double, y1:System.Double, x2:System.Double, y2:System.Double):(System.Double)
---@param x1 System.Int32
---@param y1 System.Int32
---@param x2 System.Int32
---@param y2 System.Int32
---@return System.Int32
_G['MathUtils'].DistanceSquared = function(x1, y1, x2, y2) end

---`Method Public Static`
---@overload fun(v1:Microsoft.Xna.Framework.Vector2, v2:Microsoft.Xna.Framework.Vector2, amount:System.Single):(Microsoft.Xna.Framework.Vector2)
---@param t System.Single
---@return System.Single
_G['MathUtils'].SmoothStep = function(t) end

---`Method Public Static`
---@param t System.Single
---@return System.Single
_G['MathUtils'].SmootherStep = function(t) end

---`Method Public Static`
---@param t System.Single
---@return System.Single
_G['MathUtils'].EaseIn = function(t) end

---`Method Public Static`
---@param t System.Single
---@return System.Single
_G['MathUtils'].EaseOut = function(t) end

---`Method Public Static`
---@param v Microsoft.Xna.Framework.Vector2
---@param length System.Single
---@return Microsoft.Xna.Framework.Vector2
_G['MathUtils'].ClampLength = function(v, length) end

---`Method Public Static`
---@param rect Microsoft.Xna.Framework.Rectangle
---@param x System.Double
---@param y System.Double
---@return System.Boolean
_G['MathUtils'].Contains = function(rect, x, y) end

---`Method Public Static`
---@overload fun(value:System.Single, div:System.Single):(System.Single)
---@param vector Microsoft.Xna.Framework.Vector2
---@return Microsoft.Xna.Framework.Vector2
_G['MathUtils'].Round = function(vector) end

---`Method Public Static`
---@param v System.Single
---@return System.Int32
_G['MathUtils'].RoundToInt = function(v) end

---`Method Public Static`
---@param value System.Single
---@param div System.Single
---@return System.Single
_G['MathUtils'].RoundTowardsClosest = function(value, div) end

---`Method Public Static`
---@param vector Microsoft.Xna.Framework.Vector2
---@return System.Single
_G['MathUtils'].VectorToAngle = function(vector) end

---`Method Public Static`
---@param vector Microsoft.Xna.Framework.Vector2
---@return Microsoft.Xna.Framework.Point
_G['MathUtils'].ToPoint = function(vector) end

---`Method Public Static`
---@overload fun(value:System.Single):(System.Boolean)
---@param vector Microsoft.Xna.Framework.Vector2
---@return System.Boolean
_G['MathUtils'].IsValid = function(vector) end

---`Method Public Static`
---@param rect Microsoft.Xna.Framework.Rectangle
---@param amount System.Int32
---@return Microsoft.Xna.Framework.Rectangle
_G['MathUtils'].ExpandRect = function(rect, amount) end

---`Method Public Static`
---@param pointA Microsoft.Xna.Framework.Vector2
---@param pointB Microsoft.Xna.Framework.Vector2
---@param pointC Microsoft.Xna.Framework.Vector2
---@return System.Int32
_G['MathUtils'].VectorOrientation = function(pointA, pointB, pointC) end

---`Method Public Static`
---@param from System.Single
---@param to System.Single
---@param step System.Single
---@return System.Single
_G['MathUtils'].CurveAngle = function(from, to, step) end

---`Method Public Static`
---@param angle System.Single
---@return System.Single
_G['MathUtils'].WrapAngleTwoPi = function(angle) end

---`Method Public Static`
---@param angle System.Single
---@return System.Single
_G['MathUtils'].WrapAnglePi = function(angle) end

---`Method Public Static`
---@param from System.Single
---@param to System.Single
---@return System.Single
_G['MathUtils'].GetShortestAngle = function(from, to) end

---`Method Public Static`
---@param from System.Single
---@param to System.Single
---@return System.Single
_G['MathUtils'].GetMidAngle = function(from, to) end

---`Method Public Static`
---@param a System.Single
---@param b System.Single
---@param c System.Single
---@return System.Single
_G['MathUtils'].SolveTriangleSSS = function(a, b, c) end

---`Method Public Static`
---@param angle System.Single
---@return System.Byte
_G['MathUtils'].AngleToByte = function(angle) end

---`Method Public Static`
---@param b System.Byte
---@return System.Single
_G['MathUtils'].ByteToAngle = function(b) end

---`Method Public Static`
---@param a Microsoft.Xna.Framework.Vector2
---@param b Microsoft.Xna.Framework.Vector2
---@param c Microsoft.Xna.Framework.Vector2
---@param d Microsoft.Xna.Framework.Vector2
---@return System.Boolean
_G['MathUtils'].LineSegmentsIntersect = function(a, b, c, d) end

---`Method Public Static`
---@param a1 Microsoft.Xna.Framework.Vector2
---@param a2 Microsoft.Xna.Framework.Vector2
---@param b1 Microsoft.Xna.Framework.Vector2
---@param b2 Microsoft.Xna.Framework.Vector2
---@param intersection Microsoft.Xna.Framework.Vector2-ref
---@return System.Boolean
_G['MathUtils'].GetLineSegmentIntersection = function(a1, a2, b1, b2, intersection) end

---`Method Public Static`
---@param a1 Microsoft.Xna.Framework.Vector2
---@param a2 Microsoft.Xna.Framework.Vector2
---@param b1 Microsoft.Xna.Framework.Vector2
---@param b2 Microsoft.Xna.Framework.Vector2
---@param areLinesInfinite System.Boolean
---@param intersection Microsoft.Xna.Framework.Vector2-ref
---@return System.Boolean
_G['MathUtils'].GetLineIntersection = function(a1, a2, b1, b2, areLinesInfinite, intersection) end

---`Method Public Static`
---@param a1 Microsoft.Xna.Framework.Vector2
---@param a2 Microsoft.Xna.Framework.Vector2
---@param axisAligned1 Microsoft.Xna.Framework.Vector2
---@param axisAligned2 Microsoft.Xna.Framework.Vector2
---@param isHorizontal System.Boolean
---@param intersection Microsoft.Xna.Framework.Vector2-ref
---@return System.Boolean
_G['MathUtils'].GetAxisAlignedLineIntersection = function(a1, a2, axisAligned1, axisAligned2, isHorizontal, intersection) end

---`Method Public Static`
---@param a1 Microsoft.Xna.Framework.Vector2
---@param a2 Microsoft.Xna.Framework.Vector2
---@param rect Microsoft.Xna.Framework.Rectangle
---@param intersection Microsoft.Xna.Framework.Vector2-ref
---@return System.Boolean
_G['MathUtils'].GetLineRectangleIntersection = function(a1, a2, rect, intersection) end

---`Method Public Static`
---@param a1 Microsoft.Xna.Framework.Vector2
---@param a2 Microsoft.Xna.Framework.Vector2
---@param rect Microsoft.Xna.Framework.Rectangle
---@param intersection Microsoft.Xna.Framework.Vector2-ref
---@return System.Boolean
_G['MathUtils'].GetLineWorldRectangleIntersection = function(a1, a2, rect, intersection) end

---`Method Public Static`
---@param vector Microsoft.Xna.Framework.Vector2
---@return Microsoft.Xna.Framework.Vector2
_G['MathUtils'].FlipX = function(vector) end

---`Method Public Static`
---@overload fun(vector:Microsoft.Xna.Framework.Vector2):(Microsoft.Xna.Framework.Vector2)
---@param point Microsoft.Xna.Framework.Point
---@return Microsoft.Xna.Framework.Point
_G['MathUtils'].FlipY = function(point) end

---`Method Public Static`
---@overload fun(vector:Microsoft.Xna.Framework.Vector2):(Microsoft.Xna.Framework.Vector2)
---@param point Microsoft.Xna.Framework.Point
---@return Microsoft.Xna.Framework.Point
_G['MathUtils'].YX = function(point) end

---`Method Public Static`
---@param radians System.Single
---@return Microsoft.Xna.Framework.Vector2
_G['MathUtils'].RotatedUnitXRadians = function(radians) end

---`Method Public Static`
---@param radians System.Single
---@return Microsoft.Xna.Framework.Vector2
_G['MathUtils'].RotatedUnitYRadians = function(radians) end

---`Method Public Static`
---@param circlePos Microsoft.Xna.Framework.Vector2
---@param radius System.Single
---@param point1 Microsoft.Xna.Framework.Vector2
---@param point2 Microsoft.Xna.Framework.Vector2
---@param isLineSegment System.Boolean
---@param intersection1 System.Nullable
---@param intersection2 System.Nullable
---@return System.Int32
_G['MathUtils'].GetLineCircleIntersections = function(circlePos, radius, point1, point2, isLineSegment, intersection1, intersection2) end

---`Method Public Static`
---@param lineA Microsoft.Xna.Framework.Vector2
---@param lineB Microsoft.Xna.Framework.Vector2
---@param point Microsoft.Xna.Framework.Vector2
---@return System.Single
_G['MathUtils'].LineToPointDistance = function(lineA, lineB, point) end

---`Method Public Static`
---@param lineA Microsoft.Xna.Framework.Vector2
---@param lineB Microsoft.Xna.Framework.Vector2
---@param point Microsoft.Xna.Framework.Vector2
---@return System.Single
_G['MathUtils'].LineToPointDistanceSquared = function(lineA, lineB, point) end

---`Method Public Static`
---@overload fun(lineA:Microsoft.Xna.Framework.Point, lineB:Microsoft.Xna.Framework.Point, point:Microsoft.Xna.Framework.Point):(System.Double)
---@param lineA Microsoft.Xna.Framework.Vector2
---@param lineB Microsoft.Xna.Framework.Vector2
---@param point Microsoft.Xna.Framework.Vector2
---@return System.Single
_G['MathUtils'].LineSegmentToPointDistanceSquared = function(lineA, lineB, point) end

---`Method Private Static`
---@param line1X System.Double
---@param line1Y System.Double
---@param line2X System.Double
---@param line2Y System.Double
---@param pointX System.Double
---@param pointY System.Double
---@return System.Double
_G['MathUtils'].LineSegmentToPointDistanceSquared = function(line1X, line1Y, line2X, line2Y, pointX, pointY) end

---`Method Public Static`
---@param lineA Microsoft.Xna.Framework.Vector2
---@param lineB Microsoft.Xna.Framework.Vector2
---@param point Microsoft.Xna.Framework.Vector2
---@return Microsoft.Xna.Framework.Vector2
_G['MathUtils'].GetClosestPointOnLineSegment = function(lineA, lineB, point) end

---`Method Public Static`
---@param circlePos Microsoft.Xna.Framework.Vector2
---@param radius System.Single
---@param rect Microsoft.Xna.Framework.Rectangle
---@return System.Boolean
_G['MathUtils'].CircleIntersectsRectangle = function(circlePos, radius, rect) end

---`Method Public Static`
---@param center Microsoft.Xna.Framework.Vector2
---@param radius System.Single
---@param angle System.Single
---@return Microsoft.Xna.Framework.Vector2
_G['MathUtils'].GetPointOnCircumference = function(center, radius, angle) end

---`Method Public Static`
---@param center Microsoft.Xna.Framework.Vector2
---@param radius System.Single
---@param points System.Int32
---@param firstAngle? System.Single
---@return (Microsoft.Xna.Framework.Vector2-arr)|(Microsoft.Xna.Framework.Vector2[])
_G['MathUtils'].GetPointsOnCircumference = function(center, radius, points, firstAngle) end

---`Method Public Static`
---@param vertices (System.Collections.Generic.List*1Microsoft*Xna*Framework*Vector2)|(Microsoft.Xna.Framework.Vector2[])
---@param center Microsoft.Xna.Framework.Vector2
---@return (System.Collections.Generic.List*1Microsoft*Xna*Framework*Vector2-arr)|((Microsoft.Xna.Framework.Vector2-arr)|(Microsoft.Xna.Framework.Vector2[])[])
_G['MathUtils'].TriangulateConvexHull = function(vertices, center) end

---`Method Public Static`
---@param points (System.Collections.Generic.List*1Microsoft*Xna*Framework*Vector2)|(Microsoft.Xna.Framework.Vector2[])
---@return (System.Collections.Generic.List*1Microsoft*Xna*Framework*Vector2)|(Microsoft.Xna.Framework.Vector2[])
_G['MathUtils'].GiftWrap = function(points) end

---`Method Public Static`
---@param start Microsoft.Xna.Framework.Vector2
---@param luaKey__end Microsoft.Xna.Framework.Vector2
---@param iterations System.Int32
---@param offsetAmount System.Single
---@param rng System.Random
---@param bounds? System.Nullable*1Microsoft*Xna*Framework*Rectangle
---@return (System.Collections.Generic.List*1Microsoft*Xna*Framework*Vector2-arr)|((Microsoft.Xna.Framework.Vector2-arr)|(Microsoft.Xna.Framework.Vector2[])[])
_G['MathUtils'].GenerateJaggedLine = function(start, luaKey__end, iterations, offsetAmount, rng, bounds) end

---`Method Public Static`
---@param i System.Int64
---@return System.String
_G['MathUtils'].GetBytesReadable = function(i) end

---`Method Public Static`
---@param rects (System.Collections.Generic.List*1Microsoft*Xna*Framework*Rectangle)|(Microsoft.Xna.Framework.Rectangle[])
---@param point Microsoft.Xna.Framework.Vector2
_G['MathUtils'].SplitRectanglesHorizontal = function(rects, point) end

---`Method Public Static`
---@param rects (System.Collections.Generic.List*1Microsoft*Xna*Framework*Rectangle)|(Microsoft.Xna.Framework.Rectangle[])
---@param point Microsoft.Xna.Framework.Vector2
_G['MathUtils'].SplitRectanglesVertical = function(rects, point) end

---`Method Public Static`
---@overload fun(a:System.Single, b:System.Single, epsilon?:System.Single):(System.Boolean)
---@param a Microsoft.Xna.Framework.Vector2
---@param b Microsoft.Xna.Framework.Vector2
---@param epsilon? System.Single
---@return System.Boolean
_G['MathUtils'].NearlyEqual = function(a, b, epsilon) end

---`Method Public Static`
---@param start Microsoft.Xna.Framework.Vector2
---@param control Microsoft.Xna.Framework.Vector2
---@param luaKey__end Microsoft.Xna.Framework.Vector2
---@param t System.Single
---@return Microsoft.Xna.Framework.Vector2
_G['MathUtils'].Bezier = function(start, control, luaKey__end, t) end

---`Method Public Static`
---@param f System.Single
---@param p System.Single
---@return System.Single
_G['MathUtils'].Pow = function(f, p) end

---`Method Public Static`
---@param f System.Single
---@return System.Single
_G['MathUtils'].Pow2 = function(f) end

---`Method Public Static`
---@param alignment Barotrauma.Alignment
---@return Microsoft.Xna.Framework.Vector2
_G['MathUtils'].ToVector2 = function(alignment) end

---`Method Public Static`
---@param point Microsoft.Xna.Framework.Vector2
---@param target Microsoft.Xna.Framework.Vector2
---@param radians System.Single
---@param clockWise? System.Boolean
---@return Microsoft.Xna.Framework.Vector2
_G['MathUtils'].RotatePointAroundTarget = function(point, target, radians, clockWise) end

---`Method Public Static`
---@param point Microsoft.Xna.Framework.Vector2
---@param radians System.Single
---@return Microsoft.Xna.Framework.Vector2
_G['MathUtils'].RotatePoint = function(point, radians) end

---`Method Public Static`
---@overload fun(up:Microsoft.Xna.Framework.Vector2, center:Microsoft.Xna.Framework.Vector2, size:Microsoft.Xna.Framework.Vector2):((Microsoft.Xna.Framework.Vector2-arr)|(Microsoft.Xna.Framework.Vector2[]))
---@param corners (Microsoft.Xna.Framework.Vector2-arr)|(Microsoft.Xna.Framework.Vector2[])
---@param up Microsoft.Xna.Framework.Vector2
---@param center Microsoft.Xna.Framework.Vector2
---@param size Microsoft.Xna.Framework.Vector2
---@return (Microsoft.Xna.Framework.Vector2-arr)|(Microsoft.Xna.Framework.Vector2[])
_G['MathUtils'].GetImaginaryRect = function(corners, up, center, size) end

---`Method Public Static`
---@overload fun(corners:(Microsoft.Xna.Framework.Vector2-arr)|(Microsoft.Xna.Framework.Vector2[]), point:Microsoft.Xna.Framework.Vector2):(System.Boolean)
---@param c1 Microsoft.Xna.Framework.Vector2
---@param c2 Microsoft.Xna.Framework.Vector2
---@param c3 Microsoft.Xna.Framework.Vector2
---@param c4 Microsoft.Xna.Framework.Vector2
---@param point Microsoft.Xna.Framework.Vector2
---@return System.Boolean
_G['MathUtils'].RectangleContainsPoint = function(c1, c2, c3, c4, point) end

---`Method Public Static`
---@param c1 Microsoft.Xna.Framework.Vector2
---@param c2 Microsoft.Xna.Framework.Vector2
---@param c3 Microsoft.Xna.Framework.Vector2
---@param point Microsoft.Xna.Framework.Vector2
---@return System.Boolean
_G['MathUtils'].TriangleContainsPoint = function(c1, c2, c3, point) end

---`Method Public Static`
---@param min System.Single
---@param max System.Single
---@param v System.Single
---@return System.Single
_G['MathUtils'].InverseLerp = function(min, max, v) end

---`Method Public Static`
---@param ... System.Single
---@return System.Single
_G['MathUtils'].Min = function(...) end

---`Method Public Static`
---@param ... System.Single
---@return System.Single
_G['MathUtils'].Max = function(...) end

---`Method Public Static`
---@param val System.UInt32
---@return System.UInt32
_G['MathUtils'].RoundUpToPowerOfTwo = function(val) end

---`Method Public Static`
---@param sourceArray (Microsoft.Xna.Framework.Vector2[,])|(Microsoft.Xna.Framework.Vector2[])
---@param newWidth System.Int32
---@param newHeight System.Int32
---@return (Microsoft.Xna.Framework.Vector2[,])|(Microsoft.Xna.Framework.Vector2[])
_G['MathUtils'].ResizeVector2Array = function(sourceArray, newWidth, newHeight) end

