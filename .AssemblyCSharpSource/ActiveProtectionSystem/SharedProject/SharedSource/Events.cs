using Barotrauma.Items.Components;
using Barotrauma.LuaCs.Events;

namespace ActiveProtectionSystem
{
    [HarmonyPatch(typeof(Projectile), nameof(Projectile.Shoot))]
    class ProjectilePatch
    {
        static void Postfix(Projectile __instance)
        {
            if (__instance.Hitscan) { return; }
            ActiveProtectionSystem.Projectiles.Add(__instance.Item, true);
        }
    }

    [HarmonyPatch(typeof(Throwable), nameof(Throwable.Use))]
    class ThrowablePatch
    {
        static void Postfix(Throwable __instance)
        {
            if (__instance.CurrentThrower == null) { return; }
            ActiveProtectionSystem.Projectiles.Add(__instance.Item, true);
        }
    }

    class OnItemRemovedEvent : IEventItemRemoved
    {
        public static OnItemRemovedEvent Instance = new();
        public void OnItemRemoved(Item item)
        {
            ActiveProtectionSystem.Projectiles.Remove(item);
        }
    }
}