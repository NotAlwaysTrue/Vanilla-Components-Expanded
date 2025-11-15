---@meta
---@class Barotrauma.ChatBox : System.Object
---`Field Private Instance`
---@field chatBox Barotrauma.GUIListBox
---`Field Private Instance`
---@field screenResolution Microsoft.Xna.Framework.Point
---`Field Public Instance`
---@field ChatManager Barotrauma.ChatManager
---`Field Private Instance`
---@field _toggleOpen System.Boolean
---`Field Private Instance`
---@field openState System.Single
---`Field Public Instance`
---@field CloseAfterMessageSent System.Boolean
---`Field Private Instance`
---@field prevUIScale System.Single
---`Field Private Instance`
---@field channelSettingsFrame Barotrauma.GUIFrame
---`Field Private Instance`
---@field radioJammedWarning Barotrauma.GUITextBlock
---`Field Private Instance`
---@field channelText Barotrauma.GUITextBox
---`Field Private Instance`
---@field channelPickerContent Barotrauma.GUILayoutGroup
---`Field Private Instance`
---@field memButton Barotrauma.GUIButton
---`Field Private Instance`
---@field prevRadio Barotrauma.Items.Components.WifiComponent
---`Field Private Instance`
---@field channelMemPending System.Boolean
---`Field Private Instance`
---@field popupMessages (System.Collections.Generic.List*1Barotrauma*GUIComponent)|(Barotrauma.GUIComponent[])
---`Field Private Instance`
---@field toggleButton Barotrauma.GUIButton
---`Field Private Instance`
---@field showNewMessagesButton Barotrauma.GUIButton
---`Field Private Instance`
---@field hideableElements Barotrauma.GUIFrame
---`Field Private Instance`
---@field popupMessageOffset System.Int32
---`Field Public Static`
---@field PreferChatBoxOpen System.Boolean
---`Field Public Static`
---@field RadioChatString System.String
---`Field Private Static`
---@field PopupMessageDuration System.Single
---`Field Public Static`
---@field ToggleButtonWidthRaw System.Int32
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field IsSinglePlayer System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field ToggleOpen System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field OnEnterMessage (Barotrauma.GUITextBox.OnEnterHandler)|(fun(textBox:Barotrauma.GUITextBox, text:System.String):(System.Boolean))
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field GUIFrame Barotrauma.GUIFrame
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field InputBox Barotrauma.GUITextBox
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field ToggleButton Barotrauma.GUIButton
---`Getter Private Instance`
---<br/>`Setter Private Instance`
---@field ChatModeDropDown Barotrauma.GUIDropDown
_G['ChatBox'] = {}

---`Method Public Static`
---@return Barotrauma.ChatBox
_G['ChatBox'].GetChatBox = function() end

---`Method Public Static`
_G['ChatBox'].AutoHideChatBox = function() end

---`Method Private Instance`
---@param value System.Boolean
---@param setPreference? System.Boolean
_G['ChatBox'].SetToggleOpenState = function(value, setPreference) end

---`Method Public Static`
_G['ChatBox'].ResetChatBoxOpenState = function() end

---`Method Public Instance`
_G['ChatBox'].ResetOpenState = function() end

---`Method Private Static`
---@param isOpen System.Boolean
_G['ChatBox'].SetChatBoxOpen = function(isOpen) end

---`Method Private Instance`
---@param value System.Boolean
_G['ChatBox'].SetOpen = function(value) end

---`Method Public Instance`
_G['ChatBox'].Toggle = function() end

---`Method Public Instance`
---@param textBox Barotrauma.GUITextBox
---@param text System.String
---@return System.Boolean
_G['ChatBox'].TypingChatMessage = function(textBox, text) end

---`Method Public Instance`
---@param message Barotrauma.Networking.ChatMessage
_G['ChatBox'].AddMessage = function(message) end

---`Method Public Instance`
---@param visible System.Boolean
_G['ChatBox'].SetVisibility = function(visible) end

---`Method Private Instance`
---@param message Barotrauma.GUIComponent
---@param animDuration System.Single
---@return (System.Collections.Generic.IEnumerable*1Barotrauma*CoroutineStatus)|(fun():(Barotrauma.CoroutineStatus))
_G['ChatBox'].UpdateMessageAnimation = function(message, animDuration) end

---`Method Private Instance`
_G['ChatBox'].SetUILayout = function() end

---`Method Public Instance`
---@param deltaTime System.Single
_G['ChatBox'].Update = function(deltaTime) end

---`Method Private Instance`
---@param channel System.Int32
---@param setText System.Boolean
_G['ChatBox'].SetChannel = function(channel, setText) end

---`Method Private Instance`
---@param index System.Int32
---@param channel System.Int32
_G['ChatBox'].SetChannelMemory = function(index, channel) end

---`Method Public Instance`
---@overload fun()
---@param inputBox Barotrauma.GUITextBox
---@param selectInputBox System.Boolean
---@param chatKeyStates Barotrauma.ChatBox.ChatKeyStates
_G['ChatBox'].ApplySelectionInputs = function(inputBox, selectInputBox, chatKeyStates) end

---`Constructor Public Instance`
---@overload fun(parent:Barotrauma.GUIComponent, isSinglePlayer:System.Boolean):Barotrauma.ChatBox
---@return Barotrauma.ChatBox
_G['ChatBox'] = function() end

---`Constructor Public Instance`
---@overload fun(parent:Barotrauma.GUIComponent, isSinglePlayer:System.Boolean):Barotrauma.ChatBox
---@return Barotrauma.ChatBox
_G['ChatBox'].__new = function() end

---`Constructor Private Static`
---@overload fun(parent:Barotrauma.GUIComponent, isSinglePlayer:System.Boolean):Barotrauma.ChatBox
---@return Barotrauma.ChatBox
_G['ChatBox'] = function() end

---`Constructor Private Static`
---@overload fun(parent:Barotrauma.GUIComponent, isSinglePlayer:System.Boolean):Barotrauma.ChatBox
---@return Barotrauma.ChatBox
_G['ChatBox'].__new = function() end

