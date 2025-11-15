---@meta
---@class Barotrauma.Physics : System.Object
---`Field Public Static`
---@field DisplayToRealWorldRatio System.Single
---`Field Public Static`
---@field CollisionNone FarseerPhysics.Dynamics.Category
---`Field Public Static`
---@field CollisionAll FarseerPhysics.Dynamics.Category
---`Field Public Static`
---@field CollisionWall FarseerPhysics.Dynamics.Category
---`Field Public Static`
---@field CollisionCharacter FarseerPhysics.Dynamics.Category
---`Field Public Static`
---@field CollisionPlatform FarseerPhysics.Dynamics.Category
---`Field Public Static`
---@field CollisionStairs FarseerPhysics.Dynamics.Category
---`Field Public Static`
---@field CollisionItem FarseerPhysics.Dynamics.Category
---`Field Public Static`
---@field CollisionItemBlocking FarseerPhysics.Dynamics.Category
---`Field Public Static`
---@field CollisionProjectile FarseerPhysics.Dynamics.Category
---`Field Public Static`
---@field CollisionLevel FarseerPhysics.Dynamics.Category
---`Field Public Static`
---@field CollisionRepairableWall FarseerPhysics.Dynamics.Category
---`Field Public Static`
---@field CollisionLagCompensationBody FarseerPhysics.Dynamics.Category
---`Field Public Static`
---@field DefaultItemCollidesWith FarseerPhysics.Dynamics.Category
---`Field Public Static`
---@field DisplayToSimRation System.Single
---`Field Public Static`
---@field NeutralDensity System.Single
_G['Physics'] = {}

---`Method Public Static`
---@param categoryName System.String
---@param category FarseerPhysics.Dynamics.Category-ref
---@return System.Boolean
_G['Physics'].TryParseCollisionCategory = function(categoryName, category) end

---`Constructor Private Static`
---@return Barotrauma.Physics
_G['Physics'] = function() end

---`Constructor Private Static`
---@return Barotrauma.Physics
_G['Physics'].__new = function() end

