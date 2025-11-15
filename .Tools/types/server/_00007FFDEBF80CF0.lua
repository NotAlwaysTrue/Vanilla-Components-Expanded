---@meta
---@class Barotrauma.Items.Components.Connection : System.Object
---`Field Public Instance`
---@field MaxPlayerConnectableWires System.Int32
---`Field Public Instance`
---@field MaxWires System.Int32
---`Field Public Instance`
---@field Name System.String
---`Field Private Instance`
---@field _displayName Barotrauma.LocalizedString
---`Field Public Instance`
---@field DisplayNameOverride Barotrauma.LocalizedString
---`Field Private Instance`
---@field wires (System.Collections.Generic.HashSet*1Barotrauma*Items*Components*Wire)|(Barotrauma.Items.Components.Wire[])
---`Field Public Instance`
---@field CircuitBoxConnections (System.Collections.Generic.List*1Barotrauma*CircuitBoxConnection)|(Barotrauma.CircuitBoxConnection[])
---`Field Private Instance`
---@field enumeratingWires System.Boolean
---`Field Private Instance`
---@field removedWires (System.Collections.Generic.HashSet*1Barotrauma*Items*Components*Wire)|(Barotrauma.Items.Components.Wire[])
---`Field Private Instance`
---@field item Barotrauma.Item
---`Field Public Instance`
---@field IsOutput System.Boolean
---`Field Public Instance`
---@field Effects (System.Collections.Generic.List*1Barotrauma*StatusEffect)|(Barotrauma.StatusEffect[])
---`Field Public Instance`
---@field LoadedWires (System.Collections.Generic.List*1System*ValueTuple*2System*UInt16*2System*Nullable*3System*Int32)|(System.ValueTuple*1System*UInt16*1System*Nullable*2System*Int32[])
---`Field Public Instance`
---@field Grid Barotrauma.Items.Components.GridInfo
---`Field Public Instance`
---@field Priority Barotrauma.Items.Components.PowerPriority
---`Field Private Instance`
---@field recipientsDirty System.Boolean
---`Field Private Instance`
---@field recipients (System.Collections.Generic.List*1Barotrauma*Items*Components*Connection)|(Barotrauma.Items.Components.Connection[])
---`Field Private Static`
---@field DefaultMaxWires System.Int32
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field DisplayName Barotrauma.LocalizedString
---`Getter Public Instance`
---@field Wires (System.Collections.Generic.IReadOnlyCollection*1Barotrauma*Items*Components*Wire)|(fun():(Barotrauma.Items.Components.Wire))
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field LastSentSignal Barotrauma.Items.Components.Signal
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field LastReceivedSignal Barotrauma.Items.Components.Signal
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field IsPower System.Boolean
---`Getter Public Instance`
---@field Recipients (System.Collections.Generic.List*1Barotrauma*Items*Components*Connection)|(Barotrauma.Items.Components.Connection[])
---`Getter Public Instance`
---@field Item Barotrauma.Item
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field ConnectionPanel Barotrauma.Items.Components.ConnectionPanel
_G['Components']['Connection'] = {}

---`Method Public Instance Virtual`
---@return System.String
_G['Components']['Connection'].ToString = function() end

---`Method Public Instance`
---@return System.Boolean
_G['Components']['Connection'].IsConnectedToSomething = function() end

---`Method Public Instance`
_G['Components']['Connection'].SetRecipientsDirty = function() end

---`Method Private Instance`
_G['Components']['Connection'].RefreshRecipients = function() end

---`Method Public Instance`
---@param it Barotrauma.Item
---@return Barotrauma.Items.Components.Wire
_G['Components']['Connection'].FindWireByItem = function(it) end

---`Method Public Instance`
---@return System.Boolean
_G['Components']['Connection'].WireSlotsAvailable = function() end

---`Method Public Instance`
---@param wire Barotrauma.Items.Components.Wire
---@return System.Boolean
_G['Components']['Connection'].TryAddLink = function(wire) end

---`Method Public Instance`
---@param wire Barotrauma.Items.Components.Wire
_G['Components']['Connection'].DisconnectWire = function(wire) end

---`Method Public Instance`
---@param wire Barotrauma.Items.Components.Wire
_G['Components']['Connection'].ConnectWire = function(wire) end

---`Method Public Instance`
---@param signal Barotrauma.Items.Components.Signal
_G['Components']['Connection'].SendSignal = function(signal) end

---`Method Public Static`
---@param signal Barotrauma.Items.Components.Signal
---@param conn Barotrauma.Items.Components.Connection
_G['Components']['Connection'].SendSignalIntoConnection = function(signal, conn) end

---`Method Public Instance`
_G['Components']['Connection'].ClearConnections = function() end

---`Method Public Instance`
_G['Components']['Connection'].InitializeFromLoaded = function() end

---`Method Public Instance`
---@param parentElement System.Xml.Linq.XElement
_G['Components']['Connection'].Save = function(parentElement) end

---`Constructor Public Instance`
---@param element Barotrauma.ContentXElement
---@param connectionPanel Barotrauma.Items.Components.ConnectionPanel
---@param idRemap Barotrauma.IdRemap
---@return Barotrauma.Items.Components.Connection
_G['Components']['Connection'] = function(element, connectionPanel, idRemap) end

---`Constructor Public Instance`
---@param element Barotrauma.ContentXElement
---@param connectionPanel Barotrauma.Items.Components.ConnectionPanel
---@param idRemap Barotrauma.IdRemap
---@return Barotrauma.Items.Components.Connection
_G['Components']['Connection'].__new = function(element, connectionPanel, idRemap) end

