//shield
/datum/advclass/combat/sk/cleric
	name = "Cleric"
	tutorial = "Clerics are wandering warriors of the Gods, drawn from the ranks of temple acolytes who demonstrated martial talent. Protected by armor and zeal, they are a force to be reckoned with."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = list(
		"Humen",
		"Elf",
		"Half-Elf",
		"Dwarf",
		"Dark Elf",
		"Aasimar"
	)
	vampcompat = FALSE
	outfit = /datum/outfit/job/sk/adventurer/cleric
	category_tags = list(CTAG_ADVENTURER)
	min_pq = -10
	maximum_possible_slots = 4

/datum/outfit/job/sk/adventurer/cleric
	allowed_patrons = ALL_CLERIC_PATRONS

/datum/outfit/job/sk/adventurer/cleric/pre_equip(mob/living/carbon/human/H)
	..()
	H.virginity = TRUE

	armor = /obj/item/clothing/armor/cuirass/iron // Halfplate has been made heavy armor, billions must make due.
	shirt = /obj/item/clothing/armor/gambeson/light
	pants = /obj/item/clothing/pants/trou/leather
	shoes = /obj/item/clothing/shoes/boots/leather
	belt = /obj/item/storage/belt/leather
	beltl = /obj/item/weapon/mace/spiked
	beltr = /obj/item/storage/belt/pouch/coins/poor
	head = /obj/item/clothing/neck/chaincoif/iron//this way they get a cut/stab protection on the head, while they carry a realistic padded coif to mitigate blunt damage and don't have hair in the chain

	switch(H.patron?.type)//dendor cleric removed until i get to work on the forest guardian class
		if(/datum/patron/divine/astrata)
			wrists = /obj/item/clothing/neck/psycross/silver/astrata
			cloak = /obj/item/clothing/cloak/stabard/templar/astrata
			neck = /obj/item/clothing/neck/coif/cloth
		if(/datum/patron/divine/necra)
			head = /obj/item/clothing/head/padded/deathface
			wrists = /obj/item/clothing/neck/psycross/silver/necra
			cloak = /obj/item/clothing/cloak/stabard/templar/necra
			neck = /obj/item/clothing/neck/coif/cloth
		if(/datum/patron/divine/eora)
			wrists = /obj/item/clothing/neck/psycross/silver/eora
			cloak = /obj/item/clothing/cloak/stabard/templar/eora
			neck = /obj/item/clothing/neck/coif/cloth
			H.virginity = FALSE
		if(/datum/patron/divine/ravox)
			wrists = /obj/item/clothing/neck/psycross/silver/ravox
			cloak =  /obj/item/clothing/cloak/stabard/templar/ravox
			neck = /obj/item/clothing/neck/coif/cloth
		if(/datum/patron/divine/noc)
			wrists = /obj/item/clothing/neck/psycross/noc
			cloak = /obj/item/clothing/cloak/stabard/templar/noc
			neck = /obj/item/clothing/neck/coif/cloth
		if(/datum/patron/divine/pestra)
			wrists = /obj/item/clothing/neck/psycross/silver/pestra
			cloak = /obj/item/clothing/cloak/stabard/templar/pestra
			neck = /obj/item/clothing/neck/coif/cloth
		if(/datum/patron/divine/abyssor)
			wrists = /obj/item/clothing/neck/psycross/silver/abyssor
			cloak = /obj/item/clothing/cloak/tabard/crusader
			neck = /obj/item/clothing/neck/coif/cloth
		if(/datum/patron/divine/malum)
			wrists = /obj/item/clothing/neck/psycross/silver/malum
			cloak = /obj/item/clothing/cloak/stabard/templar/malum
			neck = /obj/item/clothing/neck/coif/cloth
		if(/datum/patron/divine/xylix)
			wrists = /obj/item/clothing/neck/psycross/silver/xylix
			cloak = /obj/item/clothing/cloak/tabard/crusader
			neck = /obj/item/clothing/neck/coif/cloth
		else // Failsafe
			cloak = /obj/item/clothing/cloak/tabard/crusader // Give us a generic crusade tabard
			wrists = /obj/item/clothing/neck/psycross/silver // Give us a silver psycross for protection against lickers
			neck = /obj/item/clothing/neck/coif/cloth


	if(H.mind)
		H.adjust_skillrank(/datum/skill/combat/axesmaces, 3, TRUE)
		H.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
		H.adjust_skillrank(/datum/skill/combat/crossbows, 2, TRUE)
		H.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
		H.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
		H.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
		H.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
		H.adjust_skillrank(/datum/skill/misc/reading, 3, TRUE)
		H.adjust_skillrank(/datum/skill/magic/holy, 1, TRUE)
		H.adjust_skillrank(/datum/skill/craft/cooking, 1, TRUE)
		if(H.age == AGE_OLD)
			H.adjust_skillrank(/datum/skill/combat/axesmaces, 1, TRUE)
			H.adjust_skillrank(/datum/skill/magic/holy, 1, TRUE)
		H.change_stat("strength", 1)
		H.change_stat("intelligence", 1)
		H.change_stat("constitution", 1)
		H.change_stat("endurance", 2)
		H.change_stat("speed", -1)
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC) // Even if it has limited slots, it is a common drifter role available to anyone. Their armor also is not heavy, so medium armor training is enough

	var/holder = H.patron?.devotion_holder
	if(holder)
		var/datum/devotion/devotion = new holder()
		devotion.make_cleric()
		devotion.grant_to(H)
