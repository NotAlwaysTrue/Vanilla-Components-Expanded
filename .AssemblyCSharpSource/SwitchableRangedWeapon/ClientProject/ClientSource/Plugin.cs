using Barotrauma.LuaCs.Data;

namespace SRW
{
    public partial class SwitchableRangedWeaponPlugin : IAssemblyPlugin
    {
        public KeyOrMouse SwitchKey
        {
            get
            {
                return switchkey.Value;
            }
        }

        public KeyOrMouse FireModeSwitchKey
        {
            get
            {
                return firemodeswitchkey.Value;
            }
        }

        private ISettingControl switchkey;

        private ISettingControl firemodeswitchkey;
        // Client-specific code
        partial void Initializeclient()
        {
            ConfigService.TryGetConfig(Package, "SRW_ModeSwitchKey", out ISettingControl _control);
            switchkey = _control;
            ConfigService.TryGetConfig(Package, "SRW_FireModeSwitchKey", out ISettingControl _firemodecontrol);
            firemodeswitchkey = _firemodecontrol;
        }
    }
}
