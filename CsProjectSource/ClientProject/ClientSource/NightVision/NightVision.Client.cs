using System.Runtime.CompilerServices;
using Barotrauma.Items.Components;
using Microsoft.Xna.Framework.Input;

namespace VCE_NightVision;

public sealed partial class NightVision
{
    private static readonly ConditionalWeakTable<Character, List<NightVision>> equipped = new();
    private Character? wearer;
    private Keys toggle;
    private bool switchedOn, keyDown;

    public override void Equip(Character character)
    {
        if (wearer == character) return;
        ForgetWearer();
        wearer = character;
        equipped.GetOrCreateValue(character).Add(this);
        Enum.TryParse(ToggleKey, true, out toggle);
        switchedOn = true;
        keyDown = toggle != Keys.None && PlayerInput.KeyDown(toggle);
    }

    private void ForgetWearer()
    {
        if (wearer != null && equipped.TryGetValue(wearer, out var devices))
        {
            devices.Remove(this);
            if (devices.Count == 0) equipped.Remove(wearer);
        }
        wearer = null;
    }

    public override void Unequip(Character character) => ForgetWearer();
    public override void Drop(Character dropper, bool setTransform = true) => ForgetWearer();
    public override void RemoveComponentSpecific() { ForgetWearer(); base.RemoveComponentSpecific(); }
    public override void ShallowRemoveComponentSpecific() { ForgetWearer(); base.ShallowRemoveComponentSpecific(); }

    internal static void ClearWearers() => equipped.Clear();

    internal static NightVision? ForControlledCharacter()
    {
        if (Character.Controlled is not { Removed: false, IsDead: false } user || !equipped.TryGetValue(user, out var worn)) return null;
        for (int i = worn.Count - 1; i >= 0; --i)
        {
            var device = worn[i];
            if (device.Item.Condition <= 0 || !user.HasEquippedItem(device.Item)) continue;
            if (device.toggle != Keys.None)
            {
                bool down = PlayerInput.KeyDown(device.toggle);
                if (down && !device.keyDown && GUI.KeyboardDispatcher.Subscriber == null) device.switchedOn = !device.switchedOn;
                device.keyDown = down;
            }
            if (device.switchedOn && (!device.RequiresPower || device.Item.GetComponent<Powered>()?.HasPower == true)) return device;
        }
        return null;
    }
}
