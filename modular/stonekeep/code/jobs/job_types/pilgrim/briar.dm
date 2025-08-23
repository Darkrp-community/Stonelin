/datum/advclass/pilgrim/stonekeep/briar
	name = "Briar"
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = list(
		"Humen",
		"Elf",
		"Half-Elf",
		"Dwarf"
	)
	outfit = /datum/outfit/job/sk/pilgrim/briar
	category_tags = list(CTAG_PILGRIM)
	tutorial = "Stoic gardeners or flesh-eating predators, all can follow Dendors path. <br>His Briars scorn civilized living, many embracing their animal nature, being fickle and temperamental."
	allowed_patrons = list(/datum/patron/divine/dendor)
	cmode_music = 'modular/stonekeep/sound/cmode/combat_dendor.ogg'
	maximum_possible_slots = 2

/datum/outfit/job/sk/pilgrim/briar/pre_equip(mob/living/carbon/human/H)
	..()
	ADD_TRAIT(H, TRAIT_KNEESTINGER_IMMUNITY, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_SEEDKNOW, TRAIT_GENERIC)

	belt = /obj/item/storage/belt/leather/rope
	mask = /obj/item/clothing/face/druid
	neck = /obj/item/clothing/neck/psycross/silver/dendor
	shirt = /obj/item/clothing/armor/leather/vest
	armor = /obj/item/clothing/shirt/robe/dendor
	wrists = /obj/item/clothing/wrists/bracers/leather
	beltl = /obj/item/weapon/knife/stone
	backl = /obj/item/weapon/mace/goden/shillelagh

	H.change_stat("strength", 1)
	H.change_stat("endurance", 1)
	H.change_stat("intelligence", -1)

	if(H.mind)
		if(H.patron != /datum/patron/divine/dendor)
			H.set_patron(/datum/patron/divine/dendor, TRUE)

		H.adjust_skillrank(/datum/skill/combat/axesmaces, 2, TRUE)
		H.adjust_skillrank(/datum/skill/combat/knives, 1, TRUE)
		H.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
		H.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
		H.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
		H.adjust_skillrank(/datum/skill/magic/holy, 3, TRUE)
		H.adjust_skillrank(/datum/skill/labor/taming, 4, TRUE)
		H.adjust_skillrank(/datum/skill/craft/tanning, 2, TRUE)
		H.adjust_skillrank(/datum/skill/misc/riding, 1, TRUE)
		H.adjust_skillrank(/datum/skill/labor/butchering, 5, TRUE)
		H.adjust_skillrank(/datum/skill/labor/farming, 3, TRUE)
		H.adjust_skillrank(/datum/skill/craft/crafting, 1, TRUE)
		H.adjust_skillrank(/datum/skill/craft/cooking, 1, TRUE)
		H.adjust_skillrank(/datum/skill/misc/sewing, 1, TRUE)
		H.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
		H.mind.teach_crafting_recipe(/datum/repeatable_crafting_recipe/dendor/shillelagh)

		if(H.age == AGE_OLD)
			H.adjust_skillrank(/datum/skill/magic/holy, 1, TRUE)

		// the unique Dendor crafting recipes. Dendor shrines (pantheon cross) and alt cosmetic helmet
		H.mind.teach_crafting_recipe(/datum/repeatable_crafting_recipe/dendor/visage)
		H.mind.teach_crafting_recipe(/datum/blueprint_recipe/dendor/shrine)
		H.mind.teach_crafting_recipe(/datum/blueprint_recipe/dendor/shrine/saiga)
		H.mind.teach_crafting_recipe(/datum/blueprint_recipe/dendor/shrine/volf)
		H.mind.teach_crafting_recipe(/datum/repeatable_crafting_recipe/dendor/sacrifice_growing)
		H.mind.teach_crafting_recipe(/datum/repeatable_crafting_recipe/dendor/sacrifice_stinging)
		H.mind.teach_crafting_recipe(/datum/repeatable_crafting_recipe/dendor/sacrifice_devouring)

	var/holder = H.patron.devotion_holder
	if(holder)
		var/datum/devotion/devotion = new holder()
		devotion.make_acolyte()
		devotion.grant_to(H)
/*
	var/datum/bodypart_feature/hair/feature = H.get_bodypart_feature_of_slot(BODYPART_FEATURE_FACIAL_HAIR)
	var/datum/sprite_accessory/hair/facial/feature_type = SPRITE_ACCESSORY(feature.accessory_type)
	if(feature_type.briarhairbuff == TRUE) // Is the facial hair we're wearing one that grants us the boons of Dendor?
		C.devotion += 40
*/
/datum/outfit/job/sk/pilgrim/briar
	var/tutorial = "<br><br><font color='#44720e'><span class='bold'>You know well how to make a shrine to Dendor, wood, thorns, and the head of a favored animal.<br><br>Choose a path stinging, devouring or growing, and make your sacrifices...<br><br>Remember - Dendor will only grant special powers from Blessing the first time you do recieve it, and only those mastering all his Miracles can unlock their full potential.  </span></font><br><br>"

/datum/outfit/job/sk/pilgrim/briar/post_equip(mob/living/carbon/human/H)
	..()
	to_chat(H, tutorial)

