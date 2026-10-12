using Barotrauma.Items.Components;
using Barotrauma.Networking;
using FarseerPhysics;
using Microsoft.Xna.Framework.Graphics;

namespace SRW
{
    public partial class TrajectoryCalculator
    {
        [Serialize(true, IsPropertySaveable.Yes, alwaysUseInstanceValues: true)]
        public bool ShouldDrawTrajectory { get; set; }

        public float StepPerSecond => SwitchableRangedWeaponPlugin.Instance.CaculatorStepPerSecond;

        public float TimeOfFly { get; set; }

        public Color DrawColor { get; set; }

        partial void InitProjSpecific(ContentXElement Element)
        {
            ShouldDrawTrajectory = Element.GetAttributeBool(nameof(ShouldDrawTrajectory), true);
            TimeOfFly = Element.GetAttributeFloat(nameof(TimeOfFly), 1f);
            DrawColor = Element.GetAttributeColor(nameof(DrawColor), Color.Blue);
            DrawHudWhenEquipped = true;
        }

        public override void DrawHUD(SpriteBatch spriteBatch, Character character)
        {
            if (!ShouldDrawTrajectory) { return; }

            if (character == null || !character.IsKeyDown(InputType.Aim) || !character.CanAim) { return; }
            if (character.ViewTarget is Item viewTargetItem && viewTargetItem.Prefab.FocusOnSelected) { return; }
            if (!character.HeldItems.Contains(item)) { return; }

            base.DrawHUD(spriteBatch, character);
            
            {
                DrawProjectileTrajectory(spriteBatch, TimeOfFly);
            }
        }

        public void DrawProjectileTrajectory(SpriteBatch spriteBatch, float duration = 2.0f, int thickness = 2)
        {
            RangedWeapon rawweapon = item.GetComponent<RangedWeapon>();
            Projectile projectile = null;
            if (rawweapon is BackpackFedWeapon bfw)
            {
                projectile = bfw.FindProjectile();
            }
            else if (rawweapon is SwitchableRangedWeapon srw)
            {
                projectile = srw.FindProjectile();
            }
            else
            {
                projectile = rawweapon?.FindProjectile();
            }

            Character user = Item.ParentInventory?.Owner as Character;
            if (rawweapon == null || projectile == null || projectile.Hitscan || user == null) { return; }

            Vector2 origin = Item.WorldPosition + ConvertUnits.ToDisplayUnits(rawweapon.TransformedBarrelPos);
            Vector2 direction = new(MathF.Cos(Item.body.Rotation), MathF.Sin(Item.body.Rotation));
            direction *= Item.FlippedX ? -1 : 1;

            float gravityScale = projectile.Item.body.FarseerBody.IgnoreGravity
                ? 0
                : projectile.Item.body.FarseerBody.GravityScale;

            float linearDamping = projectile.Item.body.FarseerBody.LinearDamping;

            float totalImpulse = projectile.LaunchImpulse + rawweapon.LaunchImpulse;
            float speedSim = Math.Min(totalImpulse, NetConfig.MaxPhysicsBodyVelocity * 0.95f);

            int steps = (int)Math.Max(2, TimeOfFly * StepPerSecond);

            Vector2 p0 = ConvertUnits.ToSimUnits(origin);
            Vector2 v0 = direction * speedSim;
            Vector2 gravity = GameMain.World.Gravity * gravityScale;

            Camera cam = GameMain.GameScreen.Cam;
            Vector2 prevScreen = cam.WorldToScreen(origin);

            for (int i = 1; i <= steps; i++)
            {
                float t = TimeOfFly / steps * i;

                Vector2 posSim = ProjectilePositionAtTime(p0, v0, gravity, linearDamping, t);
                Vector2 currentWorld = ConvertUnits.ToDisplayUnits(posSim);
                Vector2 currentScreen = cam.WorldToScreen(currentWorld);

                GUI.DrawLine(spriteBatch, prevScreen, currentScreen, DrawColor, width: thickness);

                prevScreen = currentScreen;
            }
        }

        private static Vector2 ProjectilePositionAtTime(
            Vector2 p0,
            Vector2 v0,
            Vector2 gravity,
            float damping,
            float t)
        {
            if (t <= 0f)
                return p0;

            if (damping <= 0.0001f)
                return p0 + v0 * t + 0.5f * gravity * t * t;

            float e = MathF.Exp(-damping * t);
            Vector2 terminalV = gravity / damping;

            return p0 + terminalV * t + (v0 - terminalV) * ((1f - e) / damping);
        }

    }
}