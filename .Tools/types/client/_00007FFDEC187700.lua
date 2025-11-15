---@meta
---@class Barotrauma.Networking.ReadOnlyMessage : System.Object
---`Field Private Instance`
---@field seekPos System.Int32
---`Field Private Instance`
---@field lengthBits System.Int32
---`Getter Public Instance Virtual`
---<br/>`Setter Public Instance Virtual`
---@field BitPosition System.Int32
---`Getter Public Instance Virtual`
---@field BytePosition System.Int32
---`Getter Public Instance Virtual`
---@field Buffer (System.Byte-arr)|(System.Byte[])
---`Getter Public Instance Virtual`
---<br/>`Setter Public Instance Virtual`
---@field LengthBits System.Int32
---`Getter Public Instance Virtual`
---@field LengthBytes System.Int32
---`Getter Public Instance Virtual`
---@field Sender Barotrauma.Networking.NetworkConnection
_G['ReadOnlyMessage'] = {}

---`Method Public Instance Virtual`
---@return System.Boolean
_G['ReadOnlyMessage'].ReadBoolean = function() end

---`Method Public Instance Virtual`
_G['ReadOnlyMessage'].ReadPadBits = function() end

---`Method Public Instance Virtual`
---@return System.Byte
_G['ReadOnlyMessage'].ReadByte = function() end

---`Method Public Instance Virtual`
---@return System.Byte
_G['ReadOnlyMessage'].PeekByte = function() end

---`Method Public Instance Virtual`
---@return System.UInt16
_G['ReadOnlyMessage'].ReadUInt16 = function() end

---`Method Public Instance Virtual`
---@return System.Int16
_G['ReadOnlyMessage'].ReadInt16 = function() end

---`Method Public Instance Virtual`
---@return System.UInt32
_G['ReadOnlyMessage'].ReadUInt32 = function() end

---`Method Public Instance Virtual`
---@return System.Int32
_G['ReadOnlyMessage'].ReadInt32 = function() end

---`Method Public Instance Virtual`
---@return System.UInt64
_G['ReadOnlyMessage'].ReadUInt64 = function() end

---`Method Public Instance Virtual`
---@return System.Int64
_G['ReadOnlyMessage'].ReadInt64 = function() end

---`Method Public Instance Virtual`
---@return System.Single
_G['ReadOnlyMessage'].ReadSingle = function() end

---`Method Public Instance Virtual`
---@return System.Double
_G['ReadOnlyMessage'].ReadDouble = function() end

---`Method Public Instance Virtual`
---@return System.UInt32
_G['ReadOnlyMessage'].ReadVariableUInt32 = function() end

---`Method Public Instance Virtual`
---@return System.String
_G['ReadOnlyMessage'].ReadString = function() end

---`Method Public Instance Virtual`
---@return Barotrauma.Identifier
_G['ReadOnlyMessage'].ReadIdentifier = function() end

---`Method Public Instance Virtual`
---@return Microsoft.Xna.Framework.Color
_G['ReadOnlyMessage'].ReadColorR8G8B8 = function() end

---`Method Public Instance Virtual`
---@return Microsoft.Xna.Framework.Color
_G['ReadOnlyMessage'].ReadColorR8G8B8A8 = function() end

---`Method Public Instance Virtual`
---@param min System.Int32
---@param max System.Int32
---@return System.Int32
_G['ReadOnlyMessage'].ReadRangedInteger = function(min, max) end

---`Method Public Instance Virtual`
---@param min System.Single
---@param max System.Single
---@param bitCount System.Int32
---@return System.Single
_G['ReadOnlyMessage'].ReadRangedSingle = function(min, max, bitCount) end

---`Method Public Instance Virtual`
---@param numberOfBytes System.Int32
---@return (System.Byte-arr)|(System.Byte[])
_G['ReadOnlyMessage'].ReadBytes = function(numberOfBytes) end

---`Constructor Public Instance`
---@param inBuf (System.Byte-arr)|(System.Byte[])
---@param isCompressed System.Boolean
---@param startPos System.Int32
---@param byteLength System.Int32
---@param sender Barotrauma.Networking.NetworkConnection
---@return Barotrauma.Networking.ReadOnlyMessage
_G['ReadOnlyMessage'] = function(inBuf, isCompressed, startPos, byteLength, sender) end

---`Constructor Public Instance`
---@param inBuf (System.Byte-arr)|(System.Byte[])
---@param isCompressed System.Boolean
---@param startPos System.Int32
---@param byteLength System.Int32
---@param sender Barotrauma.Networking.NetworkConnection
---@return Barotrauma.Networking.ReadOnlyMessage
_G['ReadOnlyMessage'].__new = function(inBuf, isCompressed, startPos, byteLength, sender) end

