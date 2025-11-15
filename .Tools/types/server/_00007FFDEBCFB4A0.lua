---@meta
---@class Barotrauma.LuaGame : System.Object
---`Field Public Instance`
---@field ForceVoice System.Nullable*1System*Boolean
---`Field Public Instance`
---@field ForceLocalVoice System.Nullable*1System*Boolean
---`Field Public Instance`
---@field Settings MoonSharp.Interpreter.DynValue
---`Field Public Instance`
---@field allowWifiChat System.Boolean
---`Field Public Instance`
---@field overrideTraitors System.Boolean
---`Field Public Instance`
---@field overrideRespawnSub System.Boolean
---`Field Public Instance`
---@field overrideSignalRadio System.Boolean
---`Field Public Instance`
---@field disableSpamFilter System.Boolean
---`Field Public Instance`
---@field disableDisconnectCharacter System.Boolean
---`Field Public Instance`
---@field enableControlHusk System.Boolean
---`Field Public Instance`
---@field UpdatePriorityItems (System.Collections.Generic.HashSet*1Barotrauma*Item)|(Barotrauma.Item[])
---`Field Public Instance`
---@field UpdatePriorityCharacters (System.Collections.Generic.HashSet*1Barotrauma*Character)|(Barotrauma.Character[])
---`Field Private Instance`
---@field luaAddedCommand (System.Collections.Generic.List*1Barotrauma*DebugConsole*Command)|(Barotrauma.DebugConsole.Command[])
---`Getter Public Instance`
---@field IsSingleplayer System.Boolean
---`Getter Public Instance`
---@field IsMultiplayer System.Boolean
---`Getter Public Instance`
---@field SaveFolder System.String
---`Getter Public Instance`
---@field Server Barotrauma.Networking.GameServer
---`Getter Public Instance`
---@field IsDedicated System.Boolean
---`Getter Public Instance`
---@field Paused System.Boolean
---`Getter Public Instance`
---@field ServerSettings Barotrauma.Networking.ServerSettings
---`Getter Public Instance`
---@field RespawnManager Barotrauma.Networking.RespawnManager
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field MapEntityUpdateInterval System.Int32
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field GapUpdateInterval System.Int32
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field PoweredUpdateInterval System.Int32
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field CharacterUpdateInterval System.Int32
---`Getter Public Instance`
---@field RoundStarted System.Boolean
---`Getter Public Instance`
---@field GameSession Barotrauma.GameSession
---`Getter Public Instance`
---@field NetLobbyScreen Barotrauma.NetLobbyScreen
---`Getter Public Instance`
---@field GameScreen Barotrauma.GameScreen
---`Getter Public Instance`
---@field World FarseerPhysics.Dynamics.World
---`Getter Public Instance`
---@field Peer Barotrauma.Networking.ServerPeer
---`Getter Public Instance`
---@field LuaAddedCommand (System.Collections.Generic.IEnumerable*1Barotrauma*DebugConsole*Command)|(fun():(Barotrauma.DebugConsole.Command))
---`Getter Public Instance`
---@field Commands (System.Collections.Generic.List*1Barotrauma*DebugConsole*Command)|(Barotrauma.DebugConsole.Command[])
_G['Game'] = {}

---`Method Public Instance`
---@param item Barotrauma.Item
_G['Game'].AddPriorityItem = function(item) end

---`Method Public Instance`
---@param item Barotrauma.Item
_G['Game'].RemovePriorityItem = function(item) end

---`Method Public Instance`
_G['Game'].ClearPriorityItem = function() end

---`Method Public Instance`
---@param character Barotrauma.Character
_G['Game'].AddPriorityCharacter = function(character) end

---`Method Public Instance`
---@param character Barotrauma.Character
_G['Game'].RemovePriorityCharacter = function(character) end

---`Method Public Instance`
_G['Game'].ClearPriorityCharacter = function() end

---`Method Public Instance`
---@param o System.Boolean
_G['Game'].OverrideTraitors = function(o) end

---`Method Public Instance`
---@param o System.Boolean
_G['Game'].OverrideRespawnSub = function(o) end

---`Method Public Instance`
---@param o System.Boolean
_G['Game'].AllowWifiChat = function(o) end

---`Method Public Instance`
---@param o System.Boolean
_G['Game'].OverrideSignalRadio = function(o) end

---`Method Public Instance`
---@param o System.Boolean
_G['Game'].DisableSpamFilter = function(o) end

---`Method Public Instance`
---@param o System.Boolean
_G['Game'].DisableDisconnectCharacter = function(o) end

---`Method Public Instance`
---@param o System.Boolean
_G['Game'].EnableControlHusk = function(o) end

---`Method Public Static`
---@param pos Microsoft.Xna.Framework.Vector2
---@param range? System.Single
---@param force? System.Single
---@param damage? System.Single
---@param structureDamage? System.Single
---@param itemDamage? System.Single
---@param empStrength? System.Single
---@param ballastFloraStrength? System.Single
_G['Game'].Explode = function(pos, range, force, damage, structureDamage, itemDamage, empStrength, ballastFloraStrength) end

---`Method Public Static`
---@param name System.String
---@param pos Microsoft.Xna.Framework.Vector2
---@param inventory? System.Boolean
---@param character? Barotrauma.Character
---@return System.String
_G['Game'].SpawnItem = function(name, pos, inventory, character) end

---`Method Public Static`
---@return (Barotrauma.ContentPackage-arr)|(Barotrauma.ContentPackage[])
_G['Game'].GetEnabledContentPackages = function() end

---`Method Public Static`
---@param itemNameOrId System.String
---@return Barotrauma.ItemPrefab
_G['Game'].GetItemPrefab = function(itemNameOrId) end

---`Method Public Static`
---@return Barotrauma.Submarine
_G['Game'].GetRespawnSub = function() end

---`Method Public Static`
---@param sub Barotrauma.Submarine
---@return Barotrauma.Items.Components.Steering
_G['Game'].GetSubmarineSteering = function(sub) end

---`Method Public Static`
---@param item Barotrauma.Item
---@return Barotrauma.Items.Components.WifiComponent
_G['Game'].GetWifiComponent = function(item) end

---`Method Public Static`
---@param item Barotrauma.Item
---@return Barotrauma.Items.Components.LightComponent
_G['Game'].GetLightComponent = function(item) end

---`Method Public Static`
---@param item Barotrauma.Item
---@return Barotrauma.Items.Components.CustomInterface
_G['Game'].GetCustomInterface = function(item) end

---`Method Public Static`
---@param item Barotrauma.Item
---@return Barotrauma.Items.Components.Fabricator
_G['Game'].GetFabricatorComponent = function(item) end

---`Method Public Static`
---@param item Barotrauma.Item
---@return Barotrauma.Items.Components.Holdable
_G['Game'].GetHoldableComponent = function(item) end

---`Method Public Static`
---@param command System.String
_G['Game'].ExecuteCommand = function(command) end

---`Method Public Static`
---@param value System.String
---@param stepsTaken? System.Int32
---@param sender? Barotrauma.Character
---@param source? Barotrauma.Item
---@param power? System.Single
---@param strength? System.Single
---@return Barotrauma.Items.Components.Signal
_G['Game'].CreateSignal = function(value, stepsTaken, sender, source, power, strength) end

---`Method Public Instance`
---@param command Barotrauma.Identifier
---@return System.Boolean
_G['Game'].IsCustomCommandPermitted = function(command) end

---`Method Public Instance`
---@param name System.String
_G['Game'].RemoveCommand = function(name) end

---`Method Public Instance`
---@param name System.String
---@param help System.String
---@param onExecute (Barotrauma.LuaCsAction)|(fun(...:System.Object))
---@param getValidArgs? (Barotrauma.LuaCsFunc)|(fun(...:System.Object):(System.Object))
---@param isCheat? System.Boolean
_G['Game'].AddCommand = function(name, help, onExecute, getValidArgs, isCheat) end

---`Method Public Instance`
---@param names System.String
---@param onExecute System.Object
_G['Game'].AssignOnExecute = function(names, onExecute) end

---`Method Public Instance`
---@param path System.String
_G['Game'].SaveGame = function(path) end

---`Method Public Instance`
---@param path System.String
_G['Game'].LoadGame = function(path) end

---`Method Public Instance`
---@param path System.String
---@param client? Barotrauma.Networking.Client
_G['Game'].LoadCampaign = function(path, client) end

---`Method Public Static`
---@param msg System.String
---@param messageType? System.Nullable*1Barotrauma*Networking*ChatMessageType
---@param sender? Barotrauma.Networking.Client
---@param character? Barotrauma.Character
_G['Game'].SendMessage = function(msg, messageType, sender, character) end

---`Method Public Static`
---@param message Barotrauma.Networking.WriteOnlyMessage
---@param client Barotrauma.Networking.Client
_G['Game'].SendTraitorMessage = function(message, client) end

---`Method Public Static`
---@overload fun(sendername:System.String, text:System.String, sender:Barotrauma.Character, messageType?:Barotrauma.Networking.ChatMessageType, client?:Barotrauma.Networking.Client, iconStyle?:System.String)
---@param chatMessage Barotrauma.Networking.ChatMessage
---@param client Barotrauma.Networking.Client
_G['Game'].SendDirectChatMessage = function(chatMessage, client) end

---`Method Public Static`
---@param message System.String
---@param type Barotrauma.Networking.ServerLog.MessageType
_G['Game'].Log = function(message, type) end

---`Method Public Static`
_G['Game'].DispatchRespawnSub = function() end

---`Method Public Static`
---@return Barotrauma.Networking.GameServer.TryStartGameResult
_G['Game'].StartGame = function() end

---`Method Public Static`
_G['Game'].EndGame = function() end

---`Method Public Instance`
---@param names System.String
---@param onExecute System.Object
_G['Game'].AssignOnClientRequestExecute = function(names, onExecute) end

---`Method Public Instance`
_G['Game'].Stop = function() end

---`Constructor Public Instance`
---@return Barotrauma.LuaGame
_G['Game'] = function() end

---`Constructor Public Instance`
---@return Barotrauma.LuaGame
_G['Game'].__new = function() end

