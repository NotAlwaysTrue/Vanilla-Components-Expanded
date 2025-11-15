---@meta
---@class Barotrauma.LuaCsSteam : System.Object
---`Field Private Instance`
---@field lastTimeChecked System.Double
---`Field Private Instance`
---@field itemsBeingDownloaded (System.Collections.Generic.List*1Barotrauma*LuaCsSteam*WorkshopItemDownload)|(Barotrauma.LuaCsSteam.WorkshopItemDownload[])
_G['Steam'] = {}

---`Method Private Static`
---@param sourceDirName System.String
---@param destDirName System.String
---@param copySubDirs System.Boolean
---@param overwriteExisting? System.Boolean
_G['Steam'].CopyFolder = function(sourceDirName, destDirName, copySubDirs, overwriteExisting) end

---`Method Private Instance`
---@param download Barotrauma.LuaCsSteam.WorkshopItemDownload
---@param startDownload? System.Boolean
_G['Steam'].DownloadWorkshopItemAsync = function(download, startDownload) end

---`Method Public Instance`
---@overload fun(id:System.UInt64, destination:System.String, callback:(Barotrauma.LuaCsAction)|(fun(...:System.Object)))
---@param item Steamworks.Ugc.Item
---@param destination System.String
---@param callback (Barotrauma.LuaCsAction)|(fun(...:System.Object))
_G['Steam'].DownloadWorkshopItem = function(item, destination, callback) end

---`Method Public Instance`
---@param id System.UInt64
---@param callback (Barotrauma.LuaCsAction)|(fun(...:System.Object))
_G['Steam'].GetWorkshopItem = function(id, callback) end

---`Method Public Instance`
_G['Steam'].Update = function() end

---`Constructor Public Instance`
---@return Barotrauma.LuaCsSteam
_G['Steam'] = function() end

---`Constructor Public Instance`
---@return Barotrauma.LuaCsSteam
_G['Steam'].__new = function() end

