---@meta
---@class Barotrauma.CargoManager : System.Object
---`Field Private Instance`
---@field campaign Barotrauma.CampaignMode
---`Field Public Instance`
---@field OnItemsInBuyCrateChanged Barotrauma.NamedEvent*1Barotrauma*CargoManager
---`Field Public Instance`
---@field OnItemsInSellCrateChanged Barotrauma.NamedEvent*1Barotrauma*CargoManager
---`Field Public Instance`
---@field OnItemsInSellFromSubCrateChanged Barotrauma.NamedEvent*1Barotrauma*CargoManager
---`Field Public Instance`
---@field OnPurchasedItemsChanged Barotrauma.NamedEvent*1Barotrauma*CargoManager
---`Field Public Instance`
---@field OnSoldItemsChanged Barotrauma.NamedEvent*1Barotrauma*CargoManager
---`Field Private Instance`
---@field purchasedIDCards (System.Collections.Generic.List*1System*ValueTuple*2Barotrauma*PurchasedItem*2Barotrauma*Items*Components*IdCard)|(System.ValueTuple*1Barotrauma*PurchasedItem*1Barotrauma*Items*Components*IdCard[])
---`Field Private Static`
---@field equipmentSlots (System.Collections.Generic.HashSet*1Barotrauma*InvSlotType)|(Barotrauma.InvSlotType[])
---`Field Public Static`
---@field MaxQuantity System.Int32
---`Getter Private Instance`
---@field SoldEntities (System.Collections.Generic.List*1Barotrauma*CargoManager*SoldEntity)|(Barotrauma.CargoManager.SoldEntity[])
---`Getter Public Instance`
---@field ItemsInBuyCrate (System.Collections.Generic.Dictionary*1Barotrauma*Identifier*1System*Collections*Generic*List*2Barotrauma*PurchasedItem)|({[Barotrauma.Identifier]:((System.Collections.Generic.List*1Barotrauma*PurchasedItem)|(Barotrauma.PurchasedItem[]))})
---`Getter Public Instance`
---@field ItemsInSellCrate (System.Collections.Generic.Dictionary*1Barotrauma*Identifier*1System*Collections*Generic*List*2Barotrauma*PurchasedItem)|({[Barotrauma.Identifier]:((System.Collections.Generic.List*1Barotrauma*PurchasedItem)|(Barotrauma.PurchasedItem[]))})
---`Getter Public Instance`
---@field ItemsInSellFromSubCrate (System.Collections.Generic.Dictionary*1Barotrauma*Identifier*1System*Collections*Generic*List*2Barotrauma*PurchasedItem)|({[Barotrauma.Identifier]:((System.Collections.Generic.List*1Barotrauma*PurchasedItem)|(Barotrauma.PurchasedItem[]))})
---`Getter Public Instance`
---@field PurchasedItems (System.Collections.Generic.Dictionary*1Barotrauma*Identifier*1System*Collections*Generic*List*2Barotrauma*PurchasedItem)|({[Barotrauma.Identifier]:((System.Collections.Generic.List*1Barotrauma*PurchasedItem)|(Barotrauma.PurchasedItem[]))})
---`Getter Public Instance`
---@field SoldItems (System.Collections.Generic.Dictionary*1Barotrauma*Identifier*1System*Collections*Generic*List*2Barotrauma*SoldItem)|({[Barotrauma.Identifier]:((System.Collections.Generic.List*1Barotrauma*SoldItem)|(Barotrauma.SoldItem[]))})
---`Getter Private Instance`
---@field Location Barotrauma.Location
---`Getter Private Instance`
---@field UndeterminedSoldEntities (System.Collections.Generic.Dictionary*1Barotrauma*ItemPrefab*1System*Int32)|({[Barotrauma.ItemPrefab]:(System.Int32)})
_G['CargoManager'] = {}

---`Method Public Instance`
---@param character Barotrauma.Character
---@return (System.Collections.Generic.IEnumerable*1Barotrauma*Item)|(fun():(Barotrauma.Item))
_G['CargoManager'].GetSellableItems = function(character) end

---`Method Private Instance`
---@return (System.Collections.Generic.IEnumerable*1Barotrauma*CargoManager*SoldEntity)|(fun():(Barotrauma.CargoManager.SoldEntity))
_G['CargoManager'].GetConfirmedSoldEntities = function() end

---`Method Public Instance`
---@param items (System.Collections.Generic.Dictionary*1Barotrauma*Identifier*1System*Collections*Generic*List*2Barotrauma*PurchasedItem)|({[Barotrauma.Identifier]:((System.Collections.Generic.List*1Barotrauma*PurchasedItem)|(Barotrauma.PurchasedItem[]))})
_G['CargoManager'].SetItemsInBuyCrate = function(items) end

---`Method Public Instance`
---@param items (System.Collections.Generic.Dictionary*1Barotrauma*Identifier*1System*Collections*Generic*List*2Barotrauma*PurchasedItem)|({[Barotrauma.Identifier]:((System.Collections.Generic.List*1Barotrauma*PurchasedItem)|(Barotrauma.PurchasedItem[]))})
_G['CargoManager'].SetItemsInSubSellCrate = function(items) end

---`Method Public Instance`
---@param items (System.Collections.Generic.Dictionary*1Barotrauma*Identifier*1System*Collections*Generic*List*2Barotrauma*SoldItem)|({[Barotrauma.Identifier]:((System.Collections.Generic.List*1Barotrauma*SoldItem)|(Barotrauma.SoldItem[]))})
_G['CargoManager'].SetSoldItems = function(items) end

---`Method Public Instance`
---@param storeIdentifier Barotrauma.Identifier
---@param itemPrefab Barotrauma.ItemPrefab
---@param changeInQuantity System.Int32
_G['CargoManager'].ModifyItemQuantityInSellCrate = function(storeIdentifier, itemPrefab, changeInQuantity) end

---`Method Public Instance`
---@param storeIdentifier Barotrauma.Identifier
---@param itemsToSell (System.Collections.Generic.List*1Barotrauma*PurchasedItem)|(Barotrauma.PurchasedItem[])
---@param sellingMode Barotrauma.Store.StoreTab
_G['CargoManager'].SellItems = function(storeIdentifier, itemsToSell, sellingMode) end

---`Method Public Instance`
_G['CargoManager'].ClearSoldItemsProjSpecific = function() end

---`Method Public Static`
---@param prefab Barotrauma.ItemPrefab
---@return System.Boolean
_G['CargoManager'].HasUnlockedStoreItem = function(prefab) end

---`Method Private Instance`
---@param identifier Barotrauma.Identifier
---@param items (System.Collections.Generic.Dictionary*1Barotrauma*Identifier*1System*Collections*Generic*List*2Barotrauma*CargoManager*T)|({[Barotrauma.Identifier]:((System.Collections.Generic.List*1Barotrauma*CargoManager*T)|(Barotrauma.CargoManager.T[]))})
---@param create? System.Boolean
---@return (System.Collections.Generic.List*1Barotrauma*CargoManager*T)|(Barotrauma.CargoManager.T[])
_G['CargoManager'].GetItems = function(identifier, items, create) end

---`Method Public Instance`
---@overload fun(identifier:Barotrauma.Identifier, create?:System.Boolean):((System.Collections.Generic.List*1Barotrauma*PurchasedItem)|(Barotrauma.PurchasedItem[]))
---@param store Barotrauma.Location.StoreInfo
---@param create? System.Boolean
---@return (System.Collections.Generic.List*1Barotrauma*PurchasedItem)|(Barotrauma.PurchasedItem[])
_G['CargoManager'].GetBuyCrateItems = function(store, create) end

---`Method Public Instance`
---@overload fun(identifier:Barotrauma.Identifier, prefab:Barotrauma.ItemPrefab):(Barotrauma.PurchasedItem)
---@param store Barotrauma.Location.StoreInfo
---@param prefab Barotrauma.ItemPrefab
---@return Barotrauma.PurchasedItem
_G['CargoManager'].GetBuyCrateItem = function(store, prefab) end

---`Method Public Instance`
---@overload fun(identifier:Barotrauma.Identifier, create?:System.Boolean):((System.Collections.Generic.List*1Barotrauma*PurchasedItem)|(Barotrauma.PurchasedItem[]))
---@param store Barotrauma.Location.StoreInfo
---@param create? System.Boolean
---@return (System.Collections.Generic.List*1Barotrauma*PurchasedItem)|(Barotrauma.PurchasedItem[])
_G['CargoManager'].GetSellCrateItems = function(store, create) end

---`Method Public Instance`
---@overload fun(identifier:Barotrauma.Identifier, prefab:Barotrauma.ItemPrefab):(Barotrauma.PurchasedItem)
---@param store Barotrauma.Location.StoreInfo
---@param prefab Barotrauma.ItemPrefab
---@return Barotrauma.PurchasedItem
_G['CargoManager'].GetSellCrateItem = function(store, prefab) end

---`Method Public Instance`
---@overload fun(identifier:Barotrauma.Identifier, create?:System.Boolean):((System.Collections.Generic.List*1Barotrauma*PurchasedItem)|(Barotrauma.PurchasedItem[]))
---@param store Barotrauma.Location.StoreInfo
---@param create? System.Boolean
---@return (System.Collections.Generic.List*1Barotrauma*PurchasedItem)|(Barotrauma.PurchasedItem[])
_G['CargoManager'].GetSubCrateItems = function(store, create) end

---`Method Public Instance`
---@overload fun(identifier:Barotrauma.Identifier, prefab:Barotrauma.ItemPrefab):(Barotrauma.PurchasedItem)
---@param store Barotrauma.Location.StoreInfo
---@param prefab Barotrauma.ItemPrefab
---@return Barotrauma.PurchasedItem
_G['CargoManager'].GetSubCrateItem = function(store, prefab) end

---`Method Public Instance`
---@overload fun(identifier:Barotrauma.Identifier, create?:System.Boolean):((System.Collections.Generic.List*1Barotrauma*PurchasedItem)|(Barotrauma.PurchasedItem[]))
---@param store Barotrauma.Location.StoreInfo
---@param create? System.Boolean
---@return (System.Collections.Generic.List*1Barotrauma*PurchasedItem)|(Barotrauma.PurchasedItem[])
_G['CargoManager'].GetPurchasedItems = function(store, create) end

---`Method Public Instance`
---@overload fun(store:Barotrauma.Location.StoreInfo, prefab:Barotrauma.ItemPrefab):(System.Int32)
---@param identifier Barotrauma.Identifier
---@param prefab Barotrauma.ItemPrefab
---@return System.Int32
_G['CargoManager'].GetPurchasedItemCount = function(identifier, prefab) end

---`Method Public Instance`
---@overload fun(identifier:Barotrauma.Identifier, create?:System.Boolean):((System.Collections.Generic.List*1Barotrauma*SoldItem)|(Barotrauma.SoldItem[]))
---@param store Barotrauma.Location.StoreInfo
---@param create? System.Boolean
---@return (System.Collections.Generic.List*1Barotrauma*SoldItem)|(Barotrauma.SoldItem[])
_G['CargoManager'].GetSoldItems = function(store, create) end

---`Method Public Instance`
_G['CargoManager'].ClearItemsInBuyCrate = function() end

---`Method Public Instance`
_G['CargoManager'].ClearItemsInSellCrate = function() end

---`Method Public Instance`
_G['CargoManager'].ClearItemsInSellFromSubCrate = function() end

---`Method Public Instance`
---@param purchasedItems (System.Collections.Generic.Dictionary*1Barotrauma*Identifier*1System*Collections*Generic*List*2Barotrauma*PurchasedItem)|({[Barotrauma.Identifier]:((System.Collections.Generic.List*1Barotrauma*PurchasedItem)|(Barotrauma.PurchasedItem[]))})
_G['CargoManager'].SetPurchasedItems = function(purchasedItems) end

---`Method Public Instance`
---@param storeIdentifier Barotrauma.Identifier
---@param itemPrefab Barotrauma.ItemPrefab
---@param changeInQuantity System.Int32
---@param client? Barotrauma.Networking.Client
_G['CargoManager'].ModifyItemQuantityInBuyCrate = function(storeIdentifier, itemPrefab, changeInQuantity, client) end

---`Method Public Instance`
---@param storeIdentifier Barotrauma.Identifier
---@param itemPrefab Barotrauma.ItemPrefab
---@param changeInQuantity System.Int32
---@param client? Barotrauma.Networking.Client
_G['CargoManager'].ModifyItemQuantityInSubSellCrate = function(storeIdentifier, itemPrefab, changeInQuantity, client) end

---`Method Public Instance`
---@param storeIdentifier Barotrauma.Identifier
---@param itemsToPurchase (System.Collections.Generic.List*1Barotrauma*PurchasedItem)|(Barotrauma.PurchasedItem[])
---@param removeFromCrate System.Boolean
---@param client? Barotrauma.Networking.Client
_G['CargoManager'].PurchaseItems = function(storeIdentifier, itemsToPurchase, removeFromCrate, client) end

---`Method Public Instance`
---@param storeIdentifier Barotrauma.Identifier
---@param items (System.Collections.Generic.IEnumerable*1Barotrauma*ItemPrefab)|(fun():(Barotrauma.ItemPrefab))
---@return (System.Collections.Generic.Dictionary*1Barotrauma*ItemPrefab*1System*Int32)|({[Barotrauma.ItemPrefab]:(System.Int32)})
_G['CargoManager'].GetBuyValuesAtCurrentLocation = function(storeIdentifier, items) end

---`Method Public Instance`
---@param storeIdentifier Barotrauma.Identifier
---@param items (System.Collections.Generic.IEnumerable*1Barotrauma*ItemPrefab)|(fun():(Barotrauma.ItemPrefab))
---@return (System.Collections.Generic.Dictionary*1Barotrauma*ItemPrefab*1System*Int32)|({[Barotrauma.ItemPrefab]:(System.Int32)})
_G['CargoManager'].GetSellValuesAtCurrentLocation = function(storeIdentifier, items) end

---`Method Public Instance`
_G['CargoManager'].CreatePurchasedItems = function() end

---`Method Public Instance`
---@return (System.Collections.Generic.IEnumerable*1Barotrauma*Item)|(fun():(Barotrauma.Item))
_G['CargoManager'].GetSellableItemsFromSub = function() end

---`Method Public Static`
---@param character Barotrauma.Character
---@return (System.Collections.Generic.IReadOnlyCollection*1Barotrauma*Item)|(fun():(Barotrauma.Item))
_G['CargoManager'].FindAllItemsOnPlayerAndSub = function(character) end

---`Method Public Static`
---@return (System.Collections.Generic.IEnumerable*1Barotrauma*Item)|(fun():(Barotrauma.Item))
_G['CargoManager'].FindAllSellableItems = function() end

---`Method Private Instance`
---@param item Barotrauma.Item
---@param confirmedItems (System.Collections.Generic.IEnumerable*1Barotrauma*CargoManager*SoldEntity)|(fun():(Barotrauma.CargoManager.SoldEntity))
---@return System.Boolean
_G['CargoManager'].IsItemSellable = function(item, confirmedItems) end

---`Method Public Static`
---@overload fun(subs:(System.Collections.Generic.IEnumerable*1Barotrauma*Submarine)|(fun():(Barotrauma.Submarine))):((System.Collections.Generic.IEnumerable*1Barotrauma*Hull)|(fun():(Barotrauma.Hull)))
---@param sub Barotrauma.Submarine
---@return (System.Collections.Generic.IEnumerable*1Barotrauma*Hull)|(fun():(Barotrauma.Hull))
_G['CargoManager'].FindCargoRooms = function(sub) end

---`Method Public Static`
---@param items (System.Collections.Generic.IEnumerable*1Barotrauma*Item)|(fun():(Barotrauma.Item))
---@param conditional? (System.Func*1Barotrauma*Item*1System*Boolean)|(fun(arg:Barotrauma.Item):(System.Boolean))
---@return (System.Collections.Generic.IEnumerable*1Barotrauma*Item)|(fun():(Barotrauma.Item))
_G['CargoManager'].FilterCargoCrates = function(items, conditional) end

---`Method Public Static`
---@param subs (System.Collections.Generic.IEnumerable*1Barotrauma*Submarine)|(fun():(Barotrauma.Submarine))
---@param cargoRooms? (System.Collections.Generic.IEnumerable*1Barotrauma*Hull)|(fun():(Barotrauma.Hull))
---@return (System.Collections.Generic.IEnumerable*1Barotrauma*Items*Components*ItemContainer)|(fun():(Barotrauma.Items.Components.ItemContainer))
_G['CargoManager'].FindReusableCargoContainers = function(subs, cargoRooms) end

---`Method Public Static`
---@param item Barotrauma.ItemPrefab
---@param cargoRoomOrSpawnPoint Barotrauma.ISpatialEntity
---@param availableContainers System.Collections.Generic.List
---@return Barotrauma.Items.Components.ItemContainer
_G['CargoManager'].GetOrCreateCargoContainerFor = function(item, cargoRoomOrSpawnPoint, availableContainers) end

---`Method Public Static`
---@param itemsToSpawn (System.Collections.Generic.IEnumerable*1Barotrauma*PurchasedItem)|(fun():(Barotrauma.PurchasedItem))
---@param sub Barotrauma.Submarine
---@param cargoManager Barotrauma.CargoManager
---@param showNotification? System.Boolean
_G['CargoManager'].DeliverItemsToSub = function(itemsToSpawn, sub, cargoManager, showNotification) end

---`Method Public Static`
---@param itemsToSpawn (System.Collections.Generic.IEnumerable*1Barotrauma*PurchasedItem)|(fun():(Barotrauma.PurchasedItem))
---@param character Barotrauma.Character
---@param cargoManager Barotrauma.CargoManager
_G['CargoManager'].DeliverItemsToCharacter = function(itemsToSpawn, character, cargoManager) end

---`Method Private Static`
---@param purchased Barotrauma.PurchasedItem
---@param item Barotrauma.Item
---@param cargoManager Barotrauma.CargoManager
_G['CargoManager'].ItemSpawned = function(purchased, item, cargoManager) end

---`Method Public Static`
---@param item Barotrauma.Item
_G['CargoManager'].ItemSpawned = function(item) end

---`Method Public Instance`
_G['CargoManager'].InitPurchasedIDCards = function() end

---`Method Private Static`
---@param purchased Barotrauma.PurchasedItem
---@param idCard Barotrauma.Items.Components.IdCard
_G['CargoManager'].InitPurchasedIDCard = function(purchased, idCard) end

---`Method Public Static`
---@param hull Barotrauma.Hull
---@param itemPrefab Barotrauma.ItemPrefab
---@return Microsoft.Xna.Framework.Vector2
_G['CargoManager'].GetCargoPos = function(hull, itemPrefab) end

---`Method Public Instance`
---@param parentElement System.Xml.Linq.XElement
_G['CargoManager'].SavePurchasedItems = function(parentElement) end

---`Method Public Instance`
---@param element System.Xml.Linq.XElement
_G['CargoManager'].LoadPurchasedItems = function(element) end

---`Constructor Public Instance`
---@overload fun(campaign:Barotrauma.CampaignMode):Barotrauma.CargoManager
---@return Barotrauma.CargoManager
_G['CargoManager'] = function() end

---`Constructor Public Instance`
---@overload fun(campaign:Barotrauma.CampaignMode):Barotrauma.CargoManager
---@return Barotrauma.CargoManager
_G['CargoManager'].__new = function() end

---`Constructor Private Static`
---@overload fun(campaign:Barotrauma.CampaignMode):Barotrauma.CargoManager
---@return Barotrauma.CargoManager
_G['CargoManager'] = function() end

---`Constructor Private Static`
---@overload fun(campaign:Barotrauma.CampaignMode):Barotrauma.CargoManager
---@return Barotrauma.CargoManager
_G['CargoManager'].__new = function() end

