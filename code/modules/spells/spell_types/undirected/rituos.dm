/datum/action/cooldown/spell/undirected/rituos
	name = "Rituos"
	desc = "Draw upon the Lesser Work of She Who Is Z, and expunge the trappings of mortal flesh from your form in exchange for power unimaginable. Be warned: indulging in even the first step of this ritual will make you more deadite than not..."
	button_icon_state = "createlight"
	sound = 'sound/magic/timestop.ogg'

	spell_type = SPELL_MIRACLE
	antimagic_flags = MAGIC_RESISTANCE_HOLY
	associated_skill = /datum/skill/magic/holy
	invocation_type = INVOCATION_NONE

	charge_required = TRUE
	charge_time = 10 SECONDS
	cooldown_time = 3 HOURS
	spell_cost = 120

	attunements = list(
		/datum/attunement/death = 0.5
	)

	var/list/excluded_bodyparts = list(/obj/item/bodypart/head)
	var/datum/action/cooldown/spell/heldspell

/datum/action/cooldown/spell/undirected/rituos/Destroy(force, ...)
	heldspell = null // Deleted with us
	return ..()

/datum/action/cooldown/spell/undirected/rituos/proc/check_ritual_progress(mob/living/carbon/user)
	var/rituos_complete = TRUE
	for(var/obj/item/bodypart/our_limb in user.bodyparts)
		if(our_limb.type in excluded_bodyparts)
			continue
		if(!our_limb.skeletonized)
			rituos_complete = FALSE
	return rituos_complete

/datum/action/cooldown/spell/undirected/rituos/proc/get_skeletonized_bodyparts(mob/living/carbon/user)
	var/skeletonized_parts = list()
	for(var/obj/item/bodypart/our_limb in user.bodyparts)
		if(our_limb.type in excluded_bodyparts)
			continue
		if(our_limb.skeletonized)
			skeletonized_parts += our_limb.type

	return skeletonized_parts

/datum/action/cooldown/spell/undirected/rituos/proc/get_spell_choices() //Why, why do i have to do this for it to work, can someone explain
	var/list/spell_choices = subtypesof(/datum/action/cooldown/spell)
	return spell_choices

/datum/action/cooldown/spell/undirected/rituos/cast(mob/living/carbon/cast_on)
	. = ..()
	var/pre_rituos = check_ritual_progress(cast_on)
	if(pre_rituos)
		to_chat(cast_on, span_notice("I have completed Her Lesser Work. Only lichdom awaits me now, but just out of reach..."))
		return

	//hoo boy. here we go.
	var/list/possible_parts = list()
	for(var/obj/item/bodypart/BP in cast_on.bodyparts)
		possible_parts += BP
	var/list/skeletonized_parts = get_skeletonized_bodyparts(cast_on)

	for(var/obj/item/bodypart/BP in possible_parts)
		for(var/bodypart_type in excluded_bodyparts)
			if(istype(BP, bodypart_type))
				possible_parts -= BP
				break
		for(var/skeleton_part in skeletonized_parts)
			if(istype(BP, skeleton_part))
				possible_parts -= BP
				break

	var/obj/item/bodypart/the_part = pick(possible_parts)
	var/obj/item/bodypart/part_to_bonify = cast_on.get_bodypart(the_part.body_zone)
	RegisterSignal(cast_on, COMSIG_LIVING_DREAM_END, PROC_REF(on_dream_end))

	var/list/spell_choices = get_spell_choices()
	var/list/choices = list()
	for(var/spell_type in spell_choices)
		var/datum/action/cooldown/spell/spell_item = spell_type
		if(!(spell_item.spell_flags & SPELL_RITUOS))
			continue
		choices[initial(spell_item.name)] = spell_item
	choices = sortList(choices)

	var/choice = input("Choose an arcyne expression of the Lesser Work") as null|anything in choices
	var/spell_type = choices[choice]

	if(!choice || !spell_type)
		return FALSE

	if(!(cast_on.mob_biotypes & MOB_UNDEAD))
		cast_on.visible_message(span_warning("The pallor of the grave descends across [cast_on]'s skin in a wave of arcyne energy..."), span_boldwarning("A deathly chill overtakes my body at my first culmination of the Lesser Work! I feel my heart slow down in my chest..."))
		cast_on.mob_biotypes |= MOB_UNDEAD
		cast_on.mana_pool.intrinsic_recharge_sources &= ~MANA_ALL_LEYLINES
		cast_on.mana_pool.set_intrinsic_recharge(MANA_SOULS)
		cast_on.add_spell(/datum/action/cooldown/spell/undirected/arcyne_eye, source = src)
		to_chat(cast_on, span_smallred("I have forsaken the living. I am now closer to a deadite than a mortal... but I still yet draw breath and bleed."))

	part_to_bonify.skeletonize(FALSE)
	cast_on.regenerate_icons()
	cast_on.visible_message(span_warning("Faint runes flare beneath [cast_on]'s skin before their flesh suddenly slides away from their [part_to_bonify.name]!"), span_notice("I feel arcyne power surge throughout my frail mortal form, as the Rituos takes its terrible price from my [part_to_bonify.name]."))
	heldspell = spell_type

	var/post_rituos = check_ritual_progress(cast_on)
	if(post_rituos)
		//everything but our head is skeletonized now, so grant them journeyman rank and 3 extra spellpoints to grief people with
		cast_on.adjust_skillrank(/datum/skill/magic/arcane, 3, TRUE)
		cast_on.add_spell(/datum/action/cooldown/spell/undirected/touch/prestidigitation, source = src)
		cast_on.adjust_spellpoints(18)
		cast_on.visible_message(span_boldwarning("[cast_on]'s form swells with terrible power as they cast away almost all of the remnants of their mortal flesh, arcyne runes glowing upon their exposed bones..."), span_notice("I HAVE DONE IT! I HAVE COMPLETED HER LESSER WORK! I stand at the cusp of unspeakable power, but something is yet missing..."))
		ADD_TRAIT(cast_on, TRAIT_NOHUNGER, "[type]")
		ADD_TRAIT(cast_on, TRAIT_NOBREATH, "[type]")
		UnregisterSignal(cast_on, COMSIG_LIVING_DREAM_END)
		if(prob(33))
			to_chat(cast_on, span_danger("...what have I done?"))
		cast_on.remove_spell(/datum/action/cooldown/spell/undirected/rituos) //I assume it'll work?
		return
	else
		to_chat(cast_on, span_notice("The Lesser Work of Rituos floods my mind with stolen arcyne knowledge: I can now cast it until I next rest..."))
		cast_on.add_spell(heldspell, FALSE, src)
		return

/datum/action/cooldown/spell/undirected/rituos/proc/on_dream_end(mob/living/carbon/user)
	SIGNAL_HANDLER
	if(heldspell)
		to_chat(user, span_warning("My glimpse of [heldspell.name] fades as I awaken..."))
		user.remove_spells(source = src)
		heldspell = null
	to_chat(user, span_smallnotice("The toil of invoking Her Lesser Work slips away. I may begin anew…"))
	reset_spell_cooldown()
	UnregisterSignal(user, COMSIG_LIVING_DREAM_END)
