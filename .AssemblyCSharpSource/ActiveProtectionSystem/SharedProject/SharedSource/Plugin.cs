using Barotrauma.LuaCs.Events;

namespace ActiveProtectionSystem
{
    public partial class ActiveProtectionSystemPlugin : IAssemblyPlugin
    {
        // These are automatically assigned by the plugin service after the Constructor is called
        public IConfigService ConfigService { get; set; }
        public IPluginManagementService PluginService { get; set; }
        public IEventService EventService { get; set; }
        public ILoggerService LoggerService { get; set; }

        private Harmony harmony;

        public void Initialize()
        {
            harmony = new Harmony("VCE.APS");
            harmony.PatchAll();

            EventService.Subscribe<IEventItemRemoved>(OnItemRemovedEvent.Instance);
        }

        public void OnLoadCompleted()
        {
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
