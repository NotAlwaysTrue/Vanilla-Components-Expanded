using Barotrauma;
using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Graphics;
using Microsoft.Xna.Framework.Input;

namespace Barotrauma.Items.Components
{
    public partial class SwitchableRangedWeapon : RangedWeapon
    {

        private Keys modeswitchkey, firemodeswitchkey;

        private bool updating = false;

        //protected IList<Sprite> FireModeIndicator, ProjectileIndicator;

        [Serialize("F", IsPropertySaveable.No)]
        public string switchKey
        {
            get
            {
                return ((char)modeswitchkey).ToString();
            }
            set
            {
                object Key;
                bool success = Enum.TryParse(typeof(Keys), value, out Key);
                modeswitchkey = success ? (Keys)Key : Keys.F;
                if (!success)
                {
                    DebugConsole.AddWarning($"Invalid {nameof(modeswitchkey)} configuration at {item.Name}: {value} is not supported! Using F as default.",
                    item.Prefab.ContentPackage);
                }
            }
        }

        public string fireModeswitchKey
        {
            get
            {
                return ((char)modeswitchkey).ToString();
            }
            set
            {
                object Key;
                bool success = Enum.TryParse(typeof(Keys), value, out Key);
                firemodeswitchkey = success ? (Keys)Key : Keys.B;
                if (!success)
                {
                    DebugConsole.AddWarning($"Invalid {nameof(modeswitchkey)} configuration at {item.Name}: {value} is not supported! Using F as default.",
                    item.Prefab.ContentPackage);
                }
            }
        }


        partial void InitProjSpecific(ContentXElement rangedWeaponElement)
        {
            switchKey = rangedWeaponElement.GetAttributeString(nameof(modeswitchkey), "F");
            fireModeswitchKey = rangedWeaponElement.GetAttributeString(nameof(firemodeswitchkey), "B");
            /*
            foreach (var subElement in rangedWeaponElement.Elements())
            {
                Sprite tempsprite;
                float scale = subElement.GetAttributeFloat(nameof(scale), 1f);
                string textureDir = GetTextureDirectory(subElement);
                tempsprite = new Sprite(subElement, path: textureDir, sourceRectScale: scale);
                switch (subElement.Name.ToString().ToLowerInvariant())
                {
                    case "FireModeIndicator":
                        FireModeIndicator.Add(tempsprite);
                        break;
                    case "ProjectileIndicator":
                        ProjectileIndicator.Add(tempsprite);
                        break;
                }
            }
            */
        }

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

            if (maxprojectileselectable > 1)
            {
                string localtag = null;
                if (switchableSlots.Any())
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
                else if (switchableProjectiles.Any())
                {
                    localtag = switchableProjectiles.ElementAt(currentselected).ToString();
                }
                LocalizedString localstr = TextManager.Get(localtag).Fallback(localtag);
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
                GameMain.Client?.CreateEntityEvent(this.Item, new Item.ChangePropertyEventData(this.SerializableProperties["triggerReleased".ToIdentifier()], this));
            }

            if (PlayerInput.KeyHit(firemodeswitchkey))
            {
                currentFireModeSelected += 1;
                GameMain.Client?.CreateEntityEvent(this.Item, new Item.ChangePropertyEventData(this.SerializableProperties["currentFireModeSelected".ToIdentifier()], this));
            }

            if (PlayerInput.KeyHit(modeswitchkey))
            {
                currentProjectileSelected += 1;
                GameMain.Client?.CreateEntityEvent(this.Item, new Item.ChangePropertyEventData(this.SerializableProperties["currentProjectileSelected".ToIdentifier()], this));
            }
            previousshootkeystat = PlayerInput.KeyDown(InputType.Shoot);
            return;
        }
    }
}
