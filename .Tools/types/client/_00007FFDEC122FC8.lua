---@meta
---@class Barotrauma.Items.Components.Terminal : Barotrauma.Items.Components.ItemComponent
---`Field Private Instance`
---@field historyBox Barotrauma.GUIListBox
---`Field Private Instance`
---@field fillerBlock Barotrauma.GUITextBlock
---`Field Private Instance`
---@field inputBox Barotrauma.GUITextBox
---`Field Private Instance`
---@field layoutGroup Barotrauma.GUILayoutGroup
---`Field Private Instance`
---@field shouldSelectInputBox System.Boolean
---`Field Private Instance`
---@field inputElements (System.Collections.Generic.List*1Barotrauma*GUIComponent)|(Barotrauma.GUIComponent[])
---`Field Private Instance`
---@field messageHistory (System.Collections.Generic.List*1Barotrauma*Items*Components*TerminalMessage)|(Barotrauma.Items.Components.TerminalMessage[])
---`Field Private Instance`
---@field welcomeMessage System.String
---`Field Private Instance`
---@field textColor Microsoft.Xna.Framework.Color
---`Field Private Instance`
---@field _readonly System.Boolean
---`Field Private Instance`
---@field prevColorSignal System.String
---`Field Private Static`
---@field MaxMessageLength System.Int32
---`Field Private Static`
---@field MaxMessages System.Int32
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field DisplayedWelcomeMessage Barotrauma.LocalizedString
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field WelcomeMessage System.String
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field ShowMessage System.String
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field UseMonospaceFont System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field AutoHideScrollbar System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field WelcomeMessageDisplayed System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field TextColor Microsoft.Xna.Framework.Color
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field LineStartSymbol System.String
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Readonly System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field AutoScrollToBottom System.Boolean
---`Getter Private Instance`
---<br/>`Setter Private Instance`
---@field OutputValue System.String
_G['Components']['Terminal'] = {}

---`Method Private Instance`
_G['Components']['Terminal'].RefreshInputElements = function() end

---`Method Public Instance`
---@return Barotrauma.GUIComponent
_G['Components']['Terminal'].CreateFillerBlock = function() end

---`Method Private Instance`
---@param input System.String
_G['Components']['Terminal'].SendOutput = function(input) end

---`Method Public Instance Virtual`
---@param character Barotrauma.Character
---@return System.Boolean
_G['Components']['Terminal'].Select = function(character) end

---`Method Public Instance Virtual`
---@param order? System.Int32
_G['Components']['Terminal'].AddToGUIUpdateList = function(order) end

---`Method Public Instance Virtual`
---@param msg Barotrauma.Networking.IWriteMessage
---@param extraData? Barotrauma.Networking.NetEntityEvent.IData
_G['Components']['Terminal'].ClientEventWrite = function(msg, extraData) end

---`Method Public Instance Virtual`
---@param msg Barotrauma.Networking.IReadMessage
---@param sendingTime System.Single
_G['Components']['Terminal'].ClientEventRead = function(msg, sendingTime) end

---`Method Private Instance`
---@param element System.Xml.Linq.XElement
_G['Components']['Terminal'].InitProjSpecific = function(element) end

---`Method Private Instance`
---@param input System.String
---@param addToHistory System.Boolean
---@param color Microsoft.Xna.Framework.Color
---@param isWelcomeMessage System.Boolean
_G['Components']['Terminal'].ShowOnDisplay = function(input, addToHistory, color, isWelcomeMessage) end

---`Method Public Instance Virtual`
---@param signal Barotrauma.Items.Components.Signal
---@param connection Barotrauma.Items.Components.Connection
_G['Components']['Terminal'].ReceiveSignal = function(signal, connection) end

---`Method Public Instance Virtual`
_G['Components']['Terminal'].OnItemLoaded = function() end

---`Method Public Instance Virtual`
---@param parentElement System.Xml.Linq.XElement
---@return System.Xml.Linq.XElement
_G['Components']['Terminal'].Save = function(parentElement) end

---`Method Public Instance Virtual`
---@param componentElement Barotrauma.ContentXElement
---@param usePrefabValues System.Boolean
---@param idRemap Barotrauma.IdRemap
---@param isItemSwap System.Boolean
_G['Components']['Terminal'].Load = function(componentElement, usePrefabValues, idRemap, isItemSwap) end

---`Constructor Public Instance`
---@param item Barotrauma.Item
---@param element Barotrauma.ContentXElement
---@return Barotrauma.Items.Components.Terminal
_G['Components']['Terminal'] = function(item, element) end

---`Constructor Public Instance`
---@param item Barotrauma.Item
---@param element Barotrauma.ContentXElement
---@return Barotrauma.Items.Components.Terminal
_G['Components']['Terminal'].__new = function(item, element) end

