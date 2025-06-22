	/*==============*
	*				*
	*	  ogrun	  	*
	*				*
	*===============*/

//	( Not done yet. But hopefully something related to endurance. )
//	( Not done yet, but hopefully something quite goreful. )

/mob/living/carbon/human/species/abyssariad/ogrun //Remember to code in abyssal powers that forces Orcs to become Onis if it is used with specific purifying ways.
	race = /datum/species/abyssariad/ogrun

/datum/species/abyssariad/ogrun
	name = "Ogrun"
	id = "abyssariad"
	desc = "<b>Island branched Champions</b><br>\
	Under the guide of Abyssor's creations, orcs invading fog islands became purified entities after Blood Apotheosis. \
	Just like the islands that sprinkled the ocean's surface, these orcs bears the constant waves and storms of life \
	as Ogruns, their graggarious essence washed away into a liberted blank slate, bound with their Abyssariad brothers as one.\
	\n\n\
	As their evil unrooted, their non-toxified perceptions of the world were rekindled, the beauty of creativity \
	and flesh made them industrial creatures who use strength as tool for refined work. Their bodies are highly \
	adaptive, allowing regenerations in a clutch, or making men fear their powerful nature.\
	\n\n\
	THIS IS A ESTEEMED BUT DISTRUSTED RACE, SUBJECT TO PUBLIC UNEASE AND HIGHER EXPECTATIONS. <B>PROVE YOUR VALUE AS PURIFIED JEWEL OR DIE IN CORRUPTIVE DISHONOR.</B>"

	skin_tone_wording = "Championage Branch"

	default_color = "FFFFFF"
	species_traits = list(EYECOLOR,HAIR,FACEHAIR,LIPS,STUBBLE)
	inherent_traits = list(TRAIT_NOMOBSWAP)
	default_features = list("mcolor" = "FFF", "ears" = "Ogrun", "tail_human" = "Onihorn")
	use_skintones = 1
	possible_ages = list(AGE_IMMORTAL) //Abyssariads are Immortal. However, Onis are the newest ones on the fold, and they become Orcs mentally if they stray away from Abyssor.
	max_age = 430 //The year Onis became part of the Abyssariads. Roughly after the Blood Apotheosis
//	skinned_type = /obj/item/stack/sheet/animalhide/human
	disliked_food = NONE
	liked_food = MEAT
	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_MAGIC | MIRROR_PRIDE | RACE_SWAP | SLIME_EXTRACT
	limbs_icon_m = 'icons/roguetown/mob/bodies/m/mt_muscular.dmi'
	limbs_icon_f = 'icons/roguetown/mob/bodies/f/ft_muscular.dmi'
	dam_icon = 'icons/roguetown/mob/bodies/dam/dam_male.dmi'
	dam_icon_f = 'icons/roguetown/mob/bodies/dam/dam_male.dmi'
	hairyness = "t2"
	use_m = TRUE
	soundpack_m = /datum/voicepack/male/abyssariad
	soundpack_f = /datum/voicepack/female/abyssariad
	offset_features = list(OFFSET_ID = list(0,1), OFFSET_GLOVES = list(0,1), OFFSET_WRISTS = list(0,1),\
	OFFSET_CLOAK = list(0,1), OFFSET_FACEMASK = list(0,1), OFFSET_HEAD = list(0,1), \
	OFFSET_FACE = list(0,1), OFFSET_BELT = list(0,1), OFFSET_BACK = list(0,1), \
	OFFSET_NECK = list(0,1), OFFSET_MOUTH = list(0,1), OFFSET_PANTS = list(0,1), \
	OFFSET_SHIRT = list(0,1), OFFSET_ARMOR = list(0,1), OFFSET_HANDS = list(0,1), OFFSET_UNDIES = list(0,1), \
	OFFSET_ID_F = list(0,1), OFFSET_GLOVES_F = list(0,1), OFFSET_WRISTS_F = list(0,1), OFFSET_HANDS_F = list(0,1), \
	OFFSET_CLOAK_F = list(0,1), OFFSET_FACEMASK_F = list(0,1), OFFSET_HEAD_F = list(0,1), \
	OFFSET_FACE_F = list(0,1), OFFSET_BELT_F = list(0,1), OFFSET_BACK_F = list(0,1), \
	OFFSET_NECK_F = list(0,1), OFFSET_MOUTH_F = list(0,1), OFFSET_PANTS_F = list(0,1), \
	OFFSET_SHIRT_F = list(0,1), OFFSET_ARMOR_F = list(0,1), OFFSET_UNDIES_F = list(0,1))
	specstats = list("strength" = 1, "perception" = -1, "intelligence" = -1, "constitution" = 2, "endurance" = 2, "speed" = 0, "fortune" = 0)
	specstats_f = list("strength" = 1, "perception" = -1, "intelligence" = -1, "constitution" = 2, "endurance" = 2, "speed" = 0, "fortune" = 0) // Don't even bother making each gender different. Abyssariads are equals in championage.
	enflamed_icon = "widefire"
//	minrace_pq = 0
// 1(str)-0.5-0.5+1+1+0(spd)+0 = 2 = 2.0 specstats. Balance adjusted.
//statsvalue reference by Dova
//Strength and Speed are 1, everything else is .5, all races are +2 or +3 except Humen. So we keeping it as +2 for balance reasons.

	organs = list(
		ORGAN_SLOT_BRAIN = /obj/item/organ/brain,
		ORGAN_SLOT_HEART = /obj/item/organ/heart,
		ORGAN_SLOT_LUNGS = /obj/item/organ/lungs,
		ORGAN_SLOT_EYES = /obj/item/organ/eyes,
		ORGAN_SLOT_EARS = /obj/item/organ/ears/oni,
		ORGAN_SLOT_HORNS = /obj/item/organ/horns/oni,
		ORGAN_SLOT_TONGUE = /obj/item/organ/tongue,
		ORGAN_SLOT_LIVER = /obj/item/organ/liver,
		ORGAN_SLOT_STOMACH = /obj/item/organ/stomach,
		ORGAN_SLOT_APPENDIX = /obj/item/organ/appendix,
		ORGAN_SLOT_GUTS = /obj/item/organ/guts,
	)

	customizers = list(
		/datum/customizer/organ/ears/oni,
		/datum/customizer/organ/eyes/humanoid,
		/datum/customizer/organ/horns/oni,
		/datum/customizer/bodypart_feature/hair/head/humanoid/kaizoku,
		/datum/customizer/bodypart_feature/hair/facial/humanoid,
		/datum/customizer/bodypart_feature/accessory,
		/datum/customizer/bodypart_feature/face_detail,
	)

	body_markings = list(
		/datum/body_marking/tonage,
	)



/datum/species/abyssariad/ogrun/check_roundstart_eligible()
	return TRUE

/datum/species/abyssariad/ogrun/get_skin_list()
	return sortList(list(
		"Defiant Oni" = SKIN_COLOR_DEFIANCE,
		"Sanguine Oni" = SKIN_COLOR_DEFIANCE_SANGUINE,
		"Stable Oni" = SKIN_COLOR_STABILITY,
		"Intellectual Oni" = SKIN_COLOR_STABILITY_INTELLECT,
		"Audacious Oni" = SKIN_COLOR_AUDACY,
		"Mysterious Oni" = SKIN_COLOR_AUDACY_MYSTERY,
		"Recently Purified" = SKIN_COLOR_BLANK_PURIFICATED,
	))

/datum/species/abyssariad/ogrun/get_hairc_list()
	return sortList(list(
	"black - oil" = "181a1d",
	"black - cave" = "201616",
	"black - rogue" = "2b201b",
	"black - midnight" = "1d1b2b",

	"brown - mud" = "362e25",
	"brown - oats" = "584a3b",
	"brown - grain" = "58433b",
	"brown - soil" = "48322a",

	"red - berry" = "48322a",
	"red - wine" = "82534c",
	"red - sunset" = "82462b",
	"red - blood" = "822b2b",

	"white - snow" = "dee9ed",
	"white - ice" = "f4f4f4",

	"blond - pale" = "9d8d6e",
	"blond - dirty" = "88754f",
	"blond - drywheat" = "8f8766",
	"blond - strawberry" = "977033",

	"white - platinum" = "f8f3f3",
	"white - silver" = "ddddc8",
	"white - oceanid" = "b8d4de"


	))

/datum/species/abyssariad/ogrun/get_span_language(datum/language/message_language)
	if(!message_language)
		return
//	if(message_language.type == /datum/language/abyssal)
//		return list(SPAN_ABYSSAL)
	return message_language.spans
/*	This using the older proc causes runtimes, if possible adapt to new below ROGTODO
/datum/species/abyssariad/ogrun/random_name(gender,unique,lastname)
	var/static/list/male_names = world.file2list('modular/stonekeep/kaizoku/strings/names/onim.txt')
	var/static/list/female_names = world.file2list('modular/stonekeep/kaizoku/strings/names/onif.txt')

	var/list/names = (gender == FEMALE) ? female_names : male_names
	var/randname

	if(unique)
		for(var/i in 1 to 10)
			randname = pick(names)
			if(!findname(randname))
				break
	else
		randname = pick(names)

	return "[randname] Clanless"

/datum/species/abyssariad/ogrun/random_surname()
	return " [pick(world.file2list('modular/stonekeep/kaizoku/strings/names/abyssnorm.txt'))]"
*/

/datum/species/abyssariad/ogrun/get_possible_names(gender = MALE)
	var/static/list/male_names = world.file2list('modular/stonekeep/kaizoku/strings/names/onim.txt')
	var/static/list/female_names = world.file2list('modular/stonekeep/kaizoku/strings/names/onif.txt')
	return (gender == FEMALE) ? female_names : male_names

/datum/species/abyssariad/ogrun/random_name(gender = MALE, unique = FALSE)
	var/list/possible_names = get_possible_names(gender)
	if(!possible_names || !length(possible_names))
		return "Nameless Clanless" //This is a fallback in case we get any pesky runtime.

	var/first_name
	if(!unique)
		first_name = pick(possible_names)
	else
		for(var/i in 1 to 10)
			first_name = pick(possible_names)
			if(!findname(first_name))
				break

	return "[first_name] Clanless"

/datum/species/abyssariad/ogrun/get_possible_surnames(gender = MALE)
	var/static/list/last_names = world.file2list('modular/stonekeep/kaizoku/strings/names/abyssnorlast.txt')
	return last_names
