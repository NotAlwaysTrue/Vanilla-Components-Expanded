---@meta
---@class Barotrauma.Items.Components.Controller : Barotrauma.Items.Components.ItemComponent
---`Field Private Instance`
---@field limbPositions (System.Collections.Generic.List*1Barotrauma*Items*Components*LimbPos)|(Barotrauma.Items.Components.LimbPos[])
---`Field Private Instance`
---@field dir Barotrauma.Direction
---`Field Private Instance`
---@field userPos Microsoft.Xna.Framework.Vector2
---`Field Private Instance`
---@field cam Barotrauma.Camera
---`Field Private Instance`
---@field user Barotrauma.Character
---`Field Private Instance`
---@field focusTarget Barotrauma.Item
---`Field Private Instance`
---@field targetRotation System.Single
---`Field Private Instance`
---@field output System.String
---`Field Private Instance`
---@field falseOutput System.String
---`Field Private Instance`
---@field state System.Boolean
---`Field Private Instance`
---@field forceSelectNextFrame System.Boolean
---`Field Private Instance`
---@field userCanInteractCheckTimer System.Single
---`Field Private Instance`
---@field lastUsed System.Double
---`Field Private Static`
---@field UserCanInteractCheckInterval System.Single
---`Getter Public Instance`
---@field Direction Barotrauma.Direction
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field UserPos Microsoft.Xna.Framework.Vector2
---`Getter Public Instance`
---@field User Barotrauma.Character
---`Getter Public Instance`
---@field LimbPositions (System.Collections.Generic.IEnumerable*1Barotrauma*Items*Components*LimbPos)|(fun():(Barotrauma.Items.Components.LimbPos))
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field IsToggle System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Output System.String
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field FalseOutput System.String
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field State System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field HideHUD System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field UsableIn Barotrauma.Items.Components.Controller.UseEnvironment
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field DrawUserBehind System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field AllowSelectingWhenSelectedByOther System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field AllowSelectingWhenSelectedByBot System.Boolean
---`Getter Public Instance`
---@field ControlCharacterPose System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field UserInCorrectPosition System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field AllowAiming System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field NonInteractableWhenFlippedX System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field NonInteractableWhenFlippedY System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field RequirePower System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field IsSecondaryItem System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field ForceUserToStayAttached System.Boolean
_G['Components']['Controller'] = {}

---`Method Public Instance Virtual`
---@param msg Barotrauma.Networking.IWriteMessage
---@param c Barotrauma.Networking.Client
---@param extraData? Barotrauma.Networking.NetEntityEvent.IData
_G['Components']['Controller'].ServerEventWrite = function(msg, c, extraData) end

---`Method Public Instance Virtual`
---@param deltaTime System.Single
---@param cam Barotrauma.Camera
_G['Components']['Controller'].Update = function(deltaTime, cam) end

---`Method Private Instance`
---@return System.Boolean
_G['Components']['Controller'].CheckUserCanInteract = function() end

---`Method Public Instance Virtual`
---@param deltaTime System.Single
---@param activator? Barotrauma.Character
---@return System.Boolean
_G['Components']['Controller'].Use = function(deltaTime, activator) end

---`Method Public Instance Virtual`
---@param deltaTime System.Single
---@param character? Barotrauma.Character
---@return System.Boolean
_G['Components']['Controller'].SecondaryUse = function(deltaTime, character) end

---`Method Public Instance`
---@return System.Boolean
_G['Components']['Controller'].IsOutOfPower = function() end

---`Method Public Instance`
---@return Barotrauma.Item
_G['Components']['Controller'].GetFocusTarget = function() end

---`Method Public Instance Virtual`
---@param picker Barotrauma.Character
---@return System.Boolean
_G['Components']['Controller'].Pick = function(picker) end

---`Method Private Instance`
---@param character Barotrauma.Character
_G['Components']['Controller'].CancelUsing = function(character) end

---`Method Public Instance Virtual`
---@param activator Barotrauma.Character
---@return System.Boolean
_G['Components']['Controller'].Select = function(activator) end

---`Method Public Instance`
---@param character Barotrauma.Character
---@return System.Boolean
_G['Components']['Controller'].IsAttachedUser = function(character) end

---`Method Public Instance Virtual`
---@param relativeToSub System.Boolean
_G['Components']['Controller'].FlipX = function(relativeToSub) end

---`Method Public Instance Virtual`
---@param relativeToSub System.Boolean
_G['Components']['Controller'].FlipY = function(relativeToSub) end

---`Method Public Instance Virtual`
---@param character Barotrauma.Character
---@return System.Boolean
_G['Components']['Controller'].HasAccess = function(character) end

---`Method Public Instance Virtual`
---@param parentElement System.Xml.Linq.XElement
---@return System.Xml.Linq.XElement
_G['Components']['Controller'].Save = function(parentElement) end

---`Method Public Instance Virtual`
---@param componentElement Barotrauma.ContentXElement
---@param usePrefabValues System.Boolean
---@param idRemap Barotrauma.IdRemap
---@param isItemSwap System.Boolean
_G['Components']['Controller'].Load = function(componentElement, usePrefabValues, idRemap, isItemSwap) end

---`Method Private Instance`
---@param element System.Xml.Linq.XElement
---@return System.Xml.Linq.XElement
_G['Components']['Controller'].SaveLimbPositions = function(element) end

---`Method Private Instance`
---@param element Barotrauma.ContentXElement
_G['Components']['Controller'].LoadLimbPositions = function(element) end

---`Method Private Instance`
_G['Components']['Controller'].FlipLimbPositions = function() end

---`Method Public Instance Virtual`
_G['Components']['Controller'].OnItemLoaded = function() end

---`Method Public Instance Virtual`
_G['Components']['Controller'].Reset = function() end

---`Constructor Public Instance`
---@param item Barotrauma.Item
---@param element Barotrauma.ContentXElement
---@return Barotrauma.Items.Components.Controller
_G['Components']['Controller'] = function(item, element) end

---`Constructor Public Instance`
---@param item Barotrauma.Item
---@param element Barotrauma.ContentXElement
---@return Barotrauma.Items.Components.Controller
_G['Components']['Controller'].__new = function(item, element) end

