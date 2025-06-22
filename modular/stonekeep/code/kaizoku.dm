/*
species_accent
get_accent_list()
/datum/species/dwarf/mountain/get_accent_list()
	return strings("SKgrenzelhoft_replacement.json", "dwarf")
*/



#define HEAD_EXCEPT_EYES	(HEAD | NOSE | EARS | HAIR)
//Kaizoku Assets.

#define CLOTHING_RONIN	 		"#861e1e"
#define CLOTHING_EIDOLON		"#613a3f"
#define CLOTHING_TOWERYAKKO		"#804d97"
#define CLOTHING_KABUKIMONO		"#9b874f"

#define CLOTHING_TIDEWEAVER		"#be8b48"
#define CLOTHING_PURIFIER		"#346c81"
#define CLOTHING_CURATOR		"#bd3541"

//Kaizoku Assets.

#define MANCATCHER				/datum/intent/polearm/thrust/mancatcher



// =================================================================
// =====================	STRUCTURE	============================

/obj/structure/frontierjustice
	name = "frontier justice"
	desc = "The manifestation extrajudicidal punishment by vigilantism, or performed by evil doers to instill fear. One may never know."
	icon = 'modular/stonekeep/kaizoku/icons/mapset/frontierjustice.dmi'
	icon_state = "edgy1"
	anchored = TRUE
	density = FALSE
	opacity = 0
	blade_dulling = DULLING_CUT
	max_integrity = 50
	layer = ABOVE_OBJ_LAYER
	destroy_sound = 'sound/foley/bodyfall (1).ogg'

/obj/structure/frontierjustice/Initialize()
	. = ..()
	icon_state = "edgy[rand(1,5)]"

/obj/structure/frontierjustice/examine_status(mob/user)
	if(max_integrity)
		var/healthpercent = (obj_integrity/max_integrity) * 100
		switch(healthpercent)
			if(50 to 99)
				return  "The flesh is still in place."
			if(25 to 50)
				return  "Damage has set its toll."
			if(1 to 25)
				return  "<span class='warning'>The corpse is almost butchered.</span>"

/obj/structure/frontierjustice/Destroy()
	var/turf/T = loc
	if(isturf(T)) // Ensure `T` is a valid turf
		var/obj/item/reagent_containers/food/snacks/meat/steak/meat_piece = new(T)
		if(meat_piece)
			meat_piece.name = "humen meat" //funny
	. = ..()

/obj/structure/frontierjustice/dead
	name = "fated as you"
	desc = "Killed off and left to rot."
	icon_state = "dead1"
	destroy_sound = 'sound/combat/dismemberment/dismem (1).ogg'

/obj/structure/frontierjustice/dead/Initialize()
	. = ..()
	icon_state = "dead1" //had to put that otherwise OG frontier justice would kill it off

/obj/structure/frontierjustice/canibalism
	name = "the meal"
	desc = "Poor victim of the greenskins or wood elven."
	icon_state = "cannibalism1"
	destroy_sound = 'sound/combat/dismemberment/dismem (1).ogg'

/obj/structure/frontierjustice/canibalism/Initialize()
	. = ..()
	icon_state = "cannibalism[rand(1,2)]"

/obj/structure/frontierjustice/canibalism/Destroy()
	var/turf/T = loc
	if(isturf(T)) // Ensure `T` is a valid turf
		var/obj/item/reagent_containers/food/snacks/cooked/frysteak/meat_piece = new(T)
		if(meat_piece)
			meat_piece.name = "cooked humen meat" //funny
			meat_piece.desc = "A slab of manflesh, slow-cooked over glowing coals."
	. = ..()

/obj/structure/frontierjustice/crossed
	name = "believer"
	desc = "If one forgot the meaning of some religious symbols, surely this will remind them."
	icon_state = "crossed1"
	destroy_sound = 'sound/foley/breaksound.ogg'

/obj/structure/frontierjustice/crossed/Initialize()
	. = ..()
	icon_state = "crossed[rand(1,3)]"

/obj/structure/frontierjustice/caged
	name = "cage"
	desc = "Better check if someone is already inside, awaiting for salvation that never came."
	icon_state = "cage1"
	destroy_sound = 'sound/combat/hits/blunt/metalblunt (2).ogg'

/obj/structure/frontierjustice/caged/Initialize()
	. = ..()
	icon_state = "cage[rand(1,3)]"

/obj/structure/frontierjustice/caged/Destroy()
	. = ..()


// =================================================================
// ========================		TURF	============================

/turf/closed/wall/mineral/stone/abyssal
	name = "ishigaki wall"
	desc = "Stone locked into stone with pressure alone, each corner interconnected, as wall that shakes yet does not slide will never break like mortar do."
	//icon = 	'modular/stonekeep/kaizoku/icons/tileset/abyssalstone.dmi'
	//icon_state = MAP_SWITCH("abyssal", "abyssal-0")
	icon = 	'modular/stonekeep/kaizoku/icons/tileset/spine_alt.dmi'
	icon_state = MAP_SWITCH("spine", "spine-0")
	sheet_type = /obj/item/natural/stone
	break_sound = 'sound/combat/hits/onstone/stonedeath.ogg'
	attacked_sound = list('sound/combat/hits/onstone/wallhit.ogg', 'sound/combat/hits/onstone/wallhit2.ogg', 'sound/combat/hits/onstone/wallhit3.ogg')
	above_floor = /turf/open/floor/blocks
	baseturfs = list(/turf/open/floor/blocks)
	climbdiff = 1
	damage_deflection = 10

/turf/closed/wall/mineral/stone/abyssal/window
	name = "ishigaki window"
	desc = "A wound upon the wall rimmed into a sacred vacancy, where Abyssor's sigil watches the impure."
	opacity = FALSE
	max_integrity = 800

/turf/closed/wall/mineral/stone/window/CanPass(atom/movable/mover, turf/target)
	if(istype(mover) && ((mover.pass_flags & PASSTABLE) || (mover.pass_flags & PASSGRILLE)) )
		return 1
	return ..()

/turf/closed/wall/mineral/stone/abyssal/window/Initialize()
	. = ..()
	icon_state = "spine"
	var/mutable_appearance/M = mutable_appearance(icon, "spinehole", layer = ABOVE_NORMAL_TURF_LAYER)
	add_overlay(M)

/turf/closed/wall/mineral/stone/abyssal/external
	name = "external ishigaki wall"
	icon = 'modular/stonekeep/kaizoku/icons/tileset/spine.dmi'

/turf/closed/wall/mineral/stone/abyssal/external/window
	opacity = FALSE
	max_integrity = 800

/turf/closed/wall/mineral/stone/abyssal/external/window/CanPass(atom/movable/mover, turf/target)
	if(istype(mover) && ((mover.pass_flags & PASSTABLE) || (mover.pass_flags & PASSGRILLE)) )
		return 1
	return ..()

/turf/closed/wall/mineral/stone/abyssal/external/window/Initialize()
	. = ..()
	icon_state = "spine"
	var/mutable_appearance/M = mutable_appearance(icon, "spinehole", layer = ABOVE_NORMAL_TURF_LAYER)
	add_overlay(M)

/turf/closed/wall/mineral/wood/abyssal
	name = "wagoya wall"
	desc = "Wooden wall of abyssal architecture that uses wooden joinery that fits together seamlessly."
	icon = 	'modular/stonekeep/kaizoku/icons/tileset/vectorial.dmi'
	icon_state = "vectorial"
	break_sound = 'sound/combat/hits/onwood/destroywalldoor.ogg'
	attacked_sound = list('sound/combat/hits/onwood/woodimpact (1).ogg','sound/combat/hits/onwood/woodimpact (2).ogg')
	above_floor = /turf/open/floor/woodturned
	baseturfs = list(/turf/open/floor/woodturned)
	neighborlay = "dirtedge"
	climbdiff = 3

/turf/closed/wall/mineral/wood/abyssal/window
	name = "wagoya no sama"
	desc = "A murderhole on a wooden wall that lacks nails and screws."
	opacity = FALSE
	max_integrity = 550

/turf/closed/wall/mineral/wood/abyssal/window/CanPass(atom/movable/mover, turf/target)
	if(istype(mover) && ((mover.pass_flags & PASSTABLE) || (mover.pass_flags & PASSGRILLE)) )
		return 1
	return ..()

/turf/closed/wall/mineral/wood/abyssal/window/Initialize()
	. = ..()
	var/mutable_appearance/M = mutable_appearance(icon, "vectoryehole", layer = ABOVE_NORMAL_TURF_LAYER)
	add_overlay(M)

/turf/closed/wall/mineral/wood/fractal
	name = "fractal wall"
	desc = "Lattice of recursion intersecting in a fractal geometry, portraying the holy spiral."
	icon = 	'modular/stonekeep/kaizoku/icons/tileset/fractal.dmi'
	icon_state = MAP_SWITCH("fractal", "fractal-0")
	blade_dulling = DULLING_BASHCHOP
	max_integrity = 1100
	break_sound = 'sound/combat/hits/onwood/destroywalldoor.ogg'
	attacked_sound = list('sound/combat/hits/onwood/woodimpact (1).ogg','sound/combat/hits/onwood/woodimpact (2).ogg')
//	sheet_type = /obj/item/grown/log/tree/lumber
	above_floor = /turf/open/floor/ruinedwood
	baseturfs = list(/turf/open/floor/ruinedwood)
	neighborlay = "dirtedge"
	climbdiff = 3
	explosion_block = 4
	hardness = 7

	burn_power = 200
	spread_chance = 0.8

/turf/closed/wall/mineral/wood/fractal/window
	name = "fractal window"
	desc = "Lattice of recursion intersecting in the shape of a opening, showing the symbol of Abyssanctum."
	opacity = FALSE
	max_integrity = 550

/turf/closed/wall/mineral/wood/fractal/window/CanPass(atom/movable/mover, turf/target)
	if(istype(mover) && ((mover.pass_flags & PASSTABLE) || (mover.pass_flags & PASSGRILLE)) )
		return 1
	return ..()

/turf/closed/wall/mineral/wood/fractal/window/Initialize()
	. = ..()
	var/mutable_appearance/M = mutable_appearance(icon, "fractalhole", layer = ABOVE_NORMAL_TURF_LAYER)
	add_overlay(M)

/turf/closed/wall/mineral/stone/gladiatora
	name = "coliseum wall"
	desc = "Sand dunes compacted from consecrated pain. It thirsts not for water, but for blood. FEED IT."
	icon = 	'modular/stonekeep/kaizoku/icons/tileset/gladiatora.dmi'
	icon_state = MAP_SWITCH("gladiatora", "gladiatora-0")
	sheet_type = /obj/item/natural/dirtclod
	break_sound = 'sound/combat/hits/onstone/stonedeath.ogg'
	attacked_sound = list('sound/combat/hits/onstone/wallhit.ogg', 'sound/combat/hits/onstone/wallhit2.ogg', 'sound/combat/hits/onstone/wallhit3.ogg')
	above_floor = /turf/open/floor/blocks
	baseturfs = list(/turf/open/floor/blocks)
	climbdiff = 0
	damage_deflection = 10

/turf/closed/wall/mineral/stone/gladiatora/window
	name = "coliseum window"
	desc = "A wound upon the compacted dunes. ARE YOU NOT ENTERTAINED?"
	opacity = FALSE
	max_integrity = 800

/turf/closed/wall/mineral/stone/gladiatora/CanPass(atom/movable/mover, turf/target)
	if(istype(mover) && ((mover.pass_flags & PASSTABLE) || (mover.pass_flags & PASSGRILLE)) )
		return 1
	return ..()

/turf/closed/wall/mineral/stone/gladiatora/window/Initialize()
	. = ..()
	var/mutable_appearance/M = mutable_appearance(icon, "gladiatorahole", layer = ABOVE_NORMAL_TURF_LAYER)
	add_overlay(M)

// =================================================================
// ========================	STORAGE	================================

/obj/item/storage/belt/kaizoku/leather/daisho
	name = "daisho belt"
	desc = "A oil-boiled reinforced silk or leather belt used by Abyssariads for practicing Daisho."
	icon_state = "daisho"
	sellprice = 5
	icon = 'modular/stonekeep/kaizoku/icons/clothingicon/belts.dmi'
	mob_overlay_icon ='modular/stonekeep/kaizoku/icons/clothing/belts.dmi'

/obj/item/storage/belt/kaizoku/leather/daisho/random/Initialize()
	color = pick(GLOB.peasant_dyes)
	..()

/obj/item/storage/belt/kaizoku/leather/daisho/ninja/PopulateContents()
	new /obj/item/reagent_containers/food/snacks/fogdart(src)
	new /obj/item/reagent_containers/food/snacks/fogdart(src)
	new /obj/item/weapon/tetsubishi(src)

/obj/item/storage/belt/kaizoku/leather/daisho/tideweaver
	name = "tideweaver daisho belt"
	color = CLOTHING_TIDEWEAVER

/obj/item/storage/belt/kaizoku/leather/daisho/purifier
	name = "ocean daisho belt"
	color = CLOTHING_PURIFIER

/obj/item/storage/belt/kaizoku/leather/daisho/curator
	name = "island daisho belt"
	color = CLOTHING_CURATOR

/obj/item/storage/backpack/satchel/ninja/PopulateContents()
	new /obj/item/grenade/smoke_bomb(src)
	new /obj/item/grenade/smoke_bomb/poison(src)
	new /obj/item/throwing_star/ninja(src)



// =============================================================================
// ========================	SPRITE ACCESSORIES	================================
/*
/datum/sprite_accessory/underwear/male_fundoshi
	name = "Mendoshi"
	icon_state = "male_fundoshi"
	gender = MALE
	specuse = list("abyssariad")
	roundstart = TRUE
	use_static = TRUE
	icon = 'modular/stonekeep/kaizoku/icons/clothing/underwear.dmi'
*/
/datum/sprite_accessory/underwear/male_fundoshi/female
	name = "Femdoshi"
	icon_state = "female_fundoshi"
	gender = FEMALE
	specuse = list("abyssariad")
	roundstart = TRUE
	use_static = TRUE


// Kaizoku bodyparts
// ACCESORIES ARE DEPRECATED. USE SPRITE ACCESSORY AND ORGANS.



// END OF KAIZOKU RACES BODYPARTS
/* Issues? ROGTODO
/datum/sprite_accessory/detail
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling", "halforc", "abyssariad")

/datum/sprite_accessory/detail/irezumi
	icon = 'modular/stonekeep/kaizoku/icons/body_details/attachment.dmi'
	name = "Blademaster Irezumi"
	icon_state = "blademaster"
	specuse = list("human", "abyssariad") //Humens are getting irezumis due to heartfelt.

/datum/sprite_accessory/detail/irezumi/champion
	icon = 'modular/stonekeep/kaizoku/icons/body_details/attachment.dmi'
	name = "Champion Irezumi"
	icon_state = "champion"

/datum/sprite_accessory/detail/irezumi/monk
	icon = 'modular/stonekeep/kaizoku/icons/body_details/attachment.dmi'
	name = "Monk Irezumi"
	icon_state = "monk"

/datum/sprite_accessory/detail/irezumi/seduction
	icon = 'modular/stonekeep/kaizoku/icons/body_details/attachment.dmi'
	name = "Eyes Irezumi"
	icon_state = "seduction"

/datum/sprite_accessory/detail/irezumi/seductionalt
	icon = 'modular/stonekeep/kaizoku/icons/body_details/attachment.dmi'
	name = "Side-eyes Irezumi"
	icon_state = "seductionalt"

/datum/sprite_accessory/detail/irezumi/warrior
	icon = 'modular/stonekeep/kaizoku/icons/body_details/attachment.dmi'
	name = "Abyss Warrior Irezumi"
	icon_state = "warrior"
*/

/datum/outfit/job/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	. = ..()
	if(H.mind)
		if(H.dna)
			if(H.dna.species)
				if(H.dna.species.id == "abyssariad")
					H.verbs |= /mob/proc/throatsing
					H.verbs |= /mob/living/carbon/human/proc/abyssalcombat
					H.verbs |= /mob/proc/abyssaltide
					H.cmode_music = 'modular/stonekeep/kaizoku/sound/combat/combat_traditional.ogg'
					ADD_TRAIT(H, TRAIT_KAIZOKU, TRAIT_GENERIC)
					if(H.dna.species.name == "Changeling")
						H.verbs |= /mob/living/carbon/human/proc/toggle_changeling_maw
						//H.verbs |= /mob/living/carbon/human/proc/toggle_shapeshift // Not done. The idea is for changelings to choose their specialization later.
						//H.verbs |= /mob/living/carbon/human/proc/toggle_mimicry //This one isn't working.
						ADD_TRAIT(H, TRAIT_CHANGELING_METABOLISM, TRAIT_GENERIC) //Both an advantage and a disadvantage, essentially carnivore code + Venom bite.
						ADD_TRAIT(H, TRAIT_BEAUTIFUL, TRAIT_GENERIC) //Mythology Kitsune trope //hopefully// done right. Seduction may go a long way to KILL victims.
						// please. Don't make me feel like I did a wrong move here. I swear to INARI. You people fucked up too much for my taste.
					if(H.dna.species.name == "Skylancer")
						H.verbs |= /mob/proc/birdcall
						H.verbs |= /mob/living/carbon/human/proc/fly
						H.verbs |= /mob/living/carbon/human/proc/fly_up
					if(H.dna.species.name == "Ogrun")
						H.verbs |= /mob/living/carbon/human/proc/warcry
				if(H.dna.species.name == "Undine") //undine ability; Making below-average armor with normal random things/butchered goods.
					H.verbs |= /mob/living/carbon/human/proc/abyssalcombat
					H.cmode_music = 'modular/stonekeep/kaizoku/sound/combat/combat_traditional.ogg'
					ADD_TRAIT(H, TRAIT_KAIZOKU, TRAIT_GENERIC)
					H.mind.teach_crafting_recipe(/datum/crafting_recipe/reinforcedarmor)
					H.mind.teach_crafting_recipe(/datum/crafting_recipe/reinforcedhelmet)
					H.mind.teach_crafting_recipe(/datum/crafting_recipe/mediumhelmet)
					H.mind.teach_crafting_recipe(/datum/crafting_recipe/mediumarmor)
					H.mind.teach_crafting_recipe(/datum/crafting_recipe/lighthelmet)
					H.mind.teach_crafting_recipe(/datum/crafting_recipe/lightarmor)
					H.mind.teach_crafting_recipe(/datum/crafting_recipe/obsidian_spear)
					H.mind.teach_crafting_recipe(/datum/crafting_recipe/obsidian_club)
					H.verbs |= /mob/proc/croak

/* Add to kaizok jobs
	if(H.dna.species.id == "human")
		H.skin_tone = SKIN_COLOR_TROPICALDRY
		ADD_TRAIT(H, TRAIT_KAIZOKU, TRAIT_GENERIC)
		H.grant_language(/datum/language/abyssal)
*/

/datum/stressevent/raider
	timer = 1 MINUTES
	stressadd = 1
	desc = "<span class='red'>Vicious sea raider, they prey on fellow men.</span>"

/datum/stressevent/whaler
	timer = 1 MINUTES
	stressadd = 1
	desc = "<span class='red'>Filthy corrupted whaler. Never forget the Storm Lord.</span>"

// TODO: Employ this tongue so they can open and close their spooky maws
/obj/item/organ/tongue/kitsune
	name = "changeling tongue"
	desc = "The tongue that inwardly bends the moldable changeling skull into a glasgow smile, or other shapes depending on their branch."
	icon = 'modular/stonekeep/kaizoku/icons/misc/surgery.dmi'
	icon_state = "eldritch"
	slot = ORGAN_SLOT_TONGUE
	zone = BODY_ZONE_PRECISE_MOUTH
	slot = ORGAN_SLOT_TONGUE

/obj/item/organ/eyes/rogue/tengu
	name = "tengu eyes"
	eye_icon_state = "tengu_eye"
	icon = 'modular/stonekeep/kaizoku/icons/misc/surgery.dmi'
	mob_overlay_icon = 'modular/stonekeep/kaizoku/icons/misc/surgery_mob.dmi'
	icon_state = "tengu_eye"

/mob/living/carbon/human/species/abyssariad/raider/stripPanelUnequip(obj/item/what, mob/living/who, where)
	if(istype(who, /mob/living))
		if(who.abyssariadraider == TRUE && who.stat == CONSCIOUS) //If they are unconscious, you can loot them.
			src.visible_message(
				"<span class='danger'>[who] grabs [src]'s exposed arm before slamming them on the ground!</span>")
			src.AdjustKnockdown(5 + rand(3, 5))
			src.apply_damage(rand(5, 10), BRUTE, BODY_ZONE_CHEST)
			playsound(get_turf(src), 'sound/combat/shieldraise.ogg', 100, TRUE)
			if(length(GLOB.custodian_handsoff))
				who.say(pick(GLOB.custodian_handsoff))
			return
	..()

//Furnitune

/obj/structure/chair/bench/fogland
	name = "foreigner couch"
	desc = "Cushioned couch made from silken threads and expensive, reddish tropical wood."
	icon_state = "abyssanctumthrone"
	icon = 'modular/stonekeep/kaizoku/icons/mapset/frontierjustice32.dmi'

/obj/structure/chair/bench/fogland/stone
	name = "foreigner throne"
	desc = "Stoneblock that was chiseled into the shape of a chair."
	icon_state = "abyssalthrone_2"

/obj/structure/chair/bench/fogland/abyssal
	name = "purifier bench"
	desc = "Among the purifiers, some degree of comfort can be ensured."
	icon_state = "abyssalbench"

/obj/structure/chair/bench/fogland/sand
	name = "sandstone bench"
	desc = "Simple, cheap bench made out of compacted, burnt sand."
	icon_state = "sandstonebench"

/obj/structure/chair/bench/fogland/stone
	name = "abyssanctum bench"
	desc = "Padded bench to provide great comfort for the restless abyssal fold."
	icon_state = "abyssalbench_2"

/obj/structure/bed/wool/futon
	name = "foreigner futon"
	desc = "A bedding made from many tatami layering and cloth that can be aired to keep it free of mites and mold."
	icon_state = "futon"
	icon = 'modular/stonekeep/kaizoku/icons/mapset/frontierjustice32.dmi'

/obj/structure/chair/wood/foglander
	name = "foreigner chair"
	icon_state = "abyssalchair"
	desc = "Smooth chair made out of reddish, expensive tropical woods."
	icon = 'modular/stonekeep/kaizoku/icons/mapset/frontierjustice32.dmi'
	resistance_flags = FLAMMABLE
	max_integrity = 70
	buildstacktype = null
	buildstackamount = 0
	item_chair = null
	anchored = FALSE

/obj/structure/well/shishiodoshi
	name = "demon frightener" //deerscare
	desc = "Water fountain used in gardens, making windstalks bash against an argentite ore, creating an almost imperceptible sound that makes demons uncomfortable."
	icon = 'modular/stonekeep/kaizoku/icons/mapset/frontierjustice32.dmi'
	icon_state = "shishiodoshi"
	layer = BELOW_MOB_LAYER
	var/openwater = TRUE

/obj/structure/well/shishiodoshi/attack_hand(mob/living/user)
	update_icon()
	return

/obj/structure/well/shishiodoshi/update_icon()
	. = ..()
	cut_overlays()
	if(openwater == TRUE)
		icon_state = "shishiodoshi_stop"
		openwater = FALSE
	else
		icon_state = "shishiodoshi"
		openwater = TRUE

/obj/structure/well/shishiodoshi/onbite(mob/user)
	if(isliving(user))
		var/mob/living/L = user
		if(L.stat != CONSCIOUS)
			return
		if(iscarbon(user))
			var/mob/living/carbon/C = user
			if(C.is_mouth_covered())
				return
		if(src.openwater == FALSE)
			user.visible_message(span_info("[user] attempts to drink water from a closed [src]. Foolish."))
			return
		playsound(user, pick('sound/foley/waterwash (1).ogg','sound/foley/waterwash (2).ogg'), 100, FALSE)
		user.visible_message(span_info("[user] starts to drink from [src]."))
		if(do_after(L, 2.5 SECONDS, src))
			var/datum/reagents/reagents = new()
			reagents.add_reagent_list(list(/datum/reagent/water = 2))
			reagents.trans_to(L, reagents.total_volume, transfered_by = user, method = INGEST)
			playsound(user,pick('sound/items/drink_gen (1).ogg','sound/items/drink_gen (2).ogg','sound/items/drink_gen (3).ogg'), 100, TRUE)
		return
	..()

/obj/structure/well/shishiodoshi/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/reagent_containers/glass/bucket))
		var/obj/item/reagent_containers/glass/bucket/W = I
		if(W.reagents.holder_full())
			to_chat(user, "<span class='warning'>[W] is full.</span>")
			return
		if(do_after(user, 6 SECONDS, src))
			var/list/waterl = list(/datum/reagent/water = 100)
			W.reagents.add_reagent_list(waterl)
			to_chat(user, "<span class='notice'>I fill [W] from [src].</span>")
			playsound(user, pick('sound/foley/waterwash (1).ogg','sound/foley/waterwash (2).ogg'), 80, FALSE)
			return
	else ..()

/obj/structure/bed/bedbox
	name = "box-bed"
	desc = "Traditional enclosed bed used by foglander forces for protection against assassinations and demonic surprise attacks, now in custodian hands."
	icon = 'modular/stonekeep/kaizoku/icons/mapset/frontierjustice32.dmi'
	icon_state = "boxbed"
	layer = OBJ_LAYER
	resistance_flags = FLAMMABLE //Has too much wood to be fireproof, even if it has iron on it.
	max_integrity = 400 //Will resist damage to a degree. Cannot be comparable to walls, but it will take enough time to wake up the person inside if attacked.
	integrity_failure = 0.35
	anchored = TRUE
	density = TRUE
	can_buckle = TRUE
	buckle_lying = 90
	sleepy = 3
	buckleverb = "lay"
	debris = list(/obj/item/natural/wood/plank = 1)

	var/base_icon_state = "boxbed"
	var/opened = TRUE
	var/locked = FALSE
	var/welded = FALSE
	var/mob_storage_capacity = 1
	var/storage_capacity = 10
	var/open_sound = 'sound/misc/chestopen.ogg'
	var/close_sound = 'sound/misc/chestclose.ogg'
	var/open_sound_volume = 50
	var/close_sound_volume = 50

/obj/structure/bed/bedbox/Initialize()
	. = ..()
	update_icon()
	if(!opened)
		addtimer(CALLBACK(src, PROC_REF(take_contents)), 0)

/obj/structure/bed/bedbox/update_icon()
	cut_overlays()
	icon_state = "[base_icon_state][opened ? "_open" : ""]"
	if(opened)
		add_overlay("boxbed_open_in")
		density = FALSE
	else
		add_overlay("boxbed_close_in")
		density = TRUE

	if(!opened && islist(buckled_mobs) && buckled_mobs.len)
		var/mutable_appearance/cover = mutable_appearance(icon, "boxbed_close_in")
		cover.layer = ABOVE_MOB_LAYER
		add_overlay(cover)

/obj/structure/bed/bedbox/post_buckle_mob(mob/living/M)
	. = ..()
	if(!opened)
		M.forceMove(src)
	update_icon()

/obj/structure/bed/bedbox/proc/ensure_inside()
	for(var/mob/living/M in buckled_mobs)
		if(M.loc != src)
			M.forceMove(src)

/obj/structure/bed/bedbox/post_unbuckle_mob(mob/living/M)
	. = ..()
	if(M.loc == src)
		M.forceMove(get_turf(src))
	update_icon()

/obj/structure/bed/bedbox/proc/open(mob/living/user)
	if(opened || locked)
		if(user)
			to_chat(user, span_warning("Someone else trapped themselves inside."))
		return FALSE
	playsound(loc, open_sound, open_sound_volume)
	opened = TRUE
	dump_contents()
	update_icon()
	return TRUE

/obj/structure/bed/bedbox/proc/close(mob/living/user)
	if(!opened || locked) //If this appeared, it means you managed to BREAK the bedbox, somehow.
		if(user)
			to_chat(user, span_warning("For some reason, it resist being closed."))
		return FALSE

	ensure_inside()
	for(var/mob/living/M in buckled_mobs)
		if(M.loc != src)
			M.forceMove(src)
			M.buckled = src

	playsound(loc, close_sound, close_sound_volume)
	opened = FALSE
	take_contents()
	update_icon()
	return TRUE

/obj/structure/bed/bedbox/proc/toggle(mob/living/user)
	return opened ? close(user) : open(user)

/obj/structure/bed/bedbox/attack_hand(mob/living/user)
	user.changeNext_move(CLICK_CD_MELEE)
	if(user.loc == src)
		return toggle(user)
	if(opened)
		return close(user)
	else
		return open(user)

/obj/structure/bed/bedbox/attack_paw(mob/user)
	return attack_hand(user)

/obj/structure/bed/bedbox/attack_right(mob/living/user)
	if(opened) //Appears if open. Doesn't matter if the player is inside or not.
		to_chat(user, span_warning("You cannot force the deadbolt into reach the mechanism without closing the doors first."))
		return
	if(user.loc != src) //Should appear only when the player is not lying inside. Won't bother finding a way to differ between lying on the ground or on the bed.
		to_chat(user, span_warning("You must be lying inside to be able to lock it."))
		return
	locked = !locked
	to_chat(user, span_notice("You [locked ? "lock" : "unlock"] the bedbox from the inside."))
	return TRUE

/obj/structure/bed/bedbox/relaymove(mob/user)
	if(user.stat || !isturf(loc) || !isliving(user))
		return
	user_unbuckle_mob(user, user)

/obj/structure/bed/bedbox/user_unbuckle_mob(mob/living/M, mob/living/user)
	if(user.buckled != src)
		return

	if(locked)
		user.visible_message(span_warning("[src] crackles and rustles under the body weight of someone."))
		user.Stun(30)
		return

	. = ..()
	user.unbuckle_mob()

	if(!opened)
		open(user)

	if(user.loc == src)
		user.forceMove(get_turf(src))

	to_chat(user, span_notice("You push open the bedbox with the feet before crawling out."))

/obj/structure/bed/bedbox/Exit(atom/movable/A)
	open()
	if(A.loc == src)
		return FALSE
	return TRUE

/obj/structure/bed/bedbox/Destroy()
	dump_contents()
	. = ..()

/obj/structure/bed/bedbox/proc/take_contents()
	var/atom/L = get_turf(src)
	for(var/atom/movable/AM in L)
		if(AM != src && insert(AM) == -1)
			break

/obj/structure/bed/bedbox/dump_contents()
	var/atom/L = get_turf(src)
	for(var/atom/movable/AM in contents)
		AM.forceMove(L)

/obj/structure/bed/bedbox/proc/insert(atom/movable/AM)
	if(contents.len >= storage_capacity)
		return -1
	if(insertion_allowed(AM))
		AM.forceMove(src)
		return TRUE
	return FALSE

/obj/structure/bed/bedbox/proc/insertion_allowed(atom/movable/AM)
	if(ismob(AM))
		if(!isliving(AM)) return FALSE
		var/mob/living/L = AM
		if(L.anchored || L.buckled || L.incorporeal_move || L.has_buckled_mobs())
			return FALSE
		if(contents.Find(L)) return FALSE
		if(length(contents) >= mob_storage_capacity)
			return FALSE
		L.stop_pulling()
		return TRUE
	else if(isobj(AM))
		if(AM.anchored || AM.has_buckled_mobs())
			return FALSE
	return TRUE

/obj/structure/abyssgate
	name = "gate of submergence"
	desc = "Passage is not given, it is measured in two vertical burdens bound by a horizontal vow. Your purity shall be measured as well."
	icon = 'modular/stonekeep/kaizoku/icons/mapset/tradesector64.dmi'
	icon_state = "abyssgate"
	layer = ABOVE_MOB_LAYER + 10
	anchored = TRUE
	density = FALSE
	pixel_x = -16
	pixel_y = -16
	bound_width = 64
	bound_height = 64

/obj/structure/abyssgate/Initialize()
	. = ..()

	var/image/head_overlay = image(icon, "abyssgate_det")
	head_overlay.layer = ABOVE_MOB_LAYER
	head_overlay.plane = GAME_PLANE_UPPER
	head_overlay.density = TRUE

	head_overlay.pixel_x = 0
	head_overlay.pixel_y = 0
	head_overlay.appearance_flags = PIXEL_SCALE | KEEP_TOGETHER
	overlays += head_overlay

	var/obj/effect/abyssgate_sensor/S = new /obj/effect/abyssgate_sensor(get_turf(src))
	S.master = src

/obj/effect/abyssgate_sensor
	name = ""
	desc = ""
	anchored = TRUE
	density = FALSE
	layer = 2.0 // Safe low effect layer (BELOW_MOB_LAYER is usually 3.0)
	mouse_opacity = 0
	invisibility = 101 // Normally makes it always invisible
	var/obj/structure/abyssgate/master

/obj/effect/abyssgate_sensor/Crossed(atom/movable/A)
	if(!master || !isliving(A))
		return
	var/mob/living/L = A
	if(!L)
		return

	if(ishuman(L))
		var/mob/living/carbon/human/H = L
		if(H.dna?.species?.id == "tiefling") // Tieflings are tolerated, but not really accepted.
			to_chat(H, span_warning("Hesitant calm, the verdict not yet cast. It declares within, you are welcomed if spiritual purification is being searched."))
			playsound(src, pick('modular/stonekeep/kaizoku/sound/evil.ogg','modular/stonekeep/kaizoku/sound/evil2.ogg','modular/stonekeep/kaizoku/sound/evil3.ogg'), 35, TRUE, ignore_walls = FALSE)
			return

		if((islist(H.faction) && (FACTION_ORCS in H.faction)) || (H.mob_biotypes & MOB_UNDEAD)) //The undead and the Graggarious forces are gatekept.
			to_chat(H, span_danger("The Abyssgate scorches your corrupted blood!"))
			H.Immobilize(10)
			H.apply_status_effect(/datum/status_effect/buff/rayoffrost5e/)
			H.adjustFireLoss(5)
			H.Stun(20)
			playsound(src, pick('modular/stonekeep/kaizoku/sound/evil.ogg','modular/stonekeep/kaizoku/sound/evil2.ogg','modular/stonekeep/kaizoku/sound/evil3.ogg'), 35, TRUE, ignore_walls = FALSE)

			// Push them backward from the direction they came from
			var/turf/origin = get_turf(H)
			var/dir_to_gate = get_dir(get_step_away(H, master), master)
			var/turf/push_dest = get_step(origin, dir_to_gate)
			if(push_dest)
				H.throw_at(push_dest, 4, 1)
			return
	to_chat(L, span_notice("A welcoming sensation washes over you as the gate is crossed.")) // All other are welcomed.
	playsound(src, pick('modular/stonekeep/kaizoku/sound/good.ogg','modular/stonekeep/kaizoku/sound/good2.ogg','modular/stonekeep/kaizoku/sound/good3.ogg'), 35, TRUE, ignore_walls = FALSE)

/obj/structure/fluff/railing/shojidivider
	name = "privacy screen"
	desc = "Foglander privacy divider for changing clothes, what differs from Enigmans whom often don't care about changing cloth pieces in the middle of town. Weirdos."
	icon = 'modular/stonekeep/kaizoku/icons/mapset/frontierjustice32.dmi'
	icon_state = "shojidivider"
	density = FALSE
	anchored = TRUE
	deconstructible = FALSE
	climbable = FALSE
	dir = SOUTH
	layer = ABOVE_MOB_LAYER
	passcrawl = FALSE
	flags_1 = ON_BORDER_1

/obj/structure/fluff/railing/shojidivider/Initialize()
	. = ..()
	dir = SOUTH
	layer = ABOVE_MOB_LAYER

/obj/structure/fluff/railing/shojidivider/OnCrafted(dirin, mob/user)
	dir = SOUTH
	layer = ABOVE_MOB_LAYER
	. = ..()

/obj/structure/fluff/railing/shojidivider/CanPass(atom/movable/mover, turf/target)
	if(istype(mover, /mob/camera) || isobserver(mover) || mover.throwing || mover.movement_type & FLYING)
		return TRUE

	if(isliving(mover))
		var/mob/living/M = mover
		if(M.body_position == LYING_DOWN && passcrawl)
			return TRUE

	var/to_dir = get_dir(loc, target)
	if(to_dir == NORTH || to_dir == SOUTH)
		return FALSE
	return TRUE

/obj/structure/fluff/railing/shojidivider/CanAStarPass(ID, to_dir, requester)
	return (to_dir != NORTH && to_dir != SOUTH)

/obj/structure/fluff/railing/frontfence/proc/checkExit(atom/movable/O, turf/target)
	if(istype(O, /obj/projectile) || isobserver(O) || O.throwing || O.movement_type & FLYING)
		return TRUE

	if(isliving(O))
		var/mob/living/M = O
		if(M.body_position == LYING_DOWN && passcrawl)
			return TRUE

	if(get_dir(O.loc, target) == NORTH)
		return FALSE
	return TRUE

//Scrubbery

/obj/structure/flora/hollowtree
	parent_type = /obj/structure/flora/newtree
	name = "solvatis tree"
	desc = "Known as the vitalis arbor, this tree lives in symbiosis with mushrooms. The trunk is hollow and rich with fluid."
	icon = 'modular/stonekeep/kaizoku/icons/mapset/frontierjustice32.dmi'
	icon_state = "hollowtree"
	tree_type = "hollow"
	base_state = null
	max_integrity = 250
	armor = list("blunt" = 0, "slash" = 0, "stab" = 0, "piercing" = 0, "fire" = -100, "acid" = 50)
	blade_dulling = DULLING_CUT
	opacity = 1
	density = 1
	climbable = FALSE
	static_debris = list(/obj/item/grown/log/tree = 1)
	obj_flags = CAN_BE_HIT | BLOCK_Z_IN_UP | BLOCK_Z_OUT_DOWN

/obj/structure/flora/hollowtree/Initialize()
	. = ..()
	GenerateTree()

/obj/structure/flora/hollowtree/update_icon()
	cut_overlays()
	var/mutable_appearance/mutable = mutable_appearance(icon, "hollowtree")
	mutable.dir = dir
	add_overlay(mutable)

/obj/structure/flora/hollowtree/GenerateTree()
	dir = pick(GLOB.cardinals)
	SStreesetup.initialize_me |= src
	build_hollow_trunks()

/obj/structure/flora/hollowtree/proc/spawn_mushrooms()
	if(prob(60))
		var/list/dirs = list(NORTH, SOUTH, EAST, WEST)
		for(var/dir in dirs)
			if(prob(50))
				var/turf/T = get_step(src, dir)
				if(istype(T, /turf/open) && !locate(/obj/structure/flora/mushroom) in T)
					var/obj/structure/flora/mushroom/M = new(T)
					M.dir = dir

/obj/structure/flora/hollowtree/proc/build_hollow_trunks() //Allows more of the hollow wood to spawn.
	var/obj/structure/flora/hollowtree/prev = src
	for(var/i in 1 to 2)
		var/turf/T = get_step_multiz(prev, UP)
		if(!istype(T, /turf/open/transparent/openspace))
			break
		var/obj/structure/flora/hollowtree/new_trunk = new /obj/structure/flora/hollowtree(T)
		new_trunk.dir = dir
		prev = new_trunk
		if(i == 1) src.spawn_mushrooms()
		new_trunk.build_leafs(i+1)

/obj/structure/flora/hollowtree/build_leafs(z_level)
	if(z_level < 2)
		return
	var/range = (z_level == 2) ? 2 : 3

	for(var/dx = -range to range)
		for(var/dy = -range to range)
			if(dx == 0 && dy == 0)
				continue

			var/abs_total = abs(dx) + abs(dy)
			if(z_level == 2 && abs_total > 3)
				continue
			if(z_level == 3 && abs_total > 4)
				continue

			var/turf/T = locate(src.x + dx, src.y + dy, src.z)
			if(!istype(T, /turf/open/transparent/openspace))
				continue
			if(locate(/obj/structure) in T)
				continue

			var/is_corner = (abs(dx) == abs(dy))
			var/obj/structure/flora/stepleaf/leaf
			if(is_corner)
				leaf = new /obj/structure/flora/stepleaf/solvatis/corner(T)
			else
				leaf = new /obj/structure/flora/stepleaf/solvatis(T)
			leaf.dir = get_dir(src, T)

/obj/structure/flora/stepleaf/solvatis
	parent_type = /obj/structure/flora/newleaf
	name = "solvatis leaves"
	desc = "A thick leafy canopy, strong enough to stand on."
	icon = 'modular/stonekeep/kaizoku/icons/mapset/frontierjustice32.dmi'
	icon_state = "center-leaf"
	climbable = TRUE
	max_integrity = 15
	obj_flags = CAN_BE_HIT | BLOCK_Z_OUT_DOWN
	static_debris = list(/obj/item/grown/log/tree/stick = 1)
	var/base_state
	density = FALSE
	max_integrity = 30

/obj/structure/flora/stepleaf/solvatis/corner
	icon_state = "corner-leaf"

/obj/structure/flora/mushroom
	name = "foreigner mushroom"
	desc = "A mushroom used for nutrition or medicinal purposes."
	icon = 'modular/stonekeep/kaizoku/icons/mapset/frontierjustice32.dmi'
	icon_state = "mushroom_end1"
	density = FALSE
	max_integrity = 5
	static_debris = list(/obj/item/reagent_containers/food/snacks/produce/shiitake = 1)
	dir = NORTH

/obj/structure/flora/mushroom/Initialize()
	. = ..()
	icon_state = "mushroom_end[rand(1,4)]"

/obj/item/reagent_containers/food/snacks/produce/shiitake
	seed = null
	name = "ziitake"
	desc = "Blessed be what does not grow towards the corruption, as the crown of the purified defies what sinks the soul into damnation."
	icon = 'modular/stonekeep/kaizoku/icons/mapset/frontierjustice32.dmi'
	icon_state = "shiitake"
	throwforce = 0
	w_class = WEIGHT_CLASS_TINY
	throw_speed = 1
	throw_range = 3
	list_reagents = list(/datum/reagent/consumable/nutriment = SNACK_POOR)
	dropshrink = 0.6
	rotprocess = null

/obj/structure/flora/mushroom
	name = "foreigner mushroom"
	desc = "Mushroom used for nutrition or medicinal purposes."
	icon = 'modular/stonekeep/kaizoku/icons/mapset/frontierjustice32.dmi'
	icon_state = "mushroom"
	density = FALSE
	max_integrity = 5
	static_debris = list(/obj/item/reagent_containers/food/snacks/produce/shiitake = 1)

#define is_tideseeker(job_type) (istype(job_type, /datum/job/stonekeep/sohei) || istype(job_type, /datum/job/stonekeep/mastersohei))
//When possible, put this in Stonekeep helper.

/obj/structure/fluff/gong
	name = "ceremonial gong"
	desc = "A large metal gong suspended in a wooden frame. It looks like it could make quite the noise."
	icon = 'modular/stonekeep/kaizoku/icons/mapset/frontierjustice32.dmi'
	icon_state = "gong"
	anchored = TRUE
	density = TRUE
	layer = ABOVE_MOB_LAYER
	max_integrity = 150
	resistance_flags = FIRE_PROOF
	obj_flags = CAN_BE_HIT
	COOLDOWN_DECLARE(gong_ring)

/obj/structure/fluff/gong/attack_hand(mob/living/user)
	if(!COOLDOWN_FINISHED(src, gong_ring))
		to_chat(user, "<span class='warning'>The gong is still resonating.</span>")
		return

	to_chat(user, "<span class='notice'>You strike the gong. A deep, sacred tone echoes through the air.</span>")
	playsound(src, pick('modular/stonekeep/kaizoku/sound/gong.ogg','modular/stonekeep/kaizoku/sound/gong2.ogg','modular/stonekeep/kaizoku/sound/gong3.ogg'), 35, TRUE, ignore_walls = FALSE)

	var/oldx = pixel_x
	animate(src, pixel_x = oldx + 2, time = 0.3)
	animate(pixel_x = oldx - 2, time = 0.3)
	animate(pixel_x = oldx, time = 0.3)

	for(var/mob/living/player in GLOB.player_list)
		if(player.stat != DEAD && !isbrain(player) && is_tideseeker(player.mind?.assigned_role))
			player.playsound_local(get_turf(player), 'modular/stonekeep/kaizoku/sound/gong3.ogg', 60, FALSE)
			to_chat(player, "<span class='notice'>A sacred gong rings out from afar...</span>")

	COOLDOWN_START(src, gong_ring, 30 SECONDS)

/obj/machinery/light/fueled/lightbeacon
	name = "paper lantern"
	desc = "A paper lantern holding a candle inside. Simple, cheap, and can be placed anywhere that has a hoof."
	icon = 'modular/stonekeep/kaizoku/icons/mapset/frontierjustice.dmi'
	icon_state = "lightbeacon"
	base_state = "lightbeacon"
	density = FALSE
	anchored = TRUE
	on = FALSE
	brightness = 8
	bulb_power = 1.2
	fueluse = 0
	soundloop = null
	crossfire = FALSE
	cookonme = FALSE
	temperature_change = 10
	var/candle_lifetime = 1800 // 30 minutes

/obj/machinery/light/fueled/lightbeacon/Initialize()
	. = ..()
	if(prob(70))
		icon_state = base_state
	else
		icon_state = "[base_state]_on"
		on = TRUE
		set_light_on(TRUE)
		addtimer(CALLBACK(src, PROC_REF(burn_out)), candle_lifetime)

/obj/machinery/light/fueled/lightbeacon/attack_hand(mob/user)
	if(on)
		user.visible_message(span_warning("[user] snuffs out [src]."))
		burn_out()
	else
		user.visible_message(span_notice("[user] lights the [src]."))
		ignite()
	return

/obj/machinery/light/fueled/lightbeacon/proc/ignite()
	on = TRUE
	set_light_on(TRUE)
	icon_state = "[base_state]_on"
	playsound(loc, 'sound/items/firelight.ogg', 60)
	addtimer(CALLBACK(src, PROC_REF(burn_out)), candle_lifetime)

/obj/machinery/light/fueled/lightbeacon/burn_out()
	if(!on) return
	on = FALSE
	set_light_on(FALSE)
	icon_state = base_state
	playsound(loc, 'sound/items/firesnuff.ogg', 60)

/obj/machinery/light/fueled/lightbeacon/update_icon()
	icon_state = on ? "[base_state]_on" : base_state

/obj/item/roguemachine/siegebuilder //Temporary placeholder for Yaku mapping. In my next PR, it will be finished.
	name = "siege workspace"
	desc = "To quickly deploy and create siege machines, custodian engineers makes use of this portable table."
	icon = 'modular/stonekeep/kaizoku/icons/mapset/frontierjustice32.dmi'
	icon_state = "siegeworkshop"
	density = TRUE
	anchored = TRUE
	w_class = WEIGHT_CLASS_GIGANTIC
	blade_dulling = DULLING_BASH

/obj/structure/flora/tree/abyssal
	name = "martyr blossom"
	desc = "Each blossom feeds on the corruptive burden of the earth, filtering it into petals. Even when touched with a face by Dendor's madness, its abyssal petals do not yield and die like many."
	icon = 'modular/stonekeep/kaizoku/icons/mapset/furniture_biggest.dmi'
	icon_state = "tree"
	var/activated = 0
	max_integrity = 350

/obj/structure/flora/tree/abyssal/Initialize()
	. = ..()
	icon_state = "tree_[rand(1,8)]"

/turf/open/floor/rooftop/kaizoku/directional //leaving it to the mappers or someone else to play with the roof creations.
	name = "foreigner roof"
	icon = 'modular/stonekeep/kaizoku/icons/tileset/tilesets.dmi'
	icon_state = "browntiles"
	footstep = FOOTSTEP_WOOD
	barefootstep = FOOTSTEP_HARD_BAREFOOT
	clawfootstep = FOOTSTEP_WOOD_CLAW
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	damage_deflection = 8
	max_integrity = 800

/turf/open/floor/rooftop/kaizoku/directional/blue
	icon_state = "bluetiles"

/turf/open/floor/rooftop/kaizoku/directional/red
	icon_state = "redtiles"

/turf/open/floor/rooftop/kaizoku/directional/green
	icon_state = "greentiles"

/turf/open/floor/rooftop/kaizoku/central //leaving it to the mappers or someone else to play with the roof creations.
	icon_state = "bluetiles_central"

/turf/open/floor/rooftop/kaizoku/central/blue
	icon_state = "bluetiles_central"

/turf/open/floor/rooftop/kaizoku/central/red
	icon_state = "redtiles_central"

/turf/open/floor/rooftop/kaizoku/central/green
	icon_state = "greentiles_central"

/turf/open/floor/rooftop/kaizoku/horizontal //leaving it to the mappers or someone else to play with the roof creations.
	icon_state = "browntiles_hor"

/turf/open/floor/rooftop/kaizoku/horizontal/blue
	icon_state = "bluetiles_hor"

/turf/open/floor/rooftop/kaizoku/horizontal/red
	icon_state = "redtiles_hor"

/turf/open/floor/rooftop/kaizoku/horizontal/green
	icon_state = "greentiles_hor"

/turf/open/floor/rooftop/kaizoku/vertical
	icon_state = "browntiles_ver"

/turf/open/floor/rooftop/kaizoku/vertical/blue
	icon_state = "bluetiles_ver"

/turf/open/floor/rooftop/kaizoku/vertical/red
	icon_state = "redtiles_ver"

/turf/open/floor/rooftop/kaizoku/vertical/green
	icon_state = "greentiles_ver"

/obj/structure/fluff/statue/waterfall
	icon = 'modular/stonekeep/kaizoku/icons/tileset/tilesets.dmi'
	icon_state = "waterfall"

/datum/customizer/bodypart_feature/hair/head/humanoid/kaizoku
	customizer_choices = list(/datum/customizer_choice/bodypart_feature/hair/head/humanoid/kai)

/datum/customizer_choice/bodypart_feature/hair/head/humanoid/kai
	sprite_accessories = list(
		/datum/sprite_accessory/hair/head/empress,
		/datum/sprite_accessory/hair/head/onnamusha,
		/datum/sprite_accessory/hair/head/waterfield,
		/datum/sprite_accessory/hair/head/homewaifu,
		/datum/sprite_accessory/hair/head/casual,
		/datum/sprite_accessory/hair/head/martyr,
		/datum/sprite_accessory/hair/head/zamurai,
		/datum/sprite_accessory/hair/head/ronin,
		/datum/sprite_accessory/hair/head/freespirit,
		/datum/sprite_accessory/hair/head/novice,
		/datum/sprite_accessory/hair/head/yakuza,
		/datum/sprite_accessory/hair/head/steppeman,
		/datum/sprite_accessory/hair/head/bishonen,
		/datum/sprite_accessory/hair/head/emperor,
		/datum/sprite_accessory/hair/head/protagonist,
		/datum/sprite_accessory/hair/head/protagonistalt,
	)

