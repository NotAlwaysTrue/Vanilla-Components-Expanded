---@meta
---@class Barotrauma.Networking.ChatMessage : System.Object
---`Field Public Instance`
---@field Text System.String
---`Field Private Instance`
---@field translatedText System.String
---`Field Public Instance`
---@field Type Barotrauma.Networking.ChatMessageType
---`Field Public Instance`
---@field ChangeType Barotrauma.Networking.PlayerConnectionChangeType
---`Field Public Instance`
---@field IconStyle System.String
---`Field Public Instance`
---@field Sender Barotrauma.Entity
---`Field Public Instance`
---@field SenderClient Barotrauma.Networking.Client
---`Field Public Instance`
---@field SenderName System.String
---`Field Private Instance`
---@field customTextColor System.Nullable*1Microsoft*Xna*Framework*Color
---`Field Private Static`
---@field dateTimeFormatLongTimePattern System.String
---`Field Public Static`
---@field MessageColor (Microsoft.Xna.Framework.Color-arr)|(Microsoft.Xna.Framework.Color[])
---`Field Public Static`
---@field LastID System.UInt16
---`Field Public Static`
---@field MaxLength System.Int32
---`Field Public Static`
---@field MaxMessagesPerPacket System.Int32
---`Field Public Static`
---@field SpeakRange System.Single
---`Field Public Static`
---@field SpeakRangeVOIP System.Single
---`Field Public Static`
---@field BlockedBySpamFilterTime System.Single
---`Getter Public Instance`
---@field TranslatedText System.String
---`Getter Public Instance`
---@field SenderCharacter Barotrauma.Character
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Color Microsoft.Xna.Framework.Color
---`Getter Public Instance`
---@field TextWithSender System.String
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field NetStateID System.UInt16
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field ChatMode Barotrauma.ChatMode
_G['ChatMessage'] = {}

---`Method Public Static`
---@param msg Barotrauma.Networking.IReadMessage
---@param c Barotrauma.Networking.Client
_G['ChatMessage'].ServerRead = function(msg, c) end

---`Method Public Static`
---@param c Barotrauma.Networking.Client
---@param messageText System.String
---@param flaggedAsSpam System.Boolean-ref
---@param similarityMultiplier? System.Single
_G['ChatMessage'].HandleSpamFilter = function(c, messageText, flaggedAsSpam, similarityMultiplier) end

---`Method Public Instance`
---@param c Barotrauma.Networking.Client
---@return System.Int32
_G['ChatMessage'].EstimateLengthBytesServer = function(c) end

---`Method Public Instance Virtual`
---@param segmentTable Barotrauma.Networking.SegmentTableWriter
---@param msg Barotrauma.Networking.IWriteMessage
---@param c Barotrauma.Networking.Client
_G['ChatMessage'].ServerWrite = function(segmentTable, msg, c) end

---`Method Public Static`
---@return System.String
_G['ChatMessage'].GetTimeStamp = function() end

---`Method Public Static`
---@param senderName System.String
---@param text System.String
---@param type Barotrauma.Networking.ChatMessageType
---@param sender Barotrauma.Entity
---@param client? Barotrauma.Networking.Client
---@param changeType? Barotrauma.Networking.PlayerConnectionChangeType
---@param textColor? System.Nullable*1Microsoft*Xna*Framework*Color
---@return Barotrauma.Networking.ChatMessage
_G['ChatMessage'].Create = function(senderName, text, type, sender, client, changeType, textColor) end

---`Method Public Static`
---@param message System.String
---@param messageWithoutCommand System.String-ref
---@return System.String
_G['ChatMessage'].GetChatMessageCommand = function(message, messageWithoutCommand) end

---`Method Public Static`
---@param listener Barotrauma.Entity
---@param sender Barotrauma.Entity
---@param range System.Single
---@param obstructionMultiplier? System.Single
---@return System.Single
_G['ChatMessage'].GetGarbleAmount = function(listener, sender, range, obstructionMultiplier) end

---`Method Public Instance`
---@param listener Barotrauma.Character
---@return System.String
_G['ChatMessage'].ApplyDistanceEffect = function(listener) end

---`Method Public Static`
---@overload fun(listener:Barotrauma.Entity, sender:Barotrauma.Entity, text:System.String, range:System.Single, obstructionMultiplier?:System.Single):(System.String)
---@overload fun(text:System.String, garbleAmount:System.Single):(System.String)
---@param message System.String
---@param type Barotrauma.Networking.ChatMessageType
---@param sender Barotrauma.Character
---@param receiver Barotrauma.Character
---@return System.String
_G['ChatMessage'].ApplyDistanceEffect = function(message, type, sender, receiver) end

---`Method Public Instance`
---@return System.Int32
_G['ChatMessage'].EstimateLengthBytesClient = function() end

---`Method Public Static`
---@overload fun(sender:Barotrauma.Character, ignoreJamming?:System.Boolean):(System.Boolean)
---@param sender Barotrauma.Character
---@param radio Barotrauma.Items.Components.WifiComponent-ref
---@param ignoreJamming? System.Boolean
---@return System.Boolean
_G['ChatMessage'].CanUseRadio = function(sender, radio, ignoreJamming) end

---`Constructor NonPublic Instance`
---@overload fun(senderName:System.String, text:System.String, type:Barotrauma.Networking.ChatMessageType, sender:Barotrauma.Entity, client:Barotrauma.Networking.Client, changeType?:Barotrauma.Networking.PlayerConnectionChangeType, textColor?:System.Nullable*1Microsoft*Xna*Framework*Color):Barotrauma.Networking.ChatMessage
---@return Barotrauma.Networking.ChatMessage
_G['ChatMessage'] = function() end

---`Constructor NonPublic Instance`
---@overload fun(senderName:System.String, text:System.String, type:Barotrauma.Networking.ChatMessageType, sender:Barotrauma.Entity, client:Barotrauma.Networking.Client, changeType?:Barotrauma.Networking.PlayerConnectionChangeType, textColor?:System.Nullable*1Microsoft*Xna*Framework*Color):Barotrauma.Networking.ChatMessage
---@return Barotrauma.Networking.ChatMessage
_G['ChatMessage'].__new = function() end

---`Constructor Private Static`
---@overload fun(senderName:System.String, text:System.String, type:Barotrauma.Networking.ChatMessageType, sender:Barotrauma.Entity, client:Barotrauma.Networking.Client, changeType?:Barotrauma.Networking.PlayerConnectionChangeType, textColor?:System.Nullable*1Microsoft*Xna*Framework*Color):Barotrauma.Networking.ChatMessage
---@return Barotrauma.Networking.ChatMessage
_G['ChatMessage'] = function() end

---`Constructor Private Static`
---@overload fun(senderName:System.String, text:System.String, type:Barotrauma.Networking.ChatMessageType, sender:Barotrauma.Entity, client:Barotrauma.Networking.Client, changeType?:Barotrauma.Networking.PlayerConnectionChangeType, textColor?:System.Nullable*1Microsoft*Xna*Framework*Color):Barotrauma.Networking.ChatMessage
---@return Barotrauma.Networking.ChatMessage
_G['ChatMessage'].__new = function() end

