local m = {}

m["SByte"] = CreateStatic("Barotrauma.LuaSByte", true)
m["Byte"] = CreateStatic("Barotrauma.LuaByte", true)
m["Int16"] = CreateStatic("Barotrauma.LuaInt16", true)
m["UInt16"] = CreateStatic("Barotrauma.LuaUInt16", true)
m["Int32"] = CreateStatic("Barotrauma.LuaInt32", true)
m["UInt32"] = CreateStatic("Barotrauma.LuaUInt32", true)
m["Int64"] = CreateStatic("Barotrauma.LuaInt64", true)
m["UInt64"] = CreateStatic("Barotrauma.LuaUInt64", true)
m["Single"] = CreateStatic("Barotrauma.LuaSingle", true)
m["Double"] = CreateStatic("Barotrauma.LuaDouble", true)

-- Backward compatibility
m["Float"] = CreateStatic("Barotrauma.LuaSingle", true)
m["Short"] = CreateStatic("Barotrauma.LuaInt16", true)
m["UShort"] = CreateStatic("Barotrauma.LuaUInt16", true)

m["SpawnType"] = CreateEnum("Barotrauma.SpawnType")
m["ChatMessageType"] = CreateEnum("Barotrauma.Networking.ChatMessageType")
m["ServerLog_MessageType"] = CreateEnum("Barotrauma.Networking.ServerLog+MessageType")
m["ServerLogMessageType"] = CreateEnum("Barotrauma.Networking.ServerLog+MessageType")
m["PositionType"] = CreateEnum("Barotrauma.Level+PositionType")
m["InvSlotType"] = CreateEnum("Barotrauma.InvSlotType")
m["LimbType"] = CreateEnum("Barotrauma.LimbType")
m["ActionType"] = CreateEnum("Barotrauma.ActionType")
m["AbilityEffectType"] = CreateEnum("Barotrauma.AbilityEffectType")
m["StatTypes"] = CreateEnum("Barotrauma.StatTypes")
m["AbilityFlags"] = CreateEnum("Barotrauma.AbilityFlags")
m["DeliveryMethod"] = CreateEnum("Barotrauma.Networking.DeliveryMethod")
m["ClientPacketHeader"] = CreateEnum("Barotrauma.Networking.ClientPacketHeader")
m["ServerPacketHeader"] = CreateEnum("Barotrauma.Networking.ServerPacketHeader")
m["RandSync"] = CreateEnum("Barotrauma.Rand+RandSync")
m["DisconnectReason"] = CreateEnum("Barotrauma.Networking.DisconnectReason")
m["CombatMode"] = CreateEnum("Barotrauma.AIObjectiveCombat+CombatMode")
m["CauseOfDeathType"] = CreateEnum("Barotrauma.CauseOfDeathType")
m["CharacterTeamType"] = CreateEnum("Barotrauma.CharacterTeamType")
m["ClientPermissions"] = CreateEnum("Barotrauma.Networking.ClientPermissions")
m["OrderCategory"] = CreateEnum("Barotrauma.OrderCategory")
m["WearableType"] = CreateEnum("Barotrauma.WearableType")
m["NumberType"] = CreateEnum("Barotrauma.NumberType")
m["ChatMode"] = CreateEnum("Barotrauma.ChatMode")
m["CharacterType"] = CreateEnum("Barotrauma.CharacterType")
m["VoteType"] = CreateEnum("Barotrauma.Networking.VoteType")
m["CanEnterSubmarine"] = CreateEnum("Barotrauma.CanEnterSubmarine")
m["InputType"] = CreateStatic("Barotrauma.InputType")

m["EventPrefab"] = CreateStatic("Barotrauma.EventPrefab", true)
m["TraitorEventPrefab"] = CreateStatic("Barotrauma.TraitorEventPrefab", true)
m["TraitorEvent"] = CreateStatic("Barotrauma.TraitorEvent", true)
m["EventSet"] = CreateStatic("Barotrauma.EventSet", true)
m["EventManagerSettings"] = CreateStatic("Barotrauma.EventManagerSettings", true)

m["NetConfig"] = CreateStatic("Barotrauma.Networking.NetConfig")
m["NetworkConnection"] = CreateStatic("Barotrauma.Networking.NetworkConnection")
m["Inventory"] = CreateStatic("Barotrauma.Inventory", true)
m["CharacterInventory"] = CreateStatic("Barotrauma.CharacterInventory", true)
m["ItemInventory"] = CreateStatic("Barotrauma.ItemInventory", true)
m["ContentPackageManager"] = CreateStatic("Barotrauma.ContentPackageManager")
m["GameSettings"] = CreateStatic("Barotrauma.GameSettings")
m["RichString"] = CreateStatic("Barotrauma.RichString", true)
m["Identifier"] = CreateStatic("Barotrauma.Identifier", true)
m["LanguageIdentifier"] = CreateStatic("Barotrauma.LanguageIdentifier", true)
m["ContentPackage"] = CreateStatic("Barotrauma.ContentPackage", true)
m["WayPoint"] = CreateStatic("Barotrauma.WayPoint", true)
m["Submarine"] = CreateStatic("Barotrauma.Submarine", true)
m["Client"] = CreateStatic("Barotrauma.Networking.Client", true)
m["Character"] = CreateStatic("Barotrauma.Character")
m["CharacterHealth"] = CreateStatic("Barotrauma.CharacterHealth", true)
m["CharacterPrefab"] = CreateStatic("Barotrauma.CharacterPrefab", true)
m["CharacterInfo"] = CreateStatic("Barotrauma.CharacterInfo", true)
AddCallMetaTable(m["CharacterInfo"].HeadPreset)
AddCallMetaTable(m["CharacterInfo"].HeadInfo)
m["CharacterInfoPrefab"] = CreateStatic("Barotrauma.CharacterInfoPrefab")
m["Item"] = CreateStatic("Barotrauma.Item", true)
AddCallMetaTable(m["Item"].ChangePropertyEventData)
m["MapEntityPrefab"] = CreateStatic("Barotrauma.MapEntityPrefab")
m["ItemPrefab"] = CreateStatic("Barotrauma.ItemPrefab", true)
m["TalentTree"] = CreateStatic("Barotrauma.TalentTree", true)
m["TalentPrefab"] = CreateStatic("Barotrauma.TalentPrefab", true)
m["FactionPrefab"] = CreateStatic("Barotrauma.FactionPrefab", true)
m["MissionPrefab"] = CreateStatic("Barotrauma.MissionPrefab", true)
m["Mission"] = CreateStatic("Barotrauma.Mission", true)
m["Level"] = CreateStatic("Barotrauma.Level")
m["LevelGenerationParams"] = CreateStatic("Barotrauma.LevelGenerationParams", true)
m["OutpostGenerationParams"] = CreateStatic("Barotrauma.OutpostGenerationParams", true)
m["RuinGenerationParams"] = CreateStatic("Barotrauma.RuinGeneration.RuinGenerationParams", true)
m["Job"] = CreateStatic("Barotrauma.Job", true)
m["JobPrefab"] = CreateStatic("Barotrauma.JobPrefab", true)
m["JobVariant"] = CreateStatic("Barotrauma.JobVariant", true)
m["AfflictionPrefab"] = CreateStatic("Barotrauma.AfflictionPrefab", true)
m["SkillSettings"] = CreateStatic("Barotrauma.SkillSettings", true)
m["ChatMessage"] = CreateStatic("Barotrauma.Networking.ChatMessage")
m["Structure"] = CreateStatic("Barotrauma.Structure", true)
m["Hull"] = CreateStatic("Barotrauma.Hull", true)
m["Gap"] = CreateStatic("Barotrauma.Gap", true)
m["Signal"] = CreateStatic("Barotrauma.Items.Components.Signal", true)
m["SubmarineInfo"] = CreateStatic("Barotrauma.SubmarineInfo", true)
m["Entity"] = CreateStatic("Barotrauma.Entity", true)
m["MapEntity"] = CreateStatic("Barotrauma.MapEntity", true)
m["Physics"] = CreateStatic("Barotrauma.Physics")
m["FireSource"] = CreateStatic("Barotrauma.FireSource", true)
m["TextManager"] = CreateStatic("Barotrauma.TextManager")
m["NetEntityEvent"] = CreateStatic("Barotrauma.Networking.NetEntityEvent")
m["Screen"] = CreateStatic("Barotrauma.Screen")
m["AttackResult"] = CreateStatic("Barotrauma.AttackResult", true)
m["TempClient"] = CreateStatic("Barotrauma.Networking.TempClient", true)
m["DecalManager"] = CreateStatic("Barotrauma.DecalManager", true)
m["AutoItemPlacer"] = CreateStatic("Barotrauma.AutoItemPlacer")
m["PropertyConditional"] = CreateStatic("Barotrauma.PropertyConditional", true)
m["StatusEffect"] = CreateStatic("Barotrauma.StatusEffect", true)
m["OutpostGenerator"] = CreateStatic("Barotrauma.OutpostGenerator")
m["DamageModifier"] = CreateStatic("Barotrauma.DamageModifier", true)
m["TraitorManager"] = CreateStatic("Barotrauma.TraitorManager", true)
AddCallMetaTable(m["TraitorManager"].TraitorResults)

m["Md5Hash"] = CreateStatic("Barotrauma.Md5Hash", true)
m["ContentXElement"] = CreateStatic("Barotrauma.ContentXElement", true)
m["ContentPath"] = CreateStatic("Barotrauma.ContentPath", true)
m["XElement"] = CreateStatic("System.Xml.Linq.XElement", true)
m["XName"] = CreateStatic("System.Xml.Linq.XName", true)
m["XAttribute"] = CreateStatic("System.Xml.Linq.XAttribute", true)
m["XContainer"] = CreateStatic("System.Xml.Linq.XContainer", true)
m["XDocument"] = CreateStatic("System.Xml.Linq.XDocument", true)
m["XNode"] = CreateStatic("System.Xml.Linq.XNode", true)
m["SoundsFile"] = CreateStatic("Barotrauma.SoundsFile", true)

m["Voting"] = CreateStatic("Barotrauma.Voting")
m["TimeSpan"] = CreateStatic("System.TimeSpan")
m["IPAddress"] = CreateStatic("System.Net.IPAddress")
m["ContentPackageId"] = CreateStatic("Barotrauma.ContentPackageId")
m["Address"] = CreateStatic("Barotrauma.Networking.Address")
m["AccountId"] = CreateStatic("Barotrauma.Networking.AccountId")
m["Endpoint"] = CreateStatic("Barotrauma.Networking.Endpoint")

m["Explosion"] = CreateStatic("Barotrauma.Explosion", true)

m["ConvertUnits"] = CreateStatic("FarseerPhysics.ConvertUnits")
m["ToolBox"] = CreateStatic("Barotrauma.ToolBox")

m["AIObjective"] = CreateStatic("Barotrauma.AIObjective", true)
m["AIObjectiveChargeBatteries"] = CreateStatic("Barotrauma.AIObjectiveChargeBatteries", true)
m["AIObjectiveCleanupItem"] = CreateStatic("Barotrauma.AIObjectiveCleanupItem", true)
m["AIObjectiveCleanupItems"] = CreateStatic("Barotrauma.AIObjectiveCleanupItems", true)
m["AIObjectiveCombat"] = CreateStatic("Barotrauma.AIObjectiveCombat", true)
m["AIObjectiveContainItem"] = CreateStatic("Barotrauma.AIObjectiveContainItem", true)
m["AIObjectiveDeconstructItem"] = CreateStatic("Barotrauma.AIObjectiveDeconstructItem", true)
m["AIObjectiveDeconstructItems"] = CreateStatic("Barotrauma.AIObjectiveDeconstructItems", true)
m["AIObjectiveEscapeHandcuffs"] = CreateStatic("Barotrauma.AIObjectiveEscapeHandcuffs", true)
m["AIObjectiveExtinguishFire"] = CreateStatic("Barotrauma.AIObjectiveExtinguishFire", true)
m["AIObjectiveExtinguishFires"] = CreateStatic("Barotrauma.AIObjectiveExtinguishFires", true)
m["AIObjectiveFightIntruders"] = CreateStatic("Barotrauma.AIObjectiveFightIntruders", true)
m["AIObjectiveFindDivingGear"] = CreateStatic("Barotrauma.AIObjectiveFindDivingGear", true)
m["AIObjectiveFindSafety"] = CreateStatic("Barotrauma.AIObjectiveFindSafety", true)
m["AIObjectiveFixLeak"] = CreateStatic("Barotrauma.AIObjectiveFixLeak", true)
m["AIObjectiveFixLeaks"] = CreateStatic("Barotrauma.AIObjectiveFixLeaks", true)
m["AIObjectiveGetItem"] = CreateStatic("Barotrauma.AIObjectiveGetItem", true)
m["AIObjectiveGoTo"] = CreateStatic("Barotrauma.AIObjectiveGoTo", true)
m["AIObjectiveIdle"] = CreateStatic("Barotrauma.AIObjectiveIdle", true)
m["AIObjectiveOperateItem"] = CreateStatic("Barotrauma.AIObjectiveOperateItem", true)
m["AIObjectiveOperateItem"] = CreateStatic("Barotrauma.AIObjectiveOperateItem", true)
m["AIObjectivePumpWater"] = CreateStatic("Barotrauma.AIObjectivePumpWater", true)
m["AIObjectiveRepairItem"] = CreateStatic("Barotrauma.AIObjectiveRepairItem", true)
m["AIObjectiveRepairItems"] = CreateStatic("Barotrauma.AIObjectiveRepairItems", true)
m["AIObjectiveRescue"] = CreateStatic("Barotrauma.AIObjectiveRescue", true)
m["AIObjectiveRescueAll"] = CreateStatic("Barotrauma.AIObjectiveRescueAll", true)
m["AIObjectiveReturn"] = CreateStatic("Barotrauma.AIObjectiveReturn", true)
m["AITarget"] = CreateStatic("Barotrauma.AITarget", true)

m["Order"] = CreateStatic("Barotrauma.Order", true)
m["OrderPrefab"] = CreateStatic("Barotrauma.OrderPrefab", true)
m["OrderTarget"] = CreateStatic("Barotrauma.OrderTarget", true)

local componentsToReference = { "DockingPort",
	"Door",
	"GeneticMaterial",
	"Growable",
	"Holdable",
	"LevelResource",
	"ItemComponent",
	"ItemLabel",
	"LightComponent",
	"Controller",
	"Deconstructor",
	"Engine",
	"Fabricator",
	"OutpostTerminal",
	"Pump",
	"Reactor",
	"Steering",
	"PowerContainer",
	"Projectile",
	"Repairable",
	"Rope",
	"Scanner",
	"ButtonTerminal",
	"ConnectionPanel",
	"CustomInterface",
	"MemoryComponent",
	"Terminal",
	"WifiComponent",
	"Wire",
	"TriggerComponent",
	"ElectricalDischarger",
	"EntitySpawnerComponent",
	"ProducedItem",
	"VineTile",
	"GrowthSideExtension",
	"IdCard",
	"MeleeWeapon",
	"Pickable",
	"Propulsion",
	"RangedWeapon",
	"RepairTool",
	"Sprayer",
	"Throwable",
	"ItemContainer",
	"Ladder",
	"LimbPos",
	"MiniMap",
	"OxygenGenerator",
	"Sonar",
	"SonarTransducer",
	"Vent",
	"NameTag",
	"Planter",
	"Powered",
	"PowerTransfer",
	"Quality",
	"RemoteController",
	"AdderComponent",
	"AndComponent",
	"ArithmeticComponent",
	"ColorComponent",
	"ConcatComponent",
	"Connection",
	"DelayComponent",
	"DivideComponent",
	"EqualsComponent",
	"ExponentiationComponent",
	"FunctionComponent",
	"GreaterComponent",
	"ModuloComponent",
	"MotionSensor",
	"MultiplyComponent",
	"NotComponent",
	"OrComponent",
	"OscillatorComponent",
	"OxygenDetector",
	"RegExFindComponent",
	"RelayComponent",
	"SignalCheckComponent",
	"SmokeDetector",
	"StringComponent",
	"SubtractComponent",
	"TrigonometricFunctionComponent",
	"WaterDetector",
	"XorComponent",
	"StatusHUD",
	"Turret",
	"Wearable",
	"CustomInterface",
}

m["Components"] = {}

for k, fname in pairs(componentsToReference) do
	m["Components"][fname] = CreateStatic("Barotrauma.Items.Components." .. fname, true)
end

m["Vector2"] = CreateStatic("Microsoft.Xna.Framework.Vector2", true)
m["Vector3"] = CreateStatic("Microsoft.Xna.Framework.Vector3", true)
m["Vector4"] = CreateStatic("Microsoft.Xna.Framework.Vector4", true)
m["Color"] = CreateStatic("Microsoft.Xna.Framework.Color", true)
m["Point"] = CreateStatic("Microsoft.Xna.Framework.Point", true)
m["Rectangle"] = CreateStatic("Microsoft.Xna.Framework.Rectangle", true)
m["Matrix"] = CreateStatic("Microsoft.Xna.Framework.Matrix", true)

return m
