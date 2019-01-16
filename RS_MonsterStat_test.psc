Scriptname RS_MonsterStat_test extends Actor  
{Test for monster combat stats}

Form Property RS_Formlist_Weapon_All Auto

Int Property DefStat Auto
Int Property HP Auto
Int Property DamMin Auto
Int Property DamMax Auto
Int Property HitMin Auto
Int Property HitMax Auto

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	
	Int PAB = rsFrameworkMain.GetAttackBonus().GetValue() as Int
	Int PA = rsFrameworkMain.GetAttackLVL().GetValue() as Int
	Int PAF = (PA + PAB)

	self.SetAV("Health", HP)
	
	

	If akAggressor == Game.GetPlayer()
	
		If DefStat > PAF
		
			;do nothing
			
		Else
		
			;take damage
			
			Weapon akSourceWeapon = akSource as Weapon
			
		EndIf
	
	EndIf
	
EndEvent 

Event OnActorAction(int actionType, Actor akActor, Form source, int slot)

	Int Hit = Utility.RandomInt(HitMin, HitMax)
	Int PDB = rsFrameworkMain.GetDefenceBonus().GetValue() as Int
	Int PD = rsFrameworkMain.GetDefenceLVL().GetValue() as Int		
	Int PDF = (PD + PDB)
	Int Damage = Utility.RandomInt(DamMin, DamMax)
	
	if akActor == Self
	
		If Hit > PDF
			If !source
				If !slot
					Game.GetPlayer().DamageActorValue("Health", Damage)
					Debug.Notification("hit by " + akActor + ".")
				EndIf
			EndIf	
		EndIf
	EndIf
	
EndEvent 