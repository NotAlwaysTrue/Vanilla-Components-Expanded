using Microsoft.Xna.Framework.Content;
using System.Xml.Linq;

namespace VCE_VirtualizedMagazine
{
    public partial class VirtualizedMagazinePlugin : IAssemblyPlugin
    {
        private string ContentRaw = "<MagazinePrefabs file=\"%ModDir%/XML/MagazinePrefabs.xml\" />";

        // These are automatically assigned by the plugin service after the Constructor is called
        public IConfigService ConfigService { get; set; }
        public IPluginManagementService PluginService { get; set; }
        public ILoggerService LoggerService { get; set; }

        public static VirtualizedMagazinePlugin instance;

        public Harmony harmony;
        
        public void Initialize()
        {
            instance = this;
            harmony = new("VCE_VirtualizedMagazine");

#warning workaround fix to Prefab, subject to remove after mega update landed
            PluginService.TryGetPackageForPlugin<VirtualizedMagazinePlugin>(out var pkg);
            var path = ContentPath.FromRaw(pkg.Dir + "/XML/MagazinePrefabs.xml");
            ContentFile file = new MagazinePrefabFile(pkg, path);
            file.LoadFile();
        }

        public void OnLoadCompleted()
        {
            ProjectileShootDispatcher.Init();
            harmony.PatchAll(typeof(Plugin).Assembly);
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
