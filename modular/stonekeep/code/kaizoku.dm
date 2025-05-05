/*
species_accent
get_accent_list()
/datum/species/dwarf/mountain/get_accent_list()
	return strings("SKgrenzelhoft_replacement.json", "dwarf")
*/

#define SPAN_ABYSSAL "abyssal"

#define HEAD_EXCEPT_EYES	(HEAD | NOSE | EARS | HAIR)
//Kaizoku Assets.

#define CLOTHING_RONIN	 		"#861e1e"
#define CLOTHING_EIDOLON		"#613a3f"
#define CLOTHING_TOWERYAKKO		"#804d97"
#define CLOTHING_KABUKIMONO		"#9b874f"

#define CLOTHING_THUNDER		"#be8b48"
#define CLOTHING_STORM			"#1a2677"
#define CLOTHING_SEA			"#56928a"
#define CLOTHING_ISLAND			"#bd3541"

//Kaizoku Assets.

#define MANCATCHER				/datum/intent/polearm/thrust/mancatcher

//DEFAULT ABYSSARIAD SKIN TONES
#define SKIN_COLOR_OATHBOUND_MUQIAN "ffe0d1"
#define SKIN_COLOR_OATHBOUND_KAIZOKU "fcccb3"
#define SKIN_COLOR_OATHBOUND_SHUHEN "edc6b3"
#define SKIN_COLOR_OATHBOUND_LINYOU "e2b9a3"
#define SKIN_COLOR_OATHBOUND_DUSTWALKER "d9a284"
#define SKIN_COLOR_WARPCASTER_MUQIAN "c9a893"
#define SKIN_COLOR_WARPCASTER_KAIZOKU "ba9882"
#define SKIN_COLOR_WARPCASTER_SHUHEN "99745d"
#define SKIN_COLOR_WARPCASTER_LINYOU "745441"
#define SKIN_COLOR_WARPCASTER_DUSTWALKER "302017"

//SKYLANCER UNIQUE SKIN TONE
#define SKIN_COLOR_PEPPERSBLOW "771111"

//OGRE SKIN TONES
#define SKIN_COLOR_DEFIANCE "bb5155" //RED DEFAULT
#define SKIN_COLOR_DEFIANCE_SANGUINE "771111"
#define SKIN_COLOR_STABILITY "6a9479"
#define SKIN_COLOR_STABILITY_INTELLECT "286940"
#define SKIN_COLOR_AUDACY "aa8e3a"
#define SKIN_COLOR_AUDACY_MYSTERY "635834"
#define SKIN_COLOR_BLANK_PURIFICATED "d8e1e2"


//UNDINE SKIN TONES
#define SKIN_COLOR_SWAMPCLAN "728400" //GREEN DEFAULT
#define SKIN_COLOR_JUNGLECLAN "7a5e1b"
#define SKIN_COLOR_LEAFCLAN "5ea889"
#define SKIN_COLOR_BOGCLAN "1b7a5e"
#define SKIN_COLOR_FORESTCLAN "5FB098"
#define SKIN_COLOR_SHADOWCLAN "60609e"
#define SKIN_COLOR_FIREBLOOMCLAN "E26846"
#define SKIN_COLOR_ABYSSALCLAN "a198b8"


// =================================================================
// =====================	STRUCTURE	============================

/obj/structure/frontierjustice
	name = "frontier justice"
	desc = "The manifestation extrajudicidal punishment by vigilantism, or performed by evil doers to instill fear. One may never know."
	icon = 	'modular/stonekeep/kaizoku/icons/mapset/frontierjustice.dmi'
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
	name = "abyssal ishigaki wall"
	desc = "Made from large, interlocking uncut stones without the use of mortar, so a castle is built above it. However, many make simple walls out of it."
	icon = 	'modular/stonekeep/kaizoku/icons/wallset/abyssalstone.dmi'
	icon_state = "abyssal"
	sheet_type = /obj/item/natural/stone
	break_sound = 'sound/combat/hits/onstone/stonedeath.ogg'
	attacked_sound = list('sound/combat/hits/onstone/wallhit.ogg', 'sound/combat/hits/onstone/wallhit2.ogg', 'sound/combat/hits/onstone/wallhit3.ogg')
	canSmoothWith = list(/turf/closed/wall/mineral/stone/abyssal)
	above_floor = /turf/open/floor/blocks
	baseturfs = list(/turf/open/floor/blocks)
	climbdiff = 1
	damage_deflection = 10

/turf/closed/wall/mineral/stone/abyssal/window
	name = "abyssal ishigaki window"
	desc = "An simple hole within a Ishigaki wall."
	opacity = FALSE
	max_integrity = 800

/turf/closed/wall/mineral/stone/window/CanPass(atom/movable/mover, turf/target)
	if(istype(mover) && ((mover.pass_flags & PASSTABLE) || (mover.pass_flags & PASSGRILLE)) )
		return 1
	return ..()

/turf/closed/wall/mineral/stone/abyssal/window/Initialize()
	. = ..()
	icon_state = "abyssal"
	var/mutable_appearance/M = mutable_appearance(icon, "abyssalhole", layer = ABOVE_NORMAL_TURF_LAYER)
	add_overlay(M)

/turf/closed/wall/mineral/wood/abyssal
	name = "wagoya wall"
	desc = "wooden wall of abyssal architecture that uses wooden joinery that fits together seamlessly to avoid use of nails or screws, increasing protection against earthshakes."
	icon = 	'modular/stonekeep/kaizoku/icons/wallset/eastern_wood.dmi'
	icon_state = "wood"
	break_sound = 'sound/combat/hits/onwood/destroywalldoor.ogg'
	attacked_sound = list('sound/combat/hits/onwood/woodimpact (1).ogg','sound/combat/hits/onwood/woodimpact (2).ogg')
	canSmoothWith = list(/turf/closed/wall/mineral/wood, /obj/structure/window, /obj/structure/roguetent, /turf/closed/wall/mineral/wooddark)
//	sheet_type = /obj/item/grown/log/tree/lumber
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
	var/mutable_appearance/M = mutable_appearance(icon, "woodhole", layer = ABOVE_NORMAL_TURF_LAYER)
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

/obj/item/storage/belt/kaizoku/leather/daisho/thunder
	name = "thunder daisho belt"
	color = CLOTHING_THUNDER

/obj/item/storage/belt/kaizoku/leather/daisho/deluge
	name = "deluge daisho belt"
	color = CLOTHING_STORM

/obj/item/storage/belt/kaizoku/leather/daisho/ocean
	name = "ocean daisho belt"
	color = CLOTHING_SEA

/obj/item/storage/belt/kaizoku/leather/daisho/island
	name = "island daisho belt"
	color = CLOTHING_ISLAND

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


// KAIZOKU SPRITE ACCESSORIES HERE TEMP? ROGTODO
//Female Kaizoku hair below.

/datum/sprite_accessory/hair/kaizoku/empress
	name = "Abyssal Empress"
	icon_state = "empress"
	gender = FEMALE
	specuse = list("abyssariad")

/datum/sprite_accessory/hair/kaizoku/onnamusha
	name = "Onnamusha"
	icon_state = "warlady"
	gender = FEMALE
	specuse = list("abyssariad")

/datum/sprite_accessory/hair/kaizoku/waterfield
	name = "Waterbearer"
	icon_state = "waterfield"
	gender = FEMALE
	specuse = list("abyssariad")

/datum/sprite_accessory/hair/kaizoku/homewaifu
	name = "Homewife"
	icon_state = "homewaifu"
	gender = FEMALE
	specuse = list("abyssariad")

/datum/sprite_accessory/hair/kaizoku/casual
	name = "Natural River"
	icon_state = "casual"
	gender = FEMALE
	specuse = list("abyssariad")

/datum/sprite_accessory/hair/kaizoku/martyr
	name = "Inhonor of the Fallen"
	icon_state = "martyr"
	gender = FEMALE
	specuse = list("abyssariad")

//Male Kaizoku hair below.

/datum/sprite_accessory/hair/kaizoku
	name = "Zamurai Manbun"
	icon = 'modular/stonekeep/kaizoku/icons/body_details/hairstyles.dmi'
	icon_state = "samurai"
	gender = MALE
	specuse = list("abyssariad")

/datum/sprite_accessory/hair/kaizoku/ronin
	name = "Vagabond"
	icon_state = "ronin"
	gender = MALE
	specuse = list("abyssariad")

/datum/sprite_accessory/hair/kaizoku/freespirit
	name = "Free Spirit"
	icon_state = "freespirit"
	gender = NEUTER
	specuse = list("abyssariad")

/datum/sprite_accessory/hair/kaizoku/novice
	name = "New Rice"
	icon_state = "novice"
	gender = MALE
	specuse = list("abyssariad")

/datum/sprite_accessory/hair/kaizoku/yakuza
	name = "Irezumi Gangster"
	icon_state = "yakuza"
	gender = MALE
	specuse = list("abyssariad")

/datum/sprite_accessory/hair/kaizoku/steppeman
	name = "Aridlands raider"
	icon_state = "steppeman"
	gender = MALE
	specuse = list("abyssariad")

/datum/sprite_accessory/hair/kaizoku/bishonen
	name = "Husband"
	icon_state = "bishonen"
	gender = MALE
	specuse = list("abyssariad")

/datum/sprite_accessory/hair/kaizoku/emperor
	name = "Imperial Court"
	icon_state = "emperor"
	gender = MALE
	specuse = list("abyssariad")

/datum/sprite_accessory/hair/kaizoku/protagonist
	name = "Historical Protagonist"
	icon_state = "hprotagonist"
	gender = NEUTER
	specuse = list("abyssariad")

/datum/sprite_accessory/hair/kaizoku/protagonistalt
	name = "Longer Protagonist"
	icon_state = "alsoprotagonist"
	gender = NEUTER
	specuse = list("abyssariad")

// Kaizoku bodyparts
// ACCESORIES ARE DEPRECATED. USE SPRITE ACCESSORY AND ORGANS.

// FOX EARS

// Changeling ears organ
/obj/item/organ/ears/kitsune_ears
	name = "Fox Ears"
	accessory_type = /datum/sprite_accessory/ears/kitsune_upright

/datum/customizer/organ/ears/kitsune
	customizer_choices = list(/datum/customizer_choice/organ/ears/kitsune_ears)
	allows_disabling = FALSE

// Foxears customizer choices
/datum/customizer_choice/organ/ears/kitsune_ears
	name = "Fox ears"
	organ_type = /obj/item/organ/ears/kitsune_ears
	sprite_accessories = list(/datum/sprite_accessory/ears/kitsune_upright,
							/datum/sprite_accessory/ears/kitsune_side,
							/datum/sprite_accessory/ears/kitsune_thick,
							/datum/sprite_accessory/ears/kitsune_onedown)

// Upright Fox ears
/datum/sprite_accessory/ears/kitsune_upright
	icon = 'modular/stonekeep/kaizoku/icons/body_details/attachment.dmi'
	name = "Upright Fox Ears"
	icon_state = "ears_upright"
	specuse = list("abyssariad", "Changeling", "changeling")
	color_key_defaults = list(KEY_HAIR_COLOR)

// Side fox ears
/datum/sprite_accessory/ears/kitsune_side
	icon = 'modular/stonekeep/kaizoku/icons/body_details/attachment.dmi'
	name = "Sideways Fox Ears"
	icon_state = "ears_lying"
	specuse = list("abyssariad", "Changeling", "changeling")
	color_key_defaults = list(KEY_HAIR_COLOR)

// Thick fox ears
/datum/sprite_accessory/ears/kitsune_thick
	icon = 'modular/stonekeep/kaizoku/icons/body_details/attachment.dmi'
	name = "Thick Fox Ears"
	icon_state = "ears_thick"
	specuse = list("abyssariad", "Changeling", "changeling")
	color_key_defaults = list(KEY_HAIR_COLOR)

// One-down fox ears
/datum/sprite_accessory/ears/kitsune_onedown
	icon = 'modular/stonekeep/kaizoku/icons/body_details/attachment.dmi'
	name = "Curious Fox Ears"
	icon_state = "ears_stoned"
	specuse = list("abyssariad", "Changeling", "changeling")
	color_key_defaults = list(KEY_HAIR_COLOR)

// FOX TAILS

/obj/item/organ/tail/kitsune
	name = "Fox Tails"
	accessory_type = /datum/sprite_accessory/tails/human/onetail

/datum/customizer/organ/tail/kitsune
	customizer_choices = list(/datum/customizer_choice/organ/tail/kitsune)

/datum/customizer_choice/organ/tail/kitsune
	name = "Fox Tails"
	organ_type = /obj/item/organ/tail/kitsune
	sprite_accessories = list(/datum/sprite_accessory/tails/human/onetail,
							/datum/sprite_accessory/tails/human/twotails,
							/datum/sprite_accessory/tails/human/threetails)

/datum/sprite_accessory/tails/human/onetail
	icon = 'modular/stonekeep/kaizoku/icons/body_details/attachment.dmi'
	name = "Fox tail"
	icon_state = "onetail"
	specuse = list("abyssariad", "Changeling", "changeling")
	gender = NEUTER
	color_key_defaults = list(KEY_HAIR_COLOR)

/datum/sprite_accessory/tails/human/twotails
	icon = 'modular/stonekeep/kaizoku/icons/body_details/attachment.dmi'
	name = "Two Foxtails"
	icon_state = "twotails"
	specuse = list("abyssariad", "Changeling", "changeling")
	gender = NEUTER
	color_key_defaults = list(KEY_HAIR_COLOR)

/datum/sprite_accessory/tails/human/threetails
	icon = 'modular/stonekeep/kaizoku/icons/body_details/attachment.dmi'
	name = "Three Foxtails"
	icon_state = "threetails"
	specuse = list("abyssariad", "Changeling", "changeling")
	gender = NEUTER
	color_key_defaults = list(KEY_HAIR_COLOR)

// ONI PARTS

// Oni Horns

/obj/item/organ/horns/oni
	name = "ogrun horns"
	accessory_type = /datum/sprite_accessory/horns/oni

/datum/customizer/organ/horns/oni
	customizer_choices = list(/datum/customizer_choice/organ/horns/oni)
	allows_disabling = FALSE

/datum/customizer_choice/organ/horns/oni
	name = "Ogrun Horn"
	organ_type = /obj/item/organ/horns/oni
	sprite_accessories = list(
		/datum/sprite_accessory/horns/oni)

/datum/sprite_accessory/horns/oni
	icon = 'modular/stonekeep/kaizoku/icons/body_details/attachment.dmi'
	name = "Ogrun horn"
	icon_state = "onihorn"
	specuse = list("abyssariad", "Ogrun", "ogrun")
	color_key_defaults = list(KEY_SKIN_COLOR)
	gender = NEUTER

// Oni Ears

/obj/item/organ/ears/oni
	name = "ogrun ears"
	accessory_type = /datum/sprite_accessory/ears/oni

/datum/sprite_accessory/ears/oni
	icon = 'modular/stonekeep/kaizoku/icons/body_details/attachment.dmi'
	name = "Ogrun"
	icon_state = "ears_oni"
	specuse = list("abyssariad", "Ogrun", "ogrun")
	color_key_defaults = list(KEY_SKIN_COLOR)

/datum/customizer/organ/ears/oni
	customizer_choices = list(/datum/customizer_choice/organ/ears/oni)
	allows_disabling = FALSE

/datum/customizer_choice/organ/ears/oni
	name = "Ogrun ears"
	organ_type = /obj/item/organ/ears/oni
	sprite_accessories = list(/datum/sprite_accessory/ears/oni)

// SKYLANCERS

// TENGU WINGS

// These are tails as placeholders. If wings slots are able to be done successfully, refactor this into wings.
/obj/item/organ/tail/wings
	name = "Wings"
	desc = "Wings, like those of zads, but enormous in size. Belonging to a Skylancer, most likely."
	accessory_type = /datum/sprite_accessory/tails/human/tengu

/datum/sprite_accessory/tails/human/tengu
	icon = 'modular/stonekeep/kaizoku/icons/body_details/attachment.dmi'
	name = "Tengu wings"
	icon_state = "tenguv"
	specuse = list("abyssariad", "Tengu", "Skylancer")
	gender = NEUTER
	color_key_defaults = list(KEY_HAIR_COLOR)

/datum/customizer/organ/tail/tengu
	customizer_choices = list(/datum/customizer_choice/organ/tail/tengu)
	allows_disabling = FALSE

/datum/customizer_choice/organ/tail/tengu
	name = "Skylancer wings"
	organ_type = /obj/item/organ/tail/wings
	sprite_accessories = list(/datum/sprite_accessory/tails/human/tengu)

// TENGU EARS

/obj/item/organ/ears/tengu
	name = "Skylancer ears"
	accessory_type = /datum/sprite_accessory/ears/tengu

/datum/sprite_accessory/ears/tengu
	icon = 'modular/stonekeep/kaizoku/icons/body_details/attachment.dmi'
	name = "Skylancer ears"
	icon_state = "ears_tengu"
	specuse = list("abyssariad", "Tengu", "Skylancer")
	color_key_defaults = list(KEY_HAIR_COLOR)

/datum/customizer/organ/ears/tengu
	customizer_choices = list(/datum/customizer_choice/organ/ears/tengu)
	allows_disabling = FALSE

/datum/customizer_choice/organ/ears/tengu
	name = "Skylancer ears"
	organ_type = /obj/item/organ/ears/tengu
	sprite_accessories = list(/datum/sprite_accessory/ears/tengu)

// UNDINES

// KAPPA SHELL

/obj/item/organ/tail/kappa
	name = "Turtle Shell"
	desc = "The hard back of an Undine."
	accessory_type = /datum/sprite_accessory/tails/human/kappa

//TODO: Customizable shell color
/datum/sprite_accessory/tails/human/kappa
	icon = 'modular/stonekeep/kaizoku/icons/body_details/attachment.dmi'
	name = "Undine shell"
	icon_state = "kappav"
	specuse = list("abyssariad", "Kappa", "Undine")
	gender = NEUTER
	default_colors = "#044D1D" // Placeholder until color select is set up
	// Once shells can be customized, the following should be the pre-selectable colors:
	// #044d1d = Bogman
	// #3c966e = Lushman
	// #1d8c74 = Chrysanfolk
	// #13727d = Riverfolk
	// #074778 = Seadweller
	// #201e96 = Saltstained
	// #420963 = Orchid
	// #8c348c = Amaranth
	// #856d18 = Goldstrive

/datum/customizer/organ/tail/kappa
	customizer_choices = list(/datum/customizer_choice/organ/tail/kappa)
	allows_disabling = FALSE

/datum/customizer_choice/organ/tail/kappa
	name = "Undine shell"
	organ_type = /obj/item/organ/tail/kappa
	sprite_accessories = list(/datum/sprite_accessory/tails/human/kappa)

// KAPPA EARS

/obj/item/organ/ears/kappa
	name = "Undine ears"
	accessory_type = /datum/sprite_accessory/ears/kappae

/datum/customizer/organ/ears/kappa
	customizer_choices = list(/datum/customizer_choice/organ/ears/kappa)
	allows_disabling = FALSE

/datum/customizer_choice/organ/ears/kappa
	name = "Undine ears"
	organ_type = /obj/item/organ/ears/kappa
	sprite_accessories = list(/datum/sprite_accessory/ears/kappae)

/datum/sprite_accessory/ears/kappae
	icon = 'modular/stonekeep/kaizoku/icons/body_details/attachment.dmi'
	name = "Kappae"
	icon_state = "kappae"
	specuse = list("abyssariad", "Kappa", "Undine")
	color_key_defaults = list(KEY_SKIN_COLOR)

// END OF KAIZOKU RACES BODYPARTS

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
	icon = 'icons/obj/surgery.dmi'
//	icon_state = "eldritch"		no suchs sprite exists MONOTODO
	slot = ORGAN_SLOT_TONGUE
	var/tongue_type = "eldritch"
	var/can_wag = TRUE
	var/wagging = FALSE
	zone = BODY_ZONE_PRECISE_MOUTH
	slot = ORGAN_SLOT_TONGUE

// TODO: Employ custom tengu eyes for intended purposes (unknown as of time of editing Kaizoku code)
/obj/item/organ/eyes/rogue/tengu
	name = "tengu eyes"
	desc = ""
	eye_icon_state = "eyes_closed"
	icon_state = "eyes_closed"



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
