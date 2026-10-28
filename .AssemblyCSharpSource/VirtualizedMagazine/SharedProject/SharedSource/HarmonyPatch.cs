using HarmonyLib;
using Barotrauma.Items.Components;

namespace VCE_VirtualizedMagazine
{
    [HarmonyPatch]
    public static class RangedWeaponPatch
    {
        private static readonly MethodInfo DispatchMethod =
            AccessTools.Method(typeof(ProjectileShootDispatcher),
                               nameof(ProjectileShootDispatcher.DispatchShoot));

        private static readonly Type[] UseParamTypes = { typeof(float), typeof(Character) };

        private static IEnumerable<MethodBase> TargetMethods() => CollectUseMethods();

        private static IEnumerable<MethodBase> CollectUseMethods()
        {
            var baseType = typeof(RangedWeapon);

            MethodInfo baseUse = baseType.GetMethod(nameof(RangedWeapon.Use),
                BindingFlags.Public | BindingFlags.Instance, null, UseParamTypes, null);
            if (baseUse != null) { yield return baseUse; }

            foreach (Assembly assembly in AppDomain.CurrentDomain.GetAssemblies())
            {
                if (assembly.IsDynamic) { continue; }

                Type[] types;
                try
                {
                    types = assembly.GetTypes();
                }
                catch (ReflectionTypeLoadException e)
                {
                    types = e.Types.Where(t => t != null).ToArray();
                }
                catch
                {
                    continue;
                }

                foreach (Type type in types)
                {
                    if (type == null || type == baseType || type.IsAbstract || type.IsInterface) { continue; }
                    if (!baseType.IsAssignableFrom(type)) { continue; }

                    MethodInfo use;
                    try
                    {
                        use = type.GetMethod(nameof(RangedWeapon.Use),
                            BindingFlags.Public | BindingFlags.NonPublic | BindingFlags.Instance | BindingFlags.DeclaredOnly,
                            null, UseParamTypes, null);
                    }
                    catch
                    {
                        continue;
                    }

                    if (use == null || use.IsAbstract) { continue; }
                    yield return use;
                }
            }
        }

        [HarmonyTranspiler]
        static IEnumerable<CodeInstruction> Transpiler(IEnumerable<CodeInstruction> instructions)
        {
            var matcher = new CodeMatcher(instructions);
            var shootMethod = AccessTools.Method(typeof(Projectile), nameof(Projectile.Shoot));

            matcher.MatchStartForward(
                new CodeMatch(OpCodes.Callvirt, shootMethod));

            if (!matcher.IsValid)
            {
                //subclass overrides may call the non-virtual method with 'call' instead of 'callvirt'
                matcher.Start();
                matcher.MatchStartForward(new CodeMatch(OpCodes.Call, shootMethod));
            }

            if (!matcher.IsValid) { return instructions; }

            matcher.Set(OpCodes.Call, DispatchMethod);

            return matcher.InstructionEnumeration();
        }
    }
}
