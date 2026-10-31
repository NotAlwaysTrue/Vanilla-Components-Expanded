namespace VCE_VirtualizedMagazine
{
    public sealed class MagazinePrefabFile : GenericPrefabFile<MagazinePrefab>
    {
        public MagazinePrefabFile(ContentPackage contentPackage, ContentPath path) : base(contentPackage, path) { }

        public override bool MatchesSingular(Identifier identifier) => identifier == "magazineprefab";
        public override bool MatchesPlural(Identifier identifier) => identifier == "magazineprefabs";
        public override PrefabCollection<MagazinePrefab> Prefabs => MagazinePrefab.Prefabs;
        public override MagazinePrefab CreatePrefab(ContentXElement element)
        {
            return new MagazinePrefab(element, this);
        }
    }

    public class MagazinePrefab : Prefab
    {
        // :)
        static ILoggerService DebugConsole => VirtualizedMagazinePlugin.instance.LoggerService;

        public static PrefabCollection<MagazinePrefab> Prefabs = new();
        public string OriginalName { get; }
        public LocalizedString DisplayName { get; }
        public ContentXElement Element { get; }
        public bool IsOverride => Prefabs.IsOverride(this);

        public bool Disposed;

        public Identifier SuitableMagazineIdentifier
        {
            get;
        }

        public List<Identifier> AmmoData;


        // Note: Ammodata in prefabs should look exact the same as how it looks in a magazine
        //      Data                   Magazine
        //     ammo 1        <-        1st round
        //     ammo 2        <-        2nd round
        //     ammo 3        <-        3rd round
        // example didnt consider have multiple rounds in a single data but should be the same
        public MagazinePrefab(ContentXElement element, MagazinePrefabFile file) : base(file, element.GetAttributeIdentifier("identifier", "")) 
        {
            SuitableMagazineIdentifier = element.GetAttributeIdentifier("SuitableMagazine", Identifier.Empty);
            if (SuitableMagazineIdentifier.IsEmpty)
            {
                DebugConsole.LogWarning($"Warning: Empty Magazine identifier for MagazinePrefab {Identifier}");
                return;
            }

            AmmoData = [];

            foreach (var subElement in element.Elements())
            {
                switch(subElement.Name.ToString().ToLowerInvariant())
                {
                    case "ammogroup":
                        Identifier projectileid = subElement.GetAttributeIdentifier("ProjectileIdentifier", Identifier.Empty);
                        int amount = subElement.GetAttributeInt("Amount", 1);

                        if (projectileid.IsEmpty)
                        {
                            DebugConsole.LogWarning($"Warning: Empty Projectile identifier for MagazinePrefab {Identifier}");
                            continue;
                        }
                        for (int i = 0; i < amount; i++)
                        {
                            AmmoData.Insert(0, projectileid);
                        }
                        continue;
                }
            }

        }

        public override void Dispose() { }
    }
}