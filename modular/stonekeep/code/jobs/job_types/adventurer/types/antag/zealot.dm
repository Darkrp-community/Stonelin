/datum/advclass/stonekeep/bandit/zealot  // matthios cleric
	name = "Zealot"
	tutorial = "A true believer."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = ALL_RACES_SK_LIST

	outfit = /datum/outfit/job/stonekeep/bandit/zealot
	category_tags = list(CTAG_BANDIT)
	cmode_music = 'modular/stonekeep/sound/cmode/combat_hellish.ogg'

/datum/outfit/job/stonekeep/bandit/zealot/pre_equip(mob/living/carbon/human/H)
	..()
	H.adjust_skillrank(/datum/skill/combat/polearms, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/axesmaces, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/wrestling, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/whipsflails, 3, TRUE)
	H.adjust_skillrank(/datum/skill/craft/crafting, 1, TRUE)
	H.adjust_skillrank(/datum/skill/craft/carpentry, 1, TRUE)
	H.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
	H.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/medicine, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/sewing, 1, TRUE)
	H.adjust_skillrank(/datum/skill/misc/sneaking, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)

	head = /obj/item/clothing/head/helmet/leather/hood_ominous
	armor = /obj/item/clothing/armor/cuirass/copperchest
	wrists = /obj/item/clothing/wrists/bracers/leather
	belt = /obj/item/storage/belt/leather/rope
	neck = /obj/item/clothing/neck/coif
	beltl = /obj/item/weapon/knife/dagger
	pants = /obj/item/clothing/pants/trou/beltpants
	shoes = /obj/item/clothing/shoes/boots/leather/heavy
	backr = /obj/item/storage/backpack/satchel
	backpack_contents = list(/obj/item/needle/thorn = 1, /obj/item/natural/cloth = 1, /obj/item/reagent_containers/glass/bottle/healthpot = 1)

	var/loadout = rand(1,3)
	switch(loadout)
		if(1)
			r_hand = /obj/item/weapon/flail/peasant
		if(2)
			r_hand = /obj/item/weapon/mace/goden
		if(3)
			backl= /obj/item/weapon/shield/wood
			beltr = /obj/item/weapon/mace/woodclub

	H.change_stat("strength", 1)
	H.change_stat("constitution", 1)
	H.change_stat("endurance", 1)
	H.change_stat("speed", 1)
	ADD_TRAIT(H, TRAIT_CRITICAL_RESISTANCE, TRAIT_GENERIC)	// a light armored damage dealer
	H.adjust_blindness(-3)

/* Bandits more fun with more chaos
	var/weapons = list("Crusher", "Goedendag", "Club & Shield")
	var/weapon_choice = input("Choose your weapon.", "TAKE UP ARMS") as anything in weapons
	H.set_blindness(0)
	switch(weapon_choice)
		if("Crusher")
			r_hand = /obj/item/weapon/flail/peasant
		if("Goedendag")
			r_hand = /obj/item/weapon/mace/goden
		if("Club & Shield")
			backl= /obj/item/weapon/shield/wood
			beltr = /obj/item/weapon/mace/woodclub
*/

	H.verbs |= /mob/proc/haltyell
	H.ambushable = FALSE

