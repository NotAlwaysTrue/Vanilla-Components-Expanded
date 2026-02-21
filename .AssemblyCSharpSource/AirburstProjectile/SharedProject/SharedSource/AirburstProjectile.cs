using Barotrauma.Networking;
using FarseerPhysics;
using FarseerPhysics.Dynamics;
using FarseerPhysics.Dynamics.Contacts;
using FarseerPhysics.Dynamics.Joints;
using Microsoft.Xna.Framework;
using System;
using System.Collections.Generic;
using System.Collections.Immutable;
using System.Linq;
using Voronoi2;

namespace Barotrauma.Items.Components
{
    partial class AirburstProjectile : Projectile
    {
        /// <summary>
        /// Spread of fuse settings, in distance, format in Vector2 (Positive, Nagetive)
        /// </summary>
        public Vector2 FuseSpread;

        public float TargetRange;

        public AirburstProjectile(Item item, ContentXElement element)
        : base(item, element)
        {
            Hitscan = false;
            FuseSpread = element.GetAttributeVector2("FuseSpread",new Vector2(0, 0));
        }

        public new void Shoot(Character user, Vector2 weaponPos, Vector2 spawnPos, float rotation, List<Body> ignoredBodies, bool createNetworkEvent, float damageMultiplier = 1f, float launchImpulseModifier = 0f)
        {
            base.Shoot(user, weaponPos, spawnPos, rotation, ignoredBodies, createNetworkEvent, damageMultiplier, launchImpulseModifier);
            ShootProjSpecific();
        }

        partial void ShootProjSpecific();
    }
}