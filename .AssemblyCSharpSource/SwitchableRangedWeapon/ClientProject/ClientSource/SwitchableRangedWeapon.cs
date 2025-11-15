using Barotrauma;
using Barotrauma.Networking;
using Barotrauma.Particles;
using Barotrauma.Sounds;
using FarseerPhysics;
using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Graphics;
using Microsoft.Xna.Framework.Input;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Barotrauma.Items.Components
{
    partial class SwitchableRangedWeapon : RangedWeapon
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

        public override void DrawHUD(SpriteBatch spriteBatch, Character character)
        {
            base.DrawHUD(spriteBatch, character);
            if (character == null || !character.IsKeyDown(InputType.Aim) || !character.CanAim) { return; }

            Color TextColor = Color.White;
            Vector2 FireModePos = new Vector2(crosshairPos.X - 60, crosshairPos.Y - 80);
            Vector2 SelectedPos = new Vector2(crosshairPos.X + 40, crosshairPos.Y - 80);

            if (switchableFiremodes.Count > 1)
            {
                string localtag = switchableFiremodes.ElementAt(currentfiremode).ToString();
                LocalizedString localstr = TextManager.Get(localtag).Fallback(localtag);
                GUI.DrawString(spriteBatch, FireModePos, localstr, TextColor, forceUpperCase: ForceUpperCase.Yes);
            }

            if (switchableProjectiles.Count > 1)
            {
                string localtag = switchableProjectiles.ElementAt(currentselected).ToString();
                LocalizedString localstr = TextManager.Get(localtag).Fallback(localtag);
                GUI.DrawString(spriteBatch, SelectedPos, localstr, TextColor, forceUpperCase: ForceUpperCase.Yes);
            }
        }

        public override void UpdateHUDComponentSpecific(Character character, float deltaTime, Camera cam)
        {
            base.UpdateHUDComponentSpecific(character, deltaTime, cam);
            UpdateUserInput(character);
        }

        private bool previousshootkeystat = false;
        private void UpdateUserInput(Character character)
        {
            if (character == null) return;

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
            //TextManager.Get()
            previousshootkeystat = PlayerInput.KeyDown(InputType.Shoot);
        }
    }
}
