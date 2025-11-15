---@meta
---@class Barotrauma.Items.Components.TriggerComponent : Barotrauma.Items.Components.ItemComponent
---`Field Private Instance`
---@field radius System.Single
---`Field Private Instance`
---@field width System.Single
---`Field Private Instance`
---@field height System.Single
---`Field Private Instance`
---@field currentRadius System.Single
---`Field Private Instance`
---@field currentWidth System.Single
---`Field Private Instance`
---@field currentHeight System.Single
---`Field Private Instance`
---@field bodyOffset Microsoft.Xna.Framework.Vector2
---`Field Private Instance`
---@field triggeredBy Barotrauma.LevelTrigger.TriggererType
---`Field Private Instance`
---@field triggerSpeciesOrGroup Barotrauma.Identifier
---`Field Private Instance`
---@field conditionals Barotrauma.PropertyConditional.LogicalComparison
---`Field Private Instance`
---@field triggerers (System.Collections.Generic.HashSet*1Barotrauma*Entity)|(Barotrauma.Entity[])
---`Field Private Instance`
---@field triggerOnce System.Boolean
---`Field Private Instance`
---@field statusEffectTargets (System.Collections.Generic.List*1Barotrauma*ISerializableEntity)|(Barotrauma.ISerializableEntity[])
---`Field Private Instance`
---@field statusEffects (System.Collections.Generic.List*1Barotrauma*StatusEffect)|(Barotrauma.StatusEffect[])
---`Field Private Instance`
---@field attacks (System.Collections.Generic.List*1Barotrauma*Attack)|(Barotrauma.Attack[])
---`Field Private Instance`
---@field forceFluctuationStrength System.Single
---`Field Private Instance`
---@field forceFluctuationFrequency System.Single
---`Field Private Instance`
---@field forceFluctuationInterval System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Force System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field DirectionalForce Microsoft.Xna.Framework.Vector2
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field RelativeDirectionalForce System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field VerticalForce System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field HorizontalForce System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field DistanceBasedForce System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field ForceFluctuation System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field ForceFluctuationStrength System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field ForceFluctuationFrequency System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field ForceFluctuationInterval System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field PhysicsBody Barotrauma.PhysicsBody
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Radius System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Width System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Height System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field BodyOffset Microsoft.Xna.Framework.Vector2
---`Getter Private Instance`
---<br/>`Setter Private Instance`
---@field RadiusInDisplayUnits System.Single
---`Getter Private Instance`
---<br/>`Setter Private Instance`
---@field TriggeredOnce System.Boolean
---`Getter Private Instance`
---<br/>`Setter Private Instance`
---@field CurrentForceFluctuation System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field TriggerActive System.Boolean
---`Getter Private Instance`
---<br/>`Setter Private Instance`
---@field ForceFluctuationTimer System.Single
---`Getter Private Static`
---@field TimeInLevel System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field ApplyEffectsToCharactersInsideSub System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field MoveOutsideSub System.Boolean
---`Getter Public Instance Virtual`
---<br/>`Setter Public Instance Virtual`
---@field IsActive System.Boolean
_G['Components']['TriggerComponent'] = {}

---`Method Public Instance Virtual`
---@param msg Barotrauma.Networking.IWriteMessage
---@param c Barotrauma.Networking.Client
---@param extraData? Barotrauma.Networking.NetEntityEvent.IData
_G['Components']['TriggerComponent'].ServerEventWrite = function(msg, c, extraData) end

---`Method Public Instance Virtual`
_G['Components']['TriggerComponent'].OnItemLoaded = function() end

---`Method Private Instance`
_G['Components']['TriggerComponent'].RefreshPhysicsBodySize = function() end

---`Method Public Instance`
---@param ignoreContacts? System.Boolean
_G['Components']['TriggerComponent'].SetPhysicsBodyPosition = function(ignoreContacts) end

---`Method Public Instance Virtual`
---@param relativeToSub System.Boolean
_G['Components']['TriggerComponent'].FlipX = function(relativeToSub) end

---`Method Public Instance Virtual`
---@param relativeToSub System.Boolean
_G['Components']['TriggerComponent'].FlipY = function(relativeToSub) end

---`Method Public Instance Virtual`
_G['Components']['TriggerComponent'].OnMapLoaded = function() end

---`Method Private Instance`
---@param sender FarseerPhysics.Dynamics.Fixture
---@param other FarseerPhysics.Dynamics.Fixture
---@param contact FarseerPhysics.Dynamics.Contacts.Contact
---@return System.Boolean
_G['Components']['TriggerComponent'].OnCollision = function(sender, other, contact) end

---`Method Private Instance`
---@param sender FarseerPhysics.Dynamics.Fixture
---@param other FarseerPhysics.Dynamics.Fixture
---@param contact FarseerPhysics.Dynamics.Contacts.Contact
_G['Components']['TriggerComponent'].OnSeparation = function(sender, other, contact) end

---`Method Public Instance Virtual`
---@param deltaTime System.Single
---@param cam Barotrauma.Camera
_G['Components']['TriggerComponent'].Update = function(deltaTime, cam) end

---`Method Private Instance`
---@param body Barotrauma.PhysicsBody
---@param multiplier? System.Single
_G['Components']['TriggerComponent'].ApplyForce = function(body, multiplier) end

---`Method Public Instance Virtual`
---@param amount Microsoft.Xna.Framework.Vector2
---@param ignoreContacts? System.Boolean
_G['Components']['TriggerComponent'].Move = function(amount, ignoreContacts) end

---`Method NonPublic Instance Virtual`
_G['Components']['TriggerComponent'].RemoveComponentSpecific = function() end

---`Method Public Instance Virtual`
---@param signal Barotrauma.Items.Components.Signal
---@param connection Barotrauma.Items.Components.Connection
_G['Components']['TriggerComponent'].ReceiveSignal = function(signal, connection) end

---`Constructor Public Instance`
---@param item Barotrauma.Item
---@param element Barotrauma.ContentXElement
---@return Barotrauma.Items.Components.TriggerComponent
_G['Components']['TriggerComponent'] = function(item, element) end

---`Constructor Public Instance`
---@param item Barotrauma.Item
---@param element Barotrauma.ContentXElement
---@return Barotrauma.Items.Components.TriggerComponent
_G['Components']['TriggerComponent'].__new = function(item, element) end

