---@meta
---@class Barotrauma.Lights.LightSource : System.Object
---`Field Private Instance`
---@field vertices (Microsoft.Xna.Framework.Graphics.VertexPositionColorTexture-arr)|(Microsoft.Xna.Framework.Graphics.VertexPositionColorTexture[])
---`Field Private Instance`
---@field indices (System.Int16-arr)|(System.Int16[])
---`Field Private Instance`
---@field convexHullsInRange (System.Collections.Generic.List*1Barotrauma*Lights*ConvexHullList)|(Barotrauma.Lights.ConvexHullList[])
---`Field Private Instance`
---@field visibleConvexHulls (System.Collections.Generic.HashSet*1Barotrauma*Lights*ConvexHull)|(Barotrauma.Lights.ConvexHull[])
---`Field Public Instance`
---@field texture Microsoft.Xna.Framework.Graphics.Texture2D
---`Field Public Instance`
---@field LightSpriteEffect Microsoft.Xna.Framework.Graphics.SpriteEffects
---`Field Public Instance`
---@field ParentSub Barotrauma.Submarine
---`Field Private Instance`
---@field castShadows System.Boolean
---`Field Private Instance`
---@field prevCalculatedRange System.Single
---`Field Private Instance`
---@field prevCalculatedPosition Microsoft.Xna.Framework.Vector2
---`Field Public Instance`
---@field HullsUpToDate (System.Collections.Generic.HashSet*1Barotrauma*Submarine)|(Barotrauma.Submarine[])
---`Field Private Instance`
---@field needsRecalculation System.Boolean
---`Field Private Instance`
---@field needsRecalculationWhenUpToDate System.Boolean
---`Field Private Instance`
---@field state Barotrauma.Lights.LightSource.LightVertexState
---`Field Private Instance`
---@field calculatedDrawPos Microsoft.Xna.Framework.Vector2
---`Field Private Instance`
---@field diffToSub (System.Collections.Generic.Dictionary*1Barotrauma*Submarine*1Microsoft*Xna*Framework*Vector2)|({[Barotrauma.Submarine]:(Microsoft.Xna.Framework.Vector2)})
---`Field Private Instance`
---@field lightVolumeBuffer Microsoft.Xna.Framework.Graphics.DynamicVertexBuffer
---`Field Private Instance`
---@field lightVolumeIndexBuffer Microsoft.Xna.Framework.Graphics.DynamicIndexBuffer
---`Field Private Instance`
---@field vertexCount System.Int32
---`Field Private Instance`
---@field indexCount System.Int32
---`Field Private Instance`
---@field translateVertices Microsoft.Xna.Framework.Vector2
---`Field Private Instance`
---@field lightSourceParams Barotrauma.Lights.LightSourceParams
---`Field Private Instance`
---@field position Microsoft.Xna.Framework.Vector2
---`Field Private Instance`
---@field prevCalculatedRotation System.Single
---`Field Private Instance`
---@field rotation System.Single
---`Field Private Instance`
---@field dir Microsoft.Xna.Framework.Vector2
---`Field Private Instance`
---@field _spriteScale Microsoft.Xna.Framework.Vector2
---`Field Public Instance`
---@field Priority System.Single
---`Field Public Instance`
---@field PriorityMultiplier System.Single
---`Field Private Instance`
---@field lightTextureTargetSize Microsoft.Xna.Framework.Vector2
---`Field Public Instance`
---@field OffsetFromBody Microsoft.Xna.Framework.Vector2
---`Field Public Instance`
---@field Enabled System.Boolean
---`Field Private Instance`
---@field conditionalTarget Barotrauma.ISerializableEntity
---`Field Private Instance`
---@field logicalOperator Barotrauma.PropertyConditional.LogicalOperatorType
---`Field Private Instance`
---@field conditionals (System.Collections.Generic.List*1Barotrauma*PropertyConditional)|(Barotrauma.PropertyConditional[])
---`Field Private Instance`
---@field visibleSegments (System.Collections.Generic.List*1Barotrauma*Lights*Segment)|(Barotrauma.Lights.Segment[])
---`Field Private Instance`
---@field points (System.Collections.Generic.List*1Barotrauma*Lights*SegmentPoint)|(Barotrauma.Lights.SegmentPoint[])
---`Field Private Instance`
---@field verts (System.Collections.Generic.List*1Microsoft*Xna*Framework*Vector2)|(Microsoft.Xna.Framework.Vector2[])
---`Field Private Instance`
---@field boundaryCorners (Barotrauma.Lights.SegmentPoint-arr)|(Barotrauma.Lights.SegmentPoint[])
---`Field Private Static`
---@field lightTexture Microsoft.Xna.Framework.Graphics.Texture2D
---`Field Private Static`
---@field mutex System.Object
---`Field Private Static`
---@field MovementRecalculationThreshold System.Single
---`Field Private Static`
---@field RotationRecalculationThreshold System.Single
---`Field Private Static`
---@field MinPointDistance System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field CastShadows System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field NeedsRecalculation System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field LastRecalculationTime System.Single
---`Getter Public Instance`
---@field LightSourceParams Barotrauma.Lights.LightSourceParams
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Position Microsoft.Xna.Framework.Vector2
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Rotation System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field SpriteScale Microsoft.Xna.Framework.Vector2
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field OverrideLightSpriteAlpha System.Nullable*1System*Single
---`Getter Public Instance`
---@field WorldPosition Microsoft.Xna.Framework.Vector2
---`Getter Public Static`
---@field LightTexture Microsoft.Xna.Framework.Graphics.Texture2D
---`Getter Public Instance`
---@field OverrideLightTexture Barotrauma.Sprite
---`Getter Public Instance`
---@field LightSprite Barotrauma.Sprite
---`Getter Private Instance`
---@field OverrideLightTextureOrigin Microsoft.Xna.Framework.Vector2
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Color Microsoft.Xna.Framework.Color
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field CurrentBrightness System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Range System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field LightTextureTargetSize Microsoft.Xna.Framework.Vector2
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field LightTextureOffset Microsoft.Xna.Framework.Vector2
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field LightTextureScale Microsoft.Xna.Framework.Vector2
---`Getter Public Instance`
---@field TextureRange System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field IsBackground System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field ParentBody Barotrauma.PhysicsBody
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field DeformableLightSprite Barotrauma.DeformableSprite
_G['LightSource'] = {}

---`Method Public Instance`
---@param time System.Single
_G['LightSource'].Update = function(time) end

---`Method Private Instance`
---@param chList Barotrauma.Lights.ConvexHullList
---@param lightPos Microsoft.Xna.Framework.Vector2
---@param sub Barotrauma.Submarine
_G['LightSource'].RefreshConvexHullList = function(chList, lightPos, sub) end

---`Method Private Instance`
_G['LightSource'].CheckConvexHullsInRange = function() end

---`Method Private Instance`
---@param sub Barotrauma.Submarine
_G['LightSource'].CheckHullsInRange = function(sub) end

---`Method Private Instance`
_G['LightSource'].FindRaycastHits = function() end

---`Method Public Instance`
---@param drawPos Microsoft.Xna.Framework.Vector2
---@param rotation System.Single
_G['LightSource'].RayCastTask = function(drawPos, rotation) end

---`Method Private Static`
---@param rayStart Microsoft.Xna.Framework.Vector2
---@param rayEnd Microsoft.Xna.Framework.Vector2
---@param segments (System.Collections.Generic.List*1Barotrauma*Lights*Segment)|(Barotrauma.Lights.Segment[])
---@return System.ValueTuple*1System*Int32*1Microsoft*Xna*Framework*Vector2
_G['LightSource'].RayCast = function(rayStart, rayEnd, segments) end

---`Method Private Instance`
---@param rayCastHits (System.Collections.Generic.List*1Microsoft*Xna*Framework*Vector2)|(Microsoft.Xna.Framework.Vector2[])
_G['LightSource'].CalculateLightVertices = function(rayCastHits) end

---`Method Public Instance`
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
---@param cam Barotrauma.Camera
_G['LightSource'].DrawSprite = function(spriteBatch, cam) end

---`Method Public Instance`
_G['LightSource'].CheckConditionals = function() end

---`Method Public Instance`
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
_G['LightSource'].DebugDrawVertices = function(spriteBatch) end

---`Method Public Instance`
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
---@param lightEffect Microsoft.Xna.Framework.Graphics.BasicEffect
---@param transform Microsoft.Xna.Framework.Matrix
---@param allowRecalculation System.Boolean
---@param recalculationCount System.Int32-ref
_G['LightSource'].DrawLightVolume = function(spriteBatch, lightEffect, transform, allowRecalculation, recalculationCount) end

---`Method Public Instance`
_G['LightSource'].Reset = function() end

---`Method Public Instance`
_G['LightSource'].Remove = function() end

---`Constructor Public Instance`
---@overload fun(element:Barotrauma.ContentXElement, conditionalTarget?:Barotrauma.ISerializableEntity):Barotrauma.Lights.LightSource
---@overload fun(lightSourceParams:Barotrauma.Lights.LightSourceParams):Barotrauma.Lights.LightSource
---@overload fun(position:Microsoft.Xna.Framework.Vector2, range:System.Single, color:Microsoft.Xna.Framework.Color, submarine:Barotrauma.Submarine, addLight?:System.Boolean):Barotrauma.Lights.LightSource
---@return Barotrauma.Lights.LightSource
_G['LightSource'] = function() end

---`Constructor Public Instance`
---@overload fun(element:Barotrauma.ContentXElement, conditionalTarget?:Barotrauma.ISerializableEntity):Barotrauma.Lights.LightSource
---@overload fun(lightSourceParams:Barotrauma.Lights.LightSourceParams):Barotrauma.Lights.LightSource
---@overload fun(position:Microsoft.Xna.Framework.Vector2, range:System.Single, color:Microsoft.Xna.Framework.Color, submarine:Barotrauma.Submarine, addLight?:System.Boolean):Barotrauma.Lights.LightSource
---@return Barotrauma.Lights.LightSource
_G['LightSource'].__new = function() end

---`Constructor Private Static`
---@overload fun(element:Barotrauma.ContentXElement, conditionalTarget?:Barotrauma.ISerializableEntity):Barotrauma.Lights.LightSource
---@overload fun(lightSourceParams:Barotrauma.Lights.LightSourceParams):Barotrauma.Lights.LightSource
---@overload fun(position:Microsoft.Xna.Framework.Vector2, range:System.Single, color:Microsoft.Xna.Framework.Color, submarine:Barotrauma.Submarine, addLight?:System.Boolean):Barotrauma.Lights.LightSource
---@return Barotrauma.Lights.LightSource
_G['LightSource'] = function() end

---`Constructor Private Static`
---@overload fun(element:Barotrauma.ContentXElement, conditionalTarget?:Barotrauma.ISerializableEntity):Barotrauma.Lights.LightSource
---@overload fun(lightSourceParams:Barotrauma.Lights.LightSourceParams):Barotrauma.Lights.LightSource
---@overload fun(position:Microsoft.Xna.Framework.Vector2, range:System.Single, color:Microsoft.Xna.Framework.Color, submarine:Barotrauma.Submarine, addLight?:System.Boolean):Barotrauma.Lights.LightSource
---@return Barotrauma.Lights.LightSource
_G['LightSource'].__new = function() end

