using Barotrauma.Items.Components;
using Microsoft.Xna.Framework.Graphics;

namespace VoidShield
{
    [HarmonyPatch(typeof(Item), nameof(Item.DrawDecorativeSprites))]
    internal static class Item_DrawDecorativeSprites_Patch
    {
        private static void Postfix(Item __instance, SpriteBatch spriteBatch, Vector2 drawPos, float rotation, float depth, Color? overrideColor)
        {
            if (__instance.Container == null || Screen.Selected is SubEditorScreen) { return; }
            if (__instance.GetComponent<VoidShield>() is not VoidShield shield) { return; }
            shield.DrawSprite(spriteBatch, drawPos, -rotation, depth, overrideColor);
            if (GameMain.DebugDraw)
            {
                shield.DebugDrawCollider(spriteBatch);
            }
        }
    }

    [HarmonyPatch(typeof(Item), nameof(Item.IsVisible))]
    internal static class Item_IsVisible_Patch
    {
        private static void Postfix(Item __instance, ref bool __result)
        {
            if (__result) { return; }
            if (__instance.GetComponent<VoidShield>() is not { AlwaysDraw: true, ShieldActive: true }) { return; }

            Item? root = __instance.RootContainer;
            if (root == null || VoidShield.ContainerDrawsItsContents(root)) { return; }

            __result = true;
        }
    }

    [HarmonyPatch(typeof(ItemContainer), nameof(ItemContainer.SetContainedItemPositions))]
    internal static class ItemContainer_SetContainedItemPositions_Patch
    {
        private static void Postfix(ItemContainer __instance)
        {
            foreach (Item contained in __instance.Inventory.AllItems)
            {
                if (contained.GetComponent<VoidShield>() is VoidShield shield)
                {
                    shield.CaptureContainerOffset(__instance.Item);
                }
            }
        }
    }
}