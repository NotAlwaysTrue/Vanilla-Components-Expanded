using FarseerPhysics;
using Microsoft.Xna.Framework.Graphics;

namespace VCE_NightVision;

internal sealed class NightVisionThermal : IDisposable
{
    private readonly record struct Outline(Vector2 Center, Vector2 Size, float Angle);
    private readonly List<Outline> outlines = new();
    private readonly List<(Character Target, float Distance)> candidates = new();
    private double nextRefresh;
    private ushort? observer;
    private Texture2D? pixel;
    internal RenderTarget2D? Mask { get; private set; }

    internal void Prepare(GraphicsDevice graphics, SpriteBatch batch, Camera cam, NightVision nv, bool fallback)
    {
        var user = Character.Controlled;
        if (user == null || nv.ThermalMode == ThermalDisplay.Off) { Dispose(); return; }
        double now = Timing.TotalTimeUnpaused;
        if (now >= nextRefresh || observer != user.ID)
        {
            observer = user.ID;
            nextRefresh = now + 1 / Math.Clamp(nv.ThermalUpdateHz, 1f, 60f);
            outlines.Clear();
            int limit = Math.Clamp(nv.MaxThermalTargets, 0, 32);
            foreach (var target in Character.CharacterList)
            {
                if (target == user || !target.Enabled || target.Removed || target.Params.HideInThermalGoggles ||
                    target.InDetectable || (target.IsDead && !nv.ShowDead)) continue;
                float distance = Vector2.DistanceSquared(user.WorldPosition, target.WorldPosition);
                if (distance > nv.ThermalRange * nv.ThermalRange) continue;
                Vector2 screen = cam.WorldToScreen(target.WorldPosition);
                var viewport = graphics.Viewport;
                const int margin = 200;
                if (screen.X < -margin || screen.Y < -margin || screen.X > viewport.Width + margin || screen.Y > viewport.Height + margin) continue;
                candidates.Add((target, distance));
            }
            candidates.Sort(static (a, b) => a.Distance.CompareTo(b.Distance));
            for (int i = 0; i < Math.Min(limit, candidates.Count); i++)
            {
                var target = candidates[i].Target;
                var anim = target.AnimController;
                foreach (var limb in anim.Limbs)
                {
                    if (limb.Hidden || limb.IsSevered) continue;
                    if (!target.IsHuman && limb != anim.MainLimb && limb.Mass < 0.5f) continue;
                    outlines.Add(new(limb.WorldPosition, ConvertUnits.ToDisplayUnits(limb.body.GetSize()), -limb.body.Rotation));
                }
            }
            candidates.Clear();
        }
        if (fallback || nv.ThermalMode == ThermalDisplay.FusedOutline) { ReleaseMask(); return; }

        var view = graphics.Viewport;
        int width = Math.Max(1, view.Width / 4), height = Math.Max(1, view.Height / 4);
        if (Mask == null || Mask.Width != width || Mask.Height != height)
        {
            ReleaseMask();
            Mask = new RenderTarget2D(graphics, width, height);
        }
        if (pixel == null)
        {
            pixel = new Texture2D(graphics, 1, 1);
            pixel.SetData(new[] { Color.White });
        }
        var previous = graphics.GetRenderTargets();
        var scissor = graphics.ScissorRectangle;
        var blend = graphics.BlendState;
        var depth = graphics.DepthStencilState;
        var rasterizer = graphics.RasterizerState;
        var sampler = graphics.SamplerStates[0];
        try
        {
            graphics.SetRenderTarget(Mask);
            graphics.Clear(Color.Black);
            batch.Begin();
            try { Draw(batch, cam, Color.White, (float)width / view.Width, nv.ThermalMode == ThermalDisplay.Edge); }
            finally { batch.End(); }
        }
        finally
        {
            graphics.SetRenderTargets(previous);
            graphics.Viewport = view;
            graphics.BlendState = blend;
            graphics.DepthStencilState = depth;
            graphics.RasterizerState = rasterizer;
            graphics.SamplerStates[0] = sampler;
            graphics.ScissorRectangle = scissor;
        }
    }

    internal void Draw(SpriteBatch batch, Camera cam, Color color, float scale = 1, bool filled = false)
    {
        foreach (var limb in outlines)
        {
            Vector2 center = cam.WorldToScreen(limb.Center) * scale;
            Vector2 size = limb.Size * (cam.Zoom * scale);
            if (filled)
                batch.Draw(pixel, center, null, color, limb.Angle, new Vector2(0.5f), size, SpriteEffects.None, 0);
            else
                GUI.DrawRectangle(batch, center, size.X, size.Y, limb.Angle, color, thickness: Math.Max(1, 2 * scale));
        }
    }

    private void ReleaseMask()
    {
        Mask?.Dispose();
        Mask = null;
    }

    public void Dispose()
    {
        ReleaseMask();
        pixel?.Dispose();
        pixel = null;
        outlines.Clear();
        candidates.Clear();
        observer = null;
        nextRefresh = 0;
    }
}
