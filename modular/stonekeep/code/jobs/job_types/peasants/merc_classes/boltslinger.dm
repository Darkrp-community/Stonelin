/datum/advclass/mercenary/sk/boltslinger
	name = "Vagabond Mercenary"//mercenaries without theme who want to be neutral, basic guys since is free for all to join
	tutorial = "A cutthroat and a soldier of fortune, your mastery of the war has brought you to many battlefields, all in pursuit of mammon, pillage and violence. while you don't identify with any faction, no Money? no mercenary."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = list(
		"Humen",
		"Rakshari",
		"Elf",
		"Half-Elf",
		"Dwarf",
		"Tiefling",
		"Dark Elf",
		"Aasimar",
		"Half-Orc",
		"Kobold",
		"Changeling","Skylancer","Ogrun","Undine",
	)
	outfit = /datum/outfit/job/stonekeep/merc/boltslinger
	category_tags = list(CTAG_SKMERCENARY)
	maximum_possible_slots = 6

/datum/outfit/job/stonekeep/merc/boltslinger/pre_equip(mob/living/carbon/human/H)
	..()
	shoes = /obj/item/clothing/shoes/boots/leather
	head =  pick (/obj/item/clothing/head/helmet/kettle/slit, /obj/item/clothing/head/helmet/sallet)//a vagabond wears what he can scavenge
	belt = /obj/item/storage/belt/leather/mercenary
	beltl = /obj/item/storage/belt/pouch/coins/poor
	backr = /obj/item/storage/backpack/satchel/cloth
	shirt = pick (/obj/item/clothing/armor/gambeson, /obj/item/clothing/armor/gambeson/arming, /obj/item/clothing/armor/gambeson/light)
	pants = pick (/obj/item/clothing/pants/tights/random, /obj/item/clothing/pants/trou/leather, /obj/item/clothing/pants/trou/baggy)
	backpack_contents = list(/obj/item/weapon/knife/hunting)
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
		H.cmode_music = 'sound/music/cmode/combat_guard.ogg'
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
	if(H.dna.species.id == "dwarf")
		H.cmode_music = 'sound/music/cmode/combat_dwarf.ogg'

	H.adjust_blindness(-3)
	var/weapons = list("Mercenary Crusher","Mercenary Swordsman", "Boltslinger")
	var/weapon_choice = input("CHOOSE YOUR WEAPONS.", "ROGVE UP") as anything in weapons
	H.set_blindness(0)
	switch(weapon_choice)
		if("Mercenary Crusher") // Offensive mercenary = 1 skilled weapon + 2 rolls for average-skilled and 1 secured average (emergency daggers)
			r_hand = /obj/item/weapon/thresher/military//wanted at least 1 mercenary with flails
			armor = pick (/obj/item/clothing/armor/chainmail/iron, /obj/item/clothing/armor/leather/splint)//equal chance for a bad maille or bad splint, their steel goes to their helmet.
			wrists = pick (/obj/item/clothing/wrists/bracers/leather, /obj/item/clothing/wrists/bracers/splint)
			neck = /obj/item/clothing/neck/chaincoif/iron
			H.adjust_skillrank(/datum/skill/combat/whipsflails, 3, TRUE)
			H.adjust_skillrank(/datum/skill/combat/axesmaces, pick(2,3), TRUE)
			H.adjust_skillrank(/datum/skill/combat/swords, pick(2,3), TRUE)
			H.change_stat("strength", 1)
		if("Mercenary Swordsman") //defensive mercenary = 1 skilled weapons + skilled defense + 1 roll for average-skilled and 1 secured average (emergency daggers)
			backl= /obj/item/weapon/shield/tower/buckleriron
			r_hand = pick(/obj/item/weapon/sword/iron, /obj/item/weapon/sword/iron, /obj/item/weapon/sword/scimitar/messer)
			neck =	/obj/item/clothing/neck/gorget
			armor = pick (/obj/item/clothing/armor/chainmail/iron, /obj/item/clothing/armor/cuirass/iron)
			wrists = /obj/item/clothing/wrists/bracers/leather
			H.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
			H.adjust_skillrank(/datum/skill/combat/axesmaces, pick(2,3), TRUE)//secondary weapon
			H.adjust_skillrank(/datum/skill/combat/shields, 3, TRUE)
			H.change_stat("constitution", 1)
		if("Boltslinger") //ranged mercenary AKA the OG Boltslinger 2 skilled weapons 1 roll for average-skilled on other ranged and bad starting gear
			backl= /obj/item/gun/ballistic/revolver/grenadelauncher/crossbow
			r_hand = /obj/item/weapon/mace/cudgel/carpenter
			neck =	/obj/item/clothing/neck/coif/cloth
			armor = pick (/obj/item/clothing/armor/leather/splint, /obj/item/clothing/armor/leather)
			wrists = /obj/item/clothing/wrists/bracers/leather
			beltl = /obj/item/ammo_holder/quiver/bolts
			H.adjust_skillrank(/datum/skill/combat/crossbows, 3, TRUE)
			H.adjust_skillrank(/datum/skill/combat/axesmaces, 3, TRUE)
			H.adjust_skillrank(/datum/skill/combat/bows, pick (2,3), TRUE)
			H.change_stat("perception", 1)
			H.change_stat("strength", -1)//this way no one will be overpowered with long range and cqc supremacy
