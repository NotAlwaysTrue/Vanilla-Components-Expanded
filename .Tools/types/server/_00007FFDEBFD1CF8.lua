---@meta
---@class FarseerPhysics.Collision.Collision : System.Object
_G['FarseerPhysics']['Collision']['Collision'] = {}

---`Method Public Static`
---@param shapeA FarseerPhysics.Collision.Shapes.Shape
---@param indexA System.Int32
---@param shapeB FarseerPhysics.Collision.Shapes.Shape
---@param indexB System.Int32
---@param xfA FarseerPhysics.Common.Transform-ref
---@param xfB FarseerPhysics.Common.Transform-ref
---@return System.Boolean
_G['FarseerPhysics']['Collision']['Collision'].TestOverlap = function(shapeA, indexA, shapeB, indexB, xfA, xfB) end

---`Method Public Static`
---@param state1 FarseerPhysics.Common.FixedArray2
---@param state2 FarseerPhysics.Common.FixedArray2
---@param manifold1 FarseerPhysics.Collision.Manifold-ref
---@param manifold2 FarseerPhysics.Collision.Manifold-ref
_G['FarseerPhysics']['Collision']['Collision'].GetPointStates = function(state1, state2, manifold1, manifold2) end

---`Method Public Static`
---@param manifold FarseerPhysics.Collision.Manifold-ref
---@param circleA FarseerPhysics.Collision.Shapes.CircleShape
---@param xfA FarseerPhysics.Common.Transform-ref
---@param circleB FarseerPhysics.Collision.Shapes.CircleShape
---@param xfB FarseerPhysics.Common.Transform-ref
_G['FarseerPhysics']['Collision']['Collision'].CollideCircles = function(manifold, circleA, xfA, circleB, xfB) end

---`Method Public Static`
---@param manifold FarseerPhysics.Collision.Manifold-ref
---@param polygonA FarseerPhysics.Collision.Shapes.PolygonShape
---@param xfA FarseerPhysics.Common.Transform-ref
---@param circleB FarseerPhysics.Collision.Shapes.CircleShape
---@param xfB FarseerPhysics.Common.Transform-ref
_G['FarseerPhysics']['Collision']['Collision'].CollidePolygonAndCircle = function(manifold, polygonA, xfA, circleB, xfB) end

---`Method Public Static`
---@param manifold FarseerPhysics.Collision.Manifold-ref
---@param polyA FarseerPhysics.Collision.Shapes.PolygonShape
---@param transformA FarseerPhysics.Common.Transform-ref
---@param polyB FarseerPhysics.Collision.Shapes.PolygonShape
---@param transformB FarseerPhysics.Common.Transform-ref
_G['FarseerPhysics']['Collision']['Collision'].CollidePolygons = function(manifold, polyA, transformA, polyB, transformB) end

---`Method Public Static`
---@param manifold FarseerPhysics.Collision.Manifold-ref
---@param edgeA FarseerPhysics.Collision.Shapes.EdgeShape
---@param transformA FarseerPhysics.Common.Transform-ref
---@param circleB FarseerPhysics.Collision.Shapes.CircleShape
---@param transformB FarseerPhysics.Common.Transform-ref
_G['FarseerPhysics']['Collision']['Collision'].CollideEdgeAndCircle = function(manifold, edgeA, transformA, circleB, transformB) end

---`Method Public Static`
---@param manifold FarseerPhysics.Collision.Manifold-ref
---@param edgeA FarseerPhysics.Collision.Shapes.EdgeShape
---@param xfA FarseerPhysics.Common.Transform-ref
---@param polygonB FarseerPhysics.Collision.Shapes.PolygonShape
---@param xfB FarseerPhysics.Common.Transform-ref
_G['FarseerPhysics']['Collision']['Collision'].CollideEdgeAndPolygon = function(manifold, edgeA, xfA, polygonB, xfB) end

---`Method Private Static`
---@param vOut FarseerPhysics.Common.FixedArray2
---@param vIn FarseerPhysics.Common.FixedArray2
---@param normal Microsoft.Xna.Framework.Vector2
---@param offset System.Single
---@param vertexIndexA System.Int32
---@return System.Int32
_G['FarseerPhysics']['Collision']['Collision'].ClipSegmentToLine = function(vOut, vIn, normal, offset, vertexIndexA) end

---`Method Private Static`
---@param poly1 FarseerPhysics.Collision.Shapes.PolygonShape
---@param xf1To2 FarseerPhysics.Common.Transform-ref
---@param edge1 System.Int32
---@param poly2 FarseerPhysics.Collision.Shapes.PolygonShape
---@return System.Single
_G['FarseerPhysics']['Collision']['Collision'].EdgeSeparation = function(poly1, xf1To2, edge1, poly2) end

---`Method Private Static`
---@param edgeIndex System.Int32-ref
---@param poly1 FarseerPhysics.Collision.Shapes.PolygonShape
---@param xf1 FarseerPhysics.Common.Transform-ref
---@param poly2 FarseerPhysics.Collision.Shapes.PolygonShape
---@param xf2 FarseerPhysics.Common.Transform-ref
---@return System.Single
_G['FarseerPhysics']['Collision']['Collision'].FindMaxSeparation = function(edgeIndex, poly1, xf1, poly2, xf2) end

---`Method Private Static`
---@param c FarseerPhysics.Common.FixedArray2
---@param poly1 FarseerPhysics.Collision.Shapes.PolygonShape
---@param xf1 FarseerPhysics.Common.Transform-ref
---@param edge1 System.Int32
---@param poly2 FarseerPhysics.Collision.Shapes.PolygonShape
---@param xf2 FarseerPhysics.Common.Transform-ref
_G['FarseerPhysics']['Collision']['Collision'].FindIncidentEdge = function(c, poly1, xf1, edge1, poly2, xf2) end

