using Barotrauma.Items.Components;

namespace VoidShield
{
    [HarmonyPatch(typeof(Projectile), nameof(Projectile.DoHitscan))]
    public static class Projectile_DoHitscan_Patch
    {
        static void ValidateHit(Projectile proj, Projectile.HitscanResult h, ref int hitsCount)
        {
            if (h.Fixture.Body.UserData is not VoidShield shield) { return; }
            shield.Item.ApplyStatusEffects(ActionType.OnUse, 1f, proj.User);
            hitsCount = proj.MaxTargetsToHit + 1;
        }

        static IEnumerable<CodeInstruction> Transpiler(IEnumerable<CodeInstruction> instructions, MethodBase original)
        {
            // Local slots differ between client/server and Windows/macOS/Linux builds.
            var matcher = new CodeMatcher(instructions)
                .MatchStartForward(CodeMatch.IsLdloc(),
                    new CodeMatch(OpCodes.Ldfld, AccessTools.Field(typeof(Projectile.HitscanResult), nameof(Projectile.HitscanResult.Fixture))));
            if (matcher.IsInvalid) { throw new InvalidOperationException("VoidShield: hitscan result local not found."); }
            int hitLocal = matcher.Operand is LocalBuilder hit ? hit.LocalIndex : matcher.Instruction.LocalIndex();

            matcher.MatchStartForward(CodeMatch.IsLdloc(), new CodeMatch(OpCodes.Ldarg_0),
                new CodeMatch(OpCodes.Call, AccessTools.PropertyGetter(typeof(Projectile), nameof(Projectile.MaxTargetsToHit))));
            if (matcher.IsInvalid) { throw new InvalidOperationException("VoidShield: hitscan counter comparison not found."); }
            int countLocal = matcher.Operand is LocalBuilder count ? count.LocalIndex : matcher.Instruction.LocalIndex();
            var locals = original.GetMethodBody()?.LocalVariables;
            if (locals?.ElementAtOrDefault(hitLocal)?.LocalType != typeof(Projectile.HitscanResult)
                || locals?.ElementAtOrDefault(countLocal)?.LocalType != typeof(int))
            {
                throw new InvalidOperationException("VoidShield: unexpected hitscan local types.");
            }

            matcher.Start().MatchStartForward(CodeMatch.Calls(() => default(Item)!.UpdateTransform()));
            if (matcher.IsInvalid) { throw new InvalidOperationException("VoidShield: hitscan insertion point not found."); }
            matcher.Insert(new[]
            {
                CodeInstruction.LoadArgument(0),
                CodeInstruction.LoadLocal(hitLocal),
                CodeInstruction.LoadLocal(countLocal, true),
                CodeInstruction.Call(typeof(Projectile_DoHitscan_Patch), nameof(ValidateHit)),
            });
            return matcher.Instructions();
        }
    }
}
