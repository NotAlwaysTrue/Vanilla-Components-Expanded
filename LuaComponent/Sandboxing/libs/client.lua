local m = {}

local localizedStrings = {
    "LocalizedString",
    "LimitLString",
    "WrappedLString",
    "AddedPunctuationLString",
    "CapitalizeLString",
    "ConcatLString",
    "FallbackLString",
    "FormattedLString",
    "InputTypeLString",
    "JoinLString",
    "LowerLString",
    "RawLString",
    "ReplaceLString",
    "ServerMsgLString",
    "SplitLString",
    "TagLString",
    "TrimLString",
    "UpperLString",
    "StripRichTagsLString",
}

for k, fname in pairs(localizedStrings) do
    m[fname] = CreateStatic("Barotrauma." .. fname, true)
end

local sounds = {}
sounds.LowpassFilter = CreateStatic("Barotrauma.Sounds.LowpassFilter")
sounds.HighpassFilter = CreateStatic("Barotrauma.Sounds.HighpassFilter")
sounds.BandpassFilter = CreateStatic("Barotrauma.Sounds.BandpassFilter")
sounds.NotchFilter = CreateStatic("Barotrauma.Sounds.NotchFilter")
sounds.LowShelfFilter = CreateStatic("Barotrauma.Sounds.LowShelfFilter")
sounds.HighShelfFilter = CreateStatic("Barotrauma.Sounds.HighShelfFilter")
sounds.PeakFilter = CreateStatic("Barotrauma.Sounds.PeakFilter")
m["Sounds"] = sounds

m["SpriteEffects"] = CreateStatic("Microsoft.Xna.Framework.Graphics.SpriteEffects")

m["SoundPlayer"] = CreateStatic("Barotrauma.SoundPlayer")
m["SoundPrefab"] = CreateStatic("Barotrauma.SoundPrefab", true)
m["BackgroundMusic"] = CreateStatic("Barotrauma.BackgroundMusic", true)
m["GUISound"] = CreateStatic("Barotrauma.GUISound", true)
m["DamageSound"] = CreateStatic("Barotrauma.DamageSound", true)
m["WaterRenderer"] = CreateStatic("Barotrauma.WaterRenderer", true)

m["TextureLoader"] = CreateStatic("Barotrauma.TextureLoader")
m["Sprite"] = CreateStatic("Barotrauma.Sprite", true)
m["PlayerInput"] = CreateStatic("Barotrauma.PlayerInput", true)

m["Keys"] = CreateStatic("Microsoft.Xna.Framework.Input.Keys", true)

m["GUI"] = {
    GUI = CreateStatic("Barotrauma.GUI", true),
    Style = CreateStatic("Barotrauma.GUIStyle", true),
    Component = CreateStatic("Barotrauma.GUIComponent"),
    RectTransform = CreateStatic("Barotrauma.RectTransform", true),
    LayoutGroup = CreateStatic("Barotrauma.GUILayoutGroup", true),
    Button = CreateStatic("Barotrauma.GUIButton", true),
    TextBox = CreateStatic("Barotrauma.GUITextBox", true),
    Canvas = CreateStatic("Barotrauma.GUICanvas", true),
    Frame = CreateStatic("Barotrauma.GUIFrame", true),
    TextBlock = CreateStatic("Barotrauma.GUITextBlock", true),
    TickBox = CreateStatic("Barotrauma.GUITickBox", true),
    Image = CreateStatic("Barotrauma.GUIImage", true),
    ListBox = CreateStatic("Barotrauma.GUIListBox", true),
    ScrollBar = CreateStatic("Barotrauma.GUIScrollBar", true),
    DropDown = CreateStatic("Barotrauma.GUIDropDown", true),
    NumberInput = CreateStatic("Barotrauma.GUINumberInput", true),
    MessageBox = CreateStatic("Barotrauma.GUIMessageBox", true),
    ColorPicker = CreateStatic("Barotrauma.GUIColorPicker", true),
    ProgressBar = CreateStatic("Barotrauma.GUIProgressBar", true),
    CustomComponent = CreateStatic("Barotrauma.GUICustomComponent", true),
    ScissorComponent = CreateStatic("Barotrauma.GUIScissorComponent", true),
    VideoPlayer = CreateStatic("Barotrauma.VideoPlayer", true),
    Graph = CreateStatic("Barotrauma.Graph", true),
    SerializableEntityEditor = CreateStatic("Barotrauma.SerializableEntityEditor", true),
    SlideshowPlayer = CreateStatic("Barotrauma.SlideshowPlayer", true),
    CreditsPlayer = CreateStatic("Barotrauma.CreditsPlayer", true),
    DragHandle = CreateStatic("Barotrauma.GUIDragHandle", true),
    ContextMenu = CreateStatic("Barotrauma.GUIContextMenu", true),
    ContextMenuOption = CreateStatic("Barotrauma.ContextMenuOption", true),

    Screen = CreateStatic("Barotrauma.Screen"),

    Anchor = CreateStatic("Barotrauma.Anchor"),
    Alignment = CreateStatic("Barotrauma.Alignment"),
    Pivot = CreateStatic("Barotrauma.Pivot"),
    SoundType = CreateEnum("Barotrauma.GUISoundType"),
    CursorState = CreateEnum("Barotrauma.CursorState"),

    GUIStyle = CreateStatic("Barotrauma.GUIStyle", true),
}

setmetatable(m["GUI"], {
    __index = function(table, key)
        return m["GUI"].GUI[key]
    end
})

AddCallMetaTable(m["GUI"].VideoPlayer.VideoSettings)
AddCallMetaTable(m["GUI"].VideoPlayer.TextSettings)

return m
