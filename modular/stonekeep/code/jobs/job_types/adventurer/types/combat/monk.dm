/datum/advclass/combat/sk/monk
	name = "Monk"
	allowed_sexes = list(MALE, FEMALE)
	tutorial = "A traveling monk of the God Ravox, unmatched in unarmed combat and with an unwavering devotion to Justice."
	allowed_races = ALL_RACES_SK_LIST
	outfit = /datum/outfit/job/sk/adventurer/monk
	min_pq = -10
	category_tags = list(CTAG_ADVENTURER)
	cmode_music = 'sound/music/cmode/adventurer/CombatMonk.ogg'
	vampcompat = FALSE

/datum/outfit/job/sk/adventurer/monk

/datum/outfit/job/sk/adventurer/monk/pre_equip(mob/living/carbon/human/H)
	..()
	if(prob(50))
		head = /obj/item/clothing/head/helmet/leather/headscarf
	neck = /obj/item/clothing/neck/psycross/silver/ravox
	shoes = /obj/item/clothing/shoes/shortboots
	armor = /obj/item/clothing/armor/leather/vest/monk
	if(prob(50))
		cloak = /obj/item/clothing/cloak/raincloak/furcloak/colored/brown
		armor = /obj/item/clothing/shirt/robe/colored/plain
	wrists = /obj/item/clothing/wrists/bracers/leather
	belt = /obj/item/storage/belt/leather/rope
	beltr = /obj/item/storage/belt/pouch/coins/poor
	backl = /obj/item/storage/backpack/backpack
	backr = /obj/item/weapon/polearm/woodstaff/quarterstaff/iron

	if(H.mind)
		if(H.patron != /datum/patron/divine/ravox)
			H.set_patron(/datum/patron/divine/ravox, TRUE)

		H.adjust_skillrank(/datum/skill/misc/reading, 3, TRUE)
		H.adjust_skillrank(/datum/skill/combat/unarmed, 5, TRUE)
		H.adjust_skillrank(/datum/skill/combat/wrestling, 4, TRUE)
		H.adjust_skillrank(/datum/skill/combat/polearms, pick(2,3), TRUE)
		H.adjust_skillrank(/datum/skill/combat/whipsflails, pick(2,3), TRUE)
		H.adjust_skillrank(/datum/skill/misc/sewing, 2, TRUE)
		H.adjust_skillrank(/datum/skill/misc/medicine, 1, TRUE)
		H.adjust_skillrank(/datum/skill/misc/climbing, 4, TRUE)
		H.adjust_skillrank(/datum/skill/misc/athletics, pick(2,2,3), TRUE)

		H.change_stat("strength", 3)
		H.change_stat("constitution", 2)
		H.change_stat("endurance", 2)
		H.change_stat("perception", -1)
		H.change_stat("speed", 1)

		ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)


