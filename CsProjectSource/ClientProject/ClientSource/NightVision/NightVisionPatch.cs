using Barotrauma.Lights;
using System.Reflection.Emit;
using Microsoft.Xna.Framework.Graphics;

namespace VCE_NightVision;

[HarmonyPatch(typeof(GameScreen), nameof(GameScreen.DrawMap))]
internal static class NightVisionMapPatch
{
    private static void Prefix(GameScreen __instance, GraphicsDevice graphics, SpriteBatch spriteBatch, double deltaTime)
        => NightVisionRenderer.Prepare(__instance, graphics, spriteBatch, deltaTime);

    private static IEnumerable<CodeInstruction> Transpiler(IEnumerable<CodeInstruction> instructions)
    {
        var code = instructions.ToList();
        var render = AccessTools.Method(typeof(GraphicsQuad), nameof(GraphicsQuad.Render));
        int lastQuad = code.FindLastIndex(op => op.Calls(render));
        var bind = AccessTools.Method(typeof(GraphicsDevice), nameof(GraphicsDevice.SetRenderTarget), new[] { typeof(RenderTarget2D) });
        int present = lastQuad < 0 ? -1 : code.FindLastIndex(lastQuad, op => op.Calls(bind));
        if (present < 1 || code[present - 1].opcode != OpCodes.Ldnull)
            throw new InvalidOperationException("VCE night vision could not locate the world presentation pass.");

        // Both the basic blit and the optional post-process read the same field. Only one path executes.
        var source = AccessTools.Field(typeof(GameScreen), nameof(GameScreen.renderTargetFinal));
        var composite = AccessTools.Method(typeof(NightVisionRenderer), nameof(NightVisionRenderer.Composite));
        for (int i = lastQuad - 1; i > present; --i)
        {
            if (!code[i].LoadsField(source)) continue;
            code[i].opcode = OpCodes.Ldarg_2;
            code[i].operand = null;
            code.Insert(i + 1, new CodeInstruction(OpCodes.Call, composite));
        }
        return code;
    }
}

[HarmonyPatch(typeof(LightManager), nameof(LightManager.RenderLightMap))]
internal static class NightVisionLightPatch
{
    private static IEnumerable<CodeInstruction> Transpiler(IEnumerable<CodeInstruction> instructions)
    {
        var code = instructions.ToList();
        var bind = AccessTools.Method(typeof(GraphicsDevice), nameof(GraphicsDevice.SetRenderTarget), new[] { typeof(RenderTarget2D) });
        int unbind = code.FindLastIndex(op => op.Calls(bind));
        var end = AccessTools.Method(typeof(SpriteBatch), nameof(SpriteBatch.End));
        if (unbind < 3 || !code[unbind - 3].Calls(end) || code[unbind - 1].opcode != OpCodes.Ldnull)
            throw new InvalidOperationException("VCE night vision could not locate the end of the light map pass.");

        // Draw while the completed light map is still bound. Rebinding it can discard its contents.
        code.InsertRange(unbind - 2, new[]
        {
            new CodeInstruction(OpCodes.Ldarg_2), // spriteBatch
            new CodeInstruction(OpCodes.Call, AccessTools.Method(typeof(NightVisionRenderer), nameof(NightVisionRenderer.ApplyLightFloor)))
        });
        return code;
    }
}
