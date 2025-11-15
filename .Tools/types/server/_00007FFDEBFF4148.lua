---@meta
---@class Barotrauma.Networking.ReadWriteMessage : System.Object
---`Field Private Instance`
---@field buf (System.Byte-arr)|(System.Byte[])
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
_G['ReadWriteMessage'] = {}

---`Method Public Instance Virtual`
---@param val System.Boolean
_G['ReadWriteMessage'].WriteBoolean = function(val) end

---`Method Public Instance Virtual`
_G['ReadWriteMessage'].WritePadBits = function() end

---`Method Public Instance Virtual`
---@param val System.Byte
_G['ReadWriteMessage'].WriteByte = function(val) end

---`Method Public Instance Virtual`
---@param val System.UInt16
_G['ReadWriteMessage'].WriteUInt16 = function(val) end

---`Method Public Instance Virtual`
---@param val System.Int16
_G['ReadWriteMessage'].WriteInt16 = function(val) end

---`Method Public Instance Virtual`
---@param val System.UInt32
_G['ReadWriteMessage'].WriteUInt32 = function(val) end

---`Method Public Instance Virtual`
---@param val System.Int32
_G['ReadWriteMessage'].WriteInt32 = function(val) end

---`Method Public Instance Virtual`
---@param val System.UInt64
_G['ReadWriteMessage'].WriteUInt64 = function(val) end

---`Method Public Instance Virtual`
---@param val System.Int64
_G['ReadWriteMessage'].WriteInt64 = function(val) end

---`Method Public Instance Virtual`
---@param val System.Single
_G['ReadWriteMessage'].WriteSingle = function(val) end

---`Method Public Instance Virtual`
---@param val System.Double
_G['ReadWriteMessage'].WriteDouble = function(val) end

---`Method Public Instance Virtual`
---@param val Microsoft.Xna.Framework.Color
_G['ReadWriteMessage'].WriteColorR8G8B8 = function(val) end

---`Method Public Instance Virtual`
---@param val Microsoft.Xna.Framework.Color
_G['ReadWriteMessage'].WriteColorR8G8B8A8 = function(val) end

---`Method Public Instance Virtual`
---@param val System.UInt32
_G['ReadWriteMessage'].WriteVariableUInt32 = function(val) end

---`Method Public Instance Virtual`
---@param val System.String
_G['ReadWriteMessage'].WriteString = function(val) end

---`Method Public Instance Virtual`
---@param val Barotrauma.Identifier
_G['ReadWriteMessage'].WriteIdentifier = function(val) end

---`Method Public Instance Virtual`
---@param val System.Int32
---@param min System.Int32
---@param max System.Int32
_G['ReadWriteMessage'].WriteRangedInteger = function(val, min, max) end

---`Method Public Instance Virtual`
---@param val System.Single
---@param min System.Single
---@param max System.Single
---@param bitCount System.Int32
_G['ReadWriteMessage'].WriteRangedSingle = function(val, min, max, bitCount) end

---`Method Public Instance Virtual`
---@param val (System.Byte-arr)|(System.Byte[])
---@param startPos System.Int32
---@param length System.Int32
_G['ReadWriteMessage'].WriteBytes = function(val, startPos, length) end

---`Method Public Instance Virtual`
---@return System.Boolean
_G['ReadWriteMessage'].ReadBoolean = function() end

---`Method Public Instance Virtual`
_G['ReadWriteMessage'].ReadPadBits = function() end

---`Method Public Instance Virtual`
---@return System.Byte
_G['ReadWriteMessage'].ReadByte = function() end

---`Method Public Instance Virtual`
---@return System.Byte
_G['ReadWriteMessage'].PeekByte = function() end

---`Method Public Instance Virtual`
---@return System.UInt16
_G['ReadWriteMessage'].ReadUInt16 = function() end

---`Method Public Instance Virtual`
---@return System.Int16
_G['ReadWriteMessage'].ReadInt16 = function() end

---`Method Public Instance Virtual`
---@return System.UInt32
_G['ReadWriteMessage'].ReadUInt32 = function() end

---`Method Public Instance Virtual`
---@return System.Int32
_G['ReadWriteMessage'].ReadInt32 = function() end

---`Method Public Instance Virtual`
---@return System.UInt64
_G['ReadWriteMessage'].ReadUInt64 = function() end

---`Method Public Instance Virtual`
---@return System.Int64
_G['ReadWriteMessage'].ReadInt64 = function() end

---`Method Public Instance Virtual`
---@return System.Single
_G['ReadWriteMessage'].ReadSingle = function() end

---`Method Public Instance Virtual`
---@return System.Double
_G['ReadWriteMessage'].ReadDouble = function() end

---`Method Public Instance Virtual`
---@return System.UInt32
_G['ReadWriteMessage'].ReadVariableUInt32 = function() end

---`Method Public Instance Virtual`
---@return System.String
_G['ReadWriteMessage'].ReadString = function() end

---`Method Public Instance Virtual`
---@return Barotrauma.Identifier
_G['ReadWriteMessage'].ReadIdentifier = function() end

---`Method Public Instance Virtual`
---@return Microsoft.Xna.Framework.Color
_G['ReadWriteMessage'].ReadColorR8G8B8 = function() end

---`Method Public Instance Virtual`
---@return Microsoft.Xna.Framework.Color
_G['ReadWriteMessage'].ReadColorR8G8B8A8 = function() end

---`Method Public Instance Virtual`
---@param min System.Int32
---@param max System.Int32
---@return System.Int32
_G['ReadWriteMessage'].ReadRangedInteger = function(min, max) end

---`Method Public Instance Virtual`
---@param min System.Single
---@param max System.Single
---@param bitCount System.Int32
---@return System.Single
_G['ReadWriteMessage'].ReadRangedSingle = function(min, max, bitCount) end

---`Method Public Instance Virtual`
---@param numberOfBytes System.Int32
---@return (System.Byte-arr)|(System.Byte[])
_G['ReadWriteMessage'].ReadBytes = function(numberOfBytes) end

---`Method Public Instance Virtual`
---@param compressPastThreshold System.Boolean
---@param isCompressed System.Boolean-ref
---@param outLength System.Int32-ref
---@return (System.Byte-arr)|(System.Byte[])
_G['ReadWriteMessage'].PrepareForSending = function(compressPastThreshold, isCompressed, outLength) end

---`Constructor Public Instance`
---@overload fun():Barotrauma.Networking.ReadWriteMessage
---@param b (System.Byte-arr)|(System.Byte[])
---@param bitPos System.Int32
---@param lBits System.Int32
---@param copyBuf System.Boolean
---@return Barotrauma.Networking.ReadWriteMessage
_G['ReadWriteMessage'] = function(b, bitPos, lBits, copyBuf) end

---`Constructor Public Instance`
---@overload fun():Barotrauma.Networking.ReadWriteMessage
---@param b (System.Byte-arr)|(System.Byte[])
---@param bitPos System.Int32
---@param lBits System.Int32
---@param copyBuf System.Boolean
---@return Barotrauma.Networking.ReadWriteMessage
_G['ReadWriteMessage'].__new = function(b, bitPos, lBits, copyBuf) end

