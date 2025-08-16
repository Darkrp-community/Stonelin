/datum/job/stonekeep/hierodule	// Temple Bard exchanging vicious mockery for miracle healing
	title = "Temple Maiden"
	tutorial = "<br><br><font color='#c394b2'><span class='bold'>Also known as Hierodules, many are slaves gifted to the Temple of Eora as a pious act. \
	They are freed when they enter their service, protected by law and considered respectable in the local culture, so long they fulfil their expected ten years. <br><br>\
	Sanctified work is playing music and tending to the wounds of the pious, but also provide comfort to those worthy who aspire to their Gods favor. Accepting payments for holy work is a grave sin.<br><br> \
	Those who grow too old or tired of these tasks tend to the Temple gardens, and help rear the many fatherless children around, many whom grow up to be Templars or Hierodules themselves as they become adults. \
	Thus do the Mother provide strength and a moment of respite and beauty to those who stay true to the proper path.</span></font><br><br>"

	flag = SK_ACOLYTE
	department_flag = CHURCHMEN
	faction = FACTION_TOWN
	job_flags = (JOB_ANNOUNCE_ARRIVAL | JOB_SHOW_IN_CREDITS | JOB_EQUIP_RANK | JOB_NEW_PLAYER_JOINABLE)
	display_order =  ACOLYTE_ORDER
	total_positions = 1
	spawn_positions = 1

	allowed_sexes = list(FEMALE)
	allowed_races = RACES_PLAYER_NONDISCRIMINATED
	outfit = /datum/outfit/job/sk/hierodule
	cmode_music = 'sound/music/cmode/church/combat_templar.ogg'

/datum/outfit/job/sk/hierodule/pre_equip(mob/living/carbon/human/H)
	. = ..()
	if(H.patron != /datum/patron/divine/eora)
		H.set_patron(/datum/patron/divine/eora)

	H.adjust_skillrank(/datum/skill/combat/polearms, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/sewing, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
	H.adjust_skillrank(/datum/skill/craft/cooking, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/sneaking, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/medicine, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
	H.adjust_skillrank(/datum/skill/magic/holy, 2, TRUE)
	H.clamped_adjust_skillrank(/datum/skill/misc/music, 4, 4, TRUE)
	if(H.age == AGE_OLD)
		H.adjust_skillrank(/datum/skill/misc/medicine, 1, TRUE)
		H.adjust_skillrank(/datum/skill/magic/holy, 1, TRUE)

	H.add_spell(/datum/action/cooldown/spell/diagnose/holy)
	H.add_spell(/datum/action/cooldown/spell/healing)

	head = /obj/item/clothing/head/padded/rabbetvisage
	neck = /obj/item/clothing/neck/leathercollar/hierodule
	shoes = /obj/item/clothing/shoes/sandals
	armor = /obj/item/clothing/armor/corset/hierodule
	belt = /obj/item/storage/belt/leather/rope
	beltr = /obj/item/storage/belt/pouch/coins/poor
	beltl = /obj/item/key/church
	shirt = /obj/item/clothing/shirt/robe/hierodule
	backl = /obj/item/storage/backpack/satchel/cloth
	wrists = /obj/item/clothing/neck/psycross/silver/eora
	r_hand = /obj/item/weapon/polearm/woodstaff/quarterstaff
	backpack_contents = list(/obj/item/needle)

	ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_BARDIC_TRAINING, TRAIT_GENERIC)
	H.change_stat(STATKEY_PER, 1)
	H.change_stat(STATKEY_SPD, 1)

	new /datum/devotion/cleric_holder(H, H.patron)
	H.verbs += list(/mob/living/carbon/human/proc/devotionreport, /mob/living/carbon/human/proc/clericpray)

/datum/job/stonekeep/hierodule/after_spawn(mob/living/spawned, client/player_client)
	. = ..()
	spawned.select_equippable(player_client, list( \
		"Harp" = /obj/item/instrument/harp, \
		"Flute" = /obj/item/instrument/flute), \
		message = "Choose your instrument.", \
		title = "EORA"
		)
