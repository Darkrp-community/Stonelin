/*

	Hello and welcome to sprite_accessories: For sprite accessories, such as hair,
	facial hair, and possibly tattoos and stuff somewhere along the line. This file is
	intended to be friendly for people with little to no actual coding experience.
	The process of adding in new hairstyles has been made pain-free and easy to do.
	Enjoy! - Doohl


	Notice: This all gets automatically compiled in a list in dna.dm, so you do not
	have to define any UI values for sprite accessories manually for hair and facial
	hair. Just add in new hair types and the game will naturally adapt.

	!!WARNING!!: changing existing hair information can be VERY hazardous to savefiles,
	to the point where you may completely corrupt a server's savefiles. Please refrain
	from doing this unless you absolutely know what you are doing, and have defined a
	conversion in savefile.dm
*/
/proc/init_sprite_accessory_subtypes(prototype, list/L, list/male, list/female,roundstart = FALSE, female_same = FALSE)//Roundstart argument builds a specific list for roundstart parts where some parts may be locked
	if(!istype(L))
		L = list()
	if(!istype(male))
		male = list()
	if(!istype(female))
		female = list()

	for(var/path in subtypesof(prototype))
		if(roundstart)
			var/datum/sprite_accessory/P = path
			if(initial(P.locked))
				continue
		var/datum/sprite_accessory/D = new path()

		if(D.icon_state)
			L[D.name] = D
		else
			L += D.name

		switch(D.gender)
			if(MALE)
				male += D.name
				if(female_same)
					female += D.name
			if(FEMALE)
				female += D.name
			else
				male += D.name
				female += D.name
	return L

/datum/sprite_accessory
	var/use_static		//determines if the accessory will be skipped by color preferences
	var/locked = FALSE		//Is this part locked from roundstart selection? Used for parts that apply effects
	var/list/specuse = list("human") //what species can use dis
	var/additional = FALSE //added hairbands/metal in hair/beards
	var/roundstart = TRUE
	var/under_layer = FALSE

//////////.//////////////////
// MutantParts Definitions //
/////////////////////////////

/datum/sprite_accessory/body_markings
	icon = 'icons/mob/mutant_bodyparts.dmi'

/datum/sprite_accessory/body_markings/none
	name = "None"
	icon_state = "none"

/datum/sprite_accessory/body_markings/dtiger
	name = "Dark Tiger Body"
	icon_state = "dtiger"

/datum/sprite_accessory/body_markings/ltiger
	name = "Light Tiger Body"
	icon_state = "ltiger"

/datum/sprite_accessory/body_markings/lbelly
	name = "Light Belly"
	icon_state = "lbelly"

/datum/sprite_accessory/snouts
	icon = 'icons/mob/mutant_bodyparts.dmi'

/datum/sprite_accessory/snouts/sharp
	name = "Sharp"
	icon_state = "sharp"

/datum/sprite_accessory/snouts/round
	name = "Round"
	icon_state = "round"

/datum/sprite_accessory/snouts/sharplight
	name = "Sharp + Light"
	icon_state = "sharplight"

/datum/sprite_accessory/snouts/roundlight
	name = "Round + Light"
	icon_state = "roundlight"

/datum/sprite_accessory/horns
	icon = 'icons/mob/mutant_bodyparts.dmi'
	gender = MALE
	specuse = list()

/datum/sprite_accessory/ears
	icon = 'icons/mob/mutant_bodyparts.dmi'

/datum/sprite_accessory/ears/none
	name = "None"
	icon_state = null

/datum/sprite_accessory/ears/elf
	icon = 'icons/roguetown/mob/bodies/attachments.dmi'
	name = "Elf"
	icon_state = "elf"
	specuse = list("elf")
	color_src = SKINCOLOR
	offsetti = TRUE

/datum/sprite_accessory/ears/elfw
	icon = 'icons/roguetown/mob/bodies/attachments.dmi'
	name = "ElfW"
	icon_state = "elfw"
	specuse = list("elf", "tiefling") //tiebs use these
	color_src = SKINCOLOR
	offsetti = TRUE

/datum/sprite_accessory/ears/elfh //halfelfs are humens techincally
	icon = 'icons/roguetown/mob/bodies/attachments.dmi'
	name = "ElfH"
	icon_state = "elf"
	specuse = list("human")
	color_src = SKINCOLOR
	offsetti = TRUE

/datum/sprite_accessory/tails/human/tieb
	icon = 'icons/roguetown/mob/bodies/attachments.dmi'
	name = "TiebTail"
	icon_state = "tiebtail"
	specuse = list("tiefling")
	gender = NEUTER
	color_src = SKINCOLOR
	offsetti = TRUE

/datum/sprite_accessory/horns/tieb
	icon = 'icons/roguetown/mob/bodies/attachments.dmi'
	name = "TiebHorns"
	icon_state = "tiebhorns"
	specuse = list("tiefling")
	color_src = SKINCOLOR
	offsetti = TRUE


/* Needs to be made selectable somehow. Tie to gender? Enable horn selection in char pref? I dunno. Sprites there anyways.
/datum/sprite_accessory/horns/tieb_alt
	icon = 'icons/roguetown/mob/bodies/attachments.dmi'
	name = "TiebHornies"
	icon_state = "tiebhornsalt"
	specuse = list("tiefling")
	color_src = SKINCOLOR
	offsetti = TRUE
*/

/datum/sprite_accessory/ears/cat
	name = "Cat"
	icon_state = "cat"
	hasinner = 1
	color_src = HAIR
	specuse = list("cattan")

/datum/sprite_accessory/frills
	icon = 'icons/mob/mutant_bodyparts.dmi'

/datum/sprite_accessory/frills/none
	name = "None"
	icon_state = "none"

/datum/sprite_accessory/frills/simple
	name = "Simple"
	icon_state = "simple"

/datum/sprite_accessory/frills/short
	name = "Short"
	icon_state = "short"

/datum/sprite_accessory/frills/aquatic
	name = "Aquatic"
	icon_state = "aqua"

/datum/sprite_accessory/spines
	icon = 'icons/mob/mutant_bodyparts.dmi'

/datum/sprite_accessory/spines_animated
	icon = 'icons/mob/mutant_bodyparts.dmi'

/datum/sprite_accessory/spines/none
	name = "None"
	icon_state = "none"

/datum/sprite_accessory/spines_animated/none
	name = "None"
	icon_state = "none"

/datum/sprite_accessory/spines/short
	name = "Short"
	icon_state = "short"

/datum/sprite_accessory/spines_animated/short
	name = "Short"
	icon_state = "short"

/datum/sprite_accessory/spines/shortmeme
	name = "Short + Membrane"
	icon_state = "shortmeme"

/datum/sprite_accessory/spines_animated/shortmeme
	name = "Short + Membrane"
	icon_state = "shortmeme"

/datum/sprite_accessory/spines/long
	name = "Long"
	icon_state = "long"

/datum/sprite_accessory/spines_animated/long
	name = "Long"
	icon_state = "long"

/datum/sprite_accessory/spines/longmeme
	name = "Long + Membrane"
	icon_state = "longmeme"

/datum/sprite_accessory/spines_animated/longmeme
	name = "Long + Membrane"
	icon_state = "longmeme"

/datum/sprite_accessory/spines/aqautic
	name = "Aquatic"
	icon_state = "aqua"

/datum/sprite_accessory/spines_animated/aqautic
	name = "Aquatic"
	icon_state = "aqua"


/datum/sprite_accessory/legs 	//legs are a special case, they aren't actually sprite_accessories but are updated with them.
	icon = null					//These datums exist for selecting legs on preference, and little else

/datum/sprite_accessory/legs/none
	name = "Normal Legs"

/datum/sprite_accessory/caps
	icon = 'icons/mob/mutant_bodyparts.dmi'
	color_key_defaults = list(KEY_HAIR_COLOR)

/datum/sprite_accessory/caps/round
	name = "Round"
	icon_state = "round"
