/datum/job/butler
	title = "Butler"
	department_flag = NOBLEMEN
	job_flags = (JOB_ANNOUNCE_ARRIVAL | JOB_SHOW_IN_CREDITS | JOB_EQUIP_RANK | JOB_NEW_PLAYER_JOINABLE)
	faction = FACTION_TOWN
	bypass_lastclass = TRUE
	total_positions = 2
	spawn_positions = 2
	allowed_patrons = ALL_TEMPLE_PATRONS

	f_title = "Maid"
	allowed_races = RACES_PLAYER_ROYALTY
	allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED, AGE_OLD, AGE_IMMORTAL)
	tutorial = "Your blade is a charcuterie of artisanal cheeses and meat, your armor wit and classical training. You are part of the royal family now, and hold a distinguished position as the head of the royal household staff. You wear their colors and have a semblance of dignity, for without you and the servants under your command the court would have all starved to death."
	outfit = /datum/outfit/job/stonekeep/butler
	display_order = SERVANT_ORDER
	min_pq = -10
	give_bank_account = 25 // Along with the pouch, enough to purchase some ingredients from the farm and give hard working servants a silver here and there. Still need the assistance of the crown's coffers to do anything significant
	cmode_music = 'modular/stonekeep/sound/cmode/combat_scholar.ogg'

/datum/outfit/job/stonekeep/butler/pre_equip(mob/living/carbon/human/H)
	..()
	armor = /obj/item/clothing/armor/leather/vest/colored/butler
	backr = /obj/item/storage/backpack/satchel
	belt = /obj/item/storage/belt/leather
	beltl = /obj/item/storage/belt/pouch/coins/mid
	beltr = /obj/item/storage/keyring/butler

	H.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/reading, 3, TRUE) // A well educated head of servants should at least have skilled literacy level
	H.adjust_skillrank(/datum/skill/craft/cooking, 4, TRUE)
	H.adjust_skillrank(/datum/skill/labor/butchering, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/medicine, 2, TRUE)
	H.adjust_skillrank(/datum/skill/labor/farming, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/sewing, 3, TRUE)
	H.adjust_skillrank(/datum/skill/craft/crafting, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/sneaking, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/stealing, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/music, pick(1,1,2,3), TRUE)
	H.adjust_skillrank(/datum/skill/misc/riding, 1, TRUE) // Privilege of living a life raising nobility. Knows the very basics about riding a mount
	H.change_stat("strength", -1)
	H.change_stat("intelligence", 2)
	H.change_stat("perception", 1)
	H.change_stat("endurance", 1)

	if(H.gender == MALE)
		pants = /obj/item/clothing/pants/tights/colored/uncolored
		shirt = /obj/item/clothing/shirt/undershirt/colored/uncolored
		shoes = /obj/item/clothing/shoes/nobleboot

	else
//		pants = /obj/item/clothing/pants/tights/stockings/white
		shirt = /obj/item/clothing/shirt/dress/gen/colored/maid
		shoes = /obj/item/clothing/shoes/simpleshoes
		cloak = /obj/item/clothing/cloak/apron
		belt = /obj/item/storage/belt/leather/cloth/lady

