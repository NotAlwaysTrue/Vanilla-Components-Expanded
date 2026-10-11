using Barotrauma.Items.Components;
using FarseerPhysics;
using FarseerPhysics.Dynamics;

namespace VoidShield
{
    public partial class VoidShield : ItemComponent
    {
        private PhysicsBody? collider;
        public float Width { get; set; }
        public float Height { get; set; }
        public float Radius { get; set; }
        public Vector2 Offset { get; set; }
        private Vector2 RotatedOffset => Vector2.Transform(Offset, Matrix.CreateRotationZ(Item.RotationRad));

        public VoidShield(Item item, ContentXElement element) : base(item, element)
        {
            Width = element.GetAttributeFloat("width", 0f);
            Height = element.GetAttributeFloat("height", 0f);
            Radius = element.GetAttributeFloat("radius", 0f);
            Offset = element.GetAttributeVector2("offset", Vector2.Zero);

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
            World world = GameMain.World;
            if (world == null || world.IsLocked) { return; }

            if (!PhysicsBody.IsValidShape(Radius, Height, Width)) { return; }

            collider = new PhysicsBody(Width, Height, Radius, 1f, BodyType.Dynamic, Physics.CollisionItemBlocking, Physics.CollisionProjectile)
            {
                Enabled = false,
                UserData = this
            };
        }

        private void SyncCollider()
        {
            if (collider == null) { CreateCollider(); }
            if (collider == null) { return; }

            World world = GameMain.World;
            if (world == null || world.IsLocked) { return; }

            if (collider.FarseerBody.World == null) { collider = null; return; }

            if (collider.Enabled != IsActive) { collider.Enabled = IsActive; }
            if (!IsActive) { return; }

            collider.SetTransformIgnoreContacts(GetColliderSimPosition(), Item.RotationRad);
        }

        private Vector2 GetColliderSimPosition() => Item.SimPosition + ConvertUnits.ToSimUnits(RotatedOffset);

        public override void RemoveComponentSpecific()
        {
            base.RemoveComponentSpecific();
            if (collider == null) { return; }
            if (collider.FarseerBody.World != null && !collider.FarseerBody.World.IsLocked)
            {
                collider.Remove();
            }
            collider = null;
        }
    }
}