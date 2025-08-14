/datum/advclass/mercenary/sk/boltslinger
	name = "Boltslinger"//mercenaries without theme who want to be neutral, basic guys since is free for all to join
	tutorial = "A cutthroat and a soldier of fortune, your mastery of crossbows has brought you to many battlefields, all in pursuit of mammon."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = ALL_RACES_SK_LIST
	outfit = /datum/outfit/job/stonekeep/merc/boltslinger
	category_tags = list(CTAG_SKMERCENARY)
	maximum_possible_slots = 6

/datum/outfit/job/stonekeep/merc/boltslinger/pre_equip(mob/living/carbon/human/H)
	..()
	shoes = /obj/item/clothing/shoes/boots/leather
	head = /obj/item/clothing/head/helmet/kettle/slit
	wrists = /obj/item/clothing/wrists/bracers/leather
	belt = /obj/item/storage/belt/leather/mercenary
	armor = /obj/item/clothing/armor/leather/splint
	beltr = /obj/item/weapon/sword/scimitar/messer//poor iron sword
	beltl = /obj/item/storage/belt/pouch/coins/poor
	backr = /obj/item/gun/ballistic/revolver/grenadelauncher/crossbow
	backl = /obj/item/ammo_holder/quiver/bolts
	shirt = /obj/item/clothing/armor/gambeson/light
	pants = /obj/item/clothing/pants/tights/colored/random
	neck = /obj/item/clothing/neck/coif/cloth
	backpack_contents = list(/obj/item/weapon/knife/hunting)
	if(H.mind)
		H.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
		H.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
		H.adjust_skillrank(/datum/skill/combat/axesmaces, pick(2,3), TRUE)//secondary weapon option
		H.adjust_skillrank(/datum/skill/combat/shields, 2, TRUE)
		H.adjust_skillrank(/datum/skill/combat/crossbows, 3, TRUE)// skilled only like guards, adventurers and other mercenary roles
		H.adjust_skillrank(/datum/skill/craft/tanning, 1, TRUE)
		H.adjust_skillrank(/datum/skill/combat/unarmed, 1, TRUE)
		H.adjust_skillrank(/datum/skill/craft/crafting, 1, TRUE)
		H.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
		H.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
		H.adjust_skillrank(/datum/skill/misc/sewing, 1, TRUE)
		H.adjust_skillrank(/datum/skill/misc/medicine, 1, TRUE)
		H.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
		H.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)

		H.merctype = 6

		H.change_stat("perception", 3)
		H.change_stat("endurance", 1)
		H.change_stat("strength", 1)
		H.cmode_music = 'sound/music/cmode/combat_guard.ogg'
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
	if(H.dna.species.id == "dwarf")
		H.cmode_music = 'sound/music/cmode/combat_dwarf.ogg'
