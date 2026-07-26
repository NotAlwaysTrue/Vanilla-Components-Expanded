using Barotrauma;
using Barotrauma.Items.Components;
using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Graphics;
using Microsoft.Xna.Framework.Input;

namespace SRW
{
    public partial class SwitchableRangedWeapon : RangedWeapon
    {
        public KeyOrMouse ModeSwitchKey => SwitchableRangedWeaponPlugin.Instance.SwitchKey;
        public KeyOrMouse fireModeswitchKey => SwitchableRangedWeaponPlugin.Instance.FireModeSwitchKey;

        partial void LaunchProjSpecific()
        {
            base.LaunchProjSpecific();
        }

        public override void DrawHUD(SpriteBatch spriteBatch, Character character)
        {
            base.DrawHUD(spriteBatch, character);

            if (character == null || !character.IsKeyDown(InputType.Aim) || !character.CanAim || (character.ViewTarget is Item item && item.Prefab.FocusOnSelected) || !character.HeldItems.Contains(base.item)) { return; }
            Color TextColor = Color.White;
            Vector2 FireModePos = new Vector2(crosshairPos.X - 60, crosshairPos.Y - 80);
            Vector2 SelectedPos = new Vector2(crosshairPos.X + 40, crosshairPos.Y - 80);

            if (maxfiremodeselectable > 1)
            {
                string localtag = switchableFiremodes.ElementAt(currentfiremode).ToString();
                LocalizedString localstr = TextManager.Get(localtag).Fallback(localtag);
                GUI.DrawString(spriteBatch, FireModePos, localstr, TextColor, forceUpperCase: ForceUpperCase.Yes);
            }

            if (maxselectable > 1)
            {
                string localtag = null;
                if (switchableSlots.Count != 0)
                {
                    switch(currentselected)
                    {
                        case 0:
                            localtag = "firemode.primary";
                            break;
                        case 1:
                            localtag = "firemode.secondary";
                            break;
                        default:
                            localtag = "firemode.misc";
                            break;
                    }
                }
                else if (switchableProjectiles.Count != 0)
                {
                    localtag = switchableProjectiles.ElementAt(currentselected).ToString();
                }
                LocalizedString localstr = TextManager.Get(localtag).Fallback(localtag);
                LocalizedString modNum = TextManager.Get(currentselected.ToString());
                localstr.Replace("[ModeNum]", modNum);
                GUI.DrawString(spriteBatch, SelectedPos, localstr, TextColor, forceUpperCase: ForceUpperCase.Yes);
            }
        }

        public override void UpdateHUDComponentSpecific(Character character, float deltaTime, Camera cam)
        {
            base.UpdateHUDComponentSpecific(character, deltaTime, cam);
            //await Task.Run(() => UpdateUserInput(character));
            UpdateUserInput(character);
        }

        private bool previousshootkeystat = false;
        private void UpdateUserInput(Character character)
        {
            if (character == null || Character.Controlled != character) { return; }

            if (PlayerInput.KeyUp(InputType.Shoot) && (PlayerInput.KeyDown(InputType.Shoot) != previousshootkeystat))
            {
                triggerReleased = true;
                // 服务器通过 Shared 代码中 Use() 的 IsKeyHit(InputType.Shoot) 检测扳机按下并重置 roundsshot
                // 不再发送 ChangePropertyEventData，避免服务器回传广播在不可预测时间点到达客户端导致首发卡顿
            }

            if (character.IsKeyDown(InputType.Aim) && fireModeswitchKey.IsHit())
            {
                currentFireModeSelected += 1;
                GameMain.Client?.CreateEntityEvent(Item, new Item.ChangePropertyEventData(this.SerializableProperties["currentFireModeSelected".ToIdentifier()], this));
            }

            if (character.IsKeyDown(InputType.Aim) && ModeSwitchKey.IsHit())
            {
                currentProjectileSelected += 1;
                GameMain.Client?.CreateEntityEvent(Item, new Item.ChangePropertyEventData(this.SerializableProperties["currentProjectileSelected".ToIdentifier()], this));
            }
            previousshootkeystat = PlayerInput.KeyDown(InputType.Shoot);
            return;
        }
    }
}
