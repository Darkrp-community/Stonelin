/datum/advclass/mercenary/sk/zybantine
	name = "Zybantu Desert Rider"
	tutorial = "A cutthroat, killer, Scum from the western countries, you and other riders have headed into foreign lands to make even greater coin than you had prior, being honest killing as mercenaries or raiding."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = list(
		"Humen",
		"Elf",
		"Half-Elf",
		"Dwarf",
		"Tiefling",
		"Dark Elf",
		"Aasimar"
	)
	outfit = /datum/outfit/job/stonekeep/merc/zybantine
	category_tags = list(CTAG_SKMERCENARY)
	maximum_possible_slots = 5

	cmode_music = 'modular/stonekeep/sound/cmode/combat_desertrider.ogg'

/datum/outfit/job/stonekeep/merc/zybantine/pre_equip(mob/living/carbon/human/H)
	..()
	shoes = /obj/item/clothing/shoes/shalal
	mask = /obj/item/clothing/face/shepherd/clothmask
	head = /obj/item/clothing/head/helmet/sallet/zybantine
	gloves = /obj/item/clothing/gloves/angle
	belt = /obj/item/storage/belt/leather/mercenary/shalal
//	beltl= /obj/item/flashlight/flare/torch/lantern //????
	shirt = /obj/item/clothing/shirt/undershirt/black
	pants = /obj/item/clothing/pants/tights/red
	backl = /obj/item/storage/backpack/satchel/cloth
	backpack_contents = list(/obj/item/storage/belt/pouch/coins/poor = 1, /obj/item/weapon/knife/throwingknife = 1)
	if(!H.has_language(/datum/language/zybantine))
		H.grant_language(/datum/language/zybantine)
		to_chat(H, "<span class='info'>I can speak Zybean with ,z before my speech.</span>")
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
	var/weapons = list("Desert longswordsman","Desert Guard", "Desert Archer")
	var/weapon_choice = input("CHOOSE YOUR WEAPONS.", "ROGVE UP") as anything in weapons
	H.set_blindness(0)
	switch(weapon_choice)
		if("Desert longswordsman")//OG Desert rider
			r_hand = /obj/item/weapon/sword/long/rider //the sword got nerfed code wise, is good to go
			armor = /obj/item/clothing/armor/brigandine/coatplates//their armor got nerfed code wise, is good to go
			neck =	/obj/item/clothing/neck/chaincoif/iron
			wrists = pick (/obj/item/clothing/wrists/bracers/leather, /obj/item/clothing/wrists/bracers/splint)
			H.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
			H.adjust_skillrank(/datum/skill/combat/axesmaces, pick(2,3), TRUE)
			H.adjust_skillrank(/datum/skill/combat/polearms, pick(2,3), TRUE)
			H.change_stat("strength", 1)
		if("Desert Guard")
			backr= /obj/item/weapon/shield/tower/horseman
			r_hand = /obj/item/weapon/sword/iron
			neck =	/obj/item/clothing/neck/chaincoif/iron
			armor = /obj/item/clothing/armor/brigandine/coatplates
			wrists = /obj/item/clothing/wrists/bracers/leather
			H.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
			H.adjust_skillrank(/datum/skill/combat/axesmaces, pick(2,3), TRUE)
			H.adjust_skillrank(/datum/skill/combat/shields, 3, TRUE)
			H.change_stat("constitution", 1)
		if("Desert Archer") //desert archer with quick bow + quick knife
			backr= /obj/item/gun/ballistic/revolver/grenadelauncher/bow/recurve
			r_hand = /obj/item/weapon/knife/cleaver/combat
			neck = /obj/item/clothing/neck/keffiyeh/red
			armor = pick (/obj/item/clothing/armor/leather/splint, /obj/item/clothing/armor/leather)
			wrists = /obj/item/clothing/wrists/bracers/leather
			beltl = /obj/item/ammo_holder/quiver/arrows
			H.adjust_skillrank(/datum/skill/combat/crossbows, pick (2,3), TRUE)
			H.adjust_skillrank(/datum/skill/combat/knives, 1, TRUE)
			H.adjust_skillrank(/datum/skill/combat/bows, 3, TRUE)
			H.change_stat("perception", 1)
			H.change_stat("strength", -1)
