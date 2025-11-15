---@meta
---@class Barotrauma.Reputation : System.Object
---`Field Private Instance`
---@field metaDataIdentifier Barotrauma.Identifier
---`Field Public Instance`
---@field OnReputationValueChanged Barotrauma.NamedEvent*1Barotrauma*Reputation
---`Field Public Instance`
---@field Faction Barotrauma.Faction
---`Field Public Instance`
---@field Location Barotrauma.Location
---`Field Public Static`
---@field OnAnyReputationValueChanged Barotrauma.NamedEvent*1Barotrauma*Reputation
---`Field Public Static`
---@field HostileThreshold System.Single
---`Field Public Static`
---@field ReputationLossPerNPCDamage System.Single
---`Field Public Static`
---@field ReputationLossPerWallDamage System.Single
---`Field Public Static`
---@field ReputationLossPerStolenItemPrice System.Single
---`Field Public Static`
---@field MinReputationLossPerStolenItem System.Single
---`Field Public Static`
---@field MaxReputationLossPerStolenItem System.Single
---`Field Public Static`
---@field MaxReputationLossFromNPCDamage System.Single
---`Field Public Static`
---@field MaxReputationLossFromWallDamage System.Single
---`Getter Public Instance`
---@field Identifier Barotrauma.Identifier
---`Getter Public Instance`
---@field MinReputation System.Int32
---`Getter Public Instance`
---@field MaxReputation System.Int32
---`Getter Public Instance`
---@field InitialReputation System.Int32
---`Getter Public Instance`
---@field Metadata Barotrauma.CampaignMetadata
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field ReputationAtRoundStart System.Single
---`Getter Public Instance`
---@field NormalizedValue System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field Value System.Single
_G['Reputation'] = {}

---`Method Public Instance`
---@param newReputation System.Single
_G['Reputation'].SetReputation = function(newReputation) end

---`Method Public Instance`
---@param reputationChange System.Single
---@return System.Single
_G['Reputation'].GetReputationChangeMultiplier = function(reputationChange) end

---`Method Public Instance`
---@param reputationChange System.Single
---@param maxReputationChangePerRound? System.Single
_G['Reputation'].AddReputation = function(reputationChange, maxReputationChangePerRound) end

---`Method Public Instance`
---@return Barotrauma.LocalizedString
_G['Reputation'].GetReputationName = function() end

---`Method Public Static`
---@param normalizedValue System.Single
---@return Barotrauma.LocalizedString
_G['Reputation'].GetReputationName = function(normalizedValue) end

---`Method Public Static`
---@param normalizedValue System.Single
---@return Microsoft.Xna.Framework.Color
_G['Reputation'].GetReputationColor = function(normalizedValue) end

---`Method Public Instance`
---@param addColorTags? System.Boolean
---@return Barotrauma.LocalizedString
_G['Reputation'].GetFormattedReputationText = function(addColorTags) end

---`Method Public Static`
---@param normalizedValue System.Single
---@param value System.Single
---@param addColorTags? System.Boolean
---@return Barotrauma.LocalizedString
_G['Reputation'].GetFormattedReputationText = function(normalizedValue, value, addColorTags) end

---`Constructor Public Instance`
---@overload fun(metadata:Barotrauma.CampaignMetadata, location:Barotrauma.Location, identifier:Barotrauma.Identifier, minReputation:System.Int32, maxReputation:System.Int32, initialReputation:System.Int32):Barotrauma.Reputation
---@overload fun(metadata:Barotrauma.CampaignMetadata, faction:Barotrauma.Faction, minReputation:System.Int32, maxReputation:System.Int32, initialReputation:System.Int32):Barotrauma.Reputation
---@overload fun(metadata:Barotrauma.CampaignMetadata, faction:Barotrauma.Faction, location:Barotrauma.Location, identifier:Barotrauma.Identifier, minReputation:System.Int32, maxReputation:System.Int32, initialReputation:System.Int32):Barotrauma.Reputation
---@return Barotrauma.Reputation
_G['Reputation'] = function() end

---`Constructor Public Instance`
---@overload fun(metadata:Barotrauma.CampaignMetadata, location:Barotrauma.Location, identifier:Barotrauma.Identifier, minReputation:System.Int32, maxReputation:System.Int32, initialReputation:System.Int32):Barotrauma.Reputation
---@overload fun(metadata:Barotrauma.CampaignMetadata, faction:Barotrauma.Faction, minReputation:System.Int32, maxReputation:System.Int32, initialReputation:System.Int32):Barotrauma.Reputation
---@overload fun(metadata:Barotrauma.CampaignMetadata, faction:Barotrauma.Faction, location:Barotrauma.Location, identifier:Barotrauma.Identifier, minReputation:System.Int32, maxReputation:System.Int32, initialReputation:System.Int32):Barotrauma.Reputation
---@return Barotrauma.Reputation
_G['Reputation'].__new = function() end

---`Constructor Private Instance`
---@overload fun(metadata:Barotrauma.CampaignMetadata, location:Barotrauma.Location, identifier:Barotrauma.Identifier, minReputation:System.Int32, maxReputation:System.Int32, initialReputation:System.Int32):Barotrauma.Reputation
---@overload fun(metadata:Barotrauma.CampaignMetadata, faction:Barotrauma.Faction, minReputation:System.Int32, maxReputation:System.Int32, initialReputation:System.Int32):Barotrauma.Reputation
---@overload fun(metadata:Barotrauma.CampaignMetadata, faction:Barotrauma.Faction, location:Barotrauma.Location, identifier:Barotrauma.Identifier, minReputation:System.Int32, maxReputation:System.Int32, initialReputation:System.Int32):Barotrauma.Reputation
---@return Barotrauma.Reputation
_G['Reputation'] = function() end

---`Constructor Private Instance`
---@overload fun(metadata:Barotrauma.CampaignMetadata, location:Barotrauma.Location, identifier:Barotrauma.Identifier, minReputation:System.Int32, maxReputation:System.Int32, initialReputation:System.Int32):Barotrauma.Reputation
---@overload fun(metadata:Barotrauma.CampaignMetadata, faction:Barotrauma.Faction, minReputation:System.Int32, maxReputation:System.Int32, initialReputation:System.Int32):Barotrauma.Reputation
---@overload fun(metadata:Barotrauma.CampaignMetadata, faction:Barotrauma.Faction, location:Barotrauma.Location, identifier:Barotrauma.Identifier, minReputation:System.Int32, maxReputation:System.Int32, initialReputation:System.Int32):Barotrauma.Reputation
---@return Barotrauma.Reputation
_G['Reputation'].__new = function() end

---`Constructor Private Static`
---@overload fun(metadata:Barotrauma.CampaignMetadata, location:Barotrauma.Location, identifier:Barotrauma.Identifier, minReputation:System.Int32, maxReputation:System.Int32, initialReputation:System.Int32):Barotrauma.Reputation
---@overload fun(metadata:Barotrauma.CampaignMetadata, faction:Barotrauma.Faction, minReputation:System.Int32, maxReputation:System.Int32, initialReputation:System.Int32):Barotrauma.Reputation
---@overload fun(metadata:Barotrauma.CampaignMetadata, faction:Barotrauma.Faction, location:Barotrauma.Location, identifier:Barotrauma.Identifier, minReputation:System.Int32, maxReputation:System.Int32, initialReputation:System.Int32):Barotrauma.Reputation
---@return Barotrauma.Reputation
_G['Reputation'] = function() end

---`Constructor Private Static`
---@overload fun(metadata:Barotrauma.CampaignMetadata, location:Barotrauma.Location, identifier:Barotrauma.Identifier, minReputation:System.Int32, maxReputation:System.Int32, initialReputation:System.Int32):Barotrauma.Reputation
---@overload fun(metadata:Barotrauma.CampaignMetadata, faction:Barotrauma.Faction, minReputation:System.Int32, maxReputation:System.Int32, initialReputation:System.Int32):Barotrauma.Reputation
---@overload fun(metadata:Barotrauma.CampaignMetadata, faction:Barotrauma.Faction, location:Barotrauma.Location, identifier:Barotrauma.Identifier, minReputation:System.Int32, maxReputation:System.Int32, initialReputation:System.Int32):Barotrauma.Reputation
---@return Barotrauma.Reputation
_G['Reputation'].__new = function() end

