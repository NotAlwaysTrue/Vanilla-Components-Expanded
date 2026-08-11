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
            ActiveProtectionSystemPlugin.Instance.LoggerService.Log("Projectile added" + __instance.Item.ToString());
        }
    }

    [HarmonyPatch(typeof(Throwable), nameof(Throwable.Use))]
    class ThrowablePatch
    {
        static void Postfix(Throwable __instance)
        {
            if (__instance.CurrentThrower == null) { return; }
            ActiveProtectionSystem.Projectiles.Add(__instance.Item, true);
            ActiveProtectionSystemPlugin.Instance.LoggerService.Log("Projectile added" + __instance.Item.ToString());
        }
    }

    class OnItemRemovedEvent : IEventItemRemoved
    {
        public static OnItemRemovedEvent Instance = new();
        public void OnItemRemoved(Item item)
        {
            if(ActiveProtectionSystem.Projectiles.Remove(item))
            {
                ActiveProtectionSystemPlugin.Instance.LoggerService.Log("Projectile removed" + item.ToString());
            }
        }
    }

    class OnRoundEndEvent : IEventRoundEnded
    {
        public static OnRoundEndEvent Instance = new();
        public void OnRoundEnd()
        {
            ActiveProtectionSystem.Projectiles.Clear();
        }
    }
}