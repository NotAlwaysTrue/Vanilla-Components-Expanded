---@meta
---@class Barotrauma.CharacterInfo : System.Object
---`Field Public Instance`
---@field LastControlled System.Boolean
---`Field Private Instance`
---@field disguisedPortrait Barotrauma.Sprite
---`Field Private Instance`
---@field disguisedAttachmentSprites (System.Collections.Generic.List*1Barotrauma*WearableSprite)|(Barotrauma.WearableSprite[])
---`Field Private Instance`
---@field disguisedSheetIndex System.Nullable*1Microsoft*Xna*Framework*Vector2
---`Field Private Instance`
---@field disguisedJobIcon Barotrauma.Sprite
---`Field Private Instance`
---@field disguisedJobColor Microsoft.Xna.Framework.Color
---`Field Private Instance`
---@field disguisedHairColor Microsoft.Xna.Framework.Color
---`Field Private Instance`
---@field disguisedFacialHairColor Microsoft.Xna.Framework.Color
---`Field Private Instance`
---@field disguisedSkinColor Microsoft.Xna.Framework.Color
---`Field Private Instance`
---@field tintMask Barotrauma.Sprite
---`Field Private Instance`
---@field tintHighlightThreshold System.Single
---`Field Private Instance`
---@field tintHighlightMultiplier System.Single
---`Field Public Instance`
---@field ShowTalentResetPopupOnOpen System.Boolean
---`Field Private Instance`
---@field headEffectParameters Microsoft.Xna.Framework.Graphics.SpriteBatch.EffectWithParams
---`Field Private Instance`
---@field attachmentEffectParameters (System.Collections.Generic.Dictionary*1Barotrauma*WearableType*1Microsoft*Xna*Framework*Graphics*SpriteBatch*EffectWithParams)|({[Barotrauma.WearableType]:(Microsoft.Xna.Framework.Graphics.SpriteBatch.EffectWithParams)})
---`Field Private Instance`
---@field head Barotrauma.CharacterInfo.HeadInfo
---`Field Private Instance`
---@field maleIdentifier Barotrauma.Identifier
---`Field Private Instance`
---@field femaleIdentifier Barotrauma.Identifier
---`Field Public Instance`
---@field InventoryData System.Xml.Linq.XElement
---`Field Public Instance`
---@field HealthData System.Xml.Linq.XElement
---`Field Public Instance`
---@field OrderData System.Xml.Linq.XElement
---`Field Public Instance`
---@field PermanentlyDead System.Boolean
---`Field Public Instance`
---@field RenamingEnabled System.Boolean
---`Field Private Instance`
---@field botStatus Barotrauma.BotStatus
---`Field Public Instance`
---@field PendingSpawnToActiveService System.Boolean
---`Field Public Instance`
---@field Name System.String
---`Field Public Instance`
---@field Title Barotrauma.LocalizedString
---`Field Public Instance`
---@field HumanPrefabIds System.ValueTuple*1Barotrauma*Identifier*1Barotrauma*Identifier
---`Field Private Instance`
---@field _humanPrefab Barotrauma.HumanPrefab
---`Field Private Instance`
---@field character Barotrauma.Character
---`Field Public Instance`
---@field Job Barotrauma.Job
---`Field Public Instance`
---@field Salary System.Int32
---`Field Private Instance`
---@field talentRefundPoints System.Int32
---`Field Private Instance`
---@field talentResetCount System.Int32
---`Field Public Instance`
---@field MinReputationToHire System.ValueTuple*1Barotrauma*Identifier*1System*Single
---`Field Private Instance`
---@field additionalTalentPoints System.Int32
---`Field Private Instance`
---@field _headSprite Barotrauma.Sprite
---`Field Public Instance`
---@field OmitJobInMenus System.Boolean
---`Field Private Instance`
---@field portrait Barotrauma.Sprite
---`Field Public Instance`
---@field IsDisguised System.Boolean
---`Field Public Instance`
---@field IsDisguisedAsAnother System.Boolean
---`Field Private Instance`
---@field attachmentSprites (System.Collections.Generic.List*1Barotrauma*WearableSprite)|(Barotrauma.WearableSprite[])
---`Field Public Instance`
---@field StartItemsGiven System.Boolean
---`Field Public Instance`
---@field IsNewHire System.Boolean
---`Field Public Instance`
---@field CauseOfDeath Barotrauma.CauseOfDeath
---`Field Public Instance`
---@field TeamID Barotrauma.CharacterTeamType
---`Field Public Instance`
---@field ID System.UInt16
---`Field Public Instance`
---@field HasSpecifierTags System.Boolean
---`Field Private Instance`
---@field ragdoll Barotrauma.RagdollParams
---`Field Public Instance`
---@field HairColors (System.Collections.Immutable.ImmutableArray*1System*ValueTuple*2Microsoft*Xna*Framework*Color*2System*Single)|(System.ValueTuple*1Microsoft*Xna*Framework*Color*1System*Single[])
---`Field Public Instance`
---@field FacialHairColors (System.Collections.Immutable.ImmutableArray*1System*ValueTuple*2Microsoft*Xna*Framework*Color*2System*Single)|(System.ValueTuple*1Microsoft*Xna*Framework*Color*1System*Single[])
---`Field Public Instance`
---@field SkinColors (System.Collections.Immutable.ImmutableArray*1System*ValueTuple*2Microsoft*Xna*Framework*Color*2System*Single)|(System.ValueTuple*1Microsoft*Xna*Framework*Color*1System*Single[])
---`Field Public Instance`
---@field MissionsCompletedSinceDeath System.Int32
---`Field Public Instance`
---@field LastRewardDistribution Barotrauma.Option*1System*Int32
---`Field Private Instance`
---@field hairs (System.Collections.Generic.List*1Barotrauma*ContentXElement)|(Barotrauma.ContentXElement[])
---`Field Private Instance`
---@field beards (System.Collections.Generic.List*1Barotrauma*ContentXElement)|(Barotrauma.ContentXElement[])
---`Field Private Instance`
---@field moustaches (System.Collections.Generic.List*1Barotrauma*ContentXElement)|(Barotrauma.ContentXElement[])
---`Field Private Instance`
---@field faceAttachments (System.Collections.Generic.List*1Barotrauma*ContentXElement)|(Barotrauma.ContentXElement[])
---`Field Private Instance`
---@field wearables (System.Collections.Generic.IEnumerable*1Barotrauma*ContentXElement)|(fun():(Barotrauma.ContentXElement))
---`Field Private Instance`
---@field spriteTagsLoaded System.Boolean
---`Field Public Instance`
---@field SavedStatValues (System.Collections.Generic.Dictionary*1Barotrauma*StatTypes*1System*Collections*Generic*List*2Barotrauma*SavedStatValue)|({[Barotrauma.StatTypes]:((System.Collections.Generic.List*1Barotrauma*SavedStatValue)|(Barotrauma.SavedStatValue[]))})
---`Field Public Instance`
---@field LastResistanceMultiplierSkillLossDeath System.Single
---`Field Public Instance`
---@field LastResistanceMultiplierSkillLossRespawn System.Single
---`Field Private Static`
---@field infoAreaPortraitBG Barotrauma.Sprite
---`Field Private Static`
---@field idCounter System.UInt16
---`Field Private Static`
---@field skillGainStatValues (System.Collections.Immutable.ImmutableDictionary*1Barotrauma*Identifier*1Barotrauma*StatTypes)|({[Barotrauma.Identifier]:(Barotrauma.StatTypes)})
---`Field Private Static`
---@field disguiseName System.String
---`Field Public Static`
---@field MaxAdditionalTalentPoints System.Int32
---`Field Public Static`
---@field MaxCurrentOrders System.Int32
---`Field Private Static`
---@field BaseExperienceRequired System.Int32
---`Field Private Static`
---@field AddedExperienceRequiredPerLevel System.Int32
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field CrewListIndex System.Int32
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Head Barotrauma.CharacterInfo.HeadInfo
---`Getter Public Instance`
---@field IsMale System.Boolean
---`Getter Public Instance`
---@field IsFemale System.Boolean
---`Getter Public Instance`
---@field Prefab Barotrauma.CharacterInfoPrefab
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field BotStatus Barotrauma.BotStatus
---`Getter Public Instance`
---@field IsOnReserveBench System.Boolean
---`Getter Public Instance`
---@field HasNickname System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field OriginalName System.String
---`Getter Public Instance`
---@field HumanPrefab Barotrauma.HumanPrefab
---`Getter Public Instance`
---@field DisplayName System.String
---`Getter Public Instance`
---@field SpeciesName Barotrauma.Identifier
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Character Barotrauma.Character
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field ExperiencePoints System.Int32
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field TalentRefundPoints System.Int32
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field UnlockedTalents (System.Collections.Generic.HashSet*1Barotrauma*Identifier)|(Barotrauma.Identifier[])
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field ResettableExtraTalents (System.Collections.Generic.HashSet*1Barotrauma*Identifier)|(Barotrauma.Identifier[])
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field TalentResetCount System.Int32
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field AdditionalTalentPoints System.Int32
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field HeadSprite Barotrauma.Sprite
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field Portrait Barotrauma.Sprite
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field AttachmentSprites (System.Collections.Generic.List*1Barotrauma*WearableSprite)|(Barotrauma.WearableSprite[])
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field CharacterConfigElement Barotrauma.ContentXElement
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field PersonalityTrait Barotrauma.NPCPersonalityTrait
---`Getter Public Static`
---@field HighestManualOrderPriority System.Int32
---`Getter Public Instance`
---@field CurrentOrders (System.Collections.Generic.List*1Barotrauma*Order)|(Barotrauma.Order[])
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field SpriteTags (System.Collections.Generic.List*1Barotrauma*Identifier)|(Barotrauma.Identifier[])
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Ragdoll Barotrauma.RagdollParams
---`Getter Public Instance`
---@field IsAttachmentsLoaded System.Boolean
---`Getter Public Instance`
---@field Hairs (System.Collections.Generic.IReadOnlyList*1Barotrauma*ContentXElement)|(Barotrauma.ContentXElement[])
---`Getter Public Instance`
---@field Beards (System.Collections.Generic.IReadOnlyList*1Barotrauma*ContentXElement)|(Barotrauma.ContentXElement[])
---`Getter Public Instance`
---@field Moustaches (System.Collections.Generic.IReadOnlyList*1Barotrauma*ContentXElement)|(Barotrauma.ContentXElement[])
---`Getter Public Instance`
---@field FaceAttachments (System.Collections.Generic.IReadOnlyList*1Barotrauma*ContentXElement)|(Barotrauma.ContentXElement[])
---`Getter Public Instance`
---@field Wearables (System.Collections.Generic.IEnumerable*1Barotrauma*ContentXElement)|(fun():(Barotrauma.ContentXElement))
_G['CharacterInfo'] = {}

---`Method Public Static`
_G['CharacterInfo'].Init = function() end

---`Method Public Instance`
---@param frame Barotrauma.GUIFrame
---@param returnParent System.Boolean
---@param permissionIcon? Barotrauma.Sprite
---@return Barotrauma.GUIComponent
_G['CharacterInfo'].CreateInfoFrame = function(frame, returnParent, permissionIcon) end

---`Method Private Instance`
---@param sb Microsoft.Xna.Framework.Graphics.SpriteBatch
---@param componentRect Microsoft.Xna.Framework.Rectangle
_G['CharacterInfo'].DrawInfoFrameCharacterIcon = function(sb, componentRect) end

---`Method Public Instance`
---@param parent Barotrauma.GUIComponent
---@param text System.String
---@param userData System.Object
---@return Barotrauma.GUIFrame
_G['CharacterInfo'].CreateCharacterFrame = function(parent, text, userData) end

---`Method Private Instance`
---@param idCard Barotrauma.Items.Components.IdCard
_G['CharacterInfo'].GetDisguisedSprites = function(idCard) end

---`Method Public Static`
---@param sprite Barotrauma.Sprite
---@param offset Microsoft.Xna.Framework.Point
---@return Microsoft.Xna.Framework.Point
_G['CharacterInfo'].CalculateOffset = function(sprite, offset) end

---`Method Public Instance`
---@param sprite Barotrauma.Sprite
_G['CharacterInfo'].CalculateHeadPosition = function(sprite) end

---`Method Public Instance`
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
_G['CharacterInfo'].DrawBackground = function(spriteBatch) end

---`Method Public Instance`
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
_G['CharacterInfo'].DrawForeground = function(spriteBatch) end

---`Method Private Instance`
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
_G['CharacterInfo'].SetHeadEffect = function(spriteBatch) end

---`Method Private Instance`
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
---@param attachment Barotrauma.WearableSprite
_G['CharacterInfo'].SetAttachmentEffect = function(spriteBatch, attachment) end

---`Method Private Instance`
---@param attachment Barotrauma.WearableSprite
---@param hairColor Microsoft.Xna.Framework.Color
---@param facialHairColor Microsoft.Xna.Framework.Color
---@return Microsoft.Xna.Framework.Color
_G['CharacterInfo'].GetAttachmentColor = function(attachment, hairColor, facialHairColor) end

---`Method Public Instance`
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
---@param screenPos Microsoft.Xna.Framework.Vector2
---@param targetAreaSize Microsoft.Xna.Framework.Vector2
---@param flip? System.Boolean
_G['CharacterInfo'].DrawIcon = function(spriteBatch, screenPos, targetAreaSize, flip) end

---`Method Public Instance`
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
---@param area Microsoft.Xna.Framework.Rectangle
---@param evaluateDisguise? System.Boolean
_G['CharacterInfo'].DrawJobIcon = function(spriteBatch, area, evaluateDisguise) end

---`Method Private Instance`
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
---@param attachment Barotrauma.WearableSprite
---@param head Barotrauma.Sprite
---@param sheetIndex System.Nullable*1Microsoft*Xna*Framework*Vector2
---@param drawPos Microsoft.Xna.Framework.Vector2
---@param scale System.Single
---@param depthStep System.Single
---@param color? System.Nullable*1Microsoft*Xna*Framework*Color
---@param spriteEffects? Microsoft.Xna.Framework.Graphics.SpriteEffects
_G['CharacterInfo'].DrawAttachmentSprite = function(spriteBatch, attachment, head, sheetIndex, drawPos, scale, depthStep, color, spriteEffects) end

---`Method Public Static`
---@param speciesName Barotrauma.Identifier
---@param inc Barotrauma.Networking.IReadMessage
---@param requireJobPrefabFound? System.Boolean
---@return Barotrauma.CharacterInfo
_G['CharacterInfo'].ClientRead = function(speciesName, inc, requireJobPrefabFound) end

---`Method Public Instance`
---@param rectT Barotrauma.RectTransform
_G['CharacterInfo'].CreateIcon = function(rectT) end

---`Method Public Instance`
---@return (System.Collections.Generic.IEnumerable*1Barotrauma*Identifier)|(fun():(Barotrauma.Identifier))
_G['CharacterInfo'].GetUnlockedTalentsInTree = function() end

---`Method Public Instance`
---@return (System.Collections.Generic.IEnumerable*1Barotrauma*Identifier)|(fun():(Barotrauma.Identifier))
_G['CharacterInfo'].GetUnlockedTalentsOutsideTree = function() end

---`Method Public Instance`
---@param handleBuff System.Boolean
---@param idCard? Barotrauma.Items.Components.IdCard
_G['CharacterInfo'].CheckDisguiseStatus = function(handleBuff, idCard) end

---`Method Public Instance`
---@param order Barotrauma.Order
---@return System.Int32
_G['CharacterInfo'].GetManualOrderPriority = function(order) end

---`Method Public Instance`
---@param elements (System.Collections.Generic.IEnumerable*1Barotrauma*ContentXElement)|(fun():(Barotrauma.ContentXElement))
---@param headPreset Barotrauma.CharacterInfo.HeadPreset
---@param wearableType? System.Nullable*1Barotrauma*WearableType
---@return (System.Collections.Generic.IEnumerable*1Barotrauma*ContentXElement)|(fun():(Barotrauma.ContentXElement))
_G['CharacterInfo'].GetValidAttachmentElements = function(elements, headPreset, wearableType) end

---`Method Public Instance`
---@param wearableType Barotrauma.WearableType
---@return System.Int32
_G['CharacterInfo'].CountValidAttachmentsOfType = function(wearableType) end

---`Method Private Instance`
---@param randSync Barotrauma.Rand.RandSync
---@param name System.String-ref
_G['CharacterInfo'].GetName = function(randSync, name) end

---`Method Private Static`
---@param element System.Xml.Linq.XElement
---@param tags (System.Collections.Generic.HashSet*1Barotrauma*Identifier)|(Barotrauma.Identifier[])
_G['CharacterInfo'].LoadTagsBackwardsCompatibility = function(element, tags) end

---`Method Private Static`
---@param element System.Xml.Linq.XElement
---@return System.Boolean
_G['CharacterInfo'].ElementHasSpecifierTags = function(element) end

---`Method Private Instance`
_G['CharacterInfo'].SetPersonalityTrait = function() end

---`Method Public Instance`
---@param randSync Barotrauma.Rand.RandSync
---@return System.String
_G['CharacterInfo'].GetRandomName = function(randSync) end

---`Method Public Instance`
_G['CharacterInfo'].SetNameBasedOnJob = function() end

---`Method Public Static`
---@param array System.Collections.Immutable.ImmutableArray
---@param randSync Barotrauma.Rand.RandSync
---@return Microsoft.Xna.Framework.Color
_G['CharacterInfo'].SelectRandomColor = function(array, randSync) end

---`Method Private Instance`
---@param randSync Barotrauma.Rand.RandSync
_G['CharacterInfo'].SetAttachments = function(randSync) end

---`Method Private Instance`
---@param randSync Barotrauma.Rand.RandSync
_G['CharacterInfo'].SetColors = function(randSync) end

---`Method Private Instance`
---@param clr Microsoft.Xna.Framework.Color-ref
---@return System.Boolean
_G['CharacterInfo'].IsColorValid = function(clr) end

---`Method Public Instance`
_G['CharacterInfo'].CheckColors = function() end

---`Method Private Instance`
---@param npcIdentifier Barotrauma.Identifier
_G['CharacterInfo'].TryLoadNameAndTitle = function(npcIdentifier) end

---`Method Public Instance`
---@return System.Int32
_G['CharacterInfo'].GetIdentifier = function() end

---`Method Public Instance`
---@return System.Int32
_G['CharacterInfo'].GetIdentifierUsingOriginalName = function() end

---`Method Private Instance`
---@param name System.String
---@return System.Int32
_G['CharacterInfo'].GetIdentifierHash = function(name) end

---`Method Public Instance`
---@param elements (System.Collections.Generic.IEnumerable*1Barotrauma*ContentXElement)|(fun():(Barotrauma.ContentXElement))
---@param tags (System.Collections.Immutable.ImmutableHashSet*1Barotrauma*Identifier)|(Barotrauma.Identifier[])
---@param targetType? System.Nullable*1Barotrauma*WearableType
---@return (System.Collections.Generic.IEnumerable*1Barotrauma*ContentXElement)|(fun():(Barotrauma.ContentXElement))
_G['CharacterInfo'].FilterElements = function(elements, tags, targetType) end

---`Method Public Instance`
---@overload fun(tags:(System.Collections.Immutable.ImmutableHashSet*1Barotrauma*Identifier)|(Barotrauma.Identifier[]), hairIndex:System.Int32, beardIndex:System.Int32, moustacheIndex:System.Int32, faceAttachmentIndex:System.Int32)
---@overload fun(characterSettings:Barotrauma.MultiplayerPreferences)
---@param headInfo Barotrauma.CharacterInfo.HeadInfo
_G['CharacterInfo'].RecreateHead = function(headInfo) end

---`Method Public Instance`
---@param str System.String
---@return System.String
_G['CharacterInfo'].ReplaceVars = function(str) end

---`Method Public Instance`
_G['CharacterInfo'].RefreshHead = function() end

---`Method Private Instance`
---@param limbElement Barotrauma.ContentXElement
_G['CharacterInfo'].LoadHeadSpriteProjectSpecific = function(limbElement) end

---`Method Public Instance`
_G['CharacterInfo'].VerifySpriteTagsLoaded = function() end

---`Method Private Instance`
_G['CharacterInfo'].LoadHeadSprite = function() end

---`Method Private Instance`
_G['CharacterInfo'].LoadSpriteTags = function() end

---`Method Private Instance`
---@param loadHeadSprite System.Boolean
---@param loadHeadSpriteTags System.Boolean
_G['CharacterInfo'].LoadHeadElement = function(loadHeadSprite, loadHeadSpriteTags) end

---`Method Public Instance`
_G['CharacterInfo'].LoadHeadAttachments = function() end

---`Method Public Static`
---@param elements (System.Collections.Generic.IEnumerable*1Barotrauma*ContentXElement)|(fun():(Barotrauma.ContentXElement))
---@param type Barotrauma.WearableType
---@param commonness? System.Single
---@return (System.Collections.Generic.List*1Barotrauma*ContentXElement)|(Barotrauma.ContentXElement[])
_G['CharacterInfo'].AddEmpty = function(elements, type, commonness) end

---`Method Public Instance`
---@param elements (System.Collections.Generic.IEnumerable*1Barotrauma*ContentXElement)|(fun():(Barotrauma.ContentXElement))
---@return Barotrauma.ContentXElement
_G['CharacterInfo'].GetRandomElement = function(elements) end

---`Method Private Instance`
---@param element Barotrauma.ContentXElement
---@return System.Boolean
_G['CharacterInfo'].IsWearableAllowed = function(element) end

---`Method Private Instance`
---@param element System.Xml.Linq.XElement
---@param spriteName System.String
---@return System.Boolean
_G['CharacterInfo'].IsAllowed = function(element, spriteName) end

---`Method Public Static`
---@param index System.Int32
---@param list (System.Collections.Generic.List*1Barotrauma*ContentXElement)|(Barotrauma.ContentXElement[])
---@return System.Boolean
_G['CharacterInfo'].IsValidIndex = function(index, list) end

---`Method Private Static`
---@param elements (System.Collections.Generic.IEnumerable*1Barotrauma*ContentXElement)|(fun():(Barotrauma.ContentXElement))
---@return (System.Collections.Generic.IEnumerable*1System*Single)|(fun():(System.Single))
_G['CharacterInfo'].GetWeights = function(elements) end

---`Method Private Instance`
_G['CharacterInfo'].LoadAttachmentSprites = function() end

---`Method Public Instance`
---@param baseSalary? System.Int32
---@param salaryMultiplier? System.Single
---@return System.Int32
_G['CharacterInfo'].CalculateSalary = function(baseSalary, salaryMultiplier) end

---`Method Public Instance`
---@param skillIdentifier Barotrauma.Identifier
---@param baseGain System.Single
---@param gainedFromAbility? System.Boolean
---@param maxGain? System.Single
---@param forceNotification? System.Boolean
_G['CharacterInfo'].ApplySkillGain = function(skillIdentifier, baseGain, gainedFromAbility, maxGain, forceNotification) end

---`Method Public Instance`
---@param skillIdentifier Barotrauma.Identifier
---@param increase System.Single
---@param gainedFromAbility? System.Boolean
---@param forceNotification? System.Boolean
_G['CharacterInfo'].IncreaseSkillLevel = function(skillIdentifier, increase, gainedFromAbility, forceNotification) end

---`Method Private Instance`
---@param increase System.Single
---@param skillIdentifier Barotrauma.Identifier
---@return System.Single
_G['CharacterInfo'].GetSkillSpecificGain = function(increase, skillIdentifier) end

---`Method Public Instance`
---@param skillIdentifier Barotrauma.Identifier
---@param level System.Single
---@param forceNotification? System.Boolean
_G['CharacterInfo'].SetSkillLevel = function(skillIdentifier, level, forceNotification) end

---`Method Private Instance`
---@param skillIdentifier Barotrauma.Identifier
---@param prevLevel System.Single
---@param newLevel System.Single
---@param forceNotification System.Boolean
_G['CharacterInfo'].OnSkillChanged = function(skillIdentifier, prevLevel, newLevel, forceNotification) end

---`Method Public Instance`
---@param amount System.Int32
_G['CharacterInfo'].GiveExperience = function(amount) end

---`Method Public Instance`
---@param newExperience System.Int32
_G['CharacterInfo'].SetExperience = function(newExperience) end

---`Method Public Instance`
---@return System.Int32
_G['CharacterInfo'].GetTotalTalentPoints = function() end

---`Method Public Instance`
---@return System.Int32
_G['CharacterInfo'].GetAvailableTalentPoints = function() end

---`Method Public Instance`
---@return System.Single
_G['CharacterInfo'].GetProgressTowardsNextLevel = function() end

---`Method Public Instance`
---@return System.Int32
_G['CharacterInfo'].GetExperienceRequiredForCurrentLevel = function() end

---`Method Public Instance`
---@return System.Int32
_G['CharacterInfo'].GetExperienceRequiredToLevelUp = function() end

---`Method Public Instance`
---@param level System.Int32
---@return System.Int32
_G['CharacterInfo'].GetExperienceRequiredForLevel = function(level) end

---`Method Public Instance`
---@return System.Int32
_G['CharacterInfo'].GetCurrentLevel = function() end

---`Method Private Instance`
---@param experienceRequired System.Int32-ref
---@return System.Int32
_G['CharacterInfo'].GetCurrentLevel = function(experienceRequired) end

---`Method Public Static`
---@param level System.Int32
---@return System.Int32
_G['CharacterInfo'].ExperienceRequiredPerLevel = function(level) end

---`Method Private Instance`
---@param prevAmount System.Int32
---@param newAmount System.Int32
_G['CharacterInfo'].OnExperienceChanged = function(prevAmount, newAmount) end

---`Method Public Instance`
_G['CharacterInfo'].RefundTalents = function() end

---`Method Public Instance`
---@param newRefundPoints System.Int32
_G['CharacterInfo'].AddRefundPoints = function(newRefundPoints) end

---`Method Public Instance`
---@param newName System.String
_G['CharacterInfo'].Rename = function(newName) end

---`Method Public Instance`
_G['CharacterInfo'].ResetName = function() end

---`Method Public Instance`
---@param parentElement System.Xml.Linq.XElement
---@return System.Xml.Linq.XElement
_G['CharacterInfo'].Save = function(parentElement) end

---`Method Public Static`
---@param parentElement System.Xml.Linq.XElement
---@param ... Barotrauma.Order
_G['CharacterInfo'].SaveOrders = function(parentElement, ...) end

---`Method Public Static`
---@param characterInfo Barotrauma.CharacterInfo
---@param parentElement System.Xml.Linq.XElement
_G['CharacterInfo'].SaveOrderData = function(characterInfo, parentElement) end

---`Method Public Instance`
_G['CharacterInfo'].SaveOrderData = function() end

---`Method Public Static`
---@param character Barotrauma.Character
---@param orderData System.Xml.Linq.XElement
_G['CharacterInfo'].ApplyOrderData = function(character, orderData) end

---`Method Public Instance`
_G['CharacterInfo'].ApplyOrderData = function() end

---`Method Public Static`
---@param ordersElement System.Xml.Linq.XElement
---@return (System.Collections.Generic.List*1Barotrauma*Order)|(Barotrauma.Order[])
_G['CharacterInfo'].LoadOrders = function(ordersElement) end

---`Method Private Static`
---@return (System.Collections.Generic.List*1Barotrauma*LinkedSubmarine)|(Barotrauma.LinkedSubmarine[])
_G['CharacterInfo'].GetLinkedSubmarines = function() end

---`Method Private Static`
---@param parentSub Barotrauma.Submarine
---@param id System.UInt16
---@return System.UInt16
_G['CharacterInfo'].GetOffsetId = function(parentSub, id) end

---`Method Public Static`
---@param character Barotrauma.Character
---@param healthData System.Xml.Linq.XElement
---@param afflictionPredicate? (System.Func*1Barotrauma*AfflictionPrefab*1System*Boolean)|(fun(arg:Barotrauma.AfflictionPrefab):(System.Boolean))
_G['CharacterInfo'].ApplyHealthData = function(character, healthData, afflictionPredicate) end

---`Method Public Instance`
_G['CharacterInfo'].ReloadHeadAttachments = function() end

---`Method Private Instance`
_G['CharacterInfo'].ResetAttachmentIndices = function() end

---`Method Private Instance`
_G['CharacterInfo'].ResetLoadedAttachments = function() end

---`Method Public Instance`
_G['CharacterInfo'].ClearCurrentOrders = function() end

---`Method Public Instance`
_G['CharacterInfo'].Remove = function() end

---`Method Private Instance`
_G['CharacterInfo'].RefreshHeadSprites = function() end

---`Method Public Instance`
---@overload fun()
---@param statType Barotrauma.StatTypes
_G['CharacterInfo'].ClearSavedStatValues = function(statType) end

---`Method Public Instance`
_G['CharacterInfo'].RemoveSavedStatValuesOnDeath = function() end

---`Method Public Instance`
---@param statIdentifier Barotrauma.Identifier
_G['CharacterInfo'].ResetSavedStatValue = function(statIdentifier) end

---`Method Public Instance`
---@overload fun(statType:Barotrauma.StatTypes):(System.Single)
---@param statType Barotrauma.StatTypes
---@param statIdentifier Barotrauma.Identifier
---@return System.Single
_G['CharacterInfo'].GetSavedStatValue = function(statType, statIdentifier) end

---`Method Public Instance`
---@param statType Barotrauma.StatTypes
---@param statIdentifier Barotrauma.Identifier
---@return System.Single
_G['CharacterInfo'].GetSavedStatValueWithAll = function(statType, statIdentifier) end

---`Method Public Instance`
---@overload fun(statType:Barotrauma.StatTypes, statIdentifier:Barotrauma.Identifier):(System.Single)
---@param statType Barotrauma.StatTypes
---@param statIdentifier Barotrauma.Identifier
---@param bots (System.Collections.Generic.IReadOnlyCollection*1Barotrauma*Character)|(fun():(Barotrauma.Character))
---@return System.Single
_G['CharacterInfo'].GetSavedStatValueWithBotsInMp = function(statType, statIdentifier, bots) end

---`Method Public Instance`
---@param statType Barotrauma.StatTypes
---@param value System.Single
---@param statIdentifier Barotrauma.Identifier
---@param removeOnDeath System.Boolean
---@param maxValue? System.Single
---@param setValue? System.Boolean
_G['CharacterInfo'].ChangeSavedStatValue = function(statType, value, statIdentifier, removeOnDeath, maxValue, setValue) end

---`Constructor Public Instance`
---@overload fun(speciesName:Barotrauma.Identifier, name?:System.String, originalName?:System.String, jobOrJobPrefab?:Barotrauma.Either*1Barotrauma*Job*1Barotrauma*JobPrefab, variant?:System.Int32, randSync?:Barotrauma.Rand.RandSync, npcIdentifier?:Barotrauma.Identifier):Barotrauma.CharacterInfo
---@overload fun(infoElement:Barotrauma.ContentXElement, npcIdentifier?:Barotrauma.Identifier):Barotrauma.CharacterInfo
---@return Barotrauma.CharacterInfo
_G['CharacterInfo'] = function() end

---`Constructor Public Instance`
---@overload fun(speciesName:Barotrauma.Identifier, name?:System.String, originalName?:System.String, jobOrJobPrefab?:Barotrauma.Either*1Barotrauma*Job*1Barotrauma*JobPrefab, variant?:System.Int32, randSync?:Barotrauma.Rand.RandSync, npcIdentifier?:Barotrauma.Identifier):Barotrauma.CharacterInfo
---@overload fun(infoElement:Barotrauma.ContentXElement, npcIdentifier?:Barotrauma.Identifier):Barotrauma.CharacterInfo
---@return Barotrauma.CharacterInfo
_G['CharacterInfo'].__new = function() end

---`Constructor Private Static`
---@overload fun(speciesName:Barotrauma.Identifier, name?:System.String, originalName?:System.String, jobOrJobPrefab?:Barotrauma.Either*1Barotrauma*Job*1Barotrauma*JobPrefab, variant?:System.Int32, randSync?:Barotrauma.Rand.RandSync, npcIdentifier?:Barotrauma.Identifier):Barotrauma.CharacterInfo
---@overload fun(infoElement:Barotrauma.ContentXElement, npcIdentifier?:Barotrauma.Identifier):Barotrauma.CharacterInfo
---@return Barotrauma.CharacterInfo
_G['CharacterInfo'] = function() end

---`Constructor Private Static`
---@overload fun(speciesName:Barotrauma.Identifier, name?:System.String, originalName?:System.String, jobOrJobPrefab?:Barotrauma.Either*1Barotrauma*Job*1Barotrauma*JobPrefab, variant?:System.Int32, randSync?:Barotrauma.Rand.RandSync, npcIdentifier?:Barotrauma.Identifier):Barotrauma.CharacterInfo
---@overload fun(infoElement:Barotrauma.ContentXElement, npcIdentifier?:Barotrauma.Identifier):Barotrauma.CharacterInfo
---@return Barotrauma.CharacterInfo
_G['CharacterInfo'].__new = function() end

