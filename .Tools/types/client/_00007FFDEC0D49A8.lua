---@meta
---@class Barotrauma.LimbJoint : System.Object
---`Field Public Instance`
---@field IsSevered System.Boolean
---`Field Public Instance`
---@field Params Barotrauma.RagdollParams.JointParams
---`Field Public Instance`
---@field ragdoll Barotrauma.Ragdoll
---`Field Public Instance`
---@field LimbA Barotrauma.Limb
---`Field Public Instance`
---@field LimbB Barotrauma.Limb
---`Field Public Instance`
---@field revoluteJoint FarseerPhysics.Dynamics.Joints.RevoluteJoint
---`Field Public Instance`
---@field weldJoint FarseerPhysics.Dynamics.Joints.WeldJoint
---`Getter Public Instance`
---@field CanBeSevered System.Boolean
---`Getter Public Instance`
---@field Scale System.Single
---`Getter Public Instance`
---@field Joint FarseerPhysics.Dynamics.Joints.Joint
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Enabled System.Boolean
---`Getter Public Instance`
---@field BodyA FarseerPhysics.Dynamics.Body
---`Getter Public Instance`
---@field BodyB FarseerPhysics.Dynamics.Body
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field WorldAnchorA Microsoft.Xna.Framework.Vector2
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field WorldAnchorB Microsoft.Xna.Framework.Vector2
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field LocalAnchorA Microsoft.Xna.Framework.Vector2
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field LocalAnchorB Microsoft.Xna.Framework.Vector2
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field LimitEnabled System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field LowerLimit System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field UpperLimit System.Single
---`Getter Public Instance`
---@field JointAngle System.Single
_G['LimbJoint'] = {}

---`Method Public Instance`
---@param deltaTime System.Single
_G['LimbJoint'].UpdateDeformations = function(deltaTime) end

---`Method Public Instance`
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
_G['LimbJoint'].Draw = function(spriteBatch) end

---`Method Public Instance`
_G['LimbJoint'].LoadParams = function() end

---`Constructor Public Instance`
---@overload fun(limbA:Barotrauma.Limb, limbB:Barotrauma.Limb, jointParams:Barotrauma.RagdollParams.JointParams, ragdoll:Barotrauma.Ragdoll):Barotrauma.LimbJoint
---@param limbA Barotrauma.Limb
---@param limbB Barotrauma.Limb
---@param anchor1 Microsoft.Xna.Framework.Vector2
---@param anchor2 Microsoft.Xna.Framework.Vector2
---@param weld? System.Boolean
---@return Barotrauma.LimbJoint
_G['LimbJoint'] = function(limbA, limbB, anchor1, anchor2, weld) end

---`Constructor Public Instance`
---@overload fun(limbA:Barotrauma.Limb, limbB:Barotrauma.Limb, jointParams:Barotrauma.RagdollParams.JointParams, ragdoll:Barotrauma.Ragdoll):Barotrauma.LimbJoint
---@param limbA Barotrauma.Limb
---@param limbB Barotrauma.Limb
---@param anchor1 Microsoft.Xna.Framework.Vector2
---@param anchor2 Microsoft.Xna.Framework.Vector2
---@param weld? System.Boolean
---@return Barotrauma.LimbJoint
_G['LimbJoint'].__new = function(limbA, limbB, anchor1, anchor2, weld) end

