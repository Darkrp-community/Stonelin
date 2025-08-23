/datum/job/stonekeep/hammerite
	title = "Hammerite"
	tutorial = "As a long-standing and dedicated member of the Maker's Guild, you have risen to the illustrious rank of Master Builder. \
				Your work is praise to Malum, either through excavation or construction, \
				if only you had the time to rebuild what has been lost to the ruin of time... your work will shape the future."
	faction = FACTION_TOWN
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_PLAYER_NONDISCRIMINATED
	job_flags = (JOB_ANNOUNCE_ARRIVAL | JOB_SHOW_IN_CREDITS | JOB_EQUIP_RANK | JOB_NEW_PLAYER_JOINABLE)
	outfit = /datum/outfit/job/stonekeep/hammerite
	department_flag = SERFS
	display_order = MASON_ORDER
	give_bank_account = 30
	total_positions = 2
	spawn_positions = 2
	bypass_lastclass = TRUE
	min_pq = -50
	allowed_patrons = ALL_TEMPLE_PATRONS
	cmode_music = 'modular/stonekeep/sound/cmode/combat_dwarf.ogg'

/datum/outfit/job/stonekeep/hammerite/pre_equip(mob/living/carbon/human/H)
	..()
	if(H.patron != /datum/patron/divine/malum)
		H.set_patron(/datum/patron/divine/malum, TRUE)

	H.adjust_skillrank(/datum/skill/combat/axesmaces, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/wrestling, rand(1,3), TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, rand(1,3), TRUE)
	H.adjust_skillrank(/datum/skill/craft/carpentry, 3, TRUE)
	H.adjust_skillrank(/datum/skill/labor/lumberjacking, 1, TRUE)
	H.adjust_skillrank(/datum/skill/craft/masonry, 3, TRUE)
	H.adjust_skillrank(/datum/skill/labor/mining, 3, TRUE)
	H.adjust_skillrank(/datum/skill/craft/crafting, 4, TRUE)
	H.adjust_skillrank(/datum/skill/craft/engineering, 4, TRUE)
	H.adjust_skillrank(/datum/skill/misc/lockpicking, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/swimming, 1, TRUE)
	H.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
	H.adjust_skillrank(/datum/skill/craft/smelting, 4, TRUE)
	H.adjust_skillrank(/datum/skill/misc/reading, 3, TRUE)
	if(H.mind)
		H.grant_language(/datum/language/dwarvish)

	ring = /obj/item/key/guildring
	pants = /obj/item/clothing/pants/tights/makers
	armor = /obj/item/clothing/armor/leather/vest/colored/black
	shirt = /obj/item/clothing/shirt/undershirt/colored/red
	shoes = /obj/item/clothing/shoes/boots/leather
	belt = /obj/item/storage/belt/leather
	neck = /obj/item/clothing/neck/coif
	beltr = /obj/item/storage/belt/pouch/coins/poor
	beltl = /obj/item/weapon/pick
	backr = /obj/item/weapon/hammer/sledgehammer
	backl = /obj/item/storage/backpack/backpack
	head = /obj/item/clothing/head/helmet/leather/headscarf
	backpack_contents = list( /obj/item/weapon/chisel = 1, /obj/item/flint = 1, /obj/item/weapon/knife/villager = 1, /obj/item/key/mason = 1, /obj/item/flashlight/flare/torch/lantern = 1)

	H.change_stat(STATKEY_STR, 1)
	H.change_stat(STATKEY_INT, 2)
	H.change_stat(STATKEY_END, 1)
	H.change_stat(STATKEY_CON, 1)
	H.change_stat(STATKEY_SPD, -1)

	if(H.dna.species.id == "dwarf")
		head = /obj/item/clothing/head/helmet/leather/minershelm
