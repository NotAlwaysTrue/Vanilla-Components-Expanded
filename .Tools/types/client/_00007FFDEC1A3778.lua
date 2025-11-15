---@meta
---@class Barotrauma.HRManagerUI : System.Object
---`Field Private Instance`
---@field campaignUI Barotrauma.CampaignUI
---`Field Private Instance`
---@field parentComponent Barotrauma.GUIComponent
---`Field Private Instance`
---@field pendingAndCrewPanel Barotrauma.GUIComponent
---`Field Private Instance`
---@field hireableList Barotrauma.GUIListBox
---`Field Private Instance`
---@field pendingList Barotrauma.GUIListBox
---`Field Private Instance`
---@field crewList Barotrauma.GUIListBox
---`Field Private Instance`
---@field characterPreviewFrame Barotrauma.GUIFrame
---`Field Private Instance`
---@field sortingDropDown Barotrauma.GUIDropDown
---`Field Private Instance`
---@field totalBlock Barotrauma.GUITextBlock
---`Field Private Instance`
---@field validateHiresButton Barotrauma.GUIButton
---`Field Private Instance`
---@field clearAllButton Barotrauma.GUIButton
---`Field Private Instance`
---@field playerBalanceElement System.Nullable*1Barotrauma*CampaignUI*PlayerBalanceElement
---`Field Private Instance`
---@field wasReplacingPermanentlyDeadCharacter System.Boolean
---`Field Private Instance`
---@field hadPermissionToHire System.Boolean
---`Field Private Instance`
---@field resolutionWhenCreated Microsoft.Xna.Framework.Point
---`Field Private Instance`
---@field needsHireableRefresh System.Boolean
---`Getter Private Instance`
---@field campaign Barotrauma.CampaignMode
---`Getter Private Instance`
---@field PendingHires (System.Collections.Generic.List*1Barotrauma*CharacterInfo)|(Barotrauma.CharacterInfo[])
---`Getter Private Static`
---@field ReplacingPermanentlyDeadCharacter System.Boolean
---`Getter Private Static`
---@field ReserveBenchEnabled System.Boolean
---`Getter Private Static`
---@field HasPermissionToHire System.Boolean
_G['HRManagerUI'] = {}

---`Method Public Instance`
_G['HRManagerUI'].RefreshUI = function() end

---`Method Private Instance`
---@param listBox Barotrauma.GUIListBox
_G['HRManagerUI'].RefreshCrewFrames = function(listBox) end

---`Method Private Instance`
_G['HRManagerUI'].CreateUI = function() end

---`Method Private Instance`
---@param location Barotrauma.Location
---@param removePending System.Boolean
---@param prevLocation? Barotrauma.Location
_G['HRManagerUI'].UpdateLocationView = function(location, removePending, prevLocation) end

---`Method Public Instance`
_G['HRManagerUI'].RefreshHRView = function() end

---`Method Public Instance`
_G['HRManagerUI'].UpdateHireables = function() end

---`Method Private Instance`
---@param location Barotrauma.Location
_G['HRManagerUI'].UpdateHireables = function(location) end

---`Method Public Instance`
---@param location Barotrauma.Location
---@param availableHires (System.Collections.Generic.List*1Barotrauma*CharacterInfo)|(Barotrauma.CharacterInfo[])
_G['HRManagerUI'].SetHireables = function(location, availableHires) end

---`Method Public Instance`
_G['HRManagerUI'].UpdateCrew = function() end

---`Method Private Instance`
---@param list Barotrauma.GUIListBox
---@param sortingMethod Barotrauma.HRManagerUI.SortingMethod
_G['HRManagerUI'].SortCharacters = function(list, sortingMethod) end

---`Method Public Instance`
---@param characterInfo Barotrauma.CharacterInfo
---@param listBox Barotrauma.GUIListBox
---@param hideSalary? System.Boolean
---@return Barotrauma.GUIComponent
_G['HRManagerUI'].CreateCharacterFrame = function(characterInfo, listBox, hideSalary) end

---`Method Private Instance`
---@return System.Boolean
_G['HRManagerUI'].ActiveServiceFull = function() end

---`Method Private Instance`
---@param characterInfo Barotrauma.CharacterInfo
---@return System.Boolean
_G['HRManagerUI'].EnoughReputationToHire = function(characterInfo) end

---`Method Private Instance`
---@param listBox Barotrauma.GUIListBox
---@param characterFrame Barotrauma.GUIFrame
---@param characterInfo Barotrauma.CharacterInfo
_G['HRManagerUI'].CreateCharacterPreviewFrame = function(listBox, characterFrame, characterInfo) end

---`Method Private Instance`
---@param listBox Barotrauma.GUIListBox
---@param characterFrame Barotrauma.GUIFrame
---@param characterInfo Barotrauma.CharacterInfo
---@return System.Boolean
_G['HRManagerUI'].SelectCharacter = function(listBox, characterFrame, characterInfo) end

---`Method Private Instance`
---@param characterInfo Barotrauma.CharacterInfo
---@param checkCrewSizeLimit? System.Boolean
---@param createNetworkMessage? System.Boolean
---@return System.Boolean
_G['HRManagerUI'].AddPendingHire = function(characterInfo, checkCrewSizeLimit, createNetworkMessage) end

---`Method Private Instance`
---@param characterInfo Barotrauma.CharacterInfo
---@param setTotalHireCost? System.Boolean
---@param createNetworkMessage? System.Boolean
---@return System.Boolean
_G['HRManagerUI'].RemovePendingHire = function(characterInfo, setTotalHireCost, createNetworkMessage) end

---`Method Private Instance`
---@param createNetworkMessage? System.Boolean
---@return System.Boolean
_G['HRManagerUI'].RemoveAllPendingHires = function(createNetworkMessage) end

---`Method Private Instance`
_G['HRManagerUI'].SetTotalHireCost = function() end

---`Method Public Instance`
---@param hires (System.Collections.Generic.List*1Barotrauma*CharacterInfo)|(Barotrauma.CharacterInfo[])
---@param takeMoney? System.Boolean
---@param createNetworkEvent? System.Boolean
---@param createNotification? System.Boolean
---@return System.Boolean
_G['HRManagerUI'].ValidateHires = function(hires, takeMoney, createNetworkEvent, createNotification) end

---`Method Private Instance`
---@param button Barotrauma.GUIButton
---@param userData System.Object
---@return System.Boolean
_G['HRManagerUI'].CreateRenamingComponent = function(button, userData) end

---`Method Public Instance`
---@param characterInfo Barotrauma.CharacterInfo
---@param newName System.String
---@return System.Boolean
_G['HRManagerUI'].RenameCharacter = function(characterInfo, newName) end

---`Method Private Instance`
---@param button Barotrauma.GUIButton
---@param selection System.Object
---@return System.Boolean
_G['HRManagerUI'].FireCharacter = function(button, selection) end

---`Method Public Instance`
_G['HRManagerUI'].Update = function() end

---`Method Public Instance`
---@param characterInfos (System.Collections.Generic.List*1System*UInt16)|(System.UInt16[])
---@param characterInfoReserveBenchStatuses (System.Boolean-arr)|(System.Boolean[])
---@param location Barotrauma.Location
---@param checkCrewSizeLimit System.Boolean
_G['HRManagerUI'].SetPendingHires = function(characterInfos, characterInfoReserveBenchStatuses, location, checkCrewSizeLimit) end

---`Method Public Instance`
---@param updatePending? System.Boolean
---@param renameCharacter? System.ValueTuple*1Barotrauma*CharacterInfo*1System*String
---@param firedCharacter? Barotrauma.CharacterInfo
---@param validateHires? System.Boolean
_G['HRManagerUI'].SendCrewState = function(updatePending, renameCharacter, firedCharacter, validateHires) end

---`Constructor Public Instance`
---@param campaignUI Barotrauma.CampaignUI
---@param parentComponent Barotrauma.GUIComponent
---@return Barotrauma.HRManagerUI
_G['HRManagerUI'] = function(campaignUI, parentComponent) end

---`Constructor Public Instance`
---@param campaignUI Barotrauma.CampaignUI
---@param parentComponent Barotrauma.GUIComponent
---@return Barotrauma.HRManagerUI
_G['HRManagerUI'].__new = function(campaignUI, parentComponent) end

