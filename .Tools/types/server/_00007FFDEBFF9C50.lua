---@meta
---@class Barotrauma.Networking.FileSender : System.Object
---`Field Public Instance`
---@field OnStarted (Barotrauma.Networking.FileSender.FileTransferDelegate)|(fun(fileStreamReceiver:Barotrauma.Networking.FileSender.FileTransferOut))
---`Field Public Instance`
---@field OnEnded (Barotrauma.Networking.FileSender.FileTransferDelegate)|(fun(fileStreamReceiver:Barotrauma.Networking.FileSender.FileTransferOut))
---`Field Private Instance`
---@field activeTransfers (System.Collections.Generic.List*1Barotrauma*Networking*FileSender*FileTransferOut)|(Barotrauma.Networking.FileSender.FileTransferOut[])
---`Field Private Instance`
---@field chunkLen System.Int32
---`Field Private Instance`
---@field peer Barotrauma.Networking.ServerPeer
---`Field Public Static`
---@field StartTime System.DateTime
---`Field Private Static`
---@field MaxTransferCount System.Int32
---`Field Private Static`
---@field MaxTransferCountPerRecipient System.Int32
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field ForceMinimumFileTransferDuration System.Single
---`Getter Public Instance`
---@field ActiveTransfers (System.Collections.Generic.IReadOnlyList*1Barotrauma*Networking*FileSender*FileTransferOut)|(Barotrauma.Networking.FileSender.FileTransferOut[])
_G['FileSender'] = {}

---`Method Public Instance`
---@param recipient Barotrauma.Networking.NetworkConnection
---@param fileType Barotrauma.Networking.FileTransferType
---@param filePath System.String
---@return Barotrauma.Networking.FileSender.FileTransferOut
_G['FileSender'].StartTransfer = function(recipient, fileType, filePath) end

---`Method Public Instance`
---@param deltaTime System.Single
_G['FileSender'].Update = function(deltaTime) end

---`Method Private Instance`
---@param transfer Barotrauma.Networking.FileSender.FileTransferOut
_G['FileSender'].Send = function(transfer) end

---`Method Public Instance`
---@param transfer Barotrauma.Networking.FileSender.FileTransferOut
_G['FileSender'].CancelTransfer = function(transfer) end

---`Method Public Instance`
---@param inc Barotrauma.Networking.IReadMessage
---@param client Barotrauma.Networking.Client
_G['FileSender'].ReadFileRequest = function(inc, client) end

---`Constructor Public Instance`
---@param serverPeer Barotrauma.Networking.ServerPeer
---@param mtu System.Int32
---@return Barotrauma.Networking.FileSender
_G['FileSender'] = function(serverPeer, mtu) end

---`Constructor Public Instance`
---@param serverPeer Barotrauma.Networking.ServerPeer
---@param mtu System.Int32
---@return Barotrauma.Networking.FileSender
_G['FileSender'].__new = function(serverPeer, mtu) end

