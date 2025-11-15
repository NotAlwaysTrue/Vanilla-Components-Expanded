---@meta
---@class Barotrauma.Items.Components.Holdable : Barotrauma.Items.Components.Pickable
---`Field NonPublic Instance`
---@field handlePos (Microsoft.Xna.Framework.Vector2-arr)|(Microsoft.Xna.Framework.Vector2[])
---`Field Private Instance`
---@field scaledHandlePos (Microsoft.Xna.Framework.Vector2-arr)|(Microsoft.Xna.Framework.Vector2[])
---`Field Private Instance`
---@field prevPickKey Barotrauma.InputType
---`Field Private Instance`
---@field prevMsg Barotrauma.LocalizedString
---`Field Private Instance`
---@field prevRequiredItems (System.Collections.Generic.Dictionary*1Barotrauma*RelatedItem*RelationType*1System*Collections*Generic*List*2Barotrauma*RelatedItem)|({[Barotrauma.RelatedItem.RelationType]:((System.Collections.Generic.List*1Barotrauma*RelatedItem)|(Barotrauma.RelatedItem[]))})
---`Field Private Instance`
---@field swingState System.Single
---`Field Private Instance`
---@field prevEquipper Barotrauma.Character
---`Field Private Instance`
---@field attachable System.Boolean
---`Field Private Instance`
---@field attached System.Boolean
---`Field Private Instance`
---@field attachedByDefault System.Boolean
---`Field Private Instance`
---@field attachTargetCell Voronoi2.VoronoiCell
---`Field Private Instance`
---@field originalBody Barotrauma.PhysicsBody
---`Field Public Instance`
---@field HoldableStatValues (System.Collections.Immutable.ImmutableDictionary*1Barotrauma*StatTypes*1System*Single)|({[Barotrauma.StatTypes]:(System.Single)})
---`Field Private Instance`
---@field disallowAttachingOverTags (System.Collections.Generic.HashSet*1Barotrauma*Identifier)|(Barotrauma.Identifier[])
---`Field NonPublic Instance`
---@field holdPos Microsoft.Xna.Framework.Vector2
---`Field NonPublic Instance`
---@field aimPos Microsoft.Xna.Framework.Vector2
---`Field NonPublic Instance`
---@field holdAngle System.Single
---`Field NonPublic Instance`
---@field aimAngle System.Single
---`Field Private Instance`
---@field swingAmount Microsoft.Xna.Framework.Vector2
---`Field Private Instance`
---@field secondHandlePosDefined System.Boolean
---`Field Private Instance`
---@field loadedFromInstance System.Boolean
---`Field Private Static`
---@field tempOverlappingItems (System.Collections.Generic.List*1Barotrauma*Item)|(Barotrauma.Item[])
---`Field Private Static`
---@field MaxAttachDistance System.Single
---`Getter Public Instance Virtual`
---@field IsAttached System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field Pusher Barotrauma.PhysicsBody
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field CanPush System.Boolean
---`Getter Public Instance`
---@field Body Barotrauma.PhysicsBody
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Attached System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Aimable System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field CameraAimOffset System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field ControlPose System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field UseHandRotationForHoldAngle System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Attachable System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Reattachable System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field LimitedAttachable System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field AttachesToFloor System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field AllowAttachInsideDoors System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field DisallowAttachingOverTags System.String
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field AttachedByDefault System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field HoldPos Microsoft.Xna.Framework.Vector2
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field AimPos Microsoft.Xna.Framework.Vector2
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field HoldAngle System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field AimAngle System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field SwingAmount Microsoft.Xna.Framework.Vector2
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field SwingSpeed System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field SwingWhenHolding System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field SwingWhenAiming System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field SwingWhenUsing System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field DisableHeadRotation System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field DisableWhenRangedWeaponEquipped System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field SpriteDepthWhenDropped System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field MsgWhenDropped System.String
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Handle1 Microsoft.Xna.Framework.Vector2
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Handle2 Microsoft.Xna.Framework.Vector2
_G['Components']['Holdable'] = {}

---`Method Public Instance Virtual`
---@param msg Barotrauma.Networking.IWriteMessage
---@param c Barotrauma.Networking.Client
---@param extraData? Barotrauma.Networking.NetEntityEvent.IData
_G['Components']['Holdable'].ServerEventWrite = function(msg, c, extraData) end

---`Method Public Instance Virtual`
---@param msg Barotrauma.Networking.IReadMessage
---@param c Barotrauma.Networking.Client
_G['Components']['Holdable'].ServerEventRead = function(msg, c) end

---`Method Private Instance`
---@param sender FarseerPhysics.Dynamics.Fixture
---@param other FarseerPhysics.Dynamics.Fixture
---@param contact FarseerPhysics.Dynamics.Contacts.Contact
---@return System.Boolean
_G['Components']['Holdable'].OnPusherCollision = function(sender, other, contact) end

---`Method Public Instance Virtual`
---@param componentElement Barotrauma.ContentXElement
---@param usePrefabValues System.Boolean
---@param idRemap Barotrauma.IdRemap
---@param isItemSwap System.Boolean
_G['Components']['Holdable'].Load = function(componentElement, usePrefabValues, idRemap, isItemSwap) end

---`Method Public Instance Virtual`
---@param dropper Barotrauma.Character
---@param setTransform? System.Boolean
_G['Components']['Holdable'].Drop = function(dropper, setTransform) end

---`Method Private Instance`
---@param dropConnectedWires System.Boolean
---@param dropper Barotrauma.Character
---@param setTransform? System.Boolean
_G['Components']['Holdable'].Drop = function(dropConnectedWires, dropper, setTransform) end

---`Method Public Instance Virtual`
---@param character Barotrauma.Character
_G['Components']['Holdable'].Equip = function(character) end

---`Method Public Instance Virtual`
---@param character Barotrauma.Character
_G['Components']['Holdable'].Unequip = function(character) end

---`Method Public Instance`
---@param user Barotrauma.Character
---@return System.Boolean
_G['Components']['Holdable'].CanBeAttached = function(user) end

---`Method Private Instance`
---@param user Barotrauma.Character
---@param overlappingItems System.Collections.Generic.IEnumerable
---@return System.Boolean
_G['Components']['Holdable'].CanBeAttached = function(user, overlappingItems) end

---`Method Public Instance`
---@return System.Boolean
_G['Components']['Holdable'].CanBeDeattached = function() end

---`Method Public Instance Virtual`
---@param picker Barotrauma.Character
---@return System.Boolean
_G['Components']['Holdable'].Pick = function(picker) end

---`Method Public Instance Virtual`
---@param picker Barotrauma.Character
---@return System.Boolean
_G['Components']['Holdable'].OnPicked = function(picker) end

---`Method Public Instance`
_G['Components']['Holdable'].AttachToWall = function() end

---`Method Public Instance`
_G['Components']['Holdable'].DeattachFromWall = function() end

---`Method Public Instance Virtual`
_G['Components']['Holdable'].ParseMsg = function() end

---`Method Public Instance Virtual`
---@param deltaTime System.Single
---@param character? Barotrauma.Character
---@return System.Boolean
_G['Components']['Holdable'].Use = function(deltaTime, character) end

---`Method Public Instance Virtual`
---@param deltaTime System.Single
---@param character? Barotrauma.Character
---@return System.Boolean
_G['Components']['Holdable'].SecondaryUse = function(deltaTime, character) end

---`Method Private Instance`
---@param user Barotrauma.Character
---@param useWorldCoordinates? System.Boolean
---@return Microsoft.Xna.Framework.Vector2
_G['Components']['Holdable'].GetAttachPosition = function(user, useWorldCoordinates) end

---`Method Private Instance`
---@param maxDist System.Single
---@return Voronoi2.VoronoiCell
_G['Components']['Holdable'].GetAttachTargetCell = function(maxDist) end

---`Method Public Instance Virtual`
---@param deltaTime System.Single
---@param cam Barotrauma.Camera
_G['Components']['Holdable'].UpdateBroken = function(deltaTime, cam) end

---`Method Public Instance`
---@return Barotrauma.Items.Components.Rope
_G['Components']['Holdable'].GetRope = function() end

---`Method Public Instance Virtual`
---@param deltaTime System.Single
---@param cam Barotrauma.Camera
_G['Components']['Holdable'].Update = function(deltaTime, cam) end

---`Method Public Instance`
---@param deltaTime System.Single
---@param swingPos Microsoft.Xna.Framework.Vector2-ref
_G['Components']['Holdable'].UpdateSwingPos = function(deltaTime, swingPos) end

---`Method NonPublic Instance`
---@param character Barotrauma.Character
---@return System.Boolean
_G['Components']['Holdable'].UsageDisabledByRangedWeapon = function(character) end

---`Method Public Instance Virtual`
---@param signal Barotrauma.Items.Components.Signal
---@param connection Barotrauma.Items.Components.Connection
_G['Components']['Holdable'].ReceiveSignal = function(signal, connection) end

---`Method Public Instance Virtual`
---@param relativeToSub System.Boolean
_G['Components']['Holdable'].FlipX = function(relativeToSub) end

---`Method Public Instance Virtual`
_G['Components']['Holdable'].OnItemLoaded = function() end

---`Method Public Instance Virtual`
_G['Components']['Holdable'].OnMapLoaded = function() end

---`Method NonPublic Instance Virtual`
_G['Components']['Holdable'].RemoveComponentSpecific = function() end

---`Method Public Instance Virtual`
---@param parentElement System.Xml.Linq.XElement
---@return System.Xml.Linq.XElement
_G['Components']['Holdable'].Save = function(parentElement) end

---`Constructor Public Instance`
---@overload fun(item:Barotrauma.Item, element:Barotrauma.ContentXElement):Barotrauma.Items.Components.Holdable
---@return Barotrauma.Items.Components.Holdable
_G['Components']['Holdable'] = function() end

---`Constructor Public Instance`
---@overload fun(item:Barotrauma.Item, element:Barotrauma.ContentXElement):Barotrauma.Items.Components.Holdable
---@return Barotrauma.Items.Components.Holdable
_G['Components']['Holdable'].__new = function() end

---`Constructor Private Static`
---@overload fun(item:Barotrauma.Item, element:Barotrauma.ContentXElement):Barotrauma.Items.Components.Holdable
---@return Barotrauma.Items.Components.Holdable
_G['Components']['Holdable'] = function() end

---`Constructor Private Static`
---@overload fun(item:Barotrauma.Item, element:Barotrauma.ContentXElement):Barotrauma.Items.Components.Holdable
---@return Barotrauma.Items.Components.Holdable
_G['Components']['Holdable'].__new = function() end

