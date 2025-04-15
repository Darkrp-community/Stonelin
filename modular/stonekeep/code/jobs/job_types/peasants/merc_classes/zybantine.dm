/datum/advclass/mercenary/zybantine
	name = "Zybantu Desert Rider"
	tutorial = "A cutthroat from the western countries, you've mastered the art of war and the price to your knowledge is high."
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
	outfit = /datum/outfit/job/roguetown/mercenary/zybantine
	category_tags = list(CTAG_MERCENARY)
	maximum_possible_slots = 6

	cmode_music = 'sound/music/cmode/combat_desertrider.ogg' //GREATEST COMBAT TRACK IN THE GAME SO FAR BESIDES MAYBE MANIAC2.OGG

/datum/outfit/job/roguetown/mercenary/zybantine/pre_equip(mob/living/carbon/human/H)
	..()

	head = /obj/item/clothing/head/helmet/sallet/zybantine
	neck = /obj/item/clothing/neck/keffiyeh/red
	armor = /obj/item/clothing/armor/brigandine/coatplates
	shirt = /obj/item/clothing/shirt/undershirt
	belt = /obj/item/storage/belt/leather/mercenary/shalal
	beltr = /obj/item/weapon/sword/long/rider
	pants = /obj/item/clothing/pants/tights/black
	shoes = /obj/item/clothing/shoes/shalal
	backr =/obj/item/weapon/shield/wood//placeholder until sprite update 2 where their rider shield is re added

	if(H.mind)//4 weapon skills and 2 steel armor pieces and a nerfed sword, has some weakness on neck and feet like any other but is hard to balance his armor
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/polearms, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/whipsflails, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/shields, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/medicine, 1, TRUE)//so they can heal themselves, after all they didn't survived the mercenary life without know how to sew their wou
		H.mind.adjust_skillrank(/datum/skill/misc/riding, 3, TRUE)//the desert riders didn't knew how to ride... until now

	if(!H.has_language(/datum/language/zybantine))
		H.grant_language(/datum/language/zybantine)
		to_chat(H, "<span class='info'>I can speak Zybean with ,z before my speech.</span>")

	H.change_stat("strength", 1)
	H.change_stat("constitution", 1)
	H.change_stat("endurance", 2)

	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
