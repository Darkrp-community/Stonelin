datum/migrant_role/inquisitor
	name = "Inquisitor"
	greet_text = "These lands have forfeited Psydon and the Ten. You have come to restore the True faith to these people and tear out the rot festering within."
	antag_datum = /datum/antagonist/purishep
	outfit = /datum/outfit/job/specialinquisitor
	allowed_races = list(SPEC_ID_HUMEN)

/datum/outfit/job/specialinquisitor/pre_equip(mob/living/carbon/human/H, visualsOnly)
	. = ..()
	wrists = /obj/item/clothing/neck/psycross/silver
	neck = /obj/item/clothing/neck/bevor
	shirt = /obj/item/clothing/shirt/undershirt/fancy
	belt = /obj/item/storage/belt/leather/knifebelt/black/psydon
	shoes = /obj/item/clothing/shoes/otavan/inqboots
	pants = /obj/item/clothing/pants/trou/leather
	backr = /obj/item/storage/backpack/satchel
	head = /obj/item/clothing/head/leather/inqhat
	gloves = /obj/item/clothing/gloves/leather/otavan/inqgloves
	beltr = /obj/item/storage/belt/pouch/coins/rich
	beltl = /obj/item/weapon/sword/rapier
	armor = /obj/item/clothing/armor/medium/scale/inqcoat
	backpack_contents = list(/obj/item/weapon/knife/dagger/silver, /obj/item/flashlight/flare/torch/lantern/copper)
	if(H.mind)
		H.adjust_skillrank(/datum/skill/misc/sewing, 2, TRUE)
		H.adjust_skillrank(/datum/skill/misc/medicine, 2, TRUE)
		H.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
		H.adjust_skillrank(/datum/skill/combat/wrestling, 4, TRUE)
		H.adjust_skillrank(/datum/skill/misc/reading, 3, TRUE)
		H.adjust_skillrank(/datum/skill/combat/swords, 4, TRUE)
		H.adjust_skillrank(/datum/skill/combat/crossbows, 3, TRUE)
		H.adjust_skillrank(/datum/skill/misc/climbing, 4, TRUE)
		H.adjust_skillrank(/datum/skill/misc/riding, 1, TRUE)
		H.adjust_skillrank(/datum/skill/misc/athletics, 4, TRUE)
		H.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
		H.adjust_skillrank(/datum/skill/misc/lockpicking, 2, TRUE)
		H.adjust_skillrank(/datum/skill/combat/firearms, 3, TRUE)
		H.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
		H.adjust_skillrank(/datum/skill/labor/mathematics, 3, TRUE)
		H.change_stat(STATKEY_INT, 2)
		H.change_stat(STATKEY_STR, 1)
		H.change_stat(STATKEY_PER, 2)
		H.change_stat(STATKEY_SPD, 2)
		H.change_stat(STATKEY_END, 1)
		if(!H.has_language(/datum/language/oldpsydonic))
			H.grant_language(/datum/language/oldpsydonic)
		if(H.mind.has_antag_datum(/datum/antagonist))
			return
		var/datum/antagonist/new_antag = new /datum/antagonist/purishep()
		H.mind.add_antag_datum(new_antag)
		H.set_patron(/datum/patron/psydon, TRUE)
	ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_NOBLE, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
	H.verbs |= /mob/living/carbon/human/proc/torture_victim
	H.verbs |= /mob/living/carbon/human/proc/faith_test
	to_chat(H,span_info("I can speak Old Psydonic with ,m before my speech."))
	H.mind?.teach_crafting_recipe(/datum/repeatable_crafting_recipe/reading/confessional)

/datum/migrant_role/adept
	name = "Adept"
	greet_text = "Reformed sinner, you came from Grenzelhoft under the command of the Inquisitor. Obey them as if your soul depends on it."
	outfit = /datum/outfit/job/stonekeep/adept_inquisition
	allowed_races = RACES_PLAYER_GRENZ

/datum/migrant_wave/inquisitor
	name = "The Inquisition arrives"
	shared_wave_type = /datum/migrant_wave/inquisitor
	downgrade_wave = /datum/migrant_wave/inquisitor_down_one
	weight = 5
	max_spawns = 1
	roles = list(
		/datum/migrant_role/inquisitor = 1,
		/datum/migrant_role/adept = 2)
	greet_text = "These heathens, they have forsaken the teaching of everything that is good. We shan't let them insults the true Gods no more. The Inquisitor will lead us to make sure of that."


/datum/migrant_wave/inquisitor_down_one
	name = "The Inquisition arrives"
	shared_wave_type = /datum/migrant_wave/inquisitor
	downgrade_wave = /datum/migrant_wave/inquisitor_down_two
	can_roll = FALSE
	roles = list(
		/datum/migrant_role/inquisitor = 1,
		/datum/migrant_role/adept = 1)
	greet_text = "These heathens, they have forsaken the teaching of everything that is good. We shan't let them insults the true Gods no more. The Inquisitor will lead us to make sure of that."

/datum/migrant_wave/inquisitor_down_two
	name = "The Inquisition arrives"
	shared_wave_type = /datum/migrant_wave/inquisitor
	can_roll = FALSE
	roles = list(
		/datum/migrant_role/inquisitor = 1,)
	greet_text = "These heathens, they have forsaken the teaching of everything that is good. We shan't let them insults the true Gods no more. The Inquisitor will lead us to make sure of that."


/datum/round_event_control/antagonist/migrant_wave/inqusitor
	name = "Inquisitor"
	wave_type = /datum/migrant_wave/inquisitor

	weight = 100
	max_occurrences = 1

	earliest_start = 0 SECONDS

	tags = list(
		TAG_PSYEVENT,
	)
	alert_observers = TRUE
	allowed_storytellers = list(/datum/storyteller/psydon)

/datum/outfit/job/stonekeep/adept_inquisition/pre_equip(mob/living/carbon/human/H)
	..()
	belt = /obj/item/storage/belt/leather
	shoes = /obj/item/clothing/shoes/boots
	mask = /obj/item/clothing/face/facemask
	pants = /obj/item/clothing/pants/trou/leather
	shirt = /obj/item/clothing/shirt/undershirt/colored/black
	wrists = /obj/item/clothing/neck/psycross/silver
	armor = /obj/item/clothing/armor/leather/splint
	cloak = /obj/item/clothing/cloak/tabard/adept
	neck = /obj/item/clothing/neck/chaincoif
	gloves = /obj/item/clothing/gloves/angle
	backpack_contents = list(/obj/item/weapon/knife/cleaver/combat = 1,/obj/item/storage/belt/pouch/coins/poor = 1,/obj/item/rope/chain = 1)
	var/loadout = rand(1,3)
	switch(loadout)
		if(1)
			backr = /obj/item/weapon/shield/wood/adept
			beltl = /obj/item/weapon/mace/spiked
		if(2)
			backr = /obj/item/weapon/shield/wood/adept
			beltl = /obj/item/weapon/flail
		if(2)
			backr = /obj/item/gun/ballistic/revolver/grenadelauncher/crossbow
			beltr = /obj/item/ammo_holder/quiver/bolts
			beltl = /obj/item/weapon/mace/cudgel

	//Stats for class
	H.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/axesmaces, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/crossbows, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/whipsflails, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/shields, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/sewing, 1, TRUE)
	H.adjust_skillrank(/datum/skill/misc/medicine, 1, TRUE)
	H.change_stat(STATKEY_STR, 1)
	H.change_stat(STATKEY_END, 1)
	H.change_stat(STATKEY_CON, 1)
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)
	H.cmode_music = 'sound/music/cmode/church/combat_templar.ogg'
	H.mind.teach_crafting_recipe(/datum/blueprint_recipe/confessional)
	if(!H.has_language(/datum/language/oldpsydonic))
		H.grant_language(/datum/language/oldpsydonic)
