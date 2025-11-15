---@meta
---@class Barotrauma.Networking.ServerLog : System.Object
---`Field Public Instance`
---@field LogFrame Barotrauma.GUIButton
---`Field Private Instance`
---@field listBox Barotrauma.GUIListBox
---`Field Private Instance`
---@field reverseButton Barotrauma.GUIButton
---`Field Private Instance`
---@field msgFilter System.String
---`Field Private Instance`
---@field reverseOrder System.Boolean
---`Field Private Instance`
---@field msgTypeHidden (System.Boolean-arr)|(System.Boolean[])
---`Field Private Instance`
---@field messageColor (System.Collections.Generic.Dictionary*1Barotrauma*Networking*ServerLog*MessageType*1Microsoft*Xna*Framework*Color)|({[Barotrauma.Networking.ServerLog.MessageType]:(Microsoft.Xna.Framework.Color)})
---`Field Private Instance`
---@field messageTypeName (System.Collections.Generic.Dictionary*1Barotrauma*Networking*ServerLog*MessageType*1System*String)|({[Barotrauma.Networking.ServerLog.MessageType]:(System.String)})
---`Field Private Instance`
---@field linesPerFile System.Int32
---`Field Private Instance`
---@field lines (System.Collections.Generic.Queue*1Barotrauma*Networking*ServerLog*LogMessage)|(fun():(Barotrauma.Networking.ServerLog.LogMessage))
---`Field Private Instance`
---@field unsavedLines (System.Collections.Generic.Queue*1Barotrauma*Networking*ServerLog*LogMessage)|(fun():(Barotrauma.Networking.ServerLog.LogMessage))
---`Field Public Instance`
---@field ServerName System.String
---`Field Private Static`
---@field MaxLines System.Int32
---`Field Public Static`
---@field SavePath System.String
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field LinesPerFile System.Int32
_G['ServerLog'] = {}

---`Method Private Instance`
---@param btn Barotrauma.GUIButton
---@param obj System.Object
---@return System.Boolean
_G['ServerLog'].OnReverseClicked = function(btn, obj) end

---`Method Public Instance`
_G['ServerLog'].CreateLogFrame = function() end

---`Method Public Instance`
---@param inReverseButton Barotrauma.GUIButton
---@param inListBox Barotrauma.GUIListBox
---@param tickBoxContainer Barotrauma.GUIComponent
---@param searchBox Barotrauma.GUITextBox
_G['ServerLog'].AssignLogFrame = function(inReverseButton, inListBox, tickBoxContainer, searchBox) end

---`Method Private Instance`
---@param line Barotrauma.Networking.ServerLog.LogMessage
_G['ServerLog'].AddLine = function(line) end

---`Method Private Instance`
---@return System.Boolean
_G['ServerLog'].FilterMessages = function() end

---`Method Private Instance`
---@param message Barotrauma.Networking.ServerLog.LogMessage
---@return System.Boolean
_G['ServerLog'].ShouldFilterMessage = function(message) end

---`Method Private Instance`
---@param reverse System.Boolean
_G['ServerLog'].SetMessageReversal = function(reverse) end

---`Method Public Instance`
---@param button Barotrauma.GUIComponent
---@param _ System.Object
---@return System.Boolean
_G['ServerLog'].ClearFilter = function(button, _) end

---`Method Public Instance`
---@param line System.String
---@param messageType Barotrauma.Networking.ServerLog.MessageType
---@param logToConsole? System.Boolean
_G['ServerLog'].WriteLine = function(line, messageType, logToConsole) end

---`Method Public Instance`
_G['ServerLog'].Save = function() end

---`Constructor Public Instance`
---@param serverName System.String
---@return Barotrauma.Networking.ServerLog
_G['ServerLog'] = function(serverName) end

---`Constructor Public Instance`
---@param serverName System.String
---@return Barotrauma.Networking.ServerLog
_G['ServerLog'].__new = function(serverName) end

