
VCE.LoadedSounds = {
    DefaultSound = Game.SoundManager.LoadSound(VCE.Path .. "/Sounds/BRUH.ogg"),
}

Networking.Receive("PlayRicochetSound", function(message)
        local id = message.ReadString().Value
        local RicochetSound = VCE.LoadedSounds[id] or VCE.LoadedSounds.DefaultSound
        local Range = VCE.ArmorConfigs[id].SoundRange or 1000
        local x = message.ReadDouble()
        local y = message.ReadDouble()
        SoundPlayer.PlaySound(RicochetSound, Vector2(x, y), 1, Range, 1)
    end)