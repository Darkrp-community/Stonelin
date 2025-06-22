/datum/devotion/cleric_holder/proc/grant_spells_sohei(mob/living/carbon/human/H)
	if(!H || !H.mind)
		return

	var/datum/patron/A = H.patron
	var/list/spelllist = list(/obj/effect/proc_holder/spell/invoked/gale_palm, A.t0) //Placeholder. Need to change this for a Sohei-only.
	for(var/spell_type in spelllist)
		if(!spell_type || H.mind.has_spell(spell_type))
			continue
		H.mind.AddSpell(new spell_type)
	level = CLERIC_T0
	max_devotion = 150




// =================================================================
// ========================		STATUS EFFECT	====================

//frozentomb

/datum/status_effect/abyssaltomb //Abyssor-followers should instantly break away from this coffin.
	id = "abyssor_frozen"
	status_type = STATUS_EFFECT_UNIQUE
	duration = -1
	examine_text = "You've been frozen within an abyssal tomb."
	alert_type = /atom/movable/screen/alert/status_effect/frozen
	var/obj/structure/abyssaltomb/tomb
	var/attempts = 0 // special feature that increases difficulty with each failed struggle attempt against the ice coffin. Or that's what I intended for it to be.

/atom/movable/screen/alert/status_effect/frozen
	name = "Abyssal Submission"
	desc = "Imprisoned by frozen tides, beneath the deep blue."
	icon_state = "intomb"
	icon = 'modular/stonekeep/kaizoku/icons/misc/screen_alert.dmi'

// Normal Freeze

/atom/movable/screen/alert/status_effect/debuff/freezing
	name = "Abyssal Frostnip"
	desc = "<span class='boldwarning'>Frost-bitten and touched by the ancient god, seeping through time and existence. The god feels, spreads, and carves your skin.</span>\n"
	icon_state = "freezing"
	icon = 'modular/stonekeep/kaizoku/icons/misc/screen_alert.dmi'

/datum/status_effect/debuff/freezing
	id = "freezing"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/freezing
	duration = 30 SECONDS
	effectedstats = list("speed" = -3, "endurance" = -2)

/datum/status_effect/debuff/freezing/on_apply()
	if(iscarbon(owner))
		var/mob/living/carbon/C = owner
		if(C.has_status_effect("freezingsevere"))
			return
		to_chat(C, "<span class='info'>The frigid spike manifests supernatural cold within me.</span>")
		C.add_atom_colour("#4ad0d4", TEMPORARY_COLOUR_PRIORITY)

/datum/status_effect/debuff/freezing/on_remove()
	if(iscarbon(owner))
		var/mob/living/carbon/C = owner
		C.remove_atom_colour(TEMPORARY_COLOUR_PRIORITY)
		to_chat(C, "<span class='info'>I feel the suffocating cold vanishing, as body warmth returns to me.</span>")

/datum/status_effect/debuff/freezing/tick()
	if(iscarbon(owner))
		var/mob/living/carbon/C = owner
		C.adjustOxyLoss(-6, 0)
		if(prob(50))
			C.adjustFireLoss(2)
			C.Jitter(3)

// Severe Freeze

/atom/movable/screen/alert/status_effect/debuff/freezingsevere
	name = "Abyssal Frostbite"
	desc = "<span class='boldwarning'>It carries his touch, the cold for those who trespassed his domain. Ice crystals carve patterns upon where he gazes, the stare is on you.</span>\n"
	icon_state = "freezing_severe"
	icon = 'modular/stonekeep/kaizoku/icons/misc/screen_alert.dmi'

/datum/status_effect/debuff/freezingsevere
	id = "freezingsevere"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/freezingsevere
	duration = 30 SECONDS
	effectedstats = list("speed" = -5, "endurance" = -4, "strength" = -2)

/datum/status_effect/debuff/freezingsevere/on_apply()
	if(iscarbon(owner))
		var/mob/living/carbon/C = owner
		if(C.has_status_effect("freezingsevere"))
			return
		C.remove_status_effect(/datum/status_effect/debuff/freezing)
		to_chat(C, "<span class='info'>Torturous, carving frost upon my core! It reaches down into my spine in soul-rending agony!</span>")
		C.add_atom_colour("#2f42b3", TEMPORARY_COLOUR_PRIORITY)

/datum/status_effect/debuff/freezingsevere/on_remove()
	if(iscarbon(owner))
		var/mob/living/carbon/C = owner
		to_chat(C, "<span class='info'>The excruciating icy tendrils retreat, leaving behind a bone-chilling cold weighing upon my muscles.</span>")
		C.apply_status_effect(/datum/status_effect/debuff/freezing)

/datum/status_effect/debuff/freezingsevere/tick()
	if(iscarbon(owner))
		var/mob/living/carbon/C = owner
		C.adjustOxyLoss(-6, 0)
		if(prob(50))
			C.adjustFireLoss(4)
			C.Jitter(3)

/datum/status_effect/debuff/shaken
	id = "shaken"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/shaken
	effectedstats = list("perception" = -3, "intelligence" = -2, "speed" = -2)
	duration = 45 SECONDS

/atom/movable/screen/alert/status_effect/debuff/shaken
	name = "shaken"
	desc = "By the divines! What the hell was that?!"
	icon_state = "shaken"
	icon = 'modular/stonekeep/kaizoku/icons/misc/screen_alert.dmi'

/datum/status_effect/debuff/withdrawal
	id = "withdrawal"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/withdrawal
	effectedstats = list("strength" = -2, "constitution" = -3, "endurance" = -3) //Don't use this during battle. You will weaken yourself.
	duration = 6 MINUTES

/atom/movable/screen/alert/status_effect/debuff/withdrawal
	name = "withdrawal"
	desc = "My body needs time to call my Orcish Heritage."
	icon_state = "withdrawal"
	icon = 'modular/stonekeep/kaizoku/icons/misc/screen_alert.dmi'

/datum/status_effect/buff/recovery
	id = "recovery"
	alert_type = /atom/movable/screen/alert/status_effect/buff/recovery
	effectedstats = null
	duration = 45 SECONDS

/atom/movable/screen/alert/status_effect/buff/recovery
	name = "Recovery"
	desc = "My body weakens to recover from foul wounds."
	icon_state = "recovery"
	icon = 'modular/stonekeep/kaizoku/icons/misc/screen_alert.dmi'

/datum/status_effect/buff/recovery/on_apply()
	. = ..()
	var/mob/living/carbon/H = owner
	if(!H)
		return

	START_PROCESSING(SSfastprocess, src)

/datum/status_effect/buff/recovery/process()
	. = ..()
	var/mob/living/carbon/H = owner

	H.blood_volume = min(H.blood_volume + 10, BLOOD_VOLUME_MAXIMUM)
	H.adjustBruteLoss(-0.5)
	H.adjustFireLoss(-0.5)
	H.adjustOxyLoss(-1)
	H.adjustOrganLoss(ORGAN_SLOT_BRAIN, -5)
	H.adjustCloneLoss(-1)
	H.adjustToxLoss(-1)

/datum/status_effect/buff/recovery/on_remove()
	. = ..()
	STOP_PROCESSING(SSfastprocess, src)


// ===================================================================
// ABYSSANCTUM POWERS
// SAME RELIGION, DIFFERENT DOCTRINES
// EACH DOCTRINE IS DIFFERENT ON POWERS, THEMED AFTER NATURAL DISASTERS
// ===================================================================
// GENERAL SPELL - REPLACEMENT FOR LESSER HEAL - TIER 0
// ===================================================================

/obj/effect/proc_holder/spell/invoked/abyssal_heal
	name = "Healing Mist"
	overlay_state = "purification"
	overlay_icon = 'modular/stonekeep/kaizoku/icons/misc/spells.dmi'
	action_icon = 'modular/stonekeep/kaizoku/icons/misc/spells.dmi'
	releasedrain = 30
	chargedrain = 0
	chargetime = 0
	range = 7
	warnie = "sydwarning"
	movement_interrupt = FALSE
	sound = 'sound/magic/heal.ogg'
	invocation_type = "none"
	associated_skill = /datum/skill/magic/holy
	antimagic_allowed = TRUE
	recharge_time = 10 SECONDS
	devotion_cost = 10
	miracle = TRUE
	healing_miracle = TRUE

/obj/effect/proc_holder/spell/invoked/abyssal_heal/cast(list/targets, mob/living/user)
	if(isliving(targets[1]))
		var/mob/living/target = targets[1]
		if(HAS_TRAIT(target, TRAIT_ATHEISM_CURSE))
			target.visible_message(span_danger("[target] recoils in disgust!"), span_userdanger("These fools are trying to cure me with religion!"))
			target.cursed_freak_out()
			return FALSE
		if(target.mob_biotypes & MOB_UNDEAD)
			target.visible_message(span_danger("[target] is lit asunder!"), span_userdanger("I've been lit from an divine source!"))
			target.adjustFireLoss(30)
			target.adjust_divine_fire_stacks(1)
			target.IgniteMob()
			return TRUE

		var/healing = 25
		var/conditional_buff = FALSE
		var/situational_bonus = 15

		target.visible_message(span_info("A mist of salt-scented vapour settles on [target]!"), span_notice("I'm invigorated by healing vapours!"))
		if(istype(get_turf(target), /turf/open/water) || istype(get_turf(user), /turf/open/water))
			conditional_buff = TRUE

		if(conditional_buff)
			to_chat(user, "Channeling my patron's power is easier in these conditions!")
			healing += situational_bonus

		if(iscarbon(target))
			var/mob/living/carbon/C = target
			var/obj/item/bodypart/affecting = C.get_bodypart(check_zone(user.zone_selected))
			if(affecting)
				if(affecting.heal_damage(healing, healing))
					C.update_damage_overlays()
				if(affecting.heal_wounds(healing/4))
					C.update_damage_overlays()
		else
			target.adjustBruteLoss(-healing)
			target.adjustFireLoss(-healing)

		target.adjustToxLoss(-healing)
		target.adjustOxyLoss(-healing)
		return ..()
	return FALSE

// ===================================================================
// TIDEWAVER ESTUARY
// ICE/WATER-BASED SPELLS, FOCUS ON BEING AGGRESSIVE AND DEALING DAMAGE.
// THE BAROTRAUMA BIND IS THE MOST DANGEROUS KIND.
// ===============================================================================================================
// PURIFYING FILTER, PROJECTILE. BAD AGAINST 'NORMALS', WORSE AGAINST 'PURE', EFFICIENT AGAINST IMPURES, TIER 1
// ===============================================================================================================

/obj/effect/proc_holder/spell/invoked/projectile/purify
	name = "Purifying filter"
	overlay_state = "icespike"
	overlay_icon = 'modular/stonekeep/kaizoku/icons/misc/spells.dmi'
	action_icon_state = "spell0"
	action_icon = 'modular/stonekeep/kaizoku/icons/misc/spells.dmi'
	releasedrain = 0
	chargedrain = 0
	chargetime = 0
	devotion_cost = 25
	range = 7
	warnie = "sydwarning"
	movement_interrupt = FALSE
	projectile_type = /obj/projectile/magic/purify
	chargedloop = null
	req_items = list(/obj/item/clothing/neck/psycross/silver/abyssanctum)
	sound = 'sound/magic/magic_nulled.ogg'
	invocation_type = "none"
	miracle = TRUE
	//invocation = "delivers sharp jabs and a sudden clap, unleashing a freezing shockwave that forms and launches a jagged ice spike."

	associated_skill = /datum/skill/magic/holy
	antimagic_allowed = TRUE
	recharge_time  = 10 SECONDS

/obj/projectile/magic/purify
	name = "purification"
	icon_state = "icespikeproj"
	icon = 'modular/stonekeep/kaizoku/icons/misc/spells.dmi'
	paralyze = 50
	damage = 0
	range = 7
	hitsound = 'sound/blank.ogg'
	nondirectional_sprite = TRUE
	impact_effect_type = /obj/effect/temp_visual/icespikeproj_projectile_impact

/obj/effect/temp_visual/icespikeproj_projectile_impact
	name = "purifying spike"
	icon = 'modular/stonekeep/kaizoku/icons/misc/spells.dmi'
	icon_state = "icespikeproj_break"
	layer = ABOVE_ALL_MOB_LAYER
	duration = 3

/obj/projectile/magic/purify/on_hit(atom/target, mob/living/user, blocked = FALSE)
	..()
	var/mob/living/carbon/C = target
	if(iscarbon(target))
		if(C.mob_biotypes & MOB_SPIRIT) // Abyssor's purifying filter absolutely destroys demonic essence.
			C.visible_message("<span class='info'>An otherworldly divine freeze encircles [target], filtering out their very existence!</span>", "<span class='notice'>My breath shallows- my ears rings, my senses overwhelmed with the crushing grip! I'M GOING TO IMPLODE FROM INSIDE OUT! PLEASE MERCY!</span>")
			C.adjustFireLoss(rand(50, 100)) //Random damage between 50 and 100. Very brutal, and proper for killing demons. Cold damage will come together with it after.
			C.Knockdown(40) //Purification successful. You will be paralyzed.
			C.Paralyze(1)
			C.apply_status_effect(/datum/status_effect/buff/rayoffrost5e/)
			C.flash_fullscreen("whiteflash3")
			return
		if((islist(C.faction) && (FACTION_ORCS in C.faction))|| (C.dna.species?.id == "tiefling") ||(HAS_TRAIT(C, TRAIT_NASTY_EATER ))) // Fixed Runtime. // Had to give them these ones because there's a bunch of different goblin IDs. So Trait will have to stay until I care about giving each a respective var.
			C.visible_message("<span class='danger'>[target]'s body is distorced by the crushing force of the abyssal waters!</span>", "<span class='userdanger'>I feel the suffocating pressure of the deep crushing my lungs!</span>")
			C.adjustFireLoss(rand(30, 50)) // 30 to 50 damage, less than full demons. More damage comes from freezing.
			C.Knockdown(20) //Purification successful. You will be paralyzed.
			C.Paralyze(1) // Creatures with demon essence from Apotheosis war gets the second end of the stick.
			C.apply_status_effect(/datum/status_effect/buff/rayoffrost5e/)
			C.flash_fullscreen("whiteflash3")
			return
		if(C.dna.species?.id == "abyssariad"||C.dna.species?.id == "aasimar") //Barely does anything to "Pure" creatures. This proves their 'divinity' and purity ingame.
			C.visible_message("<span class='danger'>[target]'s body shivers slightly, yet remains sturdy.</span>", "<span class='userdanger'>A cold travel down my spine, yet I feel little to no pain.</span>")
			C.adjustBruteLoss(rand(5, 15)) // 10 to 15 damage. Don't even bother attacking these. They will not be frozen either.
			return
		else //Does not paralyze.
			C.visible_message("<span class='danger'>[target]'s body is being crushed!</span>", "<span class='userdanger'>I feel a suffocating pressure building on my body!</span>")
			C.adjustFireLoss(rand(20, 35)) //Normal creatures will still suffer the effects of Barotrauma, yet less in terms of damage. Will still freeze.
			C.apply_status_effect(/datum/status_effect/buff/rayoffrost5e/)
			C.flash_fullscreen("whiteflash3")
			return

// ===================================================================================================================
// GLACIAL HARPOON, TIER 2 IN PURE HURT JUICE. YOU CAN MOVE AWAY, BUT YOU WISH TO NOT GET TRAPPED ON WALLS.
// ADDITIONAL ASSET. IT ALSO DOESN'T CARE ABOUT WALLS. BECAUSE THIS SPELL IS EVIL.
// ===================================================================================================================

/obj/effect/proc_holder/spell/invoked/rake
	name = "glacial tether"
	overlay_state = "rake"
	overlay_icon = 'modular/stonekeep/kaizoku/icons/misc/spells.dmi'
	action_icon_state = "rake"
	action_icon = 'modular/stonekeep/kaizoku/icons/misc/spells.dmi'
	releasedrain = 0
	chargedrain = 0
	recharge_time = 30 SECONDS
	range = 6
	warnie = "icecrack"
	movement_interrupt = TRUE
	invocation_type = "none"
	invocation = "Praise the ocean! Praise the undying abyss! PRAISE ME!!!"
	associated_skill = /datum/skill/magic/holy
	antimagic_allowed = TRUE
	miracle = TRUE

/obj/effect/proc_holder/spell/invoked/rake/cast(list/targets, mob/living/user)
	if(!istype(user, /mob/living))
		return FALSE

	var/mob/living/M = user
	var/turf/start = get_turf(M)
	var/dx = 0
	var/dy = 0

	switch(M.dir)
		if(NORTH) dy = 1
		if(SOUTH) dy = -1
		if(EAST) dx = 1
		if(WEST) dx = -1

	for(var/step in 1 to range)
		spawn(step * 2) // Delay increases for each step
			var/turf/T = locate(start.x + (dx * step), start.y + (dy * step), start.z)
			if(!isturf(T))
				return

			var/obj/structure/ice_spike_wall/I = new /obj/structure/ice_spike_wall(T)
			// Directional sprite selection
			if(dx > 0)
				I.dir = EAST
			else if(dx < 0)
				I.dir = WEST
			else if(dy > 0)
				I.dir = NORTH
			else if(dy < 0)
				I.dir = SOUTH

			for(var/mob/living/L in T.contents)
				if(L != user)
					L.visible_message("<span class='danger'>[L]'s chest has been struck by the jagged ice!</span>")
					if(can_escape_wall(L))
						var/turf/throw_to = get_edge_target_turf(L, get_dir(M, T))
						L.throw_at(throw_to, 2, 1, M)
						L.adjustBruteLoss(rand(10, 20))
						L.blur_eyes(5)
						L.apply_status_effect(/datum/status_effect/debuff/freezing)
					else
						L.visible_message(span_danger("[L] is trapped within the ice!"))
						L.adjustBruteLoss(rand(40, 60))
						L.blur_eyes(10)
						L.apply_status_effect(/datum/status_effect/debuff/freezingsevere)

	return TRUE

/obj/structure/ice_spike_wall
	name = "tether"
	desc = "... The tether that anchor storms, as not all prayers are spoken - many are hurled, tearing through lies as it once did flesh..."
	icon = 'modular/stonekeep/kaizoku/icons/misc/spells.dmi'
	icon_state = "icewall"
	density = TRUE
	opacity = FALSE
	anchored = TRUE
	max_integrity = 80

/obj/structure/ice_spike_wall/Initialize()
	. = ..()
	QDEL_IN(src, 15 SECONDS)

/proc/can_escape_wall(mob/living/L)
	// Check if mob has a free tile nearby to throw into
	for(var/dir in GLOB.cardinals)
		var/turf/T = get_step(L, dir)
		if(T && !T.density)
			return TRUE
	return FALSE

// ===================================================================
// BAROTRAUMA BIND, VERY POWERFUL AND NASTY. TIER 3
// ===================================================================


/obj/effect/proc_holder/spell/invoked/icebind
	name = "Barotrauma Bind" //People faithful to Abyssor will instantly be released from this spell.
	overlay_state = "devilman"
	overlay_icon = 'modular/stonekeep/kaizoku/icons/misc/spells.dmi'
	recharge_time = 2 MINUTES
	devotion_cost = 100
	releasedrain = 30 //required to be of relatively fast-use.
	chargedrain = 0
	chargetime = 50
	range = 8
	warnie = "aimwarn"
	movement_interrupt = FALSE
	sound = 'sound/magic/magic_nulled.ogg'
	action_icon_state = "spell0"
	action_icon = 'modular/stonekeep/kaizoku/icons/misc/spells.dmi'
	invocation_type = "none"
	associated_skill = /datum/skill/magic/holy
	antimagic_allowed = TRUE
	req_items = list(/obj/item/clothing/neck/psycross/silver/abyssanctum)
	miracle = TRUE

/turf/open/proc/apply_ice_turf()
	var/prev_icon_state = icon_state //that code saves the original attributes of the turf to avoid a black void.
	icon_state = "ice"
	density = FALSE
	MakeSlippery(TURF_WET_PERMAFROST, min_wet_time = 100, wet_time_to_add = 5)
	spawn(100)
		if(icon_state == "ice")
			icon_state = prev_icon_state
			density = initial(density)


/obj/effect/proc_holder/spell/invoked/icebind/cast(list/targets, mob/living/user)
	if(!targets.len || !targets[1])
		to_chat(user, span_warning("<span class='userdanger'>Your spell fails to take hold, victimless.</span>"))
		return FALSE
	var/target = targets[1]

	if(isliving(target))
		var/mob/living/target_mob = target
		if(!target_mob.has_status_effect(/datum/status_effect/abyssaltomb))
			target_mob.apply_status_effect(/datum/status_effect/abyssaltomb)
			target_mob.visible_message("<span class='warning'>[target_mob] is sealed within a crystalline abyssal tomb!</span>")
		else
			to_chat(user, span_warning("<span class='userdanger'>Your target is already immobilized within a frigid tomb from the ocean!</span>"))
		return TRUE

	if(isturf(target))
		var/turf/open/T = target
		if(!isclosedturf(T))
			T.apply_ice_turf()
			to_chat(user, "<span class='warning'>Without a target, the ground becomes victim of the abyssal oppression.</span>")
			return TRUE
		else
			to_chat(user, "<span class='warning'>There is no space for a proper icespyre or cold to be settled.</span>")
			return FALSE

	to_chat(user, span_warning("<span class='userdanger'>Your spell fails to take hold, victimless.</span>"))
	return FALSE

/datum/status_effect/abyssaltomb/on_apply()
	tomb = new /obj/structure/abyssaltomb(get_turf(owner)) // Create the ice tomb, THEN move the victim inside
	tomb.encased_mob = owner
	if(istype(owner, /mob/living/carbon/human))
		tomb.buckle_mob(owner, TRUE, check_loc = FALSE)
		if(owner.patron && is_abyssorfaithful(owner.patron))
			to_chat(src, "<span class='debug'>Abyssor follower = no processing..</span>")
			tomb.processing = FALSE
		else
			to_chat(src, "<span class='debug'>Unbased person that don't follow abyssor, start to purify their ass.</span>")
			START_PROCESSING(SSobj, tomb) // Processing for non-Abyssor followers
	owner.forceMove(tomb) // Move the owner inside the tomb
	tomb.max_integrity = 300
	tomb.density = TRUE
	owner.visible_message("<span class='warning'>[owner] is encased in a crystalline tomb of ice.</span>")
	return ..()

/datum/status_effect/abyssaltomb/on_remove()
	if(tomb)
		tomb.unbuckle_all_mobs() //Avoid Qdelling the mob
		qdel(tomb)
	tomb = null
	return ..()

/obj/structure/abyssaltomb
	name = "abyssal tomb"
	desc = "... The anchor of judgment within crystalline walls, the cold that mimics the gravity of guilt for the rewritting of what is sin."
	icon = 'modular/stonekeep/kaizoku/icons/misc/freezesprite.dmi'
	icon_state = "icespyre"
	density = TRUE
	max_integrity = 150
	buckle_lying = 0
	buckle_prevents_pull = 1
	layer = FLY_LAYER
	var/processing = TRUE
	var/last_attack
	var/mob/living/carbon/human/encased_mob

/obj/structure/abyssaltomb/Destroy()
	for(var/atom/movable/M in contents)
		M.forceMove(loc)
	if(encased_mob) // Use the linked mob reference
		encased_mob.remove_status_effect(/datum/status_effect/abyssaltomb)
	playsound(src, 'sound/combat/hits/onglass/glassbreak (2).ogg', 50, TRUE)
	return ..()

/obj/structure/abyssaltomb/process()
	to_chat(src, "<span class='debug'>Abyssal Tomb is processing properly.</span>")
	if(!has_buckled_mobs()) // If there are no mobs buckled, delete the tomb
		to_chat(src, "<span class='debug'>No buckled mobs found, deleting tomb.</span>")
		qdel(src)
		return
	for(var/mob/living/L in buckled_mobs)
		if(!iscarbon(L) || L.buckled != src)
			to_chat(src, "<span class='debug'>Invalid buckled mob detected, skipping.</span>")
			continue
		if(!last_attack) // Time tracking for damaging the buckled person
			last_attack = world.time
		var/barotrauma = 50 // 5 seconds for each
		if(world.time >= last_attack + barotrauma) // Pressure damage after enough time has passed
			last_attack = world.time
			src.visible_message("<span class='danger'>[src]'s crushing pressure squeezes [L] mercilessly!</span>")
			L.flash_fullscreen("whiteflash3")
			L.adjustBruteLoss(rand(10, 30))
			playsound(src, pick('modular/stonekeep/kaizoku/sound/spells/abyssalpressure.ogg','modular/stonekeep/kaizoku/sound/spells/abyssalpressure1.ogg','modular/stonekeep/kaizoku/sound/spells/abyssalpressure2.ogg'), 100, FALSE)
		if(L.stat == DEAD)
			src.visible_message("<span class='danger'>[L]'s squeezed body is now released after death.</span>")
			qdel(src)

/obj/structure/abyssaltomb/user_unbuckle_mob(mob/living/carbon/human/M, mob/living/carbon/human/user)
	if(obj_broken)
		..()
		return

	if(isliving(user))
		var/mob/living/L = user
		var/willpower = CLAMP((L.STAINT * 3 - 20), 1, 99)
		var/barotrauma_roll = rand(1, 100)
		to_chat(user, "<span class='debug'>DEBUG: willpower=[willpower], barotrauma_roll=[barotrauma_roll]; To be released, have more Willpower than Barotrauma</span>")

		if(processing == FALSE)
			to_chat(M, "<span class='info'>[M]'s purified body quickly breaks away from the abyssal tomb.</span>")
			M.remove_status_effect(/datum/status_effect/abyssaltomb)
			qdel(src)
			return

		user.changeNext_move(CLICK_CD_RAPID)
		if(user != M)
			if(barotrauma_roll <= willpower) //Freeing someone else.
				to_chat(user, "<span class='info'>Your body warmth releases [M]'s from the pocket dimension.</span>")
				to_chat(M, "<span class='info'>You feel [user]'s warmth as light comes over to your eyes.</span>")
				M.remove_status_effect(/datum/status_effect/abyssaltomb)
				if(processing == TRUE)
					STOP_PROCESSING(SSobj, src)
				qdel(src)
			else
				to_chat(user, "<span class='danger'>You try to free [M], but you hand ricochets.</span>")
				to_chat(M, "<span class='info'>[user] attempts to free you, but your world spins instead.</span>")
				M.Stun(40)
				shake_camera(M, 15, 1)
			return

		if(barotrauma_roll <= willpower) // Freeing themselves
			to_chat(M, "<span class='info'>You push the pressure towards itself, finally released from its grasp.</span>")
			src.visible_message("<span class='info'>[M] manages to break down the abyssal tomb!</span>")
			M.remove_status_effect(/datum/status_effect/abyssaltomb)
			if(processing == TRUE)
				STOP_PROCESSING(SSobj, src)
			qdel(src)
		else
			to_chat(user, "<span class='warning'>You struggle to break free of the tomb, but remain trapped.</span>")
			user.Stun(40)
			shake_camera(user, 15, 1)

// ===================================================================
// PURIFIER ESTUARY
// WIND-BASED SPELLS, FOCUS ON HAVING MORE UTILITY.
// HIGHER SYNERGY WITH WEAPONS AND UNARMED.
// ===================================================================
// GALEFORCE - THROW PEOPLE AROUND - TIER 1
// ===================================================================

/obj/effect/proc_holder/spell/invoked/gale_palm
	name = "Galeforce"
	overlay_state = "demonslaying"
	overlay_icon = 'modular/stonekeep/kaizoku/icons/misc/spells.dmi'
	action_icon_state = "demonslaying"
	action_icon = 'modular/stonekeep/kaizoku/icons/misc/spells.dmi'
	releasedrain = 30
	chargedrain = 0
	chargetime = 30
	devotion_cost = 25
	range = 8
	recharge_time = 15 SECONDS
	chargedloop = /datum/looping_sound/invokegen
	req_items = list(/obj/item/clothing/neck/psycross/silver/abyssanctum)
	warnie = "sydwarning"
	no_early_release = TRUE
	movement_interrupt = FALSE
	charging_slowdown = 2
	active = FALSE
	invocation = "By Abyssor, the winds shall tear skies asunder!"
	invocation_type = "shout"
	associated_skill = /datum/skill/magic/holy
	antimagic_allowed = TRUE
	devotion_cost = 20
	miracle = TRUE

/obj/effect/proc_holder/spell/invoked/gale_palm/cast(list/targets, mob/living/user)
	if(!user || !targets.len)
		to_chat(user, span_warning("You must target someone first."))
		return FALSE

	var/turf/T = istype(targets[1], /turf) ? targets[1] : get_turf(targets[1])
	if(!isturf(T))
		to_chat(user, span_warning("Yeah, that one is not a valid tile."))
		return FALSE

	for(var/mob/living/target in T.contents)
		if(target == user)
			continue

		var/turf/start = get_turf(user)
		var/turf/end = get_turf(target)
		if(!start || !end)
			continue

		// Animate gust traveling tile-by-tile
		var/turf/current = start
		spawn()
			while(current != end)
				var/obj/effect/windgust/gust = new(current)
				gust.layer = ABOVE_MOB_LAYER
				QDEL_IN(gust, 2)
				current = get_step_towards(current, end)
				sleep(1)

		var/special = FALSE
		if(istype(target, /mob/living))
			var/mob/living/carbon/human/H = target
			if((islist(H.faction) && (FACTION_ORCS in H.faction)) || (H.mob_biotypes & MOB_UNDEAD))
				special = TRUE

		target.visible_message(span_danger("[target] is struck by the forceful wind!"))

		if(!special)
			var/obj/item/W = target.get_active_held_item()
			if(W)
				var/turf/item_target = get_edge_target_turf(user, get_dir(user, get_step_away(target, user)))
				target.dropItemToGround(W)
				if(item_target)
					W.throw_at(item_target, 6, 1)
				target.visible_message(span_danger("[W] is ripped from [target]'s hand by the wind!"))

		var/distance = rand(2, 4)
		var/turf/throw_to = get_edge_target_turf(user, get_dir(user, get_step_away(target, user)))
		if(throw_to)
			target.throw_at(throw_to, distance, 2, user)

		if(target.cmode)
			if(prob(40))
				target.AdjustKnockdown(rand(1, 2))
				target.visible_message(span_warning("The wind forces [target] to stumble."))
		else
			target.AdjustKnockdown(rand(5, 8))
			target.visible_message(span_danger("[target] is knocked flat!"))

	return TRUE

/obj/effect/windgust
	name = ""
	desc = ""
	icon = 'modular/stonekeep/kaizoku/icons/misc/spells.dmi'
	icon_state = "winds"
	anchored = TRUE
	mouse_opacity = 0
	layer = ABOVE_MOB_LAYER
	blend_mode = BLEND_DEFAULT
	pixel_x = 0
	pixel_y = 0

/obj/effect/windgust/Initialize()
	. = ..()
	animate(src, alpha = 0, time = 5) // simple fade out
	QDEL_IN(src, 6)
// ====================================================================================================
// HEAVENLY PILLAR - RAISE PEOPLE FOR FUN, MIGHT MAKE THEM FALL. CAN HELP IN INVADING PLACES - TIER 2
// ====================================================================================================

/obj/effect/proc_holder/spell/invoked/heavens_pillar
	name = "Heavenly Pillar"
	overlay_state = "swirly"
	overlay_icon = 'modular/stonekeep/kaizoku/icons/misc/spells.dmi'
	action_icon_state = "swirly"
	action_icon = 'modular/stonekeep/kaizoku/icons/misc/spells.dmi'
	releasedrain = 30
	chargedrain = 0
	chargetime = 40
	devotion_cost = 45
	recharge_time = 30 SECONDS
	range = 8
	warnie = "aimwarn"
	movement_interrupt = TRUE
	no_early_release = TRUE
	charging_slowdown = 2
	associated_skill = /datum/skill/magic/holy
	invocation_type = "none"
	antimagic_allowed = TRUE
	miracle = TRUE

/obj/effect/proc_holder/spell/invoked/heavens_pillar/cast(list/targets, mob/living/user = usr)
	if(!istype(user, /mob/living))
		return FALSE

	if(!targets.len)
		to_chat(user, span_warning("This spell requires a solid ground or a target to anchor itself."))
		return FALSE

	var/turf/T
	var/mob/living/target_mob

	if(isturf(targets[1]))
		T = targets[1]
	else if(ismob(targets[1]))
		target_mob = targets[1]
		T = get_turf(target_mob)

	if(!T || isclosedturf(T))
		to_chat(user, span_warning("This spell requires open, stable ground."))
		return FALSE

	var/turf/above = get_step_multiz(T, UP)
	var/turf/ceiling = above ? get_step_multiz(above, UP) : null

	// Show warning effect
	var/obj/effect/tempwarning = new /obj/effect/overlay(T)
	tempwarning.name = "rising wind"
	tempwarning.icon = 'modular/stonekeep/kaizoku/icons/misc/spells.dmi'
	tempwarning.icon_state = "swirly"
	tempwarning.layer = EFFECTS_LAYER
	tempwarning.anchored = TRUE
	tempwarning.pixel_y = 0
	QDEL_IN(tempwarning, 10) // 1 second

	// Delay the real effect by 1 second
	spawn(10)
		if(!T || QDELETED(T))
			return

		var/obj/structure/heavenpillar/P = new /obj/structure/heavenpillar(T)
		P.name = "Heaven’s Pillar"

		var/turf/open/floor/above_tile
		if(above && istype(above, /turf/open/transparent/openspace))
			above_tile = new /turf/open/floor/eyeofstorm(above)
			above_tile.name = "eye of the storm"
			above_tile.desc = "The fierce winds keep you in place, somehow. But its force weakens."
			above_tile.icon = 'modular/stonekeep/kaizoku/icons/misc/spells.dmi'
			above_tile.icon_state = "eye"
			above_tile.overlays += image('modular/stonekeep/kaizoku/icons/misc/spells.dmi', "eye")

			spawn(150)
				if(above_tile && above_tile.loc)
					above_tile.ChangeTurf(/turf/open/transparent/openspace)

		for(var/mob/living/M in T.contents)
			if(ceiling && !istransparentturf(ceiling))
				M.visible_message(span_danger("[M] is slammed into the ceiling as the heavenly pillar erupts beneath them!"))
				M.adjustBruteLoss(rand(20, 35))
				M.throw_at(get_step_away(M, T), 2, 1)
			else if(above)
				M.visible_message(span_notice("[M] is caught and raised upwards!"))
				M.forceMove(above)
				M.Stun(20)

		QDEL_IN(P, 150)

	to_chat(user, span_info("You channel winds to rise like solid stone..."))
	return TRUE

/obj/structure/heavenpillar
	name = "abyssal whirly"
	desc = "The heavens crumble, skies held by one truth. It rises in pride, but under this sacred weight, no one touches the legitimate crown.."
	icon = 'modular/stonekeep/kaizoku/icons/misc/spells.dmi'
	icon_state = "whirl" //I didn't had the patience to animate this. So the animation itself is essentially a placeholder.
	density = TRUE
	anchored = TRUE
	max_integrity = 300
	appearance_flags = NO_CLIENT_COLOR

/turf/open/floor/eyeofstorm
	icon_state = "eye"
	footstep = FOOTSTEP_STONE
	barefootstep = FOOTSTEP_HARD_BAREFOOT
	clawfootstep = FOOTSTEP_HARD_CLAW
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	landsound = 'sound/foley/jumpland/stoneland.wav'
	damage_deflection = 10
	max_integrity = 2800

// ====================================================================================================
// The Maelstrom, VERY dangerous bastard. You better cast that one and RUN the HELL away. - TIER 3
// ====================================================================================================

/obj/effect/proc_holder/spell/invoked/maelstrom
	name = "The Maelstrom"
	overlay_state = "waterspirit"
	overlay_icon = 'modular/stonekeep/kaizoku/icons/misc/spells.dmi'
	action_icon_state = "waterspirit"
	action_icon = 'modular/stonekeep/kaizoku/icons/misc/spells.dmi'
	recharge_time = 2 MINUTES
	devotion_cost = 100
	releasedrain = 40
	chargedrain = 0
	chargetime = 50
	range = 6
	warnie = "windwarning"
	movement_interrupt = TRUE
	charging_slowdown = 3
	invocation_type = "shout"
	invocation = "THE WINDS OF JUGDMENT DEVOURS THE WICKED!!!"
	associated_skill = /datum/skill/magic/holy
	miracle = TRUE

/obj/effect/proc_holder/spell/invoked/maelstrom/cast(list/targets, mob/living/user)
	if(!targets.len || !isturf(targets[1]))
		to_chat(user, span_warning("You get the feeling you should choose a location first."))
		return FALSE

	var/turf/center = targets[1]
	var/obj/structure/maelstrom_warning/GhostMaelstrom = new(center) //First, create a warning stage.
	GhostMaelstrom.caster = user

	spawn(40) // After four seconds, the warning stage will end.
		if(GhostMaelstrom)
			var/turf/T = GhostMaelstrom.loc
			qdel(GhostMaelstrom)
			var/obj/structure/maelstrom/Cyclone = new(T)
			Cyclone.caster = user
			to_chat(user, span_info("You summon a raging abyssal maelstrom!"))
	return TRUE

/obj/structure/maelstrom
	name = "Abyssal Maelstrom"
	desc = "... it churns, they said, pulled into the depths under the winds of the Maelstrom. They emerged whole and pure, their corruption gone, one god to another, no more blood fiends .."
	icon = 'modular/stonekeep/kaizoku/icons/misc/spells.dmi'
	icon_state = "whirl"
	density = FALSE
	anchored = TRUE
	max_integrity = 500
	var/mob/living/caster
	var/duration = 80 // 8 seconds
	var/list/affected_mobs = list() // You got knocked down when you got in? This will give you a chance to leave the whirlwind.

/obj/structure/maelstrom/Initialize()
	. = ..()
	spawn(1)
		while(duration-- > 0)
			apply_maelstrom_effect()
			sleep(5)
		qdel(src)

/obj/structure/maelstrom/proc/apply_maelstrom_effect()
	var/turf/center = get_turf(src)
	for(var/mob/living/M in view(5, center))
		if(M.z != center.z || !M.loc) continue

		var/dx = center.x - M.x
		var/dy = center.y - M.y
		var/distance = max(abs(dx), abs(dy))

		// Stronger pull: move toward center
		if(distance > 0)
			var/step_amount = (distance >= 4) ? 2 : 1
			for(var/i in 1 to step_amount)
				step_towards(M, center)

		// Damage logic
		if(M.loc == center)
			if(!(M in affected_mobs))
				M.adjustBruteLoss(rand(5, 8))
				M.Knockdown(5)
				M.visible_message(span_danger("[M] is battered by the core of the maelstrom and knocked off balance!"))
				affected_mobs |= M
			else
				M.adjustBruteLoss(rand(2, 5))
		else if(get_dist(M, center) <= 1)
			M.adjustBruteLoss(rand(1, 3))

/obj/structure/maelstrom_warning
	name = "Condensing Winds"
	desc = "... All that scatter must return as winds does not spiral in wonder. The enkindled will be stripped of impurity, the soul beyond matter.."
	icon = 'modular/stonekeep/kaizoku/icons/misc/spells.dmi'
	icon_state = "whirl"
	density = FALSE
	anchored = TRUE
	alpha = 100 // transparent look
	layer = ABOVE_MOB_LAYER + 1
	var/mob/living/caster

// ===================================================================
// CURATOR ESTUARY
// LIGHTENING-BASED SPELLS, FOCUS ON SUPPORTIVE BUT NOT HEALING.
// CAN PRACTICE REVIVALS, DOES NOT DEAL DAMAGE ON THE UNDEAD.
// ===================================================================
// SURGING BOLT - ATTACK SPELL, TIER 1. YOU'RE LIKELY TO SPARK YOURSELF.
// ===================================================================
/obj/effect/proc_holder/spell/invoked/surging_bolt
	name = "Lightening chain"
	overlay_state = "chain"
	overlay_icon = 'modular/stonekeep/kaizoku/icons/misc/spells.dmi'
	action_icon_state = "chain"
	action_icon = 'modular/stonekeep/kaizoku/icons/misc/spells.dmi'
	releasedrain = 30
	chargedrain = 0
	chargetime = 0
	devotion_cost = 25
	range = 8
	recharge_time = 20 SECONDS
	chargedloop = /datum/looping_sound/invokegen
	req_items = list(/obj/item/clothing/neck/psycross/silver/abyssanctum)
	warnie = "sydwarning"
	no_early_release = TRUE
	movement_interrupt = FALSE
	charging_slowdown = 2
	active = FALSE
	invocation = "By Abyssor, the winds shall tear skies asunder!"
	invocation_type = "shout"
	associated_skill = /datum/skill/magic/holy
	antimagic_allowed = TRUE
	miracle = TRUE

/obj/effect/proc_holder/spell/invoked/surging_bolt/cast(list/targets, mob/living/user)
	if(!targets.len)
		to_chat(user, span_warning("No valid target for the bolt."))
		return FALSE
	var/turf/T = istype(targets[1], /turf) ? targets[1] : get_turf(targets[1])
	var/mob/living/primary
	for(var/mob/living/M in view(1, T))
		primary = M
		break
	if(!primary)
		to_chat(user, span_warning("No enemy nearby for the bolt!"))
		return FALSE
	chain_lightning(user, primary, 2)
	to_chat(user, span_info("A surge of abyssal lightning leaps forward!"))
	return TRUE

/obj/effect/proc_holder/spell/invoked/surging_bolt/proc/chain_lightning(mob/living/true_caster, mob/living/first_target, max_jumps = 2)
	var/list/affected = list()
	var/mob/living/current = first_target
	for(var/i = 1 to max_jumps+1)
		if(!current || !isliving(current))
			break
		affected += current
		current.visible_message(span_danger("[current] is struck by surging lightning!"))
		current.adjustFireLoss(rand(15, 30))
		current.Knockdown(10)

		var/turf/start_turf = get_turf(true_caster)
		var/turf/end_turf = get_turf(current)
		if(start_turf && end_turf)
			create_lightning_arc(start_turf, end_turf)

		playsound(end_turf, 'sound/magic/lightning.ogg', 80, TRUE)
		var/mob/living/next
		var/lowest_dist = 999
		for(var/mob/living/N in view(4, current))
			if(N == true_caster || (N in affected))
				continue
			var/d = get_dist(current, N)
			if(d < lowest_dist)
				lowest_dist = d
				next = N
		true_caster = current
		current = next

	if(!current)
		if(first_target == true_caster)
			true_caster.visible_message(span_warning("[true_caster] is caught in their own lightning surge!")) //HAHAHA DUMBASS
			true_caster.adjustFireLoss(rand(10, 20))
			create_lightning_arc(get_turf(true_caster), get_turf(true_caster))

/obj/effect/proc_holder/spell/invoked/surging_bolt/proc/create_lightning_arc(turf/start, turf/end)
	if(!start || !end)
		return

	var/dx = end.x - start.x
	var/dy = end.y - start.y
	var/distance = max(abs(dx), abs(dy))
	var/steps = max(1, distance)

	for(var/i = 1 to steps)
		var/step_x = start.x + round((dx * i) / steps)
		var/step_y = start.y + round((dy * i) / steps)
		var/turf/T = locate(step_x, step_y, start.z)
		if(T)
			var/obj/effect/temp_visual/lightning/L = new(T)
			L.icon = 'icons/obj/projectiles_tracer.dmi'
			L.icon_state = "stun"
			L.layer = FLY_LAYER
			L.plane = GAME_PLANE_UPPER
			L.duration = 7

			// Rotate properly
			var/angle = arctan(dy, dx)
			L.transform = matrix(angle, MATRIX_ROTATE)

// ====================================================================================================
// VEIL OF THUNDER, A SUPPORT SPELL. TIER 2
// ====================================================================================================

/mob/living
	var/datum/lightning_shield/shield_status //This is necessary for tracking, because qdels suck balls.

/obj/effect/proc_holder/spell/invoked/warkraft
	name = "veil of spirits"
	overlay_state = "waternet"
	overlay_icon = 'modular/stonekeep/kaizoku/icons/misc/spells.dmi'
	action_icon_state = "waternet"
	action_icon = 'modular/stonekeep/kaizoku/icons/misc/spells.dmi'
	releasedrain = 30
	chargedrain = 0
	chargetime = 0
	devotion_cost = 45
	recharge_time = 30 SECONDS
	invocation = "Storm, earth, and water, heed my call!" //Yes. That's a reference.
	chargedloop = /datum/looping_sound/invokegen
	req_items = list(/obj/item/clothing/neck/psycross/silver/abyssanctum)
	warnie = "sydwarning"
	no_early_release = TRUE
	movement_interrupt = FALSE
	charging_slowdown = 2
	active = FALSE
	invocation = "The spirits are relentless. Your time has come!"
	invocation_type = "shout"
	associated_skill = /datum/skill/magic/holy
	antimagic_allowed = FALSE
	miracle = TRUE

/obj/effect/proc_holder/spell/invoked/warkraft/cast(list/targets, mob/living/user)
	if(!targets.len || !isliving(targets[1]))
		to_chat(user, span_warning("You have the feeling you need to choose a person for this spell."))
		return FALSE

	var/mob/living/target = targets[1]

	if(target.shield_status)
		qdel(target.shield_status)

	var/datum/lightning_shield/L = new
	L.activate(target)
	target.shield_status = L

	to_chat(user, span_info("Spheres of power envelops [target] in a spinning motion."))
	return TRUE

/datum/lightning_shield
	var/mob/living/owner
	var/overlay
	var/intensity = 15
	var/duration = 120 // 12 seconds

/datum/lightning_shield/proc/activate(mob/living/M)
	owner = M
	if(!owner)
		return
	if(!overlay)
		overlay = mutable_appearance('modular/stonekeep/kaizoku/icons/misc/spells.dmi', "littleangels")
	owner.overlays += overlay
	owner.shield_status = src
	spawn(duration)
		if(owner == M && owner.shield_status == src)
			src.deactivate()

/datum/lightning_shield/proc/deactivate()
	if(owner)
		owner.overlays -= overlay
		if(owner.shield_status == src)
			owner.shield_status = null
	qdel(src)

/datum/lightning_shield/proc/on_attacked_by_weapon(mob/living/attacker)
	if(!attacker || !isliving(attacker)) return
	attacker.visible_message(span_danger("[attacker] is shocked by abyssal lightning!"))
	attacker.adjustFireLoss(intensity)
	attacker.Paralyze(10)
	attacker.Jitter(20)
	attacker.electrocute_act(1)
	playsound(get_turf(attacker), 'sound/magic/lightning.ogg', 70, TRUE)
	new /obj/effect/temp_visual/lightning(get_turf(attacker))

/mob/living/attackby(obj/item/I, mob/living/user, params)
	if(shield_status)
		shield_status.on_attacked_by_weapon(user)
	..()
	return

/obj/effect/temp_visual/lightning
	icon = 'icons/effects/effects.dmi'
	icon_state = "shield"
	duration = 10
	light_outer_range = 2
	layer = FLY_LAYER
	randomdir = FALSE

// ===================================================================
// HEARTBRINGER - REVIVAL SPELL, TIER 3
// ===================================================================

/obj/effect/proc_holder/spell/invoked/revival_spark
	name = "Heartbringer"
	overlay_state = "graydream"
	overlay_icon = 'modular/stonekeep/kaizoku/icons/misc/spells.dmi'
	action_icon_state = "graydream"
	action_icon = 'modular/stonekeep/kaizoku/icons/misc/spells.dmi'
	recharge_time = 2 MINUTES
	devotion_cost = 100
	releasedrain = 90
	chargedrain = 0
	chargetime = 50
	range = 5
	warnie = "windwarning"
	charging_slowdown = 2
	movement_interrupt = TRUE
	invocation_type = "shout"
	invocation = "Abyssor, I plea- Take away this soul from the dark one!"
	associated_skill = /datum/skill/magic/holy
	antimagic_allowed = TRUE
	miracle = TRUE

/obj/effect/proc_holder/spell/invoked/revival_spark/cast(list/targets, mob/living/user)
	if(!targets.len || !isliving(targets[1]))
		to_chat(user, span_warning("This is not a fallen soul."))
		return FALSE

	var/mob/living/target = targets[1]

	if(target.stat != DEAD)
		to_chat(user, span_warning("[target] requires to be dead to perform this manifestation of Abyssor's will"))
		return FALSE

	var/turf/T = get_turf(user)
	if(!istype(T, /turf/open/water))
		to_chat(user, span_warning("One must draw the forces from Abyssor by standing on water"))
		return FALSE

	if(HAS_TRAIT(target, TRAIT_NECRA_CURSE))
		to_chat(user, span_warning("That soul has been touched by a polytheistic dark goddess"))
		return FALSE

	playsound(T, 'sound/weather/rain/thunder_1.ogg', 80, TRUE)
	T.visible_message(span_boldwarning("Water boils around [user], crackling in essence beyond matter"))

	spawn(20) // Small delay for the lightening.
		create_blue_lightning_storm(target)

	spawn(70) // After 5 seconds total, revive
		perform_actual_revival(user, target)

	return TRUE

/proc/create_blue_lightning_storm(mob/living/target)
	var/turf/T = get_turf(target)
	if(!T)
		return

	for(var/turf/adjacent in spiral_range_turfs(2, T))
		if(!isturf(adjacent))
			continue

		var/obj/effect/temp_visual/lightning_blue/L = new(adjacent)
		L.icon = 'icons/effects/32x96.dmi'
		L.icon_state = "lightning"
		L.color = "#4ad0d4"
		L.light_color = "#4ad0d4"
		L.duration = 12

		spawn(L.duration)
			L.heal_surroundings()

/obj/effect/temp_visual/lightning_blue
	icon = 'icons/effects/32x96.dmi'
	icon_state = "lightning"
	layer = FLY_LAYER
	plane = GAME_PLANE_UPPER
	randomdir = FALSE
	duration = 12

/obj/effect/temp_visual/lightning_blue/proc/heal_surroundings()
	if(!src || !loc)
		return

	var/turf/T = get_turf(src)
	playsound(T, 'sound/magic/lightning.ogg', 70, TRUE)

	for(var/mob/living/M in T.contents)
		M.electrocute_act(1, src) // Essentially harmless. Just for the visual effect.
		M.adjustOxyLoss(-50)
		M.adjustBruteLoss(-10)
		M.adjustFireLoss(-10)
		M.adjustCloneLoss(-25)
		to_chat(M, span_userdanger("It mends... your flesh..."))

/proc/perform_actual_revival(mob/living/user, mob/living/target)
	if(!target || !isliving(target))
		return

	if(target.stat == DEAD && target.can_be_revived())
		var/mob/living/carbon/spirit/underworld_spirit = target.get_spirit()
		if(underworld_spirit)
			var/mob/dead/observer/ghost = underworld_spirit.ghostize()
			qdel(underworld_spirit)
			ghost.mind.transfer_to(target, TRUE)
		target.grab_ghost(force = TRUE)

	if(!target.revive(full_heal = FALSE))
		to_chat(user, span_warning("The abyssal surge fails to bring [target] back!"))
		return

	target.visible_message(span_info("[target]'s body spasms violently as life returns!"), span_notice("A searing jolt breathes me back into the world!"))
	target.adjustOxyLoss(-100)
	target.adjustFireLoss(-50)
	target.adjustBruteLoss(-50)
	target.adjustCloneLoss(-50)
	target.Jitter(100)
	target.emote("gasp")
	target.apply_status_effect(/datum/status_effect/debuff/revive)

/proc/is_abyssorfaithful(datum/patron/P)
	var/list/valid = list(
		/datum/patron/divine/abyssor,
		/datum/patron/abyssanctum/tideweaver,
		/datum/patron/abyssanctum/curator,
		/datum/patron/abyssanctum/purifier
	)
	for(var/type in valid)
		if(istype(P, type))
			return TRUE
	return FALSE
