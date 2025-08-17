/datum/job/templar
	tutorial = "<br><br><font color='#c0c394'><span class='bold'>The warriors of the Temple come from many backgrounds -\
	Zealots who have been touched by the Gods, orphans and children of the Maidens, raised in the Temple, old soldiers trying to atone for mis-spent lives. <br><br>\
	All have sworn an oath to the Temple to preserve all Ten against those who wish to defile them, even if they naturally gravitate to one or other of the deities.</span></font><br><br>"
	department_flag = CHURCHMEN
	display_order = TEMPLAR_ORDER
	faction = FACTION_TOWN
	total_positions = 2
	spawn_positions = 2
	min_pq = 0

	allowed_races = RACES_PLAYER_NONDISCRIMINATED
	allowed_patrons = SK_TEMPLAR_PATRONS

	outfit = /datum/outfit/job/stonekeep/templar
	cmode_music = 'sound/music/cmode/church/combat_templar.ogg'

/datum/outfit/job/stonekeep/templar
	name = "Templar"
	jobtype = /datum/job/templar
	allowed_patrons = SK_TEMPLAR_PATRONS
	job_bitflag = BITFLAG_CHURCH


/datum/outfit/job/stonekeep/templar/pre_equip(mob/living/carbon/human/H)
	..()
	head = /obj/item/clothing/head/helmet/heavy/bucket
	cloak = /obj/item/clothing/cloak/tabard/crusader/tief
	armor = /obj/item/clothing/armor/chainmail/hauberk
	shirt = /obj/item/clothing/armor/gambeson/light
	pants = /obj/item/clothing/pants/tights/colored/random
	shoes = /obj/item/clothing/shoes/boots

	belt = /obj/item/storage/belt/leather/black/church
	beltl = /obj/item/storage/belt/pouch/coins/poor
	gloves = /obj/item/clothing/gloves/chain

	switch(H.patron?.type)
		if(/datum/patron/divine/astrata)
			neck = /obj/item/clothing/neck/psycross/silver/astrata
			head = /obj/item/clothing/head/helmet/heavy/bucket/templar
			cloak = /obj/item/clothing/cloak/stabard/templar/astrata
			backl = /obj/item/weapon/sword/long/exe/astrata
			beltr = /obj/item/weapon/knife/dagger

			H.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
			ADD_TRAIT(H, TRAIT_APRICITY, TRAIT_GENERIC)	// daytime stamina regen bonus

		if(/datum/patron/divine/noc)
			neck = /obj/item/clothing/neck/psycross/noc
			head = /obj/item/clothing/head/helmet/heavy/bucket/templar/noc
			cloak = /obj/item/clothing/cloak/stabard/templar/noc
			backr = /obj/item/weapon/shield/tower/buckleriron
			shirt = /obj/item/clothing/armor/gambeson/light/colored/black
			beltr = /obj/item/weapon/sword/sabre/noc

			H.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
			ADD_TRAIT(H, TRAIT_NIGHT_OWL, TRAIT_GENERIC)
			H.virginity = TRUE
			var/obj/item/organ/eyes/eyes = H.getorganslot(ORGAN_SLOT_EYES)
			if(!eyes)
				return
			eyes.see_in_dark = 3
			eyes.lighting_alpha = LIGHTING_PLANE_ALPHA_NV_TRAIT
			H.update_sight()

		if(/datum/patron/divine/dendor)
			neck = /obj/item/clothing/neck/psycross/silver/dendor
			head = /obj/item/clothing/head/helmet/leather/saiga
			cloak = /obj/item/clothing/cloak/stabard/templar/dendor
			backr = /obj/item/weapon/polearm/halberd/bardiche/dendor
			beltr = /obj/item/weapon/knife/stone

			H.adjust_skillrank(/datum/skill/combat/polearms, 3, TRUE)
			ADD_TRAIT(H, TRAIT_KNEESTINGER_IMMUNITY, TRAIT_GENERIC)

		if(/datum/patron/divine/necra)
			neck = /obj/item/clothing/neck/psycross/silver/necra
			head = /obj/item/clothing/head/helmet/heavy/bucket/templar/necra
			cloak = /obj/item/clothing/cloak/stabard/templar/necra
			beltr = /obj/item/weapon/flail/sflail
			backr = /obj/item/weapon/shield/tower/metal/necra

			H.adjust_skillrank(/datum/skill/combat/whipsflails, 3, TRUE)
			ADD_TRAIT(H, TRAIT_SOUL_EXAMINE, TRAIT_GENERIC)
			ADD_TRAIT(H, TRAIT_NOSTINK, TRAIT_GENERIC)

		if(/datum/patron/divine/pestra)
			neck = /obj/item/clothing/neck/psycross/silver/pestra
			head = /obj/item/clothing/head/helmet/pestracage
			cloak = /obj/item/clothing/cloak/stabard/templar/pestra
			beltl = /obj/item/weapon/knife/dagger/steel
			beltr =  /obj/item/weapon/knife/hunting/sai
			backl = /obj/item/storage/backpack/satchel/cloth
			backpack_contents = list(/obj/item/needle, /obj/item/reagent_containers/glass/bottle/poison)

			ADD_TRAIT(H, TRAIT_DUALWIELDER, TRAIT_GENERIC)
			ADD_TRAIT(H, TRAIT_NOSTINK, TRAIT_GENERIC)
			H.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
			H.adjust_skillrank(/datum/skill/craft/alchemy, 2, TRUE)
			H.add_spell(/datum/action/cooldown/spell/diagnose/holy)

		if(/datum/patron/divine/eora)
			head = /obj/item/clothing/head/helmet/sallet/eoran
			wrists = /obj/item/clothing/neck/psycross/silver/eora
			neck = /obj/item/clothing/neck/chaincoif
			cloak = /obj/item/clothing/cloak/stabard/templar/eora
			backr = /obj/item/weapon/shield/tower/metal
			beltr = /obj/item/weapon/sword/arming

			H.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
			ADD_TRAIT(H, TRAIT_EXTEROCEPTION, TRAIT_GENERIC)

		if(/datum/patron/divine/ravox)
			wrists = /obj/item/clothing/neck/psycross/silver/ravox
			head = /obj/item/clothing/head/helmet/heavy/bucket/templar/ravox
			cloak = /obj/item/clothing/cloak/stabard/templar/ravox
			backl = /obj/item/weapon/sword/long/ravox
			beltr = /obj/item/weapon/knife/dagger

			H.adjust_skillrank(/datum/skill/combat/swords, 4, TRUE)
			ADD_TRAIT(H, TRAIT_SHARPER_BLADES, TRAIT_GENERIC)

		if(/datum/patron/divine/malum)
			wrists = /obj/item/clothing/neck/psycross/silver/malum
			head = /obj/item/clothing/head/helmet/leather/minershelm/malumite
			cloak = /obj/item/clothing/cloak/stabard/templar/malum
			backl = /obj/item/weapon/mace/goden/steel/malum
			neck = /obj/item/clothing/neck/bevor/iron

			H.adjust_skillrank(/datum/skill/combat/axesmaces, 3, TRUE)
			H.adjust_skillrank(/datum/skill/craft/blacksmithing, 1, TRUE)
			ADD_TRAIT(H, TRAIT_BETTER_SLEEP, TRAIT_GENERIC)

		if(/datum/patron/divine/abyssor)
			head = /obj/item/clothing/head/helmet/heavy/bucket/templar/abyssor
			wrists = /obj/item/clothing/neck/psycross/silver/abyssor
			cloak = /obj/item/clothing/cloak/stabard/templar/abyssor
			backr = /obj/item/weapon/shield/wood/rattan
			r_hand = /obj/item/weapon/polearm/spear/hoplite

			H.adjust_skillrank(/datum/skill/labor/fishing, 1, TRUE)
			H.adjust_skillrank(/datum/skill/combat/polearms, 3, TRUE)
			H.add_spell(/datum/action/cooldown/spell/projectile/swordfish)
			ADD_TRAIT(H, TRAIT_LEECHIMMUNE, TRAIT_GENERIC)

		if(/datum/patron/divine/xylix)
			head = /obj/item/clothing/head/helmet/heavy/necked/xylix
			neck = /obj/item/clothing/neck/psycross/silver/xylix
			cloak = /obj/item/clothing/cloak/stabard/templar/xylix
			var/loadout = rand(1,3)
			switch(loadout)
				if(1)
					r_hand = /obj/item/weapon/whip/xylix
					H.adjust_skillrank(/datum/skill/combat/whipsflails, pick(2,3,3,4), TRUE)
				if(2)
					r_hand = /obj/item/weapon/mace/goden
					H.adjust_skillrank(/datum/skill/combat/axesmaces, pick(2,3,3,4), TRUE)
				if(3)
					r_hand = /obj/item/weapon/sword/rapier
					H.adjust_skillrank(/datum/skill/combat/swords, pick(2,3,3,4), TRUE)

			ADD_TRAIT(H, TRAIT_BLACKLEG, TRAIT_GENERIC)

	H.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/shields, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/climbing, 1, TRUE)
	H.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/reading, 2, TRUE)
	H.change_stat("strength", 2)
	H.change_stat("constitution", 2)
	H.change_stat("endurance", 2)
	H.change_stat("speed", -1)

	ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)

	if(H.dna?.species)
		if(H.dna.species.id == "humen")
			H.dna.species.soundpack_m = new /datum/voicepack/male/knight()




// Templar spells - weak, not healing
/datum/action/cooldown/spell/undirected/moon_sense
	name = "Light of the Moon"
	desc = "Grants a temporary heightened darkvision."
	button_icon_state = "moonlight"
	button_icon = 'modular/stonekeep/icons/screen_alert.dmi'
	sound = 'sound/vo/smokedrag.ogg'

	spell_type = SPELL_MIRACLE
	antimagic_flags = MAGIC_RESISTANCE_HOLY
	associated_skill = /datum/skill/magic/holy
	required_items = list(/obj/item/clothing/neck/psycross/noc)
	attunements = list(
		/datum/attunement/earth = 0.5,
	)

	invocation = "Moon Prince, guide my hand in the darkness."
	invocation_type = INVOCATION_WHISPER

	charge_required = FALSE
	cooldown_time = 10 MINUTES
	spell_cost = 20

/datum/action/cooldown/spell/undirected/moon_sense/can_cast_spell(feedback)
	. = ..()
	if(!.)
		return
	if(!iscarbon(owner))
		return FALSE
	var/mob/living/carbon/C = owner
	var/obj/item/organ/eyes/eyes = C.getorgan(/obj/item/organ/eyes)
	if(!eyes)
		if(feedback)
			to_chat(owner, span_warning("The Moon Prince can not restore my eyes."))
		return FALSE

/datum/action/cooldown/spell/undirected/moon_sense/cast(atom/cast_on)
	. = ..()
	addtimer(CALLBACK(src, PROC_REF(grant_status)), 1 SECONDS)

/datum/action/cooldown/spell/undirected/moon_sense/proc/grant_status()
	var/mob/living/carbon/C = owner
	C.apply_status_effect(/datum/status_effect/buff/moonsense)

/datum/status_effect/buff/moonsense
	id = "moonsense"
	alert_type = /atom/movable/screen/alert/status_effect/buff/moonsense
	effectedstats = list(STATKEY_PER = 2)
	duration = 10 MINUTES

/atom/movable/screen/alert/status_effect/buff/moonsense
	name = "Guided by moonlight"
	desc = span_nicegreen("The faintest light reveals all to the wise..")
	icon_state = "moon"
	icon = 'modular/stonekeep/icons/screen_alert.dmi'
