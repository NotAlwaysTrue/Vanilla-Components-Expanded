using HarmonyLib;

namespace VCE_VirtualizedMagazine;

/// <summary>
/// Preset files are only read when the game loads and only written when the game saves;
/// editing presets in the UI never touches the disk.
/// </summary>
[HarmonyPatch]
public static class MagazinePresetPatch
{
    [HarmonyPostfix]
    [HarmonyPatch(typeof(SaveUtil), nameof(SaveUtil.SaveGame))]
    private static void SaveGamePostfix() => MagazinePresetLibrary.Save();

    [HarmonyPostfix]
    [HarmonyPatch(typeof(SaveUtil), nameof(SaveUtil.LoadGame))]
    private static void LoadGamePostfix() => MagazinePresetLibrary.Load();
}
