/datum/job/feldsher
	title = "Feldsher"
	department_flag = SERFS
	total_positions = 1
	spawn_positions = 1
	outfit = /datum/outfit/job/stonekeep/feldsher
	display_order = FELDSHER_ORDER
	tutorial = "You have seen countless wounds over your time. Stitched the sores of blades, sealed honey over the bubous of plague. \
	A thousand deaths stolen from the Carriagemen, yet these people will still call you a charlatan."
	give_bank_account = 100
	min_pq = 0

	allowed_races = RACES_PLAYER_NONDISCRIMINATED
	allowed_sexes = list(MALE, FEMALE)
	allowed_patrons = ALL_TEMPLE_PATRONS
	cmode_music = 'modular/stonekeep/sound/cmode/combat_quarte.ogg'

/datum/outfit/job/stonekeep/feldsher/pre_equip(mob/living/carbon/human/H)
	..()
	H.virginity = TRUE
	shoes = /obj/item/clothing/shoes/shortboots
	shirt = /obj/item/clothing/shirt/undershirt/colored/red
	backr = /obj/item/storage/backpack/satchel
	backl = /obj/item/storage/backpack/satchel/surgbag
	pants = /obj/item/clothing/pants/tights/colored/random
	gloves = /obj/item/clothing/gloves/leather/feld
	armor = /obj/item/clothing/shirt/robe/feld
	head = /obj/item/clothing/head/roguehood/feld
	mask = /obj/item/clothing/face/feld
	neck = /obj/item/clothing/neck/feld
	belt = /obj/item/storage/belt/leather
	beltl = /obj/item/key/clinic

	if(H.mind)
		H.adjust_skillrank(/datum/skill/misc/reading, 5, TRUE)
		H.adjust_skillrank(/datum/skill/craft/crafting, 2, TRUE)
		H.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
		H.adjust_skillrank(/datum/skill/misc/sewing, 3, TRUE)
		H.adjust_skillrank(/datum/skill/misc/medicine, 5, TRUE)
		H.adjust_skillrank(/datum/skill/craft/alchemy, 4, TRUE)

		if(H.age == AGE_OLD)
			H.adjust_skillrank(/datum/skill/misc/medicine, 1, TRUE)
		H.mind.teach_crafting_recipe(/datum/blueprint_recipe/license_nitemaiden)
	H.change_stat("strength", -1)
	H.change_stat("intelligence", 4)
	H.change_stat("constitution", -1)
	ADD_TRAIT(H, TRAIT_EMPATH, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_NOSTINK, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_LEGENDARY_ALCHEMIST, TRAIT_GENERIC)
	H.add_spell(new /datum/action/cooldown/spell/diagnose)


/*	.................   Unique Feldsher recipes   ................... */
/datum/blueprint_recipe/license_nitemaiden
	name = "Produce a icense (Nitemaiden)"
	required_materials = list(/obj/item/paper = 1,
		/obj/item/natural/feather = 1)
	result_type = /obj/item/paper/certificate/health
	category = CAT_NONE



