---@meta
---@class Barotrauma.ServerListScreen : Barotrauma.Screen
---`Field Private Instance`
---@field lastRefreshTime System.DateTime
---`Field Private Instance`
---@field menu Barotrauma.GUIFrame
---`Field Private Instance`
---@field serverList Barotrauma.GUIListBox
---`Field Private Instance`
---@field panelAnimator Barotrauma.PanelAnimator
---`Field Private Instance`
---@field serverPreviewContainer Barotrauma.GUIFrame
---`Field Private Instance`
---@field serverPreview Barotrauma.GUIListBox
---`Field Private Instance`
---@field joinButton Barotrauma.GUIButton
---`Field Private Instance`
---@field selectedServer Barotrauma.Option*1Barotrauma*Networking*ServerInfo
---`Field Private Instance`
---@field scanServersButton Barotrauma.GUIButton
---`Field Private Instance`
---@field tabs (System.Collections.Generic.Dictionary*1Barotrauma*ServerListScreen*TabEnum*1Barotrauma*ServerListScreen*Tab)|({[Barotrauma.ServerListScreen.TabEnum]:(Barotrauma.ServerListScreen.Tab)})
---`Field Private Instance`
---@field _selectedTabBackingField Barotrauma.ServerListScreen.TabEnum
---`Field Private Instance`
---@field serverProvider Barotrauma.ServerProvider
---`Field Private Instance`
---@field labelHolder Barotrauma.GUILayoutGroup
---`Field Private Instance`
---@field labelTexts (System.Collections.Generic.List*1Barotrauma*GUITextBlock)|(Barotrauma.GUITextBlock[])
---`Field Private Instance`
---@field searchBox Barotrauma.GUITextBox
---`Field Private Instance`
---@field filterSameVersion Barotrauma.GUITickBox
---`Field Private Instance`
---@field filterPassword Barotrauma.GUITickBox
---`Field Private Instance`
---@field filterFull Barotrauma.GUITickBox
---`Field Private Instance`
---@field filterEmpty Barotrauma.GUITickBox
---`Field Private Instance`
---@field languageDropdown Barotrauma.GUIDropDown
---`Field Private Instance`
---@field ternaryFilters (System.Collections.Generic.Dictionary*1Barotrauma*Identifier*1Barotrauma*GUIDropDown)|({[Barotrauma.Identifier]:(Barotrauma.GUIDropDown)})
---`Field Private Instance`
---@field filterTickBoxes (System.Collections.Generic.Dictionary*1Barotrauma*Identifier*1Barotrauma*GUITickBox)|({[Barotrauma.Identifier]:(Barotrauma.GUITickBox)})
---`Field Private Instance`
---@field playStyleTickBoxes (System.Collections.Generic.Dictionary*1Barotrauma*Identifier*1Barotrauma*GUITickBox)|({[Barotrauma.Identifier]:(Barotrauma.GUITickBox)})
---`Field Private Instance`
---@field gameModeTickBoxes (System.Collections.Generic.Dictionary*1Barotrauma*Identifier*1Barotrauma*GUITickBox)|({[Barotrauma.Identifier]:(Barotrauma.GUITickBox)})
---`Field Private Instance`
---@field filterOffensive Barotrauma.GUITickBox
---`Field Private Instance`
---@field filterFriendlyFireValue Barotrauma.ServerListScreen.TernaryOption
---`Field Private Instance`
---@field filterKarmaValue Barotrauma.ServerListScreen.TernaryOption
---`Field Private Instance`
---@field filterTraitorValue Barotrauma.ServerListScreen.TernaryOption
---`Field Private Instance`
---@field filterVoipValue Barotrauma.ServerListScreen.TernaryOption
---`Field Private Instance`
---@field filterModdedValue Barotrauma.ServerListScreen.TernaryOption
---`Field Private Instance`
---@field sortedBy Barotrauma.ServerListScreen.ColumnLabel
---`Field Private Instance`
---@field sortedAscending System.Boolean
---`Field Private Instance`
---@field currentServerDataRecvCallbackObj System.Object
---`Field Private Instance`
---@field loadingServerFilters System.Boolean
---`Field Private Static`
---@field AllowedRefreshInterval System.TimeSpan
---`Field Private Static`
---@field columns (System.Collections.Immutable.ImmutableDictionary*1Barotrauma*ServerListScreen*ColumnLabel*1Barotrauma*ServerListScreen*Column)|({[Barotrauma.ServerListScreen.ColumnLabel]:(Barotrauma.ServerListScreen.Column)})
---`Field Private Static`
---@field confirmPopupSize Microsoft.Xna.Framework.Vector2
---`Field Private Static`
---@field confirmPopupMinSize Microsoft.Xna.Framework.Point
---`Field Private Static`
---@field sidebarWidth System.Single
---`Getter Private Instance`
---<br/>`Setter Private Instance`
---@field selectedTab Barotrauma.ServerListScreen.TabEnum
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field ClientNameBox Barotrauma.GUITextBox
---`Getter Private Instance`
---@field AllLanguagesVisible System.Boolean
_G['ServerListScreen'] = {}

---`Method Private Static`
---@return System.Threading.Tasks.Task*1System*String
_G['ServerListScreen'].GetDefaultUserName = function() end

---`Method Private Instance`
---@param parent Barotrauma.RectTransform
---@param elementHeight System.Single
---@param tag Barotrauma.Identifier
---@param valueSetter (System.Action*1Barotrauma*ServerListScreen*TernaryOption)|(fun(obj:Barotrauma.ServerListScreen.TernaryOption))
_G['ServerListScreen'].AddTernaryFilter = function(parent, elementHeight, tag, valueSetter) end

---`Method Private Instance`
_G['ServerListScreen'].CreateUI = function() end

---`Method Public Instance`
---@param serverInfo Barotrauma.Networking.ServerInfo
_G['ServerListScreen'].UpdateOrAddServerInfo = function(serverInfo) end

---`Method Public Instance`
---@param info Barotrauma.Networking.ServerInfo
_G['ServerListScreen'].AddToRecentServers = function(info) end

---`Method Public Instance`
---@param info Barotrauma.Networking.ServerInfo
---@return System.Boolean
_G['ServerListScreen'].IsFavorite = function(info) end

---`Method Public Instance`
---@param info Barotrauma.Networking.ServerInfo
_G['ServerListScreen'].AddToFavoriteServers = function(info) end

---`Method Public Instance`
---@param info Barotrauma.Networking.ServerInfo
_G['ServerListScreen'].RemoveFromFavoriteServers = function(info) end

---`Method Private Instance`
---@overload fun(button:Barotrauma.GUIButton, obj:System.Object):(System.Boolean)
---@param sortBy Barotrauma.ServerListScreen.ColumnLabel
---@param toggle System.Boolean
_G['ServerListScreen'].SortList = function(sortBy, toggle) end

---`Method Public Instance`
_G['ServerListScreen'].HideServerPreview = function() end

---`Method Private Instance`
---@param serverInfo Barotrauma.Networking.ServerInfo
---@param component Barotrauma.GUIComponent
_G['ServerListScreen'].InsertServer = function(serverInfo, component) end

---`Method Private Static`
---@param sortBy Barotrauma.ServerListScreen.ColumnLabel
---@param s1 Barotrauma.Networking.ServerInfo
---@param s2 Barotrauma.Networking.ServerInfo
---@param ascending System.Boolean
---@return System.Int32
_G['ServerListScreen'].CompareServer = function(sortBy, s1, s2, ascending) end

---`Method Public Instance Virtual`
_G['ServerListScreen'].Select = function() end

---`Method Public Instance Virtual`
_G['ServerListScreen'].Deselect = function() end

---`Method Public Instance Virtual`
---@param deltaTime System.Double
_G['ServerListScreen'].Update = function(deltaTime) end

---`Method Public Instance`
_G['ServerListScreen'].FilterServers = function() end

---`Method Private Instance`
---@param serverInfo Barotrauma.Networking.ServerInfo
---@return System.Boolean
_G['ServerListScreen'].ShouldShowServer = function(serverInfo) end

---`Method Private Instance`
_G['ServerListScreen'].ShowDirectJoinPrompt = function() end

---`Method Private Instance`
---@overload fun()
---@param userData Barotrauma.ServerListScreen.MsgUserData
_G['ServerListScreen'].RemoveMsgFromServerList = function(userData) end

---`Method Private Instance`
---@param userData Barotrauma.ServerListScreen.MsgUserData
_G['ServerListScreen'].PutMsgInServerList = function(userData) end

---`Method Private Instance`
_G['ServerListScreen'].RefreshServers = function() end

---`Method Private Instance`
---@param serverInfo Barotrauma.Networking.ServerInfo
---@return Barotrauma.GUIComponent
_G['ServerListScreen'].FindFrameMatchingServerInfo = function(serverInfo) end

---`Method Private Instance`
---@return System.ValueTuple*1System*Action*2Barotrauma*Networking*ServerInfo*2Barotrauma*ServerProvider*1System*Action
_G['ServerListScreen'].MakeServerQueryCallbacks = function() end

---`Method Private Instance`
---@param serverInfo Barotrauma.Networking.ServerInfo
---@param skipPing? System.Boolean
_G['ServerListScreen'].AddToServerList = function(serverInfo, skipPing) end

---`Method Private Instance`
---@param info Barotrauma.Networking.ServerInfo
_G['ServerListScreen'].CreateContextMenu = function(info) end

---`Method Public Static`
---@param info Barotrauma.Networking.ServerInfo
_G['ServerListScreen'].CreateFilterServerPrompt = function(info) end

---`Method Public Static`
---@param info Barotrauma.Networking.ServerInfo
_G['ServerListScreen'].CreateReportPrompt = function(info) end

---`Method Private Static`
---@param info Barotrauma.Networking.ServerInfo
---@param reasons (System.Collections.Generic.IEnumerable*1Barotrauma*ServerListScreen*ReportReason)|(fun():(Barotrauma.ServerListScreen.ReportReason))
_G['ServerListScreen'].ReportServer = function(info, reasons) end

---`Method Private Instance`
---@param serverInfo Barotrauma.Networking.ServerInfo
_G['ServerListScreen'].UpdateServerInfoUI = function(serverInfo) end

---`Method Private Instance`
_G['ServerListScreen'].ServerQueryFinished = function() end

---`Method Public Instance`
---@param endpoints (System.Collections.Immutable.ImmutableArray*1Barotrauma*Networking*Endpoint)|(Barotrauma.Networking.Endpoint[])
---@param serverName System.String
_G['ServerListScreen'].JoinServer = function(endpoints, serverName) end

---`Method Private Static`
---@param ping System.Int32
---@return Microsoft.Xna.Framework.Color
_G['ServerListScreen'].GetPingTextColor = function(ping) end

---`Method Public Instance Virtual`
---@param deltaTime System.Double
---@param graphics Microsoft.Xna.Framework.Graphics.GraphicsDevice
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
_G['ServerListScreen'].Draw = function(deltaTime, graphics, spriteBatch) end

---`Method Public Instance Virtual`
_G['ServerListScreen'].AddToGUIUpdateList = function() end

---`Method Public Instance`
_G['ServerListScreen'].StoreServerFilters = function() end

---`Method Public Instance`
_G['ServerListScreen'].LoadServerFilters = function() end

---`Constructor Public Instance`
---@overload fun():Barotrauma.ServerListScreen
---@return Barotrauma.ServerListScreen
_G['ServerListScreen'] = function() end

---`Constructor Public Instance`
---@overload fun():Barotrauma.ServerListScreen
---@return Barotrauma.ServerListScreen
_G['ServerListScreen'].__new = function() end

---`Constructor Private Static`
---@overload fun():Barotrauma.ServerListScreen
---@return Barotrauma.ServerListScreen
_G['ServerListScreen'] = function() end

---`Constructor Private Static`
---@overload fun():Barotrauma.ServerListScreen
---@return Barotrauma.ServerListScreen
_G['ServerListScreen'].__new = function() end

