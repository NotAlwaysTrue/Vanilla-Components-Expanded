namespace VCE_VirtualizedMagazine
{
    public partial class Plugin : IAssemblyPlugin
    {
        // These are automatically assigned by the plugin service after the Constructor is called
        public IConfigService ConfigService { get; set; }
        public IPluginManagementService PluginService { get; set; }
        public ILoggerService LoggerService { get; set; }

        public Harmony harmony;
        
        public void Initialize()
        {
            harmony = new("VCE_VirtualizedMagazine");
        }

        public void OnLoadCompleted()
        {
            ProjectileShootDispatcher.Init();
            harmony.PatchAll();
        }

        public void PreInitPatching()
        {

        }

        public void Dispose()
        {
            harmony.UnpatchSelf();
        }
    }
}
