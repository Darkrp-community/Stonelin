/datum/advclass/pilgrim/stonekeep/kaizoku/votary
	name = "Votary" //Essentially the Abyssariad version of Acolytes.
	tutorial = "The sea accepts many devotions, and here, you are the few votaries of Abyssanctum to aid in protecting the nation \
	against demonic influence. No longer a supplicant, not yet a elder, but you've been touched by the calling and sworn into holy \
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
	allowed_patrons =  list(/datum/patron/abyssanctum/purifier, /datum/patron/abyssanctum/curator, /datum/patron/abyssanctum/tideweaver)

/datum/outfit/job/sk/pilgrim/kaizoku/votary/pre_equip(mob/living/carbon/human/H)
	..()
	belt = /obj/item/storage/belt/leather/rope
	beltr = /obj/item/storage/belt/pouch/coins/poor
	r_hand = /obj/item/weapon/polearm/woodstaff/quarterstaff/bostaff
	neck = /obj/item/clothing/neck/psycross/silver/abyssanctum
	backpack_contents = list(/obj/item/needle)
	switch(H.patron?.type)
		if(/datum/patron/abyssanctum/tideweaver)
			H.advjob = "Shoaling" //Our version of 'Shaolin', but with a similar-nomeclature and based on water. https://en.wikipedia.org/wiki/Wave_shoaling
			shirt = /obj/item/clothing/shirt/rags/monkgarb/tideweaver
			shoes = /obj/item/clothing/shoes/shortboots/cloudhead
			pants = /obj/item/clothing/pants/trou/leather/eastpants1
			gloves = /obj/item/clothing/gloves/leather/eastgloves2
			mask = /obj/item/clothing/face/kaizoku/eyeband/tideweaver
			if(H.gender == FEMALE)
				armor = /obj/item/clothing/shirt/rags/monkgarb/tideweaver
				shirt = /obj/item/clothing/suit/roguetown/shirt/eastshirt2 //You won't start with one tits out.
		if(/datum/patron/abyssanctum/curator)
			H.advjob = "Itinerant"
			shirt = /obj/item/clothing/suit/roguetown/shirt/eastshirt1
			cloak = /obj/item/clothing/cloak/raincloak/mino
			shoes = /obj/item/clothing/shoes/boots/jikatabi
			pants = /obj/item/clothing/pants/tights/hakama/curator
			belt = /obj/item/storage/belt/kaizoku/leather/daisho/curator
			gloves = /obj/item/clothing/gloves/leather/eastgloves1
			armor = /obj/item/clothing/armor/leather/jacket/eastsuit2
			head = /obj/item/clothing/head/tengai/curator
		else // Failsafe
			H.advjob = "Shrinekeeper"
			head = /obj/item/clothing/head/padded/shrinekeeper
			armor = /obj/item/clothing/shirt/robe/shrinekeeper
			shirt = /obj/item/clothing/shirt/rags/monkgarb/random
			shoes = /obj/item/clothing/shoes/sandals/geta
			wrists = /obj/item/clothing/wrists/shrinekeeper
			if(H.mind)
				if(H.patron != /datum/patron/abyssanctum/purifier)
					H.set_patron(/datum/patron/abyssanctum/purifier) //Forces you to be Abyssanctum if you are not.

	if(H.mind)
		H.adjust_skillrank(/datum/skill/misc/sewing, 3, TRUE)
		H.adjust_skillrank(/datum/skill/misc/medicine, 2, TRUE)
		H.adjust_skillrank(/datum/skill/combat/polearms, 2, TRUE) // Khakkhara, buddhism mercy, a weapon and a walking stick
		H.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
		H.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
		H.adjust_skillrank(/datum/skill/combat/swords, 1, TRUE) //Replace Axe/blunt. East asian monks made a lot of use of blades.
		H.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE) //Reverted with Reading. More proper for east-asian monks.
		H.adjust_skillrank(/datum/skill/misc/reading, 2, TRUE) //Reverted with Athletics. More proper for east-asian monks.
		H.adjust_skillrank(/datum/skill/magic/holy, 3, TRUE)
		H.adjust_skillrank(/datum/skill/labor/fishing, 1, TRUE) //Abyssorites staple.
		H.adjust_skillrank(/datum/skill/misc/swimming, 1, TRUE) // One rituals is required to be done while on water. This is quite required.

		H.change_stat("intelligence", 1)
		H.change_stat("endurance", 2) // For casting lots of spells, and working long hours without sleep... in any bed they find.
		H.change_stat("perception", -1)

	var/datum/devotion/cleric_holder/C = new /datum/devotion/cleric_holder(H, H.patron)
	H.verbs += list(/mob/living/carbon/human/proc/devotionreport, /mob/living/carbon/human/proc/clericpray)
	C.grant_spells(H)
