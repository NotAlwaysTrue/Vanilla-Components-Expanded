using Barotrauma.Plugins;
using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Input;
using System.Xml.Linq;

namespace VanillaComponentsExpanded
{
    public class VCEKeySetting : BaseSetting<string>
    {
        public VCEKeySetting(Identifier identifier, string defaultValue, LocalizedString label) : base(identifier, defaultValue)
        {
            Label = label;
            SyncMode = SettingSyncMode.NoSync;
        }
        public LocalizedString Label { get; set; }

        public LocalizedString? ToolTip { get; set; }

        private KeyOrMouse keyvalue;
        public KeyOrMouse KeyValue 
        {
            get => keyvalue;
            private set
            {
                keyvalue = value;
                if (settingsbutton != null)
                {
                    settingsbutton.Text = value.ToString();
                }
            }
        }

        public override void Load(XElement element)
        {
            var raw = element.GetAttributeString("Input", DefaultValue);
            if (TryParseKey(raw, out var res))
            {
                KeyValue = res;
            }
            else
            {
                VCEPlugin.DebugConsole.ThrowError($"Error: Key setting {Identifier} trying to load a invalid input! Falling back to default");
                if (TryParseKey(DefaultValue, out var resdef))
                {
                    KeyValue = resdef;
                }
                else
                {
                    KeyValue = Keys.None;
                }
            }
            Value = KeyValue.ToString();
        }

        public override void Save(XElement element)
        {
            element.SetAttribute("Input", Value);
        }

        public override void ResetToDefault()
        {
            _ = TryParseKey(DefaultValue, out var res);
            KeyValue = res;
            Value = DefaultValue;
        }

        public override void Revert()
        {
            PendingValue = Value;
            _ = TryParseKey(Value, out var res);
            KeyValue = res;
        }

        private static bool TryParseKey(string raw, out KeyOrMouse res)
        {
 
            if (Enum.TryParse<Keys>(raw, true, out var key))
            {
                res = new KeyOrMouse(key);
                return true;
            }
            else if (Enum.TryParse<MouseButton>(raw, true, out var mouse))
            {
                res = new KeyOrMouse(mouse);
                return true;
            }
            res = null;
            return false;
        }

        private static GUICustomComponent InputListener;

        private GUIButton settingsbutton;

        public override void CreateUI()
        {
            MainUI = new GUIFrame(new RectTransform((1.0f, 0.12f), null), style: null);

            GUILayoutGroup vertical = new GUILayoutGroup(new RectTransform(Vector2.One, base.MainUI.RectTransform));

            new GUITextBlock(new RectTransform((1f, 0.4f), vertical.RectTransform), Label, wrap: false, textAlignment: Alignment.Center);

            var inputButton = new GUIButton(new RectTransform((1f, 0.6f), vertical.RectTransform), Alignment.Center,
                style: "GUITextBoxNoIcon")
            {
                Text = this.Value.ToString(),
                OnClicked = (btn, obj) =>
                {
                    if (InputListener is not null)
                    {
                        // Another button is active
                        return true;
                    }
                    CoroutineManager.Invoke(() =>
                    {
                        CreateListener(btn);
                    }, 0f); // delay one frame for button inputs
                    return true;
                }
            };
            inputButton.OutlineColor = Color.PeachPuff;
            inputButton.TextColor = Color.White;

            settingsbutton = inputButton;

            void ClearListener()
            {
                InputListener?.Parent.RemoveChild(InputListener);
                InputListener = null;
            }

            void CreateListener(GUIButton button)
            {
                ClearListener();
                InputListener = new GUICustomComponent(new RectTransform(Vector2.Zero, vertical.RectTransform),
                    onUpdate: (deltaTime, component) =>
                    {
                        var pressedKeys = PlayerInput.GetKeyboardState.GetPressedKeys();
                        if (pressedKeys?.Any() ?? false)
                        {
                            if (pressedKeys.Contains(Keys.Escape))
                            {
                                ClearListener();
                                return;
                            }

                            ApplyValue(pressedKeys.First(), button);
                            return;
                        }

                        if (PlayerInput.PrimaryMouseButtonClicked() &&
                            (GUI.MouseOn == null || !(GUI.MouseOn is GUIButton) || GUI.MouseOn.IsChildOf(vertical)))
                        {
                            ApplyValue(MouseButton.PrimaryMouse, button);
                            return;
                        }
                        else if (PlayerInput.SecondaryMouseButtonClicked())
                        {
                            ApplyValue(MouseButton.SecondaryMouse, button);
                            return;
                        }
                        else if (PlayerInput.MidButtonClicked())
                        {
                            ApplyValue(MouseButton.MiddleMouse, button);
                            return;
                        }
                        else if (PlayerInput.Mouse4ButtonClicked())
                        {
                            ApplyValue(MouseButton.MouseButton4, button);
                            return;
                        }
                        else if (PlayerInput.Mouse5ButtonClicked())
                        {
                            ApplyValue(MouseButton.MouseButton5, button);
                            return;
                        }
                        else if (PlayerInput.MouseWheelUpClicked())
                        {
                            ApplyValue(MouseButton.MouseWheelUp, button);
                            return;
                        }
                        else if (PlayerInput.MouseWheelDownClicked())
                        {
                            ApplyValue(MouseButton.MouseWheelDown, button);
                            return;
                        }
                    });
            }

            void ApplyValue(KeyOrMouse input, GUIButton button)
            {
                button.Text = PendingValue = input.ToString();
                KeyValue = input;
                ClearListener();
            }
        }
    }

}
