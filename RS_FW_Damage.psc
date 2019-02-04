Scriptname RS_FW_Damage extends Actor  
{Main framework handling all damage formulas}

;; Globals
Actor Property PlayerRef Auto
GlobalVariable Property RS_GV_DamageMax Auto
GlobalVariable Property RS_GV_DamageMin Auto
GlobalVariable Property RS_GV_AttackBonus Auto
GlobalVariable Property RS_GV_AttackLvl Auto
GlobalVariable Property RS_GV_AttackXP Auto
GlobalVariable Property RS_GV_StrengthBonus Auto
GlobalVariable Property RS_GV_StrengthLvl Auto
GlobalVariable Property RS_GV_StrengthXP Auto
GlobalVariable Property RS_GV_RangedBonus Auto
GlobalVariable Property RS_GV_RangedLvl Auto
GlobalVariable Property RS_GV_RangedXP Auto
GlobalVariable Property RS_GV_MagicBonus Auto
GlobalVariable Property RS_GV_MagicLvl Auto
GlobalVariable Property RS_GV_MagicXP Auto
GlobalVariable Property RS_GV_DefenceBonus Auto
GlobalVariable Property RS_GV_DefenceLvl Auto
GlobalVariable Property RS_GV_DefenceXP Auto
GlobalVariable Property RS_GV_ConstitutionXP Auto
GlobalVariable Property RS_GV_AttackStyle Auto
GlobalVariable Property RS_GV_SlayerTask Auto
GlobalVariable Property RS_GV_pPrayerAttack Auto
GlobalVariable Property RS_GV_pPrayerStrength Auto
GlobalVariable Property RS_GV_pPrayerDefence Auto
GlobalVariable Property RS_GV_pPrayerRanged Auto
GlobalVariable Property RS_GV_pPrayerMagic Auto
GlobalVariable Property RS_GV_VoidBonus Auto
GlobalVariable Property RS_GV_SlayerHelm Auto
GlobalVariable Property RS_GV_SlayerStreak Auto
GlobalVariable Property RS_GV_ChaosGauntlets Auto
GlobalVariable Property RS_GV_TomeFire Auto
GlobalVariable Property RS_GV_TomeFrost Auto
FormList Property RS_FL_Spells Auto

;; Local Variables
Int Property HitMin Auto
Int Property HitMax Auto
Int Property DamMin Auto
Int Property DamMax Auto
Int Property DefStat Auto
Float Property Experience Auto
Float Property SlayerExperience Auto
Float Property ConstitutionExperience Auto
Int Property SlayerID Auto
Bool DoOnce

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)

	;Void Int
	Float VB = RS_GV_VoidBonus.GetValue() as Float
	
	;Slayer Int
	Float SHB = RS_GV_SlayerHelm.GetValue() as Float
	
	;Chaos Gauntlets Int
	Int CG = RS_GV_ChaosGauntlets.GetValue() as Int
	
	;Tomes Int
	Float ToFire = RS_GV_TomeFire.GetValue() as Float
	Float ToFrost = RS_GV_TomeFrost.GetValue() as Float

	;Prayer Int
	Float pAtt = RS_GV_pPrayerAttack.GetValue() as Float
	Float pStr = RS_GV_pPrayerStrength.GetValue() as Float
	Float pDef = RS_GV_pPrayerDefence.GetValue() as Float
	Float pRan = RS_GV_pPrayerRanged.GetValue() as Float
	Float pMag = RS_GV_pPrayerMagic.GetValue()as Float
	
	;Damage Int
	Int bDamMin = RS_GV_DamageMin.GetValue() as Int
	Int bDamMax = RS_GV_DamageMax.GetValue() as Int
	
	;;Melee Attack Int
	Int MeAB = RS_GV_AttackBonus.GetValue() as Int
	Int MeAL = RS_GV_AttackLvl.GetValue() as Int
	Float MeAF = ((MeAB + MeAF) + 64) * pAtt * VB
	
	;Ranged Attack Int
	Int RaAB = RS_GV_RangedBonus.GetValue() as Int
	Int RaAL = RS_GV_RangedLvl.GetValue() as Int
	Float RaAF = ((RaAB + RaAL) + 64) * pRan * VB
	
	;Magic Attack Int
	Int MaAB = RS_GV_MagicBonus.GetValue() as Int
	Int MaAL = RS_GV_MagicLvl.GetValue() as Int
	Float MaAF = ((MaAB + MaAL) + 64) * pMag * VB
	
	;Melee Damage
	Int MeSB = RS_GV_StrengthBonus.GetValue() as Int
	Int MeSL = RS_GV_StrengthLvl.GetValue() as Int
	Float MeDamA = MeSL * pStr + 11 * VB * SHB
	Float MeDamB = ((0.5 + MeDamA) * (MeSB + 64) / 640)
	
	;Ranged Damage
	Int RaRB = RS_GV_RangedBonus.GetValue() as Int
	Int RaRL = RS_GV_RangedLvl.GetValue() as Int
	Float RaDamA = RaRL * pRan + 11 * VB * SHB
	Float RaDamB = ((0.5 + RaDamA) * (RaRL + 64) / 640)
	
	;Magic Damage
	Int MaMB = RS_GV_MagicBonus.GetValue() as Int
	Int MaML = RS_GV_MagicLvl.GetValue() as Int
	Float MaDamA = ((((bDamMax + CG) * ToFire) * ToFrost) * SHB)
	
	Float meDamage = Utility.RandomFloat(bDamMin, MeDamB)
	Float maDamage = Utility.RandomFloat(bDamMin, MaDamA)
	Float raDamage = Utility.RandomFloat(bDamMin, RaDamB)
	
	Float meHit = Utility.RandomFloat(MeAl, MeAF)
	Float maHit = Utility.RandomFloat(MaAL, MaAF)
	Float RaHit = Utility.RandomFloat(RaRL, RaAF)
	Float Miss = Utility.RandomFloat(1, DefStat)
	
	If akAggressor == PlayerRef
	
		If akSource == RS_FL_Spells as FormList
			
			If Miss > MaAF
				Self.DamageActorValue("Health", 0)
			ElseIf MaAF > Miss
				Self.DamageActorValue("Health", maDamage)
			EndIf
		
		EndIf
		
		If Self.Isdead()
			Experience()
		EndIf
		
	EndIf
	
EndEvent

Function Experience()

	If !DoOnce

		Int aStyle = RS_GV_AttackStyle.GetValue() as Int
		
		If aStyle == 0
			RS_GV_AttackXP.SetValue(RS_GV_AttackXP.GetValue() + Experience)
			RS_GV_ConstitutionXP.SetValue(RS_GV_ConstitutionXP.GetValue() + ConstitutionExperience)
		ElseIf aStyle == 1
			RS_GV_StrengthXP.SetValue(RS_GV_StrengthXP.GetValue() + Experience)
			RS_GV_ConstitutionXP.SetValue(RS_GV_ConstitutionXP.GetValue() + ConstitutionExperience)
		ElseIf aStyle == 2
			RS_GV_DefenceXP.SetValue(RS_GV_DefenceXP.GetValue() + Experience)
			RS_GV_ConstitutionXP.SetValue(RS_GV_ConstitutionXP.GetValue() + ConstitutionExperience)
		ElseIf aStyle == 3
			RS_GV_DefenceXP.SetValue(RS_GV_DefenceXP.GetValue() + Experience)
			RS_GV_StrengthXP.SetValue(RS_GV_StrengthXP.GetValue() + Experience)
			RS_GV_AttackXP.SetValue(RS_GV_AttackXP.GetValue() + Experience)
			RS_GV_ConstitutionXP.SetValue(RS_GV_ConstitutionXP.GetValue() + ConstitutionExperience)
		EndIf
	DoOnce == True
	EndIf
	
EndFunction