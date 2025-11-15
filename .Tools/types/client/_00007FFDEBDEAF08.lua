---@meta
---@class System.Console : System.Object
---`Field Private Static`
---@field s_syncObject System.Object
---`Field Private Static`
---@field s_in System.IO.TextReader
---`Field Private Static`
---@field s_out System.IO.TextWriter
---`Field Private Static`
---@field s_error System.IO.TextWriter
---`Field Private Static`
---@field s_inputEncoding System.Text.Encoding
---`Field Private Static`
---@field s_outputEncoding System.Text.Encoding
---`Field Private Static`
---@field s_isOutTextWriterRedirected System.Boolean
---`Field Private Static`
---@field s_isErrorTextWriterRedirected System.Boolean
---`Field Private Static`
---@field s_cancelCallbacks (System.ConsoleCancelEventHandler)|(fun(sender:System.Object, e:System.ConsoleCancelEventArgs))
---`Field Private Static`
---@field s_sigIntRegistration System.Runtime.InteropServices.PosixSignalRegistration
---`Field Private Static`
---@field s_sigQuitRegistration System.Runtime.InteropServices.PosixSignalRegistration
---`Field Private Static`
---@field _isStdInRedirected System.Runtime.CompilerServices.StrongBox*1System*Boolean
---`Field Private Static`
---@field _isStdOutRedirected System.Runtime.CompilerServices.StrongBox*1System*Boolean
---`Field Private Static`
---@field _isStdErrRedirected System.Runtime.CompilerServices.StrongBox*1System*Boolean
---`Getter Public Static`
---@field In System.IO.TextReader
---`Getter Public Static`
---<br/>`Setter Public Static`
---@field InputEncoding System.Text.Encoding
---`Getter Public Static`
---<br/>`Setter Public Static`
---@field OutputEncoding System.Text.Encoding
---`Getter Public Static`
---@field KeyAvailable System.Boolean
---`Getter Public Static`
---@field Out System.IO.TextWriter
---`Getter Public Static`
---@field Error System.IO.TextWriter
---`Getter Public Static`
---@field IsInputRedirected System.Boolean
---`Getter Public Static`
---@field IsOutputRedirected System.Boolean
---`Getter Public Static`
---@field IsErrorRedirected System.Boolean
---`Getter Public Static`
---<br/>`Setter Public Static`
---@field CursorSize System.Int32
---`Getter Public Static`
---@field NumberLock System.Boolean
---`Getter Public Static`
---@field CapsLock System.Boolean
---`Getter Public Static`
---<br/>`Setter Public Static`
---@field BackgroundColor System.ConsoleColor
---`Getter Public Static`
---<br/>`Setter Public Static`
---@field ForegroundColor System.ConsoleColor
---`Getter Public Static`
---<br/>`Setter Public Static`
---@field BufferWidth System.Int32
---`Getter Public Static`
---<br/>`Setter Public Static`
---@field BufferHeight System.Int32
---`Getter Public Static`
---<br/>`Setter Public Static`
---@field WindowLeft System.Int32
---`Getter Public Static`
---<br/>`Setter Public Static`
---@field WindowTop System.Int32
---`Getter Public Static`
---<br/>`Setter Public Static`
---@field WindowWidth System.Int32
---`Getter Public Static`
---<br/>`Setter Public Static`
---@field WindowHeight System.Int32
---`Getter Public Static`
---@field LargestWindowWidth System.Int32
---`Getter Public Static`
---@field LargestWindowHeight System.Int32
---`Getter Public Static`
---<br/>`Setter Public Static`
---@field CursorVisible System.Boolean
---`Getter Public Static`
---<br/>`Setter Public Static`
---@field CursorLeft System.Int32
---`Getter Public Static`
---<br/>`Setter Public Static`
---@field CursorTop System.Int32
---`Getter Public Static`
---<br/>`Setter Public Static`
---@field Title System.String
---`Getter Public Static`
---<br/>`Setter Public Static`
---@field TreatControlCAsInput System.Boolean
_G['System']['Console'] = {}

---`Method Public Static`
---@overload fun():(System.ConsoleKeyInfo)
---@param intercept System.Boolean
---@return System.ConsoleKeyInfo
_G['System']['Console'].ReadKey = function(intercept) end

---`Method Private Static`
---@param outputStream System.IO.Stream
---@return System.IO.TextWriter
_G['System']['Console'].CreateOutputWriter = function(outputStream) end

---`Method Public Static`
_G['System']['Console'].ResetColor = function() end

---`Method Public Static`
---@param width System.Int32
---@param height System.Int32
_G['System']['Console'].SetBufferSize = function(width, height) end

---`Method Public Static`
---@param left System.Int32
---@param top System.Int32
_G['System']['Console'].SetWindowPosition = function(left, top) end

---`Method Public Static`
---@param width System.Int32
---@param height System.Int32
_G['System']['Console'].SetWindowSize = function(width, height) end

---`Method Public Static`
---@return System.ValueTuple*1System*Int32*1System*Int32
_G['System']['Console'].GetCursorPosition = function() end

---`Method Public Static`
---@overload fun()
---@param frequency System.Int32
---@param duration System.Int32
_G['System']['Console'].Beep = function(frequency, duration) end

---`Method Public Static`
---@overload fun(sourceLeft:System.Int32, sourceTop:System.Int32, sourceWidth:System.Int32, sourceHeight:System.Int32, targetLeft:System.Int32, targetTop:System.Int32)
---@param sourceLeft System.Int32
---@param sourceTop System.Int32
---@param sourceWidth System.Int32
---@param sourceHeight System.Int32
---@param targetLeft System.Int32
---@param targetTop System.Int32
---@param sourceChar System.Char
---@param sourceForeColor System.ConsoleColor
---@param sourceBackColor System.ConsoleColor
_G['System']['Console'].MoveBufferArea = function(sourceLeft, sourceTop, sourceWidth, sourceHeight, targetLeft, targetTop, sourceChar, sourceForeColor, sourceBackColor) end

---`Method Public Static`
_G['System']['Console'].Clear = function() end

---`Method Public Static`
---@param left System.Int32
---@param top System.Int32
_G['System']['Console'].SetCursorPosition = function(left, top) end

---`Method Public Static`
---@overload fun():(System.IO.Stream)
---@param bufferSize System.Int32
---@return System.IO.Stream
_G['System']['Console'].OpenStandardInput = function(bufferSize) end

---`Method Public Static`
---@overload fun():(System.IO.Stream)
---@param bufferSize System.Int32
---@return System.IO.Stream
_G['System']['Console'].OpenStandardOutput = function(bufferSize) end

---`Method Public Static`
---@overload fun():(System.IO.Stream)
---@param bufferSize System.Int32
---@return System.IO.Stream
_G['System']['Console'].OpenStandardError = function(bufferSize) end

---`Method Public Static`
---@param newIn System.IO.TextReader
_G['System']['Console'].SetIn = function(newIn) end

---`Method Public Static`
---@param newOut System.IO.TextWriter
_G['System']['Console'].SetOut = function(newOut) end

---`Method Public Static`
---@param newError System.IO.TextWriter
_G['System']['Console'].SetError = function(newError) end

---`Method Public Static`
---@return System.Int32
_G['System']['Console'].Read = function() end

---`Method Public Static`
---@return System.String
_G['System']['Console'].ReadLine = function() end

---`Method Public Static`
---@overload fun()
---@overload fun(value:System.Boolean)
---@overload fun(value:System.Char)
---@overload fun(buffer:(System.Char-arr)|(System.Char[]))
---@overload fun(buffer:(System.Char-arr)|(System.Char[]), index:System.Int32, count:System.Int32)
---@overload fun(value:System.Decimal)
---@overload fun(value:System.Double)
---@overload fun(value:System.Single)
---@overload fun(value:System.Int32)
---@overload fun(value:System.UInt32)
---@overload fun(value:System.Int64)
---@overload fun(value:System.UInt64)
---@overload fun(value:System.Object)
---@overload fun(value:System.String)
---@overload fun(format:System.String, arg0:System.Object)
---@overload fun(format:System.String, arg0:System.Object, arg1:System.Object)
---@overload fun(format:System.String, arg0:System.Object, arg1:System.Object, arg2:System.Object)
---@param format System.String
---@param ... System.Object
_G['System']['Console'].WriteLine = function(format, ...) end

---`Method Public Static`
---@overload fun(format:System.String, arg0:System.Object)
---@overload fun(format:System.String, arg0:System.Object, arg1:System.Object)
---@overload fun(format:System.String, arg0:System.Object, arg1:System.Object, arg2:System.Object)
---@overload fun(format:System.String, ...:System.Object)
---@overload fun(value:System.Boolean)
---@overload fun(value:System.Char)
---@overload fun(buffer:(System.Char-arr)|(System.Char[]))
---@overload fun(buffer:(System.Char-arr)|(System.Char[]), index:System.Int32, count:System.Int32)
---@overload fun(value:System.Double)
---@overload fun(value:System.Decimal)
---@overload fun(value:System.Single)
---@overload fun(value:System.Int32)
---@overload fun(value:System.UInt32)
---@overload fun(value:System.Int64)
---@overload fun(value:System.UInt64)
---@overload fun(value:System.Object)
---@param value System.String
_G['System']['Console'].Write = function(value) end

---`Method Private Static`
---@param ctx System.Runtime.InteropServices.PosixSignalContext
_G['System']['Console'].HandlePosixSignal = function(ctx) end

---`Constructor Private Static`
---@return System.Console
_G['System']['Console'] = function() end

---`Constructor Private Static`
---@return System.Console
_G['System']['Console'].__new = function() end

