global using Barotrauma;
global using HarmonyLib;
global using Microsoft.Xna.Framework;
using Barotrauma.Plugins;
using System.Runtime.CompilerServices;
using VCE_APS;
using VCE_SRW;
using VCE_VirtualizedMagazine;


[assembly: IgnoresAccessChecksTo("Barotrauma")]
[assembly: IgnoresAccessChecksTo("BarotraumaCore")]
[assembly: IgnoresAccessChecksTo("DedicatedServer")]

namespace VanillaComponentsExpanded;


public partial class VCEPlugin : IBarotraumaPlugin
{
    public static readonly IDebugConsole DebugConsole = PluginServiceProvider.GetService<IDebugConsole>();
    public static readonly ISimpleHookService HookService = PluginServiceProvider.GetService<ISimpleHookService>();
    public static readonly ISettingsService SettingsService = PluginServiceProvider.GetService<ISettingsService>();
    public static readonly IContentFileRegistrar ContentFileRegistrar = PluginServiceProvider.GetService<IContentFileRegistrar>();
    public static readonly IItemComponentRegistrar ItemComponentRegistrar = PluginServiceProvider.GetService<IItemComponentRegistrar>();

    private static Harmony harmony;

    private static readonly Type[] ictypes =
    {
        typeof(SwitchableRangedWeapon), typeof(BackpackFedWeapon), typeof(TrajectoryCalculator),
        typeof(VirtualizedMagazine), typeof(VirtualizedMagazineFactory), typeof(VirtualizedMagazineLoader), typeof(VirtualizedProjectile), typeof(VirtualizedAmmoStorage),
        typeof(ActiveProtectionSystem)
    };

    public void Init()
    {
        harmony = new("VCEPlugin");
        ContentFileRegistrar.RegisterContentFile<MagazinePrefabFile>();
        ItemComponentRegistrar.RegisterItemComponents(ictypes);
        InitProjectSpecific();
    }

    public partial void InitProjectSpecific();

    public void Dispose()
    {
        DisposePatchHooks();
    }

    public void OnContentLoaded()
    {
        InitPatchHooks();
        ProjectileShootDispatcher.Init();
    }

    private void InitPatchHooks()
    {
        harmony.PatchAll();
        HookService.RegisterHook<PluginRoundEndedDelegate>(APSHooks.OnRoundEnded);
    }

    private void DisposePatchHooks()
    {
        harmony.UnpatchSelf();
        HookService.DeregisterHook<PluginRoundEndedDelegate>(APSHooks.OnRoundEnded);
    }
}