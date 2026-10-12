using Barotrauma.Items.Components;
using FarseerPhysics;
using Microsoft.Xna.Framework.Graphics;

namespace VoidShield
{
    public partial class VoidShield : IDrawableComponent
    {
        private Sprite? sprite;

        public Vector2 Size { get; set; }

        public Vector2 DrawSize => Size;

        public bool AlwaysDraw { get; set; }

        partial void InitProjSpecific(ContentXElement element)
        {
            foreach (ContentXElement subElement in element.Elements())
            {
                string textureDir = GetTextureDirectory(subElement);
                switch (subElement.Name.ToString().ToLowerInvariant())
                {
                    case "sprite":
                        sprite = new Sprite(subElement, path: textureDir);
                        Drawable = true;
                        break;
                }
            }

            Size = element.GetAttributeVector2("size", Vector2.One);
            AlwaysDraw = element.GetAttributeBool("alwaysdraw", false);
        }

        public void Draw(SpriteBatch spriteBatch, bool editing, float itemDepth = -1f, Color? overrideColor = null)
        {
            DrawSprite(spriteBatch, GetDrawPosition(), Item.RotationRad, itemDepth, overrideColor);

            if (GameMain.DebugDraw)
            {
                DebugDrawCollider(spriteBatch);
            }
        }
        internal void DebugDrawCollider(SpriteBatch spriteBatch)
        {
            if (collider == null) { return; }
            collider.Submarine = Item.Submarine;
            collider.SetTransformIgnoreContacts(GetColliderSimPosition(), Item.RotationRad);
            collider.UpdateDrawPosition(interpolate: false);
            collider.DebugDraw(spriteBatch, ShieldActive ? Color.Lime : Color.Red * 0.75f, forceColor: true);
        }

        internal void DrawSprite(SpriteBatch spriteBatch, Vector2 drawPos, float spriteRotation, float depth, Color? overrideColor)
        {
            if (sprite == null || !ShieldActive) { return; }

            Vector2 offset = Vector2.Transform(Offset, Matrix.CreateRotationZ(spriteRotation));
            Vector2 position = new Vector2(drawPos.X + offset.X, -(drawPos.Y + offset.Y));

            sprite.Draw(spriteBatch, position, overrideColor ?? Color.White, sprite.Origin, spriteRotation, Item.Scale, SpriteEffects.None, depth >= 0f ? depth : sprite.Depth);
        }

        private Item? offsetContainer;
        private Vector2 localContainerOffset;

        internal void CaptureContainerOffset(Item container)
        {
            PhysicsBody? containerBody = container.body;
            if (containerBody == null) { offsetContainer = null; return; }
            localContainerOffset = Vector2.Transform(Item.SimPosition - containerBody.SimPosition, Matrix.CreateRotationZ(-containerBody.Rotation));
            offsetContainer = container;
        }

        internal static bool ContainerDrawsItsContents(Item container)
        {
            if (container.GetComponent<ItemContainer>() is { HideItems: true }) { return false; }
            PhysicsBody? body = container.body;
            return body == null || body.Enabled;
        }

        private Vector2 GetDrawPosition()
        {
            if (Item.Container == null || !ReferenceEquals(offsetContainer, Item.RootContainer)) { return Item.DrawPosition; }

            PhysicsBody? body = offsetContainer!.body;
            if (body == null || body.Removed) { return Item.DrawPosition; }
            if (ContainerDrawsItsContents(offsetContainer)) { return Item.DrawPosition; }

            Vector2 simPosition = body.SimPosition + Vector2.Transform(localContainerOffset, Matrix.CreateRotationZ(body.Rotation));
            Vector2 drawPosition = ConvertUnits.ToDisplayUnits(simPosition);
            if (offsetContainer.Submarine != null) { drawPosition += offsetContainer.Submarine.DrawPosition; }
            return drawPosition;
        }
    }
}