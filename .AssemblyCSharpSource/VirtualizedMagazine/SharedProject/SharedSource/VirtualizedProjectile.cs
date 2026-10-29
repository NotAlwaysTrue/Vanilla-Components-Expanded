using Barotrauma.Items.Components;
using FarseerPhysics;
using FarseerPhysics.Dynamics;
using System.Reflection.Metadata.Ecma335;
using System.Xml.Linq;
using Voronoi2;

namespace VCE_VirtualizedMagazine
{
    public partial class VirtualizedProjectile : Projectile
    {
        private const string projectileXML = 
            "<Projectile>"+
                "<Attack />"+
            "</Projectile>";
        private static readonly ContentXElement projectileContentXElement = new(null, XElement.Parse(projectileXML));
        public VirtualizedProjectile(Item item, ContentXElement element) : base(item, element) { }

        public void ParseProjectileData(ContentXElement element)
        {
            if (element == null) { element = projectileContentXElement; }

            Attack = null;
            statusEffectLists.Clear();

            foreach (var subElement in element.Elements())
            {
                switch (subElement.Name.ToString().ToLowerInvariant())
                {
                    case "attack":
                        Attack = new Attack(subElement, item.Name + ", Projectile", item);
                        continue;
                    case "statuseffect":
                        LoadStatusEffect(subElement);
                        continue;
                }
            }

            Hitscan = true;
            RemoveOnHit = false;
            HitScanCount = element.GetAttributeInt("hitscancount", 1);
            MaxTargetsToHit = element.GetAttributeInt("maxtargetstohit", 1);

            Spread = element.GetAttributeFloat("spread", 0f);
            StaticSpread = element.GetAttributeBool("staticspread", false);

            FriendlyFire = element.GetAttributeBool("friendlyfire", true);
            DamageDoors = element.GetAttributeBool("damagedoors", false);
            DamageUser = element.GetAttributeBool("damageuser", false);

            GoThroughLightTargets = element.GetAttributeBool("gothroughlighttargets", false);
            LightTargetMassThreshold = element.GetAttributeFloat("lighttargetmassthreshold", -1f);

            ParseProjectileDataClient(element);

            void LoadStatusEffect(ContentXElement subElement)
            {
                var statusEffect = StatusEffect.Load(subElement, item.Name + ", " + GetType().Name);
                if (!statusEffectLists.TryGetValue(statusEffect.type, out List<StatusEffect> effectList))
                {
                    effectList = new List<StatusEffect>();
                    statusEffectLists.Add(statusEffect.type, effectList);
                }
                effectList.Add(statusEffect);
            }
        }


        private readonly List<Body> hits = new List<Body>();
        private readonly List<ISerializableEntity> targets = new List<ISerializableEntity>();
        private Submarine launchSubmarine;

        partial void LaunchProjSpecificClient(Vector2 startLocation, Vector2 endLocation);
        partial void PlayHitSoundClient(ActionType conditionalActionType);
        partial void ParseProjectileDataClient(ContentXElement element);

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

            int hitscanCount = Math.Max(HitScanCount, 1);
            for (int i = 0; i < hitscanCount; i++)
            {
                float launchAngle = StaticSpread
                    ? rotation + MathHelper.ToRadians(i - ((float)(hitscanCount - 1) / 2)) * Spread
                    : rotation + MathHelper.ToRadians(Spread * GetSpreadFromPool());
                spreadIndex++;

                Vector2 launchDir = new Vector2((float)Math.Cos(launchAngle), (float)Math.Sin(launchAngle));
                DoHitscan(rayStart, rayStartWorld, launchDir);
            }

            ApplyStatusEffects(ActionType.OnUse, 1.0f, user: User);
        }

        private void DoHitscan(Vector2 rayStart, Vector2 rayStartWorld, Vector2 dir)
        {
            hits.Clear();

            Vector2 rayEnd = rayStart + dir * 500.0f;
            float worldDist = 1000.0f;
#if CLIENT
            worldDist = Screen.Selected?.Cam?.WorldView.Width ?? GameMain.GraphicsWidth;
#endif
            Vector2 rayEndWorld = rayStartWorld + dir * worldDist;

            List<HitscanResult> results = new List<HitscanResult>();
            results.AddRange(DoRayCast(rayStart, rayEnd, submarine: launchSubmarine));

            if (launchSubmarine != null)
            {
                results.AddRange(DoRayCast(rayStart + launchSubmarine.SimPosition, rayEnd + launchSubmarine.SimPosition, submarine: null));
                RayCastInOtherSubs(rayStart + launchSubmarine.SimPosition, rayEnd + launchSubmarine.SimPosition, results);
            }
            else
            {
                RayCastInOtherSubs(rayStart, rayEnd, results);
            }

            results = results.OrderBy(h => h.Fraction).ToList();

            int hitCount = 0;
            Vector2 endWorldPos = rayEndWorld;
            for (int i = 0; i < results.Count; i++)
            {
                var h = results[i];
                Vector2 hitWorldPos = ConvertUnits.ToDisplayUnits(h.Point) + (h.Submarine?.Position ?? Vector2.Zero);
                if (HandleProjectileCollision(h.Fixture, hitWorldPos))
                {
                    hitCount++;
                    endWorldPos = hitWorldPos;
                    if (hitCount >= MaxTargetsToHit || i == results.Count - 1) { break; }
                }
            }

            LaunchProjSpecificClient(rayStartWorld, endWorldPos);
        }

        private void RayCastInOtherSubs(Vector2 rayStart, Vector2 rayEnd, List<HitscanResult> results)
        {
            foreach (Submarine submarine in Submarine.Loaded)
            {
                if (submarine == launchSubmarine) { continue; }

                var inSubHits = DoRayCast(rayStart - submarine.SimPosition, rayEnd - submarine.SimPosition, submarine);
                for (int i = 0; i < inSubHits.Count; i++)
                {
                    inSubHits[i] = new HitscanResult(inSubHits[i].Fixture, inSubHits[i].Point + submarine.SimPosition,
                        inSubHits[i].Normal, inSubHits[i].Fraction, sub: null);
                }
                results.AddRange(inSubHits);
            }
        }

        private List<HitscanResult> DoRayCast(Vector2 rayStart, Vector2 rayEnd, Submarine submarine)
        {
            List<HitscanResult> rayHits = new List<HitscanResult>();

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
                    if (fixture.Body.UserData is Limb limb && limb.character?.Submarine != submarine) { return -1; }
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

        private bool HandleProjectileCollision(Fixture target, Vector2 worldPosition)
        {
            if (User != null && User.Removed) { User = null; }
            if (IgnoredBodies != null && IgnoredBodies.Contains(target.Body)) { return false; }
            if (target.CollisionCategories == Physics.CollisionCharacter && target.Body.UserData is Character) { return false; }

            Character character = null;

            if (target.Body.UserData is Submarine && target.UserData is not Barotrauma.Item)
            {
                return false;
            }
            else if (target.Body.UserData is Limb limb)
            {
                if (limb.IsSevered || limb.character == null || limb.character.Removed) { return false; }
                if (ShouldIgnoreCharacterCollision(limb.character)) { return false; }

                limb.character.LastDamageSource = Item;
                if (Attack != null) { Attack.DoDamageToLimb(User ?? Attacker, limb, worldPosition, 1.0f); }
                character = limb.character;
            }
            else if ((target.Body.UserData as Item ?? (target.Body.UserData as ItemComponent)?.Item ?? target.UserData as Item) is Item targetItem)
            {
                if (targetItem.Removed) { return false; }
                if (target.UserData is Barotrauma.Item && targetItem.Submarine != null && targetItem.Submarine == Launcher?.Submarine) { return false; }

                if (Attack != null &&
                    (targetItem.Prefab.DamagedByProjectiles || (DamageDoors && targetItem.GetComponent<Door>() != null)) &&
                    targetItem.Condition > 0)
                {
                    Attack.DoDamage(User ?? Attacker, targetItem, worldPosition, 1.0f);
                }
            }
            else if (target.Body.UserData is IDamageable damageable)
            {
                if (Attack != null)
                {
                    Attack.DoDamage(User ?? Attacker, damageable, worldPosition, 1.0f);
                }
            }
            else if (target.Body.UserData is VoronoiCell voronoiCell && voronoiCell.IsDestructible &&
                     Attack != null && Math.Abs(Attack.LevelWallDamage) > 0.0f)
            {
                if (Level.Loaded?.ExtraWalls.Find(w => w.Body == target.Body) is DestructibleLevelWall destructibleWall)
                {
                    Attack.DoDamage(User ?? Attacker, destructibleWall, worldPosition, 1.0f);
                }
            }

            if (character != null) { character.LastDamageSource = Item; }

            ActionType conditionalActionType = ActionType.OnSuccess;
            if (User != null && Rand.Range(0.0f, 0.5f) > DegreeOfSuccess(User))
            {
                conditionalActionType = ActionType.OnFailure;
            }

            PlayHitSoundClient(conditionalActionType);

            if (GameMain.NetworkMember == null || GameMain.NetworkMember.IsServer)
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
                            if (effect.type != ActionType.OnImpact) { continue; }

                            if (effect.HasTargetType(StatusEffect.TargetType.This))
                            {
                                effect.Apply(effect.type, 1.0f, User, User);
                            }
                            if (effect.HasTargetType(StatusEffect.TargetType.Character) || effect.HasTargetType(StatusEffect.TargetType.UseTarget))
                            {
                                effect.Apply(effect.type, 1.0f, targetLimb.character, targetLimb.character);
                            }
                            if (effect.HasTargetType(StatusEffect.TargetType.Limb))
                            {
                                effect.Apply(effect.type, 1.0f, targetLimb.character, targetLimb);
                            }
                            if (effect.HasTargetType(StatusEffect.TargetType.NearbyItems) ||
                                effect.HasTargetType(StatusEffect.TargetType.NearbyCharacters))
                            {
                                targets.Clear();
                                effect.AddNearbyTargets(targetLimb.WorldPosition, targets);
                                effect.Apply(effect.type, 1.0f, targetLimb.character, targets);
                            }
                        }
                    }

                    if (GameMain.NetworkMember is { IsServer: true } server)
                    {
                        server.CreateEntityEvent(Item, new Item.ApplyStatusEffectEventData(conditionalActionType, this, targetLimb.character, targetLimb, useTarget: targetLimb.character, worldPosition));
                        server.CreateEntityEvent(Item, new Item.ApplyStatusEffectEventData(ActionType.OnImpact, this, targetLimb.character, targetLimb, useTarget: targetLimb.character, worldPosition));
                    }
                }
                else
                {
                    ApplyStatusEffects(conditionalActionType, 1.0f, useTarget: target.Body.UserData as Entity, user: User, worldPosition: worldPosition);
                    ApplyStatusEffects(ActionType.OnImpact, 1.0f, useTarget: target.Body.UserData as Entity, user: User, worldPosition: worldPosition);

                    if (GameMain.NetworkMember is { IsServer: true } server)
                    {
                        server.CreateEntityEvent(Item, new Item.ApplyStatusEffectEventData(conditionalActionType, this, useTarget: target.Body.UserData as Entity, worldPosition: worldPosition));
                        server.CreateEntityEvent(Item, new Item.ApplyStatusEffectEventData(ActionType.OnImpact, this, useTarget: target.Body.UserData as Entity, worldPosition: worldPosition));
                    }
                }
            }

            hits.Add(target.Body);
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

            int hitscanCount = Math.Max(HitScanCount, 1);
            for (int i = 0; i < hitscanCount; i++)
            {
                float launchAngle = StaticSpread
                    ? initialRotation + MathHelper.ToRadians(i - ((float)(hitscanCount - 1) / 2)) * Spread
                    : initialRotation + MathHelper.ToRadians(Spread * GetSpreadFromPool());

                Vector2 launchDir = new Vector2((float)Math.Cos(launchAngle), (float)Math.Sin(launchAngle));
                DoHitscan(rayStart, rayStartWorld, launchDir);
            }

            User = character;
            ApplyStatusEffects(ActionType.OnUse, 1.0f, User, user: User);
            return true;
        }
    }
}
