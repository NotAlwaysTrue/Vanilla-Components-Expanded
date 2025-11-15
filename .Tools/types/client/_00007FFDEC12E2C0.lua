---@meta
---@class Barotrauma.Items.Components.Quality : Barotrauma.Items.Components.ItemComponent
---`Field Private Instance`
---@field statValues (System.Collections.Generic.Dictionary*1Barotrauma*Items*Components*Quality*StatType*1System*Single)|({[Barotrauma.Items.Components.Quality.StatType]:(System.Single)})
---`Field Private Instance`
---@field qualityLevel System.Int32
---`Field Public Static`
---@field MaxQuality System.Int32
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field QualityLevel System.Int32
_G['Components']['Quality'] = {}

---`Method Public Instance Virtual`
---@param name Barotrauma.LocalizedString-ref
---@param description Barotrauma.LocalizedString-ref
_G['Components']['Quality'].AddTooltipInfo = function(name, description) end

---`Method Public Instance`
---@param statType Barotrauma.Items.Components.Quality.StatType
---@return System.Single
_G['Components']['Quality'].GetValue = function(statType) end

---`Method Public Static`
---@param submarine Barotrauma.Submarine
---@param level Barotrauma.Level
---@param randSync? Barotrauma.Rand.RandSync
---@return System.Int32
_G['Components']['Quality'].GetSpawnedItemQuality = function(submarine, level, randSync) end

---`Constructor Public Instance`
---@param item Barotrauma.Item
---@param element Barotrauma.ContentXElement
---@return Barotrauma.Items.Components.Quality
_G['Components']['Quality'] = function(item, element) end

---`Constructor Public Instance`
---@param item Barotrauma.Item
---@param element Barotrauma.ContentXElement
---@return Barotrauma.Items.Components.Quality
_G['Components']['Quality'].__new = function(item, element) end

