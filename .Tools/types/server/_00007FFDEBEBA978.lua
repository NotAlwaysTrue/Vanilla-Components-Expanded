---@meta
---@class Barotrauma.Items.Components.Door : Barotrauma.Items.Components.Pickable
---`Field Private Instance`
---@field linkedGap Barotrauma.Gap
---`Field Private Instance`
---@field isOpen System.Boolean
---`Field Private Instance`
---@field openState System.Single
---`Field Private Instance`
---@field lastOpenState System.Single
---`Field Private Instance`
---@field doorSprite Barotrauma.Sprite
---`Field Private Instance`
---@field weldedSprite Barotrauma.Sprite
---`Field Private Instance`
---@field brokenSprite Barotrauma.Sprite
---`Field Private Instance`
---@field scaleBrokenSprite System.Boolean
---`Field Private Instance`
---@field fadeBrokenSprite System.Boolean
---`Field Private Instance`
---@field autoOrientGap System.Boolean
---`Field Private Instance`
---@field isJammed System.Boolean
---`Field Private Instance`
---@field isStuck System.Boolean
---`Field Private Instance`
---@field resetPredictionTimer System.Single
---`Field Private Instance`
---@field toggleCooldownTimer System.Single
---`Field Private Instance`
---@field lastUser Barotrauma.Character
---`Field Private Instance`
---@field damageSoundCooldown System.Single
---`Field Private Instance`
---@field lastBrokenTime System.Double
---`Field Private Instance`
---@field doorRect Microsoft.Xna.Framework.Rectangle
---`Field Private Instance`
---@field isBroken System.Boolean
---`Field Public Instance`
---@field OutsideSubmarineFixture FarseerPhysics.Dynamics.Fixture
---`Field Public Instance`
---@field CanBeWelded System.Boolean
---`Field Private Instance`
---@field stuck System.Single
---`Field Private Instance`
---@field accessDeniedTxt Barotrauma.LocalizedString
---`Field Private Instance`
---@field cannotOpenText Barotrauma.LocalizedString
---`Field Private Instance`
---@field itemPosErrorShown System.Boolean
---`Field Private Instance`
---@field characterPosErrorShown (System.Collections.Generic.HashSet*1Barotrauma*Character)|(Barotrauma.Character[])
---`Field Private Static`
---@field doorList (System.Collections.Generic.HashSet*1Barotrauma*Items*Components*Door)|(Barotrauma.Items.Components.Door[])
---`Field Private Static`
---@field StuckReductionOnOpen System.Single
---`Getter Public Static`
---@field DoorList (System.Collections.Generic.IReadOnlyCollection*1Barotrauma*Items*Components*Door)|(fun():(Barotrauma.Items.Components.Door))
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field IsJammed System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field IsStuck System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field IgnoreSignals System.Boolean
---`Getter Public Instance`
---@field CanBeTraversed System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field IsBroken System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field Body Barotrauma.PhysicsBody
---`Getter Private Instance`
---@field RepairThreshold System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Stuck System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field OpeningSpeed System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field ClosingSpeed System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field ToggleCoolDown System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field PredictedState System.Nullable*1System*Boolean
---`Getter Public Instance`
---@field LinkedGap Barotrauma.Gap
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field IsHorizontal System.Boolean
---`Getter Public Instance`
---@field IsConvexHullHorizontal System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Window Microsoft.Xna.Framework.Rectangle
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field IsOpen System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field ShouldBeOpen System.Boolean
---`Getter Public Instance`
---@field IsClosed System.Boolean
---`Getter Public Instance`
---@field IsFullyOpen System.Boolean
---`Getter Public Instance`
---@field IsFullyClosed System.Boolean
---`Getter Public Instance`
---@field HasWindow System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field HasIntegratedButtons System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field ToggleWhenClicked System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field OpenState System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Impassable System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field UseBetweenOutpostModules System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field BotsShouldKeepOpen System.Boolean
_G['Components']['Door'] = {}

---`Method Public Instance Virtual`
---@param msg Barotrauma.Networking.IWriteMessage
---@param c Barotrauma.Networking.Client
---@param extraData? Barotrauma.Networking.NetEntityEvent.IData
_G['Components']['Door'].ServerEventWrite = function(msg, c, extraData) end

---`Method Private Instance`
_G['Components']['Door'].GetLinkedGap = function() end

---`Method Public Instance Virtual`
_G['Components']['Door'].OnItemLoaded = function() end

---`Method Public Instance Virtual`
---@param amount Microsoft.Xna.Framework.Vector2
---@param ignoreContacts? System.Boolean
_G['Components']['Door'].Move = function(amount, ignoreContacts) end

---`Method Public Instance Virtual`
---@param character Barotrauma.Character
---@param addMessage System.Boolean
---@param msg? Barotrauma.LocalizedString
---@return System.Boolean
_G['Components']['Door'].HasRequiredItems = function(character, addMessage, msg) end

---`Method Public Instance Virtual`
---@param picker Barotrauma.Character
---@return System.Boolean
_G['Components']['Door'].Pick = function(picker) end

---`Method Public Instance Virtual`
---@param picker Barotrauma.Character
---@return System.Boolean
_G['Components']['Door'].OnPicked = function(picker) end

---`Method Private Instance`
---@param actionType Barotrauma.ActionType
---@param user Barotrauma.Character
_G['Components']['Door'].ToggleState = function(actionType, user) end

---`Method Public Instance Virtual`
---@param character Barotrauma.Character
---@return System.Boolean
_G['Components']['Door'].Select = function(character) end

---`Method Public Instance`
---@param position Microsoft.Xna.Framework.Vector2
---@param maxPerpendicularDistance? System.Single
---@return System.Boolean
_G['Components']['Door'].IsPositionOnWindow = function(position, maxPerpendicularDistance) end

---`Method Public Instance Virtual`
---@param deltaTime System.Single
---@param cam Barotrauma.Camera
_G['Components']['Door'].Update = function(deltaTime, cam) end

---`Method Public Instance Virtual`
---@param deltaTime System.Single
---@param cam Barotrauma.Camera
_G['Components']['Door'].UpdateBroken = function(deltaTime, cam) end

---`Method Private Instance`
_G['Components']['Door'].EnableBody = function() end

---`Method Private Instance`
_G['Components']['Door'].DisableBody = function() end

---`Method Public Instance`
_G['Components']['Door'].RefreshLinkedGap = function() end

---`Method Public Instance Virtual`
_G['Components']['Door'].OnMapLoaded = function() end

---`Method Public Instance Virtual`
_G['Components']['Door'].OnScaleChanged = function() end

---`Method NonPublic Instance Virtual`
_G['Components']['Door'].RemoveComponentSpecific = function() end

---`Method Private Instance`
---@return System.Boolean
_G['Components']['Door'].CheckSubmarinesInDoorWay = function() end

---`Method Private Instance`
_G['Components']['Door'].PushCharactersAway = function() end

---`Method Private Instance`
---@param c Barotrauma.Character
---@param body Barotrauma.PhysicsBody
---@param dir System.Int32
---@param doorRectSimPos Microsoft.Xna.Framework.Vector2
---@param doorRectSimSize Microsoft.Xna.Framework.Vector2
---@return System.Boolean
_G['Components']['Door'].PushBodyOutOfDoorway = function(c, body, dir, doorRectSimPos, doorRectSimSize) end

---`Method Public Instance Virtual`
---@param character Barotrauma.Character
---@return System.Boolean
_G['Components']['Door'].HasAccess = function(character) end

---`Method Public Instance Virtual`
---@param signal Barotrauma.Items.Components.Signal
---@param connection Barotrauma.Items.Components.Connection
_G['Components']['Door'].ReceiveSignal = function(signal, connection) end

---`Method Public Instance`
---@param open System.Boolean
---@param isNetworkMessage System.Boolean
---@param sendNetworkMessage? System.Boolean
_G['Components']['Door'].TrySetState = function(open, isNetworkMessage, sendNetworkMessage) end

---`Method Private Instance`
---@param open System.Boolean
---@param isNetworkMessage System.Boolean
---@param sendNetworkMessage System.Boolean
---@param forcedOpen System.Boolean
_G['Components']['Door'].SetState = function(open, isNetworkMessage, sendNetworkMessage, forcedOpen) end

---`Constructor Public Instance`
---@overload fun(item:Barotrauma.Item, element:Barotrauma.ContentXElement):Barotrauma.Items.Components.Door
---@return Barotrauma.Items.Components.Door
_G['Components']['Door'] = function() end

---`Constructor Public Instance`
---@overload fun(item:Barotrauma.Item, element:Barotrauma.ContentXElement):Barotrauma.Items.Components.Door
---@return Barotrauma.Items.Components.Door
_G['Components']['Door'].__new = function() end

---`Constructor Private Static`
---@overload fun(item:Barotrauma.Item, element:Barotrauma.ContentXElement):Barotrauma.Items.Components.Door
---@return Barotrauma.Items.Components.Door
_G['Components']['Door'] = function() end

---`Constructor Private Static`
---@overload fun(item:Barotrauma.Item, element:Barotrauma.ContentXElement):Barotrauma.Items.Components.Door
---@return Barotrauma.Items.Components.Door
_G['Components']['Door'].__new = function() end

