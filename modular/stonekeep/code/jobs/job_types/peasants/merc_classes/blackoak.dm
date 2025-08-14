/datum/advclass/mercenary/sk/blackoak//a mercenary with a steel helmet + very good cuirass, iron weapons as malums for a fairer start
	name = "Black Oak's Guardian"
	tutorial = "A shady guardian of the Black Oaks, a mercenary band in all but offical name. Commonly taking caravan contracts through the thickest of forests."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = list(
		SPEC_ID_ELF,\
		SPEC_ID_HALF_ELF,\
	)
	outfit = /datum/outfit/job/stonekeep/merc/blackoak
	category_tags = list(CTAG_SKMERCENARY)
	maximum_possible_slots = 6
	cmode_music = 'modular/stonekeep/sound/cmode/combat_hellish2.ogg'

/datum/outfit/job/stonekeep/merc/blackoak/pre_equip(mob/living/carbon/human/H)
	..()
	shoes = /obj/item/clothing/shoes/boots/leather
	cloak = /obj/item/clothing/cloak/half/colored/red
//	head = /obj/item/clothing/head/helmet/sallet/elven
	gloves = /obj/item/clothing/gloves/angle
	belt = /obj/item/storage/belt/leather/mercenary/black
	armor = /obj/item/clothing/armor/cuirass/elven
	backr = /obj/item/weapon/polearm/spear
	backl = /obj/item/storage/backpack/satchel
	beltl = /obj/item/weapon/knife/dagger
	shirt = /obj/item/clothing/shirt/undershirt/colored/black
	pants = /obj/item/clothing/pants/trou/leather
	neck = /obj/item/clothing/neck/chaincoif
	backpack_contents = list(/obj/item/storage/belt/pouch/coins/poor)
	if(H.mind)
		H.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
		H.adjust_skillrank(/datum/skill/combat/polearms, 3, TRUE)
		H.adjust_skillrank(/datum/skill/misc/athletics, 4, TRUE)
		H.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
		H.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
		H.adjust_skillrank(/datum/skill/misc/sneaking, 3, TRUE)
		H.adjust_skillrank(/datum/skill/misc/swimming, 3, TRUE)
		H.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
		H.adjust_skillrank(/datum/skill/misc/medicine, 1, TRUE)
		H.adjust_skillrank(/datum/skill/craft/crafting, 1, TRUE)

		H.merctype = 6

		H.change_stat("endurance", 2)
		H.change_stat("strength", 1)
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
