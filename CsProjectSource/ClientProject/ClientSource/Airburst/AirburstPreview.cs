using Barotrauma.Items.Components;
using FarseerPhysics;
using Barotrauma.Networking;
using Microsoft.Xna.Framework.Graphics;

namespace VCE_Airburst;

[HarmonyPatch(typeof(RangedWeapon), nameof(RangedWeapon.DrawHUD))]
internal static class AirburstPreview
{
    private static void Postfix(RangedWeapon __instance, SpriteBatch spriteBatch, Character character)
    {
        if (character != Character.Controlled || !character.CanAim || !character.IsKeyDown(InputType.Aim) ||
            !character.HeldItems.Contains(__instance.Item) || __instance.FindProjectile() is not AirburstProjectile fuse) return;
        var weapon = __instance.Item;
        Vector2 muzzle = ConvertUnits.ToSimUnits(weapon.WorldPosition) + __instance.TransformedBarrelPos;
        float distance = Vector2.Distance(muzzle, ConvertUnits.ToSimUnits(character.CursorWorldPosition));
        if (fuse.MaxDistance > 0) distance = Math.Min(distance, fuse.MaxDistance);
        var body = fuse.Item.body.FarseerBody;
        Vector2 gravity = body.IgnoreGravity ? Vector2.Zero : GameMain.World.Gravity * (fuse.DefaultPhysics ? body.GravityScale : fuse.GravityScale);
        float drag = fuse.DefaultPhysics ? body.LinearDamping : fuse.Drag;
        float angle = weapon.body.TransformedRotation;
        Vector2 velocity = new Vector2(MathF.Cos(angle), MathF.Sin(angle)) *
            Math.Min(NetConfig.MaxPhysicsBodyVelocity * 0.95f, fuse.LaunchImpulse + __instance.LaunchImpulse);
        float time = AirburstBallistics.TimeAtRange(velocity, gravity, drag, distance, fuse.Mode == AirburstProjectile.FuseMode.Chord);
        if (!float.IsFinite(time)) return;
        Vector2 mark = GameMain.GameScreen.Cam.WorldToScreen(ConvertUnits.ToDisplayUnits(muzzle + AirburstBallistics.Position(velocity, gravity, drag, time)));
        GUI.DrawLine(spriteBatch, mark - Vector2.UnitX * 5, mark + Vector2.UnitX * 5, Color.Orange);
        GUI.DrawLine(spriteBatch, mark - Vector2.UnitY * 5, mark + Vector2.UnitY * 5, Color.Orange);
    }
}
