/////////////////////////////////////////////////////Abyssariad Pattern for Combat Skills/////////////////////////////////////////////////////////
//'Civilian/Low Abyssanctum' Combat Roles - 3 LEVELS MAX in Combat Skill (Normal) - Many reasons. Mostly religious and Finantial.				//
//'Zamurai/High Abyssanctum' Combat Roles - 4 lEVELS MAX in Combat Skill (Rare) - Plenty of Reasons. Leading religious and Demon-slaying.		//
//'Champion' Combat Roles - 5 LEVELS MAX in Combat SKill (Unique) - Little Reason to go to Rockhill besides Royal Expedition/Rockhill's Captain.//
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//THIS ROLE IS FAR FROM FINISHED! The coder that voluntered in helping me on the Abyssanctum spells quitted. So someone willing and able is VERY necessary.
//Contact Monochrome9090 for further information.

/datum/job/stonekeep/sohei
	title = "Tideseeker"
	tutorial = "The Tideseekers are the abyssanctum war disciples from the tideweaver branch, the direct \
	continuation of the champions of old age. Their duty is to protect the shrines, spiritual entities \
	and the pantheonistic church from demonic corruption. Their holy order started to accept other branches \
	of Abyssanctum, to aid further against the demonic hordes."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = list(
		"Humen",
		"Elf",
		"Half-Elf",
		"Dwarf",
		"Changeling",
		"Undine",
		"Skylancer",
		"Ogrun"
	)
	display_order = SOHEI_ORDER
	department_flag = CHURCHMEN
	job_flags = (JOB_ANNOUNCE_ARRIVAL | JOB_SHOW_IN_CREDITS | JOB_EQUIP_RANK | JOB_NEW_PLAYER_JOINABLE)
	flag = SK_SOHEI
	faction = FACTION_TOWN
	total_positions = 2
	spawn_positions = 2
	bypass_lastclass = TRUE
	outfit = /datum/outfit/job/sk/abyss/sohei
	min_pq = 0
	selection_color = "#c2a45d"
	cmode_music = 'sound/music/cmode/church/combat_templar.ogg'
	allowed_patrons = list(/datum/patron/abyssanctum/purifier, /datum/patron/abyssanctum/curator, /datum/patron/abyssanctum/tideweaver)

/datum/outfit/job/sk/abyss/sohei/pre_equip(mob/living/carbon/human/H)
	..()
	neck = /obj/item/clothing/head/soheicloth
	armor = /obj/item/clothing/armor/cuirass/iron/sanmaido
	cloak = /obj/item/clothing/cloak/raincloak/guardiancloak/black
	wrists = /obj/item/clothing/neck/psycross/silver/abyssanctum
	shirt = /obj/item/clothing/suit/roguetown/shirt/eastshirt2
	shoes = /obj/item/clothing/shoes/shortboots/cloudhead
	head = /obj/item/clothing/head/helmet/skullcap/hachigane
	beltr = /obj/item/weapon/knife/hunting/sai //Two sais so they can perform sai-dualwelding.
	beltl = /obj/item/weapon/knife/hunting/sai
	gloves = /obj/item/clothing/gloves/leather/eastgloves2
	backr = /obj/item/weapon/polearm/halberd/bardiche/naginata/tsukushi  //weaker naginata, mass-produced iron tier.
	switch(H.patron?.type)
		if(/datum/patron/abyssanctum/tideweaver)
			neck = /obj/item/clothing/head/soheicloth/tideweaver
			pants = /obj/item/clothing/pants/trou/tobi/tideweaver
			belt = /obj/item/storage/belt/kaizoku/leather/daisho/tideweaver
			head = /obj/item/clothing/head/helmet/skullcap/hachigane/tideweaver
		if(/datum/patron/abyssanctum/curator)
			neck = /obj/item/clothing/head/soheicloth/curator
			pants = /obj/item/clothing/pants/trou/tobi/curator
			belt = /obj/item/storage/belt/kaizoku/leather/daisho/curator
			head = /obj/item/clothing/head/helmet/skullcap/hachigane/curator
		else // Failsafe
			neck = /obj/item/clothing/head/soheicloth/purifier
			pants = /obj/item/clothing/pants/trou/tobi/purifier
			belt = /obj/item/storage/belt/kaizoku/leather/daisho/purifier
			head = /obj/item/clothing/head/helmet/skullcap/hachigane/purifier
			if(H.mind)
				if(H.patron != /datum/patron/abyssanctum/purifier)
					H.set_patron(/datum/patron/abyssanctum/purifier, TRUE) //Forces you to be Abyssanctum if you are not.
	if(H.mind)
		H.adjust_skillrank(/datum/skill/combat/polearms, 3, TRUE) //The true focus of this class.
		H.adjust_skillrank(/datum/skill/combat/bows, 2, TRUE) //I don't think they are deserving of bows, but Soheis irl also used them, soo...
		H.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
		H.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
		H.adjust_skillrank(/datum/skill/misc/climbing, 1, TRUE)
		H.adjust_skillrank(/datum/skill/combat/shields, 2, TRUE)
		H.adjust_skillrank(/datum/skill/misc/reading, 2, TRUE)
		H.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
		H.adjust_skillrank(/datum/skill/misc/reading, 2, TRUE)
		H.adjust_skillrank(/datum/skill/magic/holy, 2, TRUE)
		H.adjust_skillrank(/datum/skill/combat/knives, pick(0,1,1), TRUE)
		H.adjust_skillrank(/datum/skill/combat/swords, pick(0,1,1), TRUE)
		H.change_stat("strength", 2)
		H.change_stat("constitution", 1)
		H.change_stat("endurance", 2)
		H.change_stat("perception", -2) //(schizophrenia)
		H.change_stat("speed", -1)
/*
	var/datum/devotion/cleric_holder/C = new /datum/devotion/cleric_holder(H, H.patron)
	//Max devotion limit - Sohei are strong for a common role, but cannot pray to gain more abilities beyond t1
	C.update_devotion(50, 50)
	C.holder_mob = H
	C.grant_spells_sohei(H)
	H.verbs += list(/mob/living/carbon/human/proc/devotionreport, /mob/living/carbon/human/proc/clericpray)
*/
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
