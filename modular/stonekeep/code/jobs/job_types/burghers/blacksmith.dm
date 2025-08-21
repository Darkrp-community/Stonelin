/datum/job/stonekeep/blacksmith
	title = "Blacksmith"
	department_flag = SERFS
	total_positions = 2
	spawn_positions = 2

	allowed_races = RACES_PLAYER_NONDISCRIMINATED

	tutorial = "Yours is a busy life, a churning forge, the ring of hammer on anvil, the hiss of quenched steel, \
				these are the sounds you live by. You will never starve as the armies of the world tear themselves apart."

	outfit = /datum/outfit/job/stonekeep/blacksmith
	display_order = BLACKSMITH_ORDER
	give_bank_account = 30
	min_pq = -25
	cmode_music = 'modular/stonekeep/sound/cmode/combat_quarte.ogg'

/datum/outfit/job/stonekeep/blacksmith/pre_equip(mob/living/carbon/human/H)
	..()
	if(H.mind)
		H.adjust_skillrank(/datum/skill/combat/axesmaces, 2, TRUE)
		H.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
		H.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
		H.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
		H.adjust_skillrank(/datum/skill/combat/crossbows, 1, TRUE)
		H.adjust_skillrank(/datum/skill/craft/crafting, 3, TRUE)
		H.adjust_skillrank(/datum/skill/craft/blacksmithing, 4, TRUE)
		H.adjust_skillrank(/datum/skill/craft/armorsmithing, 4, TRUE)
		H.adjust_skillrank(/datum/skill/craft/weaponsmithing, 4, TRUE)
		H.adjust_skillrank(/datum/skill/craft/smelting, 3, TRUE)
		H.adjust_skillrank(/datum/skill/craft/engineering, 3, TRUE)
		H.adjust_skillrank(/datum/skill/craft/traps, 2, TRUE) // For craftable beartraps
		H.adjust_skillrank(/datum/skill/misc/reading, 2, TRUE)
		H.adjust_skillrank(/datum/skill/craft/carpentry, 1, TRUE)
		ADD_TRAIT(H, TRAIT_MALUMFIRE, TRAIT_GENERIC)
		if(H.age == AGE_OLD)
			H.adjust_skillrank(/datum/skill/craft/blacksmithing, pick(0,1), TRUE)
			H.adjust_skillrank(/datum/skill/craft/weaponsmithing, pick(0,1), TRUE)
			H.adjust_skillrank(/datum/skill/craft/armorsmithing, pick(0,1), TRUE)
	ring = /obj/item/key/guildring
	head = /obj/item/clothing/head/headband/makers
	pants = /obj/item/clothing/pants/tights/makers
	shoes = /obj/item/clothing/shoes/shortboots
	belt = /obj/item/storage/belt/leather
	cloak = /obj/item/clothing/cloak/apron/makers
	backl =	/obj/item/weapon/hammer/sledgehammer
	beltr = /obj/item/key/blacksmith
	shirt = /obj/item/clothing/shirt/shortshirt/makers
	neck = /obj/item/storage/belt/pouch/coins/mid//may be too much but they need to hire miners/mercenaries
	H.change_stat("strength", 1)
	H.change_stat("endurance", 2)
	H.change_stat("speed", -1)
	if(!H.has_language(/datum/language/dwarvish))
		H.grant_language(/datum/language/dwarvish)
		to_chat(H, "<span class='info'>My life has been shaped by working for the Dwarf-dominated Maker's Guild. I can speak Dwarvish with ,d before my speech.</span>")
