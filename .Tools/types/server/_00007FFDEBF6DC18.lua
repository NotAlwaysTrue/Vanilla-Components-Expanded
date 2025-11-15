---@meta
---@class Barotrauma.Items.Components.Sonar : Barotrauma.Items.Components.Powered
---`Field Private Instance`
---@field range System.Single
---`Field Private Instance`
---@field currentMode Barotrauma.Items.Components.Sonar.Mode
---`Field Private Instance`
---@field activePings (Barotrauma.Items.Components.ActivePing-arr)|(Barotrauma.Items.Components.Sonar.ActivePing[])
---`Field Private Instance`
---@field activePingsCount System.Int32
---`Field Private Instance`
---@field currentPingIndex System.Int32
---`Field Private Instance`
---@field zoom System.Single
---`Field Private Instance`
---@field useDirectionalPing System.Boolean
---`Field Private Instance`
---@field pingDirection Microsoft.Xna.Framework.Vector2
---`Field Private Instance`
---@field aiPingCheckPending System.Boolean
---`Field Private Instance`
---@field connectedTransducers (System.Collections.Generic.List*1Barotrauma*Items*Components*Sonar*ConnectedTransducer)|(Barotrauma.Items.Components.Sonar.ConnectedTransducer[])
---`Field Private Instance`
---@field hasMineralScanner System.Boolean
---`Field Public Static`
---@field SonarList (System.Collections.Generic.List*1Barotrauma*Items*Components*Sonar)|(Barotrauma.Items.Components.Sonar[])
---`Field Private Static`
---@field DirectionalPingDotProduct System.Single
---`Field Private Static`
---@field targetGroups (System.Collections.Generic.Dictionary*1System*String*1System*Collections*Generic*List*2Barotrauma*Character)|({[System.String]:((System.Collections.Generic.List*1Barotrauma*Character)|(Barotrauma.Character[]))})
---`Field Public Static`
---@field DefaultSonarRange System.Single
---`Field Public Static`
---@field PassivePowerConsumption System.Single
---`Field Private Static`
---@field DirectionalPingSector System.Single
---`Field Private Static`
---@field PingFrequency System.Single
---`Field Private Static`
---@field MinZoom System.Single
---`Field Private Static`
---@field MaxZoom System.Single
---`Getter Public Instance`
---@field UseDirectionalPing System.Boolean
---`Getter Public Instance`
---@field ConnectedTransducers (System.Collections.Generic.IEnumerable*1Barotrauma*Items*Components*SonarTransducer)|(fun():(Barotrauma.Items.Components.SonarTransducer))
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Range System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field DetectSubmarineWalls System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field UseTransducers System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field CenterOnTransducers System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field HasMineralScanner System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field UseMineralScanner System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Zoom System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field CurrentMode Barotrauma.Items.Components.Sonar.Mode
_G['Components']['Sonar'] = {}

---`Method Public Instance Virtual`
---@param deltaTime System.Single
---@param cam Barotrauma.Camera
_G['Components']['Sonar'].Update = function(deltaTime, cam) end

---`Method Private Instance`
---@return (System.Collections.Generic.IEnumerable*1Barotrauma*AITarget)|(fun():(Barotrauma.AITarget))
_G['Components']['Sonar'].GetAITargets = function() end

---`Method Public Instance Virtual`
---@param connection? Barotrauma.Items.Components.Connection
---@return System.Single
_G['Components']['Sonar'].GetCurrentPowerConsumption = function(connection) end

---`Method Public Instance Virtual`
---@param deltaTime System.Single
---@param character? Barotrauma.Character
---@return System.Boolean
_G['Components']['Sonar'].Use = function(deltaTime, character) end

---`Method Public Instance Virtual`
---@param deltaTime System.Single
---@param character Barotrauma.Character
---@param objective Barotrauma.AIObjectiveOperateItem
---@return System.Boolean
_G['Components']['Sonar'].CrewAIOperate = function(deltaTime, character, objective) end

---`Method Private Instance`
---@param dir Microsoft.Xna.Framework.Vector2
---@return Barotrauma.LocalizedString
_G['Components']['Sonar'].GetDirectionName = function(dir) end

---`Method Public Instance Virtual`
---@param signal Barotrauma.Items.Components.Signal
---@param connection Barotrauma.Items.Components.Connection
_G['Components']['Sonar'].ReceiveSignal = function(signal, connection) end

---`Method NonPublic Instance Virtual`
_G['Components']['Sonar'].RemoveComponentSpecific = function() end

---`Method Public Instance Virtual`
---@param msg Barotrauma.Networking.IReadMessage
---@param c Barotrauma.Networking.Client
_G['Components']['Sonar'].ServerEventRead = function(msg, c) end

---`Method Public Instance Virtual`
---@param msg Barotrauma.Networking.IWriteMessage
---@param c Barotrauma.Networking.Client
---@param extraData? Barotrauma.Networking.NetEntityEvent.IData
_G['Components']['Sonar'].ServerEventWrite = function(msg, c, extraData) end

---`Constructor Private Static`
---@overload fun():Barotrauma.Items.Components.Sonar
---@param item Barotrauma.Item
---@param element Barotrauma.ContentXElement
---@return Barotrauma.Items.Components.Sonar
_G['Components']['Sonar'] = function(item, element) end

---`Constructor Private Static`
---@overload fun():Barotrauma.Items.Components.Sonar
---@param item Barotrauma.Item
---@param element Barotrauma.ContentXElement
---@return Barotrauma.Items.Components.Sonar
_G['Components']['Sonar'].__new = function(item, element) end

---`Constructor Public Instance`
---@overload fun():Barotrauma.Items.Components.Sonar
---@param item Barotrauma.Item
---@param element Barotrauma.ContentXElement
---@return Barotrauma.Items.Components.Sonar
_G['Components']['Sonar'] = function(item, element) end

---`Constructor Public Instance`
---@overload fun():Barotrauma.Items.Components.Sonar
---@param item Barotrauma.Item
---@param element Barotrauma.ContentXElement
---@return Barotrauma.Items.Components.Sonar
_G['Components']['Sonar'].__new = function(item, element) end

