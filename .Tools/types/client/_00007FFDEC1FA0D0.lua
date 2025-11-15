---@meta
---@class Barotrauma.Voting : System.Object
---`Field Private Instance`
---@field voteCountYes (System.Collections.Generic.Dictionary*1Barotrauma*Networking*VoteType*1System*Int32)|({[Barotrauma.Networking.VoteType]:(System.Int32)})
---`Field Private Instance`
---@field voteCountNo (System.Collections.Generic.Dictionary*1Barotrauma*Networking*VoteType*1System*Int32)|({[Barotrauma.Networking.VoteType]:(System.Int32)})
---`Field Private Instance`
---@field voteCountMax (System.Collections.Generic.Dictionary*1Barotrauma*Networking*VoteType*1System*Int32)|({[Barotrauma.Networking.VoteType]:(System.Int32)})
_G['Voting'] = {}

---`Method Public Instance`
---@param voteType Barotrauma.Networking.VoteType
---@return System.Int32
_G['Voting'].GetVoteCountYes = function(voteType) end

---`Method Public Instance`
---@param voteType Barotrauma.Networking.VoteType
---@return System.Int32
_G['Voting'].GetVoteCountNo = function(voteType) end

---`Method Public Instance`
---@param voteType Barotrauma.Networking.VoteType
---@return System.Int32
_G['Voting'].GetVoteCountMax = function(voteType) end

---`Method Public Instance`
---@param voteType Barotrauma.Networking.VoteType
---@param value System.Int32
_G['Voting'].SetVoteCountYes = function(voteType, value) end

---`Method Public Instance`
---@param voteType Barotrauma.Networking.VoteType
---@param value System.Int32
_G['Voting'].SetVoteCountNo = function(voteType, value) end

---`Method Public Instance`
---@param voteType Barotrauma.Networking.VoteType
---@param value System.Int32
_G['Voting'].SetVoteCountMax = function(voteType, value) end

---`Method Public Instance`
---@param clients (System.Collections.Generic.IEnumerable*1Barotrauma*Networking*Client)|(fun():(Barotrauma.Networking.Client))
---@param voteType Barotrauma.Networking.VoteType
_G['Voting'].UpdateVoteTexts = function(clients, voteType) end

---`Method Private Instance`
---@param subListBox Barotrauma.GUIListBox
---@param userData Barotrauma.SubmarineInfo
---@param votes System.Int32
---@param type Barotrauma.CharacterTeamType
_G['Voting'].SetSubVoteText = function(subListBox, userData, votes, type) end

---`Method Private Instance`
---@param listBox Barotrauma.GUIListBox
---@param userData System.Object
---@param votes System.Int32
_G['Voting'].SetVoteText = function(listBox, userData, votes) end

---`Method Public Instance`
---@param connectedClients (System.Collections.Generic.IEnumerable*1Barotrauma*Networking*Client)|(fun():(Barotrauma.Networking.Client))
_G['Voting'].ResetVotes = function(connectedClients) end

---`Method Public Instance`
---@param msg Barotrauma.Networking.IWriteMessage
---@param voteType Barotrauma.Networking.VoteType
---@param data System.Object
---@return System.Boolean
_G['Voting'].ClientWrite = function(msg, voteType, data) end

---`Method Public Instance`
---@param inc Barotrauma.Networking.IReadMessage
_G['Voting'].ClientRead = function(inc) end

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
---@return Barotrauma.Voting
_G['Voting'] = function() end

---`Constructor Public Instance`
---@return Barotrauma.Voting
_G['Voting'].__new = function() end

