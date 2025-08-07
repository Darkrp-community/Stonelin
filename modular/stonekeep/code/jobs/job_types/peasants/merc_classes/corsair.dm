/datum/advclass/mercenary/sk/corsair
	name = "Corsair"
	tutorial = "Banished from polite society, you once found kin with privateers, working adjacent to a royal navy. After the Red Flag battered itself in the wind one last time, your purse was still not satisfied... And yet he complained that his belly was not full."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = list(
		SPEC_ID_TIEFLING
	)
	outfit = /datum/outfit/job/stonekeep/merc/corsair
	category_tags = list(CTAG_SKMERCENARY)
	cmode_music = 'modular/stonekeep/sound/cmode/combat_duelist.ogg'
	maximum_possible_slots = 6

/datum/outfit/job/stonekeep/merc/corsair
	head = /obj/item/clothing/head/helmet/leather/headscarf
	pants = /obj/item/clothing/pants/tights/sailor
	belt = /obj/item/storage/belt/leather/mercenary
	armor = /obj/item/clothing/armor/leather/jacket/sea
	backl = /obj/item/storage/backpack/satchel
//	backpack_contents = list(/obj/item/natural/worms/leech = 2,/obj/item/storage/belt/pouch/coins/mid)//too much mercenary role preference from vanderlin
	beltl = /obj/item/weapon/sword/sabre/cutlass
	beltr = /obj/item/weapon/knife/throwingknife
	shoes = /obj/item/clothing/shoes/boots
	backpack_contents = list (/obj/item/storage/belt/pouch/coins/poor = 1)

/datum/outfit/job/stonekeep/merc/corsair/pre_equip(mob/living/carbon/human/H)
	..()
	if(H.mind)

		H.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
		H.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
		H.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
		H.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE) // Swords / Nonlethal.
		H.adjust_skillrank(/datum/skill/misc/swimming, 4, TRUE)
		H.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE) // For jumping off roofs. Don't lower.//the mercenaries aren't rogues
		H.adjust_skillrank(/datum/skill/misc/sneaking, 2, TRUE) // Most other classes have better Sneaking.
		H.adjust_skillrank(/datum/skill/misc/lockpicking, 2, TRUE)
		H.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
		H.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
		H.adjust_skillrank(/datum/skill/craft/cooking, 1, TRUE)//basics for survival, he isn't a master chef otherwise he wouldn't be a poor mercenary

	shirt = pick(/obj/item/clothing/shirt/undershirt/sailor, /obj/item/clothing/shirt/undershirt/sailor/red)
	ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
	H.change_stat("endurance", 1)
	H.change_stat("speed", 2)
