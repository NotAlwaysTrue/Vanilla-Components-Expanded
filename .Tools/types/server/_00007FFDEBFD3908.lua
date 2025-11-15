---@meta
---@class Barotrauma.PhysicsBody : System.Object
---`Field NonPublic Instance`
---@field prevPosition Microsoft.Xna.Framework.Vector2
---`Field NonPublic Instance`
---@field prevRotation System.Single
---`Field NonPublic Instance`
---@field targetPosition System.Nullable*1Microsoft*Xna*Framework*Vector2
---`Field NonPublic Instance`
---@field targetRotation System.Nullable*1System*Single
---`Field Private Instance`
---@field drawPosition Microsoft.Xna.Framework.Vector2
---`Field Private Instance`
---@field drawRotation System.Single
---`Field Private Instance`
---@field bodyShape Barotrauma.PhysicsBody.Shape
---`Field Private Instance`
---@field density System.Single
---`Field Private Instance`
---@field dir System.Single
---`Field Private Instance`
---@field drawOffset Microsoft.Xna.Framework.Vector2
---`Field Private Instance`
---@field rotationOffset System.Single
---`Field Private Instance`
---@field lastProcessedNetworkState System.Single
---`Field Public Instance`
---@field PositionSmoothingFactor System.Nullable*1System*Single
---`Field Public Instance`
---@field Submarine Barotrauma.Submarine
---`Field Private Instance`
---@field isEnabled System.Boolean
---`Field Private Instance`
---@field isPhysEnabled System.Boolean
---`Field Private Instance`
---@field _collisionCategories FarseerPhysics.Dynamics.Category
---`Field Private Instance`
---@field _collidesWith FarseerPhysics.Dynamics.Category
---`Field Private Instance`
---@field _suppressSmoothRotationCalls System.Boolean
---`Field Private Instance`
---@field smoothRotationSuppressionCounter System.Int32
---`Field Private Static`
---@field list (System.Collections.Generic.List*1Barotrauma*PhysicsBody)|(Barotrauma.PhysicsBody[])
---`Field Public Static`
---@field MinDensity System.Single
---`Field Public Static`
---@field DefaultAngularDamping System.Single
---`Getter Public Static`
---@field List (System.Collections.Generic.List*1Barotrauma*PhysicsBody)|(Barotrauma.PhysicsBody[])
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field Removed System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field LastSentPosition Microsoft.Xna.Framework.Vector2
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field Height System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field Width System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field Radius System.Single
---`Getter Public Instance`
---@field BodyShape Barotrauma.PhysicsBody.Shape
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field TargetPosition System.Nullable*1Microsoft*Xna*Framework*Vector2
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field TargetRotation System.Nullable*1System*Single
---`Getter Public Instance`
---@field DrawPosition Microsoft.Xna.Framework.Vector2
---`Getter Public Instance`
---@field DrawRotation System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Dir System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Enabled System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field PhysEnabled System.Boolean
---`Getter Public Instance`
---@field SimPosition Microsoft.Xna.Framework.Vector2
---`Getter Public Instance`
---@field Position Microsoft.Xna.Framework.Vector2
---`Getter Public Instance`
---@field DrawPositionOffset Microsoft.Xna.Framework.Vector2
---`Getter Public Instance`
---@field PrevPosition Microsoft.Xna.Framework.Vector2
---`Getter Public Instance`
---@field Rotation System.Single
---`Getter Public Instance`
---@field TransformedRotation System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field LinearVelocity Microsoft.Xna.Framework.Vector2
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field AngularVelocity System.Single
---`Getter Public Instance`
---@field Mass System.Single
---`Getter Public Instance`
---@field Density System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field FarseerBody FarseerPhysics.Dynamics.Body
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field UserData System.Object
---<br/>`Setter Public Instance`
---@field Friction System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field BodyType FarseerPhysics.BodyType
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field CollisionCategories FarseerPhysics.Dynamics.Category
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field CollidesWith FarseerPhysics.Dynamics.Category
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field SuppressSmoothRotationCalls System.Boolean
_G['PhysicsBody'] = {}

---`Method Public Instance`
---@param msg Barotrauma.Networking.IWriteMessage
_G['PhysicsBody'].ServerWrite = function(msg) end

---`Method Public Instance`
---@param rotation System.Single
---@return System.Single
_G['PhysicsBody'].TransformRotation = function(rotation) end

---`Method Public Static`
---@param rot System.Single
---@param dir System.Single
---@return System.Single
_G['PhysicsBody'].TransformRotation = function(rot, dir) end

---`Method Private Instance`
---@param width System.Single
---@param height System.Single
---@param radius System.Single
---@param density System.Single
---@param bodyType FarseerPhysics.BodyType
---@param collisionCategory FarseerPhysics.Dynamics.Category
---@param collidesWith FarseerPhysics.Dynamics.Category
---@param findNewContacts? System.Boolean
_G['PhysicsBody'].CreateBody = function(width, height, radius, density, bodyType, collisionCategory, collidesWith, findNewContacts) end

---`Method Public Instance`
---@param spritesheetRotation? System.Nullable*1System*Single
---@return Microsoft.Xna.Framework.Vector2
_G['PhysicsBody'].GetLocalFront = function(spritesheetRotation) end

---`Method Public Instance`
---@return System.Single
_G['PhysicsBody'].GetMaxExtent = function() end

---`Method Public Instance`
---@return Microsoft.Xna.Framework.Vector2
_G['PhysicsBody'].GetSize = function() end

---`Method Public Instance`
---@param size Microsoft.Xna.Framework.Vector2
_G['PhysicsBody'].SetSize = function(size) end

---`Method Public Instance`
---@param value System.Single
---@param valueName System.String
---@param minValue? System.Single
---@param maxValue? System.Single
---@return System.Boolean
_G['PhysicsBody'].IsValidValue = function(value, valueName, minValue, maxValue) end

---`Method Private Instance`
---@param value Microsoft.Xna.Framework.Vector2
---@param valueName System.String
---@param minValue? System.Single
---@param maxValue? System.Single
---@return System.Boolean
_G['PhysicsBody'].IsValidValue = function(value, valueName, minValue, maxValue) end

---`Method Public Instance`
_G['PhysicsBody'].ResetDynamics = function() end

---`Method Public Instance`
---@overload fun(impulse:Microsoft.Xna.Framework.Vector2)
---@overload fun(impulse:Microsoft.Xna.Framework.Vector2, maxVelocity:System.Single)
---@overload fun(impulse:Microsoft.Xna.Framework.Vector2, point:Microsoft.Xna.Framework.Vector2)
---@param impulse Microsoft.Xna.Framework.Vector2
---@param point Microsoft.Xna.Framework.Vector2
---@param maxVelocity System.Single
_G['PhysicsBody'].ApplyLinearImpulse = function(impulse, point, maxVelocity) end

---`Method Public Instance`
---@overload fun(force:Microsoft.Xna.Framework.Vector2, maxVelocity?:System.Single)
---@param force Microsoft.Xna.Framework.Vector2
---@param point Microsoft.Xna.Framework.Vector2
_G['PhysicsBody'].ApplyForce = function(force, point) end

---`Method Public Instance`
---@param torque System.Single
_G['PhysicsBody'].ApplyTorque = function(torque) end

---`Method Public Instance`
---@param simPosition Microsoft.Xna.Framework.Vector2
---@param rotation System.Single
---@param setPrevTransform? System.Boolean
---@return System.Boolean
_G['PhysicsBody'].SetTransform = function(simPosition, rotation, setPrevTransform) end

---`Method Public Instance`
---@param simPosition Microsoft.Xna.Framework.Vector2
---@param rotation System.Single
---@param setPrevTransform? System.Boolean
---@return System.Boolean
_G['PhysicsBody'].SetTransformIgnoreContacts = function(simPosition, rotation, setPrevTransform) end

---`Method Public Instance`
---@param simPosition Microsoft.Xna.Framework.Vector2
---@param rotation System.Single
_G['PhysicsBody'].SetPrevTransform = function(simPosition, rotation) end

---`Method Public Instance`
---@param lerp? System.Boolean
_G['PhysicsBody'].MoveToTargetPosition = function(lerp) end

---`Method Public Instance`
---@param simPosition Microsoft.Xna.Framework.Vector2
---@param force System.Single
---@param pullPos? System.Nullable*1Microsoft*Xna*Framework*Vector2
_G['PhysicsBody'].MoveToPos = function(simPosition, force, pullPos) end

---`Method Public Instance`
_G['PhysicsBody'].ApplyWaterForces = function() end

---`Method Public Instance`
_G['PhysicsBody'].Update = function() end

---`Method Public Instance`
---@param interpolate? System.Boolean
_G['PhysicsBody'].UpdateDrawPosition = function(interpolate) end

---`Method Public Instance`
---@param positionBuffer (System.Collections.Generic.List*1Barotrauma*PhysicsBody*T)|(Barotrauma.PhysicsBody.T[])
---@param newPosition Microsoft.Xna.Framework.Vector2-ref
---@param newVelocity Microsoft.Xna.Framework.Vector2-ref
---@param newRotation System.Single-ref
---@param newAngularVelocity System.Single-ref
_G['PhysicsBody'].CorrectPosition = function(positionBuffer, newPosition, newVelocity, newRotation, newAngularVelocity) end

---`Method Public Instance`
---@param targetRotation System.Single
---@param force? System.Single
---@param wrapAngle? System.Boolean
_G['PhysicsBody'].SmoothRotate = function(targetRotation, force, wrapAngle) end

---`Method Public Instance`
---@param angle System.Single
---@return System.Single
_G['PhysicsBody'].WrapAngleToSameNumberOfRevolutions = function(angle) end

---`Method Public Instance`
_G['PhysicsBody'].Remove = function() end

---`Method Public Static`
_G['PhysicsBody'].RemoveAll = function() end

---`Method Public Static`
---@param radius System.Single
---@param height System.Single
---@param width System.Single
---@return System.Boolean
_G['PhysicsBody'].IsValidShape = function(radius, height, width) end

---`Method Public Static`
---@param radius System.Single
---@param width System.Single
---@param height System.Single
---@return Barotrauma.PhysicsBody.Shape
_G['PhysicsBody'].DefineBodyShape = function(radius, width, height) end

---`Constructor Public Instance`
---@overload fun(element:System.Xml.Linq.XElement, scale?:System.Single, findNewContacts?:System.Boolean):Barotrauma.PhysicsBody
---@overload fun(cParams:Barotrauma.RagdollParams.ColliderParams, findNewContacts?:System.Boolean):Barotrauma.PhysicsBody
---@overload fun(lParams:Barotrauma.RagdollParams.LimbParams, findNewContacts?:System.Boolean):Barotrauma.PhysicsBody
---@overload fun(width:System.Single, height:System.Single, radius:System.Single, density:System.Single, bodyType:FarseerPhysics.BodyType, collisionCategory:FarseerPhysics.Dynamics.Category, collidesWith:FarseerPhysics.Dynamics.Category, findNewContacts?:System.Boolean):Barotrauma.PhysicsBody
---@overload fun(farseerBody:FarseerPhysics.Dynamics.Body):Barotrauma.PhysicsBody
---@overload fun(colliderParams:Barotrauma.RagdollParams.ColliderParams, position:Microsoft.Xna.Framework.Vector2, findNewContacts?:System.Boolean):Barotrauma.PhysicsBody
---@overload fun(limbParams:Barotrauma.RagdollParams.LimbParams, position:Microsoft.Xna.Framework.Vector2, findNewContacts?:System.Boolean):Barotrauma.PhysicsBody
---@overload fun(element:System.Xml.Linq.XElement, position:Microsoft.Xna.Framework.Vector2, scale?:System.Single, forceDensity?:System.Nullable*1System*Single, collisionCategory?:FarseerPhysics.Dynamics.Category, collidesWith?:FarseerPhysics.Dynamics.Category, findNewContacts?:System.Boolean):Barotrauma.PhysicsBody
---@return Barotrauma.PhysicsBody
_G['PhysicsBody'] = function() end

---`Constructor Public Instance`
---@overload fun(element:System.Xml.Linq.XElement, scale?:System.Single, findNewContacts?:System.Boolean):Barotrauma.PhysicsBody
---@overload fun(cParams:Barotrauma.RagdollParams.ColliderParams, findNewContacts?:System.Boolean):Barotrauma.PhysicsBody
---@overload fun(lParams:Barotrauma.RagdollParams.LimbParams, findNewContacts?:System.Boolean):Barotrauma.PhysicsBody
---@overload fun(width:System.Single, height:System.Single, radius:System.Single, density:System.Single, bodyType:FarseerPhysics.BodyType, collisionCategory:FarseerPhysics.Dynamics.Category, collidesWith:FarseerPhysics.Dynamics.Category, findNewContacts?:System.Boolean):Barotrauma.PhysicsBody
---@overload fun(farseerBody:FarseerPhysics.Dynamics.Body):Barotrauma.PhysicsBody
---@overload fun(colliderParams:Barotrauma.RagdollParams.ColliderParams, position:Microsoft.Xna.Framework.Vector2, findNewContacts?:System.Boolean):Barotrauma.PhysicsBody
---@overload fun(limbParams:Barotrauma.RagdollParams.LimbParams, position:Microsoft.Xna.Framework.Vector2, findNewContacts?:System.Boolean):Barotrauma.PhysicsBody
---@overload fun(element:System.Xml.Linq.XElement, position:Microsoft.Xna.Framework.Vector2, scale?:System.Single, forceDensity?:System.Nullable*1System*Single, collisionCategory?:FarseerPhysics.Dynamics.Category, collidesWith?:FarseerPhysics.Dynamics.Category, findNewContacts?:System.Boolean):Barotrauma.PhysicsBody
---@return Barotrauma.PhysicsBody
_G['PhysicsBody'].__new = function() end

---`Constructor Private Static`
---@overload fun(element:System.Xml.Linq.XElement, scale?:System.Single, findNewContacts?:System.Boolean):Barotrauma.PhysicsBody
---@overload fun(cParams:Barotrauma.RagdollParams.ColliderParams, findNewContacts?:System.Boolean):Barotrauma.PhysicsBody
---@overload fun(lParams:Barotrauma.RagdollParams.LimbParams, findNewContacts?:System.Boolean):Barotrauma.PhysicsBody
---@overload fun(width:System.Single, height:System.Single, radius:System.Single, density:System.Single, bodyType:FarseerPhysics.BodyType, collisionCategory:FarseerPhysics.Dynamics.Category, collidesWith:FarseerPhysics.Dynamics.Category, findNewContacts?:System.Boolean):Barotrauma.PhysicsBody
---@overload fun(farseerBody:FarseerPhysics.Dynamics.Body):Barotrauma.PhysicsBody
---@overload fun(colliderParams:Barotrauma.RagdollParams.ColliderParams, position:Microsoft.Xna.Framework.Vector2, findNewContacts?:System.Boolean):Barotrauma.PhysicsBody
---@overload fun(limbParams:Barotrauma.RagdollParams.LimbParams, position:Microsoft.Xna.Framework.Vector2, findNewContacts?:System.Boolean):Barotrauma.PhysicsBody
---@overload fun(element:System.Xml.Linq.XElement, position:Microsoft.Xna.Framework.Vector2, scale?:System.Single, forceDensity?:System.Nullable*1System*Single, collisionCategory?:FarseerPhysics.Dynamics.Category, collidesWith?:FarseerPhysics.Dynamics.Category, findNewContacts?:System.Boolean):Barotrauma.PhysicsBody
---@return Barotrauma.PhysicsBody
_G['PhysicsBody'] = function() end

---`Constructor Private Static`
---@overload fun(element:System.Xml.Linq.XElement, scale?:System.Single, findNewContacts?:System.Boolean):Barotrauma.PhysicsBody
---@overload fun(cParams:Barotrauma.RagdollParams.ColliderParams, findNewContacts?:System.Boolean):Barotrauma.PhysicsBody
---@overload fun(lParams:Barotrauma.RagdollParams.LimbParams, findNewContacts?:System.Boolean):Barotrauma.PhysicsBody
---@overload fun(width:System.Single, height:System.Single, radius:System.Single, density:System.Single, bodyType:FarseerPhysics.BodyType, collisionCategory:FarseerPhysics.Dynamics.Category, collidesWith:FarseerPhysics.Dynamics.Category, findNewContacts?:System.Boolean):Barotrauma.PhysicsBody
---@overload fun(farseerBody:FarseerPhysics.Dynamics.Body):Barotrauma.PhysicsBody
---@overload fun(colliderParams:Barotrauma.RagdollParams.ColliderParams, position:Microsoft.Xna.Framework.Vector2, findNewContacts?:System.Boolean):Barotrauma.PhysicsBody
---@overload fun(limbParams:Barotrauma.RagdollParams.LimbParams, position:Microsoft.Xna.Framework.Vector2, findNewContacts?:System.Boolean):Barotrauma.PhysicsBody
---@overload fun(element:System.Xml.Linq.XElement, position:Microsoft.Xna.Framework.Vector2, scale?:System.Single, forceDensity?:System.Nullable*1System*Single, collisionCategory?:FarseerPhysics.Dynamics.Category, collidesWith?:FarseerPhysics.Dynamics.Category, findNewContacts?:System.Boolean):Barotrauma.PhysicsBody
---@return Barotrauma.PhysicsBody
_G['PhysicsBody'].__new = function() end

