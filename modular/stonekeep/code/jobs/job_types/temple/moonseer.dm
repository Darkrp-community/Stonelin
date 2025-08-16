/datum/job/stonekeep/moonseer
	title = "Moon Seer"
	flag = SK_ACOLYTE
	department_flag = CHURCHMEN
	faction = FACTION_TOWN
	job_flags = (JOB_ANNOUNCE_ARRIVAL | JOB_SHOW_IN_CREDITS | JOB_EQUIP_RANK | JOB_NEW_PLAYER_JOINABLE)
	display_order =  ACOLYTE_ORDER
	total_positions = 1
	spawn_positions = 1

	allowed_races = RACES_PLAYER_NONDISCRIMINATED
	tutorial = "<br><br><font color='#949cc3'><span class='bold'>The god of knowledge, secrets and moonlight has accepted your devotion as pure.\
	You are a librarian and guardian of the written word, a wise one giving counsel, a seer who can percieve what is hidden. <br><br>\
	Eyes turning white from staring too long at the moon, those chosen by the Moon Prince are thus marked by him. \
	You a member of the Temple of the Ten, the Cult of Noc having been absorbed and are second in prestige only to the Cult of Astrata and the Priest.</span></font><br><br>"
	outfit = /datum/outfit/job/stonekeep/moonseer

	give_bank_account = TRUE
	cmode_music = 'sound/music/cmode/church/combat_templar.ogg'

/datum/outfit/job/stonekeep/moonseer
	name = "Moon Seer"
	jobtype = /datum/job/stonekeep/acolyte
	job_bitflag = BITFLAG_CHURCH

/datum/outfit/job/stonekeep/moonseer/pre_equip(mob/living/carbon/human/H)
	..()
	if(H.patron != /datum/patron/divine/noc)
		H.set_patron(/datum/patron/divine/noc)

	H.virginity = TRUE
	belt = /obj/item/storage/belt/leather/rope
	beltr = /obj/item/storage/belt/pouch/coins/poor
	beltl = /obj/item/weapon/knife/dagger/silver
	backpack_contents = list(/obj/item/needle, /obj/item/scrying, /obj/item/key/church)

	head = /obj/item/clothing/head/roguehood/nochood
	neck = /obj/item/clothing/neck/psycross/noc
	wrists = /obj/item/clothing/wrists/nocwrappings
	shoes = /obj/item/clothing/shoes/sandals
	armor = /obj/item/clothing/shirt/robe/noc
	backl = /obj/item/storage/backpack/satchel/cloth

	H.adjust_skillrank(/datum/skill/misc/sewing, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/medicine, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/reading, 4, TRUE)
	H.adjust_skillrank(/datum/skill/magic/holy, 3, TRUE)
	if(H.age == AGE_OLD)
		H.adjust_skillrank(/datum/skill/magic/holy, 1, TRUE)
	H.change_stat(STATKEY_INT, 2)
	H.change_stat(STATKEY_END, 1)

	H.add_spell(/datum/action/cooldown/spell/diagnose/holy)

	var/datum/devotion/cleric_holder/C = new /datum/devotion/cleric_holder(H, H.patron)
	H.verbs += list(/mob/living/carbon/human/proc/devotionreport, /mob/living/carbon/human/proc/clericpray)
	C.grant_spells(H)

	var/obj/item/organ/eyes/eyes = H.getorganslot(ORGAN_SLOT_EYES)	// Minor night vision
	if(eyes)
		eyes.Remove(H,1)
		QDEL_NULL(eyes)
	eyes = new /obj/item/organ/eyes/elf
	eyes.Insert(H)
