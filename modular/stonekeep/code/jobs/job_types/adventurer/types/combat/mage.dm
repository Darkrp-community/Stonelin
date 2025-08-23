/datum/advclass/combat/sk/mage
	name = "Mage"
	tutorial = "Mages are usually grown-up apprentices of wizards. They are seeking adventure, using their arcyne knowledge to aid other adventurers."
	allowed_sexes = list(MALE)
	allowed_races = list(
		"Humen",
		"Elf",
		"Half-Elf",
		"Dwarf",
		"Tiefling",
		"Dark Elf",
		"Aasimar"
	)
	outfit = /datum/outfit/job/sk/adventurer/mage
	category_tags = list(CTAG_ADVENTURER)
	min_pq = -10
	maximum_possible_slots = 2
	cmode_music = 'sound/music/cmode/adventurer/CombatSorcerer.ogg'

/datum/outfit/job/sk/adventurer/mage

/datum/outfit/job/sk/adventurer/mage/pre_equip(mob/living/carbon/human/H)
	..()
	head = /obj/item/clothing/head/roguehood/colored/mage
	shoes = /obj/item/clothing/shoes/simpleshoes
	armor = /obj/item/clothing/shirt/robe/colored/mage
	belt = /obj/item/storage/belt/leather/rope
	backr = /obj/item/storage/backpack/satchel
	beltl = /obj/item/reagent_containers/glass/bottle/manapot
	r_hand = /obj/item/weapon/polearm/woodstaff
	if(H.mind)
		if(!(H.patron == /datum/patron/divine/noc || /datum/patron/inhumen/zizo))	//Magicians must follow Noc or Zizo to have access to magic.
			H.set_patron(/datum/patron/divine/noc, TRUE)

		H.adjust_skillrank(/datum/skill/misc/reading, 4, TRUE)
		H.adjust_skillrank(/datum/skill/magic/arcane, 3, TRUE)
		H.adjust_skillrank(/datum/skill/craft/cooking, 1, TRUE)
		H.adjust_skillrank(/datum/skill/misc/medicine, 1, TRUE)
		H.adjust_skillrank(/datum/skill/craft/alchemy, 2, TRUE)
		if(H.age == AGE_OLD)
			head = /obj/item/clothing/head/wizhat/gen
			armor = /obj/item/clothing/shirt/robe/colored/plain
			backl = /obj/item/storage/backpack/backpack
			H.adjust_skillrank(/datum/skill/magic/arcane, 1, TRUE)
			H.change_stat("intelligence", 1)
			H.adjust_spell_points(2)
		H.change_stat("strength", -2)
		H.change_stat("intelligence", 3)
		H.change_stat("constitution", -2)
		H.change_stat("endurance", -1)
		H.change_stat("speed", -2)

		H.adjust_spell_points(5)
		H.add_spell(/datum/action/cooldown/spell/undirected/touch/prestidigitation)
