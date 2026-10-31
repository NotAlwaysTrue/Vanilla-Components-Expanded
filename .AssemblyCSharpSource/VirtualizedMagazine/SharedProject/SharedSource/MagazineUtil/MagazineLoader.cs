using Barotrauma;
using Barotrauma.Items.Components;
using System.Collections.Generic;

namespace VCE_VirtualizedMagazine
{
    public class VirtualizedMagazineLoader : ItemComponent
    {
        [Serialize(1, IsPropertySaveable.Yes)]
        public int PushAmount
        {
            get; set;
        }

        public VirtualizedMagazineLoader(Item item, ContentXElement element) : base(item, element)
        {
            PushAmount = element.GetAttributeInt("DefaultLoadAmount", 1);
        }

        public override bool Use(float deltaTime, Character character = null)
        {
            base.Use(deltaTime, character);
            Item storageItem = Item.ownInventory.GetItemAt(0);
            Item magazineItem = Item.ownInventory.GetItemAt(1);

            if (storageItem.Condition <= 0) { return false; }

            VirtualizedAmmoStorage storageComp = storageItem.GetComponent<VirtualizedAmmoStorage>();
            VirtualizedMagazine magComp = magazineItem.GetComponent<VirtualizedMagazine>();
            if (storageComp == null || magComp == null) { return false; }

            LoadStatic(storageComp, magComp);

            return true;
        }

        public void LoadStatic(VirtualizedAmmoStorage storage, VirtualizedMagazine magazine)
        {
            List<Identifier> pushlist = new(Enumerable.Repeat(storage.AmmoIdentifier, PushAmount));
            magazine.LoadAmmoArray(ref pushlist);
            storage.Item.Condition -= PushAmount - pushlist.Count;
        }
    }
}