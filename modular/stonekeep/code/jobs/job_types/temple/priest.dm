
/datum/job/stonekeep/priest
	title = "Priest"
	flag = SK_PRIEST
	department_flag = CHURCHMEN
	faction = FACTION_STATION
	total_positions = 1
	spawn_positions = 1

	f_title = "Priestess"
	allowed_races = list(
		"Humen",
		"Elf",
		"Half-Elf",
		"Dwarf",
		"Aasimar"
	)
	tutorial = "You are a devoted follower of Astrata. The divine is all that matters in an immoral world. The Sun Queen and her pantheon rule over all, and you will preach their wisdom to Vanderlin. It is up to you to shephard the flock into a Ten-fearing future."
	whitelist_req = FALSE
	bypass_lastclass = TRUE
	outfit = /datum/outfit/job/stonekeep/priest

	display_order = PRIEST_ORDER
	give_bank_account = 100
	cmode_music = 'sound/music/cmode/church/CombatAstrata.ogg'
	min_pq = 0
	selection_color = "#c2a45d"
	spells = list(
		/obj/effect/proc_holder/spell/self/convertrole/templar,
		/obj/effect/proc_holder/spell/self/convertrole/monk
	)

/datum/outfit/job/stonekeep/priest/pre_equip(mob/living/carbon/human/H)
	..()
	H.virginity = TRUE
	H.verbs |= /mob/living/carbon/human/proc/coronate_lord
	H.verbs |= /mob/living/carbon/human/proc/churchexcommunicate
	H.verbs |= /mob/living/carbon/human/proc/churchcurse
	H.verbs |= /mob/living/carbon/human/proc/churchannouncement
	neck = /obj/item/clothing/neck/psycross/silver/astrata
	head = /obj/item/clothing/head/roguehood/priest
	shirt = /obj/item/clothing/shirt/undershirt/priest
	pants = /obj/item/clothing/pants/tights/black
	shoes = /obj/item/clothing/shoes/shortboots
	beltl = /obj/item/storage/keyring/priest
	belt = /obj/item/storage/belt/leather/rope
	armor = /obj/item/clothing/shirt/robe/priest
	backl = /obj/item/storage/backpack/satchel
	backpack_contents = list(/obj/item/needle = 1, /obj/item/storage/belt/pouch/coins/rich = 1 )

	var/obj/item/weapon/polearm/woodstaff/aries/P = new()
	H.put_in_hands(P, forced = TRUE)


	if(H.mind)
		if(H.patron != /datum/patron/divine/astrata) // For some stupid reason this was checking for Dendor before.
			H.set_patron(/datum/patron/divine/astrata)

		H.mind?.adjust_skillrank(/datum/skill/misc/reading, 5, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/magic/holy, 4, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/combat/polearms, 3, TRUE) // Privilege of being the SECOND biggest target in the game, and arguably the worse of the two targets to lose
		H.mind?.adjust_skillrank(/datum/skill/combat/axesmaces, 2, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/misc/sewing, 3, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/misc/medicine, 3, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/craft/cooking, 1, TRUE)
		if(H.age == AGE_OLD)
			H.mind?.adjust_skillrank(/datum/skill/combat/polearms, 1, TRUE)
			H.mind?.adjust_skillrank(/datum/skill/magic/holy, 1, TRUE)
		H.change_stat("strength", 1) // One slot and a VERY important role, it deserves a half-decent statline
		H.change_stat("intelligence", 2)
		H.change_stat("endurance", 2)
		H.change_stat("speed", 1)
	var/datum/devotion/cleric_holder/C = new /datum/devotion/cleric_holder(H, H.patron) // This creates the cleric holder used for devotion spells
	H.verbs += list(/mob/living/carbon/human/proc/devotionreport, /mob/living/carbon/human/proc/clericpray)
	C.grant_spells_priest(H)

	H.update_icons()


