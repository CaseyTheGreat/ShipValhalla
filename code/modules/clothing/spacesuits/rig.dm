/obj/item/clothing/head/helmet/space/rig
	name = "engineer RIG helmet"
	desc = "A special helmet designed for work in a hazardous, low-pressure environment. Has radiation shielding."
	icon_state = "rig-engineering"
	item_state = "rig_helm"
	armor = list(melee = 40, bullet = 5, laser = 20,energy = 5, bomb = 35, bio = 100, rad = 60)
	allowed = list(/obj/item/device/flashlight)

/obj/item/clothing/head/helmet/space/rig/mining
	name = "mining RIG helmet"
	icon_state = "rig-mining"


/obj/item/clothing/head/helmet/space/rig/elite
	name = "advanced RIG helmet"
	icon_state = "rig-white"


/obj/item/clothing/suit/space/rig
	name = "engineer RIG suit"
	desc = "A special suit that protects against hazardous, low pressure environments. Has radiation shielding."
	icon_state = "rig-engineering"
	item_state = "rig_suit"
	protective_temperature = 5000 //For not dieing near a fire, but still not being great in a full inferno
	slowdown = 2
	armor = list(melee = 40, bullet = 5, laser = 20,energy = 5, bomb = 35, bio = 100, rad = 60)
	allowed = list(/obj/item/device/flashlight,/obj/item/weapon/tank,/obj/item/weapon/satchel,/obj/item/device/t_scanner,/obj/item/weapon/pickaxe, /obj/item/weapon/rcd)

/obj/item/clothing/suit/space/rig/mining
	icon_state = "rig-mining"
	name = "mining RIG suit"

/obj/item/clothing/suit/space/rig/elite
	icon_state = "rig-white"
	name = "advanced RIG suit"
	protective_temperature = 10000
