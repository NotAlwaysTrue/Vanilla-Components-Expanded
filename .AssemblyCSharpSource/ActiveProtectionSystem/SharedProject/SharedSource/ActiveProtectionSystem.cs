using Barotrauma.Items.Components;

namespace ActiveProtectionSystem
{
    public partial class ActiveProtectionSystem : Powered
    {
        public static Dictionary<Item, bool> Projectiles = [];

        private Explosion explosion;
        private bool isOn;
        private Dictionary<Item,bool> LastCheckedTargets = [];

        [Serialize(100f, IsPropertySaveable.Yes, alwaysUseInstanceValues: true)]
        public float Range { get; set; }

        [Serialize(1f, IsPropertySaveable.Yes, alwaysUseInstanceValues: true)]
        public float Probility { get; set; }

        [Serialize(50f, IsPropertySaveable.Yes, alwaysUseInstanceValues: true)]
        public float MaxSpeed { get; set; }

        [Serialize(10f, IsPropertySaveable.Yes, alwaysUseInstanceValues: true)]
        public float MinSpeed { get; set; }

        [Serialize(0f, IsPropertySaveable.Yes, alwaysUseInstanceValues: true)]
        public float MinMass { get; set; }

        [Serialize(10000f, IsPropertySaveable.Yes, alwaysUseInstanceValues: true)]
        public float MaxMass { get; set; }

        [Serialize(0f, IsPropertySaveable.Yes, alwaysUseInstanceValues: true)]
        public float ReduceConditionOnIntercept { get; set; }

        public Vector2 MinSize { get; set; }

        public Vector2 MaxSize { get; set; }

        [Serialize(false, IsPropertySaveable.Yes, alwaysUseInstanceValues: true)]
        public bool UseOnIntercept { get; set; }

        [Serialize(false, IsPropertySaveable.Yes, alwaysUseInstanceValues: true)]
        public bool RemoveOnIntercept { get; set; }

        [Serialize(false, IsPropertySaveable.Yes, alwaysUseInstanceValues: true)]
        public bool FunctionInInventory { get; set; }

        [Editable, Serialize(false, IsPropertySaveable.Yes, description: "Is the device currently on.", alwaysUseInstanceValues: true)]
        public bool IsOn
        {
            get { return isOn; }
            set
            {
                if (isOn == value && IsActive == value) { return; }
                IsActive = isOn = value;
            }
        }

        [Editable, Serialize(true, IsPropertySaveable.Yes, alwaysUseInstanceValues: true)]
        public bool InterceptOnlyApproaching { get; set; }

        [Editable, Serialize(false, IsPropertySaveable.Yes, alwaysUseInstanceValues: true)]
        public bool CreateExplosionsOnIntercept { get; set; }


        public ActiveProtectionSystem(Item item, ContentXElement element)
            : base(item, element)
        {
            MaxSpeed = element.GetAttributeFloat("maxspeed", 0);
            MinSpeed = element.GetAttributeFloat("minspeed", 100);
            MinSize = element.GetAttributeVector2("minsize", new Vector2(0, 0));
            MaxSize = element.GetAttributeVector2("maxsize", new Vector2(1000, 1000));
            MinMass = element.GetAttributeFloat("minmass", 0);
            MaxMass = element.GetAttributeFloat("maxmass", 100);
            Range = element.GetAttributeFloat("range", 100);
            ReduceConditionOnIntercept = element.GetAttributeFloat("reducedcondition", 0);
            Probility = element.GetAttributeFloat("probility", 1);
            UseOnIntercept = element.GetAttributeBool("useonintercept", false);
            RemoveOnIntercept = element.GetAttributeBool("removeonintercept", false);
            FunctionInInventory = element.GetAttributeBool("functionininventory", false);
            InterceptOnlyApproaching = element.GetAttributeBool("interceptonlyapproaching", true);
            CreateExplosionsOnIntercept = element.GetAttributeBool("createexplosiononintercept", false);

            foreach (var subElement in element.Elements())
            {
                switch (subElement.Name.ToString().ToLowerInvariant())
                {
                    case "explosion":
                        explosion = new Explosion(subElement, Item.ToString());
                        break;
                }
            }
        }

        public override void Update(float deltaTime, Camera cam)
        {
            base.Update(deltaTime, cam);
            if (LastCheckedTargets.Count > 10) { LastCheckedTargets.Clear(); }
            if (Item.Condition <= 0) { return; }
            if (!IsOn) { return; }
            if (!FunctionInInventory && Item.IsContained) { return; }
            foreach (Item target in Projectiles.ToDictionary().Keys)
            {
                if (LastCheckedTargets.TryGetValue(target, out bool __)) { continue; }
                if (target.Removed || target.IsContained) { continue; }
                if ((target.WorldPosition - Item.WorldPosition).Length() > Range) { continue; }
                float targetsize = target.body.GetSize().Length();
                if (targetsize < MinSize.Length() || targetsize > MaxSize.Length()) { continue; }
                if (target.Speed < MinSpeed || target.Speed > MaxSpeed) { continue; }
                if (target.body.Mass < MinMass || target.body.Mass > MaxMass) { continue; }
                if (!IsApproaching(target.WorldPosition, target.body.LinearVelocity, Item.WorldPosition, Item.body.LinearVelocity) && InterceptOnlyApproaching) { continue; }
                if (Submarine.CheckVisibility(item.SimPosition, target.SimPosition) != null) { continue; }

                LastCheckedTargets[target] = true;

                Item.Use(deltaTime);

                if (CreateExplosionsOnIntercept)
                {
                    explosion?.Explode(target.WorldPosition, Item);
                }

                if (Rand.GetRNG(Rand.RandSync.ServerAndClient).NextSingle() > Probility) { continue; }

                if (UseOnIntercept)
                {
                    target.Use(deltaTime);
                }

                if (RemoveOnIntercept)
                {
                    EntitySpawner.Spawner.AddItemToRemoveQueue(target);
                }

                target.Condition -= ReduceConditionOnIntercept;
            }
        }

        private bool IsApproaching(Vector2 posA, Vector2 velA, Vector2 posB, Vector2 velB)
        {
            Vector2 relPos = posB - posA;
            Vector2 relVel = velB - velA;

            return Vector2.Dot(relPos, relVel) < 0;
        }
    }
}