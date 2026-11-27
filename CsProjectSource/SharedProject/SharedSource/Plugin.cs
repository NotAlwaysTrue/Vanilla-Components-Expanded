global using Barotrauma;
global using HarmonyLib;
global using Microsoft.Xna.Framework;
using Barotrauma.Plugins;
using System.Runtime.CompilerServices;
using VCE_APS;
using VCE_ArmorSystem;
using VCE_SRW;
using VCE_VirtualizedMagazine;


[assembly: IgnoresAccessChecksTo("Barotrauma")]
[assembly: IgnoresAccessChecksTo("BarotraumaCore")]
[assembly: IgnoresAccessChecksTo("DedicatedServer")]

namespace VanillaComponentsExpanded;

internal enum VceNetworkHeader
{
    Trace = 0,
    Impact = 1,
    AirburstAimDistance = 2,
    GuidanceCursor = 3
}

public partial class VCEPlugin : IBarotraumaPlugin
{
    internal static readonly IGameNetwork Network = PluginServiceProvider.GetService<IGameNetwork>();
    public static readonly IDebugConsole DebugConsole = PluginServiceProvider.GetService<IDebugConsole>();
    public static readonly ISimpleHookService HookService = PluginServiceProvider.GetService<ISimpleHookService>();
    public static readonly ISettingsService SettingsService = PluginServiceProvider.GetService<ISettingsService>();
    public static readonly IContentFileRegistrar ContentFileRegistrar = PluginServiceProvider.GetService<IContentFileRegistrar>();
    public static readonly IItemComponentRegistrar ItemComponentRegistrar = PluginServiceProvider.GetService<IItemComponentRegistrar>();

    internal static BooleanSetting NightVisionAmbient { get; private set; } = null!;
    private static Harmony harmony;

    private static readonly Type[] ictypes =
    {
        typeof(SwitchableRangedWeapon), typeof(BackpackFedWeapon), typeof(TrajectoryCalculator),
        typeof(VirtualizedMagazine), typeof(VirtualizedMagazineFactory), typeof(VirtualizedMagazineLoader), typeof(VirtualizedProjectile), typeof(VirtualizedAmmoStorage),
        typeof(VCE_Airburst.AirburstProjectile), typeof(VCE_NightVision.NightVision),
        typeof(VCE_Guidance.GuidedProjectile), typeof(VCE_Guidance.GuidanceDataLink),
        typeof(VCE_Guidance.GuidanceThruster), typeof(VCE_Guidance.CentralFireControl),
        typeof(ActiveProtectionSystem), typeof(AmmoLoader)
    };

    public void Init()
    {
        harmony = new("VCEPlugin");
        ContentFileRegistrar.RegisterContentFile<MagazinePrefabFile>();
        ContentFileRegistrar.RegisterContentFile<ArmorPrefabFile>();
        ItemComponentRegistrar.RegisterItemComponents(ictypes);
        Network.RegisterNetworkHeaders<VceNetworkHeader>();
#if CLIENT
        VirtualShotNetwork.RegisterHandlers();
#else
        VCE_Airburst.AirburstNetwork.RegisterHandler();
        VCE_Guidance.GuidanceDataLink.RegisterHandler();
#endif
        var ambient = new BooleanSetting("vce.nightvision.ambient".ToIdentifier(), true, TextManager.Get("vce.nightvision.ambient"))
        {
            ShowInUI = true,
            SyncMode = SettingSyncMode.ServerAuthority
        };
        SettingsService.RegisterSetting(ambient);
        NightVisionAmbient = SettingsService.RetrieveSetting<BooleanSetting>(ambient.Identifier);
        InitProjectSpecific();
    }

    public partial void InitProjectSpecific();

    public void Dispose()
    {
        DisposePatchHooks();
        MagazinePresetLibrary.Dispose();
        MagazinePrefabFile.Dispose();
    }

    public void OnContentLoaded()
    {
        // Prefab tags must exist before any item instance is created: the sub-editor drag pre-check
        // (Inventory.CanBePutInSlot(ItemPrefab)) only reads Prefab.Tags.
        VirtualizedTags.ApplyPrefabTags();
        // Presets live in the save folder; read them once here, never from the UI.
        MagazinePresetLibrary.Load();
        InitPatchHooks();
        ProjectileShootDispatcher.Init();
    }

    private void InitPatchHooks()
    {
        harmony.PatchAll();
        HookService.RegisterHook<PluginRoundEndedDelegate>(APSHooks.OnRoundEnded);
#if CLIENT
        HookService.RegisterHook<PluginRoundEndedDelegate>(OwnerTraceHistory.Clear);
        HookService.RegisterHook<PluginRoundEndedDelegate>(VCE_NightVision.NightVisionRenderer.EndRound);
#endif
    }

    private void DisposePatchHooks()
    {
        harmony.UnpatchSelf();
        HookService.DeregisterHook<PluginRoundEndedDelegate>(APSHooks.OnRoundEnded);
#if CLIENT
        HookService.DeregisterHook<PluginRoundEndedDelegate>(OwnerTraceHistory.Clear);
        HookService.DeregisterHook<PluginRoundEndedDelegate>(VCE_NightVision.NightVisionRenderer.EndRound);
        VCE_NightVision.NightVisionRenderer.Reset();
#endif
    }
}
