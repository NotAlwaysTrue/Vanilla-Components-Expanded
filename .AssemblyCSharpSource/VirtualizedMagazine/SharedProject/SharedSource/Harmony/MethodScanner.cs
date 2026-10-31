using Barotrauma.Items.Components;
using FarseerPhysics.Dynamics;
using System.Linq.Expressions;

namespace VCE_VirtualizedMagazine
{

    public static class ProjectileShootDispatcher
    {
        public delegate void ShootDelegate(
            Projectile self,
            Character user,
            Vector2 weaponPos,
            Vector2 spawnPos,
            float rotation,
            List<Body> ignoredBodies,
            bool createNetworkEvent,
            float damageMultiplier,
            float launchImpulseModifier);

        private static readonly Type[] ShootParamTypes =
        {
        typeof(Character),
        typeof(Vector2),
        typeof(Vector2),
        typeof(float),
        typeof(List<Body>),
        typeof(bool),
        typeof(float),
        typeof(float)
    };

        private static readonly ConcurrentDictionary<Type, ShootDelegate> _cache = new();

        private static volatile bool _dirty = false;

        public static void Init()
        {
            ScanAll();
            AppDomain.CurrentDomain.AssemblyLoad += (_, __) => _dirty = true;
        }

        public static void Refresh()
        {
            ScanAll();
            _dirty = false;
        }

        private static void ScanAll()
        {
            var baseType = typeof(Projectile);
            int count = 0;

            foreach (var asm in AppDomain.CurrentDomain.GetAssemblies())
            {
                Type[] types;
                try
                {
                    types = asm.GetTypes();
                }
                catch (ReflectionTypeLoadException ex)
                {
                    types = ex.Types.Where(t => t != null).ToArray();
                }
                catch
                {
                    continue;
                }

                foreach (var type in types)
                {
                    if (type == null) continue;
                    if (type == baseType) continue;
                    if (type.IsAbstract || type.IsInterface) continue;
                    if (!baseType.IsAssignableFrom(type)) continue;

                    var method = type.GetMethod(
                        nameof(Projectile.Shoot),
                        BindingFlags.Public | BindingFlags.Instance | BindingFlags.DeclaredOnly,
                        null,
                        ShootParamTypes,
                        null);

                    if (method == null) { continue; }

                    try
                    {
                        _cache[type] = CreateShootDelegate(type, method);
                        count++;
                    }
                    catch (Exception e)
                    {
                    }
                }
            }
        }

        private static ShootDelegate CreateShootDelegate(Type type, MethodInfo method)
        {
            var parameters = new ParameterExpression[ShootParamTypes.Length + 1];
            parameters[0] = Expression.Parameter(typeof(Projectile), "self");
            for (int i = 0; i < ShootParamTypes.Length; i++)
            {
                parameters[i + 1] = Expression.Parameter(ShootParamTypes[i], "p" + i);
            }

            var instance = Expression.Convert(parameters[0], type);
            var body = Expression.Call(instance, method, parameters.Skip(1));
            return Expression.Lambda<ShootDelegate>(body, parameters).Compile();
        }

        public static void DispatchShoot(
            Projectile projectile,
            Character user,
            Vector2 weaponPos,
            Vector2 spawnPos,
            float rotation,
            List<Body> ignoredBodies,
            bool createNetworkEvent,
            float damageMultiplier,
            float launchImpulseModifier)
        {
            if (projectile == null) { return; }

            if (_dirty) { Refresh(); }

            var type = projectile.GetType();

            if (_cache.TryGetValue(type, out var del))
            {
                del(projectile, user, weaponPos, spawnPos, rotation, ignoredBodies, createNetworkEvent, damageMultiplier, launchImpulseModifier);
                return;
            }

            projectile.Shoot(user, weaponPos, spawnPos, rotation, ignoredBodies, createNetworkEvent, damageMultiplier, launchImpulseModifier);
        }
    }
}