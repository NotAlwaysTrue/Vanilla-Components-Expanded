---@meta
---@class System.Net.IPAddress : System.Object
---`Field Private Instance`
---@field _addressOrScopeId System.UInt32
---`Field Private Instance`
---@field _numbers (System.UInt16-arr)|(System.UInt16[])
---`Field Private Instance`
---@field _toString System.String
---`Field Private Instance`
---@field _hashCode System.Int32
---`Field Public Static`
---@field Any System.Net.IPAddress
---`Field Public Static`
---@field Loopback System.Net.IPAddress
---`Field Public Static`
---@field Broadcast System.Net.IPAddress
---`Field Public Static`
---@field None System.Net.IPAddress
---`Field Public Static`
---@field IPv6Any System.Net.IPAddress
---`Field Public Static`
---@field IPv6Loopback System.Net.IPAddress
---`Field Public Static`
---@field IPv6None System.Net.IPAddress
---`Field Private Static`
---@field s_loopbackMappedToIPv6 System.Net.IPAddress
---`Getter Private Instance`
---@field IsIPv4 System.Boolean
---`Getter Private Instance`
---@field IsIPv6 System.Boolean
---`Getter NonPublic Instance`
---<br/>`Setter Private Instance`
---@field PrivateAddress System.UInt32
---`Getter Private Instance`
---<br/>`Setter Private Instance`
---@field PrivateScopeId System.UInt32
---`Getter Public Instance`
---@field AddressFamily System.Net.Sockets.AddressFamily
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field ScopeId System.Int64
---`Getter Public Instance`
---@field IsIPv6Multicast System.Boolean
---`Getter Public Instance`
---@field IsIPv6LinkLocal System.Boolean
---`Getter Public Instance`
---@field IsIPv6SiteLocal System.Boolean
---`Getter Public Instance`
---@field IsIPv6Teredo System.Boolean
---`Getter Public Instance`
---@field IsIPv6UniqueLocal System.Boolean
---`Getter Public Instance`
---@field IsIPv4MappedToIPv6 System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Address System.Int64
_G['IPAddress'] = {}

---`Method Private Static`
---@param address System.ReadOnlySpan*1System*Byte
---@return (System.UInt16-arr)|(System.UInt16[])
_G['IPAddress'].ReadUInt16NumbersFromBytes = function(address) end

---`Method Public Static`
---@overload fun(ipString:System.String, address:System.Net.IPAddress-ref):(System.Boolean)
---@param ipSpan System.ReadOnlySpan*1System*Char
---@param address System.Net.IPAddress-ref
---@return System.Boolean
_G['IPAddress'].TryParse = function(ipSpan, address) end

---`Method Public Static`
---@overload fun(ipString:System.String):(System.Net.IPAddress)
---@param ipSpan System.ReadOnlySpan*1System*Char
---@return System.Net.IPAddress
_G['IPAddress'].Parse = function(ipSpan) end

---`Method Public Instance`
---@param destination System.Span*1System*Byte
---@param bytesWritten System.Int32-ref
---@return System.Boolean
_G['IPAddress'].TryWriteBytes = function(destination, bytesWritten) end

---`Method Private Instance`
---@param destination System.Span*1System*Byte
_G['IPAddress'].WriteIPv6Bytes = function(destination) end

---`Method Private Instance`
---@param destination System.Span*1System*Byte
_G['IPAddress'].WriteIPv4Bytes = function(destination) end

---`Method Public Instance`
---@return (System.Byte-arr)|(System.Byte[])
_G['IPAddress'].GetAddressBytes = function() end

---`Method Public Instance Virtual`
---@return System.String
_G['IPAddress'].ToString = function() end

---`Method Public Instance`
---@overload fun(destination:System.Span*1System*Char, charsWritten:System.Int32-ref):(System.Boolean)
---@param utf8Destination System.Span*1System*Byte
---@param bytesWritten System.Int32-ref
---@return System.Boolean
_G['IPAddress'].TryFormat = function(utf8Destination, bytesWritten) end

---`Method Private Instance`
---@param destination System.Span*1System*Net*IPAddress*TChar
---@param charsWritten System.Int32-ref
---@return System.Boolean
_G['IPAddress'].TryFormatCore = function(destination, charsWritten) end

---`Method Public Static`
---@overload fun(host:System.Int64):(System.Int64)
---@overload fun(host:System.Int32):(System.Int32)
---@param host System.Int16
---@return System.Int16
_G['IPAddress'].HostToNetworkOrder = function(host) end

---`Method Public Static`
---@overload fun(network:System.Int64):(System.Int64)
---@overload fun(network:System.Int32):(System.Int32)
---@param network System.Int16
---@return System.Int16
_G['IPAddress'].NetworkToHostOrder = function(network) end

---`Method Public Static`
---@param address System.Net.IPAddress
---@return System.Boolean
_G['IPAddress'].IsLoopback = function(address) end

---`Method Public Instance Virtual`
---@param comparand System.Object
---@return System.Boolean
_G['IPAddress'].Equals = function(comparand) end

---`Method NonPublic Instance`
---@param comparand System.Net.IPAddress
---@return System.Boolean
_G['IPAddress'].Equals = function(comparand) end

---`Method Public Instance Virtual`
---@return System.Int32
_G['IPAddress'].GetHashCode = function() end

---`Method Public Instance`
---@return System.Net.IPAddress
_G['IPAddress'].MapToIPv6 = function() end

---`Method Public Instance`
---@return System.Net.IPAddress
_G['IPAddress'].MapToIPv4 = function() end

---`Method Private Static`
---@return (System.Byte-arr)|(System.Byte[])
_G['IPAddress'].ThrowAddressNullException = function() end

---`Method Private Static`
_G['IPAddress'].ThrowSocketOperationNotSupported = function() end

---`Constructor Public Instance`
---@overload fun(newAddress:System.Int64):System.Net.IPAddress
---@overload fun(address:(System.Byte-arr)|(System.Byte[]), scopeid:System.Int64):System.Net.IPAddress
---@overload fun(address:System.ReadOnlySpan*1System*Byte, scopeid:System.Int64):System.Net.IPAddress
---@overload fun(numbers:System.ReadOnlySpan*1System*UInt16, scopeid:System.UInt32):System.Net.IPAddress
---@overload fun(numbers:(System.UInt16-arr)|(System.UInt16[]), scopeid:System.UInt32):System.Net.IPAddress
---@overload fun(address:(System.Byte-arr)|(System.Byte[])):System.Net.IPAddress
---@overload fun(address:System.ReadOnlySpan*1System*Byte):System.Net.IPAddress
---@return System.Net.IPAddress
_G['IPAddress'] = function() end

---`Constructor Public Instance`
---@overload fun(newAddress:System.Int64):System.Net.IPAddress
---@overload fun(address:(System.Byte-arr)|(System.Byte[]), scopeid:System.Int64):System.Net.IPAddress
---@overload fun(address:System.ReadOnlySpan*1System*Byte, scopeid:System.Int64):System.Net.IPAddress
---@overload fun(numbers:System.ReadOnlySpan*1System*UInt16, scopeid:System.UInt32):System.Net.IPAddress
---@overload fun(numbers:(System.UInt16-arr)|(System.UInt16[]), scopeid:System.UInt32):System.Net.IPAddress
---@overload fun(address:(System.Byte-arr)|(System.Byte[])):System.Net.IPAddress
---@overload fun(address:System.ReadOnlySpan*1System*Byte):System.Net.IPAddress
---@return System.Net.IPAddress
_G['IPAddress'].__new = function() end

---`Constructor NonPublic Instance`
---@overload fun(newAddress:System.Int64):System.Net.IPAddress
---@overload fun(address:(System.Byte-arr)|(System.Byte[]), scopeid:System.Int64):System.Net.IPAddress
---@overload fun(address:System.ReadOnlySpan*1System*Byte, scopeid:System.Int64):System.Net.IPAddress
---@overload fun(numbers:System.ReadOnlySpan*1System*UInt16, scopeid:System.UInt32):System.Net.IPAddress
---@overload fun(numbers:(System.UInt16-arr)|(System.UInt16[]), scopeid:System.UInt32):System.Net.IPAddress
---@overload fun(address:(System.Byte-arr)|(System.Byte[])):System.Net.IPAddress
---@overload fun(address:System.ReadOnlySpan*1System*Byte):System.Net.IPAddress
---@return System.Net.IPAddress
_G['IPAddress'] = function() end

---`Constructor NonPublic Instance`
---@overload fun(newAddress:System.Int64):System.Net.IPAddress
---@overload fun(address:(System.Byte-arr)|(System.Byte[]), scopeid:System.Int64):System.Net.IPAddress
---@overload fun(address:System.ReadOnlySpan*1System*Byte, scopeid:System.Int64):System.Net.IPAddress
---@overload fun(numbers:System.ReadOnlySpan*1System*UInt16, scopeid:System.UInt32):System.Net.IPAddress
---@overload fun(numbers:(System.UInt16-arr)|(System.UInt16[]), scopeid:System.UInt32):System.Net.IPAddress
---@overload fun(address:(System.Byte-arr)|(System.Byte[])):System.Net.IPAddress
---@overload fun(address:System.ReadOnlySpan*1System*Byte):System.Net.IPAddress
---@return System.Net.IPAddress
_G['IPAddress'].__new = function() end

---`Constructor Private Instance`
---@overload fun(newAddress:System.Int64):System.Net.IPAddress
---@overload fun(address:(System.Byte-arr)|(System.Byte[]), scopeid:System.Int64):System.Net.IPAddress
---@overload fun(address:System.ReadOnlySpan*1System*Byte, scopeid:System.Int64):System.Net.IPAddress
---@overload fun(numbers:System.ReadOnlySpan*1System*UInt16, scopeid:System.UInt32):System.Net.IPAddress
---@overload fun(numbers:(System.UInt16-arr)|(System.UInt16[]), scopeid:System.UInt32):System.Net.IPAddress
---@overload fun(address:(System.Byte-arr)|(System.Byte[])):System.Net.IPAddress
---@overload fun(address:System.ReadOnlySpan*1System*Byte):System.Net.IPAddress
---@return System.Net.IPAddress
_G['IPAddress'] = function() end

---`Constructor Private Instance`
---@overload fun(newAddress:System.Int64):System.Net.IPAddress
---@overload fun(address:(System.Byte-arr)|(System.Byte[]), scopeid:System.Int64):System.Net.IPAddress
---@overload fun(address:System.ReadOnlySpan*1System*Byte, scopeid:System.Int64):System.Net.IPAddress
---@overload fun(numbers:System.ReadOnlySpan*1System*UInt16, scopeid:System.UInt32):System.Net.IPAddress
---@overload fun(numbers:(System.UInt16-arr)|(System.UInt16[]), scopeid:System.UInt32):System.Net.IPAddress
---@overload fun(address:(System.Byte-arr)|(System.Byte[])):System.Net.IPAddress
---@overload fun(address:System.ReadOnlySpan*1System*Byte):System.Net.IPAddress
---@return System.Net.IPAddress
_G['IPAddress'].__new = function() end

---`Constructor Private Static`
---@overload fun(newAddress:System.Int64):System.Net.IPAddress
---@overload fun(address:(System.Byte-arr)|(System.Byte[]), scopeid:System.Int64):System.Net.IPAddress
---@overload fun(address:System.ReadOnlySpan*1System*Byte, scopeid:System.Int64):System.Net.IPAddress
---@overload fun(numbers:System.ReadOnlySpan*1System*UInt16, scopeid:System.UInt32):System.Net.IPAddress
---@overload fun(numbers:(System.UInt16-arr)|(System.UInt16[]), scopeid:System.UInt32):System.Net.IPAddress
---@overload fun(address:(System.Byte-arr)|(System.Byte[])):System.Net.IPAddress
---@overload fun(address:System.ReadOnlySpan*1System*Byte):System.Net.IPAddress
---@return System.Net.IPAddress
_G['IPAddress'] = function() end

---`Constructor Private Static`
---@overload fun(newAddress:System.Int64):System.Net.IPAddress
---@overload fun(address:(System.Byte-arr)|(System.Byte[]), scopeid:System.Int64):System.Net.IPAddress
---@overload fun(address:System.ReadOnlySpan*1System*Byte, scopeid:System.Int64):System.Net.IPAddress
---@overload fun(numbers:System.ReadOnlySpan*1System*UInt16, scopeid:System.UInt32):System.Net.IPAddress
---@overload fun(numbers:(System.UInt16-arr)|(System.UInt16[]), scopeid:System.UInt32):System.Net.IPAddress
---@overload fun(address:(System.Byte-arr)|(System.Byte[])):System.Net.IPAddress
---@overload fun(address:System.ReadOnlySpan*1System*Byte):System.Net.IPAddress
---@return System.Net.IPAddress
_G['IPAddress'].__new = function() end

