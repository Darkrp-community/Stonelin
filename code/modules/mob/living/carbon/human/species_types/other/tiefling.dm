	/*==============*
	*				*
	*	Tiefling	*
	*				*
	*===============*/

/mob/living/carbon/human/species/tieberian
	race = /datum/species/tieberian

/datum/species/tieberian
	name = "Tiefling"
	id = SPEC_ID_TIEFLING
	desc = "Also known as Infernal-Spawn, Hell-Bloods. \
	\n\n\
	Tieflings, also known as Infernal-Spawn, are one of the younger peoples of Grimoria, \
	appearing during the time of the Apotheosis War. \
	Said to be the offspring of of mortals who served Zizo and mated with their Spawn in unholy union, \
	legions of them served as the chattel army under the banners of Zizo and Graggar. \
	\n\n\
	After their crushing defeat, Tieflings are said to have begged for mercy and were begrudgingly allowed to live, after abandoning their Lord. \
	Tieflings are less capable of creating offspring than most peoples, and only produce more tieflings due to their strong Zizo taint, so no half-breeds exist. \
	Most of them tend to be extremely perceptive and paranoid, as luck is rarely on their side \
	and their peculiar anatomy with somewhat fragile, crystalline bones makes them susceptible to injury."

	skin_tone_wording = "Progenitor"

	exotic_bloodtype = /datum/blood_type/human/tiefling

	species_traits = list(EYECOLOR, HAIR, FACEHAIR, LIPS, STUBBLE, OLDGREY)
	inherent_traits = list(TRAIT_NOMOBSWAP, TRAIT_NOFIRE)
	use_skintones = TRUE

	possible_ages = list(AGE_ADULT, AGE_MIDDLEAGED, AGE_OLD)

	changesource_flags = WABBAJACK

	limbs_icon_m = 'icons/roguetown/mob/bodies/m/mm.dmi'
	limbs_icon_f = 'icons/roguetown/mob/bodies/f/fm.dmi'

	offset_features_m = list(
		OFFSET_RING = list(0,0),\
		OFFSET_GLOVES = list(0,0),\
		OFFSET_WRISTS = list(0,0),\
		OFFSET_HANDS = list(0,0),\
		OFFSET_CLOAK = list(0,0),\
		OFFSET_FACEMASK = list(0,0),\
		OFFSET_HEAD = list(0,0),\
		OFFSET_FACE = list(0,0),\
		OFFSET_BELT = list(0,0),\
		OFFSET_BACK = list(0,0),\
		OFFSET_NECK = list(0,0),\
		OFFSET_MOUTH = list(0,0),\
		OFFSET_PANTS = list(0,0),\
		OFFSET_SHIRT = list(0,0),\
		OFFSET_ARMOR = list(0,0),\
		OFFSET_UNDIES = list(0,0),\
	)

	offset_features_f = list(
		OFFSET_RING = list(0,-1),\
		OFFSET_GLOVES = list(0,0),\
		OFFSET_WRISTS = list(0,0),\
		OFFSET_HANDS = list(0,0),\
		OFFSET_CLOAK_ = list(0,0),\
		OFFSET_FACEMASK = list(0,-1),\
		OFFSET_HEAD = list(0,-1),\
		OFFSET_FACE = list(0,-1),\
		OFFSET_BELT = list(0,-1),\
		OFFSET_BACK = list(0,-1),\
		OFFSET_NECK = list(0,-1),\
		OFFSET_MOUTH = list(0,-1),\
		OFFSET_PANTS = list(0,0),\
		OFFSET_SHIRT = list(0,0),\
		OFFSET_ARMOR = list(0,0),\
		OFFSET_UNDIES = list(0,0),\
	)

	specstats_m = list(STATKEY_STR = 0, STATKEY_PER = 2, STATKEY_INT = 1, STATKEY_CON = -1, STATKEY_END = 0, STATKEY_SPD = 1, STATKEY_LCK = -1)
	specstats_f = list(STATKEY_STR = 0, STATKEY_PER = 3, STATKEY_INT = 1, STATKEY_CON = -2, STATKEY_END = 0, STATKEY_SPD = 1, STATKEY_LCK = -1)
	enflamed_icon = "widefire"

	organs = list(
		ORGAN_SLOT_BRAIN = /obj/item/organ/brain,
		ORGAN_SLOT_HEART = /obj/item/organ/heart,
		ORGAN_SLOT_LUNGS = /obj/item/organ/lungs,
		ORGAN_SLOT_EYES = /obj/item/organ/eyes,
		ORGAN_SLOT_EARS = /obj/item/organ/ears,
		ORGAN_SLOT_TONGUE = /obj/item/organ/tongue,
		ORGAN_SLOT_LIVER = /obj/item/organ/liver,
		ORGAN_SLOT_STOMACH = /obj/item/organ/stomach,
		ORGAN_SLOT_APPENDIX = /obj/item/organ/appendix,
		ORGAN_SLOT_GUTS = /obj/item/organ/guts,
		ORGAN_SLOT_HORNS = /obj/item/organ/horns/tiefling,
		ORGAN_SLOT_TAIL = /obj/item/organ/tail/tiefling
	)

	bodypart_features = list(
		/datum/bodypart_feature/hair/head,
		/datum/bodypart_feature/hair/facial,
	)

	customizers = list(
		/datum/customizer/organ/ears/tiefling,
		/datum/customizer/organ/horns/tiefling,
		/datum/customizer/organ/tail/tiefling,
		/datum/customizer/organ/eyes/humanoid,
		/datum/customizer/bodypart_feature/hair/head/humanoid/pointy_ear_male, //SK EDIT
		/datum/customizer/bodypart_feature/hair/head/humanoid/pointy_ear_female, // SK EDIT
		/datum/customizer/bodypart_feature/hair/facial/humanoid,
		/datum/customizer/bodypart_feature/accessory,
		/datum/customizer/bodypart_feature/face_detail,
	)

	body_markings = list(
		/datum/body_marking/tonage,
	)

/datum/species/tieberian/check_roundstart_eligible()
	return TRUE

/datum/species/tieberian/on_species_gain(mob/living/carbon/C, datum/species/old_species)
	..()
	RegisterSignal(C, COMSIG_MOB_SAY, PROC_REF(handle_speech))
	C.grant_language(/datum/language/common)
	C.grant_language(/datum/language/hellspeak)

/datum/species/tieberian/after_creation(mob/living/carbon/C)
	. = ..()
	to_chat(C, "<span class='info'>I can speak Infernal with ,h before my speech.</span>")

/datum/species/tieberian/on_species_loss(mob/living/carbon/C)
	. = ..()
	UnregisterSignal(C, COMSIG_MOB_SAY)
	C.remove_language(/datum/language/hellspeak)

/datum/species/tieberian/qualifies_for_rank(rank, list/features)
	return TRUE

/datum/species/tieberian/get_skin_list()
	var/static/list/skin_colors = sortList(list(
		"Crimson Land" = SKIN_COLOR_CRIMSON_LAND, // - (Bright red)
		"Sun Stained" = SKIN_COLOR_SUNSTAINED, // - (Dark orange)
		"Sundered" = SKIN_COLOR_SUNDERED, //  - (Orange)
		"Zarkana" = SKIN_COLOR_ARCANA, // - (Dark violet)
		"Zarconum" = SKIN_COLOR_ZARCONUM, // - (Pink)
		"Castillian" = SKIN_COLOR_CASTILLIAN, // - (Pale red)
		"Asturias" = SKIN_COLOR_ASTURIAS, // - (Clay red)
		"Vaquero" = SKIN_COLOR_VAQUERO, // - (Earthly red)
		"Zanguine" = SKIN_COLOR_ZANGUINE, // - (Dark violet)
	))

	return skin_colors

/datum/species/tieberian/get_hairc_list()
	var/static/list/hair_colors = sortList(list(
		"black - oil" = "181a1d",
		"black - cave" = "201616",
		"black - rogue" = "2b201b",
		"black - midnight" = "1d1b2b",
		"black - hellbound" = "1e0909",

		"purple - arcane" = "312534",
		"purple - etheral" = "4a2d48",

		"blue - abyss" = "09282d",
		"blue - nightshade" = "0b1330",

		"red - demonic" = "480808",
		"red - impish" = "641010",
		"red - rubescent" = "8d4949"
	))

	return hair_colors

/datum/species/tieberian/get_possible_names(gender = MALE)
	var/static/list/male_names = world.file2list('strings/rt/names/other/tiefm.txt')
	var/static/list/female_names = world.file2list('strings/rt/names/other/tiefm.txt')
	return (gender == FEMALE) ? female_names : male_names

/datum/species/tieberian/get_possible_surnames(gender = MALE)
	var/static/list/last_names = world.file2list('strings/rt/names/other/tieflast.txt')
	return last_names

/datum/species/tieberian/get_accent_list()
	return strings("accents/spanish_replacement.json", "spanish")

/datum/species/tieberian/get_native_language()
	return "Infernal"
