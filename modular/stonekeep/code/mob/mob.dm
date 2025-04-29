/* * * * * * * * * **
 *					*
 *		 Mobs		*
 *					*
 *					*
 * * * * * * * * * **/

/datum/language_holder/orc
	languages = list(/datum/language/orcish)

// ======================================================================
/*	..................   Hairy Spider Web   ................... */
/obj/structure/innocent_web
	name = ""
	desc = ""
	icon = 'modular/stonekeep/icons/32x64.dmi'
	icon_state = "innocentweb1"
	layer = ABOVE_ALL_MOB_LAYER
	density = FALSE
	max_integrity = 35
	climbable = FALSE
	dir = SOUTH
	debris = list(/obj/item/natural/silk = 1)
	var/lucky_escape

/obj/structure/innocent_web/Initialize()
	icon_state = "innocentweb[rand(1,2)]"
	. = ..()

/obj/structure/innocent_web/attack_hand()
	playsound(src, pick('sound/misc/jumpscare (1).ogg','sound/misc/jumpscare (2).ogg','sound/misc/jumpscare (3).ogg','sound/misc/jumpscare (4).ogg'), 100)
	createspooder()
	qdel(src)

/obj/structure/innocent_web/attackby(obj/item, /mob/user, params)
	playsound(src, pick('sound/misc/jumpscare (1).ogg','sound/misc/jumpscare (2).ogg','sound/misc/jumpscare (3).ogg','sound/misc/jumpscare (4).ogg'), 100)
	createspooder()
	qdel(src)

/obj/structure/innocent_web/throw_impact(atom/hit_atom, datum/thrownthing/throwingdatum)
	playsound(src, pick('sound/misc/jumpscare (1).ogg','sound/misc/jumpscare (2).ogg','sound/misc/jumpscare (3).ogg','sound/misc/jumpscare (4).ogg'), 100)
	createspooder()
	qdel(src)

/obj/structure/innocent_web/Crossed(atom/movable/AM)
	..()
	if(isliving(AM))
		var/mob/living/carbon/human/L = AM
		lucky_escape = ( L.STALUC * 4 )
		L.Immobilize(5)
		if(L.m_intent == MOVE_INTENT_WALK)
			L.Immobilize(10)
			if(prob(lucky_escape))
				to_chat(L, "<span class='warning'>The flimsy web breaks.</span>")
				qdel(src)
			else
				playsound(src, pick('sound/misc/jumpscare (1).ogg','sound/misc/jumpscare (2).ogg','sound/misc/jumpscare (3).ogg','sound/misc/jumpscare (4).ogg'), 120)
				createspooder()
				qdel(src)
		if(L.m_intent == MOVE_INTENT_RUN)
			to_chat(L, "<span class='warning'>I'm stuck in the web!</span>")
			L.Immobilize(20)
			if(prob(lucky_escape))
				to_chat(L, "<span class='warning'>The flimsy web breaks.</span>")
				qdel(src)
			else
				playsound(src, pick('sound/misc/jumpscare (1).ogg','sound/misc/jumpscare (2).ogg','sound/misc/jumpscare (3).ogg','sound/misc/jumpscare (4).ogg'), 120)
				createspooder()
				qdel(src)
		else
			to_chat(L, "<span class='warning'>I'm stuck in the web!</span>")
			L.Immobilize(5)
			if(prob(lucky_escape))
				to_chat(L, "<span class='warning'>The flimsy web breaks.</span>")
				qdel(src)
			else
				playsound(src, pick('sound/misc/jumpscare (1).ogg','sound/misc/jumpscare (2).ogg','sound/misc/jumpscare (3).ogg','sound/misc/jumpscare (4).ogg'), 120)
				createspooder()
				qdel(src)

/obj/structure/innocent_web/proc/createspooder()
	if(QDELETED(src))
		return
	new /mob/living/simple_animal/hostile/retaliate/spider/hairy(get_turf(src))


/mob/living/simple_animal/hostile/retaliate/spider/hairy
	name = "hairy spider"
	desc = "The forest canopies hides more than leaves...These creachers make honey from flowers and spin silk from their abdomen, when not consuming prey."
	icon = 'modular/stonekeep/icons/mobs/spider.dmi'
	icon_state = "spider"
	icon_living = "spider"
	icon_dead = "spider-dead"
	botched_butcher_results = list(/obj/item/reagent_containers/food/snacks/meat/strange = 1,
							/obj/item/natural/silk = 1)
	butcher_results = list(/obj/item/reagent_containers/food/snacks/meat/strange= 2,
							/obj/item/reagent_containers/food/snacks/spiderhoney = 1,
							/obj/item/natural/silk = 2)
	perfect_butcher_results = list(/obj/item/reagent_containers/food/snacks/meat/strange = 2,
							/obj/item/reagent_containers/food/snacks/spiderhoney = 2,
							/obj/item/natural/silk = 3)


/mob/living/simple_animal/hostile/retaliate/spider/hairy/giant
	botched_butcher_results = list(/obj/item/reagent_containers/food/snacks/meat/strange = 1,
							/obj/item/natural/silk = 1)
	butcher_results = list(/obj/item/reagent_containers/food/snacks/meat/strange= 2,
							/obj/item/reagent_containers/food/snacks/spiderhoney = 1,
							/obj/item/natural/silk = 3)
	perfect_butcher_results = list(/obj/item/reagent_containers/food/snacks/meat/strange = 2,
							/obj/item/reagent_containers/food/snacks/spiderhoney = 2,
							/obj/item/natural/silk = 4)
/mob/living/simple_animal/hostile/retaliate/spider/hairy/giant/Initialize()
	. = ..()
	resize = 1.5
	update_transform()

// ======================================================================
/*	..................   Corpses   ................... */
/obj/effect/mob_spawn/human/orc/corpse
	icon = 'icons/effects/blood.dmi'
	icon_state = "remains"
	color = "#aa9b00"
	mob_type = /mob/living/carbon/human/species/orc

/obj/effect/mob_spawn/human/orc/corpse/savageorc
	mob_name = "Savage Orc"
	name = "Savage Orc"
	skin_tone = "#50715C"
	hairstyle = "Bald"
	facial_hairstyle = "Shaved"
	outfit = /datum/outfit/savageorc

/obj/effect/mob_spawn/human/orc/corpse/savageorc2
	mob_name = "Savage Orc"
	name = "Savage Orc"
	skin_tone = "#50715C"
	hairstyle = "Bald"
	facial_hairstyle = "Shaved"
	outfit = /datum/outfit/savageorc2

/datum/outfit/savageorc
//	shirt = /obj/item/clothing/shirt/tribalrag	Vanderlin clothing
	pants =	/obj/item/clothing/pants/loincloth/brown
	shoes = /obj/item/clothing/shoes/boots/furlinedboots

/datum/outfit/savageorc2
//	shirt = /obj/item/clothing/shirt/tribalrag
	pants =	/obj/item/clothing/pants/loincloth/brown
	shoes = /obj/item/clothing/shoes/boots/furlinedboots
	head = /obj/item/clothing/head/helmet/leather

/obj/effect/mob_spawn/human/orc/corpse/orcmarauder
	mob_name = "Orc Marauder"
	name = "Orc Marauder"
	skin_tone = "#50715C"
	hairstyle = "Bald"
	facial_hairstyle = "Shaved"
//	outfit = /datum/outfit/orcmarauder  doesnt actually equip this TO DO
	mob_type = /mob/living/carbon/human/species/orc/marauder
/*
/datum/outfit/orcmarauder
	armor = /obj/item/clothing/armor/chainmail
	pants =	/obj/item/clothing/pants/chainlegs
	shoes = /obj/item/clothing/shoes/boots/furlinedboots
	head = /obj/item/clothing/head/helmet/leather
*/
/obj/effect/mob_spawn/human/orc/corpse/orcravager
	mob_name = "Orc Ravager"
	name = "Orc Ravager"
	skin_tone = "#50715C"
	hairstyle = "Bald"
	facial_hairstyle = "Shaved"
	outfit = /datum/outfit/orcravager

/datum/outfit/orcravager
	armor = /obj/item/clothing/armor/chainmail
	pants =	/obj/item/clothing/pants/chainlegs
	shoes = /obj/item/clothing/shoes/boots/armor
	head = /obj/item/clothing/head/helmet/skullcap
	gloves = /obj/item/clothing/gloves/chain
	neck = /obj/item/clothing/neck/chaincoif
///	mask = /obj/item/clothing/face/skullmask	Vanderlin clothing TO DO review it

/obj/effect/mob_spawn/human/orc/corpse/dwarfinvasion
	color = "#82aa00"
	mob_type = /mob/living/carbon/human/species/orc/dwarfinvasion

/mob/living/carbon/human/species/orc/dwarfinvasion/after_creation()
	..()
	equipOutfit(new /datum/outfit/job/roguetown/npc/orc/dead_invader)

/datum/outfit/job/roguetown/npc/orc/dead_invader/pre_equip(mob/living/carbon/human/H)
	..()
	var/loadout = rand(1,5)
	switch(loadout)
		if(1)
			armor = /obj/item/clothing/armor/leather/hide/orc
		if(2)
			armor = /obj/item/clothing/armor/leather/hide/orc
			cloak = /obj/item/clothing/cloak/raincloak/brown
		if(3)
			cloak = /obj/item/clothing/cloak/raincloak/brown
		if(4)
			armor = /obj/item/clothing/armor/leather/hide/orc
			cloak = /obj/item/clothing/cloak/raincloak/brown
		if(5)
			armor = /obj/item/clothing/armor/leather/hide/orc
			cloak = /obj/item/clothing/cloak/raincloak/brown

/*	..................   Dwarf Underdweller Corpse   ................... */
/obj/effect/mob_spawn/human/corpse/damaged/underdweller
	icon = 'icons/effects/blood.dmi'
	icon_state = "remains"
	color = "#aa9b00"
	mob_type = /mob/living/carbon/human/species/dwarf/mountain
	mob_name = "Dwarf Underdweller"
	name = "Dwarf Underdweller"
	hairstyle = "Miner"
	facial_hairstyle = "Pick"
	outfit = /datum/outfit/deadunderdweller

/datum/outfit/deadunderdweller
	shirt = /obj/item/clothing/shirt/undershirt/sailor/red
	pants = /obj/item/clothing/pants/trou/leather
	shoes = /obj/item/clothing/shoes/simpleshoes/buckle
	backl = /obj/item/storage/backpack/backpack


// ======================================================================
/*	..................   Cat   ................... */
/mob/living/simple_animal/pet/cat
	base_strength = 2
	botched_butcher_results = list(/obj/item/reagent_containers/food/snacks/meat/mince/beef = 1)
	butcher_results = list(/obj/item/reagent_containers/food/snacks/flayedcat = 1)
	perfect_butcher_results = list(/obj/item/reagent_containers/food/snacks/flayedcat = 1)

/obj/item/reagent_containers/food/snacks/flayedcat
	name = "flayed cat"
	desc = ""
	icon_state = "flayedcat"
	list_reagents = list(/datum/reagent/consumable/nutriment = SNACK_POOR)
	foodtype = RAW
	w_class = WEIGHT_CLASS_SMALL
	eat_effect = /datum/status_effect/debuff/uncookedfood
	fried_type = /obj/item/reagent_containers/food/snacks/friedcat
	cooked_smell = /datum/pollutant/food/fried_rat
	sellprice = 0
	rotprocess = SHELFLIFE_SHORT

/obj/item/reagent_containers/food/snacks/friedcat
	name = "fried cat"
	icon_state = "cookedcat"
	bitesize = 2
	list_reagents = list(/datum/reagent/consumable/nutriment = SNACK_DECENT)
	w_class = WEIGHT_CLASS_SMALL
	tastes = list("burnt flesh" = 1)
	rotprocess = SHELFLIFE_DECENT
	sellprice = 0

// ======================================================================
/*	..................   Mob Intents   ................... */
/datum/intent/simple/trollsmash
	name = "trollsmash"
	icon_state = "instrike"
	attack_verb = list("hammer-punches", "smashes", "headbutts", "rams")
	animname = "blank22"
	blade_class = BCLASS_BLUNT
	hitsound = "punch_hard"
	chargetime = 0
	penfactor = 25
	swingdelay = 4 SECONDS
	candodge = TRUE
	canparry = FALSE


/mob/living/simple_animal/hostile/retaliate/troll
	base_intents = list(/datum/intent/simple/trollrip, /datum/intent/simple/trollsmash)

/mob/living/simple_animal/hostile/retaliate/trollbog
	base_intents = list(/datum/intent/simple/trollsmash, /datum/intent/simple/trollrip)
	melee_damage_lower = 35
	melee_damage_upper = 60

/mob/living/simple_animal/hostile/retaliate/wolf
	base_intents = list(/datum/intent/simple/critterbite)
	base_endurance = 15
	melee_damage_lower = 14
	melee_damage_upper = 20

/mob/living/simple_animal/hostile/retaliate/bigrat
	base_intents = list(/datum/intent/simple/critterbite)
	base_endurance = 10
	melee_damage_lower = 10
	melee_damage_upper = 14

/mob/living/simple_animal/hostile/retaliate/spider
	base_intents = list(/datum/intent/simple/critterbite)
	base_endurance = 15
	melee_damage_lower = 16
	melee_damage_upper = 22

/datum/intent/simple/trollrip
	name = "horrific bite"
	icon_state = "instrike"
	attack_verb = list("gores", "gnashes", "viciously bites")
	animname = "blank22"
	blade_class = BCLASS_CHOP
	hitsound = "smallslash"
	chargetime = 0
	penfactor = 40
	swingdelay = 2 SECONDS
	candodge = TRUE
	canparry = FALSE

/datum/intent/simple/critterbite
	name = "bite"
	icon_state = "instrike"
	attack_verb = list("bites")
	animname = "blank22"
	blade_class = BCLASS_BITE
	hitsound = "smallslash"
	chargetime = 0
	penfactor = 10
	swingdelay = 1.5 SECONDS
	candodge = TRUE
	canparry = TRUE

/datum/intent/simple/claw_strong
	name = "claw"
	icon_state = "inclaw"
	attack_verb = list("slashes", "claws")
	animname = "blank22"
	blade_class = BCLASS_CUT
	hitsound = "smallslash"
	chargetime = 0
	penfactor = 10
	swingdelay = 2 SECONDS
	candodge = TRUE
	canparry = TRUE
	miss_text = "slashes the air!"

/datum/intent/simple/claw_quick
	name = "claw"
	icon_state = "inclaw"
	attack_verb = list("slashes", "claws")
	animname = "blank22"
	blade_class = BCLASS_CUT
	hitsound = "smallslash"
	chargetime = 0
	penfactor = 3
	swingdelay = 1 SECONDS
	candodge = TRUE
	canparry = TRUE
	miss_text = "slashes the air!"



/mob/living/simple_animal/hostile/retaliate/headless
	icon = 'modular/stonekeep/icons/mobs/headless.dmi'


/mob/living/simple_animal/hostile/retaliate/gator/throne

/mob/living/simple_animal/hostile/retaliate/gator/throne/get_sound(input)
	switch(input)
		if("aggro")
			return pick('modular/stonekeep/sound/vo/mobs/gator/gatoraggro1.ogg','modular/stonekeep/sound/vo/mobs/gator/gatoraggro2.ogg','modular/stonekeep/sound/vo/mobs/gator/gatoraggro3.ogg','modular/stonekeep/sound/vo/mobs/gator/gatoraggro4.ogg')
		if("pain")
			return pick('modular/stonekeep/sound/vo/mobs/gator/gatorpain.ogg')
		if("death")
			return pick('modular/stonekeep/sound/vo/mobs/gator/gatordeath.ogg')
		if("idle")
			return pick('sound/blank.ogg')


/mob/living/simple_animal/hostile/retaliate/saiga
	remains_type = /obj/structure/remains/generic

/mob/living/simple_animal/hostile/retaliate/saigabuck
	remains_type = /obj/structure/remains/generic

/mob/living/simple_animal/hostile/retaliate/trufflepig
	remains_type = /obj/structure/remains/generic


/mob/living/carbon/human/species/goblin/npc/hell/after_creation()
	. = ..()
	faction = list("zizo")
/mob/living/carbon/human/species/goblin/npc/ambush/hell/after_creation()
	. = ..()
	faction = list("zizo")


/mob/living/simple_animal/hostile/retaliate/wolf/xylix
	icon_state = "spiritw"
	icon_living = "spiritw"
	icon_dead = null
	color = "#a58ba2"


/mob/living/simple_animal/hostile/insanegnome
	name = "insane gnome"
	desc = "Trapped alive for decades in stone is not good for your mental balance."
	icon = 'modular/stonekeep/icons/mobs/insanegnome.dmi'
	icon_state = "gnome"
	icon_living = "gnome"
	icon_dead = "gnome_death"
	gender = MALE
	mob_biotypes = MOB_ORGANIC|MOB_HUMANOID
	robust_searching = 1
	speak_chance = 5
	turns_per_move = 1
	move_to_delay = 1
	base_constitution = 14
	base_strength = 6
	base_speed = 15
	maxHealth = 80
	health = 80
	harm_intent_damage = 15
	melee_damage_lower = 20
	melee_damage_upper = 20
	vision_range = 7
	aggro_vision_range = 9
	retreat_distance = 0
	minimum_distance = 0
	limb_destroyer = 1
	base_intents = list(/datum/intent/simple/claw)
	attack_verb_continuous = "rips"
	attack_verb_simple = "rend"
	attack_sound = 'sound/combat/wooshes/bladed/wooshmed (1).ogg'
	dodge_sound = 'sound/combat/dodge.ogg'
	canparry = FALSE
	candodge = TRUE
	dodge_prob = 50
	d_intent = INTENT_DODGE
	speak_chance = 10
	speak_emote = list("idle")
	faction = list()
	footstep_type = FOOTSTEP_MOB_BAREFOOT
	del_on_death = FALSE

	can_have_ai = FALSE //disable native ai
	AIStatus = AI_OFF
	ai_controller = /datum/ai_controller/orc


/mob/living/simple_animal/hostile/insanegnome/Initialize()
	. = ..()
	playsound(src, pick('modular/stonekeep/sound/vo/mobs/gnome/laugh.ogg','modular/stonekeep/sound/vo/mobs/gnome/giggle.ogg'), 100, 0) // Bandaid fix since it shouldn't call emote on init

/mob/living/simple_animal/hostile/insanegnome/death(gibbed)
	playsound(src.loc, 'modular/stonekeep/sound/vo/mobs/gnome/scream.ogg', 50)
	..()
	var/turf/deathspot = get_turf(src)
	new  /obj/effect/decal/cleanable/ash(deathspot)
	update_icon()
	sleep(20)
	qdel(src)

/mob/living/simple_animal/hostile/insanegnome/taunted(mob/user)
	. = ..()
	emote("aggro")

/mob/living/simple_animal/hostile/insanegnome/Life()
	. = ..()
	if(!target)
		if(prob(1))
			emote(pick( "laugh"), TRUE)

/mob/living/simple_animal/hostile/insanegnome/get_sound(input)
	switch(input)
		if("laugh")
			return pick('modular/stonekeep/sound/vo/mobs/gnome/laugh.ogg','modular/stonekeep/sound/vo/mobs/gnome/giggle.ogg')
		if("aggro")
			return pick('modular/stonekeep/sound/vo/mobs/gnome/aggro (1).ogg','modular/stonekeep/sound/vo/mobs/gnome/aggro (2).ogg')
		if("idle")
			return pick('modular/stonekeep/sound/vo/mobs/gnome/idle (1).ogg','modular/stonekeep/sound/vo/mobs/gnome/idle (2).ogg','modular/stonekeep/sound/vo/mobs/gnome/idle (3).ogg','modular/stonekeep/sound/vo/mobs/gnome/idle (4).ogg','modular/stonekeep/sound/vo/mobs/gnome/idle (5).ogg')
		if("pain")
			return pick('modular/stonekeep/sound/vo/mobs/gnome/pain (1).ogg','modular/stonekeep/sound/vo/mobs/gnome/pain (2).ogg','modular/stonekeep/sound/vo/mobs/gnome/pain (3).ogg')




//////////////////////
// Hair Definitions //
//////////////////////
/datum/sprite_accessory/hair
	icon = 'modular/stonekeep/icons/mobs/hair.dmi'  // STONEKEEP EDIT

	// please make sure they're sorted alphabetically and, where needed, categorized
	// try to capitalize the names please~
	// try to spell
	// you do not need to define _s or _l sub-states, game automatically does this for you

	// each race gets four unique haircuts
	// dwarf - miner, gnomish, boss, hearth
	// elf - son, fancy, mysterious, long
	// human - adventurer, graceful, squire, pigtails, noblesse
	// dual - nomadic, shrine
	// aasimar - amazon, topknot, martial, forsaken
	// tiefling - junia, performer, tribal, lover

/datum/sprite_accessory/hair/bald
	name = "Bald"
	icon_state = ""
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling", "halforc")
	gender = MALE

/datum/sprite_accessory/hair/adventurer_human
	name = "Adventurer"
	icon_state = "adventurer"
	gender = MALE
	specuse = list("human")

/datum/sprite_accessory/hair/berserker
	name = "Berserker"
	icon_state = "berserker"
	gender = MALE
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling", "halforc")
	under_layer = TRUE

/datum/sprite_accessory/hair/bog
	name = "Bog"
	icon_state = "bog"
	gender = MALE
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling", "halforc")

/datum/sprite_accessory/hair/boss_dwarf
	name = "Boss"
	icon_state = "boss" // original name bodicker
	gender = MALE
	specuse = list("dwarf")
	under_layer = TRUE

/datum/sprite_accessory/hair/bowlcut
	name = "Bowlcut"
	icon_state = "bowlcut"
	gender = MALE
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling", "halforc")

/datum/sprite_accessory/hair/brother
	name = "Brother"
	icon_state = "brother"
	gender = MALE
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling", "halforc")

/datum/sprite_accessory/hair/cavehead
	name = "Cavehead"
	icon_state = "cavehead" // original name thinning?
	gender = MALE
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling", "halforc")
	under_layer = TRUE

/datum/sprite_accessory/hair/conscript
	name = "Conscript"
	icon_state = "conscript"
	gender = MALE
	under_layer = TRUE
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling", "halforc")

/datum/sprite_accessory/hair/courtier
	name = "Courtier"
	icon_state = "courtier"
	gender = MALE
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling", "halforc")

/datum/sprite_accessory/hair/dome
	name = "Dome"
	icon_state = "dome"
	gender = MALE
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling", "halforc")
	under_layer = TRUE

/datum/sprite_accessory/hair/druid
	name = "Druid"
	icon_state = "druid"  // original name elf_scout?
	gender = MALE
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling", "halforc")

/datum/sprite_accessory/hair/fancy_elf
	name = "Fancy"
	icon_state = "fancy_elf"
	gender = MALE
	specuse = list("elf")

/datum/sprite_accessory/hair/forester
	name = "Forester"
	icon_state = "forester"
	gender = MALE
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling", "halforc")

/datum/sprite_accessory/hair/foreigner_tief
	name = "Foreigner"
	icon_state = "foreigner"
	gender = MALE
	specuse = list("tiefling")

/datum/sprite_accessory/hair/forsaken_aas
	name = "Forsaken"
	icon_state = "forsaken"
	gender = MALE
	specuse = list("aasimar")
	under_layer = TRUE

/datum/sprite_accessory/hair/forged
	name = "Forged"
	icon_state = "forged"
	gender = MALE
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling", "halforc")
	under_layer = TRUE

/datum/sprite_accessory/hair/graceful
	name = "Graceful"
	icon_state = "graceful"
	gender = MALE
	specuse = list("human")

/datum/sprite_accessory/hair/heroic
	name = "Heroic"
	icon_state = "heroic"
	gender = MALE
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling", "halforc")

/datum/sprite_accessory/hair/hunter
	name = "Hunter"
	icon_state = "hunter"
	gender = MALE
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling", "halforc")

/datum/sprite_accessory/hair/landlord
	name = "Landlord"
	icon_state = "landlord"
	gender = MALE
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling", "halforc")

/datum/sprite_accessory/hair/lover_tief
	name = "Lover"
	icon_state = "lover_tief_m"
	gender = MALE
	specuse = list("tiefling")

/datum/sprite_accessory/hair/lion
	name = "Lions mane"
	icon_state = "lion"
	gender = MALE
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling", "halforc")

/datum/sprite_accessory/hair/monk
	name = "Monk"
	icon_state = "monk"
	gender = MALE
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling", "halforc")

/datum/sprite_accessory/hair/majestic_human
	name = "Majesty"
	icon_state = "majestic"
	gender = MALE
	specuse = list("human")

/datum/sprite_accessory/hair/merc
	name = "Mercenary"
	icon_state = "mercenary"
	gender = MALE
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling", "halforc")

/datum/sprite_accessory/hair/miner_dwarf
	name = "Miner"
	icon_state = "miner"
	gender = MALE
	specuse = list("dwarf")

/datum/sprite_accessory/hair/nobility_human
	name = "Nobility"
	icon_state = "nobility"
	gender = MALE
	specuse = list("human")

/datum/sprite_accessory/hair/nomadic_humtief
	name = "Nomadic"
	icon_state = "nomadic"
	gender = MALE
	specuse = list("human", "tiefling")

/datum/sprite_accessory/hair/pirate
	name = "Pirate"
	icon_state = "pirate_e"
	gender = MALE
	under_layer = TRUE
	specuse = list("elf", "tiefling", "halforc")

/datum/sprite_accessory/hair/princely
	name = "Princely"
	icon_state = "princely"
	gender = MALE
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling", "halforc")

/datum/sprite_accessory/hair/raider
	name = "Raider"
	icon_state = "raider"
	gender = MALE
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling", "halforc")

/datum/sprite_accessory/hair/rogue
	name = "Rogue"
	icon_state = "rogue"
	gender = MALE
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling", "halforc")

/datum/sprite_accessory/hair/romantic
	name = "Romantic"
	icon_state = "romantic"
	gender = MALE
	specuse = list("elf")

/datum/sprite_accessory/hair/ronin
	name = "Ronin"
	icon_state = "ronin"
	gender = MALE
	specuse = list("human", "elf", "aasimar", "tiefling", "halforc")

/datum/sprite_accessory/hair/scribe
	name = "Scribe"
	icon_state = "scribe"
	gender = MALE
	specuse = list("human", "dwarf", "aasimar", "tiefling", "halforc")
	under_layer = TRUE

/datum/sprite_accessory/hair/southern_human
	name = "Southern"
	icon_state = "southern"
	gender = MALE
	specuse = list("human")

/datum/sprite_accessory/hair/son
	name = "Son"
	icon_state = "sun"
	gender = MALE
	specuse = list("human", "dwarf", "aasimar", "tiefling", "halforc")

/datum/sprite_accessory/hair/son_elf
	name = "Sonne"
	icon_state = "son_elf"
	gender = MALE
	specuse = list("elf")

/datum/sprite_accessory/hair/squire_human
	name = "Squired"
	icon_state = "squire" // original name shaved_european
	gender = MALE
	specuse = list("human")

/datum/sprite_accessory/hair/steward
	name = "Steward"
	icon_state = "steward"
	gender = MALE
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling", "halforc")

/datum/sprite_accessory/hair/swain
	name = "Swain"
	icon_state = "swain"
	gender = MALE
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling", "halforc")

/datum/sprite_accessory/hair/top_aas
	name = "Topknot"
	icon_state = "topknot"
	gender = MALE
	specuse = list("aasimar")

/datum/sprite_accessory/hair/troubadour
	name = "Troubadour"
	icon_state = "troubadour"
	gender = MALE
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling", "halforc")

/datum/sprite_accessory/hair/tied
	name = "Tied"
	icon_state = "tied"
	gender = MALE
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling", "halforc")

/datum/sprite_accessory/hair/tied_long
	name = "Tied long"
	icon_state = "tiedlong"
	gender = MALE
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling", "halforc")

/datum/sprite_accessory/hair/trimmed
	name = "Trimmed"
	icon_state = "trimmed"
	gender = MALE
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling", "halforc")

/datum/sprite_accessory/hair/warrior
	name = "Warrior"
	icon_state = "warrior"
	gender = MALE
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling", "halforc")

/datum/sprite_accessory/hair/woodsman_elf
	name = "Woodsman"
	icon_state = "woodsman_e"
	gender = MALE
	specuse = list("elf")

/datum/sprite_accessory/hair/vagabond
	name = "Vagabond"
	icon_state = "vagabond"
	gender = MALE
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling", "halforc")

/datum/sprite_accessory/hair/zybantu
	name = "Zybantu"
	icon_state = "zybantu" // orginal name gelled
	gender = MALE
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling", "halforc")






/////////////////////////////
// GIRLY Hair Definitions  //
/////////////////////////////

/datum/sprite_accessory/hair/amazon
	name = "Amazon"
	icon_state = "amazon_f"
	gender = FEMALE
	specuse = list("aasimar")

/datum/sprite_accessory/hair/archivist
	name = "Archivist"
	icon_state = "archivist_f" // original name bob_scully
	gender = FEMALE
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling", "halforc")

/datum/sprite_accessory/hair/barbarian
	name = "Barbarian"
	icon_state = "barbarian_f"
	gender = FEMALE
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling", "halforc")

/datum/sprite_accessory/hair/beartails
	name = "Beartails"
	icon_state = "beartails_f" // modified cotton
	gender = FEMALE
	under_layer = TRUE
	specuse = list("human")

/datum/sprite_accessory/hair/bun
	name = "Bun"
	icon_state = "bun-low"
	gender = FEMALE
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling", "halforc")

/datum/sprite_accessory/hair/bob
	name = "Bob"
	icon_state = "bob_f"
	gender = FEMALE
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling", "halforc")

/datum/sprite_accessory/hair/conscriptf
	name = "Conscripte"
	icon_state = "conscript_f"
	gender = FEMALE
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling", "halforc")

/datum/sprite_accessory/hair/consort
	name = "Consort"
	icon_state = "consort"
	gender = FEMALE
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling", "halforc")

/datum/sprite_accessory/hair/cotton_elf
	name = "Cotton"
	icon_state = "cotton_e"
	gender = FEMALE
	specuse = list("elf")

/datum/sprite_accessory/hair/curlyshort
	name = "Curly Short"
	icon_state = "curly_f"
	gender = FEMALE
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling", "halforc")

/datum/sprite_accessory/hair/damsel
	name = "Damsel"
	icon_state = "damsel"
	gender = FEMALE
	specuse = list("human", "aasimar", "tiefling", "halforc")

/datum/sprite_accessory/hair/fancy_femelf
	name = "Fancy"
	icon_state = "fancy_elf_f"
	gender = FEMALE
	specuse = list("elf")

/datum/sprite_accessory/hair/grumpy_f
	name = "Grumpy"
	icon_state = "grumpy_f"
	gender = FEMALE
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling", "halforc")

/datum/sprite_accessory/hair/gnomish_f
	name = "Gnomish"
	icon_state = "gnomish_f" // original name bun_grandma
	gender = FEMALE
	specuse = list("dwarf")

/datum/sprite_accessory/hair/hearth_f
	name = "Hearth"
	icon_state = "hearth_f" // original name ponytail_fox
	gender = FEMALE
	specuse = list("dwarf")

/datum/sprite_accessory/hair/homely
	name = "Homely"
	icon_state = "homely_f"
	gender = FEMALE
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling", "halforc")

/datum/sprite_accessory/hair/junia
	name = "Junia"
	icon_state = "junia_tief_f" // modified hime_updo
	gender = FEMALE
	specuse = list("tiefling")

/datum/sprite_accessory/hair/lady
	name = "Lady"
	icon_state = "lady_f" // original name newyou
	gender = FEMALE
	specuse = list("human", "elf", "tiefling")

/datum/sprite_accessory/hair/loosebraid
	name = "Loose Braid"
	icon_state = "loosebraid_f"
	gender = FEMALE
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling", "halforc")

/datum/sprite_accessory/hair/maiden
	name = "Maiden"
	icon_state = "maiden_f"
	gender = FEMALE
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling", "halforc")

/datum/sprite_accessory/hair/maid
	name = "Maid"
	icon_state = "maid_f"
	gender = FEMALE
	specuse = list("human", "dwarf", "aasimar", "tiefling")

/datum/sprite_accessory/hair/majestic_dwarf_F
	name = "Majestiq"
	icon_state = "majestic_dwarf"
	gender = FEMALE
	specuse = list("dwarf")

/datum/sprite_accessory/hair/majestic_f
	name = "Majestic"
	icon_state = "majestic_f"
	gender = FEMALE
	specuse = list("human")

/datum/sprite_accessory/hair/matron
	name = "Matron"
	icon_state = "matron"
	gender = FEMALE
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling", "halforc")

/datum/sprite_accessory/hair/messy
	name = "Messy"
	icon_state = "messy_f"
	gender = FEMALE
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling", "halforc")

/datum/sprite_accessory/hair/mysterious_elf
	name = "Mysterious"
	icon_state = "mysterious_elf" // modified hime_long
	gender = FEMALE
	specuse = list("elf")

/datum/sprite_accessory/hair/mystery
	name = "Mystery"
	icon_state = "mystery_f" // modified hime_long
	gender = FEMALE
	specuse = list("human", "dwarf", "aasimar", "tiefling", "halforc")

/datum/sprite_accessory/hair/noblesse
	name = "Noblesse"
	icon_state = "noblesse_f" // modified sidetail
	gender = FEMALE
	specuse = list("human")

/datum/sprite_accessory/hair/nun
	name = "Nun"
	icon_state = "nun"
	gender = FEMALE
	specuse = list("human", "dwarf", "aasimar", "tiefling", "halforc")

/datum/sprite_accessory/hair/performer
	name = "Performer"
	icon_state = "performer_tief_f" // modified drillruru_long
	gender = FEMALE
	specuse = list("tiefling")

/datum/sprite_accessory/hair/pix
	name = "Pixie"
	icon_state = "pixie_f"
	gender = FEMALE
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling", "halforc")

/datum/sprite_accessory/hair/plain
	name = "Plain"
	icon_state = "plain_f"
	gender = FEMALE
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling", "halforc")

/datum/sprite_accessory/hair/princess
	name = "Princess"
	icon_state = "princess"
	gender = FEMALE
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling", "halforc")

/datum/sprite_accessory/hair/queen
	name = "Queenly"
	icon_state = "queenly_f"
	gender = FEMALE
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling", "halforc")

/datum/sprite_accessory/hair/rapunzel
	name = "Rapunzel"
	icon_state = "rapunzel"
	gender = FEMALE
	specuse = list("human", "elf", "aasimar", "tiefling", "halforc")

/datum/sprite_accessory/hair/rose
	name = "Rose"
	icon_state = "rose"
	gender = FEMALE
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling", "halforc")

/datum/sprite_accessory/hair/roughtails
	name = "Roughtails"
	icon_state = "roughtails" // modified african_pigtails
	gender = FEMALE
	specuse = list("aasimar", "abyssariad")

/datum/sprite_accessory/hair/shrine
	name = "Shrinekeeper"
	icon_state = "shrine_f"
	gender = FEMALE
	specuse = list("elf", "tiefling")

/datum/sprite_accessory/hair/soilbride
	name = "Soilbride"
	icon_state = "soilbride_f"
	gender = FEMALE
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling", "halforc")

/datum/sprite_accessory/hair/spicy
	name = "Spicy"
	icon_state = "spicy"
	gender = FEMALE
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling", "halforc")

/datum/sprite_accessory/hair/squire_f
	name = "Squire"
	icon_state = "squire_f" // original name ponytail_rynn
	gender = FEMALE
	specuse = list("human")

/datum/sprite_accessory/hair/tails
	name = "Tails"
	icon_state = "tails_f"
	gender = FEMALE
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling", "halforc")

/datum/sprite_accessory/hair/tied_pony
	name = "Tied Ponytail"
	icon_state = "tied_f"
	gender = FEMALE
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling", "halforc")

/datum/sprite_accessory/hair/tiedup
	name = "Tied Up"
	icon_state = "tiedup_f"
	gender = FEMALE
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling", "halforc")

/datum/sprite_accessory/hair/tiedcutf
	name = "Tied Sidecut"
	icon_state = "tsidecut"
	gender = FEMALE
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling", "halforc")

/datum/sprite_accessory/hair/tomboy
	name = "Tomboy"
	icon_state = "tomboy"
	gender = FEMALE
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling", "halforc")

/datum/sprite_accessory/hair/updo
	name = "Updo"
	icon_state = "updo_f"
	gender = FEMALE
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling", "halforc")

/datum/sprite_accessory/hair/wisp
	name = "Wisp"
	icon_state = "wisp_f"
	gender = FEMALE
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling", "halforc")

/datum/sprite_accessory/hair/willow
	name = "Willow"
	icon_state = "willow"
	gender = FEMALE
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling", "halforc")



//////////////////////////////
// UNISEX Hair Definitions  //
//////////////////////////////

/datum/sprite_accessory/hair/baum
	name = "Baum"
	icon_state = "baum"
	gender = NEUTER
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling", "halforc")

/datum/sprite_accessory/hair/birdnest
	name = "Birdnest"
	icon_state = "birdnest"
	gender = NEUTER
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling", "halforc")

/datum/sprite_accessory/hair/chastity
	name = "Chastity"
	icon_state = "chastity"
	gender = NEUTER
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling", "halforc")

/datum/sprite_accessory/hair/dawn
	name = "Dawn"
	icon_state = "dawn"
	gender = NEUTER
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling", "halforc")

/datum/sprite_accessory/hair/fluffy
	name = "Fluffy"
	icon_state = "fluffy"
	gender = NEUTER
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling", "halforc")

/datum/sprite_accessory/hair/helmet
	name = "Helmet Hair"
	icon_state = "helmet"
	gender = NEUTER
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling", "halforc")

/datum/sprite_accessory/hair/herder
	name = "Herder"
	icon_state = "herder"
	gender = NEUTER
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling", "halforc")

/datum/sprite_accessory/hair/highlander
	name = "Highlander"
	icon_state = "highlander"
	gender = NEUTER
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling", "halforc")

/datum/sprite_accessory/hair/jape
	name = "Jape"
	icon_state = "jape"
	gender = NEUTER
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling", "halforc")

/datum/sprite_accessory/hair/majestic_elf
	name = "Majestie"
	icon_state = "majestic_elf"
	gender = NEUTER
	specuse = list("elf")

/datum/sprite_accessory/hair/martial
	name = "Martial"
	icon_state = "martial"
	gender = NEUTER
	specuse = list("aasimar")

/datum/sprite_accessory/hair/miller
	name = "Miller"
	icon_state = "miller"
	gender = NEUTER
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling", "halforc")

/datum/sprite_accessory/hair/runt
	name = "Runt"
	icon_state = "runt"
	gender = NEUTER
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling", "halforc")

/datum/sprite_accessory/hair/royalcurls
	name = "Royal Curls"
	icon_state = "royalcurls"
	gender = NEUTER
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling", "halforc")

/datum/sprite_accessory/hair/shaved
	name = "Shaved"
	icon_state = "shaved"
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling", "halforc")
	gender = NEUTER
	under_layer = TRUE

/datum/sprite_accessory/hair/towner
	name = "Towner"
	icon_state = "towner"
	gender = NEUTER
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling", "halforc")

/datum/sprite_accessory/hair/trapper
	name = "Trapper"
	icon_state = "trapper"
	gender = NEUTER
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling", "halforc")

/datum/sprite_accessory/hair/uncombed
	name = "Uncombed"
	icon_state = "uncombed"
	gender = NEUTER
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling", "halforc")

/datum/sprite_accessory/hair/wastrel
	name = "Wastrel"
	icon_state = "wastrel"
	gender = NEUTER
	specuse = list("human", "elf", "aasimar", "tiefling", "halforc")

/datum/sprite_accessory/hair/wilderness
	name = "Wilderness"
	icon_state = "wilderness"
	gender = NEUTER
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling", "halforc")

/datum/sprite_accessory/hair/witcher
	name = "Witcher"
	icon_state = "witcher"
	gender = NEUTER
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling", "halforc")





/////////////////////////////
// Facial Hair Definitions //
/////////////////////////////

/datum/sprite_accessory/facial_hair
	icon = 'icons/roguetown/mob/facial.dmi'
	gender = MALE
	specuse = ALL_RACES_WITH_FACIALHAIR

/datum/sprite_accessory/facial_hair/none
	name = "None"
	icon_state = ""
	gender = FEMALE
	specuse = ALL_RACES_FOR_REAL

/datum/sprite_accessory/facial_hair/shaved
	name = "None"
	icon_state = "facial_shaven"
	specuse = ALL_RACES_FOR_REAL

/datum/sprite_accessory/facial_hair/brew
	name = "Brew"
	icon_state = "facial_moonshiner"

/datum/sprite_accessory/facial_hair/chops
	name = "Choppe"
	icon_state = "facial_muttonmus"

/datum/sprite_accessory/facial_hair/chin
	name = "Clean Chin"
	icon_state = "facial_chin"

/datum/sprite_accessory/facial_hair/braided
	name = "Dignitary"
	icon_state = "braided"
	specuse = list("dwarf")

/datum/sprite_accessory/facial_hair/manly
	name = "Drinker"
	icon_state = "facial_manly"

/datum/sprite_accessory/facial_hair/fullbeard
	name = "Full Beard"
	icon_state = "facial_fullbeard"

/datum/sprite_accessory/facial_hair/cousin
	name = "Fullest Beard"
	icon_state = "facial_brokenman"

/datum/sprite_accessory/facial_hair/knightly
	name = "Knightly"
	icon_state = "facial_knightly"

/datum/sprite_accessory/facial_hair/know
	name = "Knowledge"
	icon_state = "facial_wise"

/datum/sprite_accessory/facial_hair/fiveoclockm
	name = "Mustache"
	icon_state = "facial_5oclockmoustache"

/datum/sprite_accessory/facial_hair/pick
	name = "Pick"
	icon_state = "facial_longbeard"

/datum/sprite_accessory/facial_hair/pipe
	name = "Pipesmoker"
	icon_state = "facial_pipe"

/datum/sprite_accessory/facial_hair/viking
	name = "Raider"
	icon_state = "facial_viking"

/datum/sprite_accessory/facial_hair/ranger
	name = "Ranger"
	icon_state = "facial_dwarf"

/datum/sprite_accessory/facial_hair/vandyke
	name = "Rumata"
	icon_state = "facial_vandyke"

/datum/sprite_accessory/facial_hair/burns
	name = "Sideburns"
	icon_state = "facial_burns"

/datum/sprite_accessory/facial_hair/hermit
	name = "Wise Hermit"
	icon_state = "facial_moonshiner"


/mob/living/simple_animal/hostile/haunt
	alpha = 180
	maxHealth = 50
	health = 50
	stat_attack = UNCONSCIOUS

	speed = 1
	move_to_delay = 5 //delay for the automated movement.
	melee_damage_lower = 15
	melee_damage_upper = 20
	speak_emote = list("groans")
	defdrain = 20

	base_fortune = 11
	base_constitution = 6
	base_strength = 6
	base_speed = 12

	simple_detect_bonus = 20

	defprob = 35

	del_on_deaggro = 30 MINUTES
	dodgetime = 17

	///this mob was updated to new ai
	AIStatus = AI_OFF
	can_have_ai = FALSE
	ai_controller = /datum/ai_controller/spider
