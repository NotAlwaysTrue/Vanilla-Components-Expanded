using Barotrauma.Items.Components;

namespace VoidShield
{
    [HarmonyPatch(typeof(Projectile), nameof(Projectile.DoHitscan))]
    public static class Projectile_DoHitscan_Patch
    {
        static void ValidateHit(Projectile proj, Projectile.HitscanResult h, ref int hitsCount)
        {
            if (h.Fixture.Body.UserData is not VoidShield shield) { return; }
            shield.Item.ApplyStatusEffects(ActionType.OnUse, 1f, worldPosition: proj.Item.WorldPosition);
            hitsCount = proj.MaxTargetsToHit + 1;
        }

        static IEnumerable<CodeInstruction> Transpiler(IEnumerable<CodeInstruction> instructions)
        {
            var matcher = new CodeMatcher(instructions)
                .MatchStartForward(
                    CodeMatch.Calls(() => default(Item).UpdateTransform())
                );

            if (matcher.IsInvalid) { return instructions; }

            CodeInstruction[] insertInstructions = new[]
            {
                CodeInstruction.LoadArgument(0),
                CodeInstruction.LoadLocal(13),
                CodeInstruction.LoadLocal(8, true),
                CodeInstruction.Call(typeof(Projectile_DoHitscan_Patch), nameof(ValidateHit)),
            };

            matcher.Insert(insertInstructions);

            return matcher.Instructions();
        }
    }
}