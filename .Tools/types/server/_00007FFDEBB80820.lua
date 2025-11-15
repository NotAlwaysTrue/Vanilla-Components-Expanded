---@meta
---@class System.Exception : System.Object
---`Field Private Instance`
---@field _exceptionMethod System.Reflection.MethodBase
---`Field NonPublic Instance`
---@field _message System.String
---`Field Private Instance`
---@field _data System.Collections.IDictionary
---`Field Private Instance`
---@field _innerException System.Exception
---`Field Private Instance`
---@field _helpURL System.String
---`Field Private Instance`
---@field _stackTrace (System.Byte-arr)|(System.Byte[])
---`Field Private Instance`
---@field _watsonBuckets (System.Byte-arr)|(System.Byte[])
---`Field Private Instance`
---@field _stackTraceString System.String
---`Field Private Instance`
---@field _remoteStackTraceString System.String
---`Field Private Instance`
---@field _dynamicMethods (System.Object-arr)|(System.Object[])
---`Field Private Instance`
---@field _source System.String
---`Field Private Instance`
---@field _ipForWatsonBuckets System.UIntPtr
---`Field Private Instance`
---@field _xptrs System.IntPtr
---`Field Private Instance`
---@field _xcode System.Int32
---`Field Private Instance`
---@field _HResult System.Int32
---`Field Private Static`
---@field _COMPlusExceptionCode System.Int32
---`Field NonPublic Static`
---@field InnerExceptionPrefix System.String
---`Getter Public Instance`
---@field TargetSite System.Reflection.MethodBase
---`Getter Private Instance`
---@field HasBeenThrown System.Boolean
---`Getter Private Instance`
---@field SerializationWatsonBuckets System.Object
---`Getter Public Instance Virtual`
---@field Message System.String
---`Getter Public Instance Virtual`
---@field Data System.Collections.IDictionary
---`Getter Public Instance`
---@field InnerException System.Exception
---`Getter Public Instance Virtual`
---<br/>`Setter Public Instance Virtual`
---@field HelpLink System.String
---`Getter Public Instance Virtual`
---<br/>`Setter Public Instance Virtual`
---@field Source System.String
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field HResult System.Int32
---`Getter Public Instance Virtual`
---@field StackTrace System.String
---`Getter Private Instance`
---@field SerializationStackTraceString System.String
_G['System']['Exception'] = {}

---`Method Private Instance`
---@return System.Collections.IDictionary
_G['System']['Exception'].CreateDataContainer = function() end

---`Method Private Static`
---@param e System.Exception
---@return System.Boolean
_G['System']['Exception'].IsImmutableAgileException = function(e) end

---`Method Private Static`
---@param stackTrace System.Object
---@return System.IRuntimeMethodInfo
_G['System']['Exception'].GetMethodFromStackTrace = function(stackTrace) end

---`Method Private Instance`
---@return System.Reflection.MethodBase
_G['System']['Exception'].GetExceptionMethodFromStackTrace = function() end

---`Method Private Instance`
---@param context System.Runtime.Serialization.StreamingContext
_G['System']['Exception'].OnDeserialized = function(context) end

---`Method NonPublic Instance`
_G['System']['Exception'].InternalPreserveStackTrace = function() end

---`Method Private Static`
_G['System']['Exception'].PrepareForForeignExceptionRaise = function() end

---`Method Private Static`
---@param exception System.Exception
---@param currentStackTrace System.Byte-arr-ref
---@param dynamicMethodArray System.Object-arr-ref
_G['System']['Exception'].GetStackTracesDeepCopy = function(exception, currentStackTrace, dynamicMethodArray) end

---`Method NonPublic Static`
---@param exception System.Exception
---@param currentStackTrace (System.Byte-arr)|(System.Byte[])
---@param dynamicMethodArray (System.Object-arr)|(System.Object[])
_G['System']['Exception'].SaveStackTracesFromDeepCopy = function(exception, currentStackTrace, dynamicMethodArray) end

---`Method NonPublic Static`
---@return System.UInt32
_G['System']['Exception'].GetExceptionCount = function() end

---`Method NonPublic Instance`
---@param dispatchState System.DispatchState-ref
_G['System']['Exception'].RestoreDispatchState = function(dispatchState) end

---`Method NonPublic Static`
---@param kind System.Exception.ExceptionMessageKind
---@return System.String
_G['System']['Exception'].GetMessageFromNativeResources = function(kind) end

---`Method Private Static`
---@param kind System.Exception.ExceptionMessageKind
---@param retMesg System.Runtime.CompilerServices.StringHandleOnStack
_G['System']['Exception'].GetMessageFromNativeResources = function(kind, retMesg) end

---`Method NonPublic Instance`
---@return System.Exception.DispatchState
_G['System']['Exception'].CaptureDispatchState = function() end

---`Method Private Instance`
---@return System.Boolean
_G['System']['Exception'].CanSetRemoteStackTrace = function() end

---`Method NonPublic Instance`
---@param helpContext System.UInt32-ref
---@return System.String
_G['System']['Exception'].GetHelpContext = function(helpContext) end

---`Method Private Instance`
---@return System.String
_G['System']['Exception'].GetClassName = function() end

---`Method Public Instance Virtual`
---@return System.Exception
_G['System']['Exception'].GetBaseException = function() end

---`Method Public Instance Virtual`
---@param info System.Runtime.Serialization.SerializationInfo
---@param context System.Runtime.Serialization.StreamingContext
_G['System']['Exception'].GetObjectData = function(info, context) end

---`Method Public Instance Virtual`
---@return System.String
_G['System']['Exception'].ToString = function() end

---`Method Public Instance`
---@return System.Type
_G['System']['Exception'].GetType = function() end

---`Method Private Instance`
---@param info System.Runtime.Serialization.SerializationInfo
---@param context System.Runtime.Serialization.StreamingContext
_G['System']['Exception'].RestoreRemoteStackTrace = function(info, context) end

---`Method Private Instance`
---@return System.String
_G['System']['Exception'].GetStackTrace = function() end

---`Method NonPublic Instance`
_G['System']['Exception'].SetCurrentStackTrace = function() end

---`Method NonPublic Instance`
---@param stackTrace System.String
_G['System']['Exception'].SetRemoteStackTrace = function(stackTrace) end

---`Constructor Public Instance`
---@overload fun():System.Exception
---@overload fun(message:System.String):System.Exception
---@overload fun(message:System.String, innerException:System.Exception):System.Exception
---@param info System.Runtime.Serialization.SerializationInfo
---@param context System.Runtime.Serialization.StreamingContext
---@return System.Exception
_G['System']['Exception'] = function(info, context) end

---`Constructor Public Instance`
---@overload fun():System.Exception
---@overload fun(message:System.String):System.Exception
---@overload fun(message:System.String, innerException:System.Exception):System.Exception
---@param info System.Runtime.Serialization.SerializationInfo
---@param context System.Runtime.Serialization.StreamingContext
---@return System.Exception
_G['System']['Exception'].__new = function(info, context) end

---`Constructor NonPublic Instance`
---@overload fun():System.Exception
---@overload fun(message:System.String):System.Exception
---@overload fun(message:System.String, innerException:System.Exception):System.Exception
---@param info System.Runtime.Serialization.SerializationInfo
---@param context System.Runtime.Serialization.StreamingContext
---@return System.Exception
_G['System']['Exception'] = function(info, context) end

---`Constructor NonPublic Instance`
---@overload fun():System.Exception
---@overload fun(message:System.String):System.Exception
---@overload fun(message:System.String, innerException:System.Exception):System.Exception
---@param info System.Runtime.Serialization.SerializationInfo
---@param context System.Runtime.Serialization.StreamingContext
---@return System.Exception
_G['System']['Exception'].__new = function(info, context) end

