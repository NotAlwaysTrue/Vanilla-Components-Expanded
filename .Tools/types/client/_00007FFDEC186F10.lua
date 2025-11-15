---@meta
---@class Barotrauma.Networking.WriteOnlyMessage : System.Object
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
_G['WriteOnlyMessage'] = {}

---`Method Public Instance Virtual`
---@param val System.Boolean
_G['WriteOnlyMessage'].WriteBoolean = function(val) end

---`Method Public Instance Virtual`
_G['WriteOnlyMessage'].WritePadBits = function() end

---`Method Public Instance Virtual`
---@param val System.Byte
_G['WriteOnlyMessage'].WriteByte = function(val) end

---`Method Public Instance Virtual`
---@param val System.UInt16
_G['WriteOnlyMessage'].WriteUInt16 = function(val) end

---`Method Public Instance Virtual`
---@param val System.Int16
_G['WriteOnlyMessage'].WriteInt16 = function(val) end

---`Method Public Instance Virtual`
---@param val System.UInt32
_G['WriteOnlyMessage'].WriteUInt32 = function(val) end

---`Method Public Instance Virtual`
---@param val System.Int32
_G['WriteOnlyMessage'].WriteInt32 = function(val) end

---`Method Public Instance Virtual`
---@param val System.UInt64
_G['WriteOnlyMessage'].WriteUInt64 = function(val) end

---`Method Public Instance Virtual`
---@param val System.Int64
_G['WriteOnlyMessage'].WriteInt64 = function(val) end

---`Method Public Instance Virtual`
---@param val System.Single
_G['WriteOnlyMessage'].WriteSingle = function(val) end

---`Method Public Instance Virtual`
---@param val System.Double
_G['WriteOnlyMessage'].WriteDouble = function(val) end

---`Method Public Instance Virtual`
---@param val Microsoft.Xna.Framework.Color
_G['WriteOnlyMessage'].WriteColorR8G8B8 = function(val) end

---`Method Public Instance Virtual`
---@param val Microsoft.Xna.Framework.Color
_G['WriteOnlyMessage'].WriteColorR8G8B8A8 = function(val) end

---`Method Public Instance Virtual`
---@param val System.UInt32
_G['WriteOnlyMessage'].WriteVariableUInt32 = function(val) end

---`Method Public Instance Virtual`
---@param val System.String
_G['WriteOnlyMessage'].WriteString = function(val) end

---`Method Public Instance Virtual`
---@param val Barotrauma.Identifier
_G['WriteOnlyMessage'].WriteIdentifier = function(val) end

---`Method Public Instance Virtual`
---@param val System.Int32
---@param min System.Int32
---@param max System.Int32
_G['WriteOnlyMessage'].WriteRangedInteger = function(val, min, max) end

---`Method Public Instance Virtual`
---@param val System.Single
---@param min System.Single
---@param max System.Single
---@param bitCount System.Int32
_G['WriteOnlyMessage'].WriteRangedSingle = function(val, min, max, bitCount) end

---`Method Public Instance Virtual`
---@param val (System.Byte-arr)|(System.Byte[])
---@param startPos System.Int32
---@param length System.Int32
_G['WriteOnlyMessage'].WriteBytes = function(val, startPos, length) end

---`Method Public Instance Virtual`
---@param compressPastThreshold System.Boolean
---@param isCompressed System.Boolean-ref
---@param length System.Int32-ref
---@return (System.Byte-arr)|(System.Byte[])
_G['WriteOnlyMessage'].PrepareForSending = function(compressPastThreshold, isCompressed, length) end

---`Constructor Public Instance`
---@return Barotrauma.Networking.WriteOnlyMessage
_G['WriteOnlyMessage'] = function() end

---`Constructor Public Instance`
---@return Barotrauma.Networking.WriteOnlyMessage
_G['WriteOnlyMessage'].__new = function() end

