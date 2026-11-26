// SpriteBatch supplies the vertex shader and projection for the current viewport.
#if OPENGL
    #define PIXEL_PROFILE ps_3_0
    #define COLOR_TARGET COLOR0
#else
    #define PIXEL_PROFILE ps_4_0
    #define COLOR_TARGET SV_Target
#endif

sampler Scene : register(s0);
texture ThermalMask;
sampler Mask = sampler_state { Texture = <ThermalMask>; MinFilter = Linear; MagFilter = Linear; AddressU = Clamp; AddressV = Clamp; };
float2 Pixel;
float Clock, Gain, Lift, Gamma, Noise, Scanline, Vignette, Lens, Bloom, Blend, Edge, Thermal;
float3 Tint, LineTint;

float luminance(float3 color) { return dot(color, float3(0.299, 0.587, 0.114)); }
float bright(float2 uv) { return max(0, luminance(tex2D(Scene, saturate(uv)).rgb) - 0.55); }

// Keep SpriteBatch's full output signature so DirectX reads UVs from register 2.
float4 NightPixel(float4 position : SV_Position, float4 color : COLOR0, float2 uv : TEXCOORD0) : COLOR_TARGET
{
    float2 center = uv * 2 - 1;
    float r2 = dot(center, center);
    float2 sampleUV = saturate(0.5 + center * (0.5 + 0.04 * Lens * r2));
    float lum = luminance(tex2D(Scene, sampleUV).rgb);
    if (Bloom > 0)
    {
        float2 radius = Pixel * 4;
        lum += Bloom * 0.25 * (bright(sampleUV + radius) + bright(sampleUV - radius)
            + bright(sampleUV + float2(radius.x, -radius.y)) + bright(sampleUV + float2(-radius.x, radius.y)));
    }
    float value = pow(saturate(lum * Gain + Lift), Gamma);
    float2 screenPixel = floor(uv / Pixel);
    float grain = frac(sin(dot(fmod(screenPixel, 128), float2(12.9898, 78.233)) + frac(Clock) * 32) * 4375.85);
    value += (grain - 0.5) * Noise;
    value *= (1 - Scanline * fmod(screenPixel.y, 2)) * saturate(1 - Vignette * r2);
    float3 result = saturate(value) * Tint;
    if (Thermal > 0)
    {
        float m = tex2D(Mask, sampleUV).r;
        if (Edge > 0)
        {
            float2 d = Pixel * 4;
            float gx = tex2D(Mask, sampleUV + float2(d.x, 0)).r - tex2D(Mask, sampleUV - float2(d.x, 0)).r;
            float gy = tex2D(Mask, sampleUV + float2(0, d.y)).r - tex2D(Mask, sampleUV - float2(0, d.y)).r;
            m = saturate(abs(gx) + abs(gy));
        }
        result += LineTint * m * Thermal;
    }
    if (Blend < 1) result = lerp(tex2D(Scene, uv).rgb, saturate(result), Blend);
    return float4(saturate(result), 1);
}

technique NightVision { pass P0 { PixelShader = compile PIXEL_PROFILE NightPixel(); } }
