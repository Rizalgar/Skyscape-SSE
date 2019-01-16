Scriptname rsFrameworkMining extends Quest  

Function HarvestItemOnce(GlobalVariable skillCounter, ObjectReference objRef, Activator depletedActivator, int reqLVL, MiscObject newItem, weapon equippedTool, Sound harvestSound, Sound depleteSound,  ObjectReference soundSource, Float respawnInterval, int addCount, bool xpGain = false, string skillName = "", float gainedXP = 0.0, ObjectReference spawnLocation) Global
	;The meat and potatoes... the probability formula
	If skillCounter.GetValue() <= 0
		float mod = GetToolStrength(equippedTool)
		int LVL = (rsFrameworkMain.GetMiningLVL().GetValue() as int)
		Int intmathDelay = ((20-(LVL/10)) - Mod + reqLVL) as Int
		int probability = Utility.RandomInt(0,intMathDelay)
		skillCounter.SetValue(probability)
	Else
		int probability = skillCounter.GetValue() as Int
		probability = (probability - 1)
		If (probability > 0)
			skillCounter.SetValue(probability)
		ElseIf (probability <= 0)
			skillCounter.SetValue(0)
			ObjectReference harvestedRef = objRef.PlaceAtMe(depletedActivator, 1, False, True)
			if harvestSound != none
				harvestSound.Play(soundSource)
			endif
			depleteSound.Play(soundSource)
			objRef.Disable()
			harvestedRef.Enable()
			Game.GetPlayer().AddItem(newItem, addCount)
			rsFrameworkMain.rsXPGain("mining", gainedXP)
			Utility.wait(respawnInterval)
			harvestedRef.Delete()
			objRef.Enable()
		EndIf
	EndIf	
EndFunction

Float Function GetToolStrength(weapon equippedTool) Global
	If (GetFormList_WeaponBronze()).HasForm(equippedTool)
		return 0.0
	ElseIf (GetFormList_WeaponIron()).HasForm(equippedTool)
		return 0.5
	ElseIf (GetFormList_WeaponSteel()).HasForm(equippedTool)
		return 1.0
	ElseIf (GetFormList_WeaponBlack()).HasForm(equippedTool)
		return 1.5
	ElseIf (GetFormList_WeaponMithril()).HasForm(equippedTool)
		return 2.0
	ElseIf (GetFormList_WeaponAdamant()).HasForm(equippedTool)
		return 3.0
	ElseIf (GetFormList_WeaponRune()).HasForm(equippedTool) || (GetFormList_WeaponSacredClay()).HasForm(equippedTool) || (GetFormList_WeaponVolatileClay()).HasForm(equippedTool)
		return 4.0
	ElseIf (GetFormList_WeaponDragon()).HasForm(equippedTool) || equippedTool == (GetWeapon_Special_InfernoAdze())
		return 5.0
	EndIf
EndFunction

FormList Function GetFormList_WeaponBronze() Global
	return GetFrameworkData().RS_FormList_WeaponBronze
EndFunction
FormList Function GetFormList_WeaponIron() Global
	return GetFrameworkData().RS_FormList_WeaponIron
EndFunction
FormList Function GetFormList_WeaponSteel() Global
	return GetFrameworkData().RS_FormList_WeaponSteel
EndFunction
FormList Function GetFormList_WeaponBlack() Global
	return GetFrameworkData().RS_FormList_WeaponBlack
EndFunction
FormList Function GetFormList_WeaponWhite() Global
	return GetFrameworkData().RS_FormList_WeaponWhite
EndFunction
FormList Function GetFormList_WeaponMithril() Global
	return GetFrameworkData().RS_FormList_WeaponMithril
EndFunction
FormList Function GetFormList_WeaponAdamant() Global
	return GetFrameworkData().RS_FormList_WeaponAdamant
EndFunction
FormList Function GetFormList_WeaponRune() Global
	return GetFrameworkData().RS_FormList_WeaponRune
EndFunction
FormList Function GetFormList_WeaponDragon() Global
	return GetFrameworkData().RS_FormList_WeaponDragon
EndFunction
FormList Function GetFormList_WeaponSacredClay() Global
	return GetFrameworkData().RS_FormList_WeaponSacredClay
EndFunction
FormList Function GetFormList_WeaponVolatileClay() Global
	return GetFrameworkData().RS_FormList_WeaponVolatileClay
EndFunction

Weapon Function GetWeapon_Special_InfernoAdze() Global
	return GetFrameworkData().RS_Item_Weapon_Special_InfernoAdze
EndFunction

rsFrameworkData Function GetFrameworkData() Global
	return (Game.GetFormFromFile(0x000D97, "Skyscape - SSE.esp") as Quest) as rsFrameworkData
EndFunction