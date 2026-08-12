using Barotrauma.Items.Components;

namespace ActiveProtectionSystem
{
    public partial class ActiveProtectionSystem : Powered
    {
        public static Dictionary<Item, bool> Projectiles = [];

        private Explosion explosion;
        private float maxspeed;
        private float minspeed;
        private Vector2 minsize;
        private Vector2 maxsize;
        private float minmass;
        private float maxmass;
        private float range;
        private float probility;
        private bool useonintercept;
        private bool removeonintercept;
        private bool functionininventory;
        private bool interceptonlyapproaching;
        private bool createexplosiononintercept;
        private bool isOn;
        private Dictionary<Item,bool> LastCheckedTargets = [];

        [Serialize(100f, IsPropertySaveable.Yes, alwaysUseInstanceValues: true)]
        public float Range
        {
            get { return range; }
            set { range = value; }

        }

        [Serialize(1f, IsPropertySaveable.Yes, alwaysUseInstanceValues: true)]
        public float Probility
        {
            get { return probility; }
            set { probility = value; }

        }

        [Serialize(50f, IsPropertySaveable.Yes, alwaysUseInstanceValues: true)]
        public float MaxSpeed
        {
            get { return maxspeed; }
            set { maxspeed = value; }
        }

        [Serialize(10f, IsPropertySaveable.Yes, alwaysUseInstanceValues: true)]
        public float MinSpeed
        {
            get { return minspeed; }
            set { minspeed = value; }
        }

        [Serialize(0f, IsPropertySaveable.Yes, alwaysUseInstanceValues: true)]
        public float MinMass
        {
            get { return minmass; }
            set { minmass = value; }
        }

        [Serialize(10000f, IsPropertySaveable.Yes, alwaysUseInstanceValues: true)]
        public float MaxMass
        {
            get { return maxmass; }
            set { maxmass = value; }
        }

        public Vector2 MinSize
        {
            get { return minsize; }
            set { minsize = value; }
        }

        public Vector2 MaxSize
        {
            get { return maxsize; }
            set { maxsize = value; }
        }

        [Serialize(false, IsPropertySaveable.Yes, alwaysUseInstanceValues: true)]
        public bool UseOnIntercept
        {
            get { return useonintercept; }
            set { useonintercept = value; }
        }

        [Serialize(false, IsPropertySaveable.Yes, alwaysUseInstanceValues: true)]
        public bool RemoveOnIntercept
        {
            get { return removeonintercept; }
            set { removeonintercept = value; }
        }

        [Serialize(false, IsPropertySaveable.Yes, alwaysUseInstanceValues: true)]
        public bool FunctionInInventory
        {
            get { return removeonintercept; }
            set { removeonintercept = value; }
        }

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
        public bool InterceptOnlyApproaching
        {
            get { return interceptonlyapproaching; }
            set { interceptonlyapproaching = value; }
        }

        [Editable, Serialize(false, IsPropertySaveable.Yes, alwaysUseInstanceValues: true)]
        public bool CreateExplosionsOnIntercept
        {
            get { return createexplosiononintercept; }
            set { createexplosiononintercept = value; }
        }


        public ActiveProtectionSystem(Item item, ContentXElement element)
            : base(item, element)
        {
            maxspeed = element.GetAttributeFloat("maxspeed", 0);
            minspeed = element.GetAttributeFloat("minspeed", 100);
            minsize = element.GetAttributeVector2("minsize", new Vector2(0, 0));
            maxsize = element.GetAttributeVector2("maxsize", new Vector2(1000, 1000));
            minmass = element.GetAttributeFloat("minmass", 0);
            maxmass = element.GetAttributeFloat("maxmass", 100);
            range = element.GetAttributeFloat("range", 100);
            probility = element.GetAttributeFloat("probility", 1);
            useonintercept = element.GetAttributeBool("useonintercept", false);
            removeonintercept = element.GetAttributeBool("removeonintercept", false);
            functionininventory = element.GetAttributeBool("functionininventory", false);
            interceptonlyapproaching = element.GetAttributeBool("interceptonlyapproaching", true);
            createexplosiononintercept = element.GetAttributeBool("createexplosiononintercept", false);

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
            if (!functionininventory && Item.IsContained) { return; }
            foreach (Item target in Projectiles.ToDictionary().Keys)
            {
                if (LastCheckedTargets.TryGetValue(target, out bool __)) { continue; }
                if (target.Removed || target.IsContained) { continue; }
                if ((target.WorldPosition - Item.WorldPosition).Length() > range) { continue; }
                float targetsize = target.body.GetSize().Length();
                if (targetsize < minsize.Length() || targetsize > maxsize.Length()) { continue; }
                if (target.Speed < minspeed || target.Speed > maxspeed) { continue; }
                if (target.body.Mass < MinMass || target.body.Mass > MaxMass) { continue; }
                if (!IsApproaching(target.WorldPosition, target.body.LinearVelocity, Item.WorldPosition, Item.body.LinearVelocity) && interceptonlyapproaching) { continue; }
                if (Submarine.CheckVisibility(item.SimPosition, target.SimPosition) != null) { continue; }

                LastCheckedTargets[target] = true;

                Item.Use(deltaTime);

                if (createexplosiononintercept)
                {
                    explosion?.Explode(target.WorldPosition, Item);
                }

                if (Rand.GetRNG(Rand.RandSync.ServerAndClient).NextSingle() > probility) { continue; }

                if (useonintercept)
                {
                    target.Use(deltaTime);
                }

                target.Condition = 0;
                if (removeonintercept)
                {
                    EntitySpawner.Spawner.AddItemToRemoveQueue(target);
                }
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