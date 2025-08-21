/datum/job/steward
	title = "Steward"
	department_flag = NOBLEMEN
	job_flags = (JOB_ANNOUNCE_ARRIVAL | JOB_SHOW_IN_CREDITS | JOB_EQUIP_RANK | JOB_NEW_PLAYER_JOINABLE)
	display_order = 4
	faction = FACTION_TOWN
	bypass_lastclass = TRUE
	total_positions = 1
	spawn_positions = 1

	allowed_races = RACES_PLAYER_ROYALTY
	allowed_sexes = list(MALE, FEMALE)
	allowed_patrons = ALL_TEMPLE_PATRONS

	tutorial = "Coin, Coin, Coin! Oh beautiful coin: \
	You're addicted to it, and you hold the position as the King's personal treasurer of both coin and information. \
	You know the power silver and gold has on a man's mortal soul, \
	and you know just what lengths they'll go to in order to get even more. Keep your festering economy and your rats alive, theyre the only two things you can weigh any trust into anymore."
	outfit = /datum/outfit/job/stonekeep/steward
	give_bank_account = 100
	cmode_music = 'modular/stonekeep/sound/cmode/combat_scholar.ogg'


/datum/outfit/job/steward
	job_bitflag = BITFLAG_ROYALTY

/datum/outfit/job/stonekeep/steward/pre_equip(mob/living/carbon/human/H)
	..()
	H.virginity = TRUE
	if(H.gender == FEMALE)
		armor = /obj/item/clothing/shirt/dress/stewarddress
	else
		shirt = /obj/item/clothing/shirt/undershirt/fancy
		pants = /obj/item/clothing/pants/trou/leathertights

	ADD_TRAIT(H, TRAIT_SEEPRICES, type)
	shoes = /obj/item/clothing/shoes/shortboots
	head = /obj/item/clothing/head/chaperon/colored/greyscale/chaperonsecondary
	cloak = /obj/item/clothing/cloak/raincloak/furcloak
	armor = /obj/item/clothing/armor/gambeson/arming
	belt = /obj/item/storage/belt/leather/plaquesilver
	beltr = /obj/item/storage/keyring/steward
	beltl = /obj/item/weapon/knife/dagger/steel
	backr = /obj/item/storage/backpack/satchel
	backpack_contents = list(/obj/item/storage/belt/pouch/coins/rich = 1, /obj/item/lockpickring/mundane = 1)

	H.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/reading, 6, TRUE)
	H.adjust_skillrank(/datum/skill/misc/riding, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/stealing, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/sneaking, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/lockpicking, 6, TRUE)
	H.change_stat("strength", -2)
	H.change_stat("intelligence", 8)
	H.change_stat("constitution", -2)
	H.change_stat("speed", -2)
	ADD_TRAIT(H, TRAIT_NOBLE, TRAIT_GENERIC)
