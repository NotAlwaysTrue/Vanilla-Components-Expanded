namespace VCE_LuaComponent
{
    public partial class LuaComponentPlugin : IAssemblyPlugin
    {
        // These are automatically assigned by the plugin service after the Constructor is called
        public IConfigService ConfigService { get; set; }
        public IPluginManagementService PluginService { get; set; }
        public ILoggerService LoggerService { get; set; }
        public ISafeLuaUserDataService SafeLuaUserDataService { get; set; }

        public ILuaScriptLoader ScriptLoader { get; set; }

        public static LuaComponentPlugin _instance;

        public void Initialize() 
        {
            _instance = this;
        }

        public void OnLoadCompleted() { }

        public void PreInitPatching() { }

        public void Dispose() { }
    }
}
