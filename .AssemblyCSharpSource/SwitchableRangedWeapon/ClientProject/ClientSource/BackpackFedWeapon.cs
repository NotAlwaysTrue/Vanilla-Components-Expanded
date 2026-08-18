using Barotrauma.Items.Components;
using Microsoft.Xna.Framework.Graphics;
using System;
using System.Collections.Generic;
using System.Linq;
namespace SRW
{
    public partial class BackpackFedWeapon
    {
        partial void LaunchProjSpecific()
        {
            base.LaunchProjSpecific();
        }

        public override void DrawHUD(SpriteBatch spriteBatch, Character character)
        {
            BaseDrawHUD(spriteBatch, character);
            if (character == null || !character.IsKeyDown(InputType.Aim) || !character.CanAim || (character.ViewTarget is Item item && item.Prefab.FocusOnSelected) || !character.HeldItems.Contains(base.item)) { return; }
            Color TextColor = Color.White;
            Vector2 FireModePos = new Vector2(crosshairPos.X - 60, crosshairPos.Y - 80);
            Vector2 SelectedPos = new Vector2(crosshairPos.X + 40, crosshairPos.Y - 80);

            string localtag = null;
            LocalizedString localstr = null;
            if (maxfiremodeselectable > 1)
            {
                localtag = switchableFiremodes.ElementAt(currentFireModeSelected).ToString();
                localstr = TextManager.Get(localtag).Fallback(localtag);
                GUI.DrawString(spriteBatch, FireModePos, localstr, TextColor, forceUpperCase: ForceUpperCase.Yes);
            }
            if (allowedSelfContainerIndex.Count > 0 && CurrentSlotIndex < allowedSelfContainerIndex.Count)
            {
                localstr = TextManager.Get("SwitchableWeapon.SelfContainer#" + CurrentSlotIndex).Fallback(CurrentSlotIndex.ToString());
            }
            else
            {
                localstr = TextManager.Get("SwitchableWeapon.SlotIndex#" + (CurrentSlotIndex - allowedSelfContainerIndex.Count).ToString()).Fallback((CurrentSlotIndex).ToString());
            }
            GUI.DrawString(spriteBatch, SelectedPos, localstr, TextColor, forceUpperCase: ForceUpperCase.Yes);

        }

        public override void UpdateHUDComponentSpecific(Character character, float deltaTime, Camera cam)
        {
            base.UpdateHUDComponentSpecific(character, deltaTime, cam);
            UpdateUserInput(character);
        }

        private new void UpdateUserInput(Character character)
        {
            base.UpdateUserInput(character);
            if (character == null || Character.Controlled != character) { return; }

            if (character.IsKeyDown(InputType.Aim) && ModeSwitchKey.IsHit())
            {
                CurrentSlotIndex += 1;
                GameMain.Client?.CreateEntityEvent(Item, new Item.ChangePropertyEventData(this.SerializableProperties["CurrentSlotIndex".ToIdentifier()], this));
            }
        }
    }
}