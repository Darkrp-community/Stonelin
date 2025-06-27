/mob/living/simple_animal/hostile/retaliate/cavebear
	icon = 'modular/stonekeep/icons/mobs/bear.dmi'
	name = "cave bear"
	desc = "Feral rage, hunger, these beasts are powerful and fast."
	icon_state = "bear"
	icon_living = "bear"
	icon_dead = "bear-dead"
	pixel_x = -32
	pixel_y = 1

	faction = list("bears")
	move_to_delay = 2
	vision_range = 5
	aggro_vision_range = 5
	footstep_type = FOOTSTEP_MOB_CLAW	// Rogtodo why is it silent?

	botched_butcher_results = list(/obj/item/reagent_containers/food/snacks/meat/steak = 2)
	butcher_results = list(/obj/item/reagent_containers/food/snacks/meat/steak = 4,
						/obj/item/alch/sinew = 2,
						/obj/item/bearpelt = 1)
	perfect_butcher_results = list(/obj/item/reagent_containers/food/snacks/meat/steak = 5,
						/obj/item/alch/sinew = 4,
						/obj/item/bearpelt = 1)

	health = BOGTROLL_HEALTH
	maxHealth = BOGTROLL_HEALTH
	food_type = list(/obj/item/bodypart,
					/obj/item/organ,
					/obj/item/reagent_containers/food/snacks/meat)

	base_intents = list(/datum/intent/simple/trollrip)
	attack_sound = list('modular/stonekeep/sound/vo/mobs/gator/gatorattack1.ogg', 'modular/stonekeep/sound/vo/mobs/gator/gatorattack2.ogg')
	melee_damage_lower = 35
	melee_damage_upper = 42

	base_constitution = 14
	base_strength = 20
	base_speed = 6
	base_endurance = 18

	retreat_distance = 0
	minimum_distance = 0
	deaggroprob = 0
	defprob = 20
	defdrain = 5
	retreat_health = 0.2

	aggressive = TRUE
	stat_attack = UNCONSCIOUS
	body_eater = TRUE

	ai_controller = /datum/ai_controller/mole

/mob/living/simple_animal/hostile/retaliate/cavebear/Initialize()
	. = ..()
	gender = MALE
	if(prob(33))
		gender = FEMALE
	update_icon()

//	AddElement(/datum/element/ai_flee_while_injured, 0.75, retreat_health)
//	ai_controller.set_blackboard_key(BB_BASIC_FOODS, food_type)
	//ADD_TRAIT(src, TRAIT_GENERIC) // to-do


/mob/living/simple_animal/hostile/retaliate/cavebear/taunted(mob/user)
	emote("aggro")
	return

/mob/living/simple_animal/hostile/retaliate/cavebear/get_sound(input)
	switch(input)
		if("aggro")
			return pick('modular/stonekeep/sound/vo/mobs/bear/bear_aggro.ogg')
		if("pain")
			return pick('modular/stonekeep/sound/vo/mobs/bear/bear_idle.ogg')
		if("death")
			return pick('modular/stonekeep/sound/vo/mobs/gator/gatordeath.ogg')
		if("idle")
			return pick('modular/stonekeep/sound/vo/mobs/bear/bear_idle.ogg')


/mob/living/simple_animal/hostile/retaliate/cavebear/simple_limb_hit(zone)
	if(!zone)
		return ""
	switch(zone)
		if(BODY_ZONE_PRECISE_R_EYE)
			return "head"
		if(BODY_ZONE_PRECISE_L_EYE)
			return "head"
		if(BODY_ZONE_PRECISE_NOSE)
			return "snout"
		if(BODY_ZONE_PRECISE_MOUTH)
			return "mouth"
		if(BODY_ZONE_PRECISE_SKULL)
			return "head"
		if(BODY_ZONE_PRECISE_EARS)
			return "head"
		if(BODY_ZONE_PRECISE_NECK)
			return "neck"
		if(BODY_ZONE_PRECISE_L_HAND)
			return "foreleg"
		if(BODY_ZONE_PRECISE_R_HAND)
			return "foreleg"
		if(BODY_ZONE_PRECISE_L_FOOT)
			return "leg"
		if(BODY_ZONE_PRECISE_R_FOOT)
			return "leg"
		if(BODY_ZONE_PRECISE_STOMACH)
			return "stomach"
		if(BODY_ZONE_PRECISE_GROIN)
			return "tail"
		if(BODY_ZONE_HEAD)
			return "head"
		if(BODY_ZONE_R_LEG)
			return "leg"
		if(BODY_ZONE_L_LEG)
			return "leg"
		if(BODY_ZONE_R_ARM)
			return "foreleg"
		if(BODY_ZONE_L_ARM)
			return "foreleg"
	return ..()
