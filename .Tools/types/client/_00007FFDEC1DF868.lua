---@meta
---@class Barotrauma.CampaignEndScreen : Barotrauma.Screen
---`Field Private Instance`
---@field creditsPlayer Barotrauma.CreditsPlayer
---`Field Private Instance`
---@field cam Barotrauma.Camera
---`Field Public Instance`
---@field OnFinished (System.Action)|(fun())
---`Field NonPublic Instance`
---@field slideshowPlayer Barotrauma.SlideshowPlayer
_G['CampaignEndScreen'] = {}

---`Method Public Instance Virtual`
_G['CampaignEndScreen'].Select = function() end

---`Method Public Instance Virtual`
_G['CampaignEndScreen'].Deselect = function() end

---`Method Public Instance Virtual`
---@param deltaTime System.Double
_G['CampaignEndScreen'].Update = function(deltaTime) end

---`Method Public Instance Virtual`
---@param deltaTime System.Double
---@param graphics Microsoft.Xna.Framework.Graphics.GraphicsDevice
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
_G['CampaignEndScreen'].Draw = function(deltaTime, graphics, spriteBatch) end

---`Constructor Public Instance`
---@return Barotrauma.CampaignEndScreen
_G['CampaignEndScreen'] = function() end

---`Constructor Public Instance`
---@return Barotrauma.CampaignEndScreen
_G['CampaignEndScreen'].__new = function() end

