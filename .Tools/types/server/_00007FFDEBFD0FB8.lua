---@meta
---@class FarseerPhysics.Collision.AABB : System.ValueType
---`Field Public Instance`
---@field LowerBound Microsoft.Xna.Framework.Vector2
---`Field Public Instance`
---@field UpperBound Microsoft.Xna.Framework.Vector2
---`Getter Public Instance`
---@field Width System.Single
---`Getter Public Instance`
---@field Height System.Single
---`Getter Public Instance`
---@field Center Microsoft.Xna.Framework.Vector2
---`Getter Public Instance`
---@field Extents Microsoft.Xna.Framework.Vector2
---`Getter Public Instance`
---@field Perimeter System.Single
---`Getter Public Instance`
---@field Vertices FarseerPhysics.Common.Vertices
---`Getter Public Instance`
---@field Q1 FarseerPhysics.Collision.AABB
---`Getter Public Instance`
---@field Q2 FarseerPhysics.Collision.AABB
---`Getter Public Instance`
---@field Q3 FarseerPhysics.Collision.AABB
---`Getter Public Instance`
---@field Q4 FarseerPhysics.Collision.AABB
_G['FarseerPhysics']['Collision']['AABB'] = {}

---`Method Public Instance`
---@return System.Boolean
_G['FarseerPhysics']['Collision']['AABB'].IsValid = function() end

---`Method Public Instance`
---@overload fun(aabb:FarseerPhysics.Collision.AABB-ref)
---@param aabb1 FarseerPhysics.Collision.AABB-ref
---@param aabb2 FarseerPhysics.Collision.AABB-ref
_G['FarseerPhysics']['Collision']['AABB'].Combine = function(aabb1, aabb2) end

---`Method Public Instance`
---@overload fun(aabb:FarseerPhysics.Collision.AABB-ref):(System.Boolean)
---@param point Microsoft.Xna.Framework.Vector2-ref
---@return System.Boolean
_G['FarseerPhysics']['Collision']['AABB'].Contains = function(point) end

---`Method Public Static`
---@param a FarseerPhysics.Collision.AABB-ref
---@param b FarseerPhysics.Collision.AABB-ref
---@return System.Boolean
_G['FarseerPhysics']['Collision']['AABB'].TestOverlap = function(a, b) end

---`Method Public Instance`
---@param output FarseerPhysics.Collision.RayCastOutput-ref
---@param input FarseerPhysics.Collision.RayCastInput-ref
---@param doInteriorCheck? System.Boolean
---@return System.Boolean
_G['FarseerPhysics']['Collision']['AABB'].RayCast = function(output, input, doInteriorCheck) end

---`Constructor Public Instance`
---@overload fun(min:Microsoft.Xna.Framework.Vector2, max:Microsoft.Xna.Framework.Vector2):FarseerPhysics.Collision.AABB
---@overload fun(min:Microsoft.Xna.Framework.Vector2-ref, max:Microsoft.Xna.Framework.Vector2-ref):FarseerPhysics.Collision.AABB
---@param center Microsoft.Xna.Framework.Vector2
---@param width System.Single
---@param height System.Single
---@return FarseerPhysics.Collision.AABB
_G['FarseerPhysics']['Collision']['AABB'] = function(center, width, height) end

---`Constructor Public Instance`
---@overload fun(min:Microsoft.Xna.Framework.Vector2, max:Microsoft.Xna.Framework.Vector2):FarseerPhysics.Collision.AABB
---@overload fun(min:Microsoft.Xna.Framework.Vector2-ref, max:Microsoft.Xna.Framework.Vector2-ref):FarseerPhysics.Collision.AABB
---@param center Microsoft.Xna.Framework.Vector2
---@param width System.Single
---@param height System.Single
---@return FarseerPhysics.Collision.AABB
_G['FarseerPhysics']['Collision']['AABB'].__new = function(center, width, height) end

