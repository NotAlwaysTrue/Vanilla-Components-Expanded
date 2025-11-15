---@meta
---@class Barotrauma.CircuitBoxInputOutputNode : Barotrauma.CircuitBoxNode
---`Field Public Instance`
---@field NodeType Barotrauma.CircuitBoxInputOutputNode.Type
---`Field Public Instance`
---@field ConnectionLabelOverrides (System.Collections.Generic.Dictionary*1System*String*1System*String)|({[System.String]:(System.String)})
---`Field Private Static`
---@field PromptUserData System.String
---`Field Private Static`
---@field MaxConnectionLabelLength System.Int32
---`Field Private Static`
---@field ConnectionLabelOverrideElementName System.String
_G['CircuitBoxInputOutputNode'] = {}

---`Method Public Instance`
---@param parent Barotrauma.GUIComponent
_G['CircuitBoxInputOutputNode'].PromptEdit = function(parent) end

---`Method Public Instance`
---@param parent Barotrauma.GUIComponent
_G['CircuitBoxInputOutputNode'].RemoveEditPrompt = function(parent) end

---`Method Public Instance`
---@param replace (System.Collections.Generic.Dictionary*1System*String*1System*String)|({[System.String]:(System.String)})
_G['CircuitBoxInputOutputNode'].ReplaceAllConnectionLabelOverrides = function(replace) end

---`Method Private Instance`
---@param conns (System.Collections.Generic.IReadOnlyList*1Barotrauma*CircuitBoxConnection)|(Barotrauma.CircuitBoxConnection[])
_G['CircuitBoxInputOutputNode'].InitSize = function(conns) end

---`Method Public Instance`
---@return System.Xml.Linq.XElement
_G['CircuitBoxInputOutputNode'].Save = function() end

---`Method Public Instance`
---@param element Barotrauma.ContentXElement
_G['CircuitBoxInputOutputNode'].Load = function(element) end

---`Constructor Public Instance`
---@param conns (System.Collections.Generic.IReadOnlyList*1Barotrauma*CircuitBoxConnection)|(Barotrauma.CircuitBoxConnection[])
---@param initialPosition Microsoft.Xna.Framework.Vector2
---@param type Barotrauma.CircuitBoxInputOutputNode.Type
---@param circuitBox Barotrauma.Items.Components.CircuitBox
---@return Barotrauma.CircuitBoxInputOutputNode
_G['CircuitBoxInputOutputNode'] = function(conns, initialPosition, type, circuitBox) end

---`Constructor Public Instance`
---@param conns (System.Collections.Generic.IReadOnlyList*1Barotrauma*CircuitBoxConnection)|(Barotrauma.CircuitBoxConnection[])
---@param initialPosition Microsoft.Xna.Framework.Vector2
---@param type Barotrauma.CircuitBoxInputOutputNode.Type
---@param circuitBox Barotrauma.Items.Components.CircuitBox
---@return Barotrauma.CircuitBoxInputOutputNode
_G['CircuitBoxInputOutputNode'].__new = function(conns, initialPosition, type, circuitBox) end

