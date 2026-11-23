using Barotrauma.Items.Components;
using Barotrauma.Particles;
using System.Runtime.CompilerServices;

namespace VCE_VirtualizedMagazine
{
    public partial class VirtualizedProjectile
    {
        private static readonly ConditionalWeakTable<ContentXElement, ParticleEmitterPrefab[]> tracerPrefabs = new();
        private ParticleEmitter[] particleEmitters = [];

        partial void ParseProjectileDataClient(ContentXElement element) => particleEmitters = CreateEmitters(element);

        private static ParticleEmitter[] CreateEmitters(ContentXElement element)
        {
            var prefabs = tracerPrefabs.GetValue(element, static projectile =>
                projectile.Elements()
                    .Where(e => e.Name.LocalName.Equals("particleemitter", StringComparison.OrdinalIgnoreCase))
                    .Select(e =>
                    {
                        var prefab = new ParticleEmitterPrefab(e);
                        prefab.Properties.UseTracerPoints = e.GetAttributeBool(nameof(prefab.Properties.UseTracerPoints), true);
                        return prefab;
                    }).ToArray());
            // Emit timers belong to this projectile/shot, even when two weapons use the same prefab.
            return Array.ConvertAll(prefabs, prefab => new ParticleEmitter(prefab));
        }

        internal static void PlayTrace(VirtualShotTrace shot)
        {
            if (GameMain.Client is not { MidRoundSyncing: false } || GameMain.GameSession == null) { return; }
            var element = ElementHelper.GetFirstComponentElementByID<Projectile>(shot.Round.Ammo);
            if (element == null) { return; }

            var emitters = CreateEmitters(element);
            if (emitters.Length == 0) { return; }
            int skip = shot.Prediction is { } key
                ? OwnerTraceHistory.Claim(shot.Round.ProjectileId, key, shot.FirstRay, shot.Ends.Length)
                : 0;
            for (int i = skip; i < shot.Ends.Length; i++) { DrawTrace(emitters, shot.Start, shot.Ends[i]); }
        }

        private FiredRound lastImpactRound;
        private StatusEffect[] impactEffects = [];

        internal static void PlayImpact(VirtualShotImpact impact)
        {
            if (GameMain.Client is not { MidRoundSyncing: false } || GameMain.GameSession == null) { return; }
            var source = Entity.FindEntityByID(impact.Round.ProjectileId) as Item;
            source?.GetComponent<VirtualizedProjectile>()?.ApplyImpact(impact);
        }

        private void ApplyImpact(VirtualShotImpact impact)
        {
            if (lastImpactRound != impact.Round)
            {
                var element = ElementHelper.GetFirstComponentElementByID<Projectile>(impact.Round.Ammo);
                if (element == null) { return; }
                // Keep the live magazine's effects intact, including when it has already emptied.
                impactEffects = ammoIdentifier == impact.Round.Ammo
                    ? statusEffectLists.Values.SelectMany(list => list).ToArray()
                    : element.Elements().Where(e => e.Name.LocalName.Equals("statuseffect", StringComparison.OrdinalIgnoreCase))
                        .Select(e => StatusEffect.Load(e, item.Name + ", " + GetType().Name)).ToArray();
                lastImpactRound = impact.Round;
            }

            var target = Entity.FindEntityByID(impact.TargetId);
            var character = impact.LimbIndex >= 0 ? target as Character : null;
            var limbs = character?.AnimController?.Limbs;
            var limb = limbs != null && impact.LimbIndex < limbs.Length ? limbs[impact.LimbIndex] : null;
            Apply(impact.Success ? ActionType.OnSuccess : ActionType.OnFailure);
            Apply(ActionType.OnImpact);

            void Apply(ActionType type)
            {
                foreach (var effect in impactEffects)
                {
                    if (effect.Type == type)
                    {
                        item.ApplyStatusEffect(effect, type, 1.0f, character, limb, target, worldPosition: impact.Position);
                    }
                }
            }
        }

        private static void DrawTrace(ParticleEmitter[] emitters, Vector2 startLocation, Vector2 endLocation)
        {
            if (emitters.Length == 0) { return; }
            Vector2 dir = endLocation - startLocation;
            float rotation = dir.LengthSquared() < 0.0001f ? 0.0f : -(float)Math.Atan2(dir.Y, dir.X);

            Tuple<Vector2, Vector2> tracerPoints = new Tuple<Vector2, Vector2>(startLocation, endLocation);
            foreach (ParticleEmitter emitter in emitters)
            {
                emitter.Emit(1.0f, endLocation, hullGuess: null, angle: rotation, particleRotation: rotation,
                    colorMultiplier: emitter.Prefab.Properties.ColorMultiplier, tracerPoints: tracerPoints);
            }
        }

        partial void PlayHitSoundClient(ActionType conditionalActionType)
        {
            PlaySound(conditionalActionType, user: User);
            PlaySound(ActionType.OnImpact, user: User);
        }
    }
}
