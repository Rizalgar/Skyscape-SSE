Scriptname RS_MCM extends SKI_ConfigBase  
{SkyUI Main Menu}


;;Level globals
GlobalVariable Property RS_GV_AgilityLVL Auto
GlobalVariable Property RS_GV_AttackLVL Auto
GlobalVariable Property RS_GV_ConstitutionLVL Auto
GlobalVariable Property RS_GV_ConstructionLVL Auto
GlobalVariable Property RS_GV_CookingLVL Auto
GlobalVariable Property RS_GV_CraftingLVL Auto
GlobalVariable Property RS_GV_DefenceLVL Auto
GlobalVariable Property RS_GV_DivinationLVL Auto 
GlobalVariable Property RS_GV_DungeoneeringLVL Auto
GlobalVariable Property RS_GV_FarmingLVL Auto
GlobalVariable Property RS_GV_FiremakingLVL Auto
GlobalVariable Property RS_GV_FishingLVL Auto
GlobalVariable Property RS_GV_FletchingLVL Auto
GlobalVariable Property RS_GV_HerbloreLVL Auto
GlobalVariable Property RS_GV_HunterLVL Auto
GlobalVariable Property RS_GV_InventionLVL Auto
GlobalVariable Property RS_GV_MagicLVL Auto
GlobalVariable Property RS_GV_MiningLVL Auto
GlobalVariable Property RS_GV_PrayerLVL Auto
GlobalVariable Property RS_GV_RangedLVL Auto
GlobalVariable Property RS_GV_RunecraftingLVL Auto
GlobalVariable Property RS_GV_SlayerLVL Auto
GlobalVariable Property RS_GV_SmithingLVL Auto
GlobalVariable Property RS_GV_StrengthLVL Auto
GlobalVariable Property RS_GV_SummoningLVL Auto
GlobalVariable Property RS_GV_ThievingLVL Auto
GlobalVariable Property RS_GV_WoodcuttingLVL Auto

;;Xp globals
GlobalVariable Property RS_GV_AgilityXP Auto
GlobalVariable Property RS_GV_AttackXP Auto
GlobalVariable Property RS_GV_ConstitutionXP Auto
GlobalVariable Property RS_GV_ConstructionXP Auto
GlobalVariable Property RS_GV_CookingXP Auto
GlobalVariable Property RS_GV_CraftingXP Auto
GlobalVariable Property RS_GV_DefenceXP Auto
GlobalVariable Property RS_GV_DivinationXP Auto
GlobalVariable Property RS_GV_DungeoneeringXP Auto
GlobalVariable Property RS_GV_FarmingXP Auto
GlobalVariable Property RS_GV_FiremakingXP Auto
GlobalVariable Property RS_GV_FishingXP Auto
GlobalVariable Property RS_GV_FletchingXP Auto
GlobalVariable Property RS_GV_HerbloreXP Auto
GlobalVariable Property RS_GV_HunterXP Auto
GlobalVariable Property RS_GV_InventionXP Auto
GlobalVariable Property RS_GV_MagicXP Auto
GlobalVariable Property RS_GV_MiningXP Auto
GlobalVariable Property RS_GV_PrayerXP Auto
GlobalVariable Property RS_GV_RangedXP Auto
GlobalVariable Property RS_GV_RunecraftingXP Auto
GlobalVariable Property RS_GV_SlayerXP Auto
GlobalVariable Property RS_GV_SmithingXP Auto
GlobalVariable Property RS_GV_StrengthXP Auto
GlobalVariable Property RS_GV_SummoningXP Auto
GlobalVariable Property RS_GV_ThievingXP Auto
GlobalVariable Property RS_GV_WoodcuttingXP Auto

;combat stats
GlobalVariable Property RS_GV_AttackBonus Auto
GlobalVariable Property RS_GV_StrengthBonus Auto
GlobalVariable Property RS_GV_RangedBonus Auto
GlobalVariable Property RS_GV_PrayerBonus Auto
GlobalVariable Property RS_GV_CombatLevel Auto

;Misc
GlobalVariable Property RS_GV_XPMultiplier Auto
GlobalVariable Property RS_GV_AttackStyle Auto
GlobalVariable Property RS_GV_Initialize Auto
ObjectReference Property InitializeMarker Auto
Armor Property RS_StartClothes Auto
Armor Property RS_StartBoots Auto

;Messages
Message Property RS_Message_CombatStyle Auto

;text display levels
Int OID_TextAgilityLVL
Int OID_TextAttackLVL
Int OID_TextConstitutionLVL
Int OID_TextConstructionLVL
Int OID_TextCookingLVL
Int OID_TextCraftingLVL
Int OID_TextDefenceLVL
Int OID_TextDivinationLVL
Int OID_TextDungeoneeringLVL
Int OID_TextFarmingLVL
Int OID_TextFiremakingLVL
Int OID_TextFishingLVL
Int OID_TextFletchingLVL
Int OID_TextHerbloreLVL
Int OID_TextHunterLVL
Int OID_TextInventionLVL
Int OID_TextMagicLVL
Int OID_TextMiningLVL
Int OID_TextPrayerLVL
Int OID_TextRangedLVL
Int OID_TextRunecraftingLVL
Int OID_TextSlayerLVL
Int OID_TextSmithingLVL
Int OID_TextStrengthLVL
Int OID_TextSummoningLVL
Int OID_TextThievingLVL
Int OID_TextWoodcuttingLVL

;text display xp
Int OID_TextAgilityXP
Int OID_TextAttackXP
Int OID_TextConstitutionXP
Int OID_TextConstructionXP
Int OID_TextCookingXP
Int OID_TextCraftingXP
Int OID_TextDefenceXP
Int OID_TextDivinationXP
Int OID_TextDungeoneeringXP
Int OID_TextFarmingXP
Int OID_TextFiremakingXP
Int OID_TextFishingXP
Int OID_TextFletchingXP
Int OID_TextHerbloreXP
Int OID_TextHunterXP
Int OID_TextInventionXP
Int OID_TextMagicXP
Int OID_TextMiningXP
Int OID_TextPrayerXP
Int OID_TextRangedXP
Int OID_TextRunecraftingXP
Int OID_TextSlayerXP
Int OID_TextSmithingXP
Int OID_TextStrengthXP
Int OID_TextSummoningXP
Int OID_TextThievingXP
Int OID_TextWoodcuttingXP

;combat stat display
Int OID_TextAttackBonus 
Int OID_TextStrengthBonus
Int OID_TextRangedBonus
Int OID_TextPrayerBonus
Int OID_TextCombatLevel

;misc
Int OID_SliderXPM

String attackstyleString

Event OnPageReset(string page)
	
	If (page == "")
		SetCursorFillMode(LEFT_TO_RIGHT)
		SetCursorPosition(0)
		RegisterForKey(59)
		
		AddHeaderOption("Config") ;0
		
		AddHeaderOption("Combat Stats") ;1
		
		AddEmptyOption() ;2 
		
		AddEmptyOption() ;3
		
		OID_SliderXPM = AddSliderOption("Experience Multiplier", RS_GV_XPMultiplier.GetValueInt(), "{1}") ;4
		
		OID_TextCombatLevel = AddTextOption("Combat Level:", RS_GV_CombatLevel.GetValueInt()) ;5
		
		AddEmptyOption() ;6
		AddEmptyOption() ;7
	
		AddEmptyOption() ;8
		
		OID_TextStrengthBonus = AddTextOption("Strength Bonus:", RS_GV_StrengthBonus.GetValueInt()) ;9
		
		AddEmptyOption() ;10
		
		OID_TextRangedBonus = AddTextOption("Ranged Bonus:", RS_GV_RangedBonus.GetValueInt()) ; 11
		
		AddEmptyOption() ;12
		
		OID_TextPrayerBonus = AddTextOption("Prayer Bonus:", RS_GV_PrayerBonus.GetValueInt()) ; 13
		
		AddEmptyOption() ;14
		
		OID_TextAttackBonus = AddTextOption("Attack Bonus:", RS_GV_AttackBonus.GetValueInt()) ; 15
		
		AddHeaderOption("")
		
		AddHeaderOption("")
		
	ElseIf (page == "Skills List")
	
		SetCursorFillMode(LEFT_TO_RIGHT)
		SetCursorPosition(0)
		
		AddHeaderOption("Skills List")
		
		AddHeaderOption("")
		
		OID_TextAgilityLVL = AddTextOption("Agility Level:", RS_GV_AgilityLVL.GetValueInt())
		OID_TextAgilityXP = AddTextOption("Agility Experience:", RS_GV_AgilityXP.GetValueInt())
		
		OID_TextAttackLVL = AddTextOption("Attack Level:", RS_GV_AttackLVL.GetValueInt())
		OID_TextAttackXP = AddTextOption("Attack Experience:", RS_GV_AttackXP.GetValueInt())
		
		OID_TextConstitutionLVL = AddTextOption("Constitution Level:", RS_GV_ConstitutionLVL.GetValueInt())
		OID_TextConstitutionXP = AddTextOption("Constitution Experience:", RS_GV_ConstitutionXP.GetValueInt())
		
		OID_TextConstructionLVL = AddTextOption("Construction Level:", RS_GV_ConstructionLVL.GetValueInt())
		OID_TextConstructionXP = AddTextOption("Construction Experience:", RS_GV_ConstructionXP.GetValueInt())
		
		OID_TextCookingLVL = AddTextOption("Cooking Level:", RS_GV_CookingLVL.GetValueInt())
		OID_TextCookingXP = AddTextOption("Cooking Experience:", RS_GV_CookingXP.GetValueInt())
		
		OID_TextCraftingLVL = AddTextOption("Crafting Level:", RS_GV_CraftingLVL.GetValueInt())
		OID_TextCraftingXP = AddTextOption("Crafting Experience:", RS_GV_CraftingXP.GetValueInt())
		
		OID_TextDefenceLVL = AddTextOption("Defence Level:", RS_GV_DefenceLVL.GetValueInt())
		OID_TextDefenceXP = AddTextOption("Defence Experience:", RS_GV_DefenceXP.GetValueInt())
		
		OID_TextDivinationLVL = AddTextOption("Divination Level:", RS_GV_DivinationLVL.GetValueInt())
		OID_TextDivinationXP = AddTextOption("Divination Experience:", RS_GV_DivinationXP.GetValueInt())
		
		OID_TextDungeoneeringLVL = AddTextOption("Dungeoneering Level:", RS_GV_DungeoneeringLVL.GetValueInt())
		OID_TextDungeoneeringXP = AddTextOption("Dungeoneering Experience:", RS_GV_DungeoneeringXP.GetValueInt())
		
		OID_TextFarmingLVL = AddTextOption("Farming Level:", RS_GV_FarmingLVL.GetValueInt())
		OID_TextFarmingXP = AddTextOption("Farming Experience:", RS_GV_FarmingXP.GetValueInt())
		
		OID_TextFiremakingLVL = AddTextOption("Firemaking Level:", RS_GV_FiremakingLVL.GetValueInt())
		OID_TextFiremakingXP = AddTextOption("Firemaking Experience:", RS_GV_FiremakingXP.GetValueInt())
		
		OID_TextFishingLVL = AddTextOption("Fishing Level:", RS_GV_FishingLVL.GetValueInt())
		OID_TextFishingXP = AddTextOption("Fishing Experience:", RS_GV_FishingXP.GetValueInt())
		
		OID_TextFletchingLVL = AddTextOption("Fletching Level:", RS_GV_FletchingLVL.GetValueInt())
		OID_TextFletchingXP = AddTextOption("Fletching Experience:", RS_GV_FletchingXP.GetValueInt())
		
		OID_TextHerbloreLVL = AddTextOption("Herblore Level:", RS_GV_HerbloreLVL.GetValueInt())
		OID_TextHerbloreXP = AddTextOption("Herblore Experience:", RS_GV_HerbloreXP.GetValueInt())
		
		OID_TextHunterLVL = AddTextOption("Hunter Level:", RS_GV_HunterLVL.GetValueInt())
		OID_TextHunterXP = AddTextOption("Hunter Experience:", RS_GV_HunterXP.GetValueInt())
		
		OID_TextInventionLVL = AddTextOption("Invention Level:", RS_GV_InventionLVL.GetValueInt())
		OID_TextInventionXP = AddTextOption("Invention Experience:", RS_GV_InventionXP.GetValueInt())
		
		OID_TextMagicLVL = AddTextOption("Magic Level:", RS_GV_MagicLVL.GetValueInt())
		OID_TextMagicXP = AddTextOption("Magic Experience:", RS_GV_MagicXP.GetValueInt())
		
		OID_TextMiningLVL = AddTextOption("Mining Level:", RS_GV_MiningLVL.GetValueInt())
		OID_TextMiningXP = AddTextOption("Mining Experience:", RS_GV_MiningXP.GetValueInt())
		
		OID_TextPrayerLVL = AddTextOption("Prayer Level:", RS_GV_PrayerLVL.GetValueInt())
		OID_TextPrayerXP = AddTextOption("Prayer Experience:", RS_GV_PrayerXP.GetValueInt())
		
		OID_TextRangedLVL = AddTextOption("Ranged Level:", RS_GV_RangedLVL.GetValueInt())
		OID_TextRangedXP = AddTextOption("Ranged Experience:", RS_GV_RangedXP.GetValueInt())
		
		OID_TextRunecraftingLVL = AddTextOption("Runecrafting Level:", RS_GV_RunecraftingLVL.GetValueInt())
		OID_TextRunecraftingXP = AddTextOption("Runecrafting Experience:", RS_GV_RunecraftingXP.GetValueInt())
		
		OID_TextSlayerLVL = AddTextOption("Slayer Level:", RS_GV_SlayerLVL.GetValueInt())
		OID_TextSlayerXP = AddTextOption("Slayer Experience:", RS_GV_SlayerXP.GetValueInt())
		
		OID_TextSmithingLVL = AddTextOption("Smithing Level:", RS_GV_SmithingLVL.GetValueInt())
		OID_TextSmithingXP = AddTextOption("Smithing Experience:", RS_GV_SmithingXP.GetValueInt())
		
		OID_TextStrengthLVL = AddTextOption("Strength Level:", RS_GV_StrengthLVL.GetValueInt())
		OID_TextStrengthXP = AddTextOption("Strength Experience:", RS_GV_StrengthXP.GetValueInt())
		
		OID_TextSummoningLVL = AddTextOption("Summoning Level:", RS_GV_SummoningLVL.GetValueInt())
		OID_TextSummoningXP = AddTextOption("Summoning Experience:", RS_GV_SummoningXP.GetValueInt())
		
		OID_TextThievingLVL = AddTextOption("Thieving Level:", RS_GV_ThievingLVL.GetValueInt())
		OID_TextThievingXP = AddTextOption("Thieving Experience:", RS_GV_ThievingXP.GetValueInt())
		
		OID_TextWoodcuttingLVL = AddTextOption("Woodcutting Level:", RS_GV_WoodcuttingLVL.GetValueInt())
		OID_TextWoodcuttingXP = AddTextOption("Woodcutting Experience:", RS_GV_WoodcuttingXP.GetValueInt())
		
	ElseIf (page == "Initialize")
		
		If RS_GV_Initialize.GetValue() == 0
			Game.GetPlayer().SetActorValue("health", 1000)
			Game.GetPlayer().SetActorValue("magicka", 100)
			Game.GetPlayer().SetActorValue("magickarate", 0)
			Game.GetPlayer().SetActorValue("stamina", 500)
			Game.GetPlayer().SetActorValue("staminarate", 0.125)
			Game.GetPlayer().SetActorValue("Unarmeddamage", 1)
			Game.GetPlayer().SetActorValue("Speechcraft", 100)
			Game.GetPlayer().SetActorValue("CarryWeight", 100)
			Game.GetPlayer().GetActorBase().SetEssential()
			Game.GetPlayer().RemoveAllItems()
			Game.GetPlayer().AddItem(RS_StartBoots, 1)
			Game.GetPlayer().AddItem(RS_StartClothes, 1)
			Utility.Wait(0.5)
			Game.GetPlayer().EquipItem(RS_StartBoots)
			Game.GetPlayer().EquipItem(RS_StartClothes)
			Utility.Wait(1)
			Game.GetPlayer().MoveTo(InitializeMarker)
			RS_GV_Initialize.SetValue(0)
		EndIf
		
	EndIf
	
EndEvent 

Event OnKeyDown(Int KeyCode)

	If KeyCode == 59
			UpdateCurrentInstanceGlobal(RS_GV_AttackStyle)
			if (RS_GV_AttackStyle.GetValue()) == 0;Accurate
				attackStyleString = "Accurate"
			elseif (RS_GV_AttackStyle.GetValue()) == 1;Agressive
				attackStyleString = "Agressive"
			elseif (RS_GV_AttackStyle.GetValue()) == 2;Defensive
				attackStyleString = "Defensive"
			elseif (RS_GV_AttackStyle.GetValue()) == 3;Controlled
				attackStyleString = "Controlled"
			Else
				Debug.MessageBox("Problem with setting attack style for display!")
			EndIf
			Debug.Notification("Current attack style: " + attackStyleString)
			int attackStyle = RS_Message_CombatStyle.show()
			If attackStyle == 0 
				RS_GV_AttackStyle.SetValue(0)
			ElseIf attackStyle == 1
				RS_GV_AttackStyle.SetValue(1)
			ElseIf attackStyle == 2
				RS_GV_AttackStyle.SetValue(2)
			ElseIf attackStyle == 3
				RS_GV_AttackStyle.SetValue(3)
			EndIf
	EndIf
	
EndEvent 

Event OnOptionSliderOpen(Int slider)
	
	If slider == OID_SliderXPM
		SetSliderDialogStartValue(RS_GV_XPMultiplier.GetValue())
		SetSliderDialogDefaultValue(1)
		SetSliderDialogRange(1,1000)
		SetSliderDialogInterval(1)
	EndIf
	
EndEvent 

Event OnOptionSliderAccept(Int slider, float value)

	If slider == OID_SliderXPM
		
		RS_GV_XPMultiplier.SetValue(value)
		
		SetSliderOptionValue(slider, value, "{0}")
	
	EndIf

EndEvent 