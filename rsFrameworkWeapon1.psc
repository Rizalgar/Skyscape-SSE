Scriptname rsFrameworkWeapon1 extends ObjectReference  
{Handles requirements and stats}

;;hidden
GlobalVariable Property RS_Check_Statlock Auto Hidden

;;Stat Globals
GlobalVariable Property RS_GV_AttackLVL Auto
GlobalVariable Property RS_GV_StrengthLVL Auto
GlobalVariable Property RS_GV_RangedLVL Auto
GlobalVariable Property RS_GV_MagicLVL Auto
GlobalVariable Property RS_GV_PrayerLVL Auto

;;Weapon Bonuses
GlobalVariable Property RS_GV_AttackBonus Auto
GlobalVariable Property RS_GV_StrengthBonus Auto
GlobalVariable Property RS_GV_RangedBonus Auto
GlobalVariable Property RS_GV_MagicBonus Auto
GlobalVariable Property RS_GV_PrayerBonus Auto

;;Possible quest requirement
Quest Property ReqQ Auto

;;Possible level requirement
Int Property rAttackLvl Auto
Int Property rStrengthLVL Auto
Int Property rRangedLVL Auto
Int Property rMagicLVL Auto
Int Property rPrayerLVL Auto

;;Stat Bonuses
Int Property AttackBonus Auto
Int Property StrengthBonus Auto
Int Property RangedBonus Auto
Int Property MagicBonus Auto
Int Property PrayerBonus Auto

Int Property DamMin Auto
Int Property DamMax Auto

bool bCrashLock = False

Event OnEquipped(Actor akActor)

	If akActor == Game.GetPlayer()
		Weapon lefthand = akActor.GetEquippedWeapon(true)
		akActor.UnequipItem(lefthand, true, true)
		
		If RS_Check_Statlock.GetValue() != 0
			Weapon righthand = akActor.GetEquippedWeapon()
			akActor.UnequipItem(righthand, true, true)
			Debug.MessageBox("Item equip error! Unequipping")
		Else
			If ReqQ == none
				If RS_GV_AttackLVL.GetValue() < rAttackLvl
					bCrashLock == true
					Weapon righthand = Game.GetPlayer().GetEquippedWeapon()
					akActor.UnequipItem(righthand, true, true)
					Debug.Notification("You lack the required Attack level to equip this!")
				ElseIf RS_GV_StrengthLVL.GetValue() < rStrengthLVL
					bCrashLock == true
					Weapon righthand = Game.GetPlayer().GetEquippedWeapon()
					akActor.UnequipItem(righthand, true, true)
					Debug.Notification("You lack the required Strength level to equip this!")
				ElseIf RS_GV_RangedLVL.GetValue() < rRangedLVL
					bCrashLock == true
					Weapon righthand = Game.GetPlayer().GetEquippedWeapon()
					akActor.UnequipItem(righthand, true, true)
					Debug.Notification("You lack the required Ranged level to equip this!")
				ElseIf RS_GV_MagicLVL.GetValue() < rMagicLVL
					bCrashLock == true
					Weapon righthand = Game.GetPlayer().GetEquippedWeapon()
					akActor.UnequipItem(righthand, true, true)
					Debug.Notification("You lack the required Magic level to equip this!")
				ElseIf RS_GV_PrayerLVL.GetValue() < rPrayerLVL
					bCrashLock == true
					Weapon righthand = Game.GetPlayer().GetEquippedWeapon()
					akActor.UnequipItem(righthand, true, true)
					Debug.Notification("You lack the required Prayer level to equip this!")
				Else 
					bCrashLock == false
					ApplyStats(true)
				EndIf
			Else
				If ReqQ.IsCompleted() == false
					Weapon righthand = Game.GetPlayer().GetEquippedWeapon()
					akActor.UnequipItem(righthand, true, true)
					Debug.Notification("You need to complete the Quest '" + ReqQ.GetName() + "' before you can equip this.")
				Else
					If RS_GV_AttackLVL.GetValue() < rAttackLvl
						bCrashLock == true
						Weapon righthand = Game.GetPlayer().GetEquippedWeapon()
						akActor.UnequipItem(righthand, true, true)
						Debug.Notification("You lack the required Attack level to equip this!")
					ElseIf RS_GV_StrengthLVL.GetValue() < rStrengthLVL
						bCrashLock == true
						Weapon righthand = Game.GetPlayer().GetEquippedWeapon()
						akActor.UnequipItem(righthand, true, true)
						Debug.Notification("You lack the required Strength level to equip this!")
					ElseIf RS_GV_RangedLVL.GetValue() < rRangedLVL
						bCrashLock == true
						Weapon righthand = Game.GetPlayer().GetEquippedWeapon()
						akActor.UnequipItem(righthand, true, true)
						Debug.Notification("You lack the required Ranged level to equip this!")
					ElseIf RS_GV_MagicLVL.GetValue() < rMagicLVL
						bCrashLock == true
						Weapon righthand = Game.GetPlayer().GetEquippedWeapon()
						akActor.UnequipItem(righthand, true, true)
						Debug.Notification("You lack the required Magic level to equip this!")
					ElseIf RS_GV_PrayerLVL.GetValue() < rPrayerLVL
						bCrashLock == true
						Weapon righthand = Game.GetPlayer().GetEquippedWeapon()
						akActor.UnequipItem(righthand, true, true)
						Debug.Notification("You lack the required Prayer level to equip this!")
					Else 
						bCrashLock == false
						ApplyStats(true)
					EndIf
				EndIf
			EndIf
		EndIf
	EndIf
	
EndEvent

Event OnUnEquipped(actor akActor)
	if bCrashLock == true
		;do nothing
	else
		;debug.trace("Event OnUnEquipped fired!!")
		if RS_Check_StatLock.GetValue() != 0
			debug.messagebox("Equip error 002")
		else
			;Utility.Wait(2.0)
			ApplyStats(false)
		endif
	endif
EndEvent

Function ApplyStats(bool bApply)

	RS_Check_StatLock.SetValue(1)
		
	If bApply == true			
		RS_GV_AttackBonus.SetValue((RS_GV_AttackBonus.GetValue() + AttackBonus))
		RS_GV_StrengthBonus.SetValue((RS_GV_StrengthBonus.GetValue() + StrengthBonus))
		RS_GV_RangedBonus.SetValue((RS_GV_RangedBonus.GetValue() + RangedBonus))
		RS_GV_MagicBonus.SetValue((RS_GV_MagicBonus.GetValue() + MagicBonus))
		RS_GV_PrayerBonus.SetValue((RS_GV_PrayerBonus.GetValue() + PrayerBonus))
	ElseIf bApply == False		
		RS_GV_AttackBonus.SetValue(0)
		RS_GV_StrengthBonus.SetValue(0)
		RS_GV_MagicBonus.SetValue(0)
		RS_GV_RangedBonus.SetValue(0)
		RS_GV_PrayerBonus.SetValue(0)
	Else
		RS_GV_AttackBonus.SetValue((RS_GV_AttackBonus.GetValue() - AttackBonus))
		RS_GV_StrengthBonus.SetValue((RS_GV_StrengthBonus.GetValue() - StrengthBonus))
		RS_GV_RangedBonus.SetValue((RS_GV_RangedBonus.GetValue() - RangedBonus))
		RS_GV_MagicBonus.SetValue((RS_GV_MagicBonus.GetValue() - MagicBonus))
		RS_GV_PrayerBonus.SetValue((RS_GV_PrayerBonus.GetValue() - PrayerBonus))	
	EndIf
	
	RS_Check_StatLock.SetValue(0)

EndFunction 

Event OnActorAction(int actionType, Actor akActor, Form source, int slot)

	Int Dam = Utility.RandomInt(DamMin, DamMax)

	Target == Game.GetPlayer().GetCombatTarget()

	If akActor == Game.GetPlayer()
		
		If !source
			If !slot
				akTarget.DamageAV("Health", Dam)
			EndIf
		EndIf
		
	EndIf
	
EndEvent 