---@meta
---@class Barotrauma.LoadingScreen : System.Object
---`Field Private Instance`
---@field defaultBackgroundTexture Barotrauma.Sprite
---`Field Private Instance`
---@field overlay Barotrauma.Sprite
---`Field Private Instance`
---@field decorativeGraph Barotrauma.SpriteSheet
---`Field Private Instance`
---@field decorativeMap Barotrauma.SpriteSheet
---`Field Private Instance`
---@field currentBackgroundTexture Barotrauma.Sprite
---`Field Private Instance`
---@field noiseSprite Barotrauma.Sprite
---`Field Private Instance`
---@field randText System.String
---`Field Private Instance`
---@field languageSelectionCursor Barotrauma.Sprite
---`Field Private Instance`
---@field languageSelectionFont Barotrauma.ScalableFont
---`Field Private Instance`
---@field languageSelectionFontCJK Barotrauma.ScalableFont
---`Field Private Instance`
---@field currSplashScreen Barotrauma.Media.Video
---`Field Private Instance`
---@field videoStartTime System.DateTime
---`Field Public Instance`
---@field PendingSplashScreens (System.Collections.Concurrent.ConcurrentQueue*1Barotrauma*LoadingScreen*PendingSplashScreen)|(fun():(Barotrauma.LoadingScreen.PendingSplashScreen))
---`Field Private Instance`
---@field selectedTip Barotrauma.RichString
---`Field Private Instance`
---@field selectedTipString System.String
---`Field Private Instance`
---@field selectedTipRichTextData System.Nullable*1System*Collections*Immutable*ImmutableArray*2Barotrauma*RichTextData
---`Field Public Instance`
---@field LoadState System.Single
---`Field Public Instance`
---@field AvailableLanguages (Barotrauma.LanguageIdentifier-arr)|(Barotrauma.LanguageIdentifier[])
---`Field Private Instance`
---@field drawn System.Boolean
---`Getter Public Instance`
---@field PlayingSplashScreen System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field WaitForLanguageSelection System.Boolean
_G['LoadingScreen'] = {}

---`Method Private Instance`
---@param tip Barotrauma.LocalizedString
_G['LoadingScreen'].SetSelectedTip = function(tip) end

---`Method Public Instance`
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
---@param graphics Microsoft.Xna.Framework.Graphics.GraphicsDevice
---@param deltaTime System.Single
_G['LoadingScreen'].Draw = function(spriteBatch, graphics, deltaTime) end

---`Method Private Instance`
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
---@param graphicsDevice Microsoft.Xna.Framework.Graphics.GraphicsDevice
_G['LoadingScreen'].DrawLanguageSelectionPrompt = function(spriteBatch, graphicsDevice) end

---`Method Private Instance`
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
---@param graphics Microsoft.Xna.Framework.Graphics.GraphicsDevice
_G['LoadingScreen'].DrawSplashScreen = function(spriteBatch, graphics) end

---`Method Private Instance`
_G['LoadingScreen'].DisableSplashScreen = function() end

---`Method Public Instance`
---@param loader (System.Collections.Generic.IEnumerable*1Barotrauma*CoroutineStatus)|(fun():(Barotrauma.CoroutineStatus))
---@return (System.Collections.Generic.IEnumerable*1Barotrauma*CoroutineStatus)|(fun():(Barotrauma.CoroutineStatus))
_G['LoadingScreen'].DoLoading = function(loader) end

---`Constructor Public Instance`
---@param graphics Microsoft.Xna.Framework.Graphics.GraphicsDevice
---@return Barotrauma.LoadingScreen
_G['LoadingScreen'] = function(graphics) end

---`Constructor Public Instance`
---@param graphics Microsoft.Xna.Framework.Graphics.GraphicsDevice
---@return Barotrauma.LoadingScreen
_G['LoadingScreen'].__new = function(graphics) end

