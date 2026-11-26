using Barotrauma.Plugins;

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
        public static void Dispose()
        {
            MagazinePrefab.Prefabs = null;
        }
    }

    public class MagazinePrefab : Prefab
    {
        // :)
        static IDebugConsole DebugConsole => VanillaComponentsExpanded.VCEPlugin.DebugConsole;

        public static PrefabCollection<MagazinePrefab> Prefabs = new();

        public static PrefabCollection<MagazinePrefab> CustomPrefabs = new();
        public string OriginalName { get; }
        public LocalizedString DisplayName { get; }
        public ContentXElement Element { get; }
        // Runtime presets are created without a content file, so there is nothing to override.
        public bool IsOverride => ContentFile != null && Prefabs.IsOverride(this);

        public bool Disposed;

        public List<Identifier> StartSection
        {
            get;
        } = [];

        public List<Identifier> MainSection
        {
            get;
        } = [];

        public List<Identifier> EndSection
        {
            get;
        } = [];

        public bool AutoRepeat
        {
            get;
        }


        // Note: Ammodata in prefabs should look exact the same as how it looks in a magazine
        //      Data                   Magazine
        //     ammo 1        <-        1st round
        //     ammo 2        <-        2nd round
        //     ammo 3        <-        3rd round
        // example didnt consider have multiple rounds in a single data but should be the same
        //
        // file may be null: save-folder presets are built from an in-memory element and have no content file.
        public MagazinePrefab(ContentXElement element, MagazinePrefabFile? file) : base(file!, element.GetAttributeIdentifier("identifier", "")) 
        {
            Element = element;
            DisplayName = element.GetAttributeString("name", Identifier.Value);
            AutoRepeat = element.GetAttributeBool("AutoRepeat", true);

            foreach (var subElement in element.Elements())
            {
                switch(subElement.Name.ToString().ToLowerInvariant())
                {
                    case "startammogroup":
                        foreach (var sub1 in subElement.Elements())
                        {
                            ParseAmmoData(sub1, StartSection);
                        }
                        continue;
                    case "mainammogroup":
                    case "ammogroup":
                        foreach (var sub1 in subElement.Elements())
                        {
                            ParseAmmoData(sub1, MainSection);
                        }
                        continue;
                    case "endammogroup":
                        foreach (var sub1 in subElement.Elements())
                        {
                            ParseAmmoData(sub1, EndSection);
                        }
                        continue;
                }
            }

        }

        /// <summary>Rounds declared across all three sections.</summary>
        public int TotalCount => StartSection.Count + MainSection.Count + EndSection.Count;

        public Identifier[] CreateAmmoArray(int capacity)
        {
            ArgumentOutOfRangeException.ThrowIfNegative(capacity);
            int takeEnd = Math.Min(EndSection.Count, capacity);
            int takeStart = Math.Min(StartSection.Count, capacity - takeEnd);
            int space = capacity - takeEnd - takeStart;
            var result = new List<Identifier>(capacity);
            result.AddRange(EndSection.Take(takeEnd));
            if (MainSection.Count > 0 && space > 0)
            {
                result.AddRange(AutoRepeat
                    ? Enumerable.Range(0, space).Select(i => MainSection[i % MainSection.Count])
                    : MainSection.Take(space));
            }
            result.AddRange(StartSection.Take(takeStart));
            return result.ToArray();
        }

        private void ParseAmmoData(ContentXElement element,List<Identifier> datalist)
        {
            Identifier projectileid = element.GetAttributeIdentifier("ProjectileIdentifier", Identifier.Empty);
            int amount = element.GetAttributeInt("Amount", 1);

            if (projectileid.IsEmpty)
            {
                DebugConsole.AddWarning($"Warning: Empty Projectile identifier for MagazinePrefab {Identifier}");
                return;
            }
            for (int i = 0; i < amount; i++)
            {
                datalist.Insert(0, projectileid);
            }
        }


        public override void Dispose() { }
    }
}
