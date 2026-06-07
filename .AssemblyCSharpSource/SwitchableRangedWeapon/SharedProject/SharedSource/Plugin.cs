namespace SRW
{
    public partial class SwitchableRangedWeaponPlugin : IAssemblyPlugin
    {
        // These are automatically assigned by the plugin service after the Constructor is called
        public IConfigService ConfigService { get; set; }
        public IPluginManagementService PluginService { get; set; }
        public ILoggerService LoggerService { get; set; }
        public IPluginManagementService LuaCsPluginService { get; set; }

        public ContentPackage Package { get; private set; }

        public static SwitchableRangedWeaponPlugin Instance { get; private set; }

        partial void Initializeclient();

        public void Initialize()
        {
            LuaCsPluginService.TryGetPackageForPlugin<SwitchableRangedWeaponPlugin>(out ContentPackage _result);
            Package = _result;
            Initializeclient();
            Instance = this;
        }

        public void OnLoadCompleted()
        {
            // After all plugins have loaded
            // Put code that interacts with other plugins here.
        }

        public void PreInitPatching()
        {
            //Called right after the constructor
        }

        public void Dispose()
        {
            // Cleanup your plugin!
        }
    }
}
