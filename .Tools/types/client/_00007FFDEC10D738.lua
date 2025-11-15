---@meta
---@class Barotrauma.Items.Components.Signal : System.ValueType
---`Field Public Instance`
---@field value System.String
---`Field Public Instance`
---@field stepsTaken System.Int32
---`Field Public Instance`
---@field sender Barotrauma.Character
---`Field Public Instance`
---@field source Barotrauma.Item
---`Field Public Instance`
---@field power System.Single
---`Field Public Instance`
---@field strength System.Single
---`Field Public Instance`
---@field CreationTime System.Double
---`Getter Public Instance`
---@field TimeSinceCreated System.Double
_G['Signal'] = {}

---`Method NonPublic Instance`
---@param stepsTaken System.Int32
---@return Barotrauma.Items.Components.Signal
_G['Signal'].WithStepsTaken = function(stepsTaken) end

---`Constructor Public Instance`
---@param value System.String
---@param stepsTaken? System.Int32
---@param sender? Barotrauma.Character
---@param source? Barotrauma.Item
---@param power? System.Single
---@param strength? System.Single
---@return Barotrauma.Items.Components.Signal
_G['Signal'] = function(value, stepsTaken, sender, source, power, strength) end

---`Constructor Public Instance`
---@param value System.String
---@param stepsTaken? System.Int32
---@param sender? Barotrauma.Character
---@param source? Barotrauma.Item
---@param power? System.Single
---@param strength? System.Single
---@return Barotrauma.Items.Components.Signal
_G['Signal'].__new = function(value, stepsTaken, sender, source, power, strength) end

