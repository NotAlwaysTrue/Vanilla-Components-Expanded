using Barotrauma.Items.Components;
using FarseerPhysics;
using FarseerPhysics.Dynamics;
using Voronoi2;

namespace VCE_VirtualizedMagazine
{
    public partial class VirtualizedProjectile : Projectile
    {
        public VirtualizedProjectile(Item item, ContentXElement element) : base(item, element) { }

        private Identifier ammoIdentifier;
#if SERVER
        private uint shotSequence;
#endif

        public void ParseProjectileData(ContentXElement? element) =>
            ParseProjectileData(ProjectilePrefab.Get(element), element?.Parent?.GetAttributeIdentifier("identifier", Identifier.Empty) ?? Identifier.Empty);

        internal void ParseProjectileData(ContentXElement? element, Identifier ammo) =>
            ParseProjectileData(ProjectilePrefab.Get(element), ammo);

        /// <summary>Parses/loads the data of an ammo item identifier (resolved through <see cref="ProjectilePrefab.Find"/>).</summary>
        internal void ParseProjectileData(Identifier ammo) =>
            ParseProjectileData(ProjectilePrefab.Find(ammo), ammo);

        /// <summary>
        /// Applies the parsed prefab to this component. Only values are copied here: the XML is parsed once per ammo
        /// type by <see cref="ProjectilePrefab"/>, and the stateful parts (attack, status effects) once per item.
        /// </summary>
        private void ParseProjectileData(ProjectilePrefab prefab, Identifier ammo)
        {
            ammoIdentifier = ammo;

            var data = prefab.For(item);

            // Parsing used to build a fresh Attack, so the XML's own multiplier was in effect until the next shot.
            if (data.Attack != null) { data.Attack.DamageMultiplier = data.BaseDamageMultiplier; }
            Attack = data.Attack;
            statusEffectLists.Clear();
            foreach (var (type, effects) in data.StatusEffects)
            {
                statusEffectLists[type] = effects;
            }

            Hitscan = true;
            RemoveOnHit = false;
            HitScanCount = prefab.HitScanCount;
            MaxTargetsToHit = prefab.MaxTargetsToHit;

            Spread = prefab.Spread;
            StaticSpread = prefab.StaticSpread;

            FriendlyFire = prefab.FriendlyFire;
            DamageDoors = prefab.DamageDoors;
            DamageUser = prefab.DamageUser;

            GoThroughLightTargets = prefab.GoThroughLightTargets;
            LightTargetMassThreshold = prefab.LightTargetMassThreshold;

            ParseProjectileDataClient(prefab);
        }


        private readonly HashSet<Limb> hitLimbs = new();
        private readonly List<ISerializableEntity> targets = new List<ISerializableEntity>();
        private Submarine launchSubmarine;

        partial void PlayHitSoundClient(ActionType conditionalActionType);
        partial void ParseProjectileDataClient(ProjectilePrefab prefab);

        public new void Shoot(Character user, Vector2 weaponPos, Vector2 spawnPos, float rotation, List<Body> ignoredBodies,
            bool createNetworkEvent, float damageMultiplier = 1f, float launchImpulseModifier = 0f)
        {
            if (item.body == null) { return; }

            IgnoredBodies = ignoredBodies;

            Vector2 rayStart = spawnPos;
            if (Submarine.PickBody(weaponPos, spawnPos, IgnoredBodies,
                    Physics.CollisionWall | Physics.CollisionLevel | Physics.CollisionItemBlocking,
                    customPredicate: (Fixture f) => IgnoredBodies == null || !IgnoredBodies.Contains(f.Body)) != null)
            {
                rayStart = weaponPos;
            }

            User = user;

            if (Attack != null) { Attack.DamageMultiplier = damageMultiplier; }
            foreach (var statusEffect in Item.GetStatusEffectsOfType(ActionType.OnImpact))
            {
                foreach (var explosion in statusEffect.Explosions)
                {
                    explosion.Attack.DamageMultiplier = damageMultiplier;
                }
            }

            launchSubmarine = Launcher?.Submarine ?? item.Submarine;
            Vector2 rayStartWorld = ConvertUnits.ToDisplayUnits(rayStart) + (launchSubmarine?.Position ?? Vector2.Zero);
            float? rewindTime = PrepareLagCompensation(user);

            // RangedWeapon predicts its own shots; explicit network launches play back on every client.
            FireRays(rayStart, rayStartWorld, rotation, rewindTime, advanceSpread: true, predictedBy: createNetworkEvent ? null : user);

            ApplyStatusEffects(ActionType.OnUse, 1.0f, user: User);
        }

        private static float? PrepareLagCompensation(Character? shooter)
        {
#if SERVER
            if (shooter != null && GameMain.Server is { } server &&
                server.ServerSettings.MaxLagCompensationSeconds > 0 &&
                server.ConnectedClients.FirstOrDefault(client => client.Character == shooter) is { } owner)
            {
                Limb.SetLagCompensatedBodyPositions(owner);
                return (float)Timing.TotalTime - Math.Min(owner.Ping / 2000f, server.ServerSettings.MaxLagCompensationSeconds);
            }
#endif
            return null;
        }

        private TracePrediction lastPrediction;
        private double lastPredictionTime = double.NegativeInfinity;

        private TracePrediction NextPrediction(Character shooter)
        {
#if SERVER
            ushort input = shooter.LastProcessedID;
#else
            // UpdateNetInput already sent the previous controls. ControlLocalPlayer's current
            // trigger is sampled into the next input, which the server consumes as LastProcessedID.
            ushort input = unchecked((ushort)(shooter.LastNetworkUpdateID + 1));
#endif
            // The 16-bit input ID can wrap back to the same value after a long idle period.
            bool sameInput = lastPrediction.ShooterId == shooter.ID && lastPrediction.InputId == input &&
                Timing.TotalTime - lastPredictionTime < TracePrediction.RetentionSeconds;
            lastPrediction = new TracePrediction { ShooterId = shooter.ID, InputId = input, Volley = sameInput ? lastPrediction.Volley + 1 : 0 };
            lastPredictionTime = Timing.TotalTime;
            return lastPrediction;
        }

        private void FireRays(Vector2 rayStart, Vector2 rayStartWorld, float rotation, float? rewindTime,
            bool advanceSpread, Character? predictedBy)
        {
            int count = Math.Max(HitScanCount, 1);
#if SERVER
            // The reusable projectile may already describe the next round when this shot is received.
            var round = new FiredRound { Ammo = ammoIdentifier, ProjectileId = item.ID, Sequence = ++shotSequence };
            TracePrediction? prediction = predictedBy == null ? null : NextPrediction(predictedBy);
            Vector2[]? ends = !round.Ammo.IsEmpty && GameMain.Server is { ConnectedClients.Count: > 0 }
                ? new Vector2[Math.Min(count, VirtualShotTrace.MaxRays)] : null;
#else
            FiredRound round = default;
            var emitters = particleEmitters;
            bool isOwner = predictedBy != null && predictedBy == Character.Controlled;
            TracePrediction? prediction = GameMain.Client != null && isOwner ? NextPrediction(predictedBy!) : null;
            bool draw = emitters.Length > 0 && (GameMain.Client == null || ammoIdentifier.IsEmpty || isOwner);
            int nextRayToDraw = 0;
#endif
            for (int i = 0; i < count; i++)
            {
                float angle = StaticSpread
                    ? rotation + MathHelper.ToRadians(i - (count - 1) / 2f) * Spread
                    : rotation + MathHelper.ToRadians(Spread * GetSpreadFromPool());
                if (advanceSpread) { spreadIndex++; }
                var dir = new Vector2((float)Math.Cos(angle), (float)Math.Sin(angle));
                Vector2 end = DoHitscan(rayStart, rayStartWorld, dir, rewindTime, round);
#if SERVER
                if (ends == null) { continue; }
                int index = i % VirtualShotTrace.MaxRays;
                ends[index] = end;
                if (index + 1 == ends.Length)
                {
                    VirtualShotNetwork.SendTrace(round, rayStartWorld, ends, i - index, prediction);
                    int remaining = count - i - 1;
                    if (remaining > 0 && remaining < ends.Length) { ends = new Vector2[remaining]; }
                }
#else
                if (!draw) { continue; }
                if (prediction is { } key && i % VirtualShotTrace.MaxRays == 0)
                {
                    int pageSize = Math.Min(count - i, VirtualShotTrace.MaxRays);
                    nextRayToDraw = i + OwnerTraceHistory.Claim(item.ID, key, i, pageSize);
                }
                if (i >= nextRayToDraw) { DrawTrace(emitters, rayStartWorld, end); }
#endif
            }
        }

        private Vector2 DoHitscan(Vector2 rayStart, Vector2 rayStartWorld, Vector2 dir, float? rewindTime, FiredRound round)
        {
            hitLimbs.Clear();

            Vector2 rayEnd = rayStart + dir * 500.0f;
            float worldDist = 1000.0f;
#if CLIENT
            worldDist = Screen.Selected?.Cam?.WorldView.Width ?? GameMain.GraphicsWidth;
#endif
            Vector2 rayEndWorld = rayStartWorld + dir * worldDist;

            List<HitscanResult> results = new List<HitscanResult>();
            results.AddRange(DoRayCast(rayStart, rayEnd, launchSubmarine, rewindTime));

            if (launchSubmarine != null)
            {
                results.AddRange(DoRayCast(rayStart + launchSubmarine.SimPosition, rayEnd + launchSubmarine.SimPosition, null, rewindTime));
                RayCastInOtherSubs(rayStart + launchSubmarine.SimPosition, rayEnd + launchSubmarine.SimPosition, results, rewindTime);
            }
            else
            {
                RayCastInOtherSubs(rayStart, rayEnd, results, rewindTime);
            }

            results = results.OrderBy(h => h.Fraction).ToList();

            int hitCount = 0;
            Vector2 endWorldPos = rayEndWorld;
            for (int i = 0; i < results.Count; i++)
            {
                var h = results[i];
                Vector2 hitWorldPos = ConvertUnits.ToDisplayUnits(h.Point) + (h.Submarine?.Position ?? Vector2.Zero);
                if (HandleProjectileCollision(h.Fixture, hitWorldPos, round))
                {
                    hitCount++;
                    endWorldPos = hitWorldPos;
                    if (hitCount >= MaxTargetsToHit || i == results.Count - 1) { break; }
                }
            }

            return endWorldPos;
        }

        private void RayCastInOtherSubs(Vector2 rayStart, Vector2 rayEnd, List<HitscanResult> results, float? rewindTime)
        {
            foreach (Submarine submarine in Submarine.Loaded)
            {
                if (submarine == launchSubmarine) { continue; }

                var inSubHits = DoRayCast(rayStart - submarine.SimPosition, rayEnd - submarine.SimPosition, submarine, rewindTime);
                for (int i = 0; i < inSubHits.Count; i++)
                {
                    inSubHits[i] = new HitscanResult(inSubHits[i].Fixture, inSubHits[i].Point + submarine.SimPosition,
                        inSubHits[i].Normal, inSubHits[i].Fraction, sub: null);
                }
                results.AddRange(inSubHits);
            }
        }

        private List<HitscanResult> DoRayCast(Vector2 rayStart, Vector2 rayEnd, Submarine? submarine, float? rewindTime)
        {
            List<HitscanResult> rayHits = new List<HitscanResult>();

            bool CanHitLimb(Fixture fixture)
            {
                if (fixture.Body.UserData is not Limb limb) { return true; }
                if (limb.character?.Submarine != submarine) { return false; }
#if SERVER
                if (fixture.CollisionCategories == Physics.CollisionLagCompensationBody)
                {
                    // Vanilla leaves the previous ghost transform in place when it skips a limb.
                    return rewindTime is float time && limb.body.Enabled && !limb.IgnoreCollisions &&
                        limb.MemState.TryPeek(out var oldest) && oldest.Timestamp <= time;
                }
#endif
                return true;
            }

            Vector2 dir = rayEnd - rayStart;
            dir = dir.LengthSquared() < 0.00001f ? Vector2.UnitY : Vector2.Normalize(dir);

            var aabb = new FarseerPhysics.Collision.AABB(rayStart - Vector2.One * 0.001f, rayStart + Vector2.One * 0.001f);
            GameMain.World.QueryAABB((fixture) =>
            {
                if (fixture?.Body.UserData is LevelObject levelObj)
                {
                    if (!levelObj.Prefab.TakeLevelWallDamage) { return true; }
                }
                else if (fixture?.Body == null || fixture.IsSensor)
                {
                    return true;
                }
                if (fixture.Body.UserData is VineTile) { return true; }
                if (fixture.CollidesWith == Category.None) { return true; }
                if (!CanHitLimb(fixture)) { return true; }
                if (fixture.Body.UserData as string == "ruinroom" || fixture.Body.UserData is Hull || fixture.UserData is Hull) { return true; }

                if (submarine != null)
                {
                    if (fixture.Body.UserData is VoronoiCell) { return true; }
                    if (fixture.Body.UserData is Entity entity && entity.Submarine != submarine) { return true; }
                }

                if (fixture.Body.UserData is VoronoiCell && (launchSubmarine != null || submarine != null)) { return true; }

                if (fixture.Body.UserData is Item hitItem)
                {
                    if (hitItem == Item) { return true; }
                    if (hitItem.Condition <= 0) { return true; }
                    if (!hitItem.Prefab.DamagedByProjectiles && hitItem.GetComponent<Door>() == null) { return true; }
                }
                else if (fixture.Body.UserData is Gap)
                {
                    return true;
                }
                else if (fixture.Body.UserData is Holdable { CanPush: false })
                {
                    return true;
                }
                else
                {
                    if (!fixture.CollisionCategories.HasFlag(Physics.CollisionCharacter) &&
                        !fixture.CollisionCategories.HasFlag(Physics.CollisionWall) &&
                        !fixture.CollisionCategories.HasFlag(Physics.CollisionLevel)) { return true; }
                }

                fixture.Body.GetTransform(out FarseerPhysics.Common.Transform transform);
                if (!fixture.Shape.TestPoint(ref transform, ref rayStart)) { return true; }

                rayHits.Add(new HitscanResult(fixture, rayStart, -dir, 0.0f, submarine));
                return true;
            }, ref aabb);

            GameMain.World.RayCast((fixture, point, normal, fraction) =>
            {
                if (fixture?.Body.UserData is LevelObject levelObj)
                {
                    if (!levelObj.Prefab.TakeLevelWallDamage) { return -1; }
                }
                else if (fixture?.Body == null || fixture.IsSensor)
                {
                    return -1;
                }

                if (fixture.Body.UserData is VineTile) { return -1; }
                if (fixture.CollidesWith == Category.None && fixture.CollisionCategories != Physics.CollisionLagCompensationBody) { return -1; }
                if (!CanHitLimb(fixture)) { return -1; }
                if (fixture.Body.UserData is Item hitItem)
                {
                    if (hitItem.Condition <= 0) { return -1; }
                    if (!hitItem.Prefab.DamagedByProjectiles && hitItem.GetComponent<Door>() == null) { return -1; }
                }
                else if (fixture.Body.UserData is Gap)
                {
                    return -1;
                }
                if (fixture.Body.UserData as string == "ruinroom" || fixture.Body?.UserData is Hull || fixture.UserData is Hull) { return -1; }

                if (submarine != null)
                {
                    if (fixture.Body.UserData is VoronoiCell) { return -1; }
                    if (fixture.Body.UserData is Entity entity && entity.Submarine != submarine) { return -1; }
                    if (fixture.Body == Level.Loaded?.TopBarrier || fixture.Body == Level.Loaded?.BottomBarrier) { return -1; }
                }

                if (fixture.Body.UserData is Holdable { CanPush: false }) { return -1; }

                if (fixture.Body.UserData is VoronoiCell)
                {
                    if (Hull.FindHull(ConvertUnits.ToDisplayUnits(point), Item.CurrentHull) != null && launchSubmarine != null)
                    {
                        return -1;
                    }
                }

                if (rayHits.Count > 50)
                {
                    float furthestHit = 0.0f;
                    int furthestHitIndex = -1;
                    for (int i = 0; i < rayHits.Count; i++)
                    {
                        if (rayHits[i].Fraction > furthestHit)
                        {
                            furthestHitIndex = i;
                            furthestHit = rayHits[i].Fraction;
                        }
                    }
                    if (furthestHitIndex > -1) { rayHits.RemoveAt(furthestHitIndex); }
                }

                rayHits.Add(new HitscanResult(fixture, point, normal, fraction, submarine));
                return 1;
            }, rayStart, rayEnd,
            Physics.CollisionCharacter | Physics.CollisionWall | Physics.CollisionLevel | Physics.CollisionItemBlocking |
            Physics.CollisionProjectile | Physics.CollisionLagCompensationBody);

            return rayHits;
        }

        private bool HandleProjectileCollision(Fixture target, Vector2 worldPosition, FiredRound round)
        {
            if (User != null && User.Removed) { User = null; }
            if (IgnoredBodies != null && IgnoredBodies.Contains(target.Body)) { return false; }
            if (target.CollisionCategories == Physics.CollisionCharacter && target.Body.UserData is Character) { return false; }

            bool isAuthoritative = GameMain.NetworkMember == null || GameMain.NetworkMember.IsServer;
            Character character = null;

            if (target.Body.UserData is Submarine && target.UserData is not Barotrauma.Item)
            {
                return false;
            }
            else if (target.Body.UserData is Limb limb)
            {
                if (limb.IsSevered || limb.character == null || limb.character.Removed) { return false; }
                if (ShouldIgnoreCharacterCollision(limb.character)) { return false; }
                if (!hitLimbs.Add(limb)) { return false; }

                if (isAuthoritative)
                {
                    limb.character.LastDamageSource = Item;
                    Attack?.DoDamageToLimb(User ?? Attacker, limb, worldPosition, 1.0f);
                }
                character = limb.character;
            }
            else if ((target.Body.UserData as Item ?? (target.Body.UserData as ItemComponent)?.Item ?? target.UserData as Item) is Item targetItem)
            {
                if (targetItem.Removed) { return false; }
                if (target.UserData is Barotrauma.Item && targetItem.Submarine != null && targetItem.Submarine == Launcher?.Submarine) { return false; }

                if (isAuthoritative && Attack != null &&
                    (targetItem.Prefab.DamagedByProjectiles || (DamageDoors && targetItem.GetComponent<Door>() != null)) &&
                    targetItem.Condition > 0)
                {
                    Attack.DoDamage(User ?? Attacker, targetItem, worldPosition, 1.0f);
                }
            }
            else if (target.Body.UserData is IDamageable damageable)
            {
                if (isAuthoritative && Attack != null)
                {
                    Attack.DoDamage(User ?? Attacker, damageable, worldPosition, 1.0f);
                }
            }
            else if (isAuthoritative && target.Body.UserData is VoronoiCell voronoiCell && voronoiCell.IsDestructible &&
                     Attack != null && Math.Abs(Attack.LevelWallDamage) > 0.0f)
            {
                if (Level.Loaded?.ExtraWalls.Find(w => w.Body == target.Body) is DestructibleLevelWall destructibleWall)
                {
                    Attack.DoDamage(User ?? Attacker, destructibleWall, worldPosition, 1.0f);
                }
            }

            if (isAuthoritative && character != null) { character.LastDamageSource = Item; }

            ActionType conditionalActionType = ActionType.OnSuccess;
            if (User != null && Rand.Range(0.0f, 0.5f) > DegreeOfSuccess(User))
            {
                conditionalActionType = ActionType.OnFailure;
            }

            PlayHitSoundClient(conditionalActionType);

            if (isAuthoritative)
            {
                if (target.Body.UserData is Limb targetLimb)
                {
                    ApplyStatusEffects(conditionalActionType, 1.0f, character, targetLimb, useTarget: character, user: User, worldPosition: worldPosition);
                    ApplyStatusEffects(ActionType.OnImpact, 1.0f, character, targetLimb, useTarget: character, user: User, worldPosition: worldPosition);

                    var targetAttack = targetLimb.attack;
                    if (targetAttack != null)
                    {
                        foreach (var effect in targetAttack.StatusEffects)
                        {
                            if (effect.Type != ActionType.OnImpact) { continue; }

                            if (effect.HasTargetType(StatusEffect.TargetType.This))
                            {
                                effect.Apply(effect.Type, 1.0f, User, User);
                            }
                            if (effect.HasTargetType(StatusEffect.TargetType.Character) || effect.HasTargetType(StatusEffect.TargetType.UseTarget))
                            {
                                effect.Apply(effect.Type, 1.0f, targetLimb.character, targetLimb.character);
                            }
                            if (effect.HasTargetType(StatusEffect.TargetType.Limb))
                            {
                                effect.Apply(effect.Type, 1.0f, targetLimb.character, targetLimb);
                            }
                            if (effect.HasTargetType(StatusEffect.TargetType.NearbyItems) ||
                                effect.HasTargetType(StatusEffect.TargetType.NearbyCharacters))
                            {
                                targets.Clear();
                                effect.AddNearbyTargets(targetLimb.WorldPosition, targets);
                                effect.Apply(effect.Type, 1.0f, targetLimb.character, targets);
                            }
                        }
                    }
                }
                else
                {
                    ApplyStatusEffects(conditionalActionType, 1.0f, useTarget: target.Body.UserData as Entity, user: User, worldPosition: worldPosition);
                    ApplyStatusEffects(ActionType.OnImpact, 1.0f, useTarget: target.Body.UserData as Entity, user: User, worldPosition: worldPosition);
                }
#if SERVER
                if (GameMain.Server is { } server)
                {
                    var limb = target.Body.UserData as Limb;
                    var useTarget = limb?.character ?? target.Body.UserData as Entity;
                    if (!round.Ammo.IsEmpty)
                    {
                        VirtualShotNetwork.SendImpact(round, conditionalActionType, limb, useTarget, worldPosition);
                    }
                    else
                    {
                        // Anonymous projectile XML supplied by other mods has no prefab to resolve on clients.
                        server.CreateEntityEvent(Item, new Item.ApplyStatusEffectEventData(conditionalActionType, this, limb?.character, limb, useTarget, worldPosition));
                        server.CreateEntityEvent(Item, new Item.ApplyStatusEffectEventData(ActionType.OnImpact, this, limb?.character, limb, useTarget, worldPosition));
                    }
                }
#endif
            }

            return true;
        }

        private bool ShouldIgnoreCharacterCollision(Character character)
        {
            if (item.GetComponent<Controller>() is { } controller && controller.User == character &&
                controller.IsAttachedUser(controller.User))
            {
                return true;
            }
            if (!FriendlyFire && User != null && character.IsFriendly(User))
            {
                return true;
            }
            return false;
        }

        public override bool Use(float deltaTime, Character character = null) => Use(character, 0f);

        public new bool Use(Character character = null, float launchImpulseModifier = 0f)
        {
            if (character != null && !characterUsable) { return false; }
            if (item.body == null) { return false; }
            if (StickTarget != null || IsActive) { return false; }

            _ = launchImpulseModifier;

            float initialRotation = item.body.Rotation;
            if (item.body.Dir < 0 && item.ParentInventory is not ItemInventory)
            {
                initialRotation -= MathHelper.Pi;
            }

            launchSubmarine = Launcher?.Submarine ?? item.Submarine ?? item.body.Submarine;
            Vector2 rayStart = item.SimPosition;
            Vector2 rayStartWorld = ConvertUnits.ToDisplayUnits(rayStart) + (launchSubmarine?.Position ?? Vector2.Zero);
            float? rewindTime = PrepareLagCompensation(character);

            FireRays(rayStart, rayStartWorld, initialRotation, rewindTime, advanceSpread: false, predictedBy: null);

            User = character;
            ApplyStatusEffects(ActionType.OnUse, 1.0f, User, user: User);
            return true;
        }
    }
}
