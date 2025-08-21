/datum/job/jester
	title = "Jester"
	department_flag = NOBLEMEN
	total_positions = 1
	spawn_positions = 1

	allowed_races = ALL_RACES_SK_LIST

	tutorial = "The Grenzelhofts were known for their Jesters, wisemen with a tongue just as sharp as their wit. \
		You command a position of a fool, envious of the position your superiors have upon you. \
		Your cheap tricks and illusions of intelligence will only work for so long, \
		and someday you'll find yourself at the end of something sharper than you."
	spells = list(
		/datum/action/cooldown/spell/undirected/joke,
		/datum/action/cooldown/spell/undirected/tragedy,
		/datum/action/cooldown/spell/vicious_mockery,
	)
	outfit = /datum/outfit/job/stonekeep/jester
	display_order = 10
	min_pq = -20
	give_bank_account = TRUE

	cmode_music = 'sound/music/cmode/combat_jester.ogg'

/datum/outfit/job/stonekeep/jester/pre_equip(mob/living/carbon/human/H)
	..()
	shoes = /obj/item/clothing/shoes/jester
	pants = /obj/item/clothing/pants/tights
	armor = /obj/item/clothing/shirt/jester
	belt = /obj/item/storage/belt/leather
	beltr = /obj/item/storage/keyring/jester
	beltl = /obj/item/storage/belt/pouch
	head = /obj/item/clothing/head/jester
	neck = /obj/item/clothing/neck/coif

	H.adjust_skillrank(/datum/skill/combat/knives, pick(1,2,3), TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, pick(1,2,3), TRUE)
	H.adjust_skillrank(/datum/skill/misc/riding, pick(1,2,3,4,5,6), TRUE)
	H.adjust_skillrank(/datum/skill/combat/wrestling, pick(1,2,3), TRUE)
	H.adjust_skillrank(/datum/skill/misc/reading, pick(1,2,3,4,5,6), TRUE)
	H.adjust_skillrank(/datum/skill/misc/sneaking, pick(1,2,3,4,5), TRUE)
	H.adjust_skillrank(/datum/skill/misc/stealing, pick(1,2,3,4,5), TRUE)
	H.adjust_skillrank(/datum/skill/misc/lockpicking, pick(1,2,3,4,5), TRUE)
	H.adjust_skillrank(/datum/skill/misc/climbing, pick(4,5), TRUE) // Pirouette, but falling and hurting yourself IS pretty funny.
	H.adjust_skillrank(/datum/skill/misc/athletics, pick(4,4,4,4,5), TRUE)
	H.adjust_skillrank(/datum/skill/misc/music, pick(1,2,3,4,5,6), TRUE)
	H.adjust_skillrank(/datum/skill/craft/cooking, pick(1,2,3,4,5,6), TRUE)
	H.adjust_skillrank(/datum/skill/combat/wrestling, pick(1,2,3), TRUE)

	H.base_intelligence = rand(4, 16)
	H.base_fortune = rand(6, 20)
	H.base_strength = rand(5, 10)
	H.base_constitution = rand(7, 14)
	H.base_perception = rand(6, 18)
	H.base_speed = rand(6, 16)
	H.base_endurance = rand(10, 12)


	H.recalculate_stats(FALSE)


/*		if(H.gender == MALE)
			if(H.dna?.species)
				if(H.dna.species.id == "human")
					H.dna.species.soundpack_m = new /datum/voicepack/male/jester()
				if(H.dna.species.id == "dwarf")
					H.dna.species.soundpack_m = new /datum/voicepack/male/dwarf/jester()
				if(H.dna.species.id == "elf")
					H.dna.species.soundpack_m = new /datum/voicepack/male/elf/jester()*/
//		H.hair_color = "cd65cb"
//		H.facial_hair_color = "cd65cb"
//		H.update_body_parts_head_only()
	H.verbs |= /mob/living/carbon/human/proc/ventriloquate
	H.verbs |= /mob/living/carbon/human/proc/ear_trick
	ADD_TRAIT(H, TRAIT_EMPATH, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_NUTCRACKER, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_ZJUMP, TRAIT_GENERIC)
