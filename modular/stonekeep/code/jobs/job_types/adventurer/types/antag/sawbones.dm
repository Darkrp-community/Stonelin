/datum/advclass/stonekeep/bandit/sawbones // doctor class. like the pilgrim, but more evil
	name = "Sawbones"
	tutorial = "It was an accident! Your patient wasn't using his second kidney, anyway. After an unfortunate 'misunderstanding' with the town and your medical practice, you know practice medicine on the run with your new associates. Business has never been better!"
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = ALL_RACES_SK_LIST
	outfit = /datum/outfit/job/stonekeep/bandit/sawbones
	category_tags = list(CTAG_BANDIT)
	cmode_music = 'modular/stonekeep/sound/cmode/combat_hellish.ogg'

/datum/outfit/job/stonekeep/bandit/sawbones/pre_equip(mob/living/carbon/human/H)
	..()
	mask = /obj/item/clothing/face/facemask
	head = /obj/item/clothing/neck/coif
	armor = /obj/item/clothing/armor/leather/vest/colored/butcher
	shirt = /obj/item/clothing/armor/gambeson/arming//dark gambeson
	belt = /obj/item/storage/belt/leather
	beltr = /obj/item/weapon/knife/cleaver /// proper self defense an tree aquiring
	pants = /obj/item/clothing/pants/trou
	shoes = /obj/item/clothing/shoes/simpleshoes
	backr = /obj/item/storage/backpack/satchel
	backl = /obj/item/storage/backpack/satchel/surgbag
	backpack_contents = list(/obj/item/natural/worms/leech = 1, /obj/item/natural/cloth = 2,)
	H.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
	H.adjust_skillrank(/datum/skill/craft/crafting, 2, TRUE)
	H.adjust_skillrank(/datum/skill/craft/carpentry, 1, TRUE)
	H.adjust_skillrank(/datum/skill/labor/lumberjacking, 1, TRUE)
	H.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/reading, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE) //needed for getting into hideout
	H.adjust_skillrank(/datum/skill/misc/sneaking, 1, TRUE)
	H.adjust_skillrank(/datum/skill/misc/medicine, 5, TRUE)
	H.adjust_skillrank(/datum/skill/misc/sewing, 2, TRUE)
	H.adjust_skillrank(/datum/skill/craft/alchemy, 3, TRUE)
	H.change_stat("intelligence", 3)
	H.change_stat("fortune", 1)
	if(H.age == AGE_OLD)
		H.change_stat("speed", -1)
		H.change_stat("intelligence", 1)
		H.change_stat("perception", 1)
	H.add_spell(new /datum/action/cooldown/spell/diagnose)
	ADD_TRAIT(H, TRAIT_FORAGER, TRAIT_GENERIC)
