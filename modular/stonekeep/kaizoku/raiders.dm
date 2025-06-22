// These guys are mostly meant to appear only on events.
// It would be unwise to put them anywhere 'spawnable' unless it is the ocean. As in, it would make completely sense for them to raid beaches.

#define STAMINA_THRESHOLD 25

GLOBAL_LIST_INIT(custodian_quotes, world.file2list("strings/rt/custodianlines.txt"))
GLOBAL_LIST_INIT(custodian_aggro, world.file2list("strings/rt/custodianaggrolines.txt"))
GLOBAL_LIST_INIT(custodian_special, world.file2list("strings/rt/custodianspecial.txt"))
GLOBAL_LIST_INIT(custodian_tease, world.file2list("strings/rt/custodiantease.txt"))
GLOBAL_LIST_INIT(custodian_handsoff, world.file2list("strings/rt/custodian_handsoff.txt"))

/mob/living/carbon/human/species/abyssariad/raider
	ai_controller = /datum/ai_controller/human_npc
	faction = list("burakumin")
	ambushable = FALSE
	dodgetime = 3 SECONDS
	flee_in_pain = TRUE
	possible_rmb_intents = list(/datum/rmb_intent/strong)
	wander = FALSE
	abyssariadraider = TRUE
	shuriken_count = 3

/mob/living/carbon/human/species/abyssariad/raider/Initialize()
	. = ..()
	var/list/racetypes = list("Changeling" = 1, "Skylancer" = 1, "Ogrun" = 1)
	var/type = pickweight(racetypes)
	src.gender = MALE // lore implications.
	switch(type)
		if("Changeling")
			set_species(/datum/species/abyssariad/changeling)
		if("Skylancer")
			set_species(/datum/species/abyssariad/skylancer)
		if("Ogrun")
			set_species(/datum/species/abyssariad/ogrun)
	addtimer(CALLBACK(src, PROC_REF(after_creation)), 1 SECONDS)
	d_intent = INTENT_PARRY
	canparry = TRUE
	cmode = 1
	canparry = TRUE
	wander = TRUE

/mob/living/carbon/human/species/abyssariad/raider/after_creation()
	..()
	if(!mind)
		mind = new /datum/mind(src)
	mind.transfer_to(src)

	if(mind?.get_language_holder())
		grant_language(/datum/language/common)
		grant_language(/datum/language/abyssal)

//custodian lowclass class

/mob/living/carbon/human/species/abyssariad/raider/retainer/after_creation()
	..()
	job = "Exiled Retainer"
	ADD_TRAIT(src, TRAIT_NOMOOD, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOHUNGER, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)

	equipOutfit(new /datum/outfit/job/roguetown/antag/raider/retainer)
	defprob = 50
	configure_mind()
	d_intent = INTENT_DODGE
	dodgetime = 6 SECONDS
	canparry = TRUE

	flee_in_pain = TRUE
	ambushable = FALSE

/datum/outfit/job/roguetown/antag/raider/retainer/pre_equip(mob/living/carbon/human/H)
	..()

	H.STASTR = rand(11,13)
	H.STASPD = rand(10,12)
	H.STACON = rand(11,13)
	H.STAEND = rand(11,13)
	H.STAINT = rand(10,12)

	shirt = /obj/item/clothing/armor/gambeson/ruankai
	mask = /obj/item/clothing/face/kaizoku/menpo/half
	cloak = /obj/item/clothing/cloak/stabard/haramaki/jinbaori/raider
	shoes = /obj/item/clothing/shoes/boots/jikatabi/shinobi
	belt = /obj/item/storage/belt/kaizoku/leather/daisho/random
	neck = /obj/item/clothing/neck/chaincoif/iron/kusari_zukin
	pants = /obj/item/clothing/pants/chainlegs/iron/haidate_tatami

	var/loadout = rand(1, 4)
	switch(loadout)
		if(1)
			r_hand = /obj/item/weapon/sword/scimitar/messer/dao
			l_hand = /obj/item/weapon/shield/wood/rattan
			armor = /obj/item/clothing/armor/cuirass/iron/sanmaido
			head = /obj/item/clothing/head/helmet/kettle/jingasa
		if(2)
			r_hand = /obj/item/weapon/mace/steel/ararebo
			l_hand = /obj/item/weapon/shield/wood/rattan
			head = /obj/item/clothing/head/helmet/skullcap/hachigane
			armor = /obj/item/clothing/armor/chainmail/tatami
		if(3)
			r_hand = /obj/item/weapon/flail/sflail/kusarifundo
			l_hand = /obj/item/weapon/shield/wood/rattan
			armor = /obj/item/clothing/armor/chainmail/tatami
			head = /obj/item/clothing/head/helmet/kettle/jingasa
		if(4)
			r_hand = /obj/item/weapon/polearm/spear/yari/katakama
			armor = /obj/item/clothing/armor/cuirass/nanbando
			head = /obj/item/clothing/head/helmet/kettle/jingasa

/mob/living/carbon/human/species/abyssariad/raider/retainer/proc/configure_mind()
	mind = new /datum/mind(src)
	adjust_skillrank(/datum/skill/combat/shields, 3, TRUE)
	adjust_skillrank(/datum/skill/combat/polearms, 3, TRUE)
	adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
	adjust_skillrank(/datum/skill/combat/axesmaces, 3, TRUE)
	adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
	adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
	adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)

	adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
	adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
	adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
	adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
	adjust_skillrank(/datum/skill/misc/sneaking, 2, TRUE)
	adjust_skillrank(/datum/skill/misc/lockpicking, 2, TRUE)

	adjust_skillrank(/datum/skill/craft/crafting, 1, TRUE)
	adjust_skillrank(/datum/skill/craft/tanning, 1, TRUE)

//lowclass Custodian class

/mob/living/carbon/human/species/abyssariad/raider/custodian/after_creation()
	..()
	job = "Lowclass Custodian"
	ADD_TRAIT(src, TRAIT_NOMOOD, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOHUNGER, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
	equipOutfit(new /datum/outfit/job/roguetown/antag/raider/custodian)
	defprob = 60 //more skilled
	configure_mind()
	d_intent = INTENT_PARRY //these ones will parry instead of dodge, the higher the skill the more powerful this is of course
	dodgetime = 4 SECONDS
	canparry = TRUE

	flee_in_pain = TRUE
	ambushable = FALSE

/datum/outfit/job/roguetown/antag/raider/custodian/pre_equip(mob/living/carbon/human/H)
	..()

	H.STASTR = rand(13,15)
	H.STASPD = rand(11,12)
	H.STACON = rand(13,15)
	H.STAEND = rand(12,15)
	H.STAINT = rand(10,12)

	pants = /obj/item/clothing/pants/chainlegs/sendan/cursed
	mask = /obj/item/clothing/face/kaizoku/menpo
	cloak = /obj/item/clothing/cloak/stabard/haramaki/odoshi/raider
	shoes = /obj/item/clothing/shoes/boots/armor/suneate/cursed
	belt = /obj/item/storage/belt/kaizoku/leather/daisho/random
	wrists = /obj/item/clothing/wrists/bracers/kote/cursed
	neck = /obj/item/clothing/neck/chaincoif/karuta_zukin

	var/loadout = rand(1, 4)
	switch(loadout)
		if(1)
			r_hand = /obj/item/weapon/sword/uchigatana
			l_hand = /obj/item/weapon/shield/tower/abyssaltower
			armor = /obj/item/clothing/armor/plate/mirror
			head = /obj/item/clothing/head/helmet/sallet/tosei_kabuto/cursed
			shirt = /obj/item/clothing/armor/gambeson/light/hitatare/random
		if(2)
			r_hand = /obj/item/weapon/mace/steel/ararebo
			l_hand = /obj/item/weapon/shield/tower/abyssaltower
			head = /obj/item/clothing/head/helmet/sallet/tosei_kabuto/cursed
			armor = /obj/item/clothing/armor/chainmail/hauberk/kusari
			shirt = /obj/item/clothing/armor/gambeson/ruankai
		if(3)
			r_hand = /obj/item/weapon/polearm/halberd/bardiche/naginata/dustcurse
			armor = /obj/item/clothing/armor/medium/surcoat/heartfelt/abyssariad
			head = /obj/item/clothing/head/helmet/sallet/tosei_kabuto/cursed
			shirt = /obj/item/clothing/armor/chainmail/tatami
		if(4)
			r_hand = /obj/item/weapon/mace/goden/kanabo
			armor =/obj/item/clothing/armor/medium/surcoat/heartfelt/abyssariad
			head = /obj/item/clothing/head/helmet/sallet/tosei_kabuto/cursed
			shirt = /obj/item/clothing/armor/chainmail/tatami

/mob/living/carbon/human/species/abyssariad/raider/custodian/proc/configure_mind()
	mind = new /datum/mind(src)
	adjust_skillrank(/datum/skill/combat/axesmaces, 5, TRUE)
	adjust_skillrank(/datum/skill/combat/swords, 5, TRUE)
	adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
	adjust_skillrank(/datum/skill/combat/polearms, 5, TRUE)
	adjust_skillrank(/datum/skill/combat/wrestling, 5, TRUE)
	adjust_skillrank(/datum/skill/combat/unarmed, 5, TRUE)

	adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
	adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
	adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
	adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
	adjust_skillrank(/datum/skill/misc/sneaking, 2, TRUE)
	adjust_skillrank(/datum/skill/misc/lockpicking, 2, TRUE)

	adjust_skillrank(/datum/skill/craft/crafting, 1, TRUE)
	adjust_skillrank(/datum/skill/craft/tanning, 1, TRUE)

//highclass custodian

/mob/living/carbon/human/species/abyssariad/raider/highcustodian/after_creation()
	..()
	job = "Exiled High Custodian"
	ADD_TRAIT(src, TRAIT_NOMOOD, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOHUNGER, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_HEAVYARMOR, TRAIT_GENERIC)

	equipOutfit(new /datum/outfit/job/roguetown/antag/raider/highcustodian)
	defprob = 70 //even more skilled. I don't even know if that works, honestly.
	configure_mind()
	d_intent = INTENT_PARRY //these ones will parry instead of dodge, the higher the skill the more powerful this is of course
	dodgetime = 4 SECONDS
	canparry = TRUE

	flee_in_pain = TRUE
	ambushable = FALSE

/datum/outfit/job/roguetown/antag/raider/highcustodian
	name = "Exiled Highclass Custodian"

/datum/outfit/job/roguetown/antag/raider/highcustodian/pre_equip(mob/living/carbon/human/H)
	..()
	H.STASTR = rand(13,16)
	H.STASPD = rand(11,13)
	H.STACON = rand(13,16)
	H.STAEND = rand(12,16)
	H.STAINT = rand(10,13)

	pants = /obj/item/clothing/pants/chainlegs/sendan/cursed
	mask = /obj/item/clothing/face/kaizoku/menpo/steel
	cloak = /obj/item/clothing/cloak/stabard/haramaki/odoshi/raider
	shoes = /obj/item/clothing/shoes/boots/armor/suneate/cursed
	belt = /obj/item/storage/belt/kaizoku/leather/daisho/random
	wrists = /obj/item/clothing/wrists/bracers/kote/cursed
	neck = /obj/item/clothing/neck/chaincoif/karuta_zukin

	var/loadout = rand(1, 4)
	switch(loadout)
		if(1)
			r_hand = /obj/item/weapon/mace/goden/steel/tetsubo/dustcurse
			armor = /obj/item/clothing/armor/plate/full/nanbando/cursed
			head = /obj/item/clothing/head/helmet/visored/zunari/cursed
			shirt = /obj/item/clothing/armor/chainmail/hauberk/kusari
		if(2)
			r_hand = /obj/item/weapon/polearm/halberd/bisento/dustcurse
			armor = /obj/item/clothing/armor/plate/full/nanbando/cursed
			head = /obj/item/clothing/head/helmet/sallet/tosei_kabuto/cursed
			shirt = /obj/item/clothing/armor/chainmail/hauberk/kusari
		if(3)
			r_hand = /obj/item/weapon/mace/steel/ararebo
			l_hand = /obj/item/weapon/shield/tower/abyssaltower
			armor = /obj/item/clothing/armor/brigandine/oyoroi
			head = /obj/item/clothing/head/helmet/visored/zunari/cursed
			shirt = /obj/item/clothing/armor/gambeson/ruankai
		if(4)
			r_hand = /obj/item/weapon/sword/long/tachi/dustcurse
			l_hand = /obj/item/weapon/shield/tower/metal/abyssal/dustcurse
			armor = /obj/item/clothing/armor/brigandine/oyoroi/oyoroigusoku/cursed
			head = /obj/item/clothing/head/helmet/sallet/tosei_kabuto/cursed
			shirt = /obj/item/clothing/armor/gambeson/ruankai

/mob/living/carbon/human/species/abyssariad/raider/highcustodian/proc/configure_mind()
	mind = new /datum/mind(src)
	adjust_skillrank(/datum/skill/combat/axesmaces, 5, TRUE)
	adjust_skillrank(/datum/skill/combat/swords, 5, TRUE)
	adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
	adjust_skillrank(/datum/skill/combat/polearms, 5, TRUE)
	adjust_skillrank(/datum/skill/combat/wrestling, 5, TRUE)
	adjust_skillrank(/datum/skill/combat/unarmed, 5, TRUE)

	adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
	adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
	adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
	adjust_skillrank(/datum/skill/misc/sneaking, 2, TRUE)
	adjust_skillrank(/datum/skill/misc/lockpicking, 2, TRUE)
	adjust_skillrank(/datum/skill/craft/crafting, 1, TRUE)
	adjust_skillrank(/datum/skill/craft/tanning, 1, TRUE)
	adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)

/*
/mob/living/carbon/human/species/abyssariad/raider/npc_idle()
	if(m_intent == MOVE_INTENT_SNEAK)
		return
	if(world.time < next_idle)
		return
	next_idle = world.time + rand(30, 70)
	if((mobility_flags & MOBILITY_MOVE) && isturf(loc) && wander)
		if(prob(20))
			var/turf/T = get_step(loc, pick(GLOB.cardinals))
			if(!istype(T, /turf/open/transparent/openspace))
				Move(T)
		else
			face_atom(get_step(src, pick(GLOB.cardinals)))
	else if(!wander && prob(10))
		face_atom(get_step(src, pick(GLOB.cardinals)))
	// Healing after being idle for some time
	if(prob(5) && src.health < src.maxHealth)
		var/greenpoultice = 100
		src.apply_damage(-greenpoultice, BRUTE)
		src.apply_damage(-greenpoultice, BURN)
		visible_message(span_notice("[src] spreads a green poultice on the body."))
		src.regenerate_organs()
		src.spill_embedded_objects()

		var/list/hurt_limbs = src.get_damaged_bodyparts(1, 1, null, BODYPART_ORGANIC)
		for(var/obj/item/bodypart/X in hurt_limbs)
			if(X.heal_damage(greenpoultice, greenpoultice, null, BODYPART_ORGANIC))
				src.update_damage_overlays()
		src.updatehealth()
	if(prob(3))
		say(pick(GLOB.custodian_quotes))
	if(prob(3))
		emote(pick("laugh", "throatsing"))
*/

/mob/living/carbon/human/proc/killyielder(mob/living/target)
	var/obj/item/bodypart/head = target.get_bodypart(BODY_ZONE_HEAD)
	if(head)
		var/obj/item/I = target.get_item_by_slot(SLOT_HEAD) // First, this code selects the head.
		if(I) //Then proceeds to remove any head protection.
			target.doUnEquip(I)
			I.forceMove(get_turf(target))

		target.visible_message(
			span_danger("[src] delivers a merciless blow, severing [target]'s head!"),
			span_notice("Blood sprays violently as [target]'s head is sent flying!")
		)

		head.dismember() //I am not yet sure if chains will be able to protect the head from this.
		target.emote("scream")
		src.say(pick(GLOB.custodian_tease))

/mob/living/carbon/human/proc/special_attacks(mob/user, atom/A, params) //Attack for the Foglander Raiders.
	var/mob/living/target = A
	var/crit_roll = rand(1, 2)

	if(target.IsStun() || target.IsKnockdown() || body_position == LYING_DOWN) // Prioritize Execution move if target is stunned or paralyzed
		Execution(target)
		return  // You're very unlucky if NPC Execution happened.

	switch(crit_roll)
		if(1)
			Disarmroll(target) // This attack disarms the enemy and kicks the weapon away.
			return
		if(2)
			KnockbackAttack(target) // This attack pushes the enemy itself away, and can knockdown. Very risky with Execution.
			return

/mob/living/carbon/human/proc/Disarmroll(mob/living/target)
	var/obj/item/W = target.get_active_held_item()
	if(W)
		var/turf/item_target = get_edge_target_turf(src, get_dir(src, get_step_away(target, src)))
		target.dropItemToGround(W)
		if(item_target)
			W.throw_at(item_target, 6, 1) //KICKED AWAY!
		target.visible_message(span_danger("[src] strikes [target]'s arm with an open palm, bruising the tendons!"))
		emote("laugh")
		playsound(get_turf(src),'sound/combat/shieldraise.ogg', 200, TRUE)
	else
		KnockbackAttack(target)


/mob/living/carbon/human/proc/KnockbackAttack(mob/living/target)
	if (!target)
		return

	target.do_attack_animation(src, ATTACK_EFFECT_SMASH)
	target.visible_message(span_danger("[src]'s muscular hand reaches [target]'s throat.")) //I love to make this weird.
	src.say(pick(GLOB.custodian_special))
	src.emote("laugh")

	var/clap_distance = round((src.STASTR - target.STACON) / 2 + rand(-1,4)) //the rand adds randomness to the result.
	var/turf/throwtarget = get_edge_target_turf(src, get_dir(src, get_step_away(target, src)))
	target.throw_at(throwtarget, clap_distance, 2, src)

	if(target.cmode)
		if(clap_distance >= 3) //Knockdown comes only after 3 tiles-of-force.
			target.AdjustKnockdown(1 + rand(2, 3)) // Potentially knocks down
			target.visible_message(span_danger("[src] launches [target] away like a mere claydoll!"))
		else
			target.visible_message(span_danger("[src] pushes [target] away, unable to break their stance."))
	else
		target.AdjustKnockdown(5 + rand(5, 10)) //If the player is not on combat mode, that means they are not ready to act against martial attacks.
		target.visible_message(span_danger("[src] launches [target] away like a mere claydoll!"))

/mob/living/carbon/human/proc/Execution(mob/living/target) //Dude, the player is beyond damned now.
	var/list/limb_list = list(
		BODY_ZONE_L_ARM,
		BODY_ZONE_R_ARM,
		BODY_ZONE_L_LEG,
		BODY_ZONE_R_LEG,
		BODY_ZONE_CHEST
	)
	var/obj/item/bodypart/BP = target.get_bodypart(limb_list) //Choose one single limb to PUNISH.

	target.do_attack_animation(src, ATTACK_EFFECT_KICK)
	target.visible_message(span_danger("[src] looms over [target] and crushes them with their feet!"))
	target.apply_damage(rand(30, 50), BRUTE, BP) // Big oof.
	target.SetSleeping(20) // Just to give a scare. Not really to make the player sleep midbattle.
	playsound(get_turf(src),'sound/combat/shieldbash_wood.ogg', 200, TRUE)
	if(BP)
		BP.add_wound(/datum/wound/fracture)
		BP.update_disabled() // HAHAHAHA. GET CLAPPED MAN

/mob/living/carbon/human/proc/throw_star(mob/living/target)
	if(shuriken_count >= 1 && target && ismob(target))
		var/obj/item/throwing_star/ninja/star = new /obj/item/throwing_star/ninja(get_turf(src))
		shuriken_count--

		src.visible_message(span_danger("[src] swiftly hurls a shuriken at [target]!"))
		star.thrownby = src

		star.safe_throw_at(target, 10, 4, src, 1, 0, null, 35) // Simulate a throw so the players think it was their own fault for not stepping away.

		if(ishuman(target)) // Manually embed on the player. Yeah. You're fated to get embeded no matter what you try. NPCs can't throw things properly.
			var/mob/living/carbon/human/H = target
			if(can_embed(star) && !HAS_TRAIT(H, TRAIT_PIERCEIMMUNE))
				var/obj/item/bodypart/L = pick(H.bodyparts)
				L.add_embedded_object(star, silent = FALSE, crit_message = TRUE)
				H.emote("embed")
				L.receive_damage(star.w_class * star.embedding.embedded_impact_pain_multiplier)
				SEND_SIGNAL(H, COMSIG_ADD_MOOD_EVENT, "embedded", /datum/mood_event/embedded)
				return
