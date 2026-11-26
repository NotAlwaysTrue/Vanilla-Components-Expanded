namespace VCE_SRW
{
    public partial class SwitchableRangedWeapon
    {
        internal static bool CanSwitchModes([System.Diagnostics.CodeAnalysis.NotNullWhen(true)] Character? character)
        {
            return character != null && character == Character.Controlled && !character.Removed &&
                !character.IsIncapacitated && character.CanAim && !Character.DisableControls &&
                GameMain.WindowActive && Screen.Selected == GameMain.GameScreen && !GameMain.Instance.Paused &&
                !GUI.InputBlockingMenuOpen && !DebugConsole.IsOpen && !ConversationAction.IsDialogOpen &&
                GUI.KeyboardDispatcher.Subscriber == null && PlayerInput.KeyDown(InputType.Aim) &&
                !(character.ViewTarget is Item target && target.Prefab.FocusOnSelected);
        }

        [HarmonyPatch]
        private static class SwitchInputPatch
        {
            // Voice capture also reads bindings on its worker thread; only inspect held items on the main thread.
            private static volatile KeyOrMouse? fireModeKey;
            private static volatile KeyOrMouse? projectileKey;

            [HarmonyPatch(typeof(PlayerInput), nameof(PlayerInput.Update)), HarmonyPostfix]
            internal static void Update()
            {
                KeyOrMouse? nextFireModeKey = null;
                KeyOrMouse? nextProjectileKey = null;
                Character? character = Character.Controlled;
                if (CanSwitchModes(character))
                {
                    foreach (Item heldItem in character.HeldItems)
                    {
                        foreach (SwitchableRangedWeapon weapon in heldItem.GetComponents<SwitchableRangedWeapon>())
                        {
                            if (weapon.maxfiremodeselectable > 1) { nextFireModeKey = weapon.fireModeswitchKey; }
                            if (weapon.maxselectable > 1 || weapon is BackpackFedWeapon) { nextProjectileKey = weapon.ModeSwitchKey; }
                        }
                    }
                }
                fireModeKey = nextFireModeKey;
                projectileKey = nextProjectileKey;
            }

            [HarmonyPatch(typeof(KeyOrMouse), nameof(KeyOrMouse.IsHit)), HarmonyPostfix]
            internal static void FilterHit(KeyOrMouse __instance, ref bool __result) => FilterBinding(__instance, ref __result);

            [HarmonyPatch(typeof(KeyOrMouse), nameof(KeyOrMouse.IsDown)), HarmonyPostfix]
            internal static void FilterDown(KeyOrMouse __instance, ref bool __result) => FilterBinding(__instance, ref __result);

            private static void FilterBinding(KeyOrMouse binding, ref bool result)
            {
                if (!result) { return; }
                KeyOrMouse? fireMode = fireModeKey;
                KeyOrMouse? projectile = projectileKey;
                // VCE owns separate binding objects; keep those and Aim readable even when the keys overlap.
                if (ReferenceEquals(binding, fireMode) || ReferenceEquals(binding, projectile) ||
                    ReferenceEquals(binding, GameSettings.CurrentConfig.KeyMap.Bindings[InputType.Aim])) { return; }
                if (binding == fireMode || binding == projectile) { result = false; }
            }
        }
    }
}
