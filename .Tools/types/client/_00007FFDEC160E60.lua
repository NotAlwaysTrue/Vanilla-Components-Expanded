---@meta
---@class Barotrauma.AddOrDeleteCommand : Barotrauma.Command
---`Field Private Instance`
---@field PreviousInventories (System.Collections.Generic.Dictionary*1Barotrauma*InventorySlotItem*1Barotrauma*Inventory)|({[Barotrauma.InventorySlotItem]:(Barotrauma.Inventory)})
---`Field Public Instance`
---@field Receivers (System.Collections.Generic.List*1Barotrauma*MapEntity)|(Barotrauma.MapEntity[])
---`Field Private Instance`
---@field CloneList (System.Collections.Generic.List*1Barotrauma*MapEntity)|(Barotrauma.MapEntity[])
---`Field Private Instance`
---@field WasDeleted System.Boolean
---`Field Private Instance`
---@field ContainedItemsCommand (System.Collections.Generic.List*1Barotrauma*AddOrDeleteCommand)|(Barotrauma.AddOrDeleteCommand[])
---`Field Private Instance`
---@field CircuitBoxData (System.Collections.Generic.List*1System*Xml*Linq*XElement)|(System.Xml.Linq.XElement[])
_G['AddOrDeleteCommand'] = {}

---`Method Public Instance Virtual`
_G['AddOrDeleteCommand'].Execute = function() end

---`Method Public Instance Virtual`
_G['AddOrDeleteCommand'].UnExecute = function() end

---`Method Private Instance`
---@param redo System.Boolean
_G['AddOrDeleteCommand'].Process = function(redo) end

---`Method Private Instance`
---@param items (System.Collections.Immutable.ImmutableArray*1Barotrauma*Item)|(Barotrauma.Item[])
_G['AddOrDeleteCommand'].ApplyCircuitBoxDataIfAny = function(items) end

---`Method Public Instance Virtual`
_G['AddOrDeleteCommand'].Cleanup = function() end

---`Method Private Instance`
---@param redo System.Boolean
---@return (System.Collections.Immutable.ImmutableArray*1Barotrauma*Item)|(Barotrauma.Item[])
_G['AddOrDeleteCommand'].DeleteUndelete = function(redo) end

---`Method Public Instance`
---@param master Barotrauma.AddOrDeleteCommand
_G['AddOrDeleteCommand'].MergeInto = function(master) end

---`Method Public Instance Virtual`
---@return Barotrauma.LocalizedString
_G['AddOrDeleteCommand'].GetDescription = function() end

---`Constructor Public Instance`
---@param receivers (System.Collections.Generic.List*1Barotrauma*MapEntity)|(Barotrauma.MapEntity[])
---@param wasDeleted System.Boolean
---@param handleInventoryBehavior? System.Boolean
---@return Barotrauma.AddOrDeleteCommand
_G['AddOrDeleteCommand'] = function(receivers, wasDeleted, handleInventoryBehavior) end

---`Constructor Public Instance`
---@param receivers (System.Collections.Generic.List*1Barotrauma*MapEntity)|(Barotrauma.MapEntity[])
---@param wasDeleted System.Boolean
---@param handleInventoryBehavior? System.Boolean
---@return Barotrauma.AddOrDeleteCommand
_G['AddOrDeleteCommand'].__new = function(receivers, wasDeleted, handleInventoryBehavior) end

