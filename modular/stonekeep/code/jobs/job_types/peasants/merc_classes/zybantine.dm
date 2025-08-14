/datum/advclass/mercenary/sk/zybantine
	name = "Zybantine Mamluk"
	tutorial = "A former warrior slave, or mercenary, hailing from the western countries of Zybantu. Whatever led you to abandon servitude under the ziggurat and become a sword for hire, only you know. But now, on Enigma, as a complete foreign with military skills to match, what only matters is how to put them to work for coin."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_PLAYER_ZYBANTINE
	outfit = /datum/outfit/job/stonekeep/merc/zybantine
	category_tags = list(CTAG_SKMERCENARY)
	maximum_possible_slots = 5

	cmode_music = 'modular/stonekeep/sound/cmode/combat_desertrider.ogg'

/datum/outfit/job/stonekeep/merc/zybantine/pre_equip(mob/living/carbon/human/H)
	..()
	shoes = /obj/item/clothing/shoes/shalal
	gloves = /obj/item/clothing/gloves/angle
	belt = /obj/item/storage/belt/leather/mercenary/shalal
	armor = /obj/item/clothing/armor/medium/surcoat
	beltr = /obj/item/weapon/sword/long/rider
	beltl= /obj/item/flashlight/flare/torch/lantern
	shirt = /obj/item/clothing/shirt/undershirt/colored/black
	pants = /obj/item/clothing/pants/tights/colored/red
	neck = /obj/item/clothing/neck/keffiyeh/colored/red
	backl = /obj/item/storage/backpack/satchel
	backr = /obj/item/weapon/shield/wood//placeholder until i get to work on a new sprite pr re adding their desert rider shield
	backpack_contents = list(/obj/item/storage/belt/pouch/coins/poor = 1, /obj/item/weapon/knife/throwingknife = 1)
	if(!H.has_language(/datum/language/zalad))
		H.grant_language(/datum/language/zalad)
		to_chat(H, "<span class='info'>I can speak Zybean with ,z before my speech.</span>")
	if(H.mind)
		H.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
		H.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
		H.adjust_skillrank(/datum/skill/misc/sneaking, 3, TRUE)
		H.adjust_skillrank(/datum/skill/misc/lockpicking, 1, TRUE)
		H.adjust_skillrank(/datum/skill/combat/axesmaces, 2, TRUE)
		H.adjust_skillrank(/datum/skill/combat/bows, 2, TRUE)
		H.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
		H.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
		H.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
		H.adjust_skillrank(/datum/skill/combat/polearms, pick(2,3), TRUE)
		H.adjust_skillrank(/datum/skill/combat/whipsflails, pick(2,3), TRUE)
		H.adjust_skillrank(/datum/skill/combat/shields, 2, TRUE)
		H.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
		H.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)

		H.merctype = 1

		H.change_stat("strength", 1)
		H.change_stat("endurance", 2)
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
