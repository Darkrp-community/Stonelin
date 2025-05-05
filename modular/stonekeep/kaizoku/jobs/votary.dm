/*
Still working on this. But let's update some other things first.

/datum/advclass/pilgrim/stonekeep/kaizoku/votary
	name = "Votary"
	tutorial = "The sea accepts many devotions, and here, you are the few votaries of Abyssanctum to aid in protecting the nation \
	against demonic influence. No longer a supplicant, not yet a guide, but you've been touched by the calling and sworn into holy \
	service. Keep your rites sacred, the mind sharp and the corruption at bay. The Elder Tideseeker is your true leader."
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
	outfit = /datum/outfit/job/sk/pilgrim/kaizoku/votary
	category_tags = list(CTAG_PILGRIM)
	maximum_possible_slots = 2

	cmode_music = 'sound/music/cmode/combat_guard.ogg'

/datum/outfit/job/sk/pilgrim/kaizoku/votary
	allowed_patrons = ALL_ABYSSANCTUM_DOCTRINE

/datum/outfit/job/sk/pilgrim/kaizoku/votary/pre_equip(mob/living/carbon/human/H)
	..()
	belt = /obj/item/storage/belt/leather/rope
	beltr = /obj/item/storage/belt/pouch/coins/poor
	beltl = /obj/item/key/church
	r_hand = /obj/item/weapon/polearm/woodstaff/quarterstaff
	backpack_contents = list(/obj/item/needle)
	switch(H.patron?.type)
		if(/datum/patron/abyssanctum/tideweaver)
			wrists = /obj/item/clothing/neck/psycross/silver/astrata
			cloak = /obj/item/clothing/cloak/stabard/templar/astrata
			neck = /obj/item/clothing/neck/chaincoif
		if(/datum/patron/abyssanctum/curator)
			head = /obj/item/clothing/head/helmet/heavy/necked/dendorhelm
			neck = /obj/item/clothing/neck/coif
			wrists = /obj/item/clothing/neck/psycross/silver/dendor
			cloak = /obj/item/clothing/cloak/raincloak/furcloak
			beltr = /obj/item/weapon/knife/stone
		else // Failsafe
			cloak = /obj/item/clothing/cloak/tabard/crusader
			wrists = /obj/item/clothing/neck/psycross/silver
			neck = /obj/item/clothing/neck/chaincoif/iron
			if(H.mind)
				if(H.patron != /datum/patron/abyssanctum/purifier)
					H.set_patron(/datum/patron/abyssanctum/purifier) //Forces you to be Abyssanctum if you are not.

	if(H.mind)
		H.mind?.adjust_skillrank(/datum/skill/misc/sewing, 3, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/misc/medicine, 2, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/combat/polearms, 2, TRUE) // Khakkhara, buddhism mercy, a weapon and a walking stick
		H.mind?.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/combat/swords, 1, TRUE) //Replace Axe/blunt. East asian monks made a lot of use of blades.
		H.mind?.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE) //Reverted with Reading. More proper for east-asian monks.
		H.mind?.adjust_skillrank(/datum/skill/misc/reading, 2, TRUE) //Reverted with Athletics. More proper for east-asian monks.
		H.mind?.adjust_skillrank(/datum/skill/magic/holy, 3, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/labor/fishing, 1, TRUE) //Abyssorites staple.
		H.mind?.adjust_skillrank(/datum/skill/misc/swimming, 1, TRUE) // One rituals is required to be done while on water. This is quite required.

		H.change_stat("intelligence", 1)
		H.change_stat("endurance", 2) // For casting lots of spells, and working long hours without sleep... in any bed they find.
		H.change_stat("perception", -1)

	var/datum/devotion/cleric_holder/C = new /datum/devotion/cleric_holder(H, H.patron)
	H.verbs += list(/mob/living/carbon/human/proc/devotionreport, /mob/living/carbon/human/proc/clericpray)
	C.grant_spells(H)

*/
