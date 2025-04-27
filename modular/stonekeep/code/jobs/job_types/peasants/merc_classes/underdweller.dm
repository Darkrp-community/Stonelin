/datum/advclass/mercenary/sk/underdweller
	name = "Underdweller"
	tutorial = "A member of the Underdwellers, you've taken many of the deadliest contracts known to man in literal underground circles. Drow or Dwarf, you've put your differences aside for coin and adventure."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = list(
		"Dwarf",
		"Dark Elf"
	)
	outfit = /datum/outfit/job/roguetown/mercenary/underdweller
	category_tags = list(CTAG_MERCENARY)
	maximum_possible_slots = 6

/datum/outfit/job/roguetown/mercenary/underdweller/pre_equip(mob/living/carbon/human/H)
	..()
	neck = /obj/item/clothing/neck/chaincoif/iron
	wrists = /obj/item/clothing/wrists/bracers/leather//arm armor since they don't get heavy gloves like other mercs do
	armor = /obj/item/clothing/armor/cuirass/iron
	shirt = /obj/item/clothing/shirt/undershirt/sailor/red
	belt = /obj/item/storage/belt/leather/mercenary
	beltr = /obj/item/weapon/knife/hunting
	pants = /obj/item/clothing/pants/trou/leather
	shoes = /obj/item/clothing/shoes/boots
	backl = /obj/item/storage/backpack/backpack

	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/labor/mining, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/crafting, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/engineering, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/lockpicking, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/medicine, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/sewing, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)

	H.change_stat("fortune", 1)
	H.change_stat("endurance", 1)
	H.change_stat("strength", 1)

	if(H.dna.species.id == "dwarf")
		H.cmode_music = 'sound/music/cmode/combat_dwarf.ogg'
		H.mind.adjust_skillrank(/datum/skill/combat/axesmaces, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/shields, 3, TRUE)
		head = /obj/item/clothing/head/helmet/leather/minershelm
		beltl = /obj/item/weapon/pick/paxe // Dorfs get a pick as their primary weapon and axes/maces to use it
		backr = /obj/item/weapon/shield/wood
	else // No miner's helm for Delves as they haven nitevision now.
		H.mind.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/shields, 3, TRUE)
		backr = /obj/item/weapon/shield/wood
		beltl = /obj/item/weapon/sword/iron // Dark elves get a sword as their primary weapon and swords skill, who woulda thought

	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
