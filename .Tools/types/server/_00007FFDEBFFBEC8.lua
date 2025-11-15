---@meta
---@class Barotrauma.Voting : System.Object
---`Field Private Instance`
---@field rejectedVoteCooldown System.TimeSpan
---`Field Private Instance`
---@field rejectedVoteTimes (System.Collections.Generic.Dictionary*1Barotrauma*Networking*Client*1System*ValueTuple*2Barotrauma*Networking*VoteType*2System*DateTime)|({[Barotrauma.Networking.Client]:(System.ValueTuple*1Barotrauma*Networking*VoteType*1System*DateTime)})
---`Field Public Static`
---@field ActiveVote Barotrauma.Voting.IVote
---`Field Private Static`
---@field pendingVotes (System.Collections.Generic.Queue*1Barotrauma*Voting*IVote)|(fun():(Barotrauma.Voting.IVote))
_G['Voting'] = {}

---`Method Private Instance`
---@param subInfo Barotrauma.SubmarineInfo
---@param transferItems System.Boolean
---@param voteType Barotrauma.Networking.VoteType
---@param sender Barotrauma.Networking.Client
_G['Voting'].StartSubmarineVote = function(subInfo, transferItems, voteType, sender) end

---`Method Public Instance`
---@param passed System.Boolean
_G['Voting'].StopSubmarineVote = function(passed) end

---`Method Public Instance`
---@param passed System.Boolean
_G['Voting'].StopMoneyTransferVote = function(passed) end

---`Method Public Instance`
---@param passed System.Boolean
_G['Voting'].StopActiveVote = function(passed) end

---`Method Public Instance`
---@param starter Barotrauma.Networking.Client
---@param from Barotrauma.Networking.Client
---@param transferAmount System.Int32
---@param to Barotrauma.Networking.Client
_G['Voting'].StartTransferVote = function(starter, from, transferAmount, to) end

---`Method Private Static`
---@param vote Barotrauma.Voting.IVote
_G['Voting'].StartOrEnqueueVote = function(vote) end

---`Method Public Instance`
---@param client Barotrauma.Networking.Client
---@return System.Boolean
_G['Voting'].CanVoteToStartRound = function(client) end

---`Method Public Instance`
---@param client Barotrauma.Networking.Client
---@return System.Boolean
_G['Voting'].CanVoteToEndRound = function(client) end

---`Method Private Instance`
---@param sender Barotrauma.Networking.Client
---@param voteType Barotrauma.Networking.VoteType
---@return System.Boolean
_G['Voting'].ShouldRejectVote = function(sender, voteType) end

---`Method NonPublic Instance`
---@param vote Barotrauma.Voting.IVote
_G['Voting'].RegisterRejectedVote = function(vote) end

---`Method Public Instance`
---@param deltaTime System.Single
_G['Voting'].Update = function(deltaTime) end

---`Method Public Static`
---@param connectedClients (System.Collections.Generic.IEnumerable*1Barotrauma*Networking*Client)|(fun():(Barotrauma.Networking.Client))
---@param resetKickVotes System.Boolean
_G['Voting'].ResetVotes = function(connectedClients, resetKickVotes) end

---`Method Public Instance`
---@param inc Barotrauma.Networking.IReadMessage
---@param sender Barotrauma.Networking.Client
---@param dosProtection Barotrauma.DoSProtection
_G['Voting'].ServerRead = function(inc, sender, dosProtection) end

---`Method Public Instance`
---@param msg Barotrauma.Networking.IWriteMessage
_G['Voting'].ServerWrite = function(msg) end

---`Method Private Static`
---@param voteType Barotrauma.Networking.VoteType
---@param voters (System.Collections.Generic.IEnumerable*1Barotrauma*Networking*Client)|(fun():(Barotrauma.Networking.Client))
---@return (System.Collections.Generic.IReadOnlyDictionary*1Barotrauma*Voting*T*1System*Int32)|({[Barotrauma.Voting.T]:(System.Int32)})
_G['Voting'].GetVoteCounts = function(voteType, voters) end

---`Method Public Static`
---@overload fun(voteType:Barotrauma.Networking.VoteType, voters:(System.Collections.Generic.IEnumerable*1Barotrauma*Networking*Client)|(fun():(Barotrauma.Networking.Client))):(Barotrauma.Voting.T)
---@param voteType Barotrauma.Networking.VoteType
---@param voters (System.Collections.Generic.IEnumerable*1Barotrauma*Networking*Client)|(fun():(Barotrauma.Networking.Client))
---@param voteCount System.Int32-ref
---@return Barotrauma.Voting.T
_G['Voting'].HighestVoted = function(voteType, voters, voteCount) end

---`Constructor Public Instance`
---@overload fun():Barotrauma.Voting
---@return Barotrauma.Voting
_G['Voting'] = function() end

---`Constructor Public Instance`
---@overload fun():Barotrauma.Voting
---@return Barotrauma.Voting
_G['Voting'].__new = function() end

---`Constructor Private Static`
---@overload fun():Barotrauma.Voting
---@return Barotrauma.Voting
_G['Voting'] = function() end

---`Constructor Private Static`
---@overload fun():Barotrauma.Voting
---@return Barotrauma.Voting
_G['Voting'].__new = function() end

