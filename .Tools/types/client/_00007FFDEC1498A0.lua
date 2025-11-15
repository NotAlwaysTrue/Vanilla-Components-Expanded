---@meta
---@class Barotrauma.CircuitBoxMouseDragSnapshotHandler : System.Object
---`Field Private Instance`
---@field connections (System.Collections.Immutable.ImmutableArray*1Barotrauma*CircuitBoxConnection)|(Barotrauma.CircuitBoxConnection[])
---`Field Private Instance`
---@field lastNodesUnderCursor (System.Collections.Immutable.ImmutableHashSet*1Barotrauma*CircuitBoxNode)|(Barotrauma.CircuitBoxNode[])
---`Field Private Instance`
---@field lastSelectedComponents (System.Collections.Immutable.ImmutableHashSet*1Barotrauma*CircuitBoxNode)|(Barotrauma.CircuitBoxNode[])
---`Field Private Instance`
---@field moveAffectedComponents (System.Collections.Immutable.ImmutableHashSet*1Barotrauma*CircuitBoxNode)|(Barotrauma.CircuitBoxNode[])
---`Field Public Instance`
---@field LastResizeAffectedNode Barotrauma.Option*1System*ValueTuple*2Barotrauma*CircuitBoxResizeDirection*2Barotrauma*CircuitBoxNode
---`Field Public Instance`
---@field LastConnectorUnderCursor Barotrauma.Option*1Barotrauma*CircuitBoxConnection
---`Field Public Instance`
---@field LastWireUnderCursor Barotrauma.Option*1Barotrauma*CircuitBoxWire
---`Field Private Instance`
---@field startClick Microsoft.Xna.Framework.Vector2
---`Field Private Instance`
---@field circuitBoxUi Barotrauma.CircuitBoxUI
---`Field Private Static`
---@field dragTreshold System.Single
---`Getter Public Instance`
---@field Nodes (System.Collections.Generic.IEnumerable*1Barotrauma*CircuitBoxNode)|(fun():(Barotrauma.CircuitBoxNode))
---`Getter Private Instance`
---@field Wires (System.Collections.Generic.IReadOnlyList*1Barotrauma*CircuitBoxWire)|(Barotrauma.CircuitBoxWire[])
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field IsDragging System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field IsWiring System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field IsResizing System.Boolean
_G['CircuitBoxMouseDragSnapshotHandler'] = {}

---`Method Public Instance`
---@return (System.Collections.Immutable.ImmutableHashSet*1Barotrauma*CircuitBoxNode)|(Barotrauma.CircuitBoxNode[])
_G['CircuitBoxMouseDragSnapshotHandler'].GetLastComponentsUnderCursor = function() end

---`Method Public Instance`
---@return (System.Collections.Immutable.ImmutableHashSet*1Barotrauma*CircuitBoxNode)|(Barotrauma.CircuitBoxNode[])
_G['CircuitBoxMouseDragSnapshotHandler'].GetMoveAffectedComponents = function() end

---`Method Public Instance`
_G['CircuitBoxMouseDragSnapshotHandler'].StartDragging = function() end

---`Method Public Instance`
_G['CircuitBoxMouseDragSnapshotHandler'].ClearSnapshot = function() end

---`Method Public Instance`
_G['CircuitBoxMouseDragSnapshotHandler'].UpdateConnections = function() end

---`Method Public Instance`
---@param cursorPos Microsoft.Xna.Framework.Vector2
---@return Barotrauma.Option*1Barotrauma*CircuitBoxConnection
_G['CircuitBoxMouseDragSnapshotHandler'].FindConnectorUnderCursor = function(cursorPos) end

---`Method Public Instance`
---@param cursorPos Microsoft.Xna.Framework.Vector2
---@return Barotrauma.Option*1Barotrauma*CircuitBoxWire
_G['CircuitBoxMouseDragSnapshotHandler'].FindWireUnderCursor = function(cursorPos) end

---`Method Public Instance`
---@param cursorPos Microsoft.Xna.Framework.Vector2
---@return (System.Collections.Immutable.ImmutableHashSet*1Barotrauma*CircuitBoxNode)|(Barotrauma.CircuitBoxNode[])
_G['CircuitBoxMouseDragSnapshotHandler'].FindNodesUnderCursor = function(cursorPos) end

---`Method Private Instance`
---@param cursorPos Microsoft.Xna.Framework.Vector2
_G['CircuitBoxMouseDragSnapshotHandler'].SnapshotNodesUnderCursor = function(cursorPos) end

---`Method Private Instance`
---@param nodes (System.Collections.Immutable.ImmutableHashSet*1Barotrauma*CircuitBoxNode)|(Barotrauma.CircuitBoxNode[])
---@param cursorPos Microsoft.Xna.Framework.Vector2
---@return Barotrauma.Option*1System*ValueTuple*2Barotrauma*CircuitBoxResizeDirection*2Barotrauma*CircuitBoxNode
_G['CircuitBoxMouseDragSnapshotHandler'].FindResizeBorderUnderCursor = function(nodes, cursorPos) end

---`Method Private Instance`
_G['CircuitBoxMouseDragSnapshotHandler'].SnapshotSelectedNodes = function() end

---`Method Private Instance`
_G['CircuitBoxMouseDragSnapshotHandler'].SnapshotMoveAffectedNodes = function() end

---`Method Public Instance`
---@param mousePos Microsoft.Xna.Framework.Vector2
---@return Microsoft.Xna.Framework.Vector2
_G['CircuitBoxMouseDragSnapshotHandler'].GetDragAmount = function(mousePos) end

---`Method Public Instance`
_G['CircuitBoxMouseDragSnapshotHandler'].EndDragging = function() end

---`Method Public Instance`
---@param cursorPos Microsoft.Xna.Framework.Vector2
_G['CircuitBoxMouseDragSnapshotHandler'].UpdateDrag = function(cursorPos) end

---`Constructor Public Instance`
---@param ui Barotrauma.CircuitBoxUI
---@return Barotrauma.CircuitBoxMouseDragSnapshotHandler
_G['CircuitBoxMouseDragSnapshotHandler'] = function(ui) end

---`Constructor Public Instance`
---@param ui Barotrauma.CircuitBoxUI
---@return Barotrauma.CircuitBoxMouseDragSnapshotHandler
_G['CircuitBoxMouseDragSnapshotHandler'].__new = function(ui) end

