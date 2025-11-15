---@meta
---@class Barotrauma.GameMain : Microsoft.Xna.Framework.Game
---`Field Public Instance`
---@field ConsoleArguments (System.Collections.Immutable.ImmutableArray*1System*String)|(System.String[])
---`Field Public Instance`
---@field EgsExchangeCode Barotrauma.Option*1System*String
---`Field Private Instance`
---@field loadingScreenOpen System.Boolean
---`Field Private Instance`
---@field initialLoadingThread System.Threading.Thread
---`Field Private Instance`
---@field fixedTime Microsoft.Xna.Framework.GameTime
---`Field Public Instance`
---@field ConnectCommand Barotrauma.Option*1Barotrauma*Networking*ConnectCommand
---`Field Private Instance`
---@field clientName System.String
---`Field Private Instance`
---@field defaultViewport Microsoft.Xna.Framework.Graphics.Viewport
---`Field Private Instance`
---@field ResolutionChanged (System.Action)|(fun())
---`Field Public Static`
---@field LuaCs Barotrauma.LuaCsSetup
---`Field Public Static`
---@field ShowFPS System.Boolean
---`Field Public Static`
---@field ShowPerf System.Boolean
---`Field Public Static`
---@field DebugDraw System.Boolean
---`Field Public Static`
---@field DevMode System.Boolean
---`Field Public Static`
---@field PerformanceCounter Barotrauma.PerformanceCounter
---`Field Private Static`
---@field performanceCounterTimer System.Diagnostics.Stopwatch
---`Field Private Static`
---@field updateCount System.Int32
---`Field Public Static`
---@field Version System.Version
---`Field Public Static`
---@field GameScreen Barotrauma.GameScreen
---`Field Public Static`
---@field MainMenuScreen Barotrauma.MainMenuScreen
---`Field Public Static`
---@field NetLobbyScreen Barotrauma.NetLobbyScreen
---`Field Public Static`
---@field ModDownloadScreen Barotrauma.ModDownloadScreen
---`Field Public Static`
---@field ServerListScreen Barotrauma.ServerListScreen
---`Field Public Static`
---@field SubEditorScreen Barotrauma.SubEditorScreen
---`Field Public Static`
---@field TestScreen Barotrauma.TestScreen
---`Field Public Static`
---@field ParticleEditorScreen Barotrauma.ParticleEditorScreen
---`Field Public Static`
---@field LevelEditorScreen Barotrauma.LevelEditorScreen
---`Field Public Static`
---@field SpriteEditorScreen Barotrauma.SpriteEditorScreen
---`Field Public Static`
---@field EventEditorScreen Barotrauma.EventEditorScreen
---`Field Public Static`
---@field CharacterEditorScreen Barotrauma.CharacterEditor.CharacterEditorScreen
---`Field Public Static`
---@field CampaignEndScreen Barotrauma.CampaignEndScreen
---`Field Public Static`
---@field LightManager Barotrauma.Lights.LightManager
---`Field Public Static`
---@field SoundManager Barotrauma.Sounds.SoundManager
---`Field Private Static`
---@field gameSession Barotrauma.GameSession
---`Field Public Static`
---@field ParticleManager Barotrauma.Particles.ParticleManager
---`Field Private Static`
---@field world FarseerPhysics.Dynamics.World
---`Field Public Static`
---@field TitleScreen Barotrauma.LoadingScreen
---`Field Private Static`
---@field spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
---`Field Public Static`
---@field Client Barotrauma.Networking.GameClient
---`Field Public Static`
---@field FirstLoad System.Boolean
---`Field Public Static`
---@field CancelQuickStart System.Boolean
---`Field Private Static`
---@field contentLoaded System.Boolean
---`Field Private Static`
---@field postContentLoadActions (System.Collections.Generic.Queue*1System*Action)|(fun():((System.Action)|(fun())))
---`Field Private Static`
---@field waitForKeyHit System.Boolean
---`Field Private Static`
---@field GfxProfile Microsoft.Xna.Framework.Graphics.GraphicsProfile
---`Getter Public Static`
---@field IsSingleplayer System.Boolean
---`Getter Public Static`
---@field IsMultiplayer System.Boolean
---`Getter Public Static`
---<br/>`Setter Private Static`
---@field CurrentUpdateRate System.Int32
---`Getter Public Static`
---<br/>`Setter Private Static`
---@field MainThread System.Threading.Thread
---`Getter Public Static`
---@field VanillaContent Barotrauma.ContentPackage
---`Getter Public Static`
---<br/>`Setter Public Static`
---@field GameSession Barotrauma.GameSession
---`Getter Public Static`
---<br/>`Setter Public Static`
---@field World FarseerPhysics.Dynamics.World
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field HasLoaded System.Boolean
---`Getter Public Static`
---<br/>`Setter Private Static`
---@field IsExiting System.Boolean
---`Getter Public Static`
---<br/>`Setter Private Static`
---@field IsFirstLaunch System.Boolean
---`Getter Public Static`
---<br/>`Setter Private Static`
---@field Instance Barotrauma.GameMain
---`Getter Public Static`
---<br/>`Setter Private Static`
---@field GraphicsDeviceManager Microsoft.Xna.Framework.GraphicsDeviceManager
---`Getter Public Static`
---<br/>`Setter Private Static`
---@field WindowMode Barotrauma.WindowMode
---`Getter Public Static`
---<br/>`Setter Private Static`
---@field GraphicsWidth System.Int32
---`Getter Public Static`
---<br/>`Setter Private Static`
---@field GraphicsHeight System.Int32
---`Getter Public Static`
---@field WindowActive System.Boolean
---`Getter Public Static`
---@field NetworkMember Barotrauma.Networking.NetworkMember
---`Getter Public Static`
---<br/>`Setter Private Static`
---@field ScissorTestEnable Microsoft.Xna.Framework.Graphics.RasterizerState
---`Getter Public Instance`
---@field LoadingScreenOpen System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field Paused System.Boolean
---`Getter Public Static`
---<br/>`Setter Public Static`
---@field ActiveChatMode Barotrauma.ChatMode
_G['GameMain'] = {}

---`Method Public Static`
_G['GameMain'].ResetNetLobbyScreen = function() end

---`Method Public Static`
---@param action (System.Action)|(fun())
_G['GameMain'].ExecuteAfterContentFinishedLoading = function(action) end

---`Method Public Static`
---@param sender System.Object
---@param args Microsoft.Xna.Framework.FileDropEventArgs
_G['GameMain'].OnFileDropped = function(sender, args) end

---`Method Public Instance`
---@param recalculateFontsAndStyles? System.Boolean
_G['GameMain'].ApplyGraphicsSettings = function(recalculateFontsAndStyles) end

---`Method Public Instance`
---@param windowMode Barotrauma.WindowMode
---@param display System.Int32
_G['GameMain'].SetWindowMode = function(windowMode, display) end

---`Method Public Instance`
_G['GameMain'].ResetViewPort = function() end

---`Method NonPublic Instance Virtual`
_G['GameMain'].Initialize = function() end

---`Method NonPublic Instance Virtual`
_G['GameMain'].LoadContent = function() end

---`Method Private Instance`
_G['GameMain'].Load = function() end

---`Method Private Static`
_G['GameMain'].ProcessLaunchCountEos = function() end

---`Method NonPublic Instance Virtual`
_G['GameMain'].UnloadContent = function() end

---`Method Private Instance`
---@overload fun(friend:Steamworks.Friend, connectCommand:System.String)
---@param connectCommand System.String
_G['GameMain'].OnInvitedToSteamGame = function(connectCommand) end

---`Method Private Instance`
---@param lobby Steamworks.Data.Lobby
---@param friendId Steamworks.SteamId
_G['GameMain'].OnSteamLobbyJoinRequested = function(lobby, friendId) end

---`Method NonPublic Instance Virtual`
---@param gameTime Microsoft.Xna.Framework.GameTime
_G['GameMain'].Update = function(gameTime) end

---`Method Public Static`
_G['GameMain'].ResetFrameTime = function() end

---`Method Private Instance`
_G['GameMain'].FixRazerCortex = function() end

---`Method NonPublic Instance Virtual`
---@param gameTime Microsoft.Xna.Framework.GameTime
_G['GameMain'].Draw = function(gameTime) end

---`Method Public Static`
---@overload fun(save:System.Boolean, showVerificationPrompt:System.Boolean)
---@param save System.Boolean
_G['GameMain'].QuitToMainMenu = function(save) end

---`Method Public Instance`
_G['GameMain'].ShowBugReporter = function() end

---`Method Public Instance`
---@param loader (System.Collections.Generic.IEnumerable*1Barotrauma*CoroutineStatus)|(fun():(Barotrauma.CoroutineStatus))
---@param waitKeyHit? System.Boolean
---@return Barotrauma.CoroutineHandle
_G['GameMain'].ShowLoading = function(loader, waitKeyHit) end

---`Method NonPublic Instance Virtual`
---@param sender System.Object
---@param args System.EventArgs
_G['GameMain'].OnExiting = function(sender, args) end

---`Method Public Static`
---@overload fun(url:System.String, promptTextTag?:System.String, promptExtensionTag?:System.String):(Barotrauma.GUIMessageBox)
---@param url System.String
---@param promptText Barotrauma.LocalizedString
---@return Barotrauma.GUIMessageBox
_G['GameMain'].ShowOpenUriPrompt = function(url, promptText) end

---`Method Public Static`
_G['GameMain'].ResetIMEWorkaround = function() end

---`Constructor Public Instance`
---@overload fun(args:(System.String-arr)|(System.String[])):Barotrauma.GameMain
---@return Barotrauma.GameMain
_G['GameMain'] = function() end

---`Constructor Public Instance`
---@overload fun(args:(System.String-arr)|(System.String[])):Barotrauma.GameMain
---@return Barotrauma.GameMain
_G['GameMain'].__new = function() end

---`Constructor Private Static`
---@overload fun(args:(System.String-arr)|(System.String[])):Barotrauma.GameMain
---@return Barotrauma.GameMain
_G['GameMain'] = function() end

---`Constructor Private Static`
---@overload fun(args:(System.String-arr)|(System.String[])):Barotrauma.GameMain
---@return Barotrauma.GameMain
_G['GameMain'].__new = function() end

