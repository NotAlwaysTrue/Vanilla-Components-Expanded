using Microsoft.Xna.Framework.Graphics;

namespace VCE_NightVision;

internal static class NightVisionRenderer
{
    private readonly record struct Settings(float Gain, float Lift, float Gamma, Color Tint, float Noise,
        float Scanline, float Vignette, float Lens, float Bloom, float FadeTime, float Ambient,
        ThermalDisplay Mode, Color LineColor, float ThermalStrength)
    {
        internal Settings(NightVision nv) : this(nv.Gain, nv.Lift, nv.Gamma, nv.WhiteHot ? Color.White : nv.Tint,
            nv.Noise, nv.Scanline, nv.Vignette, nv.Lens, nv.Bloom, nv.FadeTime, nv.AmbientBoost, nv.ThermalMode,
            nv.ThermalLineColor, nv.ThermalStrength * nv.ThermalBlend * nv.ThermalLineColor.A / 255f) { }
    }

    private static readonly NightVisionThermal thermal = new();
    private static GraphicsDevice? device;
    private static Effect? effect;
    private static BlendState? lightFloorBlend;
    private static bool fallback;
    private static Settings settings;
    private static float blend;
    private static bool hadThermal;

    internal static void Prepare(GameScreen screen, GraphicsDevice graphics, SpriteBatch batch, double dt)
    {
        var nv = NightVision.ForControlledCharacter();
        if (nv == null && blend == 0) return;
        if (nv != null) settings = new(nv);
        float step = settings.FadeTime > 0 ? (float)dt / settings.FadeTime : 1;
        blend = Math.Clamp(blend + (nv == null ? -step : step), 0, 1);
        if (blend == 0) { thermal.Dispose(); return; }
        if (graphics != device || effect == null || effect.IsDisposed)
        {
            thermal.Dispose();
            effect?.Dispose();
            lightFloorBlend?.Dispose();
            lightFloorBlend = new BlendState
            {
                ColorSourceBlend = Blend.One,
                ColorDestinationBlend = Blend.One,
                ColorBlendFunction = BlendFunction.Max,
                ColorWriteChannels = ColorWriteChannels.Red | ColorWriteChannels.Green | ColorWriteChannels.Blue
            };
            device = graphics;
            try
            {
                using var stream = typeof(NightVisionRenderer).Assembly.GetManifestResourceStream("VCE.NightVision.mgfx")
                    ?? throw new InvalidDataException("Missing embedded night vision shader.");
                using var bytes = new BinaryReader(stream);
                effect = new Effect(graphics, bytes.ReadBytes((int)stream.Length));
                fallback = false;
            }
            catch (Exception ex)
            {
                Barotrauma.DebugConsole.ThrowError("VCE night vision shader could not load. Using the game's monochrome effect.", ex);
                effect = screen.MonochromeEffect.Clone();
                fallback = true;
            }
        }
        bool useThermal = settings.Mode != ThermalDisplay.Off && settings.ThermalStrength > 0;
        if (useThermal && nv != null) thermal.Prepare(graphics, batch, screen.Cam, nv, fallback);
        else if (!useThermal && hadThermal) thermal.Dispose();
        hadThermal = useThermal;
    }

    internal static void ApplyLightFloor(SpriteBatch batch)
    {
        if (blend <= 0 || settings.Ambient <= 0 || !VanillaComponentsExpanded.VCEPlugin.NightVisionAmbient.Value) return;

        float floor = Math.Clamp(settings.Ambient * blend, 0, 1);
        var area = batch.GraphicsDevice.Viewport.Bounds;
        batch.Begin(blendState: lightFloorBlend);
        try { batch.Draw(GUI.WhiteTexture, area, new Color(floor, floor, floor)); }
        finally { batch.End(); }
    }

    internal static RenderTarget2D Composite(GameScreen screen, SpriteBatch batch)
    {
        var scene = screen.renderTargetFinal;
        if (blend <= 0 || effect == null) return scene;
        var graphics = batch.GraphicsDevice;
        var viewport = graphics.Viewport;
        var view = new Rectangle(0, 0, scene.Width, scene.Height);
        var parameters = effect.Parameters;
        if (fallback)
        {
            var color = parameters["monoColor"];
            if (color?.ColumnCount == 4) color.SetValue(settings.Tint.ToVector4());
            else if (color?.ColumnCount == 3) color.SetValue(settings.Tint.ToVector3());
        }
        else
        {
            parameters["Pixel"].SetValue(new Vector2(1f / scene.Width, 1f / scene.Height));
            parameters["Clock"].SetValue((float)(Timing.TotalTimeUnpaused % 60));
            parameters["Gain"].SetValue(settings.Gain);
            parameters["Lift"].SetValue(settings.Lift);
            parameters["Gamma"].SetValue(Math.Max(0.01f, settings.Gamma));
            parameters["Tint"].SetValue(settings.Tint.ToVector3());
            parameters["Noise"].SetValue(settings.Noise);
            parameters["Scanline"].SetValue(settings.Scanline);
            parameters["Vignette"].SetValue(settings.Vignette);
            parameters["Lens"].SetValue(settings.Lens);
            parameters["Bloom"].SetValue(settings.Bloom);
            parameters["Blend"].SetValue(blend);
            parameters["LineTint"].SetValue(settings.LineColor.ToVector3());
            parameters["Thermal"].SetValue(thermal.Mask != null ? settings.ThermalStrength : 0);
            parameters["Edge"].SetValue(settings.Mode == ThermalDisplay.Edge ? 1f : 0f);
            parameters["ThermalMask"].SetValue(thermal.Mask);
        }

        var scissor = graphics.ScissorRectangle;
        var oldBlend = graphics.BlendState;
        var oldDepth = graphics.DepthStencilState;
        var oldRasterizer = graphics.RasterizerState;
        var sampler = graphics.SamplerStates[0];
        var maskSampler = graphics.SamplerStates[1];
        try
        {
            // DrawMap has finished using this full-size intermediate and is about to present the world.
            graphics.SetRenderTarget(screen.renderTarget);
            batch.Begin(SpriteSortMode.Deferred, BlendState.Opaque, SamplerState.LinearClamp, null, null, effect);
            try { batch.Draw(scene, view, Color.White); }
            finally { batch.End(); }
            if (fallback && blend < 1)
            {
                batch.Begin();
                try { batch.Draw(scene, view, Color.White * (1 - blend)); }
                finally { batch.End(); }
            }
            if (hadThermal && (settings.Mode == ThermalDisplay.FusedOutline || fallback))
            {
                batch.Begin(blendState: BlendState.Additive);
                try { thermal.Draw(batch, screen.Cam, new Color(settings.LineColor, Math.Clamp(settings.ThermalStrength * blend, 0, 1))); }
                finally { batch.End(); }
            }
        }
        finally
        {
            graphics.SetRenderTarget(null);
            graphics.Viewport = viewport;
            graphics.Textures[1] = null;
            graphics.SamplerStates[0] = sampler;
            graphics.SamplerStates[1] = maskSampler;
            graphics.BlendState = oldBlend;
            graphics.DepthStencilState = oldDepth;
            graphics.RasterizerState = oldRasterizer;
            graphics.ScissorRectangle = scissor;
        }
        return screen.renderTarget;
    }

    internal static void EndRound(GameSession session) => Reset();
    internal static void Reset()
    {
        NightVision.ClearWearers();
        effect?.Dispose();
        effect = null;
        lightFloorBlend?.Dispose();
        lightFloorBlend = null;
        device = null;
        thermal.Dispose();
        blend = 0;
        hadThermal = false;
    }
}
