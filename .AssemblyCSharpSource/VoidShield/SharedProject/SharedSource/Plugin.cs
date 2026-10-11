namespace VoidShield
{
    public partial class Plugin : IAssemblyPlugin
    {
        public IConfigService ConfigService { get; set; }
        public IPluginManagementService PluginService { get; set; }
        public ILoggerService LoggerService { get; set; }

        private Harmony harmony;

        public static Plugin Instance;

        [MethodImpl(MethodImplOptions.NoInlining)]
        public void Initialize()
        {
            Instance = this;
            harmony = new Harmony("VCE.VoidShield");
        }

        [MethodImpl(MethodImplOptions.NoInlining)]
        public void OnLoadCompleted()
        {
            foreach (Type type in Assembly.GetExecutingAssembly().GetTypes())
            {
                if (!type.GetCustomAttributes(typeof(HarmonyPatch), inherit: false).Any()) { continue; }
                try
                {
                    harmony.CreateClassProcessor(type).Patch();
                }
                catch
                {
                }
            }
        }

        [MethodImpl(MethodImplOptions.NoInlining)]
        public void PreInitPatching()
        {
        }

        [MethodImpl(MethodImplOptions.NoInlining)]
        public void Dispose()
        {
            harmony.UnpatchSelf();
        }
    }
}