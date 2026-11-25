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
    private static void Prefix(LightManager __instance, out Color? __state)
    {
        __state = null;
        float floor = NightVisionRenderer.Ambient;
        if (floor <= 0) return;
        var old = __instance.AmbientLight;
        __state = old;
        __instance.AmbientLight = new Color(new Vector4(Vector3.Max(old.ToVector3(), new Vector3(floor)), old.A / 255f));
    }

    private static void Finalizer(LightManager __instance, Color? __state)
    {
        if (__state.HasValue) __instance.AmbientLight = __state.Value;
    }
}
