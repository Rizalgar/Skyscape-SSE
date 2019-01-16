Scriptname RS_SPELL_EXPTEST extends activemagiceffect  

GlobalVariable Property RS_GV_XPMultiplier Auto



Event OnEffectStart(Actor akTarget, Actor akCaster)
			
		Float XPM = RS_GV_XPMultiplier.GetValue()
		
		Float XP = 100 * XPM
	
		rsframeworkmain.rsxpgain("attack", XP)

		Debug.Notification("Gained " + XP + " experience")
EndEvent

