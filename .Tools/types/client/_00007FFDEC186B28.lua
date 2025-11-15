---@meta
---@class Barotrauma.Networking.IWriteMessage
---`Getter Public Instance Abstract Virtual`
---<br/>`Setter Public Instance Abstract Virtual`
---@field BitPosition System.Int32
---`Getter Public Instance Abstract Virtual`
---@field BytePosition System.Int32
---`Getter Public Instance Abstract Virtual`
---@field Buffer (System.Byte-arr)|(System.Byte[])
---`Getter Public Instance Abstract Virtual`
---<br/>`Setter Public Instance Abstract Virtual`
---@field LengthBits System.Int32
---`Getter Public Instance Abstract Virtual`
---@field LengthBytes System.Int32
_G['IWriteMessage'] = {}

---`Method Public Instance Abstract Virtual`
---@param val System.Boolean
_G['IWriteMessage'].WriteBoolean = function(val) end

---`Method Public Instance Abstract Virtual`
_G['IWriteMessage'].WritePadBits = function() end

---`Method Public Instance Abstract Virtual`
---@param val System.Byte
_G['IWriteMessage'].WriteByte = function(val) end

---`Method Public Instance Abstract Virtual`
---@param val System.Int16
_G['IWriteMessage'].WriteInt16 = function(val) end

---`Method Public Instance Abstract Virtual`
---@param val System.UInt16
_G['IWriteMessage'].WriteUInt16 = function(val) end

---`Method Public Instance Abstract Virtual`
---@param val System.Int32
_G['IWriteMessage'].WriteInt32 = function(val) end

---`Method Public Instance Abstract Virtual`
---@param val System.UInt32
_G['IWriteMessage'].WriteUInt32 = function(val) end

---`Method Public Instance Abstract Virtual`
---@param val System.Int64
_G['IWriteMessage'].WriteInt64 = function(val) end

---`Method Public Instance Abstract Virtual`
---@param val System.UInt64
_G['IWriteMessage'].WriteUInt64 = function(val) end

---`Method Public Instance Abstract Virtual`
---@param val System.Single
_G['IWriteMessage'].WriteSingle = function(val) end

---`Method Public Instance Abstract Virtual`
---@param val System.Double
_G['IWriteMessage'].WriteDouble = function(val) end

---`Method Public Instance Abstract Virtual`
---@param val Microsoft.Xna.Framework.Color
_G['IWriteMessage'].WriteColorR8G8B8 = function(val) end

---`Method Public Instance Abstract Virtual`
---@param val Microsoft.Xna.Framework.Color
_G['IWriteMessage'].WriteColorR8G8B8A8 = function(val) end

---`Method Public Instance Abstract Virtual`
---@param val System.UInt32
_G['IWriteMessage'].WriteVariableUInt32 = function(val) end

---`Method Public Instance Abstract Virtual`
---@param val System.String
_G['IWriteMessage'].WriteString = function(val) end

---`Method Public Instance Abstract Virtual`
---@param val Barotrauma.Identifier
_G['IWriteMessage'].WriteIdentifier = function(val) end

---`Method Public Instance Abstract Virtual`
---@param val System.Int32
---@param min System.Int32
---@param max System.Int32
_G['IWriteMessage'].WriteRangedInteger = function(val, min, max) end

---`Method Public Instance Abstract Virtual`
---@param val System.Single
---@param min System.Single
---@param max System.Single
---@param bitCount System.Int32
_G['IWriteMessage'].WriteRangedSingle = function(val, min, max, bitCount) end

---`Method Public Instance Abstract Virtual`
---@param val (System.Byte-arr)|(System.Byte[])
---@param startIndex System.Int32
---@param length System.Int32
_G['IWriteMessage'].WriteBytes = function(val, startIndex, length) end

---`Method Public Instance Abstract Virtual`
---@param compressPastThreshold System.Boolean
---@param isCompressed System.Boolean-ref
---@param outLength System.Int32-ref
---@return (System.Byte-arr)|(System.Byte[])
_G['IWriteMessage'].PrepareForSending = function(compressPastThreshold, isCompressed, outLength) end

