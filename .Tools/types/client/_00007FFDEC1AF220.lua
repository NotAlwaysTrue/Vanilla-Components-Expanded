---@meta
---@class Barotrauma.GUIProgressBar : Barotrauma.GUIComponent
---`Field Private Instance`
---@field isHorizontal System.Boolean
---`Field Private Instance`
---@field frame Barotrauma.GUIFrame
---`Field Private Instance`
---@field slider Barotrauma.GUIFrame
---`Field Private Instance`
---@field barSize System.Single
---`Field Private Instance`
---@field showFrame System.Boolean
---`Field Public Instance`
---@field ProgressGetter (Barotrauma.GUIProgressBar.ProgressGetterHandler)|(fun():(System.Single))
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field IsHorizontal System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field BarSize System.Single
_G['GUI']['ProgressBar'] = {}

---`Method Public Instance`
---@param fillAmount System.Single
---@return Microsoft.Xna.Framework.Rectangle
_G['GUI']['ProgressBar'].GetSliderRect = function(fillAmount) end

---`Method NonPublic Instance Virtual`
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
_G['GUI']['ProgressBar'].Draw = function(spriteBatch) end

---`Constructor Public Instance`
---@param rectT Barotrauma.RectTransform
---@param barSize System.Single
---@param color? System.Nullable*1Microsoft*Xna*Framework*Color
---@param style? System.String
---@param showFrame? System.Boolean
---@return Barotrauma.GUIProgressBar
_G['GUI']['ProgressBar'] = function(rectT, barSize, color, style, showFrame) end

---`Constructor Public Instance`
---@param rectT Barotrauma.RectTransform
---@param barSize System.Single
---@param color? System.Nullable*1Microsoft*Xna*Framework*Color
---@param style? System.String
---@param showFrame? System.Boolean
---@return Barotrauma.GUIProgressBar
_G['GUI']['ProgressBar'].__new = function(rectT, barSize, color, style, showFrame) end

