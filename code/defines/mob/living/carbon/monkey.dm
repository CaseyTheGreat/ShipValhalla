/mob/living/carbon/monkey
	name = "monkey"
	voice_name = "monkey"
	voice_message = "chimpers"
	say_message = "chimpers"
	icon = 'monkey.dmi'
	icon_state = "monkey1"
	gender = NEUTER
	pass_flags = PASSTABLE

	var/obj/item/weapon/card/id/wear_id = null // Fix for station bounced radios -- Skie

/mob/living/carbon/monkey/rpbody // For admin RP
	update_icon = 0
	voice_message = "says"
	say_message = "says"
