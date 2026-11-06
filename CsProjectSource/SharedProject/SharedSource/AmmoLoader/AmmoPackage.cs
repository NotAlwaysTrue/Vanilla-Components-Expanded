using Barotrauma.Items.Components;

namespace VCE.AmmoLoading;

public sealed class AmmoPackage : ItemComponent
{
    [Serialize("", IsPropertySaveable.No)]
    public Identifier ProjectileIdentifier { get; set; }

    [Serialize(1, IsPropertySaveable.No)]
    public int Amount { get; set; }

    // Saves together with the stock even while entity removal is still queued.
    [Serialize(false, IsPropertySaveable.Yes, alwaysUseInstanceValues: true)]
    public bool Redeemed { get; set; }

    public AmmoPackage(Item item, ContentXElement element) : base(item, element) { }
}
