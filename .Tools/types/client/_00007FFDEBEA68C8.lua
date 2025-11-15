---@meta
---@class Steamworks.Friend : System.ValueType
---`Field Public Instance`
---@field Id Steamworks.SteamId
---`Getter Public Instance`
---@field IsMe System.Boolean
---`Getter Public Instance`
---@field IsFriend System.Boolean
---`Getter Public Instance`
---@field IsBlocked System.Boolean
---`Getter Public Instance`
---@field IsPlayingThisGame System.Boolean
---`Getter Public Instance`
---@field IsOnline System.Boolean
---`Getter Public Instance`
---@field IsAway System.Boolean
---`Getter Public Instance`
---@field IsBusy System.Boolean
---`Getter Public Instance`
---@field IsSnoozing System.Boolean
---`Getter Public Instance`
---@field Relationship Steamworks.Relationship
---`Getter Public Instance`
---@field State Steamworks.FriendState
---`Getter Public Instance`
---@field Name System.String
---`Getter Public Instance`
---@field Nickname System.String
---`Getter Public Instance`
---@field NameHistory (System.Collections.Generic.IEnumerable*1System*String)|(fun():(System.String))
---`Getter Public Instance`
---@field SteamLevel System.Int32
---`Getter Public Instance`
---@field GameInfo System.Nullable*1Steamworks*Friend*FriendGameInfo
_G['Steamworks']['Friend'] = {}

---`Method Public Instance Virtual`
---@return System.String
_G['Steamworks']['Friend'].ToString = function() end

---`Method Public Instance`
---@return System.Threading.Tasks.Task
_G['Steamworks']['Friend'].RequestInfoAsync = function() end

---`Method Public Instance`
---@param group_or_room Steamworks.SteamId
---@return System.Boolean
_G['Steamworks']['Friend'].IsIn = function(group_or_room) end

---`Method Public Instance`
---@return System.Threading.Tasks.Task*1System*Nullable*2Steamworks*Data*Image
_G['Steamworks']['Friend'].GetSmallAvatarAsync = function() end

---`Method Public Instance`
---@return System.Threading.Tasks.Task*1System*Nullable*2Steamworks*Data*Image
_G['Steamworks']['Friend'].GetMediumAvatarAsync = function() end

---`Method Public Instance`
---@return System.Threading.Tasks.Task*1System*Nullable*2Steamworks*Data*Image
_G['Steamworks']['Friend'].GetLargeAvatarAsync = function() end

---`Method Public Instance`
---@param key System.String
---@return System.String
_G['Steamworks']['Friend'].GetRichPresence = function(key) end

---`Method Public Instance`
---@param Text System.String
---@return System.Boolean
_G['Steamworks']['Friend'].InviteToGame = function(Text) end

---`Method Public Instance`
---@param message System.String
---@return System.Boolean
_G['Steamworks']['Friend'].SendMessage = function(message) end

---`Method Public Instance`
---@return System.Threading.Tasks.Task*1System*Boolean
_G['Steamworks']['Friend'].RequestUserStatsAsync = function() end

---`Method Public Instance`
---@param statName System.String
---@param defult? System.Single
---@return System.Single
_G['Steamworks']['Friend'].GetStatFloat = function(statName, defult) end

---`Method Public Instance`
---@param statName System.String
---@param defult? System.Int32
---@return System.Int32
_G['Steamworks']['Friend'].GetStatInt = function(statName, defult) end

---`Method Public Instance`
---@param statName System.String
---@param defult? System.Boolean
---@return System.Boolean
_G['Steamworks']['Friend'].GetAchievement = function(statName, defult) end

---`Method Public Instance`
---@param statName System.String
---@return System.DateTime
_G['Steamworks']['Friend'].GetAchievementUnlockTime = function(statName) end

---`Constructor Public Instance`
---@param steamid Steamworks.SteamId
---@return Steamworks.Friend
_G['Steamworks']['Friend'] = function(steamid) end

---`Constructor Public Instance`
---@param steamid Steamworks.SteamId
---@return Steamworks.Friend
_G['Steamworks']['Friend'].__new = function(steamid) end

