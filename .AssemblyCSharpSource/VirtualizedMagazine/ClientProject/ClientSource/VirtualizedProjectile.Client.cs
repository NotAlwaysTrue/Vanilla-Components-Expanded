using Barotrauma.Particles;

namespace VCE_VirtualizedMagazine
{
    public partial class VirtualizedProjectile
    {
        private readonly List<ParticleEmitter> particleEmitters = new List<ParticleEmitter>();

        partial void ParseProjectileDataClient(ContentXElement element)
        {
            particleEmitters.Clear();

            foreach (var subElement in element.Elements())
            {
                switch (subElement.Name.ToString().ToLowerInvariant())
                {
                    case "particleemitter":
                        var emitter = new ParticleEmitter(subElement);
                        //backwards compatibility: previously it was not possible to change if the particles use tracer points,
                        //they were always used on projectiles. now emitters don't use them by default, except on projectiles
                        emitter.Prefab.Properties.UseTracerPoints =
                            subElement.GetAttributeBool(nameof(emitter.Prefab.Properties.UseTracerPoints), true);
                        particleEmitters.Add(emitter);
                        break;
                }
            }
        }

        partial void LaunchProjSpecificClient(Vector2 startLocation, Vector2 endLocation)
        {
            if (item.body == null) { return; }

            Vector2 particlePos = ConvertToWorldCoordinates(endLocation);
            startLocation = ConvertToWorldCoordinates(startLocation);
            endLocation = ConvertToWorldCoordinates(endLocation);

            Vector2 dir = endLocation - startLocation;
            float rotation = dir.LengthSquared() < 0.0001f ? 0.0f : -(float)Math.Atan2(dir.Y, dir.X);

            Tuple<Vector2, Vector2> tracerPoints = new Tuple<Vector2, Vector2>(startLocation, endLocation);
            foreach (ParticleEmitter emitter in particleEmitters)
            {
                emitter.Emit(1.0f, particlePos, hullGuess: null, angle: rotation, particleRotation: rotation,
                    colorMultiplier: emitter.Prefab.Properties.ColorMultiplier, tracerPoints: tracerPoints);
            }

            static Vector2 ConvertToWorldCoordinates(Vector2 position)
            {
                Submarine containing = Submarine.FindContainingInLocalCoordinates(position);
                if (containing != null)
                {
                    position += containing.Position;
                }
                return position;
            }
        }

        partial void PlayHitSoundClient(ActionType conditionalActionType)
        {
            PlaySound(conditionalActionType, user: User);
            PlaySound(ActionType.OnImpact, user: User);
        }
    }
}
