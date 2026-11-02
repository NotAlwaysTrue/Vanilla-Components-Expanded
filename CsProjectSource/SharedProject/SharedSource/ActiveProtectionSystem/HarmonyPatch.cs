using Barotrauma;
using Barotrauma.Items.Components;

namespace VCE_APS
{
    internal static class APSPatches
    {
        [HarmonyPatch(typeof(Projectile), nameof(Projectile.Shoot)), HarmonyPostfix]
        static void ProjectileShootPostfix(Projectile __instance)
        {
            if (__instance.Hitscan) { return; }
            ActiveProtectionSystem.Projectiles.TryAdd(__instance.Item, true);
        }

        [HarmonyPatch(typeof(Throwable), nameof(Throwable.SecondaryUse)), HarmonyPostfix]
        static void ThrowablePostfix(Throwable __instance)
        {
            ActiveProtectionSystem.Projectiles.TryAdd(__instance.Item, true);
        }

        [HarmonyPatch(typeof(Item), nameof(Item.Remove)), HarmonyPostfix]
        public static void Item_Remove_Post(Item __instance)
        {
            ActiveProtectionSystem.Projectiles.Remove(__instance);
        }
    }

    internal static class APSHooks
    {
        public static void OnRoundEnded(GameSession gameSession)
        {
            ActiveProtectionSystem.Projectiles.Clear();
        }
    }
}