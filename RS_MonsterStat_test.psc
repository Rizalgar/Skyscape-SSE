Scriptname RS_MonsterStat_test extends Actor  
{Test for monster combat stats}

GlobalVariable Property RS_GV_DamageMax Auto
GlobalVariable Property RS_GV_DamageMin Auto
GlobalVariable Property RS_GV_XPMultiplier Auto
GlobalVariable Property RS_GV_AttackStyle Auto
GlobalVariable Property RS_GV_SlayerTask Auto
GlobalVariable Property RS_GV_StrengthBonus Auto
GlobalVariable Property RS_GV_StrengthLVL Auto

Int Property DefStat Auto
Int Property HP Auto
Int Property DamMin Auto
Int Property DamMax Auto
Int Property HitMin Auto
Int Property HitMax Auto
Float Property Experience Auto
Float Property ExperienceC Auto
Float Property ExperienceS Auto
Int Property SlayerID Auto
Bool DoOnce


Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	
	Int PAB = rsFrameworkMain.GetAttackBonus().GetValue() as Int
	Int PA = rsFrameworkMain.GetAttackLVL().GetValue() as Int
	Int PAF = PA * (PAB + 64)

	Int Hit = Utility.RandomInt(PA,PAF)
	Int Miss = Utility.RandomInt(1,DefStat)
	Int DamageMin = RS_GV_DamageMin.GetValue() as Int
	Int DamageMax = RS_GV_DamageMax.GetValue() as Int
	Int DamageStat = RS_GV_StrengthLVL.GetValue() as Int
	Int DamageBonus = RS_GV_StrengthBonus.GetValue() as Int
	Int DamageA = DamageStat + 11
	Float DamageB = 0.5 + DamageA * (DamageBonus + 64) / 640


	
	Float DamageFinal = Utility.RandomFloat(DamageMin, DamageB)
	
	self.startcombat(Game.GetPlayer())

	If akAggressor == Game.GetPlayer()
	
		If Miss > Hit
		
			self.DamageActorValue("Health", 0)
			
		Else
		
			self.DamageActorValue("Health", DamageFinal)
			
			
			
		EndIf
	
	EndIf
	
	If self.isdead()
		Experience()
	endif
	
EndEvent 

Function Experience()

	debug.notification("experience")

	Int AttStyle = RS_GV_AttackStyle.GetValue() as Int
	Int XPM = RS_GV_XPMultiplier.GetValue() as Int
	Float XPF = Experience * XPM
	Float XPC = ExperienceC * XPM
	Float XPCon = (Experience / 2) * XPM	
	
	If !DoOnce
		
		If AttStyle == 0 ;;accurate
			rsFrameworkMain.rsXPGain("attack", XPF)
			rsFrameworkMain.rsXPGain("constitution", XPC)
		ElseIf AttStyle == 1 ;; aggressive
			rsFrameworkMain.rsXPGain("strength", XPF)
			rsFrameworkMain.rsXPGain("constitution", XPC)
		ElseIf AttStyle == 2 ;; defensive
			rsFrameworkMain.rsXPGain("defence", XPF)
			rsFrameworkMain.rsXPGain("constitution", XPC)
		ElseIf AttStyle == 3 ;;controlled
			rsFrameworkMain.rsXPGain("attack", XPCon)
			rsFrameworkMain.rsXPGain("strength", XPCon)
			rsFrameworkMain.rsXPGain("defence", XPCon)
			rsFrameworkMain.rsXPGain("constitution", XPC)
		EndIf
		
		Slayer()
		
		DoOnce = True
	EndIf
			
EndFunction

Function Slayer()
	
	Int XPM = RS_GV_XPMultiplier.GetValue() as Int
	Float XPs = ExperienceS * XPM
	Int ST = RS_GV_SlayerTask.GetValue() as Int
	
	If ST == 1 && SlayerID == 1
		rsFrameworkMain.rsXPGain("slayer", XPs)
	ElseIf ST == 1 && SlayerID == 2
		rsFrameworkMain.rsXPGain("slayer", XPs)
	EndIf
	
EndFunction