---@meta
---@class Barotrauma.Items.Components.CircuitBox : Barotrauma.Items.Components.ItemComponent
---`Field Private Instance`
---@field needsServerInitialization System.Boolean
---`Field Public Instance`
---@field Inputs (System.Collections.Immutable.ImmutableArray*1Barotrauma*CircuitBoxInputConnection)|(Barotrauma.CircuitBoxInputConnection[])
---`Field Public Instance`
---@field Outputs (System.Collections.Immutable.ImmutableArray*1Barotrauma*CircuitBoxOutputConnection)|(Barotrauma.CircuitBoxOutputConnection[])
---`Field Public Instance`
---@field Components (System.Collections.Generic.List*1Barotrauma*CircuitBoxComponent)|(Barotrauma.CircuitBoxComponent[])
---`Field Public Instance`
---@field InputOutputNodes (System.Collections.Generic.List*1Barotrauma*CircuitBoxInputOutputNode)|(Barotrauma.CircuitBoxInputOutputNode[])
---`Field Public Instance`
---@field Labels (System.Collections.Generic.List*1Barotrauma*CircuitBoxLabelNode)|(Barotrauma.CircuitBoxLabelNode[])
---`Field Public Instance`
---@field Wires (System.Collections.Generic.List*1Barotrauma*CircuitBoxWire)|(Barotrauma.CircuitBoxWire[])
---`Field Public Instance`
---@field containers (Barotrauma.Items.Components.ItemContainer-arr)|(Barotrauma.Items.Components.ItemContainer[])
---`Field Public Instance`
---@field TemporarilyLocked System.Boolean
---`Field Private Instance`
---@field delayedElementToLoad Barotrauma.Option*1Barotrauma*ContentXElement
---`Field Public Static`
---@field UnrealiableOpcodes (System.Collections.Immutable.ImmutableHashSet*1Barotrauma*CircuitBoxOpcode)|(Barotrauma.CircuitBoxOpcode[])
---`Field Private Static`
---@field ComponentContainerIndex System.Int32
---`Field Private Static`
---@field WireContainerIndex System.Int32
---`Getter Public Instance Virtual`
---@field IsActive System.Boolean
---`Getter Public Instance Virtual`
---@field DontTransferInventoryBetweenSubs System.Boolean
---`Getter Public Instance Virtual`
---@field DisallowSellingItemsFromContainer System.Boolean
---`Getter Public Instance`
---@field ComponentContainer Barotrauma.Items.Components.ItemContainer
---`Getter Public Instance`
---@field WireContainer Barotrauma.Items.Components.ItemContainer
---`Getter Public Instance`
---@field IsFull System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field Locked System.Boolean
_G['CircuitBox'] = {}

---`Method Public Instance`
_G['CircuitBox'].MarkServerRequiredInitialization = function() end

---`Method Public Instance`
---@param data Barotrauma.INetSerializableStruct
---@param c Barotrauma.Networking.Client
_G['CircuitBox'].ServerRead = function(data, c) end

---`Method Private Instance`
---@param data Barotrauma.NetCircuitBoxCursorInfo
---@param sender Barotrauma.Networking.Client
_G['CircuitBox'].RelayCursorState = function(data, sender) end

---`Method Public Instance`
---@param opcode Barotrauma.CircuitBoxOpcode
---@param data Barotrauma.INetSerializableStruct
---@param targetClient Barotrauma.Networking.Client
_G['CircuitBox'].SendToClient = function(opcode, data, targetClient) end

---`Method Public Instance`
---@param opcode Barotrauma.CircuitBoxOpcode
---@param data Barotrauma.INetSerializableStruct
---@param predicate? (System.Func*1Barotrauma*Networking*Client*1System*Boolean)|(fun(arg:Barotrauma.Networking.Client):(System.Boolean))
_G['CircuitBox'].SendToAll = function(opcode, data, predicate) end

---`Method Private Instance`
---@param opcode Barotrauma.CircuitBoxOpcode
---@param data Barotrauma.INetSerializableStruct
---@return System.ValueTuple*1Barotrauma*Networking*IWriteMessage*1Barotrauma*Networking*DeliveryMethod
_G['CircuitBox'].PrepareToSend = function(opcode, data) end

---`Method Public Instance`
---@param data Barotrauma.INetSerializableStruct
_G['CircuitBox'].CreateServerEvent = function(data) end

---`Method Public Instance Virtual`
---@param msg Barotrauma.Networking.IWriteMessage
---@param c Barotrauma.Networking.Client
---@param extraData? Barotrauma.Networking.NetEntityEvent.IData
_G['CircuitBox'].ServerEventWrite = function(msg, c, extraData) end

---`Method Public Instance Virtual`
---@param msg Barotrauma.Networking.IReadMessage
---@param c Barotrauma.Networking.Client
_G['CircuitBox'].ServerEventRead = function(msg, c) end

---`Method Public Instance`
_G['CircuitBox'].CreateInitializationEvent = function() end

---`Method Private Instance`
---@param message System.String
---@param c Barotrauma.Networking.Client
_G['CircuitBox'].ThrowError = function(message, c) end

---`Method Private Instance`
_G['CircuitBox'].BroadcastSelectionStatus = function() end

---`Method Public Instance`
---@overload fun(connectionName:Barotrauma.Identifier):(Barotrauma.Option*1Barotrauma*CircuitBoxConnection)
---@param connection Barotrauma.Items.Components.Connection
---@return Barotrauma.Option*1Barotrauma*CircuitBoxConnection
_G['CircuitBox'].FindInputOutputConnection = function(connection) end

---`Method Public Instance Virtual`
---@param componentElement Barotrauma.ContentXElement
---@param usePrefabValues System.Boolean
---@param idRemap Barotrauma.IdRemap
---@param isItemSwap System.Boolean
_G['CircuitBox'].Load = function(componentElement, usePrefabValues, idRemap, isItemSwap) end

---`Method Public Instance Virtual`
_G['CircuitBox'].OnInventoryChanged = function() end

---`Method Public Instance Virtual`
---@param deltaTime System.Single
---@param cam Barotrauma.Camera
_G['CircuitBox'].Update = function(deltaTime, cam) end

---`Method Public Instance Virtual`
_G['CircuitBox'].OnMapLoaded = function() end

---`Method Private Instance`
_G['CircuitBox'].TryInitializeNodes = function() end

---`Method Public Instance`
---@param loadElement Barotrauma.ContentXElement
_G['CircuitBox'].LoadFromXML = function(loadElement) end

---`Method Public Instance`
---@param original Barotrauma.Items.Components.CircuitBox
---@param clonedContainedItems (System.Collections.Generic.Dictionary*1System*UInt16*1Barotrauma*Item)|({[System.UInt16]:(Barotrauma.Item)})
_G['CircuitBox'].CloneFrom = function(original, clonedContainedItems) end

---`Method Public Instance Virtual`
---@param parentElement System.Xml.Linq.XElement
---@return System.Xml.Linq.XElement
_G['CircuitBox'].Save = function(parentElement) end

---`Method Public Instance`
---@param c Barotrauma.Character
_G['CircuitBox'].OnDeselected = function(c) end

---`Method Public Instance`
---@param one Barotrauma.CircuitBoxConnection
---@param two Barotrauma.CircuitBoxConnection
---@param onCreated (System.Action*1Barotrauma*Items*Components*CircuitBox*CreatedWire)|(fun(obj:Barotrauma.Items.Components.CircuitBox.CreatedWire))
---@param selectedWirePrefab Barotrauma.ItemPrefab
---@return System.Boolean
_G['CircuitBox'].Connect = function(one, two, onCreated, selectedWirePrefab) end

---`Method Private Static`
---@param one Barotrauma.CircuitBoxConnection
---@param two Barotrauma.CircuitBoxConnection
---@return System.Boolean
_G['CircuitBox'].VerifyConnection = function(one, two) end

---`Method Private Instance`
---@param id System.UInt16
---@param color Microsoft.Xna.Framework.Color
---@param pos Microsoft.Xna.Framework.Vector2
---@param header Barotrauma.NetLimitedString
---@param body Barotrauma.NetLimitedString
_G['CircuitBox'].AddLabelInternal = function(id, color, pos, header, body) end

---`Method Private Instance`
---@param ids (System.Collections.Generic.IReadOnlyCollection*1System*UInt16)|(fun():(System.UInt16))
_G['CircuitBox'].RemoveLabelInternal = function(ids) end

---`Method Private Instance`
---@param id System.UInt16
---@param pos Microsoft.Xna.Framework.Vector2
---@param size Microsoft.Xna.Framework.Vector2
_G['CircuitBox'].ResizeLabelInternal = function(id, pos, size) end

---`Method Private Instance`
---@param type Barotrauma.CircuitBoxInputOutputNode.Type
---@param overrides (System.Collections.Generic.Dictionary*1System*String*1System*String)|({[System.String]:(System.String)})
_G['CircuitBox'].RenameConnectionLabelsInternal = function(type, overrides) end

---`Method Private Static`
---@param conn Barotrauma.CircuitBoxConnection
---@return System.Boolean
_G['CircuitBox'].IsExternalConnection = function(conn) end

---`Method Private Instance`
---@param one Barotrauma.CircuitBoxConnection
---@param two Barotrauma.CircuitBoxConnection
---@param id System.UInt16
---@param prefab Barotrauma.ItemPrefab
_G['CircuitBox'].CreateWireWithoutItem = function(one, two, id, prefab) end

---`Method Private Instance`
---@overload fun(one:Barotrauma.CircuitBoxConnection, two:Barotrauma.CircuitBoxConnection, prefab:Barotrauma.ItemPrefab, wireId:System.UInt16, onItemSpawned:(System.Action*1Barotrauma*Item)|(fun(obj:Barotrauma.Item)))
---@param one Barotrauma.CircuitBoxConnection
---@param two Barotrauma.CircuitBoxConnection
---@param wireId System.UInt16
---@param it Barotrauma.Item
_G['CircuitBox'].CreateWireWithItem = function(one, two, wireId, it) end

---`Method Private Instance`
---@param id System.UInt16
---@param prefab Barotrauma.ItemPrefab
---@param backingItem Barotrauma.Option*1Barotrauma*Item
---@param one Barotrauma.CircuitBoxConnection
---@param two Barotrauma.CircuitBoxConnection
_G['CircuitBox'].AddWireDirect = function(id, prefab, backingItem, one, two) end

---`Method Private Instance`
---@param id System.UInt16
---@param color Microsoft.Xna.Framework.Color
---@param header Barotrauma.NetLimitedString
---@param body Barotrauma.NetLimitedString
_G['CircuitBox'].RenameLabelInternal = function(id, color, header, body) end

---`Method Private Instance`
---@param id System.UInt16
---@param prefab Barotrauma.ItemPrefab
---@param usedResource Barotrauma.ItemPrefab
---@param pos Microsoft.Xna.Framework.Vector2
---@param user Barotrauma.Character
---@param onItemSpawned (System.Action*1Barotrauma*Item)|(fun(obj:Barotrauma.Item))
---@return System.Boolean
_G['CircuitBox'].AddComponentInternal = function(id, prefab, usedResource, pos, user, onItemSpawned) end

---`Method Private Instance`
---@param id System.UInt16
---@param backingItem Barotrauma.Item
---@param usedResource Barotrauma.ItemPrefab
---@param pos Microsoft.Xna.Framework.Vector2
_G['CircuitBox'].AddComponentInternalUnsafe = function(id, backingItem, usedResource, pos) end

---`Method Private Static`
---@param characterId System.UInt16
---@param nodes (System.Collections.Generic.IReadOnlyCollection*1Barotrauma*CircuitBoxSelectable)|(fun():(Barotrauma.CircuitBoxSelectable))
_G['CircuitBox'].ClearSelectionFor = function(characterId, nodes) end

---`Method Private Instance`
---@param characterId System.UInt16
_G['CircuitBox'].ClearAllSelectionsInternal = function(characterId) end

---`Method Private Instance`
---@param ids (System.Collections.Generic.IReadOnlyCollection*1System*UInt16)|(fun():(System.UInt16))
---@param characterId System.UInt16
---@param overwrite System.Boolean
_G['CircuitBox'].SelectLabelsInternal = function(ids, characterId, overwrite) end

---`Method Private Instance`
---@param ids (System.Collections.Generic.IReadOnlyCollection*1System*UInt16)|(fun():(System.UInt16))
---@param characterId System.UInt16
---@param overwrite System.Boolean
_G['CircuitBox'].SelectComponentsInternal = function(ids, characterId, overwrite) end

---`Method Private Instance`
---@param nodeIds (System.Collections.Immutable.ImmutableDictionary*1System*UInt16*1Barotrauma*Option*2System*UInt16)|({[System.UInt16]:(Barotrauma.Option*1System*UInt16)})
---@param wireIds (System.Collections.Immutable.ImmutableDictionary*1System*UInt16*1Barotrauma*Option*2System*UInt16)|({[System.UInt16]:(Barotrauma.Option*1System*UInt16)})
---@param inputOutputs (System.Collections.Immutable.ImmutableDictionary*1Barotrauma*CircuitBoxInputOutputNode*Type*1Barotrauma*Option*2System*UInt16)|({[Barotrauma.CircuitBoxInputOutputNode.Type]:(Barotrauma.Option*1System*UInt16)})
---@param labels (System.Collections.Immutable.ImmutableDictionary*1System*UInt16*1Barotrauma*Option*2System*UInt16)|({[System.UInt16]:(Barotrauma.Option*1System*UInt16)})
_G['CircuitBox'].UpdateSelections = function(nodeIds, wireIds, inputOutputs, labels) end

---`Method Private Instance`
---@param ids (System.Collections.Generic.IReadOnlyCollection*1System*UInt16)|(fun():(System.UInt16))
---@param characterId System.UInt16
---@param overwrite System.Boolean
_G['CircuitBox'].SelectWiresInternal = function(ids, characterId, overwrite) end

---`Method Private Instance`
---@param io (System.Collections.Generic.IReadOnlyCollection*1Barotrauma*CircuitBoxInputOutputNode*Type)|(fun():(Barotrauma.CircuitBoxInputOutputNode.Type))
---@param characterId System.UInt16
---@param overwrite System.Boolean
_G['CircuitBox'].SelectInputOutputInternal = function(io, characterId, overwrite) end

---`Method Private Instance`
---@param ids (System.Collections.Generic.IReadOnlyCollection*1System*UInt16)|(fun():(System.UInt16))
_G['CircuitBox'].RemoveComponentInternal = function(ids) end

---`Method Private Instance`
---@param ids (System.Collections.Generic.IReadOnlyCollection*1System*UInt16)|(fun():(System.UInt16))
_G['CircuitBox'].RemoveWireInternal = function(ids) end

---`Method Public Instance`
---@param wireItem Barotrauma.Items.Components.Wire
_G['CircuitBox'].RemoveWire = function(wireItem) end

---`Method Private Instance`
---@param wire Barotrauma.CircuitBoxWire
_G['CircuitBox'].RemoveWireCollectionUnsafe = function(wire) end

---`Method Private Instance`
---@param ids (System.Collections.Generic.IReadOnlyCollection*1System*UInt16)|(fun():(System.UInt16))
---@param ios (System.Collections.Generic.IReadOnlyCollection*1Barotrauma*CircuitBoxInputOutputNode*Type)|(fun():(Barotrauma.CircuitBoxInputOutputNode.Type))
---@param labels (System.Collections.Generic.IReadOnlyCollection*1System*UInt16)|(fun():(System.UInt16))
---@param moveAmount Microsoft.Xna.Framework.Vector2
_G['CircuitBox'].MoveNodesInternal = function(ids, ios, labels, moveAmount) end

---`Method Public Instance Virtual`
---@param character Barotrauma.Character
---@return System.Boolean
_G['CircuitBox'].Select = function(character) end

---`Method Public Instance`
_G['CircuitBox'].OnViewUpdateProjSpecific = function() end

---`Method Public Instance Virtual`
---@param signal Barotrauma.Items.Components.Signal
---@param connection Barotrauma.Items.Components.Connection
_G['CircuitBox'].ReceiveSignal = function(signal, connection) end

---`Method Public Static`
---@return System.Boolean
_G['CircuitBox'].IsRoundRunning = function() end

---`Method Public Static`
---@param itemId System.UInt16
---@param componentIndex System.Byte
---@return Barotrauma.Option*1Barotrauma*Items*Components*CircuitBox
_G['CircuitBox'].FindCircuitBox = function(itemId, componentIndex) end

---`Method Private Instance`
---@param index System.Int32
---@return Barotrauma.Items.Components.ItemContainer
_G['CircuitBox'].GetContainerOrNull = function(index) end

---`Method Public Instance`
---@param ids (System.Collections.Generic.IReadOnlyCollection*1System*UInt16)|(fun():(System.UInt16))
---@param character Barotrauma.Character
_G['CircuitBox'].CreateRefundItemsForUsedResources = function(ids, character) end

---`Method Public Static`
---@param character Barotrauma.Character
---@return (System.Collections.Immutable.ImmutableArray*1Barotrauma*Item)|(Barotrauma.Item[])
_G['CircuitBox'].GetSortedCircuitBoxItemsFromPlayer = function(character) end

---`Method Public Static`
---@param item Barotrauma.Item
---@return System.Boolean
_G['CircuitBox'].CanItemBeAccessed = function(item) end

---`Method Public Instance`
---@return System.Boolean
_G['CircuitBox'].IsLocked = function() end

---`Method Public Static`
---@overload fun(prefab:Barotrauma.ItemPrefab, character:Barotrauma.Character):(Barotrauma.Option*1Barotrauma*Item)
---@param prefab Barotrauma.ItemPrefab
---@param playerItems (System.Collections.Immutable.ImmutableArray*1Barotrauma*Item)|(Barotrauma.Item[])
---@return Barotrauma.Option*1Barotrauma*Item
_G['CircuitBox'].GetApplicableResourcePlayerHas = function(prefab, playerItems) end

---`Method Public Static`
---@param prefab Barotrauma.ItemPrefab
---@param user Barotrauma.Character
---@param container Barotrauma.Items.Components.ItemContainer
---@param onSpawned (System.Action*1Barotrauma*Item)|(fun(obj:Barotrauma.Item))
_G['CircuitBox'].SpawnItem = function(prefab, user, container, onSpawned) end

---`Method Public Static`
---@param item Barotrauma.Item
_G['CircuitBox'].RemoveItem = function(item) end

---`Method Public Static`
---@return System.Boolean
_G['CircuitBox'].IsInGame = function() end

---`Method Public Static`
---@param character Barotrauma.Character
---@return System.Boolean
_G['CircuitBox'].IsCircuitBoxSelected = function(character) end

---`Constructor Public Instance`
---@overload fun(item:Barotrauma.Item, element:Barotrauma.ContentXElement):Barotrauma.Items.Components.CircuitBox
---@return Barotrauma.Items.Components.CircuitBox
_G['CircuitBox'] = function() end

---`Constructor Public Instance`
---@overload fun(item:Barotrauma.Item, element:Barotrauma.ContentXElement):Barotrauma.Items.Components.CircuitBox
---@return Barotrauma.Items.Components.CircuitBox
_G['CircuitBox'].__new = function() end

---`Constructor Private Static`
---@overload fun(item:Barotrauma.Item, element:Barotrauma.ContentXElement):Barotrauma.Items.Components.CircuitBox
---@return Barotrauma.Items.Components.CircuitBox
_G['CircuitBox'] = function() end

---`Constructor Private Static`
---@overload fun(item:Barotrauma.Item, element:Barotrauma.ContentXElement):Barotrauma.Items.Components.CircuitBox
---@return Barotrauma.Items.Components.CircuitBox
_G['CircuitBox'].__new = function() end

