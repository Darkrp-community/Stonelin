/datum/advclass/mercenary/sk/boltslinger
	name = "Boltslinger"
	tutorial = "A cutthroat and a soldier of fortune, your mastery of the crossbow has brought you to many battlefields, all in pursuit of mammon."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = list(
		"Humen",
		"Elf",
		"Half-Elf",
		"Dwarf",
		"Tiefling",
		"Dark Elf",
		"Aasimar"
	)
	outfit = /datum/outfit/job/stonekeep/merc/boltslinger
	category_tags = list(CTAG_MERCENARY)
	maximum_possible_slots = 5


/datum/outfit/job/stonekeep/merc/boltslinger/pre_equip(mob/living/carbon/human/H)
	..()
	shoes = /obj/item/clothing/shoes/boots/leather
	head = /obj/item/clothing/head/helmet/kettle/slit
	gloves = /obj/item/clothing/gloves/angle
	belt = /obj/item/storage/belt/leather/mercenary
	armor = /obj/item/clothing/armor/gambeson/heavy
	beltr = /obj/item/weapon/sword/short
	beltl = /obj/item/ammo_holder/quiver/bolts
	backr = /obj/item/gun/ballistic/revolver/grenadelauncher/crossbow
	backl = /obj/item/weapon/shield/tower
	shirt = /obj/item/clothing/shirt/undershirt/random
	pants = /obj/item/clothing/pants/tights/random
	neck = /obj/item/clothing/neck/chaincoif
	backpack_contents = list(/obj/item/storage/belt/pouch/coins/poor, /obj/item/weapon/knife/hunting)
	if(H.mind)
		H.mind?.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/combat/shields, 3, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/combat/crossbows, 4, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/craft/tanning, 1, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/combat/unarmed, 1, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/craft/crafting, 1, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/misc/sewing, 2, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/misc/medicine, 2, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)

		H.merctype = 6

		H.change_stat("perception", 3)
		H.change_stat("endurance", 1)
		H.change_stat("strength", 1)
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
