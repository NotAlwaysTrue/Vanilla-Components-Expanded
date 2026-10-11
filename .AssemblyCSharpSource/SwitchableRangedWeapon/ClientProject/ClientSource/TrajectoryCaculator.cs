using Barotrauma.Items.Components;
using Barotrauma.Networking;
using FarseerPhysics;
using Microsoft.Xna.Framework.Graphics;
using System;

namespace SRW
{
    public partial class TrajectoryCalculator
    {
        [Serialize(true, IsPropertySaveable.Yes, alwaysUseInstanceValues: true)]
        public bool ShouldDrawTrajectory { get; set; }

        public float DeltaTimeScale => SwitchableRangedWeaponPlugin.Instance.CaculatorDeltaTimeScale;

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
                DrawProjectileTrajectory(spriteBatch, TimeOfFly, DeltaTimeScale);
            }
        }

        public void DrawProjectileTrajectory(SpriteBatch spriteBatch, float duration = 2.0f, float scale = 1, int thickness = 2)
        {
            RangedWeapon weapon = item.GetComponent<RangedWeapon>();
            Projectile projectile = weapon.FindProjectile(false);
            Character user = Item.ParentInventory?.Owner as Character;
            if (weapon == null || projectile == null || projectile.Hitscan || user == null) { return; }

            Vector2 origin = Item.WorldPosition + ConvertUnits.ToDisplayUnits(weapon.TransformedBarrelPos);
            Vector2 direction = new(MathF.Cos(Item.body.Rotation), MathF.Sin(Item.body.Rotation));
            direction *= Item.FlippedX ? -1 : 1;

            float mass = projectile.Item.body.FarseerBody.Mass;
            float gravityScale = projectile.Item.body.FarseerBody.IgnoreGravity ? 0 : projectile.Item.body.FarseerBody.GravityScale;
            float linearDamping = projectile.Item.body.FarseerBody.LinearDamping;
            float totalImpulse = projectile.LaunchImpulse + weapon.LaunchImpulse;
            float speedSim = Math.Min(totalImpulse, NetConfig.MaxPhysicsBodyVelocity * 0.95f);
            // NOT I/m !!!!

            float dt = (float)scale * 0.01666666667f;


            int steps = Math.Max(1, (int)(duration / dt));

            Vector2 originSim = ConvertUnits.ToSimUnits(origin);
            Vector2 velocitySim = direction * speedSim;
            Vector2 gravitySim = GameMain.World.Gravity * gravityScale * dt;

            Camera cam = GameMain.GameScreen.Cam;

            Vector2 prevWorld = origin;
            Vector2 prevScreen = cam.WorldToScreen(prevWorld);

            for (int i = 1; i <= steps; i++)
            {
                velocitySim += gravitySim;
                velocitySim *= Math.Clamp(1f - linearDamping * dt, 0f, 1f);
                originSim += velocitySim * dt;

                Vector2 currentWorld = ConvertUnits.ToDisplayUnits(originSim);
                Vector2 currentScreen = cam.WorldToScreen(currentWorld);

                GUI.DrawLine(spriteBatch, prevScreen, currentScreen, DrawColor, width: thickness);

                prevWorld = currentWorld;
                prevScreen = currentScreen;
            }
        }

    }
}