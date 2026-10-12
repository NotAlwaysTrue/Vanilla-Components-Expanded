using Barotrauma.LuaCs.Data;

namespace SRW
{
    public partial class SwitchableRangedWeaponPlugin : IAssemblyPlugin
    {
        public KeyOrMouse SwitchKey
        {
            get => switchkey.Value;
        }

        public KeyOrMouse FireModeSwitchKey
        {
            get => firemodeswitchkey.Value;
        }

        public float CaculatorStepPerSecond
        {
            get => steppersec.Value;
        }

        private ISettingControl switchkey;

        private ISettingControl firemodeswitchkey;

        private ISettingRangeBase<int> steppersec;

        // Client-specific code
        partial void Initializeclient()
        {
            ConfigService.TryGetConfig(Package, "SRW_ModeSwitchKey", out ISettingControl _control);
            switchkey = _control;
            ConfigService.TryGetConfig(Package, "SRW_FireModeSwitchKey", out ISettingControl _firemodecontrol);
            firemodeswitchkey = _firemodecontrol;
            ConfigService.TryGetConfig(Package, "SRW_CaculatorStepPerSecond", out ISettingRangeBase<int> _steppersec);
            steppersec = _steppersec;
        }
    }
}
