---@meta
---@class Barotrauma.Networking.VoipQueue : System.Object
---`Field NonPublic Instance`
---@field bufferLengths (System.Int32-arr)|(System.Int32[])
---`Field NonPublic Instance`
---@field buffers (System.Byte-arr-arr)|((System.Byte-arr)|(System.Byte[])[])
---`Field NonPublic Instance`
---@field newestBufferInd System.Int32
---`Field NonPublic Instance`
---@field firstRead System.Boolean
---`Field Public Static`
---@field BUFFER_COUNT System.Int32
---`Getter Public Instance`
---@field EnqueuedTotalLength System.Int32
---`Getter Public Instance`
---<br/>`Setter NonPublic Instance`
---@field BufferToQueue (System.Byte-arr)|(System.Byte[])
---`Getter Public Instance Virtual`
---<br/>`Setter NonPublic Instance Virtual`
---@field QueueID System.Byte
---`Getter Public Instance`
---<br/>`Setter NonPublic Instance`
---@field LatestBufferID System.UInt16
---`Getter Public Instance`
---<br/>`Setter NonPublic Instance`
---@field CanSend System.Boolean
---`Getter Public Instance`
---<br/>`Setter NonPublic Instance`
---@field CanReceive System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field ForceLocal System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field LastReadTime System.DateTime
_G['VoipQueue'] = {}

---`Method Public Instance`
---@param length System.Int32
_G['VoipQueue'].EnqueueBuffer = function(length) end

---`Method Public Instance`
---@param id System.Int32
---@param outSize System.Int32-ref
---@param outBuf System.Byte-arr-ref
_G['VoipQueue'].RetrieveBuffer = function(id, outSize, outBuf) end

---`Method Public Instance Virtual`
---@param msg Barotrauma.Networking.IWriteMessage
_G['VoipQueue'].Write = function(msg) end

---`Method Public Instance Virtual`
---@param msg Barotrauma.Networking.IReadMessage
---@param discardData? System.Boolean
---@return System.Boolean
_G['VoipQueue'].Read = function(msg, discardData) end

---`Method Public Instance Virtual`
_G['VoipQueue'].Dispose = function() end

---`Constructor Public Instance`
---@param id System.Byte
---@param canSend System.Boolean
---@param canReceive System.Boolean
---@return Barotrauma.Networking.VoipQueue
_G['VoipQueue'] = function(id, canSend, canReceive) end

---`Constructor Public Instance`
---@param id System.Byte
---@param canSend System.Boolean
---@param canReceive System.Boolean
---@return Barotrauma.Networking.VoipQueue
_G['VoipQueue'].__new = function(id, canSend, canReceive) end

