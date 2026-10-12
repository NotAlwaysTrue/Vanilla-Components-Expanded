using Barotrauma.Items.Components;
using FarseerPhysics;
using FarseerPhysics.Dynamics;
using FarseerPhysics.Dynamics.Contacts;

namespace VoidShield
{
    public partial class VoidShield : ItemComponent
    {
        private PhysicsBody? collider;
        public float Width { get; set; }
        public float Height { get; set; }
        public float Radius { get; set; }
        public Vector2 Offset { get; set; }

        [InGameEditable, Serialize(false, IsPropertySaveable.Yes, description: "Is the shield active. When active, the shield collider is enabled and the shield sprite is drawn.", alwaysUseInstanceValues: true)]
        public bool ShieldActive { get; set; }

        private Vector2 RotatedOffset => Vector2.Transform(Offset, Matrix.CreateRotationZ(Item.RotationRad));

        public VoidShield(Item item, ContentXElement element) : base(item, element)
        {
            Width = element.GetAttributeFloat("width", 0f);
            Height = element.GetAttributeFloat("height", 0f);
            Radius = element.GetAttributeFloat("radius", 0f);
            Offset = element.GetAttributeVector2("offset", Vector2.Zero);
            ShieldActive = element.GetAttributeBool("shieldactive", false);

            InitProjSpecific(element);
            CreateCollider();
        }

        partial void InitProjSpecific(ContentXElement element);

        public override bool UpdateWhenInactive => true;

        public override void Update(float deltaTime, Camera cam) => SyncCollider();

        public override void Move(Vector2 amount, bool ignoreContacts = false) => SyncCollider();

        public override void UpdateBroken(float deltaTime, Camera cam) => SyncCollider();

        private void CreateCollider()
        {
            if (collider != null) { return; }

            float simWidth = ConvertUnits.ToSimUnits(Width);
            float simHeight = ConvertUnits.ToSimUnits(Height);
            float simRadius = ConvertUnits.ToSimUnits(Radius);

            collider = new PhysicsBody(simWidth, simHeight, simRadius, 1f, 
                BodyType.Dynamic, Physics.CollisionItemBlocking, Physics.CollisionProjectile)
            {
                Enabled = ShieldActive,
                UserData = this
            };
            collider.FarseerBody.IgnoreGravity = true;
            collider.FarseerBody.FixedRotation = true;
            if (ShieldActive)
            {
                collider.SetTransformIgnoreContacts(GetColliderSimPosition(), Item.RotationRad);
            }
        }

        private void SyncCollider()
        {
            if (collider == null) { CreateCollider(); }
            if (collider == null) { return; }

            if (collider.Enabled != ShieldActive) { collider.Enabled = ShieldActive; }
            if (!ShieldActive) { return; }

            collider.SetTransformIgnoreContacts(GetColliderSimPosition(), Item.RotationRad);
        }

        private Vector2 GetColliderSimPosition() => Item.SimPosition + ConvertUnits.ToSimUnits(RotatedOffset);

        public override void RemoveComponentSpecific()
        {
            base.RemoveComponentSpecific();
            if (collider == null) { return; }
            collider.Remove();
            collider = null;
        }
    }
}