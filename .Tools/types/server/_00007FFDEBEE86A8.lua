---@meta
---@class Barotrauma.PriceInfo : System.Object
---`Field Private Instance`
---@field minReputation (System.Collections.Generic.Dictionary*1Barotrauma*Identifier*1System*Single)|({[Barotrauma.Identifier]:(System.Single)})
---`Field Private Static`
---@field DefaultMinAmount System.Int32
---`Field Private Static`
---@field DefaultMaxAmount System.Int32
---`Getter Public Instance`
---@field Price System.Int32
---`Getter Public Instance`
---@field CanBeBought System.Boolean
---`Getter Public Instance`
---@field MinAvailableAmount System.Int32
---`Getter Public Instance`
---@field MaxAvailableAmount System.Int32
---`Getter Public Instance`
---@field CanBeSpecial System.Boolean
---`Getter Public Instance`
---@field MinLevelDifficulty System.Int32
---`Getter Public Instance`
---@field BuyingPriceMultiplier System.Single
---`Getter Public Instance`
---@field DisplayNonEmpty System.Boolean
---`Getter Public Instance`
---@field StoreIdentifier Barotrauma.Identifier
---`Getter Public Instance`
---@field RequiresUnlock System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field RequiredFaction Barotrauma.Identifier
---`Getter Public Instance`
---@field MinReputation (System.Collections.Generic.IReadOnlyDictionary*1Barotrauma*Identifier*1System*Single)|({[Barotrauma.Identifier]:(System.Single)})
_G['PriceInfo'] = {}

---`Method Private Instance`
---@param priceInfoElement System.Xml.Linq.XElement
_G['PriceInfo'].LoadReputationRestrictions = function(priceInfoElement) end

---`Method Public Static`
---@param element System.Xml.Linq.XElement
---@param defaultPrice Barotrauma.PriceInfo-ref
---@return (System.Collections.Generic.List*1Barotrauma*PriceInfo)|(Barotrauma.PriceInfo[])
_G['PriceInfo'].CreatePriceInfos = function(element, defaultPrice) end

---`Method Private Static`
---@param element System.Xml.Linq.XElement
---@param defaultValue System.Int32
---@return System.Int32
_G['PriceInfo'].GetMinAmount = function(element, defaultValue) end

---`Method Private Static`
---@param element System.Xml.Linq.XElement
---@param defaultValue System.Int32
---@return System.Int32
_G['PriceInfo'].GetMaxAmount = function(element, defaultValue) end

---`Method Public Static`
---@param element System.Xml.Linq.XElement
---@return System.Boolean
_G['PriceInfo'].HasMinAmountDefined = function(element) end

---`Method Public Static`
---@param element System.Xml.Linq.XElement
---@return System.Boolean
_G['PriceInfo'].HasMaxAmountDefined = function(element) end

---`Method Public Static`
---@param element System.Xml.Linq.XElement
---@return System.Boolean
_G['PriceInfo'].HasSoldDefined = function(element) end

---`Method Public Static`
---@param element System.Xml.Linq.XElement
---@return System.String
_G['PriceInfo'].GetMinAmountString = function(element) end

---`Method Public Static`
---@param element System.Xml.Linq.XElement
---@return System.String
_G['PriceInfo'].GetMaxAmountString = function(element) end

---`Method Public Static`
---@param element System.Xml.Linq.XElement
---@param defaultValue? System.Boolean
---@return System.Boolean
_G['PriceInfo'].GetSold = function(element, defaultValue) end

---`Method Public Static`
---@param element System.Xml.Linq.XElement
---@param defaultValue? System.Int32
---@return System.Int32
_G['PriceInfo'].GetMinLevelDifficulty = function(element, defaultValue) end

---`Method Public Static`
---@param element System.Xml.Linq.XElement
---@param defaultValue? System.String
---@return System.String
_G['PriceInfo'].GetStoreIdentifier = function(element, defaultValue) end

---`Constructor Public Instance`
---@overload fun(element:System.Xml.Linq.XElement):Barotrauma.PriceInfo
---@param price System.Int32
---@param canBeBought System.Boolean
---@param minAmount? System.Int32
---@param maxAmount? System.Int32
---@param canBeSpecial? System.Boolean
---@param minLevelDifficulty? System.Int32
---@param buyingPriceMultiplier? System.Single
---@param displayNonEmpty? System.Boolean
---@param requiresUnlock? System.Boolean
---@param storeIdentifier? System.String
---@return Barotrauma.PriceInfo
_G['PriceInfo'] = function(price, canBeBought, minAmount, maxAmount, canBeSpecial, minLevelDifficulty, buyingPriceMultiplier, displayNonEmpty, requiresUnlock, storeIdentifier) end

---`Constructor Public Instance`
---@overload fun(element:System.Xml.Linq.XElement):Barotrauma.PriceInfo
---@param price System.Int32
---@param canBeBought System.Boolean
---@param minAmount? System.Int32
---@param maxAmount? System.Int32
---@param canBeSpecial? System.Boolean
---@param minLevelDifficulty? System.Int32
---@param buyingPriceMultiplier? System.Single
---@param displayNonEmpty? System.Boolean
---@param requiresUnlock? System.Boolean
---@param storeIdentifier? System.String
---@return Barotrauma.PriceInfo
_G['PriceInfo'].__new = function(price, canBeBought, minAmount, maxAmount, canBeSpecial, minLevelDifficulty, buyingPriceMultiplier, displayNonEmpty, requiresUnlock, storeIdentifier) end

