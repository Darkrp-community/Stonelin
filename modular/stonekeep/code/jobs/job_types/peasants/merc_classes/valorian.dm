/datum/advclass/mercenary/sk/valorian
	name = "Valorian Mercenary"
	tutorial = "Driven by desperation, you sought survival in service to the Gold Courts of the Valorian Coin Lords. Commoners like you were generally used as pawns for political duels to the death, but you grew tired of this abuse and managed to flee from that gruesome indentured servitude. With no other way to earn coin for a living, you sought employment as a mercenary for hire, offering your skills to just about anyone for coin, back to where you once started."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = list(
		SPEC_ID_HUMEN,\
		SPEC_ID_HALF_ELF,\
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
	backr = /obj/item/storage/backpack/satchel
	backpack_contents = list(/obj/item/weapon/knife/dagger = 1, /obj/item/storage/belt/pouch/coins/poor = 1)
	if(H.mind)
		H.adjust_skillrank(/datum/skill/combat/bows, 2, TRUE)
		H.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
		H.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
		H.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
		H.adjust_skillrank(/datum/skill/misc/riding, 1, TRUE)
		H.adjust_skillrank(/datum/skill/misc/sewing, 1, TRUE)
		H.adjust_skillrank(/datum/skill/craft/crafting, 1, TRUE)
		H.adjust_skillrank(/datum/skill/misc/swimming, 1, TRUE)
		H.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
		H.adjust_skillrank(/datum/skill/craft/cooking, 1, TRUE)
		H.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
		H.adjust_skillrank(/datum/skill/misc/sneaking, 2, TRUE)
		H.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)

		H.merctype = 6

		H.change_stat("STATKEY_PER", 1)
		H.change_stat("STATKEY_CON", 1)
		H.change_stat("STATKEY_STR,", 1)
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)

	H.adjust_blindness(-3)
	var/weapons = list("Valorian Swordsman","Valorian Footman", "Valorian Crossbowman")
	var/weapon_choice = input("Choose your background.", "TAKE UP ARMS", "ROGVE UP") as anything in weapons
	H.set_blindness(0)
	switch(weapon_choice)
		if("Valorian Footman") //Heavy Armor and poor starting weapons.
			r_hand = /obj/item/weapon/polearm/spear
			armor = /obj/item/clothing/armor/cuirass/iron
			head = /obj/item/clothing/head/helmet/bascinet//one piece of steel per subclass
			neck = /obj/item/clothing/neck/highcollier/iron
			wrists = /obj/item/clothing/wrists/bracers/splint
			shirt = /obj/item/clothing/armor/gambeson
			H.adjust_skillrank(/datum/skill/combat/polearms, 3, TRUE)
		if("Valorian Swordsman") //Mercenary Swordsman with lighter armor and sword skill, og roguetown warrior styled
			backl= /obj/item/weapon/shield/tower/buckleriron
			r_hand = /obj/item/weapon/sword/iron
			head = /obj/item/clothing/head/helmet/bascinet//one piece of steel per subclass
			neck =	/obj/item/clothing/neck/gorget
			shirt = /obj/item/clothing/armor/gambeson/light
			wrists = /obj/item/clothing/wrists/bracers/leather
			armor = /obj/item/clothing/armor/chainmail/iron
			H.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
			H.adjust_skillrank(/datum/skill/combat/shields, 3, TRUE)
		if("Valorian Crossbowman") //Mercenary boltslinger with different gear set
			backl= /obj/item/gun/ballistic/revolver/grenadelauncher/crossbow
			r_hand = /obj/item/weapon/mace/cudgel/carpenter
			head = /obj/item/clothing/head/helmet/bascinet
			neck =	/obj/item/clothing/neck/coif/cloth
			shirt = /obj/item/clothing/armor/gambeson/light
			armor = /obj/item/clothing/armor/leather/splint
			wrists = /obj/item/clothing/wrists/bracers/leather
			beltl = /obj/item/ammo_holder/quiver/bolts
			H.adjust_skillrank(/datum/skill/combat/axesmaces, 3, TRUE)
			H.adjust_skillrank(/datum/skill/combat/crossbows, 3, TRUE)
