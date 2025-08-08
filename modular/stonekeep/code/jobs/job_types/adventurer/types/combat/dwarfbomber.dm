/datum/advclass/combat/sk/dbomb
	name = "Dwarven Bombardier"
	tutorial = "Tinkering Dwarves that like to blow things up."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = list("Dwarf")
	outfit = /datum/outfit/job/sk/adventurer/dwarfbomb
	min_pq = -10
	category_tags = list(CTAG_ADVENTURER)
	cmode_music = 'sound/music/cmode/adventurer/CombatWarrior.ogg'

/datum/outfit/job/sk/adventurer/dwarfbomb/pre_equip(mob/living/carbon/human/H)
	..()
	head = /obj/item/clothing/head/helmet/horned
	pants = /obj/item/clothing/pants/trou
	belt = /obj/item/storage/belt/leather
	armor = /obj/item/clothing/armor/chainmail/iron
	shirt = /obj/item/clothing/armor/gambeson/light
	shoes = /obj/item/clothing/shoes/boots/armor/iron
	backl= /obj/item/weapon/shield/wood
	gloves = /obj/item/clothing/gloves/angle
	backr = /obj/item/storage/backpack/backpack
	beltl = /obj/item/weapon/axe/iron
	beltr = /obj/item/weapon/hammer/iron
	backpack_contents = list(/obj/item/explosive/bottle/homemade = 2, /obj/item/flint = 1, /obj/item/weapon/chisel = 1)
	H.adjust_skillrank(/datum/skill/combat/axesmaces, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/shields, 2, TRUE)
	H.adjust_skillrank(/datum/skill/labor/mining, 2, TRUE)
	H.adjust_skillrank(/datum/skill/craft/engineering, 3, TRUE)
	H.adjust_skillrank(/datum/skill/craft/bombs, 4, TRUE)
	H.adjust_skillrank(/datum/skill/craft/smelting, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
	H.adjust_skillrank(/datum/skill/craft/crafting, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/reading, 2, TRUE)
	H.adjust_skillrank(/datum/skill/craft/masonry, 2, TRUE)//enough to build stairs, ladders, walls, etc on dungeons
	H.change_stat("strength", 1)
	H.change_stat("endurance", 1)
	if(prob(10))
		H.change_stat("intelligence", 1)
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
