using Barotrauma.Items.Components;
using System.Reflection;
using System.Reflection.Emit;

namespace VCE_VoidShield
{
    [HarmonyPatch(typeof(Projectile), nameof(Projectile.DoHitscan))]
    public static class Projectile_DoHitscan_Patch
    {
        private const string HitLocal = "hit";
        private const string HitLocalRepeated = "hitRepeated";
        private const string CounterLoad = "counterLoad";
        private const string CounterStore = "counterStore";

        private static readonly FieldInfo HitFixture =
            AccessTools.Field(typeof(Projectile.HitscanResult), nameof(Projectile.HitscanResult.Fixture));

        private static readonly FieldInfo HitNormal =
            AccessTools.Field(typeof(Projectile.HitscanResult), nameof(Projectile.HitscanResult.Normal));

        private static int ValidateHit(Projectile projectile, Projectile.HitscanResult hit, int hitsCount)
        {
            if (hit.Fixture.Body.UserData is not VoidShield shield) { return hitsCount; }

            shield.Item.ApplyStatusEffects(ActionType.OnUse, 1f, projectile.User);

            return projectile.MaxTargetsToHit + 1;
        }

        private static IEnumerable<CodeInstruction> Transpiler(IEnumerable<CodeInstruction> instructions)
        {
            var matcher = new CodeMatcher(instructions);

            matcher.MatchStartForward(
                CodeMatch.LoadsLocal(useAddress: false, CounterLoad),
                CodeMatch.LoadsConstant(1),
                new CodeMatch(OpCodes.Add),
                CodeMatch.StoresLocal(CounterStore));

            CodeInstruction counterLoad = matcher.NamedMatch(CounterLoad);
            CodeInstruction counterStore = matcher.NamedMatch(CounterStore);

            matcher.Start().MatchStartForward(
                new CodeMatch(OpCodes.Callvirt, AccessTools.Method(typeof(Item), nameof(Item.UpdateTransform))),
                new CodeMatch(OpCodes.Ldarg_0),
                CodeMatch.LoadsLocal(useAddress: false, HitLocal),
                new CodeMatch(OpCodes.Ldfld, HitFixture),
                CodeMatch.LoadsLocal(useAddress: false, HitLocalRepeated),
                new CodeMatch(OpCodes.Ldfld, HitNormal));

            CodeInstruction hitLoad = matcher.NamedMatch(HitLocal);

            matcher.Insert(new[]
            {
                // this (the Projectile)
                new CodeInstruction(OpCodes.Ldarg_0),
                // current hit result h
                new CodeInstruction(hitLoad.opcode, hitLoad.operand),
                // current loop counter
                new CodeInstruction(counterLoad.opcode, counterLoad.operand),
                CodeInstruction.Call(typeof(Projectile_DoHitscan_Patch), nameof(ValidateHit)),
                // store the counter back
                new CodeInstruction(counterStore.opcode, counterStore.operand),
            });

            return matcher.Instructions();
        }
    }
}