Scriptname RS_Weapon_Damage_Test extends ActiveMagicEffect  
{test for weapon damage}

GlobalVariable Property RS_GV_XPMultiplier Auto

Event OnEffectStart(Actor akCaster, Actor akTarget)
	
	Int XPM = RS_GV_XPMultiplier.GetValue() as Int
	
	Int Dam = Utility.RandomInt(1,29)
	akTarget.DamageAV("Health", Dam)
	
	Int XP = (Dam * 4) * XPM
	Int XPc = (Dam * 2) * XPM
	rsFrameworkMain.rsXPGain("attack", Dam)
	rsFrameworkMain.rsXPGain("constitution", Dam)
	
EndEvent 