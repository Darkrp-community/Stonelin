/datum/advclass/mercenary/sk/valorian
	name = "Valorian Mercenary"
	tutorial = "A commoner driven by desperation, you sought survival in the service of the Gold Courts of the Valorian Coin Lords,  commoners like you were thrown into brutal duels until it was done, you deserted and escaped your death until end in a mercenary company where the money worths more than loyalty, no money, no mercenary. you aren't a soldier anymore, just a cutthroat and paid killer."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = list(
		"Humen",
		"Half-Elf"
	)

	outfit = /datum/outfit/job/stonekeep/merc/valorian
	category_tags = list(CTAG_SKMERCENARY)
	maximum_possible_slots = 6

	cmode_music = 'modular/stonekeep/sound/cmode/combat_quarte.ogg'

/datum/outfit/job/stonekeep/merc/valorian/pre_equip(mob/living/carbon/human/H)
	..()
	shoes = /obj/item/clothing/shoes/boots/leather
	gloves = /obj/item/clothing/gloves/leather
	belt = /obj/item/storage/belt/leather/mercenary/black
	pants = /obj/item/clothing/pants/trou/baggy
	backr = /obj/item/storage/backpack/satchel/cloth
	backpack_contents = list(/obj/item/weapon/knife/dagger = 1, /obj/item/storage/belt/pouch/coins/poor = 1)
	if(H.mind)
		H.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)//emergency weapon for mercenaries
		H.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
		H.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
		H.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
		H.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)//they really can't do anything else besides fight for coin
		H.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
		H.adjust_skillrank(/datum/skill/misc/sneaking, 2, TRUE)
		H.adjust_skillrank(/datum/skill/misc/athletics, 4, TRUE)
		H.adjust_skillrank(/datum/skill/misc/riding, 3, TRUE)
		H.merctype = 6

		H.change_stat("strength", 1)
		H.change_stat("endurance", 1)
		H.change_stat("constitution", 1)
		H.change_stat("intelligence", -1)
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)

	H.adjust_blindness(-3)
	var/weapons = list("Valorian Swordsman","Valorian Footman", "Valorian Crossbowman")
	var/weapon_choice = input("CHOOSE YOUR WEAPONS.", "ROGVE UP") as anything in weapons
	H.set_blindness(0)
	switch(weapon_choice)
		if("Valorian Footman")
			r_hand = /obj/item/weapon/mace/goden
			armor = pick (/obj/item/clothing/armor/chainmail/iron, /obj/item/clothing/armor/leather/splint)
			head = /obj/item/clothing/head/helmet/bascinet//one piece of steel per subclass
			neck = /obj/item/clothing/neck/chaincoif/iron
			wrists = pick (/obj/item/clothing/wrists/bracers/leather, /obj/item/clothing/wrists/bracers/splint)//waoh a roll for decent arm protecton
			shirt = /obj/item/clothing/armor/gambeson
			H.adjust_skillrank(/datum/skill/combat/axesmaces, 3, TRUE)
			H.adjust_skillrank(/datum/skill/combat/swords, pick(2,3), TRUE)
			H.adjust_skillrank(/datum/skill/combat/polearms, pick(2,3), TRUE)
			H.change_stat("STATKEY_STR,", 1)
		if("Valorian Swordsman")//og valorian swordsman from stonekeep
			backl= /obj/item/weapon/shield/tower/buckleriron/iplank
			r_hand = pick (/obj/item/weapon/sword/rapier/ironestoc, /obj/item/weapon/sword/scimitar/messer)
			head = /obj/item/clothing/head/helmet/bascinet//one piece of steel per subclass
			neck =	/obj/item/clothing/neck/gorget
			shirt = /obj/item/clothing/armor/gambeson
			wrists = /obj/item/clothing/wrists/bracers/leather
			armor = /obj/item/clothing/armor/cuirass/iron
			H.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
			H.adjust_skillrank(/datum/skill/combat/axesmaces, pick(2,3), TRUE)
			H.adjust_skillrank(/datum/skill/combat/shields, 3, TRUE)
			H.change_stat("STATKEY_CON", 1)
		if("Valorian Crossbowman") //Mercenary boltslinger with different gear set
			backl= /obj/item/gun/ballistic/revolver/grenadelauncher/crossbow
			r_hand = /obj/item/weapon/mace/cudgel/carpenter
			head = /obj/item/clothing/head/helmet/bascinet
			neck =	/obj/item/clothing/neck/coif/cloth
			shirt = /obj/item/clothing/armor/gambeson/light
			armor = pick (/obj/item/clothing/armor/leather/splint, /obj/item/clothing/armor/leather)
			wrists = /obj/item/clothing/wrists/bracers/leather
			beltl = /obj/item/ammo_holder/quiver/bolts
			H.adjust_skillrank(/datum/skill/combat/crossbows, 3, TRUE)
			H.adjust_skillrank(/datum/skill/combat/axesmaces, 3, TRUE)
			H.adjust_skillrank(/datum/skill/combat/bows, pick (2,3), TRUE)
			H.change_stat("STATKEY_PER", 1)
			H.change_stat("STATKEY_STR,", -1)
