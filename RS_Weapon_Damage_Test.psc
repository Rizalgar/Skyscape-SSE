Scriptname RS_Weapon_Damage_Test extends ActiveMagicEffect  
{test for weapon damage}

GlobalVariable Property RS_GV_DefenceLVL Auto
GlobalVariable Property RS_GV_DefenceBonus Auto

Int Property HitMin Auto
Int Property HitMax Auto
Int Property DamMin Auto
Int Property DamMax Auto

Event OnEffectStart(Actor akCaster, Actor akTarget)
	
	Int Def = RS_GV_DefenceLVL.GetValue() as Int
	Int DB = RS_GV_DefenceBonus.GetValue() as Int
	Int DefMin = Def + DB
	Int DefMax = Def * (DB + 64)
	
	Int DefRoll = Utility.RandomInt(DefMin, DefMax)
	
	Int Hit = Utility.RandomInt(HitMin, HitMax)
	
	Int Damage = Utility.RandomInt(DamMin, DamMax)
	
	If Hit > DefRoll
	
		akCaster.DamageAV("Health", Damage)
		
	EndIf
	
EndEvent 