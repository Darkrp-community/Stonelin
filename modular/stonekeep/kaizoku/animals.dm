


/*	Don´t uncomment unless theres actual content/hooks into the cooking so you got meals etc to make with it. If not its just useless bloat.
/obj/item/neuFarm/seed/rice
	seed_identity = "rice seeds"
	plant_def_type = /datum/plant_def/rice

/datum/plant_def/rice
	name = "weeperstears patch"
	icon_state = "rice"
	produce_type = /obj/item/reagent_containers/food/snacks/produce/rice
	produce_amount_min = 4
	produce_amount_max = 6
	maturation_nutrition = 15
	maturation_time = 5 MINUTES
	water_drain_rate = 2 / (1 MINUTES)

/obj/item/reagent_containers/food/snacks/produce/rice
	seed = /obj/item/neuFarm/seed/rice
	name = "weeperstears"
	desc = "Weeperstears, or 'Rice', is the abyssariad's staple food. It is believed that the plants came from the tears of Weeping God."
	icon_state = "rice"
	icon = 'modular/stonekeep/kaizoku/icons/items/produce.dmi'
	gender = PLURAL
	filling_color = "#e0baa0"
	bitesize_mod = 2
	foodtype = GRAIN
	tastes = list("slightly nutty" = 1)
	can_distill = TRUE
	distill_reagent = /datum/reagent/consumable/ethanol/sake
	distill_amt = 24
	grind_results = list(/datum/reagent/floure = 10) //rice flour
	dropshrink = 0.9
	mill_result = /obj/item/reagent_containers/powder/flour
/obj/item/reagent_containers/food/snacks/produce/rice/examine(mob/user)
	var/farminglvl = user.mind?.get_skill_level(/datum/skill/labor/farming)
	. += ..()
	if(farminglvl >= 0)
		. += "I can easily tell that these are weeperstears grains."

*/


/obj/item/reagent_containers/food/snacks/fogdart
	name = "fogdart frog"
	desc = "the Abyssariad tree frog capable of living in a variety of habitats on Fog Islands, but is more well know for their sleep-inducing glands. It has enough for five projectiles."
	icon_state = "fogfrog"
	icon = 'modular/stonekeep/kaizoku/icons/mobs/fogfrog.dmi'
	list_reagents = list(/datum/reagent/consumable/nutriment = 5, /datum/reagent/fogblight = 25)
	verb_say = "croaks"
	verb_yell = "croaks"
	foodtype = RAW
	obj_flags = CAN_BE_HIT
	var/dead = FALSE
	eat_effect = /datum/status_effect/debuff/uncookedfood
	max_integrity = 10
	sellprice = 0
	rotprocess = null

/obj/item/reagent_containers/food/snacks/fogdart/onbite(mob/living/carbon/human/user)
	if(loc == user)
		if(user.mind && user.mind.has_antag_datum(/datum/antagonist/vampire))
			if(dead)
				to_chat(user, "<span class='warning'>It's dead.</span>")
				return
			var/datum/antagonist/vampire/VD = user.mind.has_antag_datum(/datum/antagonist/vampire)
			if(do_after(user, 30, target = src))
				user.visible_message("<span class='warning'>[user] drinks from [src]!</span>",\
				"<span class='warning'>I drink from [src]!</span>")
				playsound(user.loc, 'sound/misc/drink_blood.ogg', 100, FALSE, -4)
				VD.handle_vitae(50)
				dead = TRUE
				playsound(get_turf(user), 'sound/vo/mobs/rat/rat_death.ogg', 100, FALSE, -1)
				icon_state = "srat1"
				rotprocess = SHELFLIFE_SHORT
				var/mob/living/carbon/V = user
				V.add_stress(/datum/stressevent/drankrat)
			return
	return ..()

/obj/item/reagent_containers/food/snacks/friedfrog
	name = "fried frog"
	desc = "are you sure you are going to eat this?"
	icon = 'modular/stonekeep/kaizoku/icons/mobs/fogfrog.dmi'
	icon_state = "fogfrog_cooked"
	bitesize = 2
	list_reagents = list(/datum/reagent/consumable/nutriment = 4, /datum/reagent/fogblight = 10) //heat denaturalized the poison, so it is less harmful. Still bad.
	tastes = list("stupid decisions" = 1)
	w_class = WEIGHT_CLASS_TINY
	eat_effect = null
	rotprocess = SHELFLIFE_SHORT
	sellprice = 0

/obj/item/reagent_containers/food/snacks/fogdart/burning(input as num)
	if(!dead)
		if(burning >= burntime)
			dead = TRUE
			playsound(src, 'sound/vo/mobs/rat/rat_death.ogg', 100, FALSE, -1)
			icon_state = "fogfrog_fried"
			rotprocess = SHELFLIFE_SHORT
	. = ..()

/obj/item/reagent_containers/food/snacks/fogdart/Crossed(mob/living/L)
	. = ..()
	if(L)
		if(!dead)
			if(isturf(loc))
				dir = pick(GLOB.cardinals)
				step(src, dir)
//				playsound(src, pick('sound/vo/mobs/rat/rat_life.ogg','sound/vo/mobs/rat/rat_life2.ogg','sound/vo/mobs/rat/rat_life3.ogg'), 100, TRUE, -1)

/obj/item/reagent_containers/food/snacks/fogdart/dead
	icon_state = "fogfrog_dead"
	dead = TRUE
	rotprocess = SHELFLIFE_SHORT

/obj/item/reagent_containers/food/snacks/fogdart/Initialize()
	. = ..()
	START_PROCESSING(SSobj, src)
	if(dead)
		icon_state = "fogfrog_dead"
		rotprocess = SHELFLIFE_SHORT

/obj/item/reagent_containers/food/snacks/fogdart/attack_hand(mob/user)
	if(isliving(user))
		var/mob/living/L = user
		if(!(L.mobility_flags & MOBILITY_PICKUP))
			return
	user.changeNext_move(CLICK_CD_MELEE)
	if(dead)
		..()
	else
		if(!isturf(loc))
			if(isliving(user))
				var/mob/living/L = user
				if(prob(L.STASPD * 1.5))
					..()
				else
					dir = pick(GLOB.cardinals)
					step(src, dir)
					to_chat(user, "<span class='warning'>I managed to grab it, but it slides away!</span>")
					playsound(src, pick('modular/stonekeep/kaizoku/sound/vo/general/undinecall.ogg','modular/stonekeep/kaizoku/sound/vo/general/undinecall1.ogg','modular/stonekeep/kaizoku/sound/vo/general/undinecall2.ogg'), 100, TRUE, -1)
					return
	..()

/obj/item/reagent_containers/food/snacks/fogdart/process()
	..()
	if(dead)
		return
	if(!isturf(loc)) //no floating out of bags
		return
	if(prob(5))
		playsound(src, pick('modular/stonekeep/kaizoku/sound/vo/general/undinecall3.ogg','modular/stonekeep/kaizoku/sound/vo/general/undinecall4.ogg','modular/stonekeep/kaizoku/sound/vo/general/undinecall5.ogg'), 100, TRUE, -1)
	if(prob(25) && !dead)
		dir = pick(GLOB.cardinals)
		step(src, dir)

/obj/item/reagent_containers/food/snacks/fogdart/obj_destruction(damage_flag)
	//..()
	if(!dead)
		new /obj/item/reagent_containers/food/snacks/fogdart/dead(src)
		playsound(src, 'modular/stonekeep/kaizoku/sound/vo/general/undinecall6.ogg', 100, FALSE, -1)
		qdel(src)
		return 1
	. = ..()

/obj/item/reagent_containers/food/snacks/fogdart/attackby(obj/item/I, mob/user, params)
	if(!dead)
		if(isliving(user))
			var/mob/living/L = user
			if(prob(L.STASPD * 2))
				..()
			else
				if(isturf(loc))
					dir = pick(GLOB.cardinals)
					step(src, dir)
					to_chat(user, "<span class='warning'>The vermin dodges my attack.</span>")
					playsound(src, pick('modular/stonekeep/kaizoku/sound/vo/general/undinecall.ogg','modular/stonekeep/kaizoku/sound/vo/general/undinecall1.ogg','modular/stonekeep/kaizoku/sound/vo/general/undinecall2.ogg'), 100, TRUE, -1)
					return
	..()


/datum/reagent/fogblight
	name = "fogblight"
	description = "liquid concentrate from fog island's frogs. Used by shinobis."
	taste_description = ""
	reagent_state = LIQUID
	color = "#1f434d"
	metabolization_rate = 0.2

/datum/reagent/fogblight/on_mob_life(mob/living/carbon/M)
	switch(current_cycle)
		if(1 to 10)
			M.confused += 2
			M.drowsyness += 2
		if(10 to 50)
			M.Sleeping(40, 0)
			. = 1
		if(51 to INFINITY)
			M.Sleeping(40, 0)
			M.adjustToxLoss((current_cycle - 50)*REM, 0)
			. = 1
	..()

// FOGBEAST: KAIZOKU HORSES

/mob/living/simple_animal/hostile/retaliate/fogbeast
	name = "fogbeast"
	desc = "A huge and elegant beast that gallops across open fields with hooves deadlier than any sword. \
			Long extinct from the mainlands, it is the favourite beasts of Fog Islanders and Heartfelteans."
	icon = 'modular/stonekeep/kaizoku/icons/mobs/horse.dmi'
	icon_state = "horse"
	icon_living = "horse"
	icon_dead = "horse_dead"
	icon_gib = "horse_gib"
	faction = list("saiga") // mounted frens
	ai_controller = /datum/ai_controller/fogbeast
	gender = MALE
	footstep_type = FOOTSTEP_MOB_SHOE
	emote_see = list("grazes on grass.", "whinnies softly.", "stamps a hoof.", "gazes upon the horizon.", "'s tail whips mosquitos away.")
	move_to_delay = 7
	botched_butcher_results = list(/obj/item/reagent_containers/food/snacks/meat/steak = 2,
						/obj/item/natural/hide = 1,
						/obj/item/alch/bone = 1)
	butcher_results = list(/obj/item/reagent_containers/food/snacks/meat/steak = 4,
						/obj/item/reagent_containers/food/snacks/fat = 2,
						/obj/item/natural/hide = 3,
						/obj/item/alch/bone = 2)
	perfect_butcher_results = list(/obj/item/reagent_containers/food/snacks/meat/steak = 5,
						/obj/item/reagent_containers/food/snacks/fat = 2,
						/obj/item/natural/hide = 4,
						/obj/item/alch/bone = 3)

	health =  MALE_MOOBEAST_HEALTH
	maxHealth =  MALE_MOOBEAST_HEALTH

	food_type = list(/obj/item/reagent_containers/food/snacks/produce/grain/wheat,
					/obj/item/reagent_containers/food/snacks/produce/grain/oat,
					/obj/item/reagent_containers/food/snacks/produce/fruit/jacksberry,
					/obj/item/reagent_containers/food/snacks/produce/fruit/apple)

	tame_chance = 40 // Foglander horses are easier to tame due to centuries of domestication, but you won't see them naturally on Stonekeep.
	bonus_tame_chance = 15
	pooptype = /obj/item/natural/poo/horse

	base_intents = list(/datum/intent/simple/hind_kick)
	attack_sound = list('sound/vo/mobs/saiga/attack (1).ogg','sound/vo/mobs/saiga/attack (2).ogg')
	attack_verb_continuous = "kicks"
	attack_verb_simple = "kick"
	melee_damage_lower = 15
	melee_damage_upper = 25
	environment_smash = ENVIRONMENT_SMASH_NONE

	retreat_distance = 10
	minimum_distance = 10

	base_constitution = 12
	base_strength = 10
	base_speed = 15

	can_buckle = TRUE
	buckle_lying = FALSE
	can_saddle = TRUE
	aggressive = TRUE
	remains_type = /obj/structure/remains/generic

	var/static/list/pet_commands = list(
		/datum/pet_command/idle,
		/datum/pet_command/free,
		/datum/pet_command/good_boy,
		/datum/pet_command/follow,
		/datum/pet_command/attack,
		/datum/pet_command/fetch,
		/datum/pet_command/play_dead,
		/datum/pet_command/protect_owner,
		/datum/pet_command/aggressive,
		/datum/pet_command/calm,
	)

/mob/living/simple_animal/hostile/retaliate/fogbeast/Initialize()
	AddComponent(/datum/component/obeys_commands, pet_commands)
	. = ..()
	AddElement(/datum/element/ai_retaliate)

	ADD_TRAIT(src, TRAIT_IGNOREDAMAGESLOWDOWN, TRAIT_GENERIC)

	AddComponent(\
		/datum/component/breed,\
		can_breed_with = list(/mob/living/simple_animal/hostile/retaliate/fogmare, /mob/living/simple_animal/hostile/retaliate/fogbeast),\
		breed_timer = 2 MINUTES\
	)

/mob/living/simple_animal/hostile/retaliate/fogbeast/update_icon()
	cut_overlays()
	..()
	if(stat != DEAD)
		if(ssaddle)
			var/mutable_appearance/saddlet = mutable_appearance(icon, "saddle-above", 4.3)
			add_overlay(saddlet)
			saddlet = mutable_appearance(icon, "saddle")
			add_overlay(saddlet)
		if(has_buckled_mobs())
			var/mutable_appearance/mounted = mutable_appearance(icon, "horse_mounted", 4.3)
			add_overlay(mounted)

/mob/living/simple_animal/hostile/retaliate/fogbeast/get_sound(input)
	switch(input)
		if("aggro")
			return pick('sound/vo/mobs/saiga/attack (1).ogg','sound/vo/mobs/saiga/attack (2).ogg')
		if("pain")
			return pick('sound/vo/mobs/saiga/pain (1).ogg','sound/vo/mobs/saiga/pain (2).ogg','sound/vo/mobs/saiga/pain (3).ogg')
		if("death")
			return pick('sound/vo/mobs/saiga/death (1).ogg','sound/vo/mobs/saiga/death (2).ogg')
		if("idle")
			return pick('sound/vo/mobs/saiga/idle (1).ogg','sound/vo/mobs/saiga/idle (2).ogg','sound/vo/mobs/saiga/idle (3).ogg','sound/vo/mobs/saiga/idle (4).ogg','sound/vo/mobs/saiga/idle (5).ogg','sound/vo/mobs/saiga/idle (6).ogg','sound/vo/mobs/saiga/idle (7).ogg')

/mob/living/simple_animal/hostile/retaliate/fogbeast/simple_limb_hit(zone)
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
			return "snout"
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

/mob/living/simple_animal/hostile/retaliate/fogbeast/taunted(mob/user)
	emote("aggro")
	return

/mob/living/simple_animal/hostile/retaliate/fogbeast/tamed(mob/user)
	..()
	deaggroprob = 40
	if(can_buckle)
		AddComponent(/datum/component/riding/fogbeast)

/mob/living/simple_animal/hostile/retaliate/fogbeast/tame
	tame = TRUE

/mob/living/simple_animal/hostile/retaliate/fogbeast/tame/saddled/Initialize()
	. = ..()
	var/obj/item/natural/saddle/S = new(src)
	ssaddle = S
	update_icon()

// FOGBEAST MARE.
// NEEDS ITS OWN CREATURE DEFINE, DO NOT MAKE A CHILD OF FOGBEAST.
/mob/living/simple_animal/hostile/retaliate/fogmare
	name = "fogbeast mare" // Name distinction because they share the same sprite and all.
	desc = "A huge and elegant beast that gallops across open fields with hooves deadlier than any sword. \
			Long extinct from the mainlands, it is the favourite beasts of Fog Islanders and Heartfelteans."
	icon = 'modular/stonekeep/kaizoku/icons/mobs/horse.dmi'
	icon_state = "horse"
	icon_living = "horse"
	icon_dead = "horse_dead"
	icon_gib = "horse_gib"
	faction = list("saiga")
	ai_controller = /datum/ai_controller/fogbeast
	gender = FEMALE
	animal_species = /mob/living/simple_animal/hostile/retaliate/fogbeast
	footstep_type = FOOTSTEP_MOB_SHOE
	emote_see = list("grazes on grass.", "whinnies softly.", "stamps a hoof.", "gazes upon the horizon.", "'s tail whips mosquitos away.")
	move_to_delay = 7
	botched_butcher_results = list(/obj/item/reagent_containers/food/snacks/meat/steak = 2,
						/obj/item/natural/hide = 1,
						/obj/item/alch/bone = 1)
	butcher_results = list(/obj/item/reagent_containers/food/snacks/meat/steak = 4,
						/obj/item/reagent_containers/food/snacks/fat = 2,
						/obj/item/natural/hide = 3,
						/obj/item/alch/bone = 2)
	perfect_butcher_results = list(/obj/item/reagent_containers/food/snacks/meat/steak = 5,
						/obj/item/reagent_containers/food/snacks/fat = 2,
						/obj/item/natural/hide = 4,
						/obj/item/alch/bone = 3)

	health =  FEMALE_MOOBEAST_HEALTH
	maxHealth =  FEMALE_MOOBEAST_HEALTH

	food_type = list(/obj/item/reagent_containers/food/snacks/produce/grain/wheat,
					/obj/item/reagent_containers/food/snacks/produce/grain/oat,
					/obj/item/reagent_containers/food/snacks/produce/fruit/jacksberry,
					/obj/item/reagent_containers/food/snacks/produce/fruit/apple)
	tame_chance = 40 // Foglander horses are easier to tame due to centuries of domestication, but you won't see them naturally on Stonekeep.
	bonus_tame_chance = 15

	pooptype = /obj/item/natural/poo/horse

	attack_verb_continuous = "kicks"
	attack_verb_simple = "kick"
	melee_damage_lower = 15
	melee_damage_upper = 25
	environment_smash = ENVIRONMENT_SMASH_NONE

	retreat_distance = 10
	minimum_distance = 10

	base_constitution = 12
	base_strength = 10
	base_speed = 15

	can_buckle = TRUE
	buckle_lying = FALSE
	can_saddle = TRUE
	aggressive = TRUE
	remains_type = /obj/structure/remains/generic

	var/can_breed = TRUE

	var/static/list/pet_commands = list(
		/datum/pet_command/idle,
		/datum/pet_command/free,
		/datum/pet_command/good_boy,
		/datum/pet_command/follow,
		/datum/pet_command/attack,
		/datum/pet_command/fetch,
		/datum/pet_command/play_dead,
		/datum/pet_command/protect_owner,
		/datum/pet_command/aggressive,
		/datum/pet_command/calm,
	)

/mob/living/simple_animal/hostile/retaliate/fogmare/Initialize()
	AddComponent(/datum/component/obeys_commands, pet_commands)
	. = ..()
	AddElement(/datum/element/ai_retaliate)

	ADD_TRAIT(src, TRAIT_IGNOREDAMAGESLOWDOWN, TRAIT_GENERIC)

	if(can_breed)
		AddComponent(\
			/datum/component/breed,\
			list(/mob/living/simple_animal/hostile/retaliate/fogmare, /mob/living/simple_animal/hostile/retaliate/fogbeast),\
			3 MINUTES, \
			list(/mob/living/simple_animal/hostile/retaliate/fogmare/filly = 80, /mob/living/simple_animal/hostile/retaliate/fogmare/filly/colt = 20),\
			CALLBACK(src, PROC_REF(after_birth)),\
		)

/mob/living/simple_animal/hostile/retaliate/fogmare/proc/after_birth(mob/living/simple_animal/hostile/retaliate/fogmare/filly, mob/living/partner)
	return

/mob/living/simple_animal/hostile/retaliate/fogmare/update_icon()
	cut_overlays()
	..()
	if(stat != DEAD)
		if(ssaddle)
			var/mutable_appearance/saddlet = mutable_appearance(icon, "saddle-above", 4.3)
			add_overlay(saddlet)
			saddlet = mutable_appearance(icon, "saddle")
			add_overlay(saddlet)
		if(has_buckled_mobs())
			var/mutable_appearance/mounted = mutable_appearance(icon, "horse_mounted", 4.3)
			add_overlay(mounted)

/mob/living/simple_animal/hostile/retaliate/fogmare/get_sound(input)
	switch(input)
		if("aggro")
			return pick('sound/vo/mobs/saiga/attack (1).ogg','sound/vo/mobs/saiga/attack (2).ogg')
		if("pain")
			return pick('sound/vo/mobs/saiga/pain (1).ogg','sound/vo/mobs/saiga/pain (2).ogg','sound/vo/mobs/saiga/pain (3).ogg')
		if("death")
			return pick('sound/vo/mobs/saiga/death (1).ogg','sound/vo/mobs/saiga/death (2).ogg')
		if("idle")
			return pick('sound/vo/mobs/saiga/idle (1).ogg','sound/vo/mobs/saiga/idle (2).ogg','sound/vo/mobs/saiga/idle (3).ogg','sound/vo/mobs/saiga/idle (4).ogg','sound/vo/mobs/saiga/idle (5).ogg','sound/vo/mobs/saiga/idle (6).ogg','sound/vo/mobs/saiga/idle (7).ogg')

/mob/living/simple_animal/hostile/retaliate/fogmare/simple_limb_hit(zone)
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
			return "snout"
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

/mob/living/simple_animal/hostile/retaliate/fogmare/tamed(mob/user)
	..()
	deaggroprob = 40
	if(can_buckle)
		AddComponent(/datum/component/riding/fogbeast)

/mob/living/simple_animal/hostile/retaliate/fogmare/tame
	tame = TRUE

/mob/living/simple_animal/hostile/retaliate/fogmare/tame/saddled/Initialize()
	. = ..()
	var/obj/item/natural/saddle/S = new(src)
	ssaddle = S
	update_icon()

// FOGBEAST FOALS

/mob/living/simple_animal/hostile/retaliate/fogmare/filly
	icon = 'modular/stonekeep/kaizoku/icons/mobs/horse.dmi'
	name = "fogbeast filly" // Name for a young female foal.
	desc = "The young foal of a fogbeast. This one is a female."
	icon_state = "horsekid"
	icon_living = "horsekid"
	icon_dead = "horsekid_dead"
	icon_gib = "horsekid_gib"

	animal_species = null
	gender = FEMALE
	pass_flags = PASSTABLE | PASSMOB
	mob_size = MOB_SIZE_SMALL

	botched_butcher_results = list(/obj/item/reagent_containers/food/snacks/meat/mince/beef = 1)
	butcher_results = list(/obj/item/reagent_containers/food/snacks/meat/steak = 1)
	perfect_butcher_results = list(/obj/item/reagent_containers/food/snacks/meat/steak = 1,
								/obj/item/natural/hide = 1)

	health = CALF_HEALTH
	maxHealth = CALF_HEALTH

	base_intents = list(/datum/intent/simple/hind_kick)
	melee_damage_lower = 1
	melee_damage_upper = 6

	base_constitution = 5
	base_strength = 5
	base_speed = 5
	defprob = 50
	pixel_x = -16
	adult_growth = /mob/living/simple_animal/hostile/retaliate/fogmare
	tame = TRUE
	can_buckle = FALSE
	aggressive = FALSE

	can_breed = FALSE

	ai_controller = /datum/ai_controller/fogbeast_foal

/mob/living/simple_animal/hostile/retaliate/fogmare/filly/colt
	name = "fogbeast colt" // Name for a male young foal.
	desc = "The young foal of a fogbeast. This one is a male."
	adult_growth = /mob/living/simple_animal/hostile/retaliate/fogbeast
	gender = MALE
