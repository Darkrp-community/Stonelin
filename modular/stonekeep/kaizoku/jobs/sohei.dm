/////////////////////////////////////////////////////Abyssariad Pattern for Combat Skills/////////////////////////////////////////////////////////
//'Civilian/Low Abyssanctum' Combat Roles - 3 LEVELS MAX in Combat Skill (Normal) - Many reasons. Mostly religious and Finantial.				//
//'Zamurai/High Abyssanctum' Combat Roles - 4 lEVELS MAX in Combat Skill (Rare) - Plenty of Reasons. Leading religious and Demon-slaying.		//
//'Champion' Combat Roles - 5 LEVELS MAX in Combat SKill (Unique) - Little Reason to go to Rockhill besides Royal Expedition/Rockhill's Captain.//
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//THIS ROLE IS FAR FROM FINISHED! The coder that voluntered in helping me on the Abyssanctum spells quitted. So someone willing and able is VERY necessary.
//Contact Monochrome9090 for further information.

/datum/job/sohei
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
	faction = FACTION_STATION
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
	armor = /obj/item/clothing/armor/cuirass/nanbando
	cloak = /obj/item/clothing/cloak/raincloak/guardiancloak/black
	wrists = /obj/item/clothing/neck/psycross/silver/abyssanctum
	shirt = /obj/item/clothing/suit/roguetown/shirt/eastshirt2
	shoes = /obj/item/clothing/shoes/boots/jikatabi
	head = /obj/item/clothing/head/helmet/skullcap/hachigane
	beltr = /obj/item/weapon/knife/hunting/sai //Two sais so they can perform sai-dualwelding.
	beltl = /obj/item/weapon/knife/hunting/sai
	gloves = /obj/item/clothing/gloves/leather/eastgloves2

	var/background = pickweight(list("thunder" = 1, "deluge" = 1, "ocean" = 1, "island" = 1)) //This is just flavour. Mostly unwritten portrayal how different Soheis were of each other. Leave it up to the players to interact.
	var/weapontype = pickweight(list("yari" = 6, "tsukushi" = 5, "katakama" = 3)) // Rolls for various polearms.
	switch(background)
		if("thunder")
			neck = /obj/item/clothing/head/soheicloth/thunder
			pants = /obj/item/clothing/pants/trou/tobi/thunder
			belt = /obj/item/storage/belt/kaizoku/leather/daisho/thunder
			head = /obj/item/clothing/head/helmet/skullcap/hachigane/thunder
		if("deluge")
			neck = /obj/item/clothing/head/soheicloth/deluge
			pants = /obj/item/clothing/pants/trou/tobi/deluge
			belt = /obj/item/storage/belt/kaizoku/leather/daisho/deluge
			head = /obj/item/clothing/head/helmet/skullcap/hachigane/deluge
		if("ocean")
			neck = /obj/item/clothing/head/soheicloth/ocean
			pants = /obj/item/clothing/pants/trou/tobi/ocean
			belt = /obj/item/storage/belt/kaizoku/leather/daisho/ocean
			head = /obj/item/clothing/head/helmet/skullcap/hachigane/ocean
		if("island")
			neck = /obj/item/clothing/head/soheicloth/island
			pants = /obj/item/clothing/pants/trou/tobi/island
			belt = /obj/item/storage/belt/kaizoku/leather/daisho/island
			head = /obj/item/clothing/head/helmet/skullcap/hachigane/island
	switch(weapontype)
		if("tsukushi")
			backr = /obj/item/weapon/polearm/halberd/bardiche/naginata/tsukushi  //weaker naginata, mass-produced iron tier. Slightly more rare than Yari.
		if("katakama")
			backr = /obj/item/weapon/polearm/spear/yari/katakama//Steel, more combat-effective and rarer than iron Yari.
		if("yari")
			backr = /obj/item/weapon/polearm/spear/yari //just a simple iron spear.

	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/polearms, 3, TRUE) //The true focus of this class.
		H.mind.adjust_skillrank(/datum/skill/combat/bows, 2, TRUE) //I don't think they are deserving of bows, but Soheis irl also used them, soo...
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/shields, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/magic/holy, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, pick(0,1,1), TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/swords, pick(0,1,1), TRUE)
		H.change_stat("strength", 2)
		H.change_stat("constitution", 1)
		H.change_stat("endurance", 2)
		H.change_stat("perception", -2) //(schizophrenia)
		H.change_stat("speed", -1)

	var/datum/devotion/cleric_holder/C = new /datum/devotion/cleric_holder(H, H.patron)
	//Max devotion limit - Sohei are strong for a common role, but cannot pray to gain more abilities beyond t1
	C.update_devotion(50, 50)
	C.holder_mob = H
	C.grant_spells_sohei(H)
	H.verbs += list(/mob/living/carbon/human/proc/devotionreport, /mob/living/carbon/human/proc/clericpray)

	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
