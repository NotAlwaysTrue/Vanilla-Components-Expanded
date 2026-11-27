using Barotrauma.Items.Components;

namespace VCE_NightVision;

public enum ThermalDisplay { Off, FusedOutline, Mask, Edge }

public sealed partial class NightVision : ItemComponent
{
    [Serialize(2.5f, IsPropertySaveable.No)] public float Gain { get; set; }
    [Serialize(0.04f, IsPropertySaveable.No)] public float Lift { get; set; }
    [Serialize(0.85f, IsPropertySaveable.No)] public float Gamma { get; set; }
    [Serialize("64,255,90,255", IsPropertySaveable.No)] public Color Tint { get; set; }
    [Serialize(0.04f, IsPropertySaveable.No)] public float Noise { get; set; }
    [Serialize(0.04f, IsPropertySaveable.No)] public float Scanline { get; set; }
    [Serialize(0.22f, IsPropertySaveable.No)] public float Vignette { get; set; }
    [Serialize(0f, IsPropertySaveable.No)] public float Lens { get; set; }
    [Serialize(0.25f, IsPropertySaveable.No)] public float AmbientBoost { get; set; }
    [Serialize(0.2f, IsPropertySaveable.No)] public float FadeTime { get; set; }
    [Serialize(0f, IsPropertySaveable.No)] public float Bloom { get; set; }
    [Serialize(false, IsPropertySaveable.No)] public bool WhiteHot { get; set; }
    [Serialize(false, IsPropertySaveable.No)] public bool RequiresPower { get; set; }
    [Serialize("", IsPropertySaveable.No)] public string ToggleKey { get; set; } = "";
    [Serialize(ThermalDisplay.Off, IsPropertySaveable.No)] public ThermalDisplay ThermalMode { get; set; }
    [Serialize(20000f, IsPropertySaveable.No)] public float ThermalRange { get; set; }
    [Serialize("255,255,255,220", IsPropertySaveable.No)] public Color ThermalLineColor { get; set; }
    [Serialize(1f, IsPropertySaveable.No)] public float ThermalStrength { get; set; }
    [Serialize(1f, IsPropertySaveable.No)] public float ThermalBlend { get; set; }
    [Serialize(6f, IsPropertySaveable.No)] public float ThermalUpdateHz { get; set; }
    [Serialize(16, IsPropertySaveable.No)] public int MaxThermalTargets { get; set; }
    [Serialize(false, IsPropertySaveable.No)] public bool ShowDead { get; set; }

    public NightVision(Item item, ContentXElement element) : base(item, element) { }
}
