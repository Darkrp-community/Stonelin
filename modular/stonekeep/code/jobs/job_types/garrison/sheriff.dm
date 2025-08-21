/datum/job/captain
	title = "Sheriff"
	department_flag = GARRISON
	job_flags = (JOB_ANNOUNCE_ARRIVAL | JOB_SHOW_IN_CREDITS | JOB_EQUIP_RANK | JOB_NEW_PLAYER_JOINABLE)
	faction = FACTION_TOWN
	bypass_lastclass = TRUE
	display_order = SHERIFF_ORDER
	total_positions = 1
	spawn_positions = 1
	spells = list(/datum/action/cooldown/spell/undirected/list_target/convert_role/guard)
	allowed_races = RACES_PLAYER_NONDISCRIMINATED
	allowed_sexes = list(MALE)
	allowed_patrons = ALL_TEMPLE_PATRONS
	tutorial = "Appointed by your liege Lord to uphold their Law and be their champion in times of strife. You command the garrison, to help keep order and peace within the Lords demesne and defend it against the many dangers of the land."
	outfit = /datum/outfit/job/stonekeep/sheriff
	give_bank_account = 120

	selection_color = "#a13322"
	cmode_music = 'modular/stonekeep/sound/cmode/combat_quarte.ogg'
	min_pq = 0

/datum/job/captain/after_spawn(mob/living/L, mob/M, latejoin = TRUE)
	..()
	if(ishuman(L))
		var/mob/living/carbon/human/H = L
		var/prev_real_name = H.real_name
		var/prev_name = H.name
		var/honorary = "Sir"
		if(H.gender == FEMALE)
			honorary = "Dame"
		H.real_name = "[honorary] [prev_real_name]"
		H.name = "[honorary] [prev_name]"

/datum/outfit/job/stonekeep/sheriff/pre_equip(mob/living/carbon/human/H)
	..()
	head = /obj/item/clothing/head/helmet/bascinet
	gloves = /obj/item/clothing/gloves/plate
	wrists = /obj/item/clothing/wrists/bracers
	pants = /obj/item/clothing/pants/trou/leather/heavy
	armor = /obj/item/clothing/armor/plate
	cloak = /obj/item/clothing/cloak/stabard/surcoat
	neck = /obj/item/clothing/neck/bevor
	shirt = /obj/item/clothing/armor/gambeson
	shoes = /obj/item/clothing/shoes/boots/armor
	backr = /obj/item/storage/backpack/satchel
	belt = /obj/item/storage/belt/leather/black
	beltl = /obj/item/flashlight/flare/torch/lantern
	beltr = /obj/item/weapon/mace/steel
	r_hand = /obj/item/weapon/knife/dagger/steel

	backpack_contents = list(/obj/item/storage/keyring/captain = 1, /obj/item/signal_horn = 1, /obj/item/weapon/knife/dagger/steel = 1)
	if(H.mind)
		H.adjust_skillrank(/datum/skill/combat/axesmaces, 4, TRUE)
		H.adjust_skillrank(/datum/skill/combat/bows, 3, TRUE)
		H.adjust_skillrank(/datum/skill/combat/crossbows, 3, TRUE)
		H.adjust_skillrank(/datum/skill/combat/wrestling, 5, TRUE)
		H.adjust_skillrank(/datum/skill/combat/unarmed, 5, TRUE)
		H.adjust_skillrank(/datum/skill/combat/swords, 4, TRUE)
		H.adjust_skillrank(/datum/skill/combat/polearms, 4, TRUE)
		H.adjust_skillrank(/datum/skill/combat/whipsflails, 2, TRUE)
		H.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
		H.adjust_skillrank(/datum/skill/combat/shields, 4, TRUE)
		H.adjust_skillrank(/datum/skill/misc/swimming, 3, TRUE)
		H.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
		H.adjust_skillrank(/datum/skill/misc/athletics, 4, TRUE)
		H.adjust_skillrank(/datum/skill/misc/reading, 2, TRUE)
		H.adjust_skillrank(/datum/skill/misc/riding, 3, TRUE)
		H.change_stat("strength", 3)
		H.change_stat("perception", 2)
		H.change_stat("intelligence", 1)
		H.change_stat("constitution", 1)
		H.change_stat("endurance", 2)
		H.change_stat("speed", 1)
	ADD_TRAIT(H, TRAIT_NOBLE, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_KNOWBANDITS, TRAIT_GENERIC)
	H.verbs |= /mob/proc/haltyell

/datum/outfit/job/stonekeep/sheriff
	job_bitflag = BITFLAG_ROYALTY | BITFLAG_GARRISON



