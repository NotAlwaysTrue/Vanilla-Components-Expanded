using Barotrauma;
using Barotrauma.Plugins;
using Microsoft.Xna.Framework.Input;

namespace VanillaComponentsExpanded;

public partial class VCEPlugin
{
    private static VCEKeySetting switchkeysetting;
    private static VCEKeySetting firemodekeysetting;
    private static IntSetting caculatorstep;
    public static KeyOrMouse SRW_SwitchKey => switchkeysetting.KeyValue;
    public static KeyOrMouse SRW_FireModeSwitchKey => firemodekeysetting.KeyValue;
    public static int SRW_CaculatorStepPerSecond => caculatorstep.Value;
    public partial void InitProjectSpecific()
    {
        SettingsService.RegisterSetting(new VCEKeySetting($"SRW_SwitchKey".ToIdentifier(), Keys.F.ToString(), label: TextManager.Get("SRW.SwitchKey").Fallback("SRW Switch Key"))
        {
            ShowInUI = true,
            SyncMode = SettingSyncMode.NoSync,
            ToolTip = TextManager.Get("SRW.SwitchKey.ToolTip").Fallback("The key used to switch between projectile/slots")
        });

        SettingsService.RegisterSetting(new VCEKeySetting($"SRW_FireModeSwitchKey".ToIdentifier(), Keys.B.ToString(), label: TextManager.Get("SRW.FireModeSwitchKey").Fallback("SRW FireMode Switch Key"))
        {
            ShowInUI = true,
            SyncMode = SettingSyncMode.NoSync,
            ToolTip = TextManager.Get("SRW.FireModeSwitchKey.ToolTip").Fallback("The key used to switch between firemodes")
        });

        SettingsService.RegisterSetting(new IntSetting($"SRW_CaculatorStepPerSecond".ToIdentifier(), 6, label: TextManager.Get("SRW.CaculatorStepPerSecond").Fallback("SRW Trajectory Caculator Step PerSecond"))
        {
            ShowInUI = true,
            SyncMode = SettingSyncMode.NoSync,
            ToolTip = TextManager.Get("SRW.CaculatorStepPerSecond.ToolTip").Fallback("How many steps will the caculator run every second"),
            Range = (1, 60),
        });

        switchkeysetting = SettingsService.RetrieveSetting<VCEKeySetting>($"SRW_SwitchKey".ToIdentifier());
        firemodekeysetting = SettingsService.RetrieveSetting<VCEKeySetting>($"SRW_FireModeSwitchKey".ToIdentifier());
    }
}