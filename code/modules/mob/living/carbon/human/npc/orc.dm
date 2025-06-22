/mob/living/carbon/human/species/orc
	name = "orc"

	icon = 'icons/roguetown/mob/monster/Orc.dmi'
	icon_state = "orc"
	race = /datum/species/orc
	gender = MALE
	bodyparts = list(/obj/item/bodypart/chest/orc, /obj/item/bodypart/head/orc, /obj/item/bodypart/l_arm/orc,
					/obj/item/bodypart/r_arm/orc, /obj/item/bodypart/r_leg/orc, /obj/item/bodypart/l_leg/orc)
	rot_type = /datum/component/rot/corpse/orc
//	var/gob_outfit = /datum/outfit/job/npc/orc/ambush removed to apply different classes to the orcs
	ambushable = FALSE
	base_intents = list(INTENT_HELP, INTENT_DISARM, INTENT_GRAB, /datum/intent/unarmed/claw, /datum/intent/simple/bite, /datum/intent/kick)
	vitae_pool = 1000 // Not as much vitae from them as humans to avoid vampires cheesing mobs

	flee_in_pain = FALSE//they aren't afraid of a fight and they can be cheesed for backstab kills if they do, mutants made for war don't run.
	stand_attempts = 6
	a_intent = INTENT_HELP
	possible_mmb_intents = list(INTENT_STEAL, INTENT_JUMP, INTENT_KICK, INTENT_BITE)
	possible_rmb_intents = list(/datum/rmb_intent/feint, /datum/rmb_intent/swift, /datum/rmb_intent/riposte, /datum/rmb_intent/weak)

/mob/living/carbon/human/species/orc/npc
	ai_controller = /datum/ai_controller/human_npc
	dodgetime = 15 //they can dodge easily, but have a cooldown on it
	canparry = TRUE
	flee_in_pain = FALSE
	simpmob_attack = 40
	simpmob_defend = 30
	wander = TRUE
	attack_speed = 2

/mob/living/carbon/human/species/orc/npc/ambush

/mob/living/carbon/human/species/orc/npc/Initialize()
	. = ..()
	AddComponent(/datum/component/ai_aggro_system)
	AddComponent(/datum/component/combat_noise, list("aggro" = 2))

/mob/living/carbon/human/species/orc/ambush
	ai_controller = /datum/ai_controller/human_npc

/mob/living/carbon/human/species/orc/ambush/Initialize()
	. = ..()
	AddComponent(/datum/component/ai_aggro_system)

/mob/living/carbon/human/species/orc/ambush/after_creation()
	..()
	job = "Ambush Orc"
	ADD_TRAIT(src, TRAIT_NOMOOD, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOHUNGER, TRAIT_GENERIC)
	equipOutfit(new /datum/outfit/job/npc/orc/ambush)
	ambushable = FALSE

/mob/living/carbon/human/species/orc/npc/warlord/after_creation()
	..()
	name = "Warlord Orc"
	job = "Warlord Orc"
	ADD_TRAIT(src, TRAIT_NOMOOD, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOHUNGER, TRAIT_GENERIC)
	equipOutfit(new /datum/outfit/job/npc/orc/warlord)
	ambushable = FALSE

/obj/item/bodypart/chest/orc
	dismemberable = 1
/obj/item/bodypart/l_arm/orc
	dismemberable = 1
/obj/item/bodypart/r_arm/orc
	dismemberable = 1
/obj/item/bodypart/r_leg/orc
	dismemberable = 1
/obj/item/bodypart/l_leg/orc
	dismemberable = 1

/obj/item/bodypart/head/orc/update_icon_dropped()
	return

/obj/item/bodypart/head/orc/get_limb_icon(dropped, hideaux = FALSE)
	return

/obj/item/bodypart/head/orc/skeletonize()
	. = ..()
	icon_state = "orc_skel_head"
	headprice = 2

/mob/living/carbon/human/species/orc/update_body()
	remove_overlay(BODY_LAYER)
	if(!dna || !dna.species)
		return
	var/datum/species/orc/G = dna.species
	if(!istype(G))
		return
	icon_state = ""
	var/list/standing = list()
	var/mutable_appearance/body_overlay
	var/obj/item/bodypart/chesty = get_bodypart("chest")
	var/obj/item/bodypart/headdy = get_bodypart("head")
	if(!headdy)
		if(chesty && chesty.skeletonized)
			body_overlay = mutable_appearance(icon, "orc_skel_decap", -BODY_LAYER)
		else
			body_overlay = mutable_appearance(icon, "[G.raceicon]_decap", -BODY_LAYER)
	else
		if(chesty && chesty.skeletonized)
			body_overlay = mutable_appearance(icon, "orc_skel", -BODY_LAYER)
		else
			body_overlay = mutable_appearance(icon, "[G.raceicon]", -BODY_LAYER)

	if(body_overlay)
		standing += body_overlay
	if(standing.len)
		overlays_standing[BODY_LAYER] = standing

	apply_overlay(BODY_LAYER)
	dna.species.update_damage_overlays()

/mob/living/carbon/human/species/orc/update_inv_head()
	update_wearable()
/mob/living/carbon/human/species/orc/update_inv_armor()
	update_wearable()

/mob/living/carbon/human/species/orc/Initialize()
	. = ..()
	addtimer(CALLBACK(src, PROC_REF(after_creation)), 1 SECONDS)

/mob/living/carbon/human/species/orc/proc/configure_mind()
	if(!mind)
		mind = new /datum/mind(src)
	mind.current = src

	adjust_skillrank(/datum/skill/combat/polearms, 3, TRUE)
	adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
	adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
	adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
	adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
	adjust_skillrank(/datum/skill/combat/axesmaces, 3, TRUE)

/mob/living/carbon/human/species/orc/after_creation()
	..()
	gender = MALE
	if(src.dna && src.dna.species)
		src.dna.species.soundpack_m = new /datum/voicepack/orc()
		var/obj/item/bodypart/head/headdy = get_bodypart("head")
		if(headdy)
			headdy.icon = 'icons/roguetown/mob/monster/Orc.dmi'
			headdy.icon_state = "[src.dna.species.id]_head"
			headdy.headprice = rand(15,40)
	src.grant_language(/datum/language/common)
	var/obj/item/organ/eyes/eyes = src.getorganslot(ORGAN_SLOT_EYES)
	if(eyes)
		eyes.Remove(src,1)
		QDEL_NULL(eyes)
	eyes = new /obj/item/organ/eyes/night_vision/nightmare
	eyes.Insert(src)
	src.underwear = "Nude"
	if(src.charflaw)
		QDEL_NULL(src.charflaw)
	update_body()
	faction = list(FACTION_GRAGGAR)
	name = "orc"
	real_name = "orc"
	ADD_TRAIT(src, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOMOOD, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOHUNGER, TRAIT_GENERIC)
//	ADD_TRAIT(src, TRAIT_NOBREATH, TRAIT_GENERIC)
//	blue breathes underwater, need a new specific one for this maybe organ cheque
//	ADD_TRAIT(src, TRAIT_TOXIMMUNE, TRAIT_GENERIC)
//	if(gob_outfit)
//		var/datum/outfit/O = new gob_outfit
//		if(O)
//			equipOutfit(O)

/datum/species/orc
	name = "orc"
	id = "orc"
	species_traits = list(NO_UNDERWEAR)
	inherent_traits = list(TRAIT_RESISTCOLD,TRAIT_RESISTHIGHPRESSURE,TRAIT_RESISTLOWPRESSURE,TRAIT_RADIMMUNE, TRAIT_NASTY_EATER, TRAIT_LEECHIMMUNE, TRAIT_INHUMENCAMP)
//no_equip = list(SLOT_SHIRT, SLOT_WEAR_MASK, SLOT_GLOVES, SLOT_SHOES, SLOT_PANTS)
	nojumpsuit = 1
	sexes = 1
	damage_overlay_type = ""
	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_MAGIC | MIRROR_PRIDE | RACE_SWAP | SLIME_EXTRACT
	var/raceicon = "orc"




/datum/species/orc/update_damage_overlays(mob/living/carbon/human/H)
	return

/datum/species/orc/regenerate_icons(mob/living/carbon/human/H)
//	H.cut_overlays()
	H.icon_state = ""
	if(H.notransform)
		return 1
	H.update_inv_hands()
	H.update_inv_handcuffed()
	H.update_inv_legcuffed()
	H.update_fire()
	H.update_body()
	var/mob/living/carbon/human/species/orc/G = H
	G.update_wearable()
	H.update_transform()
	return TRUE

/datum/component/rot/corpse/orc/process()
	var/amt2add = 10 //1 second
	var/time_elapsed = last_process ? (world.time - last_process)/10 : 1
	if(last_process)
		amt2add = ((world.time - last_process)/10) * amt2add
	last_process = world.time
	amount += amt2add
	if(has_world_trait(/datum/world_trait/pestra_mercy))
		amount -= 5 * time_elapsed

	var/mob/living/carbon/C = parent
	if(!C)
		qdel(src)
		return
	if(C.stat != DEAD)
		qdel(src)
		return
	var/should_update = FALSE
	if(amount > 20 MINUTES)
		for(var/obj/item/bodypart/B in C.bodyparts)
			if(!B.skeletonized)
				B.skeletonized = TRUE
				should_update = TRUE
	else if(amount > 12 MINUTES)
		for(var/obj/item/bodypart/B in C.bodyparts)
			if(!B.rotted)
				B.rotted = TRUE
				should_update = TRUE
			if(B.rotted && amount < 16 MINUTES && !(FACTION_MATTHIOS in C.faction))
				var/turf/open/T = C.loc
				if(istype(T))
					T.pollute_turf(/datum/pollutant/rot, 4)
	if(should_update)
		if(amount > 20 MINUTES)
			C.update_body()
			qdel(src)
			return
		else if(amount > 12 MINUTES)
			C.update_body()

/////
////
////
//// OUTFIT//////////////////
////
///

/datum/outfit/job/npc/orc/ambush/pre_equip(mob/living/carbon/human/H)
	..()
	H.base_strength = 13
	H.base_speed = 12
	H.base_constitution = 13
	H.base_endurance = 13
	armor = pick (/obj/item/clothing/armor/leather/hide/orc, /obj/item/clothing/armor/chainmail/iron/orc, /obj/item/clothing/armor/plate/orc)
	head = /obj/item/clothing/head/helmet/orc
	var/loadout = rand(1,3)
	switch(loadout)
		if(1) //one handed armed + shield
			r_hand = pick (/obj/item/weapon/axe/iron, /obj/item/weapon/mace/copperbludgeon, /obj/item/weapon/axe/boneaxe, /obj/item/weapon/mace/spiked)
			l_hand = /obj/item/weapon/shield/wood
		if(2) //dual wield
			r_hand = pick (/obj/item/weapon/knife/cleaver/combat, /obj/item/weapon/knife/dagger, /obj/item/weapon/whip)
			l_hand = /obj/item/weapon/sword/short
		if(3) //pikeman
			r_hand = pick (/obj/item/weapon/polearm/spear/billhook, /obj/item/weapon/polearm/spear, /obj/item/weapon/polearm/spear/bonespear)
			l_hand = /obj/item/weapon/shield/wood

//Orc tiers from tribal to warlord
/mob/living/carbon/human/species/orc/tribal
	name = "Tribal Orc"//savage orcs who aren't part of a warband of graggar, low level in weapons and armor
	ai_controller = /datum/ai_controller/human_npc
	var/loadout = /datum/outfit/job/npc/orc/tribal
	ambushable = FALSE

/mob/living/carbon/human/species/orc/tribal/Initialize()
	. = ..()
	AddComponent(/datum/component/ai_aggro_system)

/mob/living/carbon/human/species/orc/tribal/after_creation()
	..()
	ADD_TRAIT(src, TRAIT_NOMOOD, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOHUNGER, TRAIT_GENERIC)
	equipOutfit(new /datum/outfit/job/npc/orc/tribal)
	dodgetime = 15
	canparry = TRUE
	flee_in_pain = FALSE
	wander = TRUE

/datum/outfit/job/npc/orc/tribal/pre_equip(mob/living/carbon/human/H)
	..()
	armor = /obj/item/clothing/armor/leather/hide/orc
	cloak = /obj/item/clothing/cloak/raincloak/brown
	H.base_strength = 13
	H.base_speed = 13
	H.base_constitution = 13
	H.base_endurance = 13
	var/loadout = rand(1,5)
	switch(loadout)
		if(1) //axe Warrior
			r_hand = /obj/item/weapon/axe/boneaxe
			l_hand = /obj/item/weapon/shield/wood
		if(2) //Long Club Caveman
			r_hand = /obj/item/weapon/mace/goden/shillelagh
		if(3) //Club Caveman
			r_hand = /obj/item/weapon/mace/woodclub
			l_hand = /obj/item/weapon/shield/wood
		if(4) //dagger fighter
			r_hand = /obj/item/weapon/knife/stone
			l_hand = /obj/item/weapon/knife/stone
		if(5) //Spear hunter
			r_hand = /obj/item/weapon/polearm/spear/bonespear
			l_hand = /obj/item/weapon/shield/wood


//////////////////////////////////////////////////////////

/mob/living/carbon/human/species/orc/warrior
	name = "Warrior Orc"//average fighters of the horde, iron gear and lot of power
	ai_controller = /datum/ai_controller/human_npc
	var/loadout = /datum/outfit/job/npc/orc/warrior
	ambushable = FALSE

/mob/living/carbon/human/species/orc/warrior/after_creation()
	..()
	AddComponent(/datum/component/ai_aggro_system)
	ADD_TRAIT(src, TRAIT_NOMOOD, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOHUNGER, TRAIT_GENERIC)
	equipOutfit(new /datum/outfit/job/npc/orc/warrior)
	dodgetime = 15
	canparry = TRUE
	flee_in_pain = FALSE
	wander = TRUE

/datum/outfit/job/npc/orc/warrior/pre_equip(mob/living/carbon/human/H)
	..()
	armor = pick (/obj/item/clothing/armor/chainmail/iron/orc, /obj/item/clothing/armor/plate/orc)
	head = /obj/item/clothing/head/helmet/orc
	H.base_strength = 13
	H.base_speed = 13
	H.base_constitution = 14
	H.base_endurance = 14
	var/loadout = rand(1,4)
	switch(loadout)
		if(1) //one handed armed + shield
			r_hand = pick (/obj/item/weapon/axe/iron, /obj/item/weapon/sword/scimitar/messer, /obj/item/weapon/flail, /obj/item/weapon/mace/spiked)
			l_hand = /obj/item/weapon/shield/wood
		if(2) //dual wield
			r_hand = pick (/obj/item/weapon/sword/scimitar/messer, /obj/item/weapon/knife/dagger, /obj/item/weapon/flail, /obj/item/weapon/axe/iron, /obj/item/weapon/mace/spiked)
			l_hand = pick (/obj/item/weapon/sword/short, /obj/item/weapon/knife/dagger)
		if(3) //pikeman
			r_hand = pick (/obj/item/weapon/polearm/spear/billhook, /obj/item/weapon/polearm/spear,/obj/item/weapon/polearm/spear/bronze)
			l_hand = /obj/item/weapon/shield/wood




///////////////////////////////////////////////////////////////////////////////////////

/mob/living/carbon/human/species/orc/marauder
	name = "Marauder Orc"
	ai_controller = /datum/ai_controller/human_npc
	var/loadout = /datum/outfit/job/npc/orc/marauder
	ambushable = FALSE

/mob/living/carbon/human/species/orc/marauder/after_creation()
	..()
	AddComponent(/datum/component/ai_aggro_system)
	ADD_TRAIT(src, TRAIT_NOMOOD, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOHUNGER, TRAIT_GENERIC)
	equipOutfit(new /datum/outfit/job/npc/orc/marauder)
	dodgetime = 15
	canparry = TRUE
	flee_in_pain = FALSE
	wander = TRUE

/datum/outfit/job/npc/orc/marauder/pre_equip(mob/living/carbon/human/H)
	..()
	armor = /obj/item/clothing/armor/plate/orc
	head = /obj/item/clothing/head/helmet/orc
	cloak = /obj/item/clothing/cloak/volfmantle//kinda elite orcs with better armor secured + some steel weapons
	H.base_strength = 12
	H.base_speed = 12
	H.base_constitution = 13
	H.base_endurance = 13
	var/loadout = rand(1,5)
	switch(loadout)
		if(1) //Marauder with Sword and Shield
			r_hand = /obj/item/weapon/sword/scimitar
			l_hand = /obj/item/weapon/shield/tower
		if(2) //Marauder with Axe and Shield
			r_hand = /obj/item/weapon/axe/battle
		if(3) //Warhammer Caveman
			r_hand = /obj/item/weapon/mace/goden/steel/warhammer
		if(4) //
			r_hand = /obj/item/weapon/mace/steel
			l_hand = /obj/item/weapon/shield/tower
		if(5) //Marauder Ironblade
			r_hand = /obj/item/weapon/sword/long

///////////////////////////////////////////////////////////////////////////////////////
/mob/living/carbon/human/species/orc/warlord
	name = "Warlord Orc"
	ai_controller = /datum/ai_controller/human_npc
	var/loadout = /datum/outfit/job/npc/orc/warlord
	ambushable = FALSE

/mob/living/carbon/human/species/orc/warlord/after_creation()
	..()
	AddComponent(/datum/component/ai_aggro_system)
	ADD_TRAIT(src, TRAIT_NOMOOD, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOHUNGER, TRAIT_GENERIC)
	equipOutfit(new /datum/outfit/job/npc/orc/warlord)
	dodgetime = 15
	canparry = TRUE
	flee_in_pain = FALSE
	wander = TRUE

/datum/outfit/job/npc/orc/warlord/pre_equip(mob/living/carbon/human/H)
	..()
	H.base_strength = 14
	H.base_speed = 14
	H.base_constitution = 14
	H.base_endurance = 14
	armor = /obj/item/clothing/armor/plate/orc/warlord
	cloak = /obj/item/clothing/cloak/raincloak/red
	head = /obj/item/clothing/head/helmet/orc/warlord
	var/loadout = rand(1,5)
	switch(loadout)
		if(1) //Halberd Warlord
			r_hand = /obj/item/weapon/polearm/halberd
		if(2) //Greatsword Warlord
			r_hand = /obj/item/weapon/sword/long/greatsword
		if(3) // WE DON'T WANNA GO TO WAR TODAY BUT THE LORD OF THE LASH SAYS "NAY NAY NAY!!" WE'RE GONNA MARCH ALL DAE, ALL DAE, ALL DAE! WHERE THERE'S A WHIP THERE'S A WAY!!
			r_hand = /obj/item/weapon/whip/antique
			l_hand = /obj/item/weapon/sword/short
		if(4) // Big Sword and Big Shield
			r_hand = /obj/item/weapon/sword/scimitar/falchion
			l_hand = /obj/item/weapon/shield/tower/metal
		if(5) //Anti Knight STR Build
			r_hand = /obj/item/weapon/flail/peasant


/mob/living/carbon/human/species/orc/warlord/skilled/after_creation() //these ones dont parry, but still get good weapon skills
	..()
	ADD_TRAIT(src, TRAIT_NOMOOD, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOHUNGER, TRAIT_GENERIC)
	equipOutfit(new /datum/outfit/job/npc/orc/warlord)
	dodgetime = 15
	canparry = TRUE
	flee_in_pain = FALSE
	wander = TRUE
	configure_mind()

// obsolete just kept because vanderlin uses it
/mob/living/carbon/human/species/orc/ambush
